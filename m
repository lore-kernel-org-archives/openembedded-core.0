Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id F20AF74E47
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 00:33:21 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id p206-v6so1978664ywg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 17:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iPti5M+ch2LglBLCHBqaGt6oi1ByMXGAU3oovw4bCkw=;
	b=bnebkGGBcXMbou2Ge7lA9J3pl6EtnLiwSbU1sVH2NVKdky0/n/VvSj6fS48prAyj/0
	OZgFDhCDYj8vb9TXsl3y+X6SnQKxceH0UeBUylzQVCPM3pHpJu5i+EyMb+ptYgLBpFJ3
	u+poAJkBrQ89Peb8dM0a1nZgZGQbroNOC2E/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iPti5M+ch2LglBLCHBqaGt6oi1ByMXGAU3oovw4bCkw=;
	b=VuE/c3tFki9M7DH9nVral17GYIjl8xLeg+M8JYFQlgN+wiE0bXZqvni4ZW6KRO37id
	lWCV9RuHzDpqYeflFrX6giHHzL/cEyDAR32TE1aCzdDpzo5wEPFpfwcJ2wmNTixC3YhN
	c9SJxrs1ZI+VUMVW1W8/ZHycZR1dg7/63ee8WNIZ8T5rlt741tdHnHjp/NvgRqAEMnga
	CToadj/wBjCoHONKRApL2AlTO6jzeSeglmO56OzTUt7a0k68W2OAMPe8L0xftcFpp2sJ
	PDpbzcejLr2n4umELWK5+cCOmAdQvANLwBXYEowOHZw/yuRAe42UF5q8G7pMwqGPjL9U
	IFMg==
X-Gm-Message-State: APzg51BbpNlU0zB88xfQPNz8wwao8sG+EfbYFjgBAEWjT5y6cr6udSOR
	esMTt0u8LEOrhJ7DQNldIUnSJA==
X-Google-Smtp-Source: ANB0VdZlrueCixFq2tHw9CT+AS47C2GSRE/a75gr6pnlLmAeySWcA8CjwaV8xVEc2zFRycb1KV9T2Q==
X-Received: by 2002:a81:453:: with SMTP id
	80-v6mr19330047ywe.203.1536107602694; 
	Tue, 04 Sep 2018 17:33:22 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	j8-v6sm146148ywj.6.2018.09.04.17.33.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 17:33:21 -0700 (PDT)
Date: Tue, 4 Sep 2018 20:33:19 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180905003319.GZ26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
	<20180831135228.GN26633@bill-the-cat>
	<3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
	<ea8d1d09-85f9-503a-49c7-8e21bcaafe5b@windriver.com>
	<20180904022609.GL26633@bill-the-cat>
	<e8e665b9-1493-822e-3cb1-ec980c382eaf@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e8e665b9-1493-822e-3cb1-ec980c382eaf@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] wic:bootimg-efi:try other place for efi
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
X-List-Received-Date: Wed, 05 Sep 2018 00:33:22 -0000
X-Groupsio-MsgNum: 115810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aGKliJYS034REZMp"
Content-Disposition: inline

