Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149.1792511432665137947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=aBxcDauO;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso40263595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792511431; x=1793116231; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etF9/CNzT1htqsbaLTNI1pokSUEpkLkljNtwh8yfEZI=;
        b=aBxcDauO1MXt+mZtNFvtRgT0jxn99yAAmbmfW7UtzrKnCkRmAoCbPIa2g10b4d+dZx
         zBSzsWMKfJXb3d69ivIfZCBhd4e+CK/Grj4JIhg4QyWxRI6SMe4FjNzxju8TjaJESXoR
         dJFW7+V2s02Ml3+br/FuYb8/nM+eC5dJw/0MYqdLQySVn/Ra/Yuq+UUvM0JPvP/MBHhE
         1vMFiYyPFX0ZU289LbI1Oz/NvTWD9yi1I9VNSVKyK1lILyveDrE8/131aNv8CN9uUVvW
         GMT6jdk0RIhvqPfcT6DcyMeXcWux5ZLtSroxQsmt2lF6xgo/OYdPkbWmdL2gWDFivJ11
         IRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511431; x=1793116231;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etF9/CNzT1htqsbaLTNI1pokSUEpkLkljNtwh8yfEZI=;
        b=pRVtwjgaXtReh0hswNehHIauiknX4nT4N+bbPSg1i2vqPkUUkY0/0/ORi96kihfRvE
         esgXV2xJLmEpnU5/niTNr0gd+Zvs89DzlCiPPPnFgm0cs4WcfYgeLunBkmS9bXpLhwnl
         Od0h154GDiJ+KaJfMGHzvKqVl/+L+Vck9ClKqmLQybagRd5hk/VEao3rYGJCUbKQmTaV
         ALCb0buuuSHImpdTLUTtURi1Xhw6vbVwRq5cFI4JBSKg0FFfOu260L8XTRptYymgh56R
         oLbsTpdok9hV3KO4DyKuKTkRnQRa0Lu9TXNhrSATwlNcrdmcqkkRKdkaHTMeNnv47j2B
         eE6g==
X-Forwarded-Encrypted: i=1; AKwUvBwNfWwRsPwrQtHTRgXe2cwVhatsxpz9tVFvBNiTNcQc7kB5Fn9uoybGtUT/PPZTVjEKN0nvy1mWcp+AacDjOxL6SQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK1dCD26mGnBsBSfzfYYENrNOgj0abCNzlxIdJ7nSqUnpQH0hCY
	Qw+1Xjocji+vVP6fcYsYBYPZsPLx7qT1LCf0Ss52v4InFOMqBZB7B72tvs0G8EBykhM=
X-Gm-Gg: AYBFou2FPo92XSh+x5CuezE1SZjNQPgRCxKgH8TXkFeLW2r3TaK/rAm/hszXrDT57N1
	gYigplFqJhnTBQvGneT/9h8S52017HVSnGq+P3zCRxx6eXfl42lbHEE9dNjCohosZQKAQSrBdmp
	aVBFoXP+7kbDPl32uSozIFqhG//QwXIf+Xm1pVVO2HAlzAkoJ+xqvn+sV9hBmtxQMLGZ7EhflQ3
	/ymm/VSIrBe6A26NX26pv8JSoEkRbHD7hSWHcM6xihZM5hUhHPm3hK8AH3khYGJmxF+K6veKTcT
	+59YhCQ7a8BrwUA5dUmNGLPjG3E7+B0VIFOHzPvCkjDL11+PwC5hB9S4jzYoh5i4I/lgtc9ejEQ
	7pRDJDgZIZkVm8TgXwMu8xx4FcmjXKbnsCjAyRlwhz3evNnr+RmbJ1L2zpJ5XonG90KfOBVioF6
	LMtlkBMlJYvtlu+sJaZpttBfb7899DoOrBD5Q/cqlWlehQEWsMHqbrHqw7P6ZJz0fQJwiUHYkIR
	f2CjvmFmwn84AcfebX1M5Xlt1XryxIfWoZ1ocetoVXmFpxRv2ZDrFAXuRYojB0sW6LjVQ==
X-Received: by 2002:a05:600c:3507:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a1d75f94cfmr247489145e9.14.1792511430290;
        Tue, 20 Oct 2026 08:50:30 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fab0b9dcsm9645925e9.2.2026.10.20.08.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:50:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 17:50:29 +0200
Message-Id: <DM9S9QJC41I5.HBYN1E0X32YB@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Joshua Watt"
 <JPEWhacker@gmail.com>, "Daniel Turull" <daniel.turull@ericsson.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 =?utf-8?b?S0FaVVlPU0hJIEFLSVlBTUEgKOeni+WxsSDlkozmhbYp?=
 <kazuyoshi_akiyama@jp.honda>, "Benjamin Robin"
 <benjamin.robin@bootlin.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
 <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr> <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
 <TYYP301MB11583CEAF49F1D6ABB33F54EEB8D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM> <DLSRMLU0EYKQ.3KSUL5VCXXX11@smile.fr>
In-Reply-To: <DLSRMLU0EYKQ.3KSUL5VCXXX11@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248306

On Wed Sep 30, 2026 at 5:44 PM CEST, Yoann Congal wrote:
> Hello,
>
> @Joshua (and other SPDX/SBOM interested parties):
> As our "SPDX/SBOM guy", I would love to have your input on this thread.
> FYI, We (Paul or I) plan to raise this at the next tech call.

