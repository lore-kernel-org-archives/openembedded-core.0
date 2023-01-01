Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAADAC71133
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20678.1672605968468572783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dUqJZgjp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101856f15a53c-d4203324-20b2-412f-af58-b1946b65a150-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eo/4EQ++rOoMWLD/edONg4QIaRi1iXFUq/edl6Jhcf0=;
	b=dUqJZgjplFkDFQjBPjabyC2R4IoR66e/kX6IpCjdah9GJwtCIIlrDWa+BXjCtR3K
	4tnS8qrIPkEhOBob4c0nZdZsLDN2ZuoOOL9uhRjCgf/EJICi6T6wJ9EIoN30eG3Thux
	qYPoWqLU4AdIQ7apnWZMqhMQg3Y0FG7Pvb806pQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eo/4EQ++rOoMWLD/edONg4QIaRi1iXFUq/edl6Jhcf0=;
	b=kUgVNN9JkCUzDiPEpPxa2qXflsztQZuNdFaxuj9KRO6H8fJ2M14FCYqgi2fwyjBw
	EE8dws0XIxguArDayNW5hoFo7bi/pNJshqcBPuCTITrAEDLS0p4W6JoZIE3u8cPp7TX
	GDm02QrMc7+vT8VsaBymQhRrl1LBoSkvKVoLUh2A=
Content-Type: multipart/mixed; boundary="===============4932937047363463513=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash: upgrading to 5.2.15 SUCCEEDED
Message-ID: <010101856f15a53c-d4203324-20b2-412f-af58-b1946b65a150-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175278

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bash* to *5.2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-upgrade-5.2.9-5.2.15.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4932937047363463513==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-upgrade-5.2.9-5.2.15.patch"

