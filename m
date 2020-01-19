Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67B8E7F8DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 09:34:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so26496358wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=oHAszWnmazJpiTgdjDMi+kdPlaqh5by0CRY8GANKK2c=;
	b=KFCJkQ8SogR2bkegftVpApJFOWbby1Hihm7M83QoQucumuOaI9dtJ8R63eeuGo//UH
	8ERxcUyz1LWKdYt22VN0ZGVPWw3up22DFonhQSh6PXhBgx0LbfLMznucV9XcbtrN09ES
	lswCaGscUXmhNZCGRxDM4oOrk2mK1D1IFr9Me3X0QN+FwZDTVnHpxbgvxhbTM5mR7xt0
	PEkd4VxsO2l5c24n7HcCM3+N+RRrQopfy7itp/HM9Fady4iilIX5rYc8l8YfKR9l+OkZ
	7q44llWNpZykevjGuxsvyBCuBjpDI7QgXCnNRf9U6hOO/RnzXPDW1cDY2j2izUGq/KHz
	q62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=oHAszWnmazJpiTgdjDMi+kdPlaqh5by0CRY8GANKK2c=;
	b=lCv7zhO4UT2zGFiR33NLK1Q0uoupppu/pmJkIqamZan69S5g0+AVrr5nP1wVBo4vCu
	An5g/KL/7QOXMorpnT34kFYBMsF+CXVNPZEnxjMmK+tCGpMJo4afhQj/iXS37Qz6hhx4
	W+sxHVOXu7XCgxpM/SUboR4hiS2oXc9h5OoBkKRDQ8NLpNPGrj3f/E9xZB03RA9k3HFg
	LWZUh23mTAGYS6TbX0H4MOjwiyvo0qeiPJnOBEUNJd2GdgB6SEoFtJlcahsf3/CTRfRM
	msT5TASp7nJb/6/UEg0DAljgl5g47O+CQPxHxSql/BLVRdsc7g0BSjnSsA0DraOCyci4
	gDRw==
X-Gm-Message-State: APjAAAU62FVkV2BJtew91fcfz285QsZyMKM36Avr/ylLchfM3Q+TTmvT
	oe95N97D3btIzQfqURVoronFfgv7
X-Google-Smtp-Source: APXvYqx03rka1puTTuz3Nc5K9Bwyeq2DGJ+vMLqVdQA30+mXHbX6cspUTEHAxEFi+1+RWtd6demRXw==
X-Received: by 2002:adf:a141:: with SMTP id r1mr11683968wrr.285.1579426447873; 
	Sun, 19 Jan 2020 01:34:07 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:2106:2da0:d903:f689?
	([2a02:2450:1011:56f:2106:2da0:d903:f689])
	by smtp.gmail.com with ESMTPSA id
	m21sm17939890wmi.27.2020.01.19.01.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2020 01:34:07 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <1579410511-20928-1-git-send-email-wangmy@cn.fujitsu.com>
Date: Sun, 19 Jan 2020 10:34:06 +0100
Message-Id: <A43F3348-43D0-4506-AB0A-1D8970DFDAA2@gmail.com>
References: <1579410511-20928-1-git-send-email-wangmy@cn.fujitsu.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dnf: upgrade 4.2.2 -> 4.2.18
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
X-List-Received-Date: Sun, 19 Jan 2020 09:34:07 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I would upgrade this in tandem with libdnf and rpm. Both are known to have i=
ssues unfortunately.

Alex

> On 19 Jan 2020, at 6.08, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>=20
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
> meta/recipes-devtools/dnf/{dnf_4.2.2.bb =3D> dnf_4.2.18.bb} | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb =3D> dnf_4.2.18.bb} (98%)
>=20
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtool=
s/dnf/dnf_4.2.18.bb
> similarity index 98%
> rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
> rename to meta/recipes-devtools/dnf/dnf_4.2.18.bb
> index f38167f1ad..fd4380723e 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.18.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/dn=
f.git \
>            file://0030-Run-python-scripts-using-env.patch \
>            "
>=20
> -SRCREV =3D "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
> +SRCREV =3D "ff1972b52007ccb701c43e3c2bf2bd2e40ac32ac"
> UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
>=20
> S =3D "${WORKDIR}/git"
> --=20
> 2.17.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

