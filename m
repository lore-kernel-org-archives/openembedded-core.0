Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46CB974C68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 13:41:32 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id n21-v6so2640440ywh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=m3JAE2VKR0uMXhkeyMt5xu5TE4dkRELAtz+wVtMGAnc=;
	b=H9nRnTQsAhx51s8N6LLzjMGztKPtavQl0x9nJwQ4Oy6It2pj0xK8ij60UClXcqye7b
	ccIVknXkfn0dzRS8ngm4fYV/itl9lusi40lxYVNBp2Wb5FZtAp3A4guONr8e9nnbRvbu
	fr5aCOm2RfxWNOg79k0qm1mWDIsd9y412hTTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=m3JAE2VKR0uMXhkeyMt5xu5TE4dkRELAtz+wVtMGAnc=;
	b=hZpUZT0rSbGCkr9/wEpSo3Cmlm8tJLvZ6k2kz84OcwByAFNRw5pyCHdbBdrHlxOsDg
	7b9JkaFyEmfWQLrKWpj5VOCO8zbOBpx9LUOsUDCmvMkfUMVnYJpie+22atGd9qqiue5k
	Qf9rNIvF6xbSO8r9vIXXs2igEdJZ8FsDUdLqLhbizjOgnTTc2qO77bOCQUe9VvxxhJLa
	Yi5Rth57p+AjpeATV0Gk5nTPqSJL3bqGgqp59xjMIGaxys7glRDiV7EW8a0Dbr6U4Pfd
	KMbeGdurS5g5MghNr8j0CqJI3VSmwgF7jkzLlm3kXy80fCfOYTDpzxnFv1By/JfxwkOT
	fvgQ==
X-Gm-Message-State: APzg51DSg2gGoJC6Jtpr16P1wgCh7VSblMxAvvsyRX7zCwGWsMjjY8FG
	Nyfml42cd2lYfy/GlWHTbYP12w==
X-Google-Smtp-Source: ANB0Vdb31FWiY0394Rt6ZlkOOGMkp6ogAn2hk5Wd4coAQ802CBYPS8W303PVPV2KiqETApr8JCRgnA==
X-Received: by 2002:a0d:fcc5:: with SMTP id
	m188-v6mr21161145ywf.471.1536154892971; 
	Wed, 05 Sep 2018 06:41:32 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	c69-v6sm1062706ywb.11.2018.09.05.06.41.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 06:41:31 -0700 (PDT)
Date: Wed, 5 Sep 2018 09:41:29 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180905134129.GC26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
	<20180831135228.GN26633@bill-the-cat>
	<3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
	<ea8d1d09-85f9-503a-49c7-8e21bcaafe5b@windriver.com>
	<20180904022609.GL26633@bill-the-cat>
	<e8e665b9-1493-822e-3cb1-ec980c382eaf@windriver.com>
	<20180905003319.GZ26633@bill-the-cat>
	<a610db8d-99cc-e256-6c3f-a7a41daf4729@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a610db8d-99cc-e256-6c3f-a7a41daf4729@windriver.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 13:41:32 -0000
X-Groupsio-MsgNum: 115849
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d7Y+OVao7DrgM7NW"
Content-Disposition: inline