RnJvbSA4MDUzZDc0NzVkNTdkODIyYWZjMzk2YzM1ZWExMjNiNjhmMTljNDE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMTo0Nzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2g6IHVwZ3JhZGUgNS4yLjkgLT4gNS4yLjE1CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL3tiYXNoXzUuMi45LmJiID0+IGJhc2hfNS4yLjE1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9iYXNoL3tiYXNoXzUuMi45LmJiID0+IGJhc2hfNS4yLjE1LmJifSAoODklKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjkuYmIgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi45LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4xNS5iYgppbmRleCAz
OWE1ZDNkZTg2Li5mNzhmNzlmY2M1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YmFzaC9iYXNoXzUuMi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hf
NS4yLjE1LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9iYXNo
LyR7QlB9LnRhci5nejtuYW1lPXRhcmJhbGwgXAogICAgICAgICAgICBmaWxlOi8vdXNlX2FjbG9j
YWwucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0g
IjY4ZDk3ODI2NDI1M2JjOTMzZDY5MmYxZGUxOTVlMmU1YjQ2M2EzOTg0ZGZiNGU1NTA0YjA3Njg2
NWYxNmI2ZGQiCitTUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICIxMzcyMDk2NWI1ZjRmYzNh
MGQ0YjYxZGQzN2U3NTY1Yzc0MWRhOWE1YmUyNGVkYzJhZTAwMTgyZmMxYjM1ODhjIgogCiBERUJV
R19PUFRJTUlaQVRJT046YXBwZW5kOmFybXY0ID0gIiAke0BiYi51dGlscy5jb250YWlucygnVFVO
RV9DQ0FSR1MnLCAnLW10aHVtYicsICctZm9taXQtZnJhbWUtcG9pbnRlcicsICcnLCBkKX0iCiBE
RUJVR19PUFRJTUlaQVRJT046YXBwZW5kOmFybXY1ID0gIiAke0BiYi51dGlscy5jb250YWlucygn
VFVORV9DQ0FSR1MnLCAnLW10aHVtYicsICctZm9taXQtZnJhbWUtcG9pbnRlcicsICcnLCBkKX0i
Ci0tIAoyLjM3LjMKCg==

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76d5916881baedfc3004ac2cb794337eaf36dcb2"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 5 Mirrors 0 Missed 87 Current 460 (5% match, 84% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 968 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1001 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 1002 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1005 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1112 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1166 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_fetch)
NOTE: Running task 1167 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 1186 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1187 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1194 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1310 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1311 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1524 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1525 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 1526 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1600 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1602 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1603 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1605 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1606 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1607 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 1611 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1715 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: Running task 1720 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: Running task 1721 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 1722 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1724 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1725 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: Running task 1726 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1727 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1728 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1729 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_fetch: Succeeded
NOTE: Running task 1730 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1731 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1732 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 1733 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1734 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1735 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_unpack)
NOTE: Running task 1736 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_fetch: Succeeded
NOTE: Running task 1737 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1738 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1739 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1740 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1741 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 1742 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1743 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1744 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: Running task 1745 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1747 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1748 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1749 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1750 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1751 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: Running task 1752 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1753 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1754 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.43-r0: task do_unpack: Started
NOTE: Running task 1755 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running task 1756 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: Running task 1757 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1758 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1759 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1760 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running task 1762 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1763 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: Running task 1764 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1765 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: Running task 1766 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1767 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 1768 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 1770 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1771 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1774 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1775 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running task 1776 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1777 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1779 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1780 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1781 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1782 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1783 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1784 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.43-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe file-5.43-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1785 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1786 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 1787 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1789 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1790 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1791 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1792 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: Running task 1793 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: Running task 1794 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: Running task 1795 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1796 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1797 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 1798 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: Running task 1799 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: Running task 1800 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1801 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1802 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 1803 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1804 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 1805 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1806 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1807 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: Running task 1808 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1809 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1810 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 2aacf454e877010ad94ff5bfe2c8d3a21b8af9e5e0d78c2f1ea9762657a78037
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.43-r0: task do_configure: Started
NOTE: Running task 1811 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1812 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1813 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1839 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1840 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_kernel_checkout: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.43-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe file-5.43-r0: task do_compile: Started
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe file-5.43-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_install)
NOTE: recipe file-5.43-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.43-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot)
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_package)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.43-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Failed
NOTE: recipe file-5.43-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1885 tasks of which 1695 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/btrfs-tools/6.0.2-r0/temp/log.do_packagedata.61804
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata) failed with exit code '1'

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 79 recipes from the core2-32 sysroot...done.
Removing 88 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76d5916881baedfc3004ac2cb794337eaf36dcb2"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 315 Local 212 Mirrors 0 Missed 103 Current 161 (67% match, 78% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 174 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 188 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 191 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 195 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 569 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 572 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 573 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 574 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 582 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 585 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 596 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_fetch)
NOTE: Running task 597 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 598 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 599 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 600 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 601 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 602 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 603 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 626 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 627 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 663 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 664 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 665 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 688 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 689 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 690 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 691 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 692 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 693 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running task 698 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe make-4.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.43-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 294 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running setscene task 295 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 308 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 316 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 749 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 750 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 751 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 753 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 757 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: recipe file-5.43-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: Running task 758 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_unpack)
NOTE: Running task 759 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 760 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 761 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 769 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 770 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: Running setscene task 317 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 774 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 777 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 779 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: Running task 780 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 319 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: Running setscene task 323 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running task 781 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 791 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 793 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 794 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 796 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 797 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: Running task 798 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 799 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 802 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 804 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 815 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running setscene task 340 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running task 820 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 821 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running setscene task 341 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 826 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 827 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: Running task 829 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: Running setscene task 357 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: Running task 862 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 867 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 868 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 873 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 874 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 875 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 876 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 878 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 879 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: Running task 881 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 882 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 883 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: Running task 885 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.43-r0: task do_unpack: Succeeded
NOTE: Running task 890 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 891 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 892 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 893 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 902 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.43-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 911 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 912 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 913 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 914 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.43-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 915 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: Running task 916 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 917 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 918 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: Running task 919 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 381 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: Running task 920 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 921 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: Running task 922 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 923 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 925 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: Running task 926 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: Running task 927 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_patch: Started
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 928 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 929 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 930 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 931 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: Running task 932 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 934 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 2aacf454e877010ad94ff5bfe2c8d3a21b8af9e5e0d78c2f1ea9762657a78037
NOTE: Running task 935 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 936 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 937 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 938 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_setscene: Succeeded
NOTE: Running task 939 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running setscene task 382 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 940 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 951 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 383 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 952 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 957 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 384 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 958 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 398 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 451 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1245 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1246 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1249 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1299 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1304 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1325 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1329 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1330 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1449 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1482 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1483 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1485 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1509 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1512 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1513 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 1514 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe musl-obstack-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: Running task 1517 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_configure)
NOTE: Running task 1519 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: Running task 1520 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 1521 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1522 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: Running task 1523 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: Running task 1524 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1525 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 1526 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 1527 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: Running task 1528 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe file-5.43-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: Running task 1530 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1531 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1532 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1533 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1534 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1535 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1536 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1538 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1539 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1541 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1544 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1545 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: Running task 1547 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1548 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1549 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1550 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1551 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1554 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1556 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: Running task 1558 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: Running task 1560 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe musl-obstack-1.2-r0: task do_install: Succeeded
NOTE: Running task 1561 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1563 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: Running task 1565 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: Running task 1566 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1567 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1568 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: Running task 1570 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: Running task 1571 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1574 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1575 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1576 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_package: Succeeded
NOTE: Running task 1577 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe file-5.43-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_compile)
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.43-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1580 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1581 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1582 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.43-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe file-5.43-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1586 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: Running task 1587 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: recipe file-5.43-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1588 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: Running task 1590 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: Running task 1591 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.43-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1595 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1598 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe file-5.43-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe file-5.43-r0: task do_packagedata: Started
NOTE: Running task 1602 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.43-r0: task do_packagedata: Failed
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1602 tasks of which 1376 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/file/5.43-r0/temp/log.do_packagedata.303760
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata) failed with exit code '1'

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bash/bash-bashbug: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-bashbug: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-bashbug: PKGSIZE changed from 7091 to 7092 (+0%)
packages/core2-32-poky-linux/bash/bash-dbg: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-dbg: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-dbg: PKGSIZE changed from 3245584 to 3246456 (+0%)
packages/core2-32-poky-linux/bash/bash-dev: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-dev: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-dev: PKGSIZE changed from 306465 to 306601 (+0%)
packages/core2-32-poky-linux/bash/bash-doc: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-doc: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-loadable: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-loadable: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-loadable: PKGSIZE changed from 517285 to 517289 (+0%)
packages/core2-32-poky-linux/bash/bash-locale-af: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-af: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-bg: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-bg: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ca: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ca: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-cs: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-cs: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-da: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-da: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-de: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-de: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-el: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-el: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-en+boldquot: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-en+boldquot: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-en+quot: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-en+quot: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-eo: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-eo: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-es: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-es: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-et: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-et: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-fi: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-fi: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-fr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-fr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ga: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ga: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-gl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-gl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-hr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-hr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-hu: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-hu: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-id: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-id: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-it: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-it: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ja: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ja: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ko: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ko: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-lt: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-lt: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-nb: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-nb: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-nl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-nl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pt-br: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pt-br: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pt: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pt: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ro: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ro: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ru: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ru: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sk: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sk: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sv: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sv: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-tr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-tr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-uk: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-uk: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-vi: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-vi: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-zh-cn: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-zh-cn: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-zh-tw: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-zh-tw: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-ptest: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-ptest: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-ptest: PKGSIZE changed from 1581674 to 1581781 (+0%)
packages/core2-32-poky-linux/bash/bash-src: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-src: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-src: PKGSIZE changed from 4390908 to 4392455 (+0%)
packages/core2-32-poky-linux/bash/bash-staticdev: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-staticdev: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash: SRC_URI changed from "https://ftp.gnu.org/gnu/bash/bash-5.2.9.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch" to "https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch"
packages/core2-32-poky-linux/bash: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash: PKGV changed from 5.2.9 [default] to 5.2.15 [default]

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76d5916881baedfc3004ac2cb794337eaf36dcb2"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 5 Mirrors 0 Missed 83 Current 464 (5% match, 84% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1004 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1007 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1117 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1175 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_fetch)
NOTE: Running task 1176 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 1195 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1196 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1321 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1322 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1534 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 1535 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1536 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1611 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1612 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 1613 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1614 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1615 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1617 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1622 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1726 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1729 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1730 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1731 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: Running task 1733 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1734 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe file-5.43-r0: task do_fetch: Succeeded
NOTE: Running task 1735 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: Running task 1736 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1737 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1738 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1739 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1740 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_unpack)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1741 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1743 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1744 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1745 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1746 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1747 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1748 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1749 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1750 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1751 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: Running task 1752 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1753 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1754 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1755 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: Running task 1756 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1757 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1758 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1759 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: Running task 1760 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1761 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1762 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.43-r0: task do_unpack: Started
NOTE: Running task 1763 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1764 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1765 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1766 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1767 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running task 1772 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: Running task 1773 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1774 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 1775 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1776 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1777 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: Running task 1778 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1779 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1780 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1781 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1782 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1783 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1784 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe file-5.43-r0: task do_unpack: Succeeded
NOTE: Running task 1785 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1786 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_patch)
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1787 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1788 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1789 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1790 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1791 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1792 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.43-r0: task do_patch: Started
NOTE: Running task 1793 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1794 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1795 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1796 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1797 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 1798 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1799 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: Running task 1800 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: Running task 1801 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 1802 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: Running task 1803 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1804 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1805 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1806 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1807 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 1808 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: Running task 1809 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1810 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: Running task 1811 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1812 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 2aacf454e877010ad94ff5bfe2c8d3a21b8af9e5e0d78c2f1ea9762657a78037
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1839 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_kernel_checkout: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe file-5.43-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: recipe file-5.43-r0: task do_compile: Started
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe file-5.43-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe file-5.43-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_install: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot)
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_package)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.43-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Failed
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe file-5.43-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1888 tasks of which 1709 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/btrfs-tools/6.0.2-r0/temp/log.do_packagedata.4138219
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata) failed with exit code '1'

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76d5916881baedfc3004ac2cb794337eaf36dcb2"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 5 Mirrors 0 Missed 83 Current 464 (5% match, 84% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1004 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1007 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1117 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1175 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_fetch)
NOTE: Running task 1176 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 1195 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1196 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1321 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1322 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1534 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1535 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 1537 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1611 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 1612 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1613 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1614 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1616 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1617 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1622 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1728 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1731 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: Running task 1732 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1733 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1734 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 1735 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1736 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: Running task 1737 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: Running task 1738 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1739 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1740 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1741 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe file-5.43-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1743 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1744 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1745 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1746 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_unpack)
NOTE: Running task 1747 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1748 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1750 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1751 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 1752 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1753 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1754 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 1755 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1756 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: Running task 1757 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1758 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1759 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1760 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1761 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1762 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1763 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_unpack: Started
NOTE: Running task 1764 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1765 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running task 1766 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1767 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1768 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: Running task 1770 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: Running task 1771 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: Running task 1772 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 1773 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: Running task 1774 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 1775 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1776 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: Running task 1777 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1779 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1780 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 1781 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 1782 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: Running task 1784 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: Running task 1786 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.43-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 1787 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1788 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1789 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1790 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1791 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1792 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1793 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.43-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1794 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.43-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1795 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: Running task 1796 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1798 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1799 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1800 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: Running task 1801 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 1802 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: Running task 1803 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1804 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 1805 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1806 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: Running task 1808 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1809 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1810 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: Running task 1811 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_configure)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1812 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 1813 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe file-5.43-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 2aacf454e877010ad94ff5bfe2c8d3a21b8af9e5e0d78c2f1ea9762657a78037
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1839 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe file-5.43-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe file-5.43-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.43-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_install)
NOTE: recipe file-5.43-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe file-5.43-r0: task do_install: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot)
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: recipe file-5.43-r0: task do_package: Started
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Failed
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1886 tasks of which 1709 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/btrfs-tools/6.0.2-r0/temp/log.do_packagedata.4032245
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata) failed with exit code '1'

