Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE8BC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:37:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.23785.1677681424018355896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=Q7F/m5OH;
 spf=pass (domain: inovex.de, ip: 209.85.208.49, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ed1-f49.google.com with SMTP id eg37so54481723edb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TPhKHE+JJJ0WxmsPkd3m78ur469JnUrdu3BLUI07dyY=;
        b=Q7F/m5OHftRaB6NFdq2sRtHVwwWsSpTklC72mJgS5ryfEdo8dDFlgJJUWoy2wwlA/P
         OpqEO/CSp6iBt252mX65PY4t35JUe/1E1d+/xjUaXCiXui5W/ZJvye86oxJMxR0WBQ7Q
         Ez4jIWk7HlOtNIzpdBGHnYi67EQzFtZePF3a2bRatrwiFkN8tr3i1jBHx0RKhrxWuu58
         qrOaSeJ5qiFeqtZbdtUrZAYKk9oiEqCs2uQpgtMLeMLS54vgcXQqFqpMEDELgGXruU89
         8IBRkP5dQLJFhTXoUwkD7oW6yQJudFCulDLrx3Wq4W7WGQ3UULR7dLwICUy6h3K/Hp9f
         XrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPhKHE+JJJ0WxmsPkd3m78ur469JnUrdu3BLUI07dyY=;
        b=c1jWPdr70tJbv13MoQdfxxE3NDH5yENgWWWm4IENIYbGRE5VFZMKTcMS413ipcqKrR
         d+dE5bbEK1nMwCGY5/UJwXdpq8bLGbtKI1wU9kI06s/3lSODAdp/i2PBtjSx7zfryJip
         Wy4zedDUn/xPSXuaNlAyL/YADbthj4NVDIIPH54o3OIW5T2bR4WLFlCoJ+syXjQlTXFr
         cEg8qY1YsHUtZsPeUEAV2PrlHPRULsew4WQT/LJP3n0EjB6vUGjRdAw7sV4rcMYyTN0M
         l5l/rBeYrjN3q9PX2JFSMTIt7ETp7Vi89J+6rKYO5LBBhaAqUsD2KVLn4y4UWeDoX6AC
         Smkg==
X-Gm-Message-State: AO0yUKUE0lSSpbVqTUdYeFc36Q2Oy/OCHyIwJYvoXP8On5XoM95vUG9J
	dd7tVvmS12W9BCmuy0rJ0y8alYCWZyaqw0DoWIfvfA==
X-Google-Smtp-Source: AK7set8OtFRTAgZNFtiWVg9VUzwCinB68J32PP1M97J7mT6DQPn0dgY1k4sSWbSAgQBh6nd/DoIWuDUjdPt3HTZvTQQ=
X-Received: by 2002:a17:906:274b:b0:8f0:147b:be2 with SMTP id
 a11-20020a170906274b00b008f0147b0be2mr3169944ejd.4.1677681422239; Wed, 01 Mar
 2023 06:37:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
 <Y/4b0dLAaxLcHKSc@mail.local>
In-Reply-To: <Y/4b0dLAaxLcHKSc@mail.local>
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
Date: Wed, 1 Mar 2023 15:36:51 +0100
Message-ID: <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs plugin
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000038221f05f5d7a50b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177888

--00000000000038221f05f5d7a50b
Content-Type: text/plain; charset="UTF-8"

Hi,

took me a while to reproduce the failure locally.
It's because meta-oe and meta-filesystems are not as default included in
the bblayers.conf used for oe-selftest.

I don't want to touch bblayers and I think this is not intended as it would
be the same for e.g. erofs for which no test case was added.
Alexander Kanavin pointed me on the poky mailing list to these tests and in
fact, it's good to have them in general.
So what's the preferred way for oe-core?
Leave the tests and add the dependencies (for the specific tests) or just
remove the test cases?

-- Anna




Am Di., 28. Feb. 2023 um 16:20 Uhr schrieb Alexandre Belloni <
alexandre.belloni@bootlin.com>:

> Hello,
>
> this failed on the autobuilders:
>
> ERROR: Nothing PROVIDES 'f2fs-tools-native' (but
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/
> core-image-sato.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/
> core-image-sato-sdk.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-minimal.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-minimal-dev.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-ptest-all.bb DEPENDS on or otherwise requires it). Close
> matches:
>   btrfs-tools-native
>   dosfstools-native
>   spirv-tools-native
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/steps/11/logs/stdio
>
> On 28/02/2023 16:00:58+0100, Anna-Lena Marx via lists.openembedded.org
> wrote:
> > Building F2FS rootfs is supported in Yocto/OpenEmbedded -
> > see image_types.bbclass, but not in WIC.
> > This adds it as a nice convenience feature.
> >
> > F2FS needs a minimum size of ~500M to operate correctly due to
> > an overprovision functionality.
> >
> > Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass |  2 +-
> >  meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
> >  meta/recipes-core/meta/wic-tools.bb         |  2 +-
> >  scripts/lib/wic/help.py                     |  1 +
> >  scripts/lib/wic/ksparser.py                 |  2 +-
> >  scripts/lib/wic/misc.py                     |  1 +
> >  scripts/lib/wic/partition.py                | 32 ++++++++++++++++++++-
> >  7 files changed, 38 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> > index c339b9bdfb..8ae5ecca4d 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] += "do_deploy"
> >  do_image_wic[deptask] += "do_image_complete"
> >
> >  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [
> 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> > -WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native
> btrfs-tools-native squashfs-tools-native e2fsprogs-native
> erofs-utils-native"
> > +WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native
> btrfs-tools-native squashfs-tools-native e2fsprogs-native
> erofs-utils-native f2fs-tools-native"
> >  # Unified kernel images need objcopy
> >  WKS_FILE_DEPENDS_DEFAULT +=
> "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
> >  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> > index ca1abb970a..5e255e35c7 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):
> >          with NamedTemporaryFile("w", suffix=".wks") as wks:
> >              wks.writelines(['part ext2   --fstype ext2     --source
> rootfs\n',
> >                              'part btrfs  --fstype btrfs    --source
> rootfs --size 40M\n',
> > +                            'part f2fs   --fstype f2fs     --source
> rootfs --size 50M\n',
> >                              'part squash --fstype squashfs --source
> rootfs\n',
> >                              'part swap   --fstype swap --size 1M\n',
> >                              'part emptyvfat   --fstype vfat   --size
> 1M\n',
> > @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):
> >              wks.writelines(
> >                  ['part ext2   --fstype ext2     --source rootfs
> --mkfs-extraopts "-D -F -i 8192"\n',
> >                   "part btrfs  --fstype btrfs    --source rootfs --size
> 40M --mkfs-extraopts='--quiet'\n",
> > +                 "part f2fs   --fstype f2fs     --source rootfs --size
> 50M --mkfs-extraopts='-O extra_attr -o 20'\n",
> >                   'part squash --fstype squashfs --source rootfs
> --mkfs-extraopts "-no-sparse -b 4096"\n',
> >                   'part emptyvfat   --fstype vfat   --size 1M
> --mkfs-extraopts "-S 1024 -s 64"\n',
> >                   'part emptymsdos  --fstype msdos  --size 1M
> --mkfs-extraopts "-S 1024 -s 64"\n',
> > diff --git a/meta/recipes-core/meta/wic-tools.bb
> b/meta/recipes-core/meta/wic-tools.bb
> > index 9282d36a4d..d30ce66b56 100644
> > --- a/meta/recipes-core/meta/wic-tools.bb
> > +++ b/meta/recipes-core/meta/wic-tools.bb
> > @@ -7,7 +7,7 @@ DEPENDS = "\
> >             mtools-native bmap-tools-native grub-native cdrtools-native \
> >             btrfs-tools-native squashfs-tools-native pseudo-native \
> >             e2fsprogs-native util-linux-native tar-native
> erofs-utils-native \
> > -           virtual/${TARGET_PREFIX}binutils \
> > +           f2fs-tools-native virtual/${TARGET_PREFIX}binutils \
> >             "
> >  DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
> >  DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi
> systemd-boot"
> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > index 73e3380cde..0094065931 100644
> > --- a/scripts/lib/wic/help.py
> > +++ b/scripts/lib/wic/help.py
> > @@ -931,6 +931,7 @@ DESCRIPTION
> >               btrfs
> >               squashfs
> >               erofs
> > +             f2fs
> >               swap
> >
> >           --fsoptions: Specifies a free-form string of options to be
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index d1e546b12d..e10ce6581d 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -159,7 +159,7 @@ class KickStart():
> >          part.add_argument('--fstype', default='vfat',
> >                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
> >                                     'squashfs', 'vfat', 'msdos', 'erofs',
> > -                                   'swap', 'none'))
> > +                                   'f2fs', 'swap', 'none'))
> >          part.add_argument('--mkfs-extraopts', default='')
> >          part.add_argument('--label')
> >          part.add_argument('--use-label', action='store_true')
> > diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> > index 2b90821b30..dc84a37423 100644
> > --- a/scripts/lib/wic/misc.py
> > +++ b/scripts/lib/wic/misc.py
> > @@ -41,6 +41,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
> >                    "mkfs.ext3": "e2fsprogs",
> >                    "mkfs.ext4": "e2fsprogs",
> >                    "mkfs.vfat": "dosfstools",
> > +                  "mkfs.f2fs": "f2fs-tools",
> >                    "mksquashfs": "squashfs-tools",
> >                    "mkswap": "util-linux",
> >                    "mmd": "mtools",
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index 382afa44bc..6adcaa041f 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -208,7 +208,7 @@ class Partition():
> >          Prepare content for a rootfs partition i.e. create a partition
> >          and fill it from a /rootfs dir.
> >
> > -        Currently handles ext2/3/4, btrfs, vfat and squashfs.
> > +        Currently handles ext2/3/4, btrfs, vfat, squashfs and f2fs.
> >          """
> >
> >          rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
> > @@ -351,6 +351,36 @@ class Partition():
> >               self.mkfs_extraopts, self.fsuuid, rootfs)
> >          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
> >
> > +    def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
> > +                            native_sysroot, pseudo):
> > +        """
> > +        Prepare content for a f2fs rootfs partition.
> > +        """
> > +        du_cmd = "du -ks %s" % rootfs_dir
> > +        out = exec_cmd(du_cmd)
> > +        actual_rootfs_size = int(out.split()[0])
> > +
> > +        min_f2fs_size = 524288
> > +        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
> > +        if rootfs_size < min_f2fs_size:
> > +            rootfs_size = min_f2fs_size
> > +
> > +        with open(rootfs, 'w') as sparse:
> > +            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> > +
> > +        extraopts = self.mkfs_extraopts or "-O extra_attr,compression"
> > +
> > +        label_str = ""
> > +        if self.label:
> > +            label_str = "-l %s" % self.label
> > +
> > +        mkfs_f2fs_cmd = "mkfs.f2fs %s %s %s" % \
> > +                        (label_str, extraopts, rootfs)
> > +        exec_native_cmd(mkfs_f2fs_cmd, native_sysroot, pseudo=pseudo)
> > +
> > +        sload_f2fs_cmd = "sload.f2fs -f %s %s" % (rootfs_dir, rootfs)
> > +        exec_native_cmd(sload_f2fs_cmd, native_sysroot, pseudo=pseudo)
> > +
> >      def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
> >                               native_sysroot, pseudo):
> >          """
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177839):
> https://lists.openembedded.org/g/openembedded-core/message/177839
> > Mute This Topic: https://lists.openembedded.org/mt/97291696/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000038221f05f5d7a50b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>took me a while to reproduce t=
he failure locally.<br>It&#39;s because meta-oe and meta-filesystems are no=
t as default included in the bblayers.conf used for oe-selftest.<br><br>I d=
on&#39;t want to touch bblayers and I think this is not intended as it woul=
d be the same for e.g. erofs for which no test case was added.<br>Alexander=
 Kanavin pointed me on the poky mailing list to these tests and in fact, it=
