Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47BB976104
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:36:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u22AaEIZ015544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Mar 2016 02:36:14 -0800 (PST)
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 2 Mar 2016 02:36:12 -0800
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
	<1456577083-19366-2-git-send-email-daniel.dragomir@windriver.com>
	<CAK18fxG3L6W942-Q6qQD+9o7QtWTq7yW+wp9iDgBGvAKyDEaKQ@mail.gmail.com>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56D6C202.5000008@windriver.com>
Date: Wed, 2 Mar 2016 12:35:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAK18fxG3L6W942-Q6qQD+9o7QtWTq7yW+wp9iDgBGvAKyDEaKQ@mail.gmail.com>
X-Originating-IP: [128.224.124.174]
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Wed, 02 Mar 2016 10:36:15 -0000
Content-Type: multipart/alternative;
	boundary="------------010901010509070000050707"

--------------010901010509070000050707
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 03/02/2016 02:17 AM, Andrei Gherzan wrote:
> Hi Daniel,
>
> On Sat, Feb 27, 2016 at 1:44 PM, Daniel Dragomir 
> <daniel.dragomir@windriver.com <mailto:daniel.dragomir@windriver.com>> 
> wrote:
>
>     This patch adds tunes for 32-bit armv8 platforms. The user can select
>     the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
>     and the Neon, crc and crypto extensions.
>
>     Also, fix some parsing failures for armv7a*-neon-vfpv4 tunes.
>
>     Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com
>     <mailto:daniel.dragomir@windriver.com>>
>     Signed-off-by: Cristian Bercaru <cristian.bercaru at windriver.com
>     <http://windriver.com>>
>     ---
>      meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
>      meta/conf/machine/include/arm/arch-armv8a.inc | 75
>     +++++++++++++++++++++++++++
>      2 files changed, 77 insertions(+), 2 deletions(-)
>      create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>
>     diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>     b/meta/conf/machine/include/arm/arch-armv7a.inc
>     index d3b6f64..ff6bc29 100644
>     --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>     +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>     @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v
>      PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16}
>     armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
>      PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
>      PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon
>     armv7at2hf-vfp-neon"
>     -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
>     -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
>     armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
>     +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-vfpv4-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
>     armv7ahf-vfp-vfpv4-neon armv7at2hf-vfp-neon-vfpv4"
>
>      # Big Endian
>      AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16
>     armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon
>     armv7atb-neon"
>     diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
>     b/meta/conf/machine/include/arm/arch-armv8a.inc
>     new file mode 100644
>     index 0000000..2d8dd73
>     --- /dev/null
>     +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>     @@ -0,0 +1,75 @@
>     +DEFAULTTUNE ?= "armv8a"
>     +
>     +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>     +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"
>     +
>     +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"
>
>
> Small typo here: instrucitons .

Thanks! Didn't noticed :)

>     +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crc",
>     "-crc", "", d)}"
>     +
>     +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
>     +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crypto",
>     "-crypto", "", d)}"
>     +
>     +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>     +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES",
>     "fp-armv8", "-fp-armv8", "", d)}"
>     +
>     +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv8a",
>     bb.utils.contains("TUNE_FEATURES", "crc", " -march=armv8-a+crc", "
>     -march=armv8-a", d), "", d)}"
>     +
>     +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8",
>     bb.utils.contains("TUNE_FEATURES", "neon",
>     bb.utils.contains("TUNE_FEATURES", "crypto", "
>     -mfpu=crypto-neon-fp-armv8", " -mfpu=neon-fp-armv8", d), "
>     -mfpu=fp-armv8", d), "", d)}"
>     +
>     +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES",
>     "armv8a", "armv8a:", "" ,d)}"
>     +
>     +require conf/machine/include/arm/arch-armv7a.inc
>     +
>     +# Little Endian base configs
>     +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4
>     armv8a-vfpv4-neon armv8a-fp-armv8 armv8a-fp-armv8-neon
>     armv8a-crypto-fp-armv8-neon"
>     +ARMPKGARCH_tune-armv8a ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-vfpv4-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?= "armv8a"
>     +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"
>     +TUNE_FEATURES_tune-armv8a-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a}
>     vfpv3"
>     +TUNE_FEATURES_tune-armv8a-neon ?= "${TUNE_FEATURES_tune-armv8a} neon"
>     +TUNE_FEATURES_tune-armv8a-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a}
>     vfpv4"
>     +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?=
>     "${TUNE_FEATURES_tune-armv8a} neon vfpv4"
>     +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=
>     "${TUNE_FEATURES_tune-armv8a} fp-armv8"
>     +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?=
>     "${TUNE_FEATURES_tune-armv8a} neon fp-armv8"
>     +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?=
>     "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv8a armv8a-vfp"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-vfpv4"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon
>     armv8a-vfp-vfpv4-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon
>     armv8a-fp-armv8-vfp-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon}
>     armv8a-crypto-fp-armv8-vfp-neon"
>     +
>     +# CRC configs
>     +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon
>     armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon armv8a-crc-fp-armv8
>     armv8a-crc-fp-armv8-neon armv8a-crc-crypto-fp-armv8-neon"
>     +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?= "armv8a"
>     +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?= "armv8a"
>     +TUNE_FEATURES_tune-armv8a-crc ?= "${TUNE_FEATURES_tune-armv8a} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=
>     "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-neon ?=
>     "${TUNE_FEATURES_tune-armv8a-neon} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=
>     "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?=
>     "${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=
>     "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?=
>     "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc"
>     +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?=
>     "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3
>     armv8a-crc-vfp-vfpv3"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-neon
>     armv8a-crc-vfp-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4
>     armv8a-crc-vfp-vfpv4"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon
>     armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon armv8a-crc-vfp-vfpv4-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8
>     armv8a-crc-fp-armv8-vfp"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon
>     armv8a-vfp-neon-fp-armv8 armv8a-crc-fp-armv8-vfp-neon"
>     +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon}
>     armv8a-vfp-crypto-neon-fp-armv8 armv8a-crc-crypto-fp-armv8-vfp-neon"
>
>
> Any plans for 64 bit version?
>
> Andrei
>