--d7Y+OVao7DrgM7NW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 10:32:32AM +0800, Lu.Jiang wrote:
> =E5=9C=A8 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 08:33, Tom Rini =E5=86=99=
=E9=81=93:
> >On Tue, Sep 04, 2018 at 10:33:43AM +0800, Lu.Jiang wrote:
> >>=E5=9C=A8 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 10:26, Tom Rini =E5=86=99=
=E9=81=93:
> >>>On Tue, Sep 04, 2018 at 10:15:44AM +0800, Lu.Jiang wrote:
> >>>>=E5=9C=A8 2018=E5=B9=B409=E6=9C=8803=E6=97=A5 10:01, Lu.Jiang =E5=86=
=99=E9=81=93:
> >>>>>=E5=9C=A8 2018=E5=B9=B408=E6=9C=8831=E6=97=A5 21:52, Tom Rini =E5=86=
=99=E9=81=93:
> >>>>>>On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:
> >>>>>>
> >>>>>>>When there is no useful efi in $kerneldir, try copy
> >>>>>>>all efi from EFI/BOOT into boot image.
> >>>>>>>
> >>>>>>>Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> >>>>>>>---
> >>>>>>> =C2=A0 .../wic/files/wic/plugins/source/bootimg-efi.py | 12 +++++=
+++++++
> >>>>>>> =C2=A0 1 file changed, 12 insertions(+)
> >>>>>>>
> >>>>>>>diff --git
> >>>>>>>a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>>>>>b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>>>>>index 0eb86a0..d435268 100644
> >>>>>>>--- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-ef=
i.py
> >>>>>>>+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-ef=
i.py
> >>>>>>>@@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else:
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise WicError("unrecognized bootim=
g-efi loader: %s"
> >>>>>>>%
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source_params['loade=
r'])
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 os.listdir("%s/EFI/BOOT/" % hdddir)
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 found_efi =3D False
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if x.endswith(".efi"):
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_efi =3D True
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if not found_efi:
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp_cmd =3D "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" %
> >>>>>>>(kernel_dir, hdddir)
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_cmd(cp_cmd, True)
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 except:
> >>>>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Key=
Error:
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 raise WicError("bootimg-efi requires a loader, none
> >>>>>>>specified")
> >>>>>>I'm not sure this is the right approach.=C2=A0 If you don't have th=
ings set
> >>>>>>up for automagic finding you should use bootimg-partition and
> >>>>>>IMAGE_BOOT_FILES.=C2=A0 I'm doing this right now for some EFI proje=
cts
> >>>>>>because it's also bad form to dump everything into EFI/BOOT and some
> >>>>>>things should end up in EFI/vendorname or similar.
> >>>>>>
> >>>>Hi Tom,
> >>>>
> >>>>By indicating IMAGE_BOOT_FILES for bootimg-partition, can perform cop=
y file
> >>>>work. While we still need the code in bootimg-efi to re-generate grub=
=2Ecfg.
> >>>>
> >>>>I prefer use bootimg-efi for this case, but we can add a new paramete=
r to
> >>>>distinguish kernel dir & bootloader dir(for efi files)
> >>>I'm still not seeing why we need this, sorry.
> >>>
> >>>If we need files in the ESP in EFI/BOOT/ then in our root filesystem
> >>>they're already in as /boot/efi/EFI/BOOT and we say that we populate
> >>>things from /boot/efi and this also gets us things like
> >>>/boot/efi/EFI/vendor and so forth populated and matches other Linux
> >>>distributions.
> >>>
> >>>If we need something more complex, we have IMAGE_BOOT_FILES available
> >>>and can and should be populating the deploy directory like other
> >>>architectures and loaders do.
> >>>
> >>bootimg-efi performed following for grub boot partition:
> >>
> >>1.copy grub-efi-* from $KERNEL_DIR into $/boot/EFI/BOOT/
> >>
> >>2.copy bzImage from $KERNEL_DIR into $/boot/
> >>
> >>3.generate grub.cfg based select booting device.
> >>
> >>On target system, if we select booting device from running system as so=
urce
> >>for booting-efi will meet issue. Because the *.efi & bzImage is not in =
the
> >>same directory.
> >>
> >>As you suggested, we may invoke booting-partition by feeding
> >>$IMAGE_BOOT_FILES to indicating file need copy, this could done work 1 =
& 2.
> >>While we still need generated grub.cfg.
> >One of the great strengths of wic is that it can cover a lot of
> >different fairly complex use cases automatically, and still provide an
> >expert "out" for when you're doing something fairly different but still
> >want to leverage wic.  While I don't understand the use case of turning
> >a live system into a wic image, it sounds like what you're looking for
> >is the case of "and we provide our own loader config file".  You should
> >be including grub.cfg into the IMAGE_BOOT_FILES list and generate this
> >however you need it.  Since you've already booted you should already
> >have a correct EFI/ directory to look at (we ought to stop having
> >top-level bzImage, that's not right, but that's orthogonal to this
> >thread).
>=20
> The grub.cfg is generated in bootimg-efi.py. At least, it need include the
> new generated uuid info for rootfs partition.

Or, you generate the grub.cfg outside of wic and tell wic what newly
generated UUIDs to use, and just use bootimg-partition.py and
IMAGE_BOOT_FILES.

> So we still need a piece of code from bootimg-efi.py to generate grub.cfg=
 at
> runtime.
>=20
> The issue this patch try to fix is bootimg-efi assume bzImage & grub-*.efi
> located at top level of $KERNEL_DIR.

(aside, OE $DEPLOY_DIR_IMAGE becomes do_prepare_partition() kernel_dir)
Yes, this particular bit of code very much assumes an OE environment as
you don't normally see grub-efi-*.efi nor systemd-*.efi like that on the
system, and a real problem is that we don't package and ship those files
(I know for grub, I guess but didn't check systemd).

> This is true for bitbake's deploy dir. However, it didn't apply to target.
> We need provide a way for adding search path for *.efi.

I disagree that we need to because in this case you only need to because
the EFI binaries don't exist on the target in a normal way.

All of that said, perhaps a different way to look at this would be that
we could try doing both of:
- packaging and shipping grub-efi-*.efi (and systemd-boot equivalents)
- Similar to how plugins/imager/direct.py can fiddle with /etc/fstab add
  some option to fiddle the various known loader config files to whack
  'root=3DPARTUUID=3Dwell-formatted-uuid' to the new UUID.

Then you shouldn't need to generate a new grub.cfg and should be able to
use IMAGE_BOOT_FILES to map things to where you want them to go and
still get your grub.cfg file updated.

--=20
Tom

--d7Y+OVao7DrgM7NW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbj90JAAoJEIf59jXTHXZS3gYQAJhmQAOz6n73ouUX82gQEyi7
vyOEOPmcp0ZcoK6rpYT2OoEw5ND5XXLhOy8eNI0btIlIUl1JHR3fq98PWig2jqwH
cAr035BfLJOEU978yJsxbyX9a2Kx1+jDdWiRiCVFsi43Hd1z7A577MzItYAIvOqC
+M9D/ZrEcrHmDKeKof9xmkN0k5y3oH3Pkpt3fl0PROCvYbtMv168WhWxsqnrILM0
VhOgKYgPiLahMV5CtT+yNoUWLQ7JN1AUMVTbDTue6VJd3a8hNmVIBSvaTPz60VwH
CNBDaN2Czv2zbQrLdYOnr460cMqaxRPnnehrIBnw4e9/L0ty2LQ1w/T7mfXfAIdC
QyqP09P1aEp1PXrll/W0b6OLJ1d9k9H9uHmcRQhyg4RkNtX6tvdS7/rAaNIvrHkN
jd5opCYF0MhzTBIikFJGNtbmZlk0k2wQHxyGTVjm+WiyrWT3um3DXS60ndGyirlZ
cEBGwLiPoTzGDhBxwhHkJmmnwBAMuFwfQdmaqIx6jPWNZdP34hJPmDPPHjM2eFMo
X2zxPo7FNiubdNETOHfFkV34YKI8izBT3se8WxE0Ek+ea/YTo+TnaAV897jmmBFc
xI8fwxeX6IJd76CZJ69hFcP01WYXFs5s3/wC4BaB7H+LqO2kYDSgcwHSpKSYbokY
+JvGpr3fJiFe5BbDR0b5
=p1Cb
-----END PGP SIGNATURE-----

--d7Y+OVao7DrgM7NW--
