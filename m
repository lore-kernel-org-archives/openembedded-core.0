Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAB27750A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 08:22:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so34694651wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tpazvKniHBmTKy6VQlwXGwwATAYuW7ml4F7kWKf84HQ=;
	b=pWXw2T7HixjCmeWWBmQFR9j2TvgigP4ajaZGskmWJYMMjTgSDLoNxTvDLBjGtKx57D
	V0rIoFY6PKCVoTWBRt+0Wy2zOJ981+yEb6pulboEraZx93KWKegn5P8ceUerlLgdHcUn
	+4PvAOn9ZYzWEZUmxkzODuzVepZgX3AH4WsFnRJHArXYodMUIjw7ojPK6ul2Qzubiw20
	wSDHStmXGUYxxZCiOTwmCxmzOzfgOedM3DYXklbK9ZEAtEraZF923bP3SKAutIVKw55p
	EkrL65oSJIDSAM2GLASrwDHe63Be9WbzjgI/ACAZ33XYXRTvx0Hm17Ds2rtckS8G0nM4
	y6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tpazvKniHBmTKy6VQlwXGwwATAYuW7ml4F7kWKf84HQ=;
	b=lCG1vx0AVOn8zuVZNPTJZ2QZ5AK29tAvE3wUxmxeCvjDpaIIX+YGbZVkaWReb8Nx+B
	/vtz05AOAPyCf0HJgsop/knRniQszQVby409tRphb0xm6ZiE+7fKxOq7rgM7pq7OyOv0
	YqxlT7mGxLmxB4nG628o5xBtMVi6ohJ1HZ1uSzFnbKnuIL+DzMz5d3l5S3usxFlvZ+PY
	cCMQIEviu90+G0E/b8nNCDbH9XRUBAHP3JHJL6JlbUp4Dw3gJf+4BrDKhg973eIYGFx/
	64VuYK9ByPKV4/En+NPvK/hh6NGT9UBByKufkI9yDjoMICMpQzgTXczj1XlIf83/fAvk
	TZNw==
X-Gm-Message-State: AIkVDXKTbDwa7SGkyTwN+F6OU7Zx6AAhfxLwFhhTx25bpk+qyvGzhDd+MXvodY2T5U2/Yw==
X-Received: by 10.28.183.215 with SMTP id h206mr8760520wmf.60.1482394935290;
	Thu, 22 Dec 2016 00:22:15 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	d85sm30950305wmd.17.2016.12.22.00.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 00:22:14 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Dec 2016 09:22:10 +0100
Message-ID: <3060148.VaupzpM8Ol@crde-port-20.cahors.local>
User-Agent: KMail/5.3.3 (Linux/4.8.13-1-default; KDE/5.28.0; x86_64; ; )
In-Reply-To: <CAJTo0LY4H-09bkCySm_MajvxSqDEHpTUNTiQy4uOHxJjNQWNNA@mail.gmail.com>
References: <20161212155909.8946-1-freesilicon@gmail.com>
	<20161220095122.11831-1-freesilicon@gmail.com>
	<CAJTo0LY4H-09bkCySm_MajvxSqDEHpTUNTiQy4uOHxJjNQWNNA@mail.gmail.com>
MIME-Version: 1.0
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 22 Dec 2016 08:22:16 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On mardi 20 d=C3=A9cembre 2016 17:44:54 CET Burton, Ross wrote:
> This breaks list_pkgs() for the RPM backend. Instead of returning a list =
of
> packages, rpm just says "%dbpath is not defined" (or words to that effect,
> as the log disappeared in 100 pages of errors).
>=20
> Ross
>=20

OK, I found the bug. I also modified the rpm recipe in another layer using =
a=20
bbappend, but now I must include these changes in this patch. I'll resend t=
his=20
ASAP with the change.

Sorry for the inconvenience,
David

