Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 448706FFF7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 02:17:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB42HCgL021195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 3 Dec 2015 18:17:12 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 3 Dec 2015 18:17:11 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1449123744.git.kai.kang@windriver.com>
	<acbe0c86991efd2efd47b5863d5207c92bb90b70.1449123744.git.kai.kang@windriver.com>
	<CAJTo0Lb0qXpx0RL23XCfrh3JV_pDnDrENWyoyoehQTX6uNhqoA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5660F7A6.8070102@windriver.com>
Date: Fri, 4 Dec 2015 10:17:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb0qXpx0RL23XCfrh3JV_pDnDrENWyoyoehQTX6uNhqoA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] packagegroup-core-tools-testapps: disable kexec for mips64 and mis64n32
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
X-List-Received-Date: Fri, 04 Dec 2015 02:17:16 -0000
Content-Type: multipart/alternative;
	boundary="------------070206020607000309030401"

--------------070206020607000309030401
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年12月03日 22:13, Burton, Ross wrote:
>
> On 3 December 2015 at 06:32, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     @@ -15,6 +15,8 @@ inherit packagegroup
>      KEXECTOOLS ?= "kexec"
>      KEXECTOOLS_mips ?= ""
>      KEXECTOOLS_mipsel ?= ""
>     +KEXECTOOLS_mips64 ?= ""
>     +KEXECTOOLS_mips64n32 ?= ""
>      KEXECTOOLS_powerpc ?= ""
>      KEXECTOOLS_e5500-64b ?= ""
>      KEXECTOOLS_aarch64 ?= ""
>
>
> I've rebased this on top of Maxin's patch that removed many of these 
> exclusions (mips, mipsel, powerpc, aarch64), but could you confirm 
> that is the right thing to do?

Hi Ross,

I didn't find Maxin's patch on oe-core list. I double check with our bsp 
guy that kexec supports mips now but may need extra drivers  for each board.

So please ignore this patch.

Thanks,
Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------070206020607000309030401
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年12月03日 22:13, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb0qXpx0RL23XCfrh3JV_pDnDrENWyoyoehQTX6uNhqoA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 3 December 2015 at 06:32, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":6pz" class="a3s" style="overflow:hidden">@@
                -15,6 +15,8 @@ inherit packagegroup<br>
                 KEXECTOOLS ?= "<span class="il">kexec</span>"<br>
                 KEXECTOOLS_mips ?= ""<br>
                 KEXECTOOLS_mipsel ?= ""<br>
                +KEXECTOOLS_mips64 ?= ""<br>
                +KEXECTOOLS_mips64n32 ?= ""<br>
                 KEXECTOOLS_powerpc ?= ""<br>
                 KEXECTOOLS_e5500-64b ?= ""<br>
                 KEXECTOOLS_aarch64 ?= ""</div>
            </blockquote>
          </div>
          <br>
          I've rebased this on top of Maxin's patch that removed many of
          these exclusions (mips, mipsel, powerpc, aarch64), but could
          you confirm that is the right thing to do?</div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    I didn't find Maxin's patch on oe-core list. I double check with our
    bsp guy that kexec supports mips now but may need extra drivers  for
    each board.<br>
    <br>
    So please ignore this patch.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0Lb0qXpx0RL23XCfrh3JV_pDnDrENWyoyoehQTX6uNhqoA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------070206020607000309030401--
