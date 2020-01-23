Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAEB6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:26:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so4822782wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iFnsZvhnwgmJjftXgbbCNhMLmy6pqE5SvElpTVC91WU=;
	b=Spmfbtq1y7a9/YOAkeOzw720mTGFEHBMdOTSy63Q5Bd32vkUm9j+Mftwwq1Gdr2zt/
	CH61sOSWUgM6CvI0uAOsGAKqnRLnLPFIWX8bDDDH0xxXq+uXeonEnaW22eE8m3rPD0Rd
	+Ic9QDqCDhmW9TVNmnvpWmV5R0ko/n/AgQMzcJOfh07g9AuvOZf7TNdyesQdTwEvPuvo
	4/4ETRKQfcG6MxcATnJVoHXNLmTVKsDcbuipqpgc+M0LLmxOHL9tf39dk/2uheCgs+w/
	/jLQCKWv2bnQuYwrP+HM7JSCneLY6oyfnHs3WOgPtQfG56SSm7r9teHg5vJPBKgSKpTu
	rCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iFnsZvhnwgmJjftXgbbCNhMLmy6pqE5SvElpTVC91WU=;
	b=ZP7xWdjRDcnuTChnuKx7KGtX+BnH//1KkUry16jkJqG6HXk0uJKLUhr8JeeP0gcnZl
	xfrCpma0fiL4Df18RscJCgw1C8s1Ledm2iP2w/Vq1swoy/iiMC1iP6mRmjZdY5hNdGLv
	pntE+pJiBZof0/UFfKCEBthnS+JkgIQ2HWfyI2f1CPkDTA6X/Z6YlT7WmvgYie93TG8G
	Fo1XGYrV4OdK7zfYph5yWYjxEXs7t3B7dfsDWo0OZoePFWYN6yqHkZt9r/f6e7b45yyw
	B7SkIT7wG4nUk2ppQU5rPfG8+eyy6GmwEX5GyCACmgBfjVzIg/iP1sB+kVsCR1+WNqrV
	detA==
X-Gm-Message-State: APjAAAWB+A4uIFN7hAQp41FKcCENrG7oZxLHUANL1BtCjvBrtMsLfRYt
	bXpYZaovUCEgHx7NUIjt50yWMHyX
X-Google-Smtp-Source: APXvYqxP5u+ZquB8+OEFPJByYNsNGY/wPtyS3tWhZIXuCgoCrli+4pPdigsFy+q89MN27CDp6uQklg==
X-Received: by 2002:adf:f103:: with SMTP id r3mr19840wro.295.1579814798497;
	Thu, 23 Jan 2020 13:26:38 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:509b:b3fb:ea44:b29a?
	([2a02:2450:1011:56f:509b:b3fb:ea44:b29a])
	by smtp.gmail.com with ESMTPSA id t81sm4314420wmg.6.2020.01.23.13.26.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2020 13:26:38 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <9a860272881d3c0fff6be186e63063112d37cff0.camel@andred.net>
Date: Thu, 23 Jan 2020 22:26:37 +0100
Message-Id: <3C715AE5-3ECB-46CA-A1A1-35A68F90500F@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
	<20200123173416.112832-3-alex.kanavin@gmail.com>
	<9a860272881d3c0fff6be186e63063112d37cff0.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] default-distrovars.inc: add vfat to DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 21:26:38 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry but certainly no. It=E2=80=99s already hard enough to make ptests pass=
 with just the one standard configuration tested by the autobuilder. I still=
 have a handful of components with cryptic failures left to fix, so if you c=
an help with valgrind, mdadm or lttng failures I=E2=80=99d appreciate that.

If you want parted test suite to handle things gracefully when vfat is absen=
t, work with parted upstream to make it happen.

Alex

> On 23 Jan 2020, at 21.15, Andr=C3=A9 Draszik <git@andred.net> wrote:
>=20
> Hi,
>=20
>> On Thu, 2020-01-23 at 18:34 +0100, Alexander Kanavin wrote:
>> This is beneficial for parted ptests in particular, as
>> they expect vfat functionality to work.
>=20
> Could you also update the parted ptests to skip or delete those
> tests that depend on vfat, please? I.e. when the DISTRO_FEATURE
> is not enabled.
>=20
> For the benefit of those people that don't need / want vfat, but
> still want to ensure that parted works by running the ptests.
>=20
> Is that feasible?
>=20
>=20
> Cheers,
> Andre'
>=20
>>=20
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>> meta/conf/distro/include/default-distrovars.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
>> index 10d86cf7b17..433d4b6651d 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
>> LOCALE_UTF8_IS_DEFAULT ?=3D "1"
>> LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
>>=20
>> -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth ext2 ipv4 ipv6 lar=
gefile pcmcia usbgadget usbhost wifi xattr nfs
>> zeroconf pci 3g nfc x11"
>> +DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth ext2 ipv4 ipv6 lar=
gefile pcmcia usbgadget usbhost wifi xattr nfs
>> zeroconf pci 3g nfc x11 vfat"
>> DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>> IMAGE_FEATURES ?=3D ""
>>=20
>> --=20
>> 2.17.1
>>=20
>=20