--aGKliJYS034REZMp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 10:33:43AM +0800, Lu.Jiang wrote:
> =E5=9C=A8 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 10:26, Tom Rini =E5=86=99=
=E9=81=93:
> >On Tue, Sep 04, 2018 at 10:15:44AM +0800, Lu.Jiang wrote:
> >>=E5=9C=A8 2018=E5=B9=B409=E6=9C=8803=E6=97=A5 10:01, Lu.Jiang =E5=86=99=
=E9=81=93:
> >>>=E5=9C=A8 2018=E5=B9=B408=E6=9C=8831=E6=97=A5 21:52, Tom Rini =E5=86=
=99=E9=81=93:
> >>>>On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:
> >>>>
> >>>>>When there is no useful efi in $kerneldir, try copy
> >>>>>all efi from EFI/BOOT into boot image.
> >>>>>
> >>>>>Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> >>>>>---
> >>>>> =C2=A0 .../wic/files/wic/plugins/source/bootimg-efi.py | 12 +++++++=
+++++
> >>>>> =C2=A0 1 file changed, 12 insertions(+)
> >>>>>
> >>>>>diff --git
> >>>>>a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>>>b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>>>index 0eb86a0..d435268 100644
> >>>>>--- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.=
py
> >>>>>+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.=
py
> >>>>>@@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else:
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise WicError("unrecognized bootimg-e=
fi loader: %s"
> >>>>>%
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source_params['loader'])
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
os.listdir("%s/EFI/BOOT/" % hdddir)
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
found_efi =3D False
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if x.endswith(".efi"):
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_efi =3D True
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not found_efi:
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cp_cmd =3D "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" %
> >>>>>(kernel_dir, hdddir)
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 try:
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_cmd(cp_cmd, True)
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 except:
> >>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except KeyEr=
ror:
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 raise WicError("bootimg-efi requires a loader, none
> >>>>>specified")
> >>>>I'm not sure this is the right approach.=C2=A0 If you don't have thin=
gs set
> >>>>up for automagic finding you should use bootimg-partition and
> >>>>IMAGE_BOOT_FILES.=C2=A0 I'm doing this right now for some EFI projects
> >>>>because it's also bad form to dump everything into EFI/BOOT and some
> >>>>things should end up in EFI/vendorname or similar.
> >>>>
> >>Hi Tom,
> >>
> >>By indicating IMAGE_BOOT_FILES for bootimg-partition, can perform copy =
file
> >>work. While we still need the code in bootimg-efi to re-generate grub.c=
fg.
> >>
> >>I prefer use bootimg-efi for this case, but we can add a new parameter =
to
> >>distinguish kernel dir & bootloader dir(for efi files)
> >I'm still not seeing why we need this, sorry.
> >
> >If we need files in the ESP in EFI/BOOT/ then in our root filesystem
> >they're already in as /boot/efi/EFI/BOOT and we say that we populate
> >things from /boot/efi and this also gets us things like
> >/boot/efi/EFI/vendor and so forth populated and matches other Linux
> >distributions.
> >
> >If we need something more complex, we have IMAGE_BOOT_FILES available
> >and can and should be populating the deploy directory like other
> >architectures and loaders do.
> >
> bootimg-efi performed following for grub boot partition:
>=20
> 1.copy grub-efi-* from $KERNEL_DIR into $/boot/EFI/BOOT/
>=20
> 2.copy bzImage from $KERNEL_DIR into $/boot/
>=20
> 3.generate grub.cfg based select booting device.
>=20
> On target system, if we select booting device from running system as sour=
ce
> for booting-efi will meet issue. Because the *.efi & bzImage is not in the
> same directory.
>=20
> As you suggested, we may invoke booting-partition by feeding
> $IMAGE_BOOT_FILES to indicating file need copy, this could done work 1 & =
2.
> While we still need generated grub.cfg.

One of the great strengths of wic is that it can cover a lot of
different fairly complex use cases automatically, and still provide an
expert "out" for when you're doing something fairly different but still
want to leverage wic.  While I don't understand the use case of turning
a live system into a wic image, it sounds like what you're looking for
is the case of "and we provide our own loader config file".  You should
be including grub.cfg into the IMAGE_BOOT_FILES list and generate this
however you need it.  Since you've already booted you should already
have a correct EFI/ directory to look at (we ought to stop having
top-level bzImage, that's not right, but that's orthogonal to this
thread).

All that said, I'm also not sure why, roughly, this doesn't work for the
use case:
IMAGE_BOOT_FILE =3D "\
  /boot/efi/EFI/BOOT/bootx64.efi;EFI/BOOT/bootx64.efi \
  ...
  /boot/bzImage;EFI/yocto/bzImage \
  "

And you may want to address that we don't package our default grub
binary, or have the script that's running wic make your grub.efi binary.
I kind of lean towards the former being something we should be doing and
aren't.  There's I think a lot of stuff that could be made more
consistent with other architectures and loaders but isn't currently.
That too is somewhat orthogonal to this series I'll admit.

--=20
Tom

--aGKliJYS034REZMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbjyRPAAoJEIf59jXTHXZSehMQAIOT9JRcIfouDilqN9uPQxnS
n9VwjVVvi6H276/UaPc8VbmeOptcPIbZcXfHjXKJM5EYh9cGrKtwoTe7E07l5SL/
JuknPWBEoeOOmWb+W5NWvQwRftNzGeRqriusFPByz34tMvJIgr1koA1WFYF6rtbY
/ZHXMUn0x7M0HRWqeFLvKJBhZVKAcxPQiIIWS9yvgv4LZkfqBE+WUdJuyiU44ZZ9
csF7OzZZ2W/jNQE1wz96pIp3lYHhUZ5SArFZXRRyEBwg64RWMZhOXTNfHheZIjz/
EsIRpEOxrZSBPSCawaDtAP3QkG5EwtKjMAj4+qybgRCbFyigFgujv7baxcVnOXWY
dsECchXm2YTW81ngi6XGnLs+c+qqVzYFHlMWvwjx5BaNmc+yJ7bflCRp4KNvJUcM
l9hAcCOa4K2cBgF/e4Bqr0HrMoZgrBv0H1zuj/JzzpAyalu5NTcUgvORH8eIB83Y
WkdtrrDpZQTrJucc2U8LP0X35IShGGe1TiN2YrzhVEOaASvOLAxe7vh0VjayfdH7
DLgjq+v7LctBc8xOROWgukSGgadUro3F7lewwt9sYYNeR0n8Oa3/d7zoE/WYj211
vbqcnGhXFHTTAQ0nN6LnQ1OHFHnPCSMJdNxtlGPeoEIvrNOc42Bl50jd8VEx6tQF
rYg+ioSpdpIkAGwgk9uO
=89IC
-----END PGP SIGNATURE-----

--aGKliJYS034REZMp--
