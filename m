Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 155897D1A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 00:27:22 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v20so429547qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6Ye2kRxNFFYDHlX6I1eOivWpQlUsc5UU3p2gAsih5MQ=;
	b=rpbcckJ2Y29kOfE9Q0qQHvGIfL3wkgd4ytZtlsxsba4VcaHmneIU9MvrQbMBNrpWNk
	xlw8+5nzkYHc+FKlTPXjGuK/Xzt/OPArOoqmDOlXHwKakH9VKmB70oZk8ELSTKI0PClS
	XNAxxWtHCW214oJm90H5ts1IcT8Q1/jyBBPtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6Ye2kRxNFFYDHlX6I1eOivWpQlUsc5UU3p2gAsih5MQ=;
	b=l68Gq87MaEp3/OiTGZzXEyh3o/ia9Y/EveVGqnTf2OYZGbhOZ7GPSNj51mQVUNo1au
	egs4dJDXdZL5WDeaRCjJRVxmVYKMolc1bqcaMOJHzs/ORel+FRI1lzVZuos1vrJLIgXv
	kboYrYqsbJr20Cm/BhQdg1Vode/7UQrFNxgVjv0ikm2tCCRuSZH6O2zuIs4zasfqoPQU
	DAA0H0dOjUXsq8ZvNQ5GXF6Eu/76/EBWmPxZq3kfwcztXQX2g7NVDylMOtmUXijsdscA
	2WRWMXvSxawwdYTuaJ1Tb4q0OUrT5Lfo0dTmq2RFpteod3wilz9OYJxAvtOYnpK4JPCS
	T/fQ==
X-Gm-Message-State: APjAAAWjHu35aP4MrpN/PT3+I4Zk/8VWsBhgsSooLcJ++OOex1nzE2EW
	ybyj55dN2JBE/1YNTfIDh+Se5A==
X-Google-Smtp-Source: APXvYqw9uRcIJ+nLEdTrRc/yB/2rOBNk56SAZYXpKcfPBN0aI1G20QpTKdE3u+adw0Q1Emq6C3A4Wg==
X-Received: by 2002:ac8:fb0:: with SMTP id b45mr38985662qtk.293.1553819243882; 
	Thu, 28 Mar 2019 17:27:23 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id i63sm305266qkd.82.2019.03.28.17.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 17:27:22 -0700 (PDT)
Date: Thu, 28 Mar 2019 20:27:20 -0400
From: Tom Rini <trini@konsulko.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
Message-ID: <20190329002720.GQ18421@bill-the-cat>
References: <1553683062-24444-1-git-send-email-yongxin.liu@windriver.com>
	<20190328135834.GL18421@bill-the-cat>
	<597B109EC20B76429F71A8A97770610D12A8A698@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <597B109EC20B76429F71A8A97770610D12A8A698@ALA-MBD.corp.ad.wrs.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/bootimg-efi.py: add new source parameter "initrd_rename"
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
X-List-Received-Date: Fri, 29 Mar 2019 00:27:23 -0000
X-Groupsio-MsgNum: 122739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W60oSYBmhtt1VEXL"
Content-Disposition: inline

--W60oSYBmhtt1VEXL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 12:07:59AM +0000, Liu, Yongxin wrote:
> > -----Original Message-----
> > From: Tom Rini [mailto:trini@konsulko.com]
> > Sent: Thursday, March 28, 2019 21:59
> > To: Liu, Yongxin
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] wic/bootimg-efi.py: add new source
> > parameter "initrd_rename"
> >=20
> > On Wed, Mar 27, 2019 at 06:37:42PM +0800, Yongxin Liu wrote:
> >=20
> > > When using initrd in bootloader configuration file, we may want the
> > > name of initrd to be fixed. However, the actual name of initrd may
> > > change and depend on distro/machine's name. "initrd_rename"
> > > gives user a chance to rename initrd in final wic image.
> > >
> > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> >=20
> > I'm not nak'ing this patch, but I've long fixed this by just not using
> > the "efi" plugin to make an EFI system and instead IMAGE_BOOT_FILES to
> > say what goes where.  There's a lot of cases bootimg-efi doesn't cover
> > but are handled easily with IMAGE_BOOT_FILES.
>=20
>=20
> Thanks Tom for your input.
>=20
> What I want to do is to copy "${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS=
_FSTYPES}"
> to EFI boot partition and rename it to be "initrd", like
>=20
>    /boot
>     =E2=94=9C=E2=94=80=E2=94=80 bzImage
>     =E2=94=9C=E2=94=80=E2=94=80 EFI
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 BOOT
>     =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bootx64.efi
>     =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 grub.cfg
>     =E2=94=9C=E2=94=80=E2=94=80 initrd
>=20
> "IMAGE_BOOT_FILES" is good to provide such function.
> How about porting "IMAGE_BOOT_FILES" to bootimg-efi.py?

The only thing that bootimg-efi.py provides, in my mind, is
auto-generation of a simplistic grub/systemd-boot config file.  I also
don't ever want that and just list the config files under
IMAGE_BOOT_FILES as well.  I really think we could drop bootimg-efi.py
aside from the case where we don't have a config file for some reason
(Stand-alone wic?)

--=20
Tom

--W60oSYBmhtt1VEXL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnWZoAAoJEIf59jXTHXZSV4IQAIMDkkWANvx2/hhjIqPb6Sym
vDOVLCKiDt1wLz/1q7EU0Qv2mUt5rF5KY4senoV24KUkk+lp6W3BwPikBgwl+w9h
IsEyJCxy9Ck6Brn/9zNx30WQn1uxTHWZNB5psVFlMKLdxthXrUP8Di4DS9ag0IRl
ChwAO6Th2Rf+GWKMAsid8LIJbP7ECRa38XHaAgv9oa+FvvlZVLT+4xqea24jvMww
UYw8Bsdlq5aM1Nf4Xh2Rre+netNdVgkRWk1634Ih6y2yIwKPrrK6eGGnxwB+IQO5
fpB7gmfOOmLfEBCfP6Wp04dhXYv/piTndj3tNOIqNGNohHGL7vleHNHuA7Cuq3sa
Ewfud6MCwhhr9GvzsYuVCS3sqzqyDBuv+8ah+0YXr/gUYuzXemxJfpC+VXRgyEr8
X00o+nV5+qUO7bc1PDvU5OG1E6I9/eGqkElaS31c/Xf/gcmcJqMqZRtQQQdSs0jg
j8JrznLGmLaiz8CELZqRCaSlYlUkRBp2fyyLpIq7R8hSKAPCFJJ6SKwh8rC1skAX
zB3Mrv5Jv8hcoGWqGd5+f7Apf87OC6Vr7a3pnq5mIjbso884DBLVT8v74aeV/YhK
DOcozyAAKpzZ4BpBGSU+NbmBKnia/NZ1ttqAbEJs/7yXM0jhtbKX53jHNK2irWed
Xpf9wp5U3Jjah5InEGUb
=LliO
-----END PGP SIGNATURE-----

--W60oSYBmhtt1VEXL--
