Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBAA766F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 20:02:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2015 13:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,604,1437462000"; 
	d="scan'208,217";a="799093550"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.50])
	([10.219.16.50])
	by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2015 13:02:27 -0700
Message-ID: <56099CD1.1090909@linux.intel.com>
Date: Mon, 28 Sep 2015 15:02:25 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1443162720.git.mariano.lopez@linux.intel.com>
	<62b26729361a797eff29928054777d7a5aebdead.1443162720.git.mariano.lopez@linux.intel.com>
	<CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com>
In-Reply-To: <CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemurunner: Sanitize output from qemu and qemu pid
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
X-List-Received-Date: Mon, 28 Sep 2015 20:02:50 -0000
Content-Type: multipart/alternative;
	boundary="------------030900010002080102000108"

--------------030900010002080102000108
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/28/2015 09:42 AM, Burton, Ross wrote:
> On 25 September 2015 at 07:33, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>      def log(self, msg):
>              if self.logfile:
>     +            # It is needed to sanitize the data received from qemu
>     +            # because is possible to have control characters or
>     Unicode
>     +            msg = cmdline = "".join(filter(lambda x:x in
>     string.printable, msg))
>                  with open(self.logfile, "a") as f:
>                      f.write("%s" % msg)
>
>
> cmdline looks like a copy/paste typo?

Yes it is a copy/paste typo, I'll send a v2

>
> Would it be sensible in the future to support UTF-8 for the logging?

Yes, it would be possible to use UTF-8, but the main reason to use 
printable is not Unicode characters, it is the NULL character that 
sometimes appear in the qemu output and always appear in the command 
used to run qemu. Actually, the only non ASCII character that appears is 
the copyright symbol.

>
> Ross

-- 
Mariano Lopez

--------------030900010002080102000108
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 09/28/2015 09:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">On 25 September 2015 at 07:33, <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:mariano.lopez@linux.intel.com"
              target="_blank">mariano.lopez@linux.intel.com</a>&gt;</span>
          wrote:<br>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":6ny" class="a3s" style="overflow:hidden">   
                 def log(self, msg):<br>
                         if self.logfile:<br>
                +            # It is needed to sanitize the data
                received from qemu<br>
                +            # because is possible to have control
                characters or Unicode<br>
                +            msg = cmdline = "".join(filter(lambda x:x
                in string.printable, msg))<br>
                             with open(self.logfile, "a") as f:<br>
                                 f.write("%s" % msg)</div>
            </blockquote>
          </div>
          <br>
          cmdline looks like a copy/paste typo?</div>
      </div>
    </blockquote>
    <br>
    Yes it is a copy/paste typo, I'll send a v2<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Would it be sensible in the future to
          support UTF-8 for the logging?</div>
      </div>
    </blockquote>
    <br>
    Yes, it would be possible to use UTF-8, but the main reason to use
    printable is not Unicode characters, it is the NULL character that
    sometimes appear in the qemu output and always appear in the command
    used to run qemu. Actually, the only non ASCII character that
    appears is the copyright symbol.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      Mariano Lopez</div>
  </body>
</html>

--------------030900010002080102000108--