&#39;s good to have them in general.<br>So what&#39;s the preferred way for=
 oe-core?<br>Leave the tests and add the dependencies (for the specific tes=
ts) or just remove the test cases?<br><div><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><div><br></div><div>-- Anna</div><pre cols=3D"72"><br>=
</pre></div></div></div></div></div></div></div><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 28. Feb. 2023 u=
m 16:20=C2=A0Uhr schrieb Alexandre Belloni &lt;<a href=3D"mailto:alexandre.=
belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this failed on the autobuilders:<br>
<br>
ERROR: Nothing PROVIDES &#39;f2fs-tools-native&#39; (but /home/pokybuild/yo=
cto-worker/beaglebone/build/meta/recipes-sato/images/<a href=3D"http://core=
-image-sato.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato.bb</a>=
, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/<a=
 href=3D"http://core-image-sato-sdk.bb" rel=3D"noreferrer" target=3D"_blank=
">core-image-sato-sdk.bb</a>, /home/pokybuild/yocto-worker/beaglebone/build=
/meta/recipes-core/images/<a href=3D"http://core-image-minimal.bb" rel=3D"n=
oreferrer" target=3D"_blank">core-image-minimal.bb</a>, /home/pokybuild/yoc=
to-worker/beaglebone/build/meta/recipes-core/images/<a href=3D"http://core-=
image-minimal-dev.bb" rel=3D"noreferrer" target=3D"_blank">core-image-minim=
al-dev.bb</a>, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-c=
ore/images/<a href=3D"http://core-image-ptest-all.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">core-image-ptest-all.bb</a> DEPENDS on or otherwise require=
s it). Close matches:<br>
=C2=A0 btrfs-tools-native<br>
=C2=A0 dosfstools-native<br>
=C2=A0 spirv-tools-native<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/6790/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/steps/11/logs/=
stdio</a><br>
<br>
On 28/02/2023 16:00:58+0100, Anna-Lena Marx via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt; Building F2FS rootfs is supported in Yocto/OpenEmbedded - <br>
&gt; see image_types.bbclass, but not in WIC.<br>
&gt; This adds it as a nice convenience feature.<br>
&gt; <br>
&gt; F2FS needs a minimum size of ~500M to operate correctly due to<br>
&gt; an overprovision functionality.<br>
&gt; <br>
&gt; Signed-off-by: Anna-Lena Marx &lt;<a href=3D"mailto:anna-lena.marx@ino=
vex.de" target=3D"_blank">anna-lena.marx@inovex.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/image_types_wic.bbclass |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" rel=3D"no=
referrer" target=3D"_blank">wic-tools.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 scripts/lib/wic/ksparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 scripts/lib/wic/misc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 32 ++++++++++++++++++++-<br>
&gt;=C2=A0 7 files changed, 38 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classe=
s-recipe/image_types_wic.bbclass<br>
&gt; index c339b9bdfb..8ae5ecca4d 100644<br>
&gt; --- a/meta/classes-recipe/image_types_wic.bbclass<br>
&gt; +++ b/meta/classes-recipe/image_types_wic.bbclass<br>
&gt; @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] +=3D &quot;do_deploy&quot;=
<br>
&gt;=C2=A0 do_image_wic[deptask] +=3D &quot;do_image_complete&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 WKS_FILE_DEPENDS_DEFAULT =3D &#39;${@bb.utils.contains_any(&quot=
;BUILD_ARCH&quot;, [ &#39;x86_64&#39;, &#39;i686&#39; ], &quot;syslinux-nat=
ive&quot;, &quot;&quot;,d)}&#39;<br>
&gt; -WKS_FILE_DEPENDS_DEFAULT +=3D &quot;bmap-tools-native cdrtools-native=
 btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-nati=
