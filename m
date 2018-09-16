Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64ED3750FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 10:42:01 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id v18-v6so1902011vsl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DHT+9A8+MV1e7NrFWNEwuKZHW3neMBUZUYv7dc+aaW8=;
	b=Wtxy5/IEIGgXBVyzCgLT0lRgsHzjRWyStcFAZj8mA8OZK3ArcLNLFC2gzjEhSiX6Yi
	/Asye+fNfdsU2B6LYzSVPpIA/Odxq7k1Uib7YKqqSXg8K+FzA5I0Qg0p7DlRMsr+YdNa
	xBZaYVK6RUiDAip6Pigh6Nv3TaV+MAeqfyDnMWLPF0a+xwTG/bDNF3K/l52DISw2WynE
	E/Nf5Q3Bpa6oNDCeDRHUHF+V8Xml4BwmsxMrErtE4bEY+tpPoNfdXfxL8g9sSyeWE75z
	jESCoLdlBiywSzAD3nEotkn/fEP+ijGAX0V+HAe4iAMJHqRurf6gZpPnaThQ7DmD1ixR
	85+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DHT+9A8+MV1e7NrFWNEwuKZHW3neMBUZUYv7dc+aaW8=;
	b=QgRVaZ7GKCrY4sau3Z7OVS/uxljkVAKxp6rerob2PlmCsU7S7aZTfDZH0ooP5JxdzE
	yVNVZiwemmOs8TjVgEzJ6Vi5IkE5kEW5XXXZJ4cdNYVCXOdej27D+5YXqCt/ciyme/k0
	Dahggb0Rje6PtlGKfmHHouHaW1NTi3QrAp+v+zlBPFuxI0BLBwoR4qTuKLFiDNRxn3NF
	8muGz2wIrDrn/5qQuKJOYSUF7cWL2fAJ5XqQLbVENS02CAhY8LN2iuxlFt+4dmBG7Ng8
	MJMitAOfvhWAOrlBVWP9r+GejxGm/AKMiHz1bbnxAi0t9mFCZ2sWwAJiZxplvmLdA+Dv
	5grA==
X-Gm-Message-State: APzg51DWqaLUPlx3AkP1kwsg7sAHHlRkVPEGoQi9Dqwjq87APw2T8eVs
	2y6FMmHbPVj+oxVSGUMV+Y5RtnQCeLtB8UOoPNmHERVy
X-Google-Smtp-Source: ANB0Vdapdggtvzw3DGEfdmMjW0F6tWDSu674Un9WaLhWgxQh+coJCrbyAhi0d3SS8X6yc0yUo/VTK8oWyzQe9mW1QHc=
X-Received: by 2002:a67:3fca:: with SMTP id q71-v6mr6001961vsi.1.1537094521955;
	Sun, 16 Sep 2018 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
In-Reply-To: <AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Sep 2018 11:41:50 +0100
Message-ID: <CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
To: leon@sidebranch.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Sun, 16 Sep 2018 10:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leon

On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg <leon@sidebranch.com> wro=
te:
>
> Hi Alex,
>
> > On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> >> On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.com=
> wrote:
> >>
> >> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> >> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
> >> architecture (such as zImage). The kernel-fitimage.bbclass packs that
> >> image as sub-image in a flattened image tree image (fitImage) and
> >> deploys this fitImage along with the image tree source file (.its).
> >>
> >> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
> >> also contains "fitImage", which kernel.bbclass will also deploy
> >> redundantly with different naming.
> >>
> >> The result is a dual deployment with slightly different naming,
> >> each with a set of symlinks.
> >>
> >> The solution chosen is to have fitImage deployment be handled by
> >> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> >> types during deployment.
> >>
> >> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> >
> > This looks completely plausible, but the two "FIT" images that are
> > installed aren't identical... after this I end up with no FIT image
> > and only a bare image in the deploy dir.
>
> What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9CfitI=
mage=E2=80=9D??
>

Yes, in fact only fitImage (and no initramfs).

