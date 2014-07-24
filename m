Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC63C6FE76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:48:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6O1mb9W019983
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jul 2014 18:48:38 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 23 Jul 2014 18:48:37 -0700
Message-ID: <53D065F1.6040909@windriver.com>
Date: Thu, 24 Jul 2014 09:48:33 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
	<CAPbeDCmQTX87xPSrfRxZP_96uH-Jg5uFTDv0iC-jV0n+6_znFA@mail.gmail.com>
In-Reply-To: <CAPbeDCmQTX87xPSrfRxZP_96uH-Jg5uFTDv0iC-jV0n+6_znFA@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] perf: split package
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
X-List-Received-Date: Thu, 24 Jul 2014 01:48:43 -0000
Content-Type: multipart/alternative;
	boundary="------------030800070907010909010504"

--------------030800070907010909010504
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/24/2014 01:34 AM, Jacob Kroon wrote:
> On Mon, Jul 21, 2014 at 4:03 AM, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     Currently, perf can't split to perf-archive, perf-tests,
>     perf-python and
>     perf-perl. All files are included in perf package.
>     Change the files paths to make split successfully and add perf package
>     RDEPEND on the other four to keep it consistent.
>
>     Signed-off-by: Chong Lu <Chong.Lu@windriver.com
>     <mailto:Chong.Lu@windriver.com>>
>     ---
>      meta/recipes-kernel/perf/perf.bb <http://perf.bb> | 9 +++++----
>      1 file changed, 5 insertions(+), 4 deletions(-)
>
>     diff --git a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     index 20968f9..9f9741e 100644
>     --- a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     +++ b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     @@ -157,6 +157,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>      PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>
>      RDEPENDS_${PN} += "elfutils"
>     +RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
>
>
> Is this correct ? First RDEPENDS is appended "elfutils", won't this 
> make it pointless to add a default value in the line below ?
Please ignore this patch, I just test in kernel 3.14, but maybe it 
depend on kernel version.

Thanks
Chong

--------------030800070907010909010504
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 07/24/2014 01:34 AM, Jacob Kroon
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAPbeDCmQTX87xPSrfRxZP_96uH-Jg5uFTDv0iC-jV0n+6_znFA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Mon, Jul 21, 2014 at 4:03 AM,
            Chong Lu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Chong.Lu@windriver.com" target="_blank">Chong.Lu@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently,
              perf can't split to perf-archive, perf-tests, perf-python
              and<br>
              perf-perl. All files are included in perf package.<br>
              Change the files paths to make split successfully and add
              perf package<br>
              RDEPEND on the other four to keep it consistent.<br>
              <br>
              Signed-off-by: Chong Lu &lt;<a moz-do-not-send="true"
                href="mailto:Chong.Lu@windriver.com">Chong.Lu@windriver.com</a>&gt;<br>
              ---<br>
               meta/recipes-kernel/perf/<a moz-do-not-send="true"
                href="http://perf.bb" target="_blank">perf.bb</a> | 9
              +++++----<br>
               1 file changed, 5 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-kernel/perf/<a
                moz-do-not-send="true" href="http://perf.bb"
                target="_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a
                moz-do-not-send="true" href="http://perf.bb"
                target="_blank">perf.bb</a><br>
              index 20968f9..9f9741e 100644<br>
              --- a/meta/recipes-kernel/perf/<a moz-do-not-send="true"
                href="http://perf.bb" target="_blank">perf.bb</a><br>
              +++ b/meta/recipes-kernel/perf/<a moz-do-not-send="true"
                href="http://perf.bb" target="_blank">perf.bb</a><br>
              @@ -157,6 +157,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"<br>
               PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl
              ${PN}-python"<br>
              <br>
               RDEPENDS_${PN} += "elfutils"<br>
              +RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python
              ${PN}-perl"<br>
            </blockquote>
            <div><br>
            </div>
          </div>
          Is this correct ? First RDEPENDS is appended "elfutils", won't
          this make it pointless to add a default value in the line
          below ?<br>
        </div>
      </div>
    </blockquote>
    Please ignore this patch, I just test in kernel 3.14, but maybe it
    depend on kernel version.<br>
    <br>
    Thanks<br>
    Chong<br>
  </body>
</html>

--------------030800070907010909010504--