I did. The consensus (RP, Joshua) was the "sources/" prefix is a
divergence from usual design where source paths do not have this
prefix. So, in this way, this series should be considered a bug fix.

No one in the call opposed this path change.

Daniel noted that the script filtering kernel CVEs based on compiled
sources may need an update:
scripts/contrib/improve_kernel_cve_report.py

=3D> I will reconsider this series for the next wrynose cycle (In 2-3
weeks).

>>> -----Original Message-----
>>> From: Benjamin Robin <benjamin.robin@bootlin.com>=20
>>> Sent: Monday, September 28, 2026 5:57 PM
>>> To: KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=B1 =E5=92=8C=E6=85=B6) <kazuyosh=
i_akiyama@jp.honda>; openembedded-core@lists.openembedded.org; Yoann Congal=
 <yoann.congal@smile.fr>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Mathieu Dubois=
-Briand <mathieu.dubois-briand@bootlin.com>
>>> Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sourc=
es filter
>>>
>>> On Saturday, September 26, 2026 at 11:19=E2=80=AFAM, Yoann Congal wrote=
:
>>>> On Thu Sep 17, 2026 at 6:24 AM CEST, KAZUYOSHI AKIYAMA via lists.opene=
mbedded.org wrote:
>>>> > SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files=20
>>>> > down to only the ones that were compiled before adding them to the=
=20
>>>> > SBOM, but on wrynose it doesn't work.
>>>> > add_package_files() is what picks which files go into the SBOM.
>>>> > It walks ${SPDXWORK} itself to get file paths, then keeps only the=
=20
>>>> > ones that match the list of compiled sources returned by=20
>>>> > get_compiled_sources().
>>>> > get_compiled_sources() just returns what save_debugsources_info()=20
>>>> > stored, and that data uses paths rooted at ${TARGET_DBGSRC_DIR} (=3D=
=20
>>>> > /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
>>>> > add_package_files() compares against.
>>>> > So the list get_compiled_sources() returns never matches what=20
>>>> > add_package_files() is comparing, and almost every file ends up=20
>>>> > marked as not compiled.
>>>> > This happens for every recipe except the kernel, which has its own=
=20
>>>> > special-cased path.
>>>> >
>>>> > This isn't just a matter of the SBOM missing the right files.
>>>> > sbom-cve-check uses the same match result to decide whether a=20
>>>> > vulnerable file was actually built, for its vulnerability triage.
>>>> > If the match count is always zero, that triage doesn't work either.
>>>> > On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.
>>>> >
>>>> > master already has this fixed,
>>>> > and this backport brings that fix to wrynose.
>>>> > b567c2f0d9 is the commit that fixes it.
>>>> > Everything else in the series is a prerequisite for that patch.
>>>> > Backporting b567c2f0d9 along with its prerequisites brings wrynose's=
=20
>>>> > behavior in line with master.
>>>> > With this, compiled sources get counted correctly, and=20
>>>> > sbom-cve-check's triage works correctly too.
>>>> >
>>>> > On wrynose (genericx86-64, core-image-full-cmdline), the match rate=
=20
>>>> > goes from effectively zero to 93.9%.
>>>> >
>>>> > One thing changes.
>>>> > What the SBOM records as a source file name changes too.
>>>> > aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR, so a=20
>>>> > recorded source file name changes (e.g. sources/acl-2.3.2/...=20
>>>> > becomes acl-2.3.2/...).
>>>> > This is a change to SBOM metadata only.
>>>> > The actual build output is unaffected.
>>>> > Anyone diffing SBOMs across LTS point releases will see it.
>>>>=20
>>>> Hello,
>>>>=20
>>>> Thanks for the series, this sounds like a worthy fix.
>>>> But, this SBOM change is a bit more intrusive than I'm confortable=20
>>>> with... This will create a lot of noise for users that precisely track=
=20
>>>> their SBOMs.
>>>
>>> Hello Yoann,
>>>
>>>> Can we do the fix without this change?
>>>
>>> Technically, we could do it. But it wouldn't be exactly the same series=
, which I don't really like, and the code will diverge.
>>> For information I could develop a solution after ELCE capable of genera=
ting a similar SBOM if Kazuyoshi doesn't feel comfortable doing it.
>>> --
>>> Benjamin Robin, Bootlin
>>> Embedded Linux and Kernel engineering
>
> On Mon Sep 28, 2026 at 11:39 AM CEST, KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=
=B1 =E5=92=8C=E6=85=B6) wrote:
>> Thank you for your comments, Yoann and Benjamin.
>>
>> I agree with Benjamin.
>> This series does introduce a visible change that the source path in
>> SPDX will be changed from `sources/XXX/YYY.c` to `XXX/YYY.c`.
>> However, the design change of the patch 0002 is reasonable, and I
>> believe it is better to avoid code divergence whenever possible.
>> The impact of this change is very small.
> Do you have anything to support this affirmation?
> I can imagine users having quite strict processes around SBOMs that
> could be disrupted by a change like this (e.g. diff'ing SBOMs across
> versions).
>
>> I could write a patch to preserve the `sources/` prefix, but even
>> then, wrynose users would still need to adapt to this change in the
>> next LTS release.
>> Furthermore, if I write such a patch, the path change would occur
>> silently in the next LTS release, without sufficient context to
>> document it properly in the release notes.
> Breaking changes like this when changing release is expected and not a
> problem at all.
>
> Regards,
--=20
Yoann Congal
Smile ECS

