Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607B2C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:05:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.28])
 by mx.groups.io with SMTP id smtpd.web09.29347.1639505115624401977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 10:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=bC7NqnOK;
 spf=pass (domain: outlook.com, ip: 40.92.91.28,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DthgsgX32ksCy8ZtIEnWA2P/61Qd0/sfYLf4R3ZgXD1CcyuCL+JdtE4OVYKxTP8nbQia3AwTggVR/jk7Ej97dPENiz546lY99/9hL0IkY2+YyzBNZIf9GxGD4ktDI9yl8EvpGs1TyncyDeCSXmNzYfQmtbvJ8wh3uHckwOGZTdeAwIA5lsFkcofjsjTKK7+NnoWjodDrlprdblKjprTtxkVliOX56b3/FLU6wx4QbHi5JcZTjYf2zm7ZbcZmG1zchKX73FWFOJRLZO/sCyYSaEyrIq2k+MTiDnLuTkUQSiwxUZQU0H1Vs7d+X23cK1bljmCECIdL0wzdE/xgU9Pcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0CBOhUT+CRIgHHwI+XhZiW9eF/tvdD1yGq/rjXI7Hw=;
 b=Hub1h3VyK3REbvKjDUXpTOpLooFW1ycfsdxuVsKE3UiWrq+xixU1JMb44CYtBHSc9Ee8BXcIeXK+pnybbIdJJiNnpBh+QvO/PZw+nSsavuZnEL44dk6HQLX4MsE3Aku7K8A7YtAqMQxy0SSKoCEFAbb7zaH1rz1E5eGGeXiRN6RqyEN075L3NNp9vNIJJcutK7B1dvWzfTrBvt9Gwc1kQVr0VbbkWZudXmLHkNGFKv9nUJUrotVHH0I7iSEWlyVYVXHlTZlycZ7v1Spgsy70ysgOb/NLuRdM9/40qQpgS6Cci4kdmWrUOscOPNDFQs7bfTUCMvJV8J4KFIbcA9X5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0CBOhUT+CRIgHHwI+XhZiW9eF/tvdD1yGq/rjXI7Hw=;
 b=bC7NqnOKW8EonLPvQrIDxZwIiZNjKmYZIvlM61UgCwGMBx+DrSxvEQ0xJB82e72NPGsatgxu/cTRRhLSi8AITy56EufKcfIGmuMAEN9Twx9H1pxoQvv+GmdPokBJBCqtpbS0d+EXPRGYHJFLTpd4NGIxm2Q3ldl/YYbAPpeI5wYvpp8SN4geLcqj4LN/IsgcabhPbUWliY0K3KSdXTvZzHnX0LXwoFVKpS+cPdh6Fy+NWbEWiMbxBZBQ8mRhYUKE5KXk9T5g1LMbIn3yxy+gCDPu59jKDTHe+nseYLuhUaexC4iK1A3S6Rs0gS9kiLa2xkfYqjGnamN0NjRwE3fJ+Q==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4018.eurprd09.prod.outlook.com (2603:10a6:208:19d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 18:05:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 18:05:12 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH] insane: Inappropriate patch
 reasoning
To: openembedded-core@lists.openembedded.org
References: <16C0B098D197A5E1.12686@lists.openembedded.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464259F10AA7B2E44E403188A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 14 Dec 2021 19:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C0B098D197A5E1.12686@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [VcWhkeEN19LMEn2vIQ2e5JeeAgTXvpOBQGBx8p7/2FNLNlF3YKhf69KjctMQrwU/]
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <7db7c0ac-758e-9251-7bf0-ff237d4e5b54@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2fd13f-4fca-4876-7d9c-08d9bf2c4615
X-MS-TrafficTypeDiagnostic: AM0PR09MB4018:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QuvDi6xKswSOP4aW2QbSVn8jb6kHGNzD87rrMd9ur47hx9N08yVcFzujqhM2ebmDKSzhydf/8XtK8Evs3LL8dxIhSy4tN6ayz7Ek1XyLOXKGtdWQxtLQgofCubSlMD5T1bfgiWWUzeZejGyP9TT63za4A/bLus4hDjZHAdSj0l18R4puw8A5GQahsoqkdDDCLAgHB6Fql8cS56+ydaRKS2pHHe7SZtF97rBei182TYpMpMi4V85vCsOxXHcqU84S7A3Wmq4jAamZc9zqD610Ga+C2O446A6xQV/J3JxAaf6azBbah3NuJDQQSYoYyIJ0IVI4Y1znIPs5KgAeJV1LM32ncuhZL9pvb/dsYUE+I6C1VxyECCI+Tj31Rm55DqdYohxlW8BXn1WoF3FahgjE6i358kS7ux3u8n+GkLaFJi7pqfkXhzs/4ELo2RA8pa9f9miMpqquJuF08na3DaA3vQVd9/Vama6mkZ2VV9W/dssXaIhNfGnO3UfJ6rDkE1cH8A69deWeXSqDEcNj9YsPYvgen8rYP8c7wvGqvJ6YxoVZML2Bk7ckGKMTTDI3xTXd8lfEW+//+2KTSkxcjfFlr1EBscDOGvTq3hkfPIoNJbKdbq5A915ulX9fkLi0tSy0XTNEt/XztPcHoAoYNJA5Llg6mccZoiT6j2euAJyrFkg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wk1vYnBJRDdreEk1YWd4MlZGaldvQ0swb0hVQ29NMFBGYWVmbmVZcjYwZ1dD?=
 =?utf-8?B?T094ejhXUGZYSVRmM0VZYklBam0yYThvOGIrL3pLaWlpdXhzeDdEWmN2cHpm?=
 =?utf-8?B?KzRkMitpcUlFUlRVbVo5dnQ2cVN0S2JzSFJHYjEyNEpvZDRKeDF3T05NZFhN?=
 =?utf-8?B?eFdHWW9DeXhIWGxzeDFpTkRyR3IwcG4wTjNmOFZNWjE2QTdRWlVNVzVHL2dk?=
 =?utf-8?B?cnc5WEpDcENaaUY3TUVmd0JJTDBjcXM1azJKWVdwRyt3VVZiZzVaZzV1ZEJv?=
 =?utf-8?B?SGJMT3FocXE4VWhGc3hkSi82Z1NPSkV6MFRaWG9ORGttMUY3VkJnT29ZVGVH?=
 =?utf-8?B?TXNvQzRONzJEYjg0STQzalR1UUs2MThZQlJHT0wwZFpnRkM2aGtoU2RZSFRW?=
 =?utf-8?B?cENkMFVmSHBXQ1lZU2JjY0s3d0ZjaUo5UERqV1k5UDVTOGZuckc5QWUxR0J3?=
 =?utf-8?B?WWhJd3NzQU9HQ241c01SM3NMNHk1bWxqVnhOY1lIZFRPL2VOckFJaWJMSDBU?=
 =?utf-8?B?b1lLUWZjYXZleFNJb2w0bXdmcUp4amdSdWVtOHlsYU9PN1VESVROQitJV3I5?=
 =?utf-8?B?V1lVOVNCN1hDWFFJVGpQNnB6YVdYVHVuMnJyNUl3MEhwRTR5THp0R21wTm1p?=
 =?utf-8?B?M2NvaTkrT0xEVlBJaG5OOUdJRzMyWUczYWs0TzVZakhFRE9IN3hpU3JkYjFB?=
 =?utf-8?B?dnZER25iWFdRSko1Y2g4dHduZjRRZXpMZmRYR2VVL21qd2hRZlVOODdOOVR2?=
 =?utf-8?B?SERNNUhHQlYyRWRVaU9qMkx1TUtEdUMzVGZUM2FiT2xKazdoTWpiWTZiVVB6?=
 =?utf-8?B?cjhsMzltd1FMNExZdjRUQkczVEZCNVUyZ3RQckFMVDJUWUxEcEVkR1c4NXVE?=
 =?utf-8?B?YkdwYnFqWE53dDYwU0ZDKy9kNUp2Sk9yQWRicnlJbFVKRzU2SHJ4WWs3NEVY?=
 =?utf-8?B?WVpxa2tGZEY4Sk9WVTF1eVgwaG1kbzlIN0Fib2JCN2FKTUtFYk1adEdwR3Nj?=
 =?utf-8?B?b3p4T3BINWZ4cXl3ZzNFY1VIUkRHN2p1bjYrWU40Ukw5a05acjUxeHA1ZVZ2?=
 =?utf-8?B?aEEvTEdhZWhyM1JBQWJuM0grM1ErTmtEUDd4ckdiZ1k3eTloRDlWZ3lkWDdQ?=
 =?utf-8?B?UlBKYzVONENPVGkrMnd1T1dEekRSYk1IWnBzU0hObHdKYlpacUwxSDJ6Qmpa?=
 =?utf-8?B?eDhMMnNQYmN6dEp3dzJNVVBnWXZ5ZUZBakU2aDNUTVRJTEExU05COEJ2MEl3?=
 =?utf-8?B?d0RTUEV4dVNCWWNiV3Voa1pMWk8yb3B0YzExWm5ySnlLMUlONTN6NklPZTNT?=
 =?utf-8?B?RnczNmtTb0l5czliaVFmZW5QN3VIbFBWajdheUZNMDYzWFBGSXJYM1dZOHhM?=
 =?utf-8?B?ekx4Q1V6UmJMYXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b2fd13f-4fca-4876-7d9c-08d9bf2c4615
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 18:05:12.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 18:05:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159703

The following patches in core don't follow the recommendation

meta/recipes-bsp/apmd/apmd/legacy.patch:
   9: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-bsp/efivar/efivar/no-werror.patch:
   3: Upstream-Status: Inappropriate 
[https://github.com/rhboot/efivar/issues/131]

meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch:
   15: Upstream-Status: Inappropriate [OE specific]

meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch:
   12: Upstream-Status: Inappropriate [OE specific]

meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch:
   9: Upstream-Status: Inappropriate [upstream hasn't been active since 
1998]

meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch:
   3: Upstream-Status: Inappropriate [upstream hasn't been active since 
1998]

meta/recipes-bsp/lrzsz/lrzsz-0.12.20/cve-2018-10195.patch:
   6: Upstream-Status: Inappropriate (dead upstream)

meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch:
   4: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch:
   10: Upstream-Status: Inappropriate [Fixes a 32-bit OE flow bug]

meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch:
   19: Upstream-Status: Inappropriate [OE Specific]

meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch:
   12: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-connectivity/bind/bind-9.16.23/bind-ensure-searching-for-json-headers-searches-sysr.patch:
   28: Upstream-Status: Inappropriate [OE Specific]

meta/recipes-connectivity/bind/bind-9.16.23/init.d-add-support-for-read-only-rootfs.patch:
   3: Upstream-Status: Inappropriate [oe specific]

meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-connectivity/connman/connman/no-version-scripts.patch:
   13: Upstream-Status: Inappropriate

meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch:
   21: Upstream-Status: Inappropriate [OE specific]

meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch:
   14: Upstream-Status: Inappropriate [OE-specific configuration/headers]

meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch:
   6: Upstream-Status: Inappropriate [Embedded]

meta/recipes-core/base-passwd/base-passwd/disable-docs.patch:
   4: Upstream-Status: Inappropriate [OE-Core specific]

meta/recipes-core/busybox/busybox/recognize_connmand.patch:
   3: Upstream-Status: Inappropriate [OE-Core]

meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch:
   14: Upstream-Status: Inappropriate [Upstream does care for AIX while 
we may not]

meta/recipes-core/dbus/dbus/python-config.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-core/dbus/dbus/tmpdir.patch:
   8: Upstream-Status: Inappropriate [embedded]

meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch:
   3: Upstream-Status: Inappropriate [test not install is for purpose 
from upstream]

meta/recipes-core/gettext/gettext-0.21/0001-init-env.in-do-not-add-C-CXX-parameters.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/gettext/gettext-0.21/0001-tests-autopoint-3-unset-MAKEFLAGS.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/gettext/gettext-0.21/serial-tests-config.patch:
   8: Upstream-Status: Inappropriate [oe specific]

meta/recipes-core/gettext/gettext-0.21/use-pkgconfig.patch:
   13: Upstream-Status: Inappropriate [upstream still refuse to consider 
pkg-config]

meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch:
   10: Upstream-Status: Inappropriate [upstream wants the paths in .pc 
files]

meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch:
   10: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch:
   10: Upstream-Status: Inappropriate

meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch:
   10: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch:
   11: Upstream-Status: Inappropriate

meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch:
   6: Upstream-Status: Inappropriate [embedded specific]

meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch:
   15: Upstream-Status: Inappropriate [OE SDK specific]

meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch:
   13: Upstream-Status: Inappropriate [SDK specific]

meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch:
   10: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch:
   10: Upstream-Status: Inappropriate (OE-specific)

meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch:
   9: Upstream-Status: Inappropriate [Distro Specific]

meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch:
   12: Upstream-Status: Inappropriate (OE-specific)

meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch:
   10: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch:
   10: Upstream-Status: Inappropriate [ OE-Specific ]

meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch:
   9: Upstream-Status: Inappropriate [ OE-Specific]

meta/recipes-core/glibc/ldconfig-native-2.12.1/endianess-header.patch:
   1: Upstream-Status: Inappropriate [fix poky patch]

meta/recipes-core/glibc/ldconfig-native-2.12.1/no-aux-cache.patch:
   4: Upstream-Status: Inappropriate

meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/ifupdown/files/tweak-ptest-script.patch:
   3: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch:
   9: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch:
   7: Upstream-Status: Inappropriate [cross-compile specific]

meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch:
   12: Upstream-Status: Inappropriate [oe-core specific; see above]

meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch:
   9: Upstream-Status: Inappropriate [config]

meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch:
   12: Upstream-Status: Inappropriate [oe specific]

meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch:
   11: Upstream-Status: Inappropriate [OE Specific]

meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch:
   1: Upstream-Status: Inappropriate  [OE-Specific]

meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch:
   1: Upstream-Status: Inappropriate  [OE-Specific]

meta/recipes-core/readline/readline-8.1/norpath.patch:
   5: Upstream-Status: Inappropriate

meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch:
   6: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch:
   9: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch:
   6: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch:
   8: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch:
   19: Upstream-Status: Inappropriate [musl specific]
   26: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch:
   13: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch:
   10: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch:
   6: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch:
   6: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch:
   25: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch:
   17: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch:
   18: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch:
   6: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch:
   19: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch:
   14: Upstream-Status: Inappropriate [musl]

meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch:
   18: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch:
   9: Upstream-Status: Inappropriate [musl specific]

meta/recipes-core/sysvinit/sysvinit/realpath.patch:
   10: Upstream-Status: Inappropriate [Linux specific]

meta/recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch:
   9: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch:
   12: Upstream-Status: Inappropriate [OE specific]

meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch:
   11: Upstream-Status: Inappropriate

meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch:
   11: Upstream-Status: Inappropriate [Cross-compile specific]

meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch:
   7: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch:
   3: Upstream-Status: Inappropriate

meta/recipes-devtools/autoconf/autoconf/no-man.patch:
   4: Upstream-Status: Inappropriate

meta/recipes-devtools/autoconf/autoconf/preferbash.patch:
   18: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/autoconf/autoconf/program_prefix.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/automake/automake/performance.patch:
   12: Upstream-Status: Inappropriate

meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch:
   13: Upstream-Status: Inappropriate [SDK specific]

meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch:
   15: Upstream-Status: Inappropriate

meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch:
   20: Upstream-Status: Inappropriate [OE specific tweak]

meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch:
   6: Upstream-Status: Inappropriate [debian patch]

meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch:
   20: Upstream-Status: Inappropriate

meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch:
   6: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch:
   7: Upstream-Status: Inappropriate [oe-core specific to solve multilib 
use case]

meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch:
   21: Upstream-Status: Inappropriate [mips64 + musl + libc-headers]

meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch:
   19: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch:
   12: Upstream-Status: Inappropriate [config]

meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch:
   11: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch:
   5: Upstream-Status: Inappropriate [docbook 4.x development has 
ceased, docbook 5 is entirely different]

meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch:
   21: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch:
   8: Upstream-Status: Inappropriate [OE Specific]

meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch:
   9: Upstream-Status: Inappropriate [embedded specific]

meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch:
   17: Upstream-Status: Inappropriate [Configuration]

meta/recipes-devtools/dpkg/dpkg/pager.patch:
   5: Upstream-Status: Inappropriate [OE-Core integration specific]

meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch:
   8: Upstream-Status: Inappropriate [issue reported 
https://github.com/tytso/e2fsprogs/issues/80]

meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch:
   9: Upstream-Status: Inappropriate

meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/elfutils/files/0003-musl-utils.patch:
   12: Upstream-Status: Inappropriate [workaround for musl]

meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch:
   11: Upstream-Status: Inappropriate [oe core specific]

meta/recipes-devtools/elfutils/files/ptest.patch:
   16: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch:
   1: Upstream-Status: Inappropriate [wrlinux specific]

meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch:
   6: Upstream-Status: Inappropriate [upstream seems dead]

meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/flex/flex/disable-tests.patch:
   9: Upstream-Status: Inappropriate

meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch:
   26: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch:
   17: Upstream-Status: Inappropriate [OE configuration]

meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch:
   14: Upstream-Status: Inappropriate [OE configuration]

meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch:
   23: Upstream-Status: Inappropriate

meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch:
   9: Upstream-Status: Inappropriate [SPE port is removed from rs600 port]

meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch:
   10: Upstream-Status: Inappropriate [OE Reproducibility specific]

meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch:
   11: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch:
   8: Upstream-Status: Inappropriate

meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch:
   12: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch:
   13: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch:
   12: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch:
   16: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/intltool/intltool/noperlcheck.patch:
   8: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch:
   21: Upstream-Status: Inappropriate [Yocto specific]

meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch:
   6: Upstream-Status: Inappropriate [upstream needs to rework this to 
support

meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch:
   7: Upstream-Status: Inappropriate [gpgme upstream does not have 
pkg-config support and is not interested in it]

meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch:
   1: Upstream-Status: Inappropriate

meta/recipes-devtools/libtool/libtool/fixinstall.patch:
   15: Upstream-Status: Inappropriate [upstream are unlikely to take a 
patch like this]

meta/recipes-devtools/libtool/libtool/multilib.patch:
   8: Upstream-Status: Inappropriate

meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch:
   7: Upstream-Status: Inappropriate

meta/recipes-devtools/m4/m4/serial-tests-config.patch:
   8: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch:
   7: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch:
   8: Upstream-Status: Inappropriate [OE specific]

meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch:
   13: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch:
   7: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/perl/files/encodefix.patch:
   4: Upstream-Status: Inappropriate [Cross compile hack]

meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch:
   9: Upstream-Status: Inappropriate (OE-specific)

meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch:
   15: Upstream-Status: Inappropriate [this patch is native and nativesdk]

meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch:
   9: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch:
   7: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch:
   10: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch:
   10: Upstream-Status: Inappropriate [oe-core cross builds]

meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch:
   18: Upstream-Status: Inappropriate [see issues above]

meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch:
   10: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch:
   10: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch:
   11: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch:
   12: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch:
   8: Upstream-Status: Inappropriate [distribution]

meta/recipes-devtools/python/python3/cgi_py.patch:
   6: Upstream-Status: Inappropriate [distribution]

meta/recipes-devtools/python/python3/crosspythonpath.patch:
   12: Upstream-Status: Inappropriate [OE-Core integration specific]

meta/recipes-devtools/python/python3/python-config.patch:
   14: Upstream-Status: Inappropriate [Embedded Specific]

meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch:
   8: Upstream-Status: Inappropriate (As the code stands, this is a hack)

meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch:
   6: Upstream-Status: Inappropriate (OE-specific)

meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch:
   9: Upstream-Status: Inappropriate [oe specific]

meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch:
   15: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch:
   7: Upstream-Status: Inappropriate - OE uses deep paths

meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch:
   44: Upstream-Status: Inappropriate [embedded specific]

meta/recipes-devtools/qemu/qemu/cross.patch:
   10: Upstream-Status: Inappropriate [may be rewritten in a way 
upstream may accept?]

meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch:
   8: Upstream-Status: Inappropriate [embedded]

meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch:
   9: Upstream-Status: Inappropriate [OE specific configuration]

meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch:
   9: Upstream-Status: Inappropriate [workaround for musl]

meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch:
   25: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch:
   9: Upstream-Status: Inappropriate

meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust.patch:
   6: Upstream-Status: Inappropriate [previous patches need to be 
upstreamed]

meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch:
   11: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/strace/strace/Makefile-ptest.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-devtools/strace/strace/ptest-spacesave.patch:
   11: Upstream-Status: Inappropriate [specific to OE image space issues]

meta/recipes-devtools/swig/swig/determinism.patch:
   4: Upstream-Status: Inappropriate [OE reproducibiity fix upstream 
unlikely to take]

meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch:
   4: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch:
   4: Upstream-Status: Inappropriate

meta/recipes-devtools/tcltk/tcl/alter-includedir.patch:
   4: Upstream-Status: Inappropriate [Configuration Specific]

meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch:
   16: Upstream-Status: Inappropriate [Yocto specific]

meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch:
   17: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch:
   11: Upstream-Status: Inappropriate

meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-extended/bash/bash/use_aclocal.patch:
   5: Upstream-Status: Inappropriate [OE configuration specific]

meta/recipes-extended/bc/bc/no-gen-libmath.patch:
   3: Upstream-Status: Inappropriate

meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch:
   9: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch:
   9: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch:
   16: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch:
   8: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch:
   10: Upstream-Status: Inappropriate [OE specific]

meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch:
   10: Upstream-Status: Inappropriate

meta/recipes-extended/gawk/gawk/test-time.patch:
   7: Upstream-Status: Inappropriate

meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch:
   11: Upstream-Status: Inappropriate [OE-Core specific]

meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch:
   7: Upstream-Status: Inappropriate [cross build specific]

meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch:
   8: Upstream-Status: Inappropriate [OE specific]

meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch:
   9: Upstream-Status: Inappropriate [needs a rework according to 
https://github.com/logrotate/logrotate/pull/429]

meta/recipes-extended/lsb/lsb-release/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-extended/mc/files/nomandate.patch:
   16: Upstream-Status: Inappropriate [OE specficic reproducibility 
workaround]

meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch:
   9: Upstream-Status: Inappropriate [Yocto specific]

meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch:
   20: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch:
   8: Upstream-Status: Inappropriate [OE specific]

meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch:
   6: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch:
   6: Upstream-Status: Inappropriate [OE specific]

meta/recipes-extended/slang/slang/terminfo_fixes.patch:
   7: Upstream-Status: Inappropriate [see above]

meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch:
   6: Upstream-Status: Inappropriate [oe specific]

meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch:
   14: Upstream-Status: Inappropriate [OE configuration specific]

meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch:
   8: Upstream-Status: Inappropriate [ embedded specific ]

meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch:
   4: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch:
   4: Upstream-Status: Inappropriate [upstream is dead]

meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch:
   5: Upstream-Status: Inappropriate oe specific

meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch:
   1: Upstream-Status: Inappropriate [cross build specific]

meta/recipes-extended/unzip/unzip/avoid-strip.patch:
   1: Upstream-Status: Inappropriate [need a new release]

meta/recipes-extended/unzip/unzip/define-ldflags.patch:
   3: Upstream-Status: Inappropriate [need a new release]

meta/recipes-extended/unzip/unzip/fix-security-format.patch:
   8: Upstream-Status: Inappropriate [need a new release]

meta/recipes-extended/unzip/unzip/symlink.patch:
   9: Upstream-Status: Inappropriate [need a new release]

meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch:
   11: Upstream-Status: Inappropriate [oe specific]

meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch:
   34: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch:
   11: Upstream-Status: Inappropriate [disables in-script docs]

meta/recipes-extended/zip/zip-3.0/fix-security-format.patch:
   17: Upstream-Status: Inappropriate [need a new release]

meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/gnome/gconf/python3.patch:
   5: Upstream-Status: Inappropriate [gconf is deprecated]

meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch:
   15: Upstream-Status: Inappropriate

meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch:
   20: Upstream-Status: Inappropriate [Evil eye expected from upstream]

meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-gnome/librsvg/librsvg/0001-Update-checksums-for-modified-files-for-libc.patch:
   6: Upstream-Status: Inappropriate [previous patches need to be 
upstreamed]

meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch:
   8: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch:
   10: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch:
   14: Upstream-Status: Inappropriate [see above]

meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch:
   9: Upstream-Status: Inappropriate [OE-core specific]

meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch:
   6: Upstream-Status: Inappropriate [already fixed in newer versions]

meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch:
   8: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch:
   6: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch:
   8: Upstream-Status: Inappropriate

meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch:
   8: Upstream-Status: Inappropriate [ OE specific ]

meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch:
   9: Upstream-Status: Inappropriate [upstream needs to update the code]

meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch:
   13: Upstream-Status: Inappropriate (disable feature incompatible with 
ptest)

meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch:
   38: Upstream-Status: Inappropriate [A work around for binutils v2.31]

meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch:
   9: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch:
   7: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch:
   9: Upstream-Status: Inappropriate [oe specific]

meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch:
   10: Upstream-Status: Inappropriate [Embedded]

meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch:
   11: Upstream-Status: Inappropriate [OE-specific]

meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch:
   8: Upstream-Status: Inappropriate [OE-specific]

meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch:
   11: Upstream-Status: Inappropriate [needs proper upstream fix]

meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch:
   9: Upstream-Status: Inappropriate [oe specific]

meta/recipes-sato/pcmanfm/files/no-desktop.patch:
   4: Upstream-Status: Inappropriate

meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch:
   11: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch:
   10: Upstream-Status: Inappropriate [disabling tests instead of fixing 
them properly]

meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch:
   8: Upstream-Status: Inappropriate

meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch:
   8: Upstream-Status: Inappropriate [OE-specific]

meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch:
   6: Upstream-Status: Inappropriate [*]

meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch:
   13: Upstream-Status: Inappropriate

meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch:
   41: Upstream-Status: Inappropriate [OE-specific]

meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch:
   14: Upstream-Status: Inappropriate [as far as open source community 
is concerned, upstream is dead]

meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch:
   13: Upstream-Status: Inappropriate [as far as open source community 
is concerned, upstream is dead]

meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch:
   10: Upstream-Status: Inappropriate [as far as open source community 
is concerned, upstream is dead]

meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch:
   10: Upstream-Status: Inappropriate [as far as open source community 
is concerned, upstream is dead]

meta/recipes-support/db/db/fix-parallel-build.patch:
   5: Upstream-Status: Inappropriate [as far as open source community is 
concerned, upstream is dead]

meta/recipes-support/db/db/sequence-type.patch:
   9: Upstream-Status: Inappropriate [as far as open source community is 
concerned, upstream is dead]

meta/recipes-support/gmp/gmp/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-support/gmp/gmp/0001-confiure.ac-Believe-the-cflags-from-environment.patch:
   15: Upstream-Status: Inappropriate [OE-Specific]

meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch:
   9: Upstream-Status: Inappropriate [oe-core specific, and only for 
-native]

meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch:
   6: Upstream-Status: Inappropriate [openembedded specific]

meta/recipes-support/gnupg/gnupg/relocate.patch:
   7: Upstream-Status: Inappropriate [OE-specific]

meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch:
   6: Upstream-Status: Inappropriate

meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch:
   10: Upstream-Status: Inappropriate [changes are specific to OE]

meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch:
   12: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch:
   6: Upstream-Status: Inappropriate [ OE Configuration ]

meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch:
   16: Upstream-Status: Inappropriate [OE specific]

meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch:
   12: Upstream-Status: Inappropriate [OE specific]

meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch:
   14: Upstream-Status: Inappropriate [SDK specific]

meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch:
   10: Upstream-Status: Inappropriate [Other]

meta/recipes-support/libffi/libffi/not-win32.patch:
   16: Upstream-Status: Inappropriate

meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch:
   11: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch:
   47: Upstream-Status: Inappropriate [oe specific]

meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch:
   10: Upstream-Status: Inappropriate [oe-core specific]

meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch:
   6: Upstream-Status: Inappropriate [gnupg upstream will not take this, 
it has been tried with other components]

meta/recipes-support/libnl/files/enable-serial-tests.patch:
   8: Upstream-Status: Inappropriate [oe-specific]

meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch:
   9: Upstream-Status: Inappropriate[oe specific]

meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch:
   24: Upstream-Status: Inappropriate [really need to fix gcc]

meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch:
   6: Upstream-Status: Inappropriate [not a complete solution]

meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch:
   9: Upstream-Status: Inappropriate [oe specific]

meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch:
   9: Upstream-Status: Inappropriate [OE specific]

meta/recipes-support/pinentry/pinentry-1.2.0/libassuan_pkgconf.patch:
   9: Upstream-Status: Inappropriate [OE specific]

meta/recipes-support/serf/serf/env.patch:
   14: Upstream-Status: Inappropriate

meta/recipes-support/serf/serf/norpath.patch:
   4: Upstream-Status: Inappropriate

meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch:
   12: Upstream-Status: Inappropriate [oe specific]

meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch:
   6: Upstream-Status: Inappropriate [oe-core specific]

or are simply ignoring it at all.

In total that are 352 patches I could indentify in latest master.

I don't want to open up another can of worms, but either we drop the 
reasoning from Inappropriate in the patch guideline completely or we
need to fix that in core (I guess in other layers it is even worse :) )

Any thoughts?

On 14.12.21 18:53, Konrad Weihmann wrote:
> if a patch uses Upstream-Status: Inappropriate it should provide a machine
> readable reasoning in square brackets.
> 
> According to latest wiki entry that would be
> 
> not author
> native
> licensing
> configuration
> enable feature
> disable feature
> bugfix .*
> embedded specific
> no upstream
> other
> 
> a detailed reasoning could be provided as part of the commit message,
> but format of the metadata line is fixed.
> 
> This patch adds a check to insane.bbclass and warns if there is a
> non-compliant reasoning given, or none at all.
> 
> In a follow-up this should be turned into an error, as it was done
> with missing Upstream-Status
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta/classes/insane.bbclass | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..da26f4662c 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1191,6 +1191,26 @@ python do_qa_patch() {
>                  bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
>              else:
>                  bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
> +
> +       inappr_message_re = r'Inappropriate(\s+\[(?P<reason>.*)\])*'
> +       inappr_reasons = [
> +            'not author',
> +            'native',
> +            'licensing',
> +            'configuration',
> +            'enable feature',
> +            'disable feature',
> +            'bugfix .*',
> +            'embedded specific',
> +            'no upstream',
> +            'other',
> +       ]
> +       for match_inappr in re.finditer(inappr_message_re, content, re.IGNORECASE | re.MULTILINE):
> +
> +           if 'reason' not in match_inappr.groupdict():
> +               bb.warning("Missing Upstream-Status: Inappropriate reasoning in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
> +           elif not any(re.match(x, match_inappr.groupdict().get('reason', '') or '') for x in inappr_reasons):
> +               bb.warning("Malformed Upstream-Status: Inappropriate in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_inappr.group(0)))
>   }
>   
>   python do_qa_configure() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159701): https://lists.openembedded.org/g/openembedded-core/message/159701
> Mute This Topic: https://lists.openembedded.org/mt/87726727/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