--===============4932937047363463513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76d5916881baedfc3004ac2cb794337eaf36dcb2"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 5 Mirrors 0 Missed 83 Current 464 (5% match, 84% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1004 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1007 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1117 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1175 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 1176 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_fetch)
NOTE: Running task 1195 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1196 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1321 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1322 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1534 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1536 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1537 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 1611 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1613 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1614 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1615 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1617 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 1618 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1622 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1727 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1730 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: Running task 1731 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1732 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1733 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1734 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1735 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: Running task 1736 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: Running task 1737 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1738 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1739 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1740 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe file-5.43-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1741 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_unpack)
NOTE: Running task 1742 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1743 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1744 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1745 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1746 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1747 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1748 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1749 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1750 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1751 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 1752 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1753 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1754 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 1755 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1756 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1757 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1758 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1759 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: Running task 1760 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1761 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1762 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1763 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.43-r0: task do_unpack: Started
NOTE: Running task 1764 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1765 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: Running task 1766 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1767 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 1768 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: Running task 1771 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 1773 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1774 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1776 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1777 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 1778 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1780 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 1781 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 1782 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 1783 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1784 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1785 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_patch)
NOTE: Running task 1786 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1787 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1788 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1789 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1790 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1791 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1792 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.43-r0: task do_patch: Started
NOTE: Running task 1793 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1794 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe file-5.43-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1795 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1796 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1797 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 1798 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: Running task 1799 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: Running task 1800 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1801 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: Running task 1802 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1803 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1804 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 1805 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: Running task 1806 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe file-5.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1808 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 1809 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_configure)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1810 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 1812 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe file-5.43-r0: task do_configure: Started
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 2aacf454e877010ad94ff5bfe2c8d3a21b8af9e5e0d78c2f1ea9762657a78037
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1839 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.43-r0: task do_configure: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe file-5.43-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe file-5.43-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_install)
NOTE: recipe file-5.43-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe file-5.43-r0: task do_install: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot)
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.43-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Failed
NOTE: recipe file-5.43-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1888 tasks of which 1709 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1-r0 to 0:6.0.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/btrfs-tools/6.0.2-r0/temp/log.do_packagedata.166561
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata) failed with exit code '1'

--===============4932937047363463513==--

