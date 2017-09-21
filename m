Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id C8DD8781F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:37:46 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id w9so4191431ywi.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+agcAGP8YqGh25pofd88lQJjEIj4RmOaVdu1VqRYZXg=;
	b=fFf0wf4/JAk/atcDOH3CEkIR33P0hZBNk0rXCTwnJbIUwkb3Xfe82FNPVagdu3i8AN
	bQQOmCUem+oKIqGIH0y+u1L8OBAsOf6f3ZvJC9FZOxfHyGhw97iHSM4eE5CDpOom5M7G
	hUbgZ5XWb0S7rxpKMlZYWIjMA8C2yL/DvwiBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+agcAGP8YqGh25pofd88lQJjEIj4RmOaVdu1VqRYZXg=;
	b=KkBDgqt8vXOFC+w9hyhB1VM4R+k0oi9kyQmYhGPeFiVuTXHyI7sAKxEIydkLyJBgMF
	miDvbkDWP1Hq+UK1QoNB2MuYdd0OJm/KqDGH7r8sTleaw4PckHubcXn2uakmu57w6qaa
	nRjVC7M5OyeT16W9zvQJ5grtBFOhUKPAsJpfX+t4kY6bsX9ElqY0vw0Rr01gbmW40wxq
	ms0se3tIB6UR7rVdSzh1BRXbXQdaVJ2cmpXmrtWUsLWZzQ4A9XuHmYX4i4f9bwcKy+lQ
	3CfErjXyzgEfqepV+qQkMFW66XZ3IQx4M5872nzbB0yuzb2Tm6zTG/Ou9G+KMYrJKHu0
	PaWQ==
X-Gm-Message-State: AHPjjUg+eDwaHcxKOykoqdtcP4W41GRDvCv/DQqxglSJ8bUqV/6VZtpR
	D4/jfDGh7Es624TFpcq0lw4UpQ==
X-Google-Smtp-Source: AOwi7QBTYWjQ1VFKUN2NuRpg/7JYi1x7RzM2wFLohe4QzxSZpjQr6nA1mCkyQbCW46hGb8lli8LAvQ==
X-Received: by 10.37.54.28 with SMTP id d28mr1743607yba.163.1506004667558;
	Thu, 21 Sep 2017 07:37:47 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:24e9:4a96:6457:ac31])
	by smtp.gmail.com with ESMTPSA id
	n131sm563265ywb.107.2017.09.21.07.37.46
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 07:37:47 -0700 (PDT)
Date: Thu, 21 Sep 2017 10:37:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170921143747.GH30205@bill-the-cat>
References: <20170921135833.11007-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170921135833.11007-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v9] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 21 Sep 2017 14:37:46 -0000
X-Groupsio-MsgNum: 103225
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H4SyuGOnfnj3aJqJ"
Content-Disposition: inline

--H4SyuGOnfnj3aJqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 10:58:33AM -0300, Otavio Salvador wrote:

> The are use cases where the Device Tree appended to the kernel is
> convinient, so we generate the bundle concatenating the kernel (and
> potentionally the initramfs) and the Device Tree binaries.
>=20
> To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
[snip]
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel=
-devicetree.bbclass
> index 72814ca224..6e08be4b70 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -1,6 +1,13 @@
>  # Support for device tree generation
> -PACKAGES_append =3D " kernel-devicetree"
> +PACKAGES_append =3D " \
> +    kernel-devicetree \
> +    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BU=
NDLE') !=3D '1']} \
> +"
>  FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGED=
EST}/*.dtbo"
> +FILES_kernel-image-zimage-bundle =3D "/${KERNEL_IMAGEDEST}/zImage-*.dtb.=
bin"

Frankly, the most common use case today for still needing to concat the
dtb to the zImage is for very legacy U-Boot where 'bootz' doesn't exist,
so we need uImage (which is in turn why we need to patch the kernel
build process, or manually run mkimage, it must be (zImage + dtb) +
uImage-header).

--=20
Tom

--H4SyuGOnfnj3aJqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZw867AAoJEIf59jXTHXZS1FsP/2/i8KJ5So80Urrj2ivHq2Op
Dw+DzHJGGgeojPQhu7SSriyIP6L9V2V4tcNYNdGZP5v+Q36hbzkPm0yXaOa9w8mn
U9D1oDwRVgaINf+8EEK648obChrmHCNQuzILgRKkwZkniBNOFI40kfOpPQZ5XFkB
g/dQTZH/97CZNzTYyEqnPMCScJMZ898CKs2mOs90zRcc+0gKMnZCzgCXQlx9+doc
VpjQRs9OsaL14Aj9xWqXzwwQ3yxDB3cT9i64UVrYwf9nsUQiZ1pa+H9HVdtlB4Th
pqbGHKV9Hy3j33fqIuFtpXTNEk8tG4D0MapVN0y7LN7vwGdAAAwEdXPMq+FyLZYs
btVU2USAEcXtVL7u0jfpD8FDX0skoKRdoaixWos+wVcfjpdHs3B2VcQCeWokUhTs
XEW3CEmAhIS5CBze3o882cXDZuMKvUv1eKHC96CW/4mRHUEu78qudXPw3lITyoyH
xHtFjtXvW24ooey+vwQ4uKpRZuhrvLRQ7OrSch0TXZkB/3r6bAJf9pmCpGWOjyJJ
9cRNYcX3ZmagiBDLuWkdbUw1YujvzKBFdnYidc8/pASUWKW8LdQWLQF+0iIZ7S0d
6o0Rx6Ioo2CKqWjMnQY+3EgbDnlp0zqxZaG5firnhfEWC6U+17Zzhoma7f4NRTgQ
QofZnxc5XUBfCy0ygdC/
=UnnA
-----END PGP SIGNATURE-----

--H4SyuGOnfnj3aJqJ--
