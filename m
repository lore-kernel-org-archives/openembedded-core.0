Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id C011B781F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:50:01 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id u11so4228116ywh.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=D8qFhg+lPhxW9l+k0x3ihICKS7Dk7xynqJnLMH3aEN8=;
	b=MEe9O0ttnGp44i2WhzriX/IDIBaMAgCNVq72Prz/ktMeF0pCHHAl+sQ79TqZjkz3Gr
	dhBFZGNB85lC47eWFBEgz7GMkUVIMHoKJhh28cQoOUUoBlS78CFjr/+YVqqi/UYEKsyB
	++ivMqlY3eJsEN552iuE0ccHVIklorD0ieL7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=D8qFhg+lPhxW9l+k0x3ihICKS7Dk7xynqJnLMH3aEN8=;
	b=qw1yHw67oWugeRZvQ4VpaLopTgO17MqReto5AEXwqNlR1KhqzNABFYAfOT2MJRQhDV
	DdK0zYlCLgLsALQCV2fGz6HX4vKMo5QZfQ5Sz8BAobc9QbajeVcjfw4RKHVlljJGlFkV
	N8eM624dJQnqONsTAAw4tjQGnWu9yTtYDjfQnMjqKUhTz1E2PWkZwvzT3JP9QP8C3fbU
	kgNX9hL9EeOe9xzjkLNta4hcmoHGV9z5RE9R+Rumdgev0C7JnKZLIn7MwnVjsUtYnjho
	qEqEa2Twp4qwkjBi7Z5CL1GqBa773tTOa4VU8ZZ0uCPmKOJEcyf6FJCqykTFYGmXOeuH
	sMtA==
X-Gm-Message-State: AHPjjUiZxQwqOT7b+CkaQ7Ta1cUevTNlqHc+nEbSAsaMFK8KxFuYhxzU
	0Gm1g7T0rhvi+9Yg/LGJSB4Jqw==
X-Google-Smtp-Source: AOwi7QAN8JULDx9u+BAuClnZGbHH5ZOF/JRwzRzT/myhuIK0WFGEL+KngAA8XOTBM37qYJBQJbuu4g==
X-Received: by 10.37.66.17 with SMTP id p17mr1873088yba.234.1506005402618;
	Thu, 21 Sep 2017 07:50:02 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:24e9:4a96:6457:ac31])
	by smtp.gmail.com with ESMTPSA id x81sm588795ywc.35.2017.09.21.07.50.01
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 07:50:01 -0700 (PDT)
Date: Thu, 21 Sep 2017 10:50:02 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170921145002.GI30205@bill-the-cat>
References: <20170921135833.11007-1-otavio@ossystems.com.br>
	<20170921143747.GH30205@bill-the-cat>
	<CAP9ODKpzHSkyt7ZdCD2C5WdhbzJ66+CW-Gg9c5i3XkX90yGZSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpzHSkyt7ZdCD2C5WdhbzJ66+CW-Gg9c5i3XkX90yGZSQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 21 Sep 2017 14:50:01 -0000
X-Groupsio-MsgNum: 103227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Content-Disposition: inline

--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 11:48:39AM -0300, Otavio Salvador wrote:
> On Thu, Sep 21, 2017 at 11:37 AM, Tom Rini <trini@konsulko.com> wrote:
> > On Thu, Sep 21, 2017 at 10:58:33AM -0300, Otavio Salvador wrote:
> >
> >> The are use cases where the Device Tree appended to the kernel is
> >> convinient, so we generate the bundle concatenating the kernel (and
> >> potentionally the initramfs) and the Device Tree binaries.
> >>
> >> To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > [snip]
> >> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/ker=
nel-devicetree.bbclass
> >> index 72814ca224..6e08be4b70 100644
> >> --- a/meta/classes/kernel-devicetree.bbclass
> >> +++ b/meta/classes/kernel-devicetree.bbclass
> >> @@ -1,6 +1,13 @@
> >>  # Support for device tree generation
> >> -PACKAGES_append =3D " kernel-devicetree"
> >> +PACKAGES_append =3D " \
> >> +    kernel-devicetree \
> >> +    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE=
_BUNDLE') !=3D '1']} \
> >> +"
> >>  FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMA=
GEDEST}/*.dtbo"
> >> +FILES_kernel-image-zimage-bundle =3D "/${KERNEL_IMAGEDEST}/zImage-*.d=
tb.bin"
> >
> > Frankly, the most common use case today for still needing to concat the
> > dtb to the zImage is for very legacy U-Boot where 'bootz' doesn't exist,
> > so we need uImage (which is in turn why we need to patch the kernel
> > build process, or manually run mkimage, it must be (zImage + dtb) +
> > uImage-header).
>=20
> There is also the use case of a single binary to boot. We use it in a
> customer project and we found it quite useful.

That's what FIT is for.

--=20
Tom

--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZw9GaAAoJEIf59jXTHXZSFzEQALQ4sFTChGBcATulMiBmnI8D
FZcU6bh4G6EzjnhkZxB390yU3TwaTtrn4LDjM/jFuk/bf5vnO9QGR+JEzgTN+ELc
R1DM2iVy88qHz2n7IQ4lNPEg1/+9gzq0XlQo3uM94mANLkdf9HnstJD0UV0kGX+p
N0QkgDclksvkFQTgyjxnepsS6ay1l6GAgjPD16kgW/z9EhZdnns1nOQGkTAXZ06v
ANub3t3rbzKS+E5mvlJjp1tkm0fEutPjfdipnnlX3ru3l6Hohc6FYH+usGSYu+iH
8ErqhQFTb+ZN0M8Sk2QwRkERWbMSPHNkwTCVNtCccrgT8r+/SgLiXZN8FkrGuTmY
5Amg7nr1geqy7xH2VgNlK5PD/oocM2jQBDGYIIvSV4ylmtgIMwi76J3XbkNxasUH
y17rfIFN7xTUEnByLWxaZfzjpkJtOMiyNOxJLVUslRxALA+DhIsp6YjAG3HrjYfa
ZhtUyVx/EQWeK5xnxKtjVh95W0r1dH1EoGZ4ZipxpUp6rQ+/ykzhy2nr2BDnRoqw
q02O4T/kb/ew3Zkhj7Sye2iacUfcX21obIg8TpOb4iU1Zu3Wnp7RX7zXGTSMqQHh
s49UeeQQqL45e7olp/iEOe1Wsg/d6LDf9Le2Ixqtc5Jppi3kYsnKTQ4nLcTCgorV
GL+/x5RuE0+ZnRi/2gdJ
=c4KO
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--
