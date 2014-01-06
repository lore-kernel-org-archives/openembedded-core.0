Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF026B7E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 13:05:57 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a1so15809764wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 05:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Ro6Wc8uidXC0lxD5puI8SnuIEiDn4MDwCXRooPo6c24=;
	b=N9UW5TFVfxG+GQ/bRWE4lon+1BEAmSPCM7S/r6OF/Yp7lIjs5T1th15Y4F/FU2aYUZ
	8v8R40LwVkHC73FiCZcOkKN059wJCRRyanZ03ezXZFhbYzKJuh7j1eHjNN8xRvBNrh+9
	m7xTfnXBIEGBT66xzb+ZagziYJz0e4U+wqmZoRScdUG2UY7ffJ+vaUr90J3O0jTiUmxy
	oem23LUWyOhVhvrw7iULkxX3el0ardJE0kAIGNhgs2OPHiccVaj64kgNAS4jwkAqrlIO
	t4EkoaJKTxvtzFmkp84ujEVaYqXrcUYujpW1oqsXaiN9xTDDKTesotfK7Tmw63fVOxIB
	XQfw==
X-Gm-Message-State: ALoCoQk6sMyX3m0G9FcQlTjc6/bjPfi20VqM/N9Gm6fzpqeulJc380zkbOl1OX7IKS4b5tElv2lh
X-Received: by 10.194.78.210 with SMTP id d18mr72739660wjx.27.1389013558211;
	Mon, 06 Jan 2014 05:05:58 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fh2sm17838872wib.3.2014.01.06.05.05.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 05:05:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140106112430.GG3709@jama>
