Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7033174CB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:08:05 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id d19-v6so5515462pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aDwamju3kv+rNLEl15NR9LHG0aIic3TeTLq3JVQTVo8=;
	b=TZnyAtyzStQBUDBqKOrCYkbbhAgr3NQONP/HnSOIB19qixjiGu37dh0Sa81wXJ8goz
	3uTz+GtszavKvOLW70laj2vF0B7VQoGoM5Y+u5gTO+ZlCqUCt78eMKFqAr3yFRg/G/0u
	FJtJQGsY38e4gG98p8TEYaOdkg+lrUajQsLPntA65LrV3UeNgM9pdOkzrd6KB1ynD4J3
	Dg8OwNmXyB+PINgqqxXT/HDHq5Np9Ap2MUvoHr/uRh986OJTmK9pIt8m4DcG2YopZNVO
	/RmyEoS+2FcsvWjmAjMPW8KFZitiwnsHO+Xd18vIiVrCrzzKTLLe03ReMyE2YOq/v8qQ
	jc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aDwamju3kv+rNLEl15NR9LHG0aIic3TeTLq3JVQTVo8=;
	b=BBYfJW5zZ73rtjixwX4RJavAul/sGapslusLOSlZlp/hlFY10BlRHAQQ2IJbkk9c4B
	r7gYl/M3Kh4zIl+5yKOA3hzkOnI+KFjcSxdMrObwExsf/6JBMNcT6s2smrAn9iAJK2oS
	1VRFrU4H6tSHBYCweK0LYumFqdi+k1sw3mnw+tdHpwZQHBE16WykdIcBWYrbmWstO+QV
	vcswWna4StFkIFxwmkKlhj9S2AyyEl3w4wpMQo5g0JIWWY457J9jE+VDQBdRhVsU9V8Q
	n94c/mQstTi+r2jzhUCF8eZ1tD/wQGrlNb+p8UGug+iqGboXbhqvnJ1cbids5R+WQwb/
	1bZw==
X-Gm-Message-State: APzg51AYgugq5dQzUOZJrBteclRt79ilTGFe7kp9KYPQZXqAlEnv+dgd
	zqqMC7oaZzmYvi4lo2Yz38nAR5y6dvXenBR20Es=
X-Google-Smtp-Source: ANB0Vdbh7CHpJ3PcGmZLbXDGw+ccPOT9/gDr2F4Pr5gp3p6JZZS6cf93r0V0ytih+bcHmSkaCYBoYWM6+4FQCNkyr6A=
X-Received: by 2002:a62:3ac8:: with SMTP id
	v69-v6mr15976192pfj.164.1535724486502; 
	Fri, 31 Aug 2018 07:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <1535618185-236305-1-git-send-email-mingli.yu@windriver.com>
	<5B88E0EA.9070107@windriver.com>
In-Reply-To: <5B88E0EA.9070107@windriver.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 31 Aug 2018 16:07:53 +0200
Message-ID: <CAAQYJAsXzHRXGoS=d_155-FLVRUoUG3Hw+PHB67Xmz_bExMODw@mail.gmail.com>
To: mingli.yu@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: fix for "Unhandled rela relocation: R_X86_64_PLT32" error
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
X-List-Received-Date: Fri, 31 Aug 2018 14:08:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 8:34 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Ping.
>
Hi,
FYI it is in master upstream as of  b9de21ef51a7 so you could just
upgrade the recipe.
Cheers
Andrea



> On 2018=E5=B9=B408=E6=9C=8830=E6=97=A5 16:36, mingli.yu@windriver.com wro=
te:
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > In response to a change in binutils, commit b21ebf2fb4c
> > (x86: Treat R_X86_64_PLT32 as R_X86_64_PC32) was applied to
> > the linux kernel during the 4.16 development cycle and has
> > since been backported to earlier stable kernel series. The
> > change results in the failure message as below when rebooting
> > via kexec.
> >   # kexec -l /boot/bzImage --append=3D"console=3DttyS0,115200 root=3D/d=
ev/sda1"
> >   Unhandled rela relocation: R_X86_64_PLT32
> >
> > Fix this by replicating the change in kexec.
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > ---
> >   ...or-Unhandled-rela-relocation-R_X86_64_PLT.patch | 41 +++++++++++++=
+++++++++
> >   meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb    |  1 +
> >   2 files changed, 42 insertions(+)
> >   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-f=
ix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
> >
> > diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-U=
nhandled-rela-relocation-R_X86_64_PLT.patch b/meta/recipes-kernel/kexec/kex=
ec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
> > new file mode 100644
> > index 0000000..e0cced5
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandle=
d-rela-relocation-R_X86_64_PLT.patch
> > @@ -0,0 +1,41 @@
> > +From b9de21ef51a7ceab7122a707c188602eae22c4ee Mon Sep 17 00:00:00 2001
> > +From: Chris Clayton <chris2553@googlemail.com>
> > +Date: Mon, 20 Aug 2018 12:00:31 +0100
> > +Subject: [PATCH] kexec: fix for "Unhandled rela relocation: R_X86_64_P=
LT32" error
> > +
> > +In response to a change in binutils, commit b21ebf2fb4c
> > +(x86: Treat R_X86_64_PLT32 as R_X86_64_PC32) was applied to
> > +the linux kernel during the 4.16 development cycle and has
> > +since been backported to earlier stable kernel series. The
> > +change results in the failure message in $SUBJECT when
> > +rebooting via kexec.
> > +
> > +Fix this by replicating the change in kexec.
> > +
> > +Upstream-Status: Backport[https://git.kernel.org/pub/scm/utils/kernel/=
kexec/kexec-tools.git/commit/?id=3Db9de21ef51a7ceab7122a707c188602eae22c4ee=
]
> > +
> > +Signed-off-by: Chris Clayton <chris2553@googlemail.com>
> > +Acked-by: Baoquan He <bhe@redhat.com>
> > +Tested-by: Bhupesh Sharma <bhsharma@redhat.com>
> > +Acked-by: Bhupesh Sharma <bhsharma@redhat.com>
> > +Signed-off-by: Simon Horman <horms@verge.net.au>
> > +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > +---
> > + kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86=
_64/kexec-elf-rel-x86_64.c
> > +index 7fdde73..db85b44 100644
> > +--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> > ++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> > +@@ -79,6 +79,7 @@ void machine_apply_elf_rel(struct mem_ehdr *UNUSED(e=
hdr),
> > +                     goto overflow;
> > +             break;
> > +     case R_X86_64_PC32:
> > ++    case R_X86_64_PLT32:
> > +             *(uint32_t *)location =3D value - address;
> > +             break;
> > +     default:
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb b/meta/rec=
ipes-kernel/kexec/kexec-tools_2.0.17.bb
> > index f4ec586..dd46901 100644
> > --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
> > +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
> > @@ -18,6 +18,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/k=
exec/kexec-tools-${PV}.tar.gz
> >              file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue=
.patch \
> >              file://kexec-x32.patch \
> >              file://0001-Disable-PIE-during-link.patch \
> > +           file://0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_6=
4_PLT.patch \
> >              "
> >
> >   SRC_URI[md5sum] =3D "8e071ca473694a71e4ae60ed7ef6f377"
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

