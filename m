Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id F3848605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:32:57 +0000 (UTC)
Received: by widjs5 with SMTP id js5so112009453wid.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 06:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=hGMLkmxDiBoOK6XZOPdDaniZ9RX6MJdOrbtXhqi4fSI=;
	b=kCY3gi17KISKBGDsycmCDUvnF0eYojkglV7QFBCuphOERTR0pBj+r6jEplIPxXK/1S
	qfZJ68sYc29/fVgsNE2Bx9YfBv/IOq9oIbO1gErrSExvLwos/JON6DYhh2tr/Drv0QNd
	Mhhr8XB/enhUwjQpxtw+pgryfuhF/zxfd6J5d2LoMVhJT05cBBCUvhwz1wv6akssNMkx
	oZy0RqrvlqzmzqAbb9yUlLHEU4MapakQAArcOMhIj7Ota7edevN5C9zkkBjBEvbqHINz
	Di3xyKoOd81JzgmrRnLk/yihXy7yZunHXMr67MT0p8DW7dExhhwAOWyJXl8Rp+AOQ1cx
	oqZw==
X-Gm-Message-State: ALoCoQnU2kFYjpPek/14pv8ocgn2/TPg6Cm7wJaU4NYLFRRgv9/BOMFYmDqxLJnKTB1hjtSviFW7
X-Received: by 10.180.98.230 with SMTP id el6mr42177065wib.16.1429104778114;
	Wed, 15 Apr 2015 06:32:58 -0700 (PDT)
Received: from ?IPv6:2001:610:612::911a:4a67:7830:bfb5?
	([2001:610:612:0:911a:4a67:7830:bfb5])
	by mx.google.com with ESMTPSA id
	cf12sm6039261wjb.10.2015.04.15.06.32.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 Apr 2015 06:32:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1429104564.6976.115.camel@linuxfoundation.org>
Date: Wed, 15 Apr 2015 15:32:55 +0200
Message-Id: <6A30645B-9ABE-4498-AF6C-4E432984ED95@dominion.thruhere.net>
References: <1429101157-12319-1-git-send-email-koen.kooi@linaro.org>
	<1429104564.6976.115.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: fix build for aarch64
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
X-List-Received-Date: Wed, 15 Apr 2015 13:32:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 15 apr. 2015, om 15:29 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Wed, 2015-04-15 at 14:32 +0200, Koen Kooi wrote:
>> Upstream added aarch64 support but forgot to update 'make dist' =
leading to missing files in the tarball.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>> .../0001-Add-linux-aarch64-arch_regs.h.patch       | 25 =
++++++++++++++++++++++
>> meta/recipes-devtools/strace/strace_4.10.bb        |  1 +
>> 2 files changed, 26 insertions(+)
>> create mode 100644 =
meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.pat=
ch
>=20
> I'm guessing this is a better fix than Robert's fix for strace?

This shrinks the diff between strace.git and ${S}, Roberts version =
increases it. It=E2=80=99s the same one-liner type fix, though.

> Let me know if they're different issues=E2=80=A6

It=E2=80=99s the same issue.

regards,

Koen.

>=20
> Cheers,
>=20
> Richard
>=20
>> diff --git =
a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.p=
atch =
b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.p=
atch
>> new file mode 100644
>> index 0000000..f70766b
>> --- /dev/null
>> +++ =
b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.p=
atch
>> @@ -0,0 +1,25 @@
>> +=46rom f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen.kooi@linaro.org>
>> +Date: Wed, 15 Apr 2015 14:29:37 +0200
>> +Subject: [PATCH] Add linux/aarch64/arch_regs.h
>> +
>> +It is missing from the tarball, but it is present in git for v4.10
>> +
>> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> +Upstream-status: Pending
>> +---
>> + linux/aarch64/arch_regs.h | 2 ++
>> + 1 file changed, 2 insertions(+)
>> + create mode 100644 linux/aarch64/arch_regs.h
>> +
>> +diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
>> +new file mode 100644
>> +index 0000000..9a5e33e
>> +--- /dev/null
>> ++++ b/linux/aarch64/arch_regs.h
>> +@@ -0,0 +1,2 @@
>> ++extern uint64_t *const aarch64_sp_ptr;
>> ++extern uint32_t *const arm_sp_ptr;
>> +--=20
>> +1.9.3
>> +
>> diff --git a/meta/recipes-devtools/strace/strace_4.10.bb =
b/meta/recipes-devtools/strace/strace_4.10.bb
>> index 416c387..707cb76 100644
>> --- a/meta/recipes-devtools/strace/strace_4.10.bb
>> +++ b/meta/recipes-devtools/strace/strace_4.10.bb
>> @@ -5,6 +5,7 @@ LICENSE =3D "BSD"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D124500c21e856f0912df29295ba104c7"
>>=20
>> SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>> +           file://0001-Add-linux-aarch64-arch_regs.h.patch \
>>            file://git-version-gen \
>>            file://strace-add-configure-options.patch \
>>            file://Makefile-ptest.patch \
>> --=20
>> 1.9.3
>>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


