Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6F2C783B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:57:52 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id u19so21473729qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZLaz+sYO6VGTl78kGnnmimThcSP1UPMTIVCYmaPnZtA=;
	b=WchrRKBNtEX3/hzdoP36Fg7N4uubmII9Q+pEcTIh/ipSHCfDfaBbvyFXC4ZuQvSCnl
	CxcAZHifZyxdlHSqM+0CJ40UOAWl63FDmzWNAVixxqePX8fN4u4NCiBBrBuUHTM6Ma5c
	4GGFWAEJOBTJqLt5gkBuTudek0TyWHVCWJ1T1Ac9wo5KYWjH8CuLGWYCWUT9IJSkzc4J
	AhgZ+Y1Ii52me4+NCMX4IUVrpEA9q0iEMkfoFD6AbtweKqOtkMthSfbKsmQmfMbnM2UN
	RzbZ0JvS+8ahKoSoSwCgmAaNZuxBq4Y2SFT3rmLvwk3RwXg4ekNeMvC27UX9jlMLOOls
	Fm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZLaz+sYO6VGTl78kGnnmimThcSP1UPMTIVCYmaPnZtA=;
	b=i2RDn6gZfLe8Sgkipug03dIT4SKVM+HPG3HqDtdOQ2/Nl7IZ1djGMuTwd5exa45ttc
	mzKslKZaDTOAF5QSsszJdrHh1kwUbGWV0BeSQu3LelYPhuewENzm2+qhOu0o0y9Znje7
	1Y0uAaocAq6NT1qa1Zm0WIDvSjAQWa38xniZPnMGHKQkqWMHLsO7trKPFHTN/Cf7IPw6
	cxwX9Nt5kpFi1/d/2y3spvbyBe1l1ysZAIYrB4GmMu0SXaSCqcFtlu647ZqNrohE84eW
	iiXNPdekQjJj7Vkn9hz9RhoUWtxuwMHe2jdXdW3NB2yWhCDIR5b+i2jU8ZQRIrh1Mb+P
	bdew==
X-Gm-Message-State: AKS2vOwS5QCbW3mmi3GONEoPSBXZgR6I+RwJ4BJHqAtMqmwrg3UBCKGt
	ChBeiJLajhHY8qThuodTY6QQAyQJo1pC
X-Received: by 10.200.45.206 with SMTP id q14mr6862607qta.177.1497535073594;
	Thu, 15 Jun 2017 06:57:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 06:57:33 -0700 (PDT)
In-Reply-To: <4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 14:57:33 +0100
Message-ID: <CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Thu, 15 Jun 2017 13:57:53 -0000
Content-Type: multipart/alternative; boundary="001a1137925619bcc80552000ec4"

--001a1137925619bcc80552000ec4
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 14:53, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> The patch "0003-Add-disable-opengl-configure-option.patch" used Git
> rename syntax, which is not supported by quilt.
>

But quilt is the default, so how did this ever work?

Ross

--001a1137925619bcc80552000ec4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 14:53, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2sr" class=3D"a3s aXjCH m15cac088f387ad85">The patch &quot;0003-Add-di=
sable-opengl-<wbr>configure-option.patch&quot; used Git<br>
rename syntax, which is not supported by quilt.<br></div></blockquote></div=
><br>But quilt is the default, so how did this ever work?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137925619bcc80552000ec4--
