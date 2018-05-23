Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28C5460049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 07:20:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t11-v6so6105806wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 00:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y4Ia4PKynCmmH0X/sXJoZwpkYNUVThdPgIu9HcW0YLE=;
	b=Nxn9AEqKM0ev1ZnIv0K+wm2gKGFYRVNKkcK8Pjc67Co0pCzjkg4vWqXpuvLhTgLEac
	W+YB73Cgqz+bSG1EDxvyOgVGcq2BzmE5zZ9wkNw7bK4rFz2JufE4RrzeDwmqy2J+tD32
	teXwi6igvgZl9BxJbELp10lZMydwtrXCNfwhsVyCeZJmpxH7LTA5AxujJ+xNMypl5sVJ
	J2ZcXFEEfHo+DGv1Zy0ggi4pxXSqqPEu9UabnuQu9EfmSwPsAoHLDrI/4P7e+CXmnzQP
	1tnzStNIs653BgprSSBs6MkO1T7u+zfbPu9z1cScRmnTf3H3Iib3XMrl/R64oNq7wDmw
	xOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y4Ia4PKynCmmH0X/sXJoZwpkYNUVThdPgIu9HcW0YLE=;
	b=DMVGsUOE0e8lTFaH1dTIHJuRUuHx5DZutViWYvepe+22znrz6EvQRp55372marqXkH
	DVt1nGi2dMiOfowZivRns2cNwKA7VNUKKkXFf10hXJ8/DDlXcnk7vkA1+sNyDrTJ7YOq
	USZoibPtvBzGAdPjswigZ/IQwddmGV8BVg4uNOfJ+3OzIcLJAdd27dFu7kK4BpQLjMlt
	IyMsStqaXBVNt3/xm19voMGmNYW0W5aT5hYgZ3xk/PAJdYIm9YmFRvyq+F+g+zjBpkqj
	9dT2dyadOq/JWDNR+xhoviYx1e70qKnYym/ihWHsaPC0rTjF8s4icXWe3Hz4MXN2WcwL
	y64w==
X-Gm-Message-State: ALKqPwcXWiEZFwtSG+IYdupeEY1SbIsLC9+OJBPxfqPXDDvy9cKnMc1P
	DVEuLNhiVINtjSHNb+N3G76eB+MKUmCW49Oau8k=
X-Google-Smtp-Source: AB8JxZoFwXGiFoWI8n1CWPTyac1h3UQeeu1pG4+epg+acwbckyfNobt+JAU0PzXTQYC/DfX1EjLhwH/F17Jq23bLHLU=
X-Received: by 2002:a50:a550:: with SMTP id
	z16-v6mr5784362edb.103.1527060033182; 
	Wed, 23 May 2018 00:20:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:9d48:0:0:0:0:0 with HTTP; Wed, 23 May 2018 00:20:32
	-0700 (PDT)
In-Reply-To: <CAAQYJAvXD_ibA0vvqCotdcL3pUMuH=Rjhu=MwcYZ5Sw6kLEjsQ@mail.gmail.com>
References: <20180522082222.6608-1-andrej.valek@siemens.com>
	<CAAQYJAvXD_ibA0vvqCotdcL3pUMuH=Rjhu=MwcYZ5Sw6kLEjsQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 23 May 2018 09:20:32 +0200