Date: Mon, 6 Jan 2014 14:05:56 +0100
Message-Id: <46E2A86B-410C-4E90-9210-E1D5B6DFEAE0@dominion.thruhere.net>
References: <1389006085-15308-1-git-send-email-koen@dominion.thruhere.net>
	<20140106112430.GG3709@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] grub: add git version
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
X-List-Received-Date: Mon, 06 Jan 2014 13:05:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2014, om 12:24 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Mon, Jan 06, 2014 at 12:01:25PM +0100, Koen Kooi wrote:
>> Recently grub git gained support for ARM builds (using u-boot or EFI =
as first stage loader) and with 2 extra patches we get support for =
64-bit ARM as well.
>>=20
>> Buildtested for genericarmv7a, genericarmv8 and qemux86. The =
genericarmv8 build fails in do_package/strip due to a binutils problem.
>=20
> Current grub_2.00.bb recipe is always failing for qemux86-64, is it =
the same/similar issue as genericarmv8?
>=20
> NOTE: Running task 16693 of 27381 (ID: 10143, =
/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-xfce/re=
cipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb, do_package)
> ERROR: debugedit failed with exit code 256 (cmd was =
'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/lib/rpm/bin/debugedit' -b =
'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-lin=
ux' -d '/usr/src/debug' -i -l =
'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-lin=
ux/grub/2.00-r1/debugsources.list' =
'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-lin=
ux/grub/2.00-r1/package/usr/lib/grub/i386-pc/gcry_twofish.module'):
> =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-lin=
ux/usr/lib/rpm/bin/debugedit: elf_update: invalid section alignment
> ERROR: Function failed: split_and_strip_files
> ERROR: Logfile of failure stored in: =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linu=
x/grub/2.00-r1/temp/log.do_package.24947
> NOTE: recipe grub-2.00-r1: task do_package: Failed
> ERROR: Task 10967 =
(/home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/meta/recipe=
s-bsp/grub/grub_2.00.bb, do_package) failed with exit code '1'

Looks like it:

ERROR: debugedit failed with exit code 256 (cmd was =
'/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bi=
n/debugedit' -b =
'/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux' -d =
'/usr/src/debug' -i -l =
'/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/grub/2.00+AUTO=
INC+3bc1b2daab-r0/debugsources.list' =
'/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/grub/2.00+AUTO=
INC+3bc1b2daab-r0/package/usr/lib/grub/arm64-efi/gcry_md5.module'):
=
/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin=
/debugedit: =
/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/grub/2.00+AUTOI=
NC+3bc1b2daab-r0/package/usr/lib/grub/arm64-efi/gcry_md5.module: =
Unhandled relocation 258 in .debug_info section
ERROR: Function failed: split_and_strip_files

regards,

Koen

>=20
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>> meta/recipes-bsp/grub/grub-2.00/40_custom          |   9 -
>> ...t-add-grub_fdt_create_empty_tree-function.patch |  73 +++
>> .../grub/0002-arm64-add-EFI-Linux-loader.patch     | 653 =
+++++++++++++++++++++
>> meta/recipes-bsp/grub/grub/40_custom               |   9 +
>> meta/recipes-bsp/grub/grub_git.bb                  |  61 ++
>> 5 files changed, 796 insertions(+), 9 deletions(-)
>> delete mode 100755 meta/recipes-bsp/grub/grub-2.00/40_custom
>> create mode 100644 =
meta/recipes-bsp/grub/grub/0001-fdt-add-grub_fdt_create_empty_tree-functio=
n.patch
>> create mode 100644 =
meta/recipes-bsp/grub/grub/0002-arm64-add-EFI-Linux-loader.patch
>> create mode 100755 meta/recipes-bsp/grub/grub/40_custom
>> create mode 100644 meta/recipes-bsp/grub/grub_git.bb
>>=20
>> diff --git a/meta/recipes-bsp/grub/grub-2.00/40_custom =
b/meta/recipes-bsp/grub/grub-2.00/40_custom
>> deleted file mode 100755
>> index f891b02..0000000
>> --- a/meta/recipes-bsp/grub/grub-2.00/40_custom
>> +++ /dev/null
>> @@ -1,9 +0,0 @@
>> -#!/bin/sh
>> -exec tail -n +3 $0
>> -# This file provides an easy way to add custom menu entries.  Simply =
type the
>> -# menu entries you want to add after this comment.  Be careful not =
to change
>> -# the 'exec tail' line above.
>> -menuentry "Linux" {
>> -    set root=3D(hd0,1)
>> -    linux /vmlinuz root=3D__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ =
__VGA_MODE__ quiet
>> -}
>> diff --git =
a/meta/recipes-bsp/grub/grub/0001-fdt-add-grub_fdt_create_empty_tree-funct=
ion.patch =
b/meta/recipes-bsp/grub/grub/0001-fdt-add-grub_fdt_create_empty_tree-funct=
ion.patch
>> new file mode 100644
>> index 0000000..3414574
>> --- /dev/null
>> +++ =
b/meta/recipes-bsp/grub/grub/0001-fdt-add-grub_fdt_create_empty_tree-funct=
ion.patch
>> @@ -0,0 +1,73 @@
>> +=46rom b3417ec69ff7d52379a8f2cb291dbecccdab684f Mon Sep 17 00:00:00 =
2001
>> +From: Leif Lindholm <leif.lindholm@linaro.org>
>> +Date: Wed, 4 Dec 2013 13:09:21 +0000
>> +Subject: [PATCH 1/2] fdt: add grub_fdt_create_empty_tree() function
>> +
>> +Signed-off-by: Leif Lindholm <leif.lindholm@linaro.org>
>> +---
>> + grub-core/lib/fdt.c | 39 +++++++++++++++++++++++++++++++++++++++
>> + include/grub/fdt.h  |  1 +
>> + 2 files changed, 40 insertions(+)
>> +
>> +diff --git a/grub-core/lib/fdt.c b/grub-core/lib/fdt.c
>> +index 9f34dc7..581a118 100644
>> +--- a/grub-core/lib/fdt.c
>> ++++ b/grub-core/lib/fdt.c
>> +@@ -423,3 +423,42 @@ int grub_fdt_set_prop (void *fdt, unsigned int =
nodeoffset, const char *name,
>> +   grub_memcpy (prop + 3, val, len);
>> +   return 0;
>> + }
>> ++
>> ++struct empty_tree {
>> ++  grub_fdt_header_t header;
>> ++  grub_uint64_t empty_rsvmap[2];
>> ++  struct {
>> ++    grub_uint32_t prop_start;
>> ++    grub_uint8_t name[1];
>> ++    grub_uint32_t prop_end;
>> ++    grub_uint32_t node_end;
>> ++  } empty_node;
>> ++};
>> ++
>> ++int
>> ++grub_fdt_create_empty_tree (void *fdt, unsigned int size)
>> ++{
>> ++  struct empty_tree *et;
>> ++
>> ++  if (size < sizeof (struct empty_tree))
>> ++    return -1;
>> ++
>> ++  grub_memset (fdt, 0, size);
>> ++  et =3D fdt;
>> ++
>> ++  et->empty_node.node_end =3D grub_cpu_to_be32 (FDT_END);
>> ++  et->empty_node.prop_end =3D grub_cpu_to_be32 (FDT_END_NODE);
>> ++  et->empty_node.prop_start =3D grub_cpu_to_be32 (FDT_BEGIN_NODE);
>> ++  ((struct empty_tree *) fdt)->header.off_mem_rsvmap =3D
>> ++    grub_cpu_to_be32 (ALIGN_UP (sizeof (grub_fdt_header_t), 8));
>> ++
>> ++  grub_fdt_set_off_dt_strings (fdt, sizeof (struct empty_tree));
>> ++  grub_fdt_set_off_dt_struct (fdt, sizeof (grub_fdt_header_t) + =
16);
>> ++  grub_fdt_set_version (fdt, FDT_SUPPORTED_VERSION);
>> ++  grub_fdt_set_last_comp_version (fdt, FDT_SUPPORTED_VERSION);
>> ++  grub_fdt_set_size_dt_struct (fdt, sizeof (et->empty_node));
>> ++  grub_fdt_set_totalsize (fdt, size);
>> ++  grub_fdt_set_magic (fdt, FDT_MAGIC);
>> ++
>> ++  return 0;
>> ++}
>> +diff --git a/include/grub/fdt.h b/include/grub/fdt.h
>> +index 2ad0536..06eec19 100644
>> +--- a/include/grub/fdt.h
>> ++++ b/include/grub/fdt.h
>> +@@ -82,6 +82,7 @@ typedef struct {
>> + #define grub_fdt_set_size_dt_struct(fdt, value)	\
>> + 	grub_fdt_set_header(fdt, size_dt_struct, value)
>> +=20
>> ++int grub_fdt_create_empty_tree (void *fdt, unsigned int size);
>> + int grub_fdt_check_header (void *fdt, unsigned int size);
>> + int grub_fdt_find_subnode (const void *fdt, unsigned int =
parentoffset,
>> + 			   const char *name);
>> +--=20
>> +1.8.4.2
>> +
>> diff --git =
a/meta/recipes-bsp/grub/grub/0002-arm64-add-EFI-Linux-loader.patch =
b/meta/recipes-bsp/grub/grub/0002-arm64-add-EFI-Linux-loader.patch
>> new file mode 100644
>> index 0000000..4e9df62
>> --- /dev/null
>> +++ =
b/meta/recipes-bsp/grub/grub/0002-arm64-add-EFI-Linux-loader.patch
>> @@ -0,0 +1,653 @@
>> +=46rom 55cbddc471b6caf27355ce93d1534d894e6ed0bb Mon Sep 17 00:00:00 =
2001
>> +From: Leif Lindholm <leif.lindholm@linaro.org>
>> +Date: Wed, 4 Dec 2013 15:21:16 +0000
>> +Subject: [PATCH 2/2] arm64: add EFI Linux loader
>> +
>> +Signed-off-by: Leif Lindholm <leif.lindholm@linaro.org>
>> +---
>> + grub-core/Makefile.core.def       |   4 +-
>> + grub-core/loader/arm64/linux.c    | 252 =
++++++++++++++++++++++++++++++++++
>> + grub-core/loader/arm64/linuxefi.c | 279 =
++++++++++++++++++++++++++++++++++++++
>> + include/grub/arm64/linux.h        |  54 ++++++++
>> + include/grub/efi/api.h            |   4 +
>> + 5 files changed, 592 insertions(+), 1 deletion(-)
>> + create mode 100644 grub-core/loader/arm64/linux.c
>> + create mode 100644 grub-core/loader/arm64/linuxefi.c
>> + create mode 100644 include/grub/arm64/linux.h
>> +
>> +diff --git a/grub-core/Makefile.core.def =
b/grub-core/Makefile.core.def
>> +index 060de44..7cf91a6 100644
>> +--- a/grub-core/Makefile.core.def
>> ++++ b/grub-core/Makefile.core.def
>> +@@ -1663,7 +1663,9 @@ module =3D {
>> +   sparc64_ieee1275 =3D loader/sparc64/ieee1275/linux.c;
>> +   ia64_efi =3D loader/ia64/efi/linux.c;
>> +   arm =3D loader/arm/linux.c;
>> +-  arm =3D lib/fdt.c;
>> ++  arm64 =3D loader/arm64/linux.c;
>> ++  arm64 =3D loader/arm64/linuxefi.c;
>> ++  fdt =3D lib/fdt.c;
>> +   common =3D loader/linux.c;
>> +   common =3D lib/cmdline.c;
>> +   enable =3D noemu;
>> +diff --git a/grub-core/loader/arm64/linux.c =
b/grub-core/loader/arm64/linux.c
>> +new file mode 100644
>> +index 0000000..38821c9
>> +--- /dev/null
>> ++++ b/grub-core/loader/arm64/linux.c
>> +@@ -0,0 +1,252 @@
>> ++/* Helper functions for the generic UEFI Linux loader */
>> ++/*
>> ++ *  GRUB  --  GRand Unified Bootloader
>> ++ *  Copyright (C) 2013  Free Software Foundation, Inc.
>> ++ *
>> ++ *  GRUB is free software: you can redistribute it and/or modify
>> ++ *  it under the terms of the GNU General Public License as =
published by
>> ++ *  the Free Software Foundation, either version 3 of the License, =
or
>> ++ *  (at your option) any later version.
>> ++ *
>> ++ *  GRUB is distributed in the hope that it will be useful,
>> ++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++ *  GNU General Public License for more details.
>> ++ *
>> ++ *  You should have received a copy of the GNU General Public =
License
>> ++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
>> ++ */
>> ++
>> ++#include <grub/command.h>
>> ++#include <grub/err.h>
>> ++#include <grub/file.h>
>> ++#include <grub/fdt.h>
>> ++#include <grub/mm.h>
>> ++#include <grub/cpu/linux.h>
>> ++#include <grub/efi/efi.h>
>> ++
>> ++static grub_efi_guid_t fdt_guid =3D GRUB_EFI_DEVICE_TREE_GUID;
>> ++
>> ++static int chosen;
>> ++
>> ++static grub_addr_t initrd_start;
>> ++static grub_addr_t initrd_end;
>> ++
>> ++static void * fw_fdt;
>> ++static void * fdt;
>> ++
>> ++static char *linux_args;
>> ++
>> ++static void
>> ++get_fdt (void)
>> ++{
>> ++  grub_efi_configuration_table_t * tables;
>> ++  unsigned int i;
>> ++  int size;
>> ++
>> ++  /* If already loaded, just return address. */
>> ++  if (fdt)
>> ++    return;
>> ++
>> ++  tables =3D grub_efi_system_table->configuration_table;
>> ++
>> ++  if (!fw_fdt)
>> ++    /* Look for FDT in UEFI config tables. */
>> ++    for (i=3D0; i < grub_efi_system_table->num_table_entries; i++)
>> ++      if (grub_memcmp (&tables[i].vendor_guid, &fdt_guid, sizeof =
(fdt_guid))
>> ++	  =3D=3D 0)
>> ++	{
>> ++	  fw_fdt =3D tables[i].vendor_table;
>> ++	  grub_dprintf("linux", "found registered FDT @ 0x%p\n", =
fw_fdt);
>> ++	  break;
>> ++	}
>> ++
>> ++  size =3D fw_fdt ? grub_fdt_get_totalsize (fw_fdt) : 0;
>> ++  size +=3D grub_strlen (linux_args) + 0x400;
>> ++
>> ++  grub_dprintf("linux", "allocating %d bytes for fdt\n", size);
>> ++  fdt =3D grub_malloc (size);
>> ++  if (!fdt)
>> ++    return;
>> ++
>> ++  if (fw_fdt)
>> ++    {
>> ++      grub_memmove (fdt, fw_fdt, size);
>> ++      grub_fdt_set_totalsize (fdt, size);
>> ++    }
>> ++  else
>> ++    {
>> ++      grub_fdt_create_empty_tree (fdt, size);
>> ++    }
>> ++}
>> ++
>> ++static int
>> ++get_chosen (void)
>> ++{
>> ++  chosen =3D grub_fdt_find_subnode (fdt, 0, "chosen");
>> ++  grub_printf("chosen: 0x%08x\n", chosen);
>> ++  if (chosen < 0)
>> ++    {
>> ++      grub_dprintf ("linux", "No 'chosen' node in FDT - =
creating.\n");
>> ++      chosen =3D grub_fdt_add_subnode (fdt, 0, "chosen");
>> ++      if (chosen < 0)
>> ++	return 0;
>> ++      grub_printf("chosen=3D0x%08x\n", chosen);
>> ++    }
>> ++
>> ++  return chosen;
>> ++}
>> ++
>> ++
>> ++grub_err_t
>> ++grub_linux_init_params (void)
>> ++{
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++grub_err_t
>> ++grub_linux_check_kernel (struct linux_kernel_header *lh)
>> ++{
>> ++  if (lh->magic !=3D GRUB_LINUX_MAGIC)
>> ++    return GRUB_ERR_BAD_OS;
>> ++
>> ++  if ((lh->code0 & 0xffff) =3D=3D 0x5A4D)
>> ++    grub_dprintf ("linux", "UEFI stub kernel\n");
>> ++  else
>> ++    grub_dprintf ("linux", "Plain Image kernel\n");
>> ++
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++grub_err_t
>> ++grub_linux_register_cmdline (void * addr)
>> ++{
>> ++  linux_args =3D addr;
>> ++
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++grub_err_t
>> ++grub_linux_register_initrd (void * addr, grub_size_t size)
>> ++{
>> ++  initrd_start =3D (grub_addr_t) addr;
>> ++  initrd_end =3D initrd_start + size;
>> ++
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++grub_err_t
>> ++grub_linux_finalize_params (void)
>> ++{
>> ++  grub_efi_boot_services_t *b;
>> ++  grub_efi_status_t status;
>> ++  int node, retval;
>> ++
>> ++  get_fdt();
>> ++  if (!fdt)
>> ++    goto failure;
>> ++
>> ++  node =3D get_chosen();
>> ++  if (node < 1)
>> ++    goto failure;
>> ++
>> ++  /* Generate and set command line */
>> ++  retval =3D grub_fdt_set_prop (fdt, node, "bootargs", linux_args,
>> ++			     grub_strlen (linux_args) + 1);
>> ++  if (retval)
>> ++    {
>> ++      grub_dprintf("linux", "failed to set command line\n");
>> ++      goto failure;
>> ++    }
>> ++
>> ++  grub_dprintf ("linux", "linux command line: '%s'\n", linux_args);
>> ++
>> ++  b =3D grub_efi_system_table->boot_services;
>> ++  status =3D b->install_configuration_table (&fdt_guid, fdt);
>> ++  if (status !=3D GRUB_EFI_SUCCESS)
>> ++    return GRUB_ERR_BAD_OS;
>> ++
>> ++  grub_dprintf ("linux", "Installed/updated FDT configuration =
table!\n");
>> ++  grub_dprintf ("linux", " @ %p\n", fdt);
>> ++
>> ++  return GRUB_ERR_NONE;
>> ++
>> ++ failure:
>> ++  return GRUB_ERR_BAD_OS;
>> ++}
>> ++
>> ++static void *
>> ++load_dtb (const char * filename)
>> ++{
>> ++  grub_file_t dtb;
>> ++  void * tmp_fdt;
>> ++  int size;
>> ++
>> ++  tmp_fdt =3D NULL;
>> ++  dtb =3D grub_file_open (filename);
>> ++  if (!dtb)
>> ++    {
>> ++      grub_error (GRUB_ERR_FILE_NOT_FOUND, N_("failed to open =
file"));
>> ++      return NULL;
>> ++    }
>> ++
>> ++  size =3D grub_file_size (dtb);
>> ++  if (size =3D=3D 0)
>> ++      goto out;
>> ++
>> ++  tmp_fdt =3D grub_malloc (size);
>> ++  if (!tmp_fdt)
>> ++    goto out;
>> ++
>> ++  if (grub_file_read (dtb, tmp_fdt, size) !=3D size)
>> ++    {
>> ++      grub_free (tmp_fdt);
>> ++      return NULL;
>> ++    }
>> ++
>> ++  if (grub_fdt_check_header (tmp_fdt, size) !=3D 0)
>> ++    {
>> ++      grub_free (tmp_fdt);
>> ++      return NULL;
>> ++    }
>> ++
>> ++ out:
>> ++  grub_file_close (dtb);
>> ++  return tmp_fdt;
>> ++}
>> ++
>> ++static grub_err_t
>> ++grub_cmd_devicetree (grub_command_t cmd __attribute__ ((unused)),
>> ++		     int argc, char *argv[])
>> ++{
>> ++  void *blob;
>> ++
>> ++  if (argc !=3D 1)
>> ++    return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename =
expected"));
>> ++
>> ++  grub_free(fdt);
>> ++
>> ++  blob =3D load_dtb (argv[0]);
>> ++  if (!blob)
>> ++    return GRUB_ERR_FILE_NOT_FOUND;
>> ++
>> ++  fw_fdt =3D blob;
>> ++
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++static grub_command_t cmd_devicetree;
>> ++
>> ++void
>> ++grub_efi_linux_arch_register_commands (void)
>> ++{
>> ++  cmd_devicetree =3D
>> ++    grub_register_command ("devicetree", grub_cmd_devicetree, 0,
>> ++			   N_("Load DTB file."));
>> ++}
>> ++
>> ++void
>> ++grub_efi_linux_arch_unregister_commands (void)
>> ++{
>> ++  grub_unregister_command (cmd_devicetree);
>> ++}
>> +diff --git a/grub-core/loader/arm64/linuxefi.c =
b/grub-core/loader/arm64/linuxefi.c
>> +new file mode 100644
>> +index 0000000..71d11f4
>> +--- /dev/null
>> ++++ b/grub-core/loader/arm64/linuxefi.c
>> +@@ -0,0 +1,279 @@
>> ++/*
>> ++ *  GRUB  --  GRand Unified Bootloader
>> ++ *  Copyright (C) 2013  Free Software Foundation, Inc.
>> ++ *
>> ++ *  GRUB is free software: you can redistribute it and/or modify
>> ++ *  it under the terms of the GNU General Public License as =
published by
>> ++ *  the Free Software Foundation, either version 3 of the License, =
or
>> ++ *  (at your option) any later version.
>> ++ *
>> ++ *  GRUB is distributed in the hope that it will be useful,
>> ++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++ *  GNU General Public License for more details.
>> ++ *
>> ++ *  You should have received a copy of the GNU General Public =
License
>> ++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
>> ++ */
>> ++
>> ++#include <grub/loader.h>
>> ++#include <grub/file.h>
>> ++#include <grub/err.h>
>> ++#include <grub/types.h>
>> ++#include <grub/mm.h>
>> ++#include <grub/cpu/linux.h>
>> ++#include <grub/command.h>
>> ++#include <grub/i18n.h>
>> ++#include <grub/lib/cmdline.h>
>> ++#include <grub/efi/efi.h>
>> ++#include <grub/efi/pe32.h>
>> ++
>> ++GRUB_MOD_LICENSE ("GPLv3+");
>> ++
>> ++static grub_dl_t my_mod;
>> ++static int loaded;
>> ++static void *kernel_mem;
>> ++static grub_uint64_t kernel_size;
>> ++static void *initrd_mem;
>> ++static grub_uint32_t initrd_size;
>> ++static char *linux_cmdline;
>> ++
>> ++static grub_uint32_t cmdline_size;
>> ++
>> ++#define GRUB_EFI_PAGE_SHIFT	12
>> ++#define BYTES_TO_PAGES(bytes)   (((bytes) + 0xfff) >> =
GRUB_EFI_PAGE_SHIFT)
>> ++
>> ++typedef void (* handover_func) (grub_efi_handle_t, =
grub_efi_system_table_t *, void *);
>> ++
>> ++static grub_err_t
>> ++grub_linuxefi_boot (void)
>> ++{
>> ++  handover_func hf;
>> ++  struct linux_kernel_header *lh =3D kernel_mem;
>> ++  struct grub_pe32_optional_header *oh;
>> ++  grub_err_t retval;
>> ++
>> ++  retval =3D grub_linux_finalize_params();
>> ++  if (retval !=3D GRUB_ERR_NONE)
>> ++    return retval;
>> ++
>> ++  grub_printf ("PE/COFF header @ %08x\n", lh->hdr_offset);
>> ++  oh =3D (void *) ((grub_addr_t) kernel_mem + sizeof ("PE\0") + =
lh->hdr_offset
>> ++		 + sizeof (struct grub_pe32_coff_header));
>> ++
>> ++  grub_printf ("Entry point: 0x%08x\n", oh->entry_addr);
>> ++  hf =3D (handover_func) ((char *) kernel_mem + oh->entry_addr);
>> ++  grub_printf ("hf: %p\n", (void *) hf);
>> ++  grub_printf("grub_efi_image_handle: %p\n", =
grub_efi_image_handle);
>> ++  grub_printf("grub_efi_system_table: %p\n", =
grub_efi_system_table);
>> ++
>> ++  hf (grub_efi_image_handle, grub_efi_system_table, =
grub_linux_get_params());
>> ++
>> ++  grub_printf("holy shit!\n");
>> ++
>> ++  /* Not reached */
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++static grub_err_t
>> ++grub_linuxefi_unload (void)
>> ++{
>> ++  grub_dl_unref (my_mod);
>> ++  loaded =3D 0;
>> ++  if (initrd_mem)
>> ++    grub_efi_free_pages((grub_efi_physical_address_t)initrd_mem,
>> ++			BYTES_TO_PAGES(initrd_size));
>> ++  if (kernel_mem)
>> ++    grub_efi_free_pages((grub_efi_physical_address_t)kernel_mem,
>> ++			BYTES_TO_PAGES(kernel_size));
>> ++  return GRUB_ERR_NONE;
>> ++}
>> ++
>> ++static grub_err_t
>> ++grub_cmd_initrdefi (grub_command_t cmd __attribute__ ((unused)),
>> ++		    int argc, char *argv[])
>> ++{
>> ++  grub_file_t *files =3D 0;
>> ++  int i, nfiles =3D 0;
>> ++  grub_size_t size =3D 0;
>> ++  grub_uint8_t *ptr;
>> ++
>> ++  if (argc =3D=3D 0)
>> ++    {
>> ++      grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
>> ++      goto fail;
>> ++    }
>> ++
>> ++  if (!loaded)
>> ++    {
>> ++      grub_error (GRUB_ERR_BAD_ARGUMENT,
>> ++		  N_("you need to load the kernel first"));
>> ++      goto fail;
>> ++    }
>> ++
>> ++  files =3D grub_zalloc (argc * sizeof (files[0]));
>> ++  if (!files)
>> ++    goto fail;
>> ++
>> ++  for (i =3D 0; i < argc; i++)
>> ++    {
>> ++      grub_file_filter_disable_compression ();
>> ++      files[i] =3D grub_file_open (argv[i]);
>> ++      if (! files[i])
>> ++        goto fail;
>> ++      nfiles++;
>> ++      size +=3D ALIGN_UP (grub_file_size (files[i]), 4);
>> ++    }
>> ++
>> ++  initrd_mem =3D grub_efi_allocate_pages (0, BYTES_TO_PAGES(size));
>> ++
>> ++  if (!initrd_mem)
>> ++    {
>> ++      grub_error (GRUB_ERR_OUT_OF_MEMORY, N_("can't allocate =
initrd"));
>> ++      goto fail;
>> ++    }
>> ++
>> ++  grub_linux_register_initrd (initrd_mem, size);
>> ++
>> ++  ptr =3D initrd_mem;
>> ++
>> ++  for (i =3D 0; i < nfiles; i++)
>> ++    {
>> ++      grub_ssize_t cursize =3D grub_file_size (files[i]);
>> ++      if (grub_file_read (files[i], ptr, cursize) !=3D cursize)
>> ++        {
>> ++          if (!grub_errno)
>> ++            grub_error (GRUB_ERR_FILE_READ_ERROR,
>> ++			N_("premature end of file %s"), argv[i]);
>> ++          goto fail;
>> ++        }
>> ++      ptr +=3D cursize;
>> ++      grub_memset (ptr, 0, ALIGN_UP_OVERHEAD (cursize, 4));
>> ++      ptr +=3D ALIGN_UP_OVERHEAD (cursize, 4);
>> ++    }
>> ++
>> ++ fail:
>> ++  for (i =3D 0; i < nfiles; i++)
>> ++    grub_file_close (files[i]);
>> ++  grub_free (files);
>> ++
>> ++  if (initrd_mem && grub_errno)
>> ++    grub_efi_free_pages((grub_efi_physical_address_t) initrd_mem,
>> ++			BYTES_TO_PAGES(size));
>> ++
>> ++  return grub_errno;
>> ++}
>> ++
>> ++static grub_err_t
>> ++grub_cmd_linuxefi (grub_command_t cmd __attribute__ ((unused)),
>> ++		   int argc, char *argv[])
>> ++{
>> ++  grub_file_t file =3D 0;
>> ++  struct linux_kernel_header *lh;
>> ++  grub_ssize_t filelen;
>> ++
>> ++  grub_dl_ref (my_mod);
>> ++
>> ++  if (argc =3D=3D 0)
>> ++    {
>> ++      grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
>> ++      goto fail;
>> ++    }
>> ++
>> ++  file =3D grub_file_open (argv[0]);
>> ++  if (! file)
>> ++    goto fail;
>> ++
>> ++  filelen =3D grub_file_size (file);
>> ++
>> ++  grub_printf ("kernel file size: %lld\n", (long long) filelen);
>> ++  kernel_mem =3D grub_efi_allocate_pages (0, =
BYTES_TO_PAGES(filelen));
>> ++  grub_printf ("kernel numpages: %lld\n", (long long) =
BYTES_TO_PAGES(filelen));
>> ++  if (!kernel_mem)
>> ++    {
>> ++      grub_error (GRUB_ERR_OUT_OF_MEMORY, N_("can't allocate =
kernel"));
>> ++      goto fail;
>> ++    }
>> ++
>> ++  if (grub_file_read (file, kernel_mem, filelen) !=3D filelen)
>> ++    {
>> ++      grub_error (GRUB_ERR_FILE_READ_ERROR, N_("Can't read kernel =
%s"),
>> ++		  argv[0]);
>> ++      goto fail;
>> ++    }
>> ++
>> ++  lh =3D (void *) kernel_mem;
>> ++  grub_dprintf ("linux", "kernel_mem @ %p\n", kernel_mem);
>> ++  grub_dprintf ("linux", "code0: 0x%08x\n", lh->code0);
>> ++  grub_dprintf ("linux", "code1: 0x%08x\n", lh->code1);
>> ++  grub_dprintf ("linux", "text_offset: 0x%016llx\n",
>> ++		(long long unsigned) lh->text_offset);
>> ++  grub_dprintf ("linux", "magic: 0x%08x\n", lh->magic);
>> ++  grub_dprintf ("linux", "hdr_offset: 0x%08llx\n",
>> ++		(long long unsigned) lh->hdr_offset);
>> ++
>> ++  if (grub_linux_init_params() !=3D GRUB_ERR_NONE)
>> ++    {
>> ++      grub_error (GRUB_ERR_OUT_OF_MEMORY, "cannot allocate kernel =
parameters");
>> ++      goto fail;
>> ++    }
>> ++
>> ++  cmdline_size =3D grub_loader_cmdline_size (argc, argv);
>> ++
>> ++  linux_cmdline =3D grub_malloc(cmdline_size + sizeof =
(LINUX_IMAGE));
>> ++  if (!linux_cmdline)
>> ++    grub_error (GRUB_ERR_OUT_OF_MEMORY, "cannot allocate command =
line");
>> ++  grub_memcpy (linux_cmdline, LINUX_IMAGE, sizeof (LINUX_IMAGE));
>> ++  grub_create_loader_cmdline (argc, argv,
>> ++                              linux_cmdline + sizeof (LINUX_IMAGE) =
- 1,
>> ++			      cmdline_size);
>> ++
>> ++  grub_linux_register_cmdline (linux_cmdline);
>> ++
>> ++  if (grub_errno =3D=3D GRUB_ERR_NONE)
>> ++    {
>> ++      grub_loader_set (grub_linuxefi_boot, grub_linuxefi_unload, =
0);
>> ++      loaded =3D 1;
>> ++    }
>> ++
>> ++ fail:
>> ++
>> ++  if (file)
>> ++    grub_file_close (file);
>> ++
>> ++  if (grub_errno !=3D GRUB_ERR_NONE)
>> ++    {
>> ++      grub_dl_unref (my_mod);
>> ++      loaded =3D 0;
>> ++    }
>> ++
>> ++  if (linux_cmdline && !loaded)
>> ++    grub_efi_free_pages ((grub_efi_physical_address_t) =
linux_cmdline,
>> ++			 BYTES_TO_PAGES(cmdline_size));
>> ++
>> ++  if (kernel_mem && !loaded)
>> ++    grub_efi_free_pages ((grub_efi_physical_address_t) kernel_mem,
>> ++			 BYTES_TO_PAGES(kernel_size));
>> ++
>> ++  return grub_errno;
>> ++}
>> ++
>> ++static grub_command_t cmd_linuxefi, cmd_initrdefi;
>> ++
>> ++GRUB_MOD_INIT(linuxefi)
>> ++{
>> ++  cmd_linuxefi =3D
>> ++    grub_register_command ("linuxefi", grub_cmd_linuxefi, 0, =
N_("Load Linux."));
>> ++  cmd_initrdefi =3D
>> ++    grub_register_command ("initrdefi", grub_cmd_initrdefi,
>> ++			   0, N_("Load initrd."));
>> ++  grub_efi_linux_arch_register_commands();
>> ++  my_mod =3D mod;
>> ++}
>> ++
>> ++GRUB_MOD_FINI(linuxefi)
>> ++{
>> ++  grub_unregister_command (cmd_linuxefi);
>> ++  grub_unregister_command (cmd_initrdefi);
>> ++  grub_efi_linux_arch_unregister_commands();
>> ++}
>> +diff --git a/include/grub/arm64/linux.h b/include/grub/arm64/linux.h
>> +new file mode 100644
>> +index 0000000..9529bc3
>> +--- /dev/null
>> ++++ b/include/grub/arm64/linux.h
>> +@@ -0,0 +1,54 @@
>> ++/*
>> ++ *  GRUB  --  GRand Unified Bootloader
>> ++ *  Copyright (C) 2013  Free Software Foundation, Inc.
>> ++ *
>> ++ *  GRUB is free software: you can redistribute it and/or modify
>> ++ *  it under the terms of the GNU General Public License as =
published by
>> ++ *  the Free Software Foundation, either version 3 of the License, =
or
>> ++ *  (at your option) any later version.
>> ++ *
>> ++ *  GRUB is distributed in the hope that it will be useful,
>> ++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++ *  GNU General Public License for more details.
>> ++ *
>> ++ *  You should have received a copy of the GNU General Public =
License
>> ++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
>> ++ */
>> ++
>> ++#ifndef GRUB_LINUX_CPU_HEADER
>> ++#define GRUB_LINUX_CPU_HEADER 1
>> ++
>> ++#include <grub/efi/efi.h>
>> ++
>> ++#define GRUB_EFI_KERNEL_STUB_ENTRY_OFFSET 0
>> ++#define GRUB_LINUX_MAX_LOAD_ADDR 0xffffffffffffULL
>> ++
>> ++#define GRUB_LINUX_MAGIC 0x644d5241 /* 'ARM\x64' */
>> ++
>> ++/* =46rom linux/Documentation/arm64/booting.txt */
>> ++struct linux_kernel_header
>> ++{
>> ++  grub_uint32_t code0;		/* Executable code */
>> ++  grub_uint32_t code1;		/* Executable code */
>> ++  grub_uint64_t text_offset;    /* Image load offset */
>> ++  grub_uint64_t res0;		/* reserved */
>> ++  grub_uint64_t res1;		/* reserved */
>> ++  grub_uint64_t res2;		/* reserved */
>> ++  grub_uint64_t res3;		/* reserved */
>> ++  grub_uint64_t res4;		/* reserved */
>> ++  grub_uint32_t magic;		/* Magic number, little endian, =
"ARM\x64" */
>> ++  grub_uint32_t hdr_offset;	/* Offset of PE/COFF header */
>> ++};
>> ++
>> ++#define grub_linux_get_params() NULL
>> ++extern grub_err_t grub_linux_init_params (void);
>> ++extern grub_err_t grub_linux_finalize_params (void);
>> ++extern grub_err_t grub_linux_check_kernel (struct =
linux_kernel_header *lh);
>> ++extern grub_err_t grub_linux_register_cmdline (void * addr);
>> ++extern grub_err_t grub_linux_register_initrd (void * addr, =
grub_size_t size);
>> ++
>> ++extern void grub_efi_linux_arch_register_commands (void);
>> ++extern void grub_efi_linux_arch_unregister_commands (void);
>> ++
>> ++#endif /* ! GRUB_LINUX_CPU_HEADER */
>> +diff --git a/include/grub/efi/api.h b/include/grub/efi/api.h
>> +index 3af0911..055b01d 100644
>> +--- a/include/grub/efi/api.h
>> ++++ b/include/grub/efi/api.h
>> +@@ -276,6 +276,10 @@
>> +       { 0x82, 0x79, 0xa8, 0x4b, 0x79, 0x61, 0x78, 0x98 } \
>> +   }
>> +=20
>> ++#define GRUB_EFI_DEVICE_TREE_GUID \
>> ++  { 0xb1b621d5, 0xf19c, 0x41a5, \
>> ++      { 0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0 } \
>> ++  }
>> + struct grub_efi_sal_system_table
>> + {
>> +   grub_uint32_t signature;
>> +--=20
>> +1.8.4.2
>> +
>> diff --git a/meta/recipes-bsp/grub/grub/40_custom =
b/meta/recipes-bsp/grub/grub/40_custom
>> new file mode 100755
>> index 0000000..f891b02
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/grub/40_custom
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +exec tail -n +3 $0
>> +# This file provides an easy way to add custom menu entries.  Simply =
type the
>> +# menu entries you want to add after this comment.  Be careful not =
to change
>> +# the 'exec tail' line above.
>> +menuentry "Linux" {
>> +    set root=3D(hd0,1)
>> +    linux /vmlinuz root=3D__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ =
__VGA_MODE__ quiet
>> +}
>> diff --git a/meta/recipes-bsp/grub/grub_git.bb =
b/meta/recipes-bsp/grub/grub_git.bb
>> new file mode 100644
>> index 0000000..ca636f3
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/grub_git.bb
>> @@ -0,0 +1,61 @@
>> +SUMMARY =3D "GRUB2 is the next-generation GRand Unified Bootloader"
>> +
>> +DESCRIPTION =3D "GRUB2 is the next generaion of a GPLed bootloader \
>> +intended to unify bootloading across x86 operating systems. In \
>> +addition to loading the Linux kernel, it implements the Multiboot \
>> +standard, which allows for flexible loading of multiple boot =
images."
>> +
>> +HOMEPAGE =3D "http://www.gnu.org/software/grub/"
>> +SECTION =3D "bootloaders"
>> +
>> +LICENSE =3D "GPLv3"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>> +
>> +DEPENDS =3D "autogen-native flex-native bison-native xz freetype"
>> +
>> +DEFAULT_PREFERENCE =3D "-1"
>> +DEFAULT_PREFERENCE_arm =3D "1"
>> +
>> +PV =3D "2.00+${SRCPV}"
>> +SRCREV =3D "3bc1b2daabb9b07a9c08bca386005d96f07147fe"
>> +SRC_URI =3D "git://git.savannah.gnu.org/grub.git \
>> +           =
file://0001-fdt-add-grub_fdt_create_empty_tree-function.patch \
>> +           file://0002-arm64-add-EFI-Linux-loader.patch \            =
     =20
>> +           file://40_custom \
>> +          "
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +COMPATIBLE_HOST =3D =
'(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>> +
>> +inherit autotools
>> +inherit gettext
>> +
>> +PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG[grub-mount] =3D =
"--enable-grub-mount,--disable-grub-mount,fuse"
>> +
>> +# configure.ac has code to set this automagically from the target =
tuple
>> +# but the OE freeform one (core2-foo-bar-linux) don't work with =
that.
>> +
>> +GRUBPLATFORM_arm =3D "uboot"
>> +GRUBPLATFORM_aarch64 =3D "efi"
>> +GRUBPLATFORM ??=3D "pc"
>> +
>> +EXTRA_OECONF =3D "--with-platform=3D${GRUBPLATFORM} =
--disable-grub-mkfont --program-prefix=3D"" \
>> +                --enable-liblzma=3Dno --enable-device-mapper=3Dno =
--enable-libzfs=3Dno"
>> +
>> +do_configure_prepend() {
>> +    ( cd ${S}
>> +      ${S}/autogen.sh )
>> +}
>> +
>> +do_install_append () {
>> +    install -d ${D}${sysconfdir}/grub.d
>> +    install -m 0755 ${WORKDIR}/40_custom =
${D}${sysconfdir}/grub.d/40_custom
>> +}
>> +
>> +RDEPENDS_${PN} =3D "diffutils freetype"
>> +FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
>> +
>> +INSANE_SKIP_${PN} =3D "arch"
>> +INSANE_SKIP_${PN}-dbg =3D "arch"
>> --=20
>> 1.8.4.2
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


