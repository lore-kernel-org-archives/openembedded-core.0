Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D26DE71A9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 14:01:45 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g1-v6so22909702iob.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bSUkNwgO84+WFiwTAmwpWe03jRR1bZ+BEsSWTfJJvZA=;
	b=m91DkUETQwCEQPJes7VcPHsMOzMVRkqY8iDlTpkAdpaN4lCrk0QgEoa0OQdbnUNY7N
	7k0w6QyyZEe47jicZCD4EV25dg+qbopqVJ23ZSz3KoKYcLm0PHyxeE1Zmupnw18S1Be+
	VJFDNqgG2OKHMqXPYswfxrF0XlHDmZjTHzygp/U9PyiuJT2IoIXkFpfV1vDxReREPAuZ
	AmMCbfSoQB+ERfoFlXMf3SLx9DFuiZM/HgiOd4lD00k9OUZs5vxw1cxD6W0TrkrUUQPV
	TFSaPYlhogXGhXNZ6liEweq9Cl3kqeMzDXIET9AK2VCEKkbxfvnjYlzGXZWPfF+7AXTT
	dwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bSUkNwgO84+WFiwTAmwpWe03jRR1bZ+BEsSWTfJJvZA=;
	b=EEHnesOAEMa4T6ZHQq0SWz1mw26IOOxGgf+mWGzA9a58rwGB9y/VGJNkdpHDRhfDxQ
	jrYUGjzDFY6DlKqwo0qrR6cvrbYlvCKl+bCOR19al736s63L8Yw7XiRArtSr9xtkrAYA
	5svXxPXst8dIT5Aq5uA0IF3ai3WiHh5ZIcilsXjW1vCIcfR+loFcby7GlcsgRP2pdGcL
	ij7D/LtMUyk4Se4ffKpX6SzfJ8qfhPVmoZa8ZBu9zOmygMK2+uz0FTnrJ2TFnYyQQIV6
	2ipEoX1zIHmIAZPkK+WV3W1FRuLx9KeNRHzYAySxxXAepK3Wvw94qmh5yMwsat4WbXhw
	zwZQ==
X-Gm-Message-State: ALKqPwccu6ZJSqpWslR31Qg/ZGf09TyBIEBpx2zn8bU6svcfVLJ62Ork
	00rlGiL7pnk2bBT3pcc9adX8ZF9hCzw7yiuwDJqSKA==
X-Google-Smtp-Source: AB8JxZoMmBoHtYKMtv71i3O6UQ2UIUSqgqmn1u747iG5rOnuq4Uo5H2HE6HQOpBnwdIIeANpJCA8bIDtplaPOlRnh1c=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr2472202iok.270.1527084106147; 
	Wed, 23 May 2018 07:01:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP; Wed, 23 May 2018 07:01:25
	-0700 (PDT)
In-Reply-To: <20180517113837.24240-6-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
	<20180517113837.24240-6-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 May 2018 15:01:25 +0100
Message-ID: <CAJTo0LbBbLrwrDCegxwLknxCPV1JzP97OAoKQM6a1Q2BXEJRrA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/10] btrfs-tools: upgrade 4.15.1 -> 4.16.1
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
X-List-Received-Date: Wed, 23 May 2018 14:01:46 -0000
Content-Type: text/plain; charset="UTF-8"

Breaks with multilib and other setups with odd $libdir.

ERROR: btrfs-tools-4.16.1-r0 do_package: QA Issue: btrfs-tools:
Files/directories were installed but not shipped in any package:
  /usr/lib/python3.5/site-packages/btrfsutil.cpython-35m-x86_64-linux-gnu.so
  /usr/lib/python3.5/site-packages/btrfsutil-1.0.0-py3.5.egg-info
  /usr/lib/python3.5/site-packages/btrfsutil-1.0.0-py3.5.egg-info/dependency_links.txt
  /usr/lib/python3.5/site-packages/btrfsutil-1.0.0-py3.5.egg-info/top_level.txt
  /usr/lib/python3.5/site-packages/btrfsutil-1.0.0-py3.5.egg-info/PKG-INFO
  /usr/lib/python3.5/site-packages/btrfsutil-1.0.0-py3.5.egg-info/SOURCES.txt

Ross