Yes, we have plans to add specific tunes for armv8 64bit too, but after 
we finish for 32bit.
For the moment, for 64bit, we simply include arch-armv8.inc witch only 
require arch-arm64.inc.

Regards,
Daniel


--------------010901010509070000050707
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Andrei,<br>
    <br>
    <div class="moz-cite-prefix">On 03/02/2016 02:17 AM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAK18fxG3L6W942-Q6qQD+9o7QtWTq7yW+wp9iDgBGvAKyDEaKQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">Hi Daniel,<br>
          <br>
          <div class="gmail_quote">On Sat, Feb 27, 2016 at 1:44 PM,
            Daniel Dragomir <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:daniel.dragomir@windriver.com"
                target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:daniel.dragomir@windriver.com">daniel.dragomir@windriver.com</a></a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">This
              patch adds tunes for 32-bit armv8 platforms. The user can
              select<br>
              the vector floating-point instruction set: vfpv3, vfpv4 or
              fp-armv8<br>
              and the Neon, crc and crypto extensions.<br>
              <br>
              Also, fix some parsing failures for armv7a*-neon-vfpv4
              tunes.<br>
              <br>
              Signed-off-by: Daniel Dragomir &lt;<a
                moz-do-not-send="true"
                href="mailto:daniel.dragomir@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:daniel.dragomir@windriver.com">daniel.dragomir@windriver.com</a></a>&gt;<br>
              Signed-off-by: Cristian Bercaru &lt;cristian.bercaru at <a
                moz-do-not-send="true" href="http://windriver.com"
                rel="noreferrer" target="_blank">windriver.com</a>&gt;<br>
              ---<br>
               meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-<br>
               meta/conf/machine/include/arm/arch-armv8a.inc | 75
              +++++++++++++++++++++++++++<br>
               2 files changed, 77 insertions(+), 2 deletions(-)<br>
               create mode 100644
              meta/conf/machine/include/arm/arch-armv8a.inc<br>
              <br>
              diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
              b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              index d3b6f64..ff6bc29 100644<br>
              --- a/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              +++ b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3
              = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v<br>
               PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16}
              armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"<br>
               PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"<br>
               PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon
              armv7at2hf-vfp-neon"<br>
              -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}
              armv7ahf-vfp-neon-vfpv4"<br>
              -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
              armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}
              armv7ahf-vfp-vfpv4-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
              armv7ahf-vfp-vfpv4-neon armv7at2hf-vfp-neon-vfpv4"<br>
              <br>
               # Big Endian<br>
               AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16
              armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
              armv7ab-neon armv7atb-neon"<br>
              diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
              b/meta/conf/machine/include/arm/arch-armv8a.inc<br>
              new file mode 100644<br>
              index 0000000..2d8dd73<br>
              --- /dev/null<br>
              +++ b/meta/conf/machine/include/arm/arch-armv8a.inc<br>
              @@ -0,0 +1,75 @@<br>
              +DEFAULTTUNE ?= "armv8a"<br>
              +<br>
              +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"<br>
              +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"<br>
              +<br>
              +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"<br>
            </blockquote>
            <div><br>
            </div>
            <div>Small typo here: instrucitons .</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks! Didn't noticed :)<br>
    <br>
    <blockquote
