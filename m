Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4D477029
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:48:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Nov 2015 07:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; 
	d="scan'208,217";a="843902184"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.157])
	([10.219.16.157])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2015 07:48:04 -0800
Message-ID: <563B7A38.6010200@linux.intel.com>
Date: Thu, 05 Nov 2015 09:48:08 -0600
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
	<563AB0D2.4000305@windriver.com>
	<CAJTo0LZAOCRdF0XPuOw0JDZ5J2L-FzbcXSOnERt8WcZ=pYLDpQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZAOCRdF0XPuOw0JDZ5J2L-FzbcXSOnERt8WcZ=pYLDpQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Delete WORKDIR/installed_pkgs.txt after use
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Nov 2015 15:48:31 -0000
Content-Type: multipart/alternative;
	boundary="------------070101030307020507020700"

--------------070101030307020507020700
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2015 02:56 AM, Burton, Ross wrote:
>
> On 5 November 2015 at 01:28, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The installed_pkgs.txt is very useful as a reference when we want
>     to know
>     which pkgs are installed, there is no other easy way to know.
>

You can also use  function image_list_installed_packages from oe.rootfs

Mariano

>
> There's a manifest in the deploy directory which has the advantage of 
> being correct.
>
> Ross

--------------070101030307020507020700
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 11/05/2015 02:56 AM, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0LZAOCRdF0XPuOw0JDZ5J2L-FzbcXSOnERt8WcZ=pYLDpQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 5 November 2015 at 01:28, Robert
            Yang <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:liezhi.yang@windriver.com" target="_blank">liezhi.yang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":30" class="a3s" style="overflow:hidden">The
                installed_pkgs.txt is very useful as a reference when we
                want to know<br>
                which pkgs are installed, there is no other easy way to
                know.</div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    You can also use  function image_list_installed_packages from
    oe.rootfs<br>
    <br>
    Mariano<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZAOCRdF0XPuOw0JDZ5J2L-FzbcXSOnERt8WcZ=pYLDpQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>There's a manifest in the deploy directory which has
              the advantage of being correct.</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------070101030307020507020700--