> > Digging into it, the logic between the two classes is a bit odd... in
> > the case of a non initramfs build, the fitImage is actually installed
> > here.
>
> If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say AL=
L versions of a FIT image containing AT LEAST a Linux kernel are installed =
by kernel-fitimage.
>
> > The one that's installed in kernel-fitimage is the bare
> > linux.bin, but named fitImage-...
>
> which is totally broken. If you want the bare kernel binary (which naming=
 depends on architecture, so it should NOT be hard-coded to linux.bin anywa=
y), you would need to specify that type *also* in KERNEL_IMAGETYPES, next t=
o =E2=80=9CfitImage=E2=80=9D.

Totally agree...

> >
> > I'll send a patch reverting this and removing the other one as I'd
> > agree that it appears to have no purpose (and if you did want it, I
> > guess you could list it in KERNEL_IMAGETYPES).
>
> I=E2=80=99m sorry I cannot follow what this and the other one is, and it.=
 Let=E2=80=99s first understand all cases correctly.
>

Sorry I've not described it well... the code in
kernel-fitimage.bbclass that inserts the kernel into the its happens
here http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel=
-fitimage.bbclass#n371

fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}=
"

inside fitimage_emit_section_kernel we create a kernel section which
has `data =3D /incbin/("${3}");` so linux.bin is our bare image.

Then we have the installation of fitImage-linux-bin that happens here
http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fiti=
mage.bbclass#n495

echo "Copying linux.bin file..."
install -m 0644 ${B}/linux.bin
${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}

i.e. the bare linux.bin file which we used to pack into the FIT image,
not a fitImage.

The output FIT image from kernel-fitimage.bbclass is created here
http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fiti=
mage.bbclass#n450

uboot-mkimage \
${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else =
''} \
  -f ${1} \
  arch/${ARCH}/boot/${2}

i.e. in arch/${ARCH}/boot/${2}

It's that image which is then picked up by kernel.bbclass to install
into deploydir (because KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"):

for imageType in ${KERNEL_IMAGETYPES} ; do
  # kernel-fitimage class deploys fitImages, skip here
  if [ "$imageType" !=3D "fitImage" ]; then
    base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
    install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
$deployDir/${base_name}.bin
  fi
done

Only it's doesn't because of the filter against fitImage.

> Regards, Leon
> >
> >> ---
> >> meta/classes/kernel.bbclass | 18 ++++++++++++------
> >> 1 file changed, 12 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index b57832c..1f69091 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -669,8 +669,11 @@ kernel_do_deploy() {
> >>        fi
> >>
> >>        for imageType in ${KERNEL_IMAGETYPES} ; do
> >> -               base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
> >> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $dep=
loyDir/${base_name}.bin
> >> +               # kernel-fitimage class deploys fitImages, skip here
> >> +               if [ "$imageType" !=3D "fitImage" ]; then
> >> +                       base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
> >> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageTy=
pe} $deployDir/${base_name}.bin
> >> +               fi
> >>        done
> >>        if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CON=
FIG_MODULES=3Dy$' .config); then
> >>                mkdir -p ${D}/lib
> >> @@ -687,10 +690,13 @@ kernel_do_deploy() {
> >>
> >>        if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
=3D x1 ]; then
> >>                for imageType in ${KERNEL_IMAGETYPES} ; do
> >> -                       initramfs_base_name=3D${imageType}-${INITRAMFS=
_NAME}
> >> -                       initramfs_symlink_name=3D${imageType}-${INITRA=
MFS_LINK_NAME}
> >> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageTy=
pe}.initramfs $deployDir/${initramfs_base_name}.bin
> >> -                       ln -sf ${initramfs_base_name}.bin $deployDir/$=
{initramfs_symlink_name}.bin
> >> +                       # kernel-fitimage class deploys fitImages, ski=
p here
> >> +                       if [ "$imageType" !=3D "fitImage" ]; then
> >> +                               initramfs_base_name=3D${imageType}-${I=
NITRAMFS_NAME}
> >> +                               initramfs_symlink_name=3D${imageType}-=
${INITRAMFS_LINK_NAME}
> >> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/$=
{imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> >> +                               ln -sf ${initramfs_base_name}.bin $dep=
loyDir/${initramfs_symlink_name}.bin
> >> +                       fi
> >>                done
> >>        fi
> >> }
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > Alex Kiernan



--=20
Alex Kiernan

