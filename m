Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SxDrC-0001Rr-8Q
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 11:07:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2012 01:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; 
	d="scan'208,217";a="175129908"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2012 01:56:00 -0700
Message-ID: <501B928D.7060003@intel.com>
Date: Fri, 03 Aug 2012 11:57:49 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <501B8F3A.8000309@intel.com>
	<CAK18fxFeUezS1VEfN+z24_0NYn7nn+w3p=HyDQ_EigJ8qForgw@mail.gmail.com>
In-Reply-To: <CAK18fxFeUezS1VEfN+z24_0NYn7nn+w3p=HyDQ_EigJ8qForgw@mail.gmail.com>
Subject: Re: while trying to update u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 09:07:42 -0000
Content-Type: multipart/alternative;
	boundary="------------090107090609020202090208"

--------------090107090609020202090208
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, my bad, I was trying to build u-boot-fw-utils and assumed wrongly 
that the recipe requires u-boot.inc

Radu

On 08/03/2012 11:45 AM, Andrei Gherzan wrote:
> On Fri, Aug 3, 2012 at 11:43 AM, Radu Moisan <radu.moisan@intel.com 
> <mailto:radu.moisan@intel.com>> wrote:
>
>     I found the following code in u-boot.inc
>
>     if not d.getVar("UBOOT_MACHINE", True):
>         PN = d.getVar("PN", True)
>         FILE = os.path.basename(d.getVar("FILE", True))
>         bb.debug(1, "To build %s, see %s for instructions on \
>                         setting up your machine config" % (PN, FILE))
>         raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
>
>     and while I don't have UBOOT_MACHINE set, u-boot still follows
>     with no problems through do_fetch, do_configure, do_compile and so
>     on, and finishes without any problem/error. I would have expected
>     to be skipped as the above code snipped would imply, but I cannot
>     find that log message anywhere (nor any error to indicate
>     failure). Can somebody point me in the right direction with this?
>
> Are you sure that variable is not set somewhere? Gave it a try on a 
> machine with no u-boot defined:
>
> ERROR: Nothing PROVIDES 'u-boot'
> ERROR: u-boot was skipped: because UBOOT_MACHINE is not set
> ERROR: u-boot was skipped: because UBOOT_MACHINE is not set
> ERROR: u-boot was skipped: because UBOOT_MACHINE is not set
>
> ag
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------090107090609020202090208
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Sorry, my bad, I was trying to build u-boot-fw-utils and assumed
    wrongly that the recipe requires u-boot.inc<br>
    <br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 08/03/2012 11:45 AM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAK18fxFeUezS1VEfN+z24_0NYn7nn+w3p=HyDQ_EigJ8qForgw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div class="gmail_quote">On Fri, Aug 3, 2012 at 11:43 AM, Radu
        Moisan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div bgcolor="#FFFFFF" text="#000000"> I found the following
            code in u-boot.inc<br>
            <br>
            <small><font face="Droid Sans Mono">if not
                d.getVar("UBOOT_MACHINE", True):<br>
                &nbsp;&nbsp;&nbsp; PN = d.getVar("PN", True)<br>
                &nbsp;&nbsp;&nbsp; FILE = os.path.basename(d.getVar("FILE", True))<br>
                &nbsp;&nbsp;&nbsp; bb.debug(1, "To build %s, see %s for instructions on
                \<br>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; setting up your machine config" %
                (PN, FILE))<br>
                &nbsp;&nbsp;&nbsp; raise bb.parse.SkipPackage("because UBOOT_MACHINE is
                not set")</font></small><br>
            <br>
            and while I don't have UBOOT_MACHINE set, u-boot still
            follows with no problems through do_fetch, do_configure,
            do_compile and so on, and finishes without any
            problem/error. I would have expected to be skipped as the
            above code snipped would imply, but I cannot find that log
            message anywhere (nor any error to indicate failure). Can
            somebody point me in the right direction with this?<span
              class="HOEnZb"><font color="#888888"><br>
              </font></span></div>
          <div bgcolor="#FFFFFF" text="#000000"><br>
          </div>
        </blockquote>
        <div>&nbsp;</div>
        <div>Are you sure that variable is not set somewhere? Gave it a
          try on a machine with no u-boot defined:</div>
        <div><br>
        </div>
        <div>
          <div>ERROR: Nothing PROVIDES 'u-boot'</div>
          <div>ERROR: u-boot was skipped: because UBOOT_MACHINE is not
            set</div>
          <div>ERROR: u-boot was skipped: because UBOOT_MACHINE is not
            set</div>
          <div>ERROR: u-boot was skipped: because UBOOT_MACHINE is not
            set</div>
        </div>
      </div>
      <br>
      <div>ag</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090107090609020202090208--