Message-ID: <CAAQYJAuYU--=gJfij6CbrxLhzCETmCKAhfQG8hf+wWgMiv-6+g@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: 1.43.8 -> 1.44.2
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
X-List-Received-Date: Wed, 23 May 2018 07:20:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 1:01 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Tue, May 22, 2018 at 10:22 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
>> License-Update: The checksum of LIC_FILES_CHKSUM has been changed due to
>>  changed FSF address. The content of NOTICE has no change.
>>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |  2 +-
>>  ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 40 ----------------------
>>  ...fs-enable-the-metadata_csum-and-64bit-fea.patch | 36 -------------------
>>  .../{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb}   |  4 +--
>>  4 files changed, 2 insertions(+), 80 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
>>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
>>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb} (95%)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
>> index 81d90a134c..a54a11c354 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
>> @@ -9,7 +9,7 @@ LICENSE_e2fsprogs-mke2fs = "GPLv2"
>>  LICENSE_e2fsprogs-fsck = "GPLv2"
>>  LICENSE_e2fsprogs-tune2fs = "GPLv2"
>>  LICENSE_e2fsprogs-badblocks = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://NOTICE;md5=b48f21d765b875bd10400975d12c1ca2 \
>> +LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
>>                        file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
>>                        file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
>>                        file://lib/uuid/uuid.h.in;beginline=1;endline=32;md5=dbb8079e114a5f841934b99e59c8820a \
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
>> deleted file mode 100644
>> index ff1284edc4..0000000000
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -From ae6603206176b771c9ed1f82569f68fc1257f014 Mon Sep 17 00:00:00 2001
>> -From: Theodore Ts'o <tytso@mit.edu>
>> -Date: Wed, 3 Jan 2018 01:32:02 -0500
>> -Subject: [PATCH] libext2fs: fix build failure in swapfs.c on big-endian
>> - systems
>> -
>> -Addresses-Debian-Bug: #886119
>> -
>> -Reported-by: James Clarke <jrtc27@debian.org>
>> -Signed-off-by: Theodore Ts'o <tytso@mit.edu>
>> ----
>> -Upstream-Status: Backport
>> -
>> - lib/ext2fs/swapfs.c | 3 ++-
>> - 1 file changed, 2 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/lib/ext2fs/swapfs.c b/lib/ext2fs/swapfs.c
>> -index 6e5cff97..b13dc422 100644
>> ---- a/lib/ext2fs/swapfs.c
>> -+++ b/lib/ext2fs/swapfs.c
>> -@@ -19,6 +19,7 @@
>> -
>> - #include "ext2_fs.h"
>> - #include "ext2fs.h"
>> -+#include "ext2fsP.h"
>> - #include <ext2fs/ext2_ext_attr.h>
>> -
>> - #ifdef WORDS_BIGENDIAN
>> -@@ -358,7 +359,7 @@ void ext2fs_swap_inode_full(ext2_filsys fs, struct ext2_inode_large *t,
>> -       if (inode_includes(inode_size, i_projid))
>> -                 t->i_projid = ext2fs_swab16(f->i_projid);
>> -       /* catch new static fields added after i_projid */
>> --      EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
>> -+      EXT2FS_BUILD_BUG_ON(sizeof(struct ext2_inode_large) != 160);
>> -
>> -       i = sizeof(struct ext2_inode) + extra_isize + sizeof(__u32);
>> -       if (bufsize < (int) i)
>> ---
>> -2.16.1
>> -
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
>> deleted file mode 100644
>> index 38e1bdb3d8..0000000000
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 0a392baf1874964651115d9f77b0daa6851d1daa Mon Sep 17 00:00:00 2001
>> -From: Jonathan Liu <net147@gmail.com>
>> -Date: Tue, 1 Mar 2016 14:28:01 +1100
>> -Subject: [PATCH] Revert "mke2fs: enable the metadata_csum and 64bit features
>> - by default"
>> -
>> -This reverts commit cd27af3ecb83e8fd1e3eaa14994284a1818c7c15 as we
>> -don't want to enable features by default that are not supported by
>> -the latest stable e2fsprogs release.
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -Signed-off-by: Jonathan Liu <net147@gmail.com>
>> -
>> -Rebase to 1.43:
>> -The upstream has disabled metadata_csum by default
>> -this rebase just revert 64bit feature.
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ----
>> - misc/mke2fs.conf.in | 3 ++-
>> - 1 file changed, 2 insertions(+), 1 deletion(-)
>> -
>> -Index: git/misc/mke2fs.conf.in
>> -===================================================================
>> ---- git.orig/misc/mke2fs.conf.in
>> -+++ git/misc/mke2fs.conf.in
>> -@@ -11,8 +11,9 @@
>> -               features = has_journal
>> -       }
>> -       ext4 = {
>> --              features = has_journal,extent,huge_file,flex_bg,uninit_bg,64bit,dir_nlink,extra_isize
>> -+              features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
>> -               inode_size = 256
>> -+              auto_64-bit_support = 1
>> -       }
>> -       small = {
>> -               blocksize = 1024
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
>> similarity index 95%
>> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
>> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
>> index 989d47394b..ee27fd490d 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
>> @@ -3,17 +3,15 @@ require e2fsprogs.inc
>>  SRC_URI += "file://remove.ldconfig.call.patch \
>>              file://run-ptest \
>>              file://ptest.patch \
>> -            file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
>>              file://mkdir_p.patch \
>>              file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
>> -            file://0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch \
>>              "
>>
>>  SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
>>                                  file://quiet-debugfs.patch \
>>  "
>>
>> -SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
>> +SRCREV = "7b9ea51db3be8972c7a17de25be179b18fc9fcde"
>>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>>
>>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> Hi,
>
> I just got a warning from users of older kernels.
> There is a noteworthy change in 1.44  [1]  that can make ext4 mount
> fail under some circumstances.
>
> It supports now large_dir and large ext attrs and mkfs.ext4 -O ^64bit
> on newer kernels might
> do the trick.
>
> I could not test by myself yet but plan to do that soon.
>
> Cheers
> Andrea
>
> [1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.44.0


I could dig a bit more the issue and apparently is solved: in OE we
carry a patch which does exactly fix that [1]:
Otherwise "mkfs.ext4 /dev/sdc1 -O^metadata_csum" create is needed

Cheers
Andrea

[1] Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
 https://patchwork.openembedded.org/patch/125405/