cite="mid:CAK18fxG3L6W942-Q6qQD+9o7QtWTq7yW+wp9iDgBGvAKyDEaKQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+ARMPKGSFX_FPU
              .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES", "crc", "-crc",
              "", d)}"<br>
              +<br>
              +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."<br>
              +ARMPKGSFX_FPU .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES",
              "crypto", "-crypto", "", d)}"<br>
              +<br>
              +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point
              unit."<br>
              +ARMPKGSFX_FPU .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES",
              "fp-armv8", "-fp-armv8", "", d)}"<br>
              +<br>
              +TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES",
              "armv8a", bb.utils.contains("TUNE_FEATURES", "crc", "
              -march=armv8-a+crc", " -march=armv8-a", d), "", d)}"<br>
              +<br>
              +TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES",
              "fp-armv8", bb.utils.contains("TUNE_FEATURES", "neon",
              bb.utils.contains("TUNE_FEATURES", "crypto", "
              -mfpu=crypto-neon-fp-armv8", " -mfpu=neon-fp-armv8", d), "
              -mfpu=fp-armv8", d), "", d)}"<br>
              +<br>
              +MACHINEOVERRIDES =.
              <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">"${@bb.utils.contains("</a>TUNE_FEATURES", "armv8a",
              "armv8a:", "" ,d)}"<br>
              +<br>
              +require conf/machine/include/arm/arch-armv7a.inc<br>
              +<br>
              +# Little Endian base configs<br>
              +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon
              armv8a-vfpv4 armv8a-vfpv4-neon armv8a-fp-armv8
              armv8a-fp-armv8-neon armv8a-crypto-fp-armv8-neon"<br>
              +ARMPKGARCH_tune-armv8a ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-vfpv4-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?= "armv8a"<br>
              +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"<br>
              +TUNE_FEATURES_tune-armv8a-vfpv3 ?=
              "${TUNE_FEATURES_tune-armv8a} vfpv3"<br>
              +TUNE_FEATURES_tune-armv8a-neon ?=
              "${TUNE_FEATURES_tune-armv8a} neon"<br>
              +TUNE_FEATURES_tune-armv8a-vfpv4 ?=
              "${TUNE_FEATURES_tune-armv8a} vfpv4"<br>
              +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?=
              "${TUNE_FEATURES_tune-armv8a} neon vfpv4"<br>
              +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=
              "${TUNE_FEATURES_tune-armv8a} fp-armv8"<br>
              +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?=
              "${TUNE_FEATURES_tune-armv8a} neon fp-armv8"<br>
              +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?=
              "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a =
              "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv8a armv8a-vfp"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3}
              armv8a-vfp-vfpv4"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon
              armv8a-vfp-vfpv4-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8}
              armv8a-vfp-neon armv8a-fp-armv8-vfp-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon}
              armv8a-crypto-fp-armv8-vfp-neon"<br>
              +<br>
              +# CRC configs<br>
              +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3
              armv8a-crc-neon armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon
              armv8a-crc-fp-armv8 armv8a-crc-fp-armv8-neon
              armv8a-crc-crypto-fp-armv8-neon"<br>
              +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?= "armv8a"<br>
              +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?=
              "armv8a"<br>
              +TUNE_FEATURES_tune-armv8a-crc ?=
              "${TUNE_FEATURES_tune-armv8a} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=
              "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-neon ?=
              "${TUNE_FEATURES_tune-armv8a-neon} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=
              "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?=
              "${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=
              "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?=
              "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc"<br>
              +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?=
              "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3
              armv8a-crc-vfp-vfpv3"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3}
              armv8a-vfp-neon armv8a-crc-vfp-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3}
              armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4}
              armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon
              armv8a-crc-vfp-vfpv4-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}
              armv8a-vfp-fp-armv8 armv8a-crc-fp-armv8-vfp"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon =
              "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8}
              armv8a-vfp-neon armv8a-vfp-neon-fp-armv8
              armv8a-crc-fp-armv8-vfp-neon"<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon
              = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon}
              armv8a-vfp-crypto-neon-fp-armv8
              armv8a-crc-crypto-fp-armv8-vfp-neon"<br>
              <span class=""><font color="#888888"><br>
                </font></span></blockquote>
            <div><br>
            </div>
            <div>Any plans for 64 bit version?</div>
            <div><br>
            </div>
            <div>Andrei </div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, we have plans to add specific tunes for armv8 64bit too, but
    after we finish for 32bit.<br>
    For the moment, for 64bit, we simply include arch-armv8.inc witch
    only require arch-arm64.inc.<br>
    <br>
    Regards,<br>
    Daniel<br>
    <br>
  </body>
</html>

--------------010901010509070000050707--
