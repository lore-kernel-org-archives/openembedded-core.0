Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E28756E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 14:59:46 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p63so74371672wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 06:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pnVFUmV/XR4Siw85HIw4qT07rdwhLN6XDWC/F8Kiqto=;
	b=KRbSsWt3YyUHfUrmd0sjWxLMYVxIVGd+Zu6+DQraQWpI+8NPViLbWL/+JjQXGh2mOx
	354bvLIvzJ9Ryzso+sZ5WqU2I+7SpF4N1ejPHrPjeu1GYggxzW8gZTVMvH6e/4WGnTIw
	2HijUpJkPyX12PGz6F/srpX1KfXSAabY0qkuOtE/+ooP0WQyw1iRdpfX/mieEPkrJvIK
	vxBL9DUYJrm6dxfiDfICwGF7IKX8Lt0A8HWcj4ZCiuXsTZxFc2n/vLt0D/9stFQFZWMm
	gfsnU2yotsut/rCZISI7HA6eRHjQM0AUSjzIytUmRIvovhpVx+ybG7gs3ncqMHzl8l1b
	iYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pnVFUmV/XR4Siw85HIw4qT07rdwhLN6XDWC/F8Kiqto=;
	b=i9yrkUGZcUi02r+0f9TDJ0xQvbmnXE107nPaf+WquQsGcgu3K03TE3Q7j5MIejnYSq
	sospJLA4Kh8Rz6N873lZAm/dzBSC+CkBO6aLNo2/gcC+b+ZoZdub8DGMXE1yzcHe2dgr
	ZbloU462BtFC1LClq598GcjUzY6/j55l4EKuqwYjWyTF9yKFmXi1OuA6ffP8SHykQkOD
	b9H3pusiPZECZuLw7NAbN/R22G06iQXZOkLDui/IflD830vgFOcK2a5zdsd7rd0OSIk0
	CZnnzcp80d2YIwDCQaUKMClJBBx6dhKmR4uzg+cj/J9Rs8+YuiOutQzDPV9ni2QYvc9R
	wALQ==
X-Gm-Message-State: AG10YOStUxb3Rc/NGclo31E9Fcd0HPFyqQzOM3H9i4SWcKZ1wq6suZkhfvtfK7OzskEd8A==
X-Received: by 10.28.188.70 with SMTP id m67mr25867067wmf.24.1454511586354;
	Wed, 03 Feb 2016 06:59:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm6957284wjy.0.2016.02.03.06.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 06:59:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Feb 2016 16:02:56 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160203150256.GA2567@jama>
References: <1454495408-23334-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1454495408-23334-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Wed, 03 Feb 2016 14:59:49 -0000
X-Groupsio-MsgNum: 77459
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 12:30:08PM +0200, Maxin B. John wrote:
> We need machconfig file to automatically choose between physical and virt=
ual
> keyboards.
>=20
> [YOCTO #9027]
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-bsp/formfactor/files/beaglebone/machconfig |  3 +++

I still don't understand why beaglebone specific file should be included
in oe-core, all other BSP layers are providing own machconfig for their
MACHINEs, why should beaglebone be first exception for oe-core?

>  meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/machconf=
ig
>  create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconf=
ig
>=20
> diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig b/me=
ta/recipes-bsp/formfactor/files/beaglebone/machconfig
> new file mode 100755
> index 0000000..ffce012
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> @@ -0,0 +1,3 @@
> +# Assume a USB mouse and keyboard are connected
> +HAVE_TOUCHSCREEN=3D0
> +HAVE_KEYBOARD=3D1
> diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig b/me=
ta/recipes-bsp/formfactor/files/qemumips64/machconfig
> new file mode 100755
> index 0000000..56777b6
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> @@ -0,0 +1,10 @@
> +HAVE_TOUCHSCREEN=3D1
> +HAVE_KEYBOARD=3D1
> +=20
> +DISPLAY_CAN_ROTATE=3D0
> +DISPLAY_ORIENTATION=3D0
> +DISPLAY_WIDTH_PIXELS=3D640
> +DISPLAY_HEIGHT_PIXELS=3D480
> +DISPLAY_BPP=3D16
> +DISPLAY_DPI=3D150
> +#DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlayFp8ACgkQN1Ujt2V2gBzzVwCghn3TYSrWhVIfIqFF/rAIIf0+
o9MAoLDwJexz5HUXF7Zh77xEJTcqESg2
=AccL
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
