Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A375F72411
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 17:45:12 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so7136840pac.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 09:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1EKBdE9sjpapcMmtTdaAVK0mTtu477fV3Tr8qZV2dA8=;
	b=D6iYmeCGKutZRyw3ZpU7yALKwG17Hr466ZPSdCAhBzkgQj0hEeFi3Gfy6ofXfr52Zj
	gjmLrHzAggxl+aR1oAT8dUwRr3kUJY0BI7kTb3rqoX+6BXclmdfhunTGpEL71LROOXco
	5/olOKSe4l0fw7VJcnMJnAVubKA88UKLVZ55ZgGMt05E1158Pgu7iYqY9SM2BhTczjNY
	GbNZ+1fce2JsGavZH0eM8E+5gTpCocTkvYLCo//nPxbV9kTyfCrxhkPTBE3Oe3Ewiy67
	nzAyHN6GWCczKg05mzfFC8YwsLyKO5HbLkuUfE2uqVhvWeRV3zqwZ7Nb+JnOGU0OEz1v
	ojEg==
X-Received: by 10.70.65.105 with SMTP id w9mr64770090pds.58.1417196712944;
	Fri, 28 Nov 2014 09:45:12 -0800 (PST)
Received: from [10.10.99.35] ([68.189.76.222]) by mx.google.com with ESMTPSA id
	ez1sm10469431pdb.86.2014.11.28.09.45.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Nov 2014 09:45:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
X-Mailer: iPhone Mail (12B436)
In-Reply-To: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
Date: Fri, 28 Nov 2014 09:45:06 -0800
Message-Id: <86CCE002-9D54-49D0-9E1C-88C4E7775CD1@gmail.com>
References: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] clutter-1.0: upgrade to v1.20.0
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
X-List-Received-Date: Fri, 28 Nov 2014 17:45:19 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Ping.

> On Oct 7, 2014, at 8:00 PM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> * The 1.19.x series were "snapshots" and not stable releases.
> * This is the first stable release beyond the 1.18.x series.
> * Tested on nuc with core-image-weston.
>=20
> ANNOUNCEMENT:
> https://mail.gnome.org/archives/clutter-list/2014-September/msg00007.html
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
> meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb | 8 --------
> meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb | 8 ++++++++
> 2 files changed, 8 insertions(+), 8 deletions(-)
> delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
>=20
> diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb b/meta/re=
cipes-graphics/clutter/clutter-1.0_1.18.2.bb
> deleted file mode 100644
> index 452e7ee..0000000
> --- a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require clutter-1.0.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36451=
6c"
> -
> -SRC_URI[archive.md5sum] =3D "471f5ea423e20d4140c7771873daef29"
> -SRC_URI[archive.sha256sum] =3D "f9fe12e6148426063c90e67dfaeb56013bf1aea22=
4ef502223d13eab6c1add63"
> -
> -SRC_URI +=3D "file://install-examples.patch"
> diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb b/meta/re=
cipes-graphics/clutter/clutter-1.0_1.20.0.bb
> new file mode 100644
> index 0000000..7898810
> --- /dev/null
> +++ b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
> @@ -0,0 +1,8 @@
> +require clutter-1.0.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36451=
6c"
> +
> +SRC_URI[archive.md5sum] =3D "a8a33a57a944c6d7c7c013ce9aa3222b"
> +SRC_URI[archive.sha256sum] =3D "cc940809e6e1469ce349c4bddb0cbcc2c13c087d4=
fc15cda9278d855ee2d1293"
> +
> +SRC_URI +=3D "file://install-examples.patch"
> --=20
> 1.9.3
>=20