ve&quot;<br>
&gt; +WKS_FILE_DEPENDS_DEFAULT +=3D &quot;bmap-tools-native cdrtools-native=
 btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-nati=
ve f2fs-tools-native&quot;<br>
&gt;=C2=A0 # Unified kernel images need objcopy<br>
&gt;=C2=A0 WKS_FILE_DEPENDS_DEFAULT +=3D &quot;virtual/${MLPREFIX}${TARGET_=
PREFIX}binutils&quot;<br>
&gt;=C2=A0 WKS_FILE_DEPENDS_BOOTLOADERS =3D &quot;&quot;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selft=
est/cases/wic.py<br>
&gt; index ca1abb970a..5e255e35c7 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with NamedTemporaryFile(&quot;w&quot=
;, suffix=3D&quot;.wks&quot;) as wks:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writelines([&#39;p=
art ext2=C2=A0 =C2=A0--fstype ext2=C2=A0 =C2=A0 =C2=A0--source rootfs\n&#39=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part btrfs=C2=A0 --fstype btrfs=C2=
=A0 =C2=A0 --source rootfs --size 40M\n&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part f2fs=C2=A0 =C2=A0--fstype f2fs=C2=A0=
 =C2=A0 =C2=A0--source rootfs --size 50M\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part squash --fstype squashfs --sou=
rce rootfs\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part swap=C2=A0 =C2=A0--fstype swap=
 --size 1M\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part emptyvfat=C2=A0 =C2=A0--fstype=
 vfat=C2=A0 =C2=A0--size 1M\n&#39;,<br>
&gt; @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writelines(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;pa=
rt ext2=C2=A0 =C2=A0--fstype ext2=C2=A0 =C2=A0 =C2=A0--source rootfs --mkfs=
-extraopts &quot;-D -F -i 8192&quot;\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;part btrfs=C2=A0 --fstype btrfs=C2=A0 =C2=A0 --source rootfs --size 40M=
 --mkfs-extraopts=3D&#39;--quiet&#39;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;p=
art f2fs=C2=A0 =C2=A0--fstype f2fs=C2=A0 =C2=A0 =C2=A0--source rootfs --siz=
e 50M --mkfs-extraopts=3D&#39;-O extra_attr -o 20&#39;\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;part squash --fstype squashfs --source rootfs --mkfs-extraopts &quot;-no=
-sparse -b 4096&quot;\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;part emptyvfat=C2=A0 =C2=A0--fstype vfat=C2=A0 =C2=A0--size 1M --mkfs-ex=
traopts &quot;-S 1024 -s 64&quot;\n&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;part emptymsdos=C2=A0 --fstype msdos=C2=A0 --size 1M --mkfs-extraopts &q=
uot;-S 1024 -s 64&quot;\n&#39;,<br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" re=
l=3D"noreferrer" target=3D"_blank">wic-tools.bb</a> b/meta/recipes-core/met=
a/<a href=3D"http://wic-tools.bb" rel=3D"noreferrer" target=3D"_blank">wic-=
tools.bb</a><br>
&gt; index 9282d36a4d..d30ce66b56 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" rel=3D"no=
referrer" target=3D"_blank">wic-tools.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" rel=3D"no=
referrer" target=3D"_blank">wic-tools.bb</a><br>
&gt; @@ -7,7 +7,7 @@ DEPENDS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtools-native bmap-tool=
s-native grub-native cdrtools-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btrfs-tools-native squa=
shfs-tools-native pseudo-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e2fsprogs-native util-l=
inux-native tar-native erofs-utils-native \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/${TARGET_PREFIX}binu=
tils \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f2fs-tools-native virtual/${=
TARGET_PREFIX}binutils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 DEPENDS:append:x86 =3D &quot; syslinux-native syslinux grub-efi =
systemd-boot&quot;<br>
&gt;=C2=A0 DEPENDS:append:x86-64 =3D &quot; syslinux-native syslinux grub-e=
fi systemd-boot&quot;<br>
&gt; diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py<br>
&gt; index 73e3380cde..0094065931 100644<br>
&gt; --- a/scripts/lib/wic/help.py<br>
&gt; +++ b/scripts/lib/wic/help.py<br>
&gt; @@ -931,6 +931,7 @@ DESCRIPTION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btrfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0squashfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0erofs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f2fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swap<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--fsoptions: Specifies a free-=
form string of options to be<br>
&gt; diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py=
<br>
&gt; index d1e546b12d..e10ce6581d 100644<br>
&gt; --- a/scripts/lib/wic/ksparser.py<br>
&gt; +++ b/scripts/lib/wic/ksparser.py<br>
&gt; @@ -159,7 +159,7 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--fstype&#39;=
, default=3D&#39;vfat&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 choices=3D(&#39;ext2&#39;, &#39;ext3&#39;, &#39=
;ext4&#39;, &#39;btrfs&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;squashfs=
&#39;, &#39;vfat&#39;, &#39;msdos&#39;, &#39;erofs&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;swap&#39;, &#3=
9;none&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;f2fs&#39;, &#3=
9;swap&#39;, &#39;none&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--mkfs-extrao=
pts&#39;, default=3D&#39;&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--label&#39;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--use-label&#=
39;, action=3D&#39;store_true&#39;)<br>
&gt; diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py<br>
&gt; index 2b90821b30..dc84a37423 100644<br>
&gt; --- a/scripts/lib/wic/misc.py<br>
&gt; +++ b/scripts/lib/wic/misc.py<br>
&gt; @@ -41,6 +41,7 @@ NATIVE_RECIPES =3D {&quot;bmaptool&quot;: &quot;bmap=
-tools&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mkfs.ext3&quot;: &quot;e2fsprogs&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mkfs.ext4&quot;: &quot;e2fsprogs&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mkfs.vfat&quot;: &quot;dosfstools&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
mkfs.f2fs&quot;: &quot;f2fs-tools&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mksquashfs&quot;: &quot;squashfs-tools&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mkswap&quot;: &quot;util-linux&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;mmd&quot;: &quot;mtools&quot;,<br>
&gt; diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.=
py<br>
&gt; index 382afa44bc..6adcaa041f 100644<br>
&gt; --- a/scripts/lib/wic/partition.py<br>
&gt; +++ b/scripts/lib/wic/partition.py<br>
&gt; @@ -208,7 +208,7 @@ class Partition():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare content for a rootfs partiti=
on i.e. create a partition<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and fill it from a /rootfs dir.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Currently handles ext2/3/4, btrfs, vfat a=
nd squashfs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Currently handles ext2/3/4, btrfs, vfat, =
squashfs and f2fs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs =3D &quot;%s/rootfs_%s.%s.%s&=
quot; % (cr_workdir, self.label,<br>
&gt; @@ -351,6 +351,36 @@ class Partition():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mkfs_extrao=
pts, self.fsuuid, rootfs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(mkfs_cmd, native_sys=
root, pseudo=3Dpseudo)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_bu=
ilddir, rootfs_dir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, pseudo):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare content for a f2fs rootfs partiti=
on.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 du_cmd =3D &quot;du -ks %s&quot; % rootfs=
_dir<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D exec_cmd(du_cmd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_rootfs_size =3D int(out.split()[0]=
)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 min_f2fs_size =3D 524288<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_size =3D self.get_rootfs_size(actu=
al_rootfs_size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rootfs_size &lt; min_f2fs_size:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_size =3D min_f2fs_si=
ze<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(rootfs, &#39;w&#39;) as sparse:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.ftruncate(sparse.fileno(=
), rootfs_size * 1024)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &quo=
t;-O extra_attr,compression&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 label_str =3D &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.label:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label_str =3D &quot;-l %s&q=
uot; % self.label<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfs_f2fs_cmd =3D &quot;mkfs.f2fs %s %s %=
s&quot; % \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (label_str, extraopts, rootfs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(mkfs_f2fs_cmd, native_sys=
root, pseudo=3Dpseudo)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sload_f2fs_cmd =3D &quot;sload.f2fs -f %s=
 %s&quot; % (rootfs_dir, rootfs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(sload_f2fs_cmd, native_sy=
sroot, pseudo=3Dpseudo)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def prepare_rootfs_msdos(self, rootfs, cr_workdir,=
 oe_builddir, rootfs_dir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot, pseudo):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#177839): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/177839" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/177839</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97291696=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97291696/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000038221f05f5d7a50b--

