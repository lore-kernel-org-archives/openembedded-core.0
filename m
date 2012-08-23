Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1T4ayC-0000hs-1f
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 19:13:24 +0200
Received: by obc16 with SMTP id 16so2152342obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=W9NLKFWKyekfR/FuzqogH7whUutQQc9IZlnvYeJ+8JA=;
	b=y9TYATy1TKR3xSy/ETVcSi4M9MWJQzI5Xd7AE5Avxptt9jQrdMu/xj23EgD03X5vgi
	bjXtPauP8+VE1BKYPBP51CDQz10oN0G9hfBoVttomlVyG9FAfAumXSJOngf7o8H7PDlP
	e6hhN7jEbKBWYylGz9Kkm9zKSj25yqnz18zTYOhpw3TMCa5yOAcdRH9NSzeh0yEMz2zK
	pki+qjOSlPoS+/CsCr/sUBLCdKZO+6+dLKP93EFV+MiZpHRJfc9OsdmcGrWVb5qYn4uS
	LZsJ4izGr/Ya5/Klh+mIV5B7fJJ4K/fT1f4nfYZ9V5z6PYrIV6HrGnFx58amb2GzsiuH
	3H5g==
MIME-Version: 1.0
Received: by 10.50.212.98 with SMTP id nj2mr6637603igc.35.1345741275558; Thu,
	23 Aug 2012 10:01:15 -0700 (PDT)
Received: by 10.231.70.213 with HTTP; Thu, 23 Aug 2012 10:01:15 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1208222028250.26220@oneiric>
References: <alpine.DEB.2.02.1208222028250.26220@oneiric>
Date: Thu, 23 Aug 2012 13:01:15 -0400
Message-ID: <CAOd_LFw9gt0PEd+wbgXu0AB8f902XXGMt+7FsWh+Z2guEpNGUg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an image for the smallest feasible bootable system?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 17:13:24 -0000
Content-Type: multipart/alternative; boundary=14dae93404f1b0739b04c7f1ce68

--14dae93404f1b0739b04c7f1ce68
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 8:31 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>   for the purposes of demo'ing in a class, i'm interested in building
> the *really* minimal system that will boot to a shell prompt.  i've
> examined core-image-minimal but it seems pretty clear that there's
> stuff in that image that isn't, strictly speaking, essential.
>
>   anyone created an image file for a truly tiny bootable image?
> thanks.
>
> rday
>
>
# will be used for the update image
DESCRIPTION = "updater initramfs image"
LICENSE = "CLOSED"

LIC_FILES_CHKSUM =
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \

file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

#IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
${POKY_EXTRA_INSTALL}"

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""

export IMAGE_BASENAME = "updater-initramfs-image"
IMAGE_LINGUAS = ""

LICENSE = "MIT"

IMAGE_INSTALL = "\
    base-files \
    busybox \
    updater \
    mtd-utils \
    e2fsprogs \
    e2fsprogs-mke2fs \
    e2fsprogs-fsck \
    e2fsprogs-e2fsck \
    e2fsprogs-tune2fs \
    "

IMAGE_FSTYPES = "tar.gz cpio.gz"

# remove not needed ipkg informations
ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "

inherit image

-- 
=================
http://bec-systems.com

--14dae93404f1b0739b04c7f1ce68
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Aug 22, 2012 at 8:31 PM, Robert =
P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" ta=
rget=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
=A0 for the purposes of demo&#39;ing in a class, i&#39;m interested in buil=
ding<br>
the *really* minimal system that will boot to a shell prompt. =A0i&#39;ve<b=
r>
examined core-image-minimal but it seems pretty clear that there&#39;s<br>
stuff in that image that isn&#39;t, strictly speaking, essential.<br>
<br>
=A0 anyone created an image file for a truly tiny bootable image?<br>
thanks.<br>
<br>
rday<br>
<br></blockquote><div><br></div><div><div># will be used for the update ima=
ge</div><div>DESCRIPTION =3D &quot;updater initramfs image&quot;</div><div>=
LICENSE =3D &quot;CLOSED&quot;</div><div><br></div><div>LIC_FILES_CHKSUM =
=3D &quot;file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58=
 \</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://${COREBASE}/meta/COPYIN=
G.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420&quot;</div><div><br></div><div=
>#IMAGE_INSTALL =3D &quot;task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${PO=
KY_EXTRA_INSTALL}&quot;</div>
<div><br></div><div># Do not pollute the initrd image with rootfs features<=
/div><div>IMAGE_FEATURES =3D &quot;&quot;</div><div><br></div><div>export I=
MAGE_BASENAME =3D &quot;updater-initramfs-image&quot;</div><div>IMAGE_LINGU=
AS =3D &quot;&quot;</div>
<div><br></div><div>LICENSE =3D &quot;MIT&quot;</div><div><br></div><div>IM=
AGE_INSTALL =3D &quot;\</div><div>=A0 =A0 base-files \</div><div>=A0 =A0 bu=
sybox \</div><div>=A0 =A0 updater \</div><div>=A0 =A0 mtd-utils \</div><div=
>=A0 =A0 e2fsprogs \</div>
<div>=A0 =A0 e2fsprogs-mke2fs \</div><div>=A0 =A0 e2fsprogs-fsck \</div><di=
v>=A0 =A0 e2fsprogs-e2fsck \</div><div>=A0 =A0 e2fsprogs-tune2fs \</div><di=
v>=A0 =A0 &quot;</div><div><br></div><div>IMAGE_FSTYPES =3D &quot;tar.gz cp=
io.gz&quot;</div><div>
<br></div><div># remove not needed ipkg informations</div><div>ROOTFS_POSTP=
ROCESS_COMMAND +=3D &quot;remove_packaging_data_files ; &quot;</div><div><b=
r></div><div>inherit image</div></div><div><br></div></div>-- <br>=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"http://bec-systems.com" target=3D"_blank">http://bec-systems.com=
</a><br>

--14dae93404f1b0739b04c7f1ce68--
