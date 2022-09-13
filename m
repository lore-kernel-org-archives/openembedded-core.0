Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D320DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 09:58:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.2983.1663063092279968514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9OQ4yJO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id cc5so10065972wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=nSwFYl+O2LZI1Jp/wJd7S4wmlb2fHfhv+qcRjoGUfWI=;
        b=K9OQ4yJO+TlHkeFgmgwkLlZ5Sk3U4yDnPGFGcm6/BM5lItpFXD5uu8LFRTlIMcVniX
         jSWad6R7udVnWkJEkMvaOJcVHgl+UL8rfXDoYgqDmhDsfukH8GBrBg9Yx2jSfxpn82e7
         i0xxKCqW182fuub7weVF02TlgZd4FqrQj9Dt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=nSwFYl+O2LZI1Jp/wJd7S4wmlb2fHfhv+qcRjoGUfWI=;
        b=s17KF7x/Q7beCYfvA1A8JETiUOj48lDCf0hrB0zSRn+l8BbytuKxPCmv3kQIM/Sqf0
         pmrr21MmtzZTdhzo1QfioBls1LTa3cNI0G5xlKK3k4uKN4d1TPjlPpDMA/Hnh2HAWglJ
         GihGs6ouP8ljrCZspPRs4La9lOBBlqTvUyZNm6YAlgSAaAxuztczJN4hF9eW1qFB7Pjy
         LsZ1m8N0EvxmULRXGhpNJrZaD7TukiipqOsYpur1arnV7+mZYPwr9+sSglYWehM9gN2B
         4mGLTEZoYrhCsDptDR5VfGfpVkWUrxfkqc2owberRoEvs984UdrC4CvNZswxdZOJfL5o
         6Dwg==
X-Gm-Message-State: ACgBeo3RmmfAKgyZl+3pfOUE6W57MGz7lLrOtRKZ2rlgC7Dne+vYf40h
	an0T9p9t5aTwmqWTDDgmtgLSmw==
X-Google-Smtp-Source: 
 AA6agR6HuAzuGZkSt0/uW4o55At7GJopESDzvkhaVEVQpv5F4IzZ6YnOul7ts8/wYBIOF7YaOlm/3Q==
X-Received: by 2002:a5d:6050:0:b0:228:6128:b0fb with SMTP id
 j16-20020a5d6050000000b002286128b0fbmr17060343wrt.424.1663063090422;
        Tue, 13 Sep 2022 02:58:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b740:75b6:5b77:5982?
 ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 q3-20020a05600000c300b00228d6edade0sm9934019wrx.46.2022.09.13.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:58:09 -0700 (PDT)
Message-ID: 
 <e220d9fadbb7716ce422dd031130a1dd58b41386.camel@linuxfoundation.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Sep 2022
 04:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Date: Tue, 13 Sep 2022 10:58:09 +0100
In-Reply-To: <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
References: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
	 <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 09:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170565

On Mon, 2022-09-12 at 18:45 -0700, Khem Raj wrote:
> On 9/11/22 7:02 AM, Steve Sakoman wrote:
> > Branch: master
> >=20
> > New this week: 10 CVEs
> > CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35538 *
> > CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1354 *
> > CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1355 *
> > CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2022-3099 *
> > CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2022-3134 *
> > CVE-2022-38126 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:b=
inutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2022-38126 *
> > CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:b=
inutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2022-38127 *
> > CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:b=
inutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2022-38128 *
> > CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-39028 *
> > CVE-2022-39046 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2022-39046 *
> >=20
> > Removed this week: 4 CVEs
> > CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3929 *
> > CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-2953 *
> > CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-32893 *
> > CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:b=
inutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2022-38533 *
> >=20
> > Full list:  Found 15 unpatched CVEs
> > CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35538 *
>=20
> We are at 2.1.4 in master and this was fixed in 2.0.6 via=20
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9120a247436e84c0b4e=
ea828cb11e8f665fcde30=20
> so I wonder why its being flagged.

The CVE entry says 2.0.5 onwards. I've emailed them to suggest it apply
to 2.0.5 only as 2.0.6 is fixed.

> > CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2021-3521 *
> > CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2021-35937 *
> > CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2021-35938 *
> > CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2021-35939 *
> > CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4158 *
> > CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1354 *
> > CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1355 *
>=20
> there is a patch on ml for this.

The version restrictions on those are also wrong. I've sent email to
correct them.

Cheers,

Richard