On 17 May 2018 at 12:38, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Drop upstreamed patch.
>
> Add a patch to correctly set LDFLAGS for one of the libraries and Python bindings.
>
> Add dependencies to build Python bindings
> (directly inheriting setuptools3 class does not work,
> as the build is Makefile-managed) and a snippet to install them.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...DFLAGS-when-building-libbtrfsutil.so.patch | 35 ++++++++++
>  .../btrfs-tools/ftw-subdir-walk.patch         | 69 -------------------
>  ...-tools_4.15.1.bb => btrfs-tools_4.16.1.bb} | 12 ++--
>  3 files changed, 43 insertions(+), 73 deletions(-)
>  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
>  delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.15.1.bb => btrfs-tools_4.16.1.bb} (78%)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
> new file mode 100644
> index 00000000000..a8fcfc0f73c
> --- /dev/null
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
> @@ -0,0 +1,35 @@
> +From eecc48ecad359cd4fab650ce49cfe57e99d1859d Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 17 May 2018 12:21:31 +0300
> +Subject: [PATCH] Add LDFLAGS when building libbtrfsutil.so and python
> + bindings.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 10f0e3b0..1697794c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -402,7 +402,7 @@ libbtrfsutil/%.o: libbtrfsutil/%.c
> +
> + libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
> +       @echo "    [LD]     $@"
> +-      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) $(libbtrfsutil_objects) \
> ++      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) $(LDFLAGS) $(libbtrfsutil_objects) \
> +               -shared -Wl,-soname,libbtrfsutil.so.$(libbtrfsutil_major) -o $@
> +
> + libbtrfsutil.a: $(libbtrfsutil_objects)
> +@@ -417,7 +417,7 @@ ifeq ($(PYTHON_BINDINGS),1)
> + libbtrfsutil_python: libbtrfsutil.so.$(libbtrfsutil_major) libbtrfsutil.so libbtrfsutil/btrfsutil.h
> +       @echo "    [PY]     libbtrfsutil"
> +       $(Q)cd libbtrfsutil/python; \
> +-              CFLAGS= LDFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
> ++              CFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
> +
> + .PHONY: libbtrfsutil_python
> + endif
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
> deleted file mode 100644
> index fbe0c47849f..00000000000
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From patchwork Wed Mar 28 06:39:09 2018
> -Content-Type: text/plain; charset="utf-8"
> -MIME-Version: 1.0
> -Content-Transfer-Encoding: 7bit
> -Subject: btrfs-progs: mkfs/rootdir: Don't follow symbolic link when calcuating
> - size
> -From: Qu Wenruo <wqu@suse.com>
> -X-Patchwork-Id: 10312225
> -Message-Id: <20180328063909.937-1-wqu@suse.com>
> -To: linux-btrfs@vger.kernel.org
> -Date: Wed, 28 Mar 2018 14:39:09 +0800
> -
> -[BUG]
> -If we have a symbolic link in rootdir pointing to non-existing location,
> -mkfs.btrfs --rootdir will just fail:
> -------
> -$ mkfs.btrfs  -f --rootdir /tmp/rootdir/ /dev/data/btrfs
> -btrfs-progs v4.15.1
> -See http://btrfs.wiki.kernel.org for more information.
> -
> -ERROR: ftw subdir walk of /tmp/rootdir/ failed: No such file or directory
> -------
> -
> -[CAUSE]
> -Commit 599a0abed564 ("btrfs-progs: mkfs/rootdir: Use over-reserve method
> -to make size estimate easier") add extra ftw walk to estimate the
> -filesystem size.
> -
> -Such default ftw walk will follow symbolic link and gives ENOENT error.
> -
> -[FIX]
> -Use nftw() to specify FTW_PHYS so we won't follow symbolic link for size
> -calculation.
> -
> -Reported-by: Alexander Kanavin <alexander.kanavin@intel.com>
> -Fixes: 599a0abed564 ("btrfs-progs: mkfs/rootdir: Use over-reserve method to make size estimate easier")
> -Signed-off-by: Qu Wenruo <wqu@suse.com>
> -Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10312225/]
> ----
> - mkfs/rootdir.c | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
> -index a1d223a2408a..33c3ff1e18cf 100644
> ---- a/mkfs/rootdir.c
> -+++ b/mkfs/rootdir.c
> -@@ -696,7 +696,7 @@ out:
> - }
> -
> - static int ftw_add_entry_size(const char *fpath, const struct stat *st,
> --                            int type)
> -+                            int type, struct FTW *ftwbuf)
> - {
> -       /*
> -        * Failed to read the directory, mostly due to EPERM.  Abort ASAP, so
> -@@ -731,7 +731,12 @@ u64 btrfs_mkfs_size_dir(const char *dir_name, u32 sectorsize, u64 min_dev_size,
> -       fs_block_size = sectorsize;
> -       ftw_data_size = 0;
> -       ftw_meta_nr_inode = 0;
> --      ret = ftw(dir_name, ftw_add_entry_size, 10);
> -+
> -+      /*
> -+       * Symbolic link is not followed when creating files, so no need to
> -+       * follow them here.
> -+       */
> -+      ret = nftw(dir_name, ftw_add_entry_size, 10, FTW_PHYS);
> -       if (ret < 0) {
> -               error("ftw subdir walk of %s failed: %s", dir_name,
> -                       strerror(errno));
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb
> similarity index 78%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb
> index f7ea27321cf..18f11ba89e3 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.1.bb
> @@ -10,17 +10,17 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>  SECTION = "base"
> -DEPENDS = "util-linux attr e2fsprogs lzo acl"
> +DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
>  DEPENDS_append_class-target = " udev"
>  RDEPENDS_${PN} = "libgcc"
>
> -SRCREV = "3097f02c948f69f520c565ff8f8ba476aa6edb88"
> +SRCREV = "f7fc27cb20924cc340a2a522655969253dd97ae9"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Makefile-build-mktables-using-native-gcc.patch \
> -           file://ftw-subdir-walk.patch \
> +           file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
>             "
>
> -inherit autotools-brokensep pkgconfig manpages
> +inherit autotools-brokensep pkgconfig manpages distutils3-base
>
>  CLEANBROKEN = "1"
>
> @@ -36,4 +36,8 @@ do_configure_prepend() {
>
>  S = "${WORKDIR}/git"
>
> +do_install_append() {
> +    oe_runmake 'DESTDIR=${D}' install_python
> +}
> +
>  BBCLASSEXTEND = "native"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

