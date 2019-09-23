Return-Path: <shuagr@microsoft.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680127.outbound.protection.outlook.com [40.107.68.127])
	by mail.openembedded.org (Postfix) with ESMTP id 9839B7DE8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CjxchxdiEFVOeB1o+yg+tB+NCOAXdeX9at018QzqaqNDJm5hC/ZfN3VUmYYJDUApHAgifCkk4WY1R9KkLLyvyPKTaxJH65pWIAIwlxUGBYON/Jd9LC599E+ExUlPudP7QJK0ni8BhPIbXSpnyuBJaj5F+7hXurN50lN//Zm0MKk+zzqOrzjUgpXhvYHTNqE1fJ4XiH/G78voMj7DyWDl3wUE0Lf3AEWl00sPc60LBX4RhYgSqRCGyceGoXxR4d2QWUIW2p9q9PID2E1KwHacKpCAqOfd99AsvwpL3VxJEseKILST/OSrw/dfs/v4zC09UqgS+giNEyPyXle4Ot86rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CVDRY8BjPcQg/FegHAKPiQ/0j7mk4Zn9V0ReyfXqcdw=;
	b=CNuC+jqAFQUyH+m54UjRN3QktU1FXq40FNGLo9mzFlztVQm0VcfF5+vvLIL4zD7b+cJboiUENqnmlcBzOhfF8cLYa5rUTtzvx26nKwscqV8sI5qHD9q1o8OniIw6cEQ21NFQ2x9bnaigw4U5ubDUG4mqYsjsZLYvU8FTKyNJg27EBYE4xITn8cKRF5q+a9lxn10Sr/cNVGujYDoKja6uOzkBVuybJtgMRvWjMvOOoYMr6i4aGXBwoQTUOIPs9g29lsLxE/i/8KwyzHmq+SXJt71TdXiN/TKB03y4inMCqqKS0GNJaS1PtDMM3ZZV5mn06zRIEV89WkjlZ+9hPbyXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=microsoft.com; dmarc=pass action=none
	header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CVDRY8BjPcQg/FegHAKPiQ/0j7mk4Zn9V0ReyfXqcdw=;
	b=PqzXUluu+NOIoxJoY2hVxIa2TZiBHys0bbV2JnPBpwnb0OQdndl+apI/DDwYV8ATNxnxFiAIuRwnZL4wcOv6kaEE+YZD08DSpRxZakkQ9j0b3dqgSKutUw9qF5QM5gqExFxO/lQYQ7l+DeL8z9lujKg9CWtL+Rh3nUt39QwT/qo=
Received: from MW2PR2101MB0891.namprd21.prod.outlook.com (52.132.152.23) by
	MW2PR2101MB1132.namprd21.prod.outlook.com (52.132.146.17) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.3; Mon, 23 Sep 2019 21:28:32 +0000
Received: from MW2PR2101MB0891.namprd21.prod.outlook.com
	([fe80::e0ac:ec6d:b5cf:35ae]) by
	MW2PR2101MB0891.namprd21.prod.outlook.com
	([fe80::e0ac:ec6d:b5cf:35ae%9]) with mapi id 15.20.2305.013;
	Mon, 23 Sep 2019 21:28:32 +0000
From: Shubham Agrawal <shuagr@microsoft.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?[OE-core]_[=94OE-core][thud][PATCH=94]_elfutils:_CVE_fix?=
	=?Windows-1252?Q?_for_elfutils?=
Thread-Index: AQHVclPdga/aDcXvDU6FJRTP0k3Jqac5xHKAgAACWXU=
Date: Mon, 23 Sep 2019 21:28:32 +0000
Message-ID: <MW2PR2101MB089120BDA262C3520325EF2EDB850@MW2PR2101MB0891.namprd21.prod.outlook.com>
References: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>,
	<54b8bdc7-c735-2e7a-2652-9891dd3f1d1b@gmail.com>
In-Reply-To: <54b8bdc7-c735-2e7a-2652-9891dd3f1d1b@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shuagr@microsoft.com; 
x-originating-ip: [167.220.2.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f612ad2-3557-49c7-6244-08d7406cfc1d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MW2PR2101MB1132:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MW2PR2101MB1132116E3447CF7E39BF9057DB850@MW2PR2101MB1132.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(54534003)(476003)(6246003)(18265965003)(76116006)(186003)(66946007)(2906002)(99286004)(11346002)(14454004)(110136005)(3846002)(66476007)(316002)(53546011)(52536014)(86362001)(6116002)(74316002)(22452003)(66446008)(66556008)(102836004)(26005)(8936002)(2501003)(6506007)(8990500004)(7696005)(64756008)(236005)(6436002)(5024004)(446003)(4001150100001)(54896002)(229853002)(9686003)(6306002)(71190400001)(486006)(7736002)(10090500001)(71200400001)(256004)(30864003)(76176011)(81166006)(33656002)(10290500003)(66066001)(25786009)(81156014)(5660300002)(478600001)(55016002)(606006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB1132;
	H:MW2PR2101MB0891.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m6TTxtFHeWhZeoCV/6clCUaKc2bnY9eTyaUL2Nq3anma0RevAwsSDG6X0VtT/BVtFIU1RVrxLB/bxvxbeRz7ONwMh2eeEfWQ28+QklomwImkPCMWMBHDxAM7YUB+OjxScNGqPfFB7camFT+8z/1wkhmyNWez/pAccF+Ka7gPByeUuDaDnMSSDf+g86/uRFyDm2TCGAQywg5CELhAL3nXOB/ocqOWNmkSY4YlS5ihqnKe4I6pdSGUnZuMWmaN/Ta0fF2n+8KyB7LZ5rEpXc45i/IVhkA9qUiaupgxhX94t1gVNi7kj7FBWn091pRIOnQBRIaegArb95yyNj3r8OrUkCMh4Kbp5NpguTs5udcVhpC3SxluMvFKSFnthXCTqetuhxYEZXaj+LCpq9UWc2CnSr4wjRiFtRikhWA9hPL0e8M=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f612ad2-3557-49c7-6244-08d7406cfc1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 21:28:32.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hBGZhpLIQ9Pzj8y8uyT0hLIzPo/7s1UQMmanTcbguQzuaGUiwfqn/cjNXewqRRxLby/G4VJjLaiLyp8hjZ4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1132
Subject: =?UTF-8?B?UmU6IFvigJ1PRS1jb3JlXVt0aHVkXVtQQVRDSOKAnV0gZWxmdXRpbHM6IENWRSBmaXggZm9yIGVsZnV0aWxz?=
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
X-List-Received-Date: Mon, 23 Sep 2019 21:28:34 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW2PR2101MB089120BDA262C3520325EF2EDB850MW2PR2101MB0891_"

--_000_MW2PR2101MB089120BDA262C3520325EF2EDB850MW2PR2101MB0891_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

The patches are all same. There was an error in the subject due to which it=
 wasn=92t reflecting in the submitted patches on open embedded core.

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10

________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Monday, September 23, 2019 2:19:15 PM
To: Shubham Agrawal <shuagr@microsoft.com>; openembedded-core@lists.openemb=
edded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [=94OE-core][thud][PATCH=94] elfutils: CVE fix for e=
lfutils



On 9/23/19 2:14 PM, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>
>
> CVE: CVE-2019-7664.patch
> CVE: CVE-2019-7665.patch

This is the third email patch on the same issues. Are they different?

regards,
Armin
>
> Sign off: Shubham Agrawal <shuagr@microsoft.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
>  .../elfutils/files/CVE-2019-7664.patch             |  65 +++++++++
>  .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++++++++=
++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.pa=
tch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.pa=
tch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.175.bb
> index e94a48e..862a9b6 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> @@ -31,6 +31,8 @@ SRC_URI =3D "https://nam06.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fsourceware.org%2Felfutils%2Fftp%2F%24&amp;data=3D=
02%7C01%7Cshuagr%40microsoft.com%7C0a3b7e85865a440119d508d7406bb255%7C72f98=
8bf86f141af91ab2d7cd011db47%7C1%7C0%7C637048703613961219&amp;sdata=3DJ1z7WG=
LoV1xEpBxRaWekNFf0HDIvmCtUMpLYUb1nR%2Fk%3D&amp;reserved=3D0{PV}/${BP}.tar.b=
z2 \
>             file://CVE-2019-7150.patch \
>             file://CVE-2019-7146_p1.patch \
>             file://CVE-2019-7146_p2.patch \
> +           file://CVE-2019-7664.patch \
> +           file://CVE-2019-7665.patch \
>             "
>  SRC_URI_append_libc-musl =3D " file://0008-build-Provide-alternatives-fo=
r-glibc-assumptions-hel.patch"
>
> diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch b/m=
eta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
> new file mode 100644
> index 0000000..e55dc5a
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch
> @@ -0,0 +1,65 @@
> +From 3ed05376e7b2c96c1d6eb24d2842cc25b79a4f07 Mon Sep 17 00:00:00 2001
> +From: Mark Wielaard <mark@klomp.org>
> +Date: Wed, 16 Jan 2019 12:25:57 +0100
> +Subject: [PATCH] CVE: CVE-2019-7664
> +
> +Upstream-Status: Backport
> +libelf: Correct overflow check in note_xlate.
> +
> +We want to make sure the note_len doesn't overflow and becomes shorter
> +than the note header. But the namesz and descsz checks got the note head=
er
> +size wrong). Replace the wrong constant (8) with a sizeof cvt_Nhdr (12).
> +
> +https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsour=
ceware.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D24084&amp;data=3D02%7C01%7Cshua=
gr%40microsoft.com%7C0a3b7e85865a440119d508d7406bb255%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C637048703613961219&amp;sdata=3DXDpI1uUOmF4w%2FdtsO%=
2BspaDCLIOEdoGQr6PNxaJh3u%2Fc%3D&amp;reserved=3D0
> +
> +Signed-off-by: Mark Wielaard <mark@klomp.org>
> +Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3a=
d.xx.internal.cloudapp.net>
> +---
> + libelf/ChangeLog    | 13 +++++++++++++
> + libelf/note_xlate.h |  4 ++--
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
> +index 68c4fbd..892e6e7 100644
> +--- a/libelf/ChangeLog
> ++++ b/libelf/ChangeLog
> +@@ -1,3 +1,16 @@
> ++<<<<<<< HEAD
> ++=3D=3D=3D=3D=3D=3D=3D
> ++2019-01-16  Mark Wielaard  <mark@klomp.org>
> ++
> ++    * note_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't
> ++    overflow note_len into note header.
> ++
> ++2018-11-17  Mark Wielaard  <mark@klomp.org>
> ++
> ++    * elf32_updatefile.c (updatemmap): Make sure to call convert
> ++    function on a properly aligned destination.
> ++
> ++>>>>>>> e65d91d... libelf: Correct overflow check in note_xlate.
> + 2018-11-16  Mark Wielaard  <mark@klomp.org>
> +
> +      * libebl.h (__elf32_msize): Mark with const attribute.
> +diff --git a/libelf/note_xlate.h b/libelf/note_xlate.h
> +index 9bdc3e2..bc9950f 100644
> +--- a/libelf/note_xlate.h
> ++++ b/libelf/note_xlate.h
> +@@ -46,13 +46,13 @@ elf_cvt_note (void *dest, const void *src, size_t le=
n, int encode,
> +       /* desc needs to be aligned.  */
> +       note_len +=3D n->n_namesz;
> +       note_len =3D nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_l=
en);
> +-      if (note_len > len || note_len < 8)
> ++      if (note_len > len || note_len < sizeof *n)
> +      break;
> +
> +       /* data as a whole needs to be aligned.  */
> +       note_len +=3D n->n_descsz;
> +       note_len =3D nhdr8 ? NOTE_ALIGN8 (note_len) : NOTE_ALIGN4 (note_l=
en);
> +-      if (note_len > len || note_len < 8)
> ++      if (note_len > len || note_len < sizeof *n)
> +      break;
> +
> +       /* Copy or skip the note data.  */
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch b/m=
eta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
> new file mode 100644
> index 0000000..a1bb309
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch
> @@ -0,0 +1,154 @@
> +From 4323d46c4a369b614aa1f574805860b3434552df Mon Sep 17 00:00:00 2001
> +From: Mark Wielaard <mark@klomp.org>
> +Date: Wed, 16 Jan 2019 15:41:31 +0100
> +Subject: [PATCH] CVE: CVE-2019-7665
> +
> +Upstream-Status: Backport
> +
> +Sign off: Shubham Agrawal <shuagr@microsoft.com>
> +
> +libebl: Check NT_PLATFORM core notes contain a zero terminated string.
> +
> +Most strings in core notes are fixed size. But NT_PLATFORM contains just
> +a variable length string. Check that it is actually zero terminated
> +before passing to readelf to print.
> +
> +https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsour=
ceware.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D24089&amp;data=3D02%7C01%7Cshua=
gr%40microsoft.com%7C0a3b7e85865a440119d508d7406bb255%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C637048703613961219&amp;sdata=3DWQe4updGnCdqEq%2FgiV=
bXZT%2FWc4sUd%2FoBef7x9f7jGE8%3D&amp;reserved=3D0
> +
> +Signed-off-by: Mark Wielaard <mark@klomp.org>
> +Signed-off-by: Ubuntu <lisa@shuagr-yocto-build.mdn4q2lr1oauhmizmzsslly3a=
d.xx.internal.cloudapp.net>
> +---
> + libdwfl/linux-core-attach.c |  9 +++++----
> + libebl/eblcorenote.c        | 39 +++++++++++++++++++-------------------=
-
> + libebl/libebl.h             |  3 ++-
> + src/readelf.c               |  2 +-
> + 4 files changed, 27 insertions(+), 26 deletions(-)
> +
> +diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-attach.c
> +index 6c99b9e..c0f1b0d 100644
> +--- a/libdwfl/linux-core-attach.c
> ++++ b/libdwfl/linux-core-attach.c
> +@@ -137,7 +137,7 @@ core_next_thread (Dwfl *dwfl __attribute__ ((unused)=
), void *dwfl_arg,
> +       const Ebl_Register_Location *reglocs;
> +       size_t nitems;
> +       const Ebl_Core_Item *items;
> +-      if (! ebl_core_note (core_arg->ebl, &nhdr, name,
> ++      if (! ebl_core_note (core_arg->ebl, &nhdr, name, desc,
> +                         &regs_offset, &nregloc, &reglocs, &nitems, &ite=
ms))
> +      {
> +        /* This note may be just not recognized, skip it.  */
> +@@ -191,8 +191,9 @@ core_set_initial_registers (Dwfl_Thread *thread, voi=
d *thread_arg_voidp)
> +   const Ebl_Register_Location *reglocs;
> +   size_t nitems;
> +   const Ebl_Core_Item *items;
> +-  int core_note_err =3D ebl_core_note (core_arg->ebl, &nhdr, name, &reg=
s_offset,
> +-                                 &nregloc, &reglocs, &nitems, &items);
> ++  int core_note_err =3D ebl_core_note (core_arg->ebl, &nhdr, name, desc=
,
> ++                                 &regs_offset, &nregloc, &reglocs,
> ++                                 &nitems, &items);
> +   /* __libdwfl_attach_state_for_core already verified the note is there=
.  */
> +   assert (core_note_err !=3D 0);
> +   assert (nhdr.n_type =3D=3D NT_PRSTATUS);
> +@@ -383,7 +384,7 @@ dwfl_core_file_attach (Dwfl *dwfl, Elf *core)
> +       const Ebl_Register_Location *reglocs;
> +       size_t nitems;
> +       const Ebl_Core_Item *items;
> +-      if (! ebl_core_note (ebl, &nhdr, name,
> ++      if (! ebl_core_note (ebl, &nhdr, name, desc,
> +                         &regs_offset, &nregloc, &reglocs, &nitems, &ite=
ms))
> +      {
> +        /* This note may be just not recognized, skip it.  */
> +diff --git a/libebl/eblcorenote.c b/libebl/eblcorenote.c
> +index 783f981..7fab397 100644
> +--- a/libebl/eblcorenote.c
> ++++ b/libebl/eblcorenote.c
> +@@ -36,11 +36,13 @@
> + #include <inttypes.h>
> + #include <stdio.h>
> + #include <stddef.h>
> ++#include <string.h>
> + #include <libeblP.h>
> +
> +
> + int
> + ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name,
> ++           const char *desc,
> +             GElf_Word *regs_offset, size_t *nregloc,
> +             const Ebl_Register_Location **reglocs, size_t *nitems,
> +             const Ebl_Core_Item **items)
> +@@ -51,28 +53,25 @@ ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, cons=
t char *name,
> +     {
> +       /* The machine specific function did not know this type.  */
> +
> +-      *regs_offset =3D 0;
> +-      *nregloc =3D 0;
> +-      *reglocs =3D NULL;
> +-      switch (nhdr->n_type)
> ++      /* NT_PLATFORM is kind of special since it needs a zero terminate=
d
> ++         string (other notes often have a fixed size string).  */
> ++      static const Ebl_Core_Item platform[] =3D
> +      {
> +-#define ITEMS(type, table)                          \
> +-      case type:                                     \
> +-        *items =3D table;                              \
> +-        *nitems =3D sizeof table / sizeof table[0];    \
> +-        result =3D 1;                                  \
> +-        break
> ++      {
> ++        .name =3D "Platform",
> ++        .type =3D ELF_T_BYTE, .count =3D 0, .format =3D 's'
> ++      }
> ++    };
> +
> +-      static const Ebl_Core_Item platform[] =3D
> +-        {
> +-          {
> +-            .name =3D "Platform",
> +-            .type =3D ELF_T_BYTE, .count =3D 0, .format =3D 's'
> +-          }
> +-        };
> +-      ITEMS (NT_PLATFORM, platform);
> +-
> +-#undef      ITEMS
> ++      if (nhdr->n_type =3D=3D NT_PLATFORM
> ++      && memchr (desc, '\0', nhdr->n_descsz) !=3D NULL)
> ++        {
> ++      *regs_offset =3D 0;
> ++      *nregloc =3D 0;
> ++      *reglocs =3D NULL;
> ++      *items =3D platform;
> ++      *nitems =3D 1;
> ++      result =3D 1;
> +      }
> +     }
> +
> +diff --git a/libebl/libebl.h b/libebl/libebl.h
> +index ca9b9fe..24922eb 100644
> +--- a/libebl/libebl.h
> ++++ b/libebl/libebl.h
> +@@ -319,7 +319,8 @@ typedef struct
> +
> + /* Describe the format of a core file note with the given header and NA=
ME.
> +    NAME is not guaranteed terminated, it's NHDR->n_namesz raw bytes.  *=
/
> +-extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *=
name,
> ++extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,
> ++                      const char *name, const char *desc,
> +                        GElf_Word *regs_offset, size_t *nregloc,
> +                        const Ebl_Register_Location **reglocs,
> +                        size_t *nitems, const Ebl_Core_Item **items)
> +diff --git a/src/readelf.c b/src/readelf.c
> +index 3a73710..71651e0 100644
> +--- a/src/readelf.c
> ++++ b/src/readelf.c
> +@@ -12153,7 +12153,7 @@ handle_core_note (Ebl *ebl, const GElf_Nhdr *nhd=
r,
> +   size_t nitems;
> +   const Ebl_Core_Item *items;
> +
> +-  if (! ebl_core_note (ebl, nhdr, name,
> ++  if (! ebl_core_note (ebl, nhdr, name, desc,
> +                     &regs_offset, &nregloc, &reglocs, &nitems, &items))
> +     return;
> +
> +--
> +2.7.4
> +


--_000_MW2PR2101MB089120BDA262C3520325EF2EDB850MW2PR2101MB0891_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">The patches are all same. There was an error in the =
subject due to which it wasn=92t reflecting in the submitted patches on ope=
n embedded core.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows 10</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 2:19:15 PM<br>
<b>To:</b> Shubham Agrawal &lt;shuagr@microsoft.com&gt;; openembedded-core@=
lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [=94OE-core][thud][PATCH=94] elfutils: CVE fi=
x for elfutils</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 9/23/19 2:14 PM, shuagr97@gmail.com wrote:<br>
&gt; From: Shubham Agrawal &lt;shuagr@microsoft.com&gt;<br>
&gt;<br>
&gt; CVE: CVE-2019-7664.patch<br>
&gt; CVE: CVE-2019-7665.patch<br>
<br>
This is the third email patch on the same issues. Are they different?<br>
<br>
regards,<br>
Armin<br>
&gt;<br>
&gt; Sign off: Shubham Agrawal &lt;shuagr@microsoft.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/elfutils/elfutils_0.175.bb&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;<br>
&gt;&nbsp; .../elfutils/files/CVE-2019-7664.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 65 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../elfutils/files/CVE-2019-7665.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 154 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;<br>
&gt;&nbsp; 3 files changed, 221 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019=
-7664.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019=
-7665.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/r=
ecipes-devtools/elfutils/elfutils_0.175.bb<br>
&gt; index e94a48e..862a9b6 100644<br>
&gt; --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-devtools/elfutils/elfutils_0.175.bb<br>
&gt; @@ -31,6 &#43;31,8 @@ SRC_URI =3D &quot;<a href=3D""></a>https://nam06=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourceware.org%2Felf=
utils%2Fftp%2F%24&amp;amp;data=3D02%7C01%7Cshuagr%40microsoft.com%7C0a3b7e8=
5865a440119d508d7406bb255%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6370=
48703613961219&amp;amp;sdata=3DJ1z7WGLoV1xEpBxRaWekNFf0HDIvmCtUMpLYUb1nR%2F=
k%3D&amp;amp;reserved=3D0{PV}/${BP}.tar.bz2
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2019-7150.patch">file://CVE-2019-7150.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2019-7146_p1.patch">file://CVE-2019-7146_p1.patch</=
a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2019-7146_p2.patch">file://CVE-2019-7146_p2.patch</=
a> \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://CVE-2019-7664.patch">file://CVE-2019-7664.patch</a> \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://CVE-2019-7665.patch">file://CVE-2019-7665.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; SRC_URI_append_libc-musl =3D &quot; <a href=3D"file://0008-build=
-Provide-alternatives-for-glibc-assumptions-hel.patch">
file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch</a>&=
quot;<br>
&gt;&nbsp; <br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch =
b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e55dc5a<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta/recipes-devtools/elfutils/files/CVE-2019-7664.p=
atch<br>
&gt; @@ -0,0 &#43;1,65 @@<br>
&gt; &#43;From 3ed05376e7b2c96c1d6eb24d2842cc25b79a4f07 Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Mark Wielaard &lt;mark@klomp.org&gt;<br>
&gt; &#43;Date: Wed, 16 Jan 2019 12:25:57 &#43;0100<br>
&gt; &#43;Subject: [PATCH] CVE: CVE-2019-7664<br>
&gt; &#43;<br>
&gt; &#43;Upstream-Status: Backport<br>
&gt; &#43;libelf: Correct overflow check in note_xlate.<br>
&gt; &#43;<br>
&gt; &#43;We want to make sure the note_len doesn't overflow and becomes sh=
orter<br>
&gt; &#43;than the note header. But the namesz and descsz checks got the no=
te header<br>
&gt; &#43;size wrong). Replace the wrong constant (8) with a sizeof cvt_Nhd=
r (12).<br>
&gt; &#43;<br>
&gt; &#43;https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsourceware.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D24084&amp;amp;data=3D02%=
7C01%7Cshuagr%40microsoft.com%7C0a3b7e85865a440119d508d7406bb255%7C72f988bf=
86f141af91ab2d7cd011db47%7C1%7C0%7C637048703613961219&amp;amp;sdata=3DXDpI1=
uUOmF4w%2FdtsO%2BspaDCLIOEdoGQr6PNxaJh3u%2Fc%3D&amp;amp;reserved=3D0<br>
&gt; &#43;<br>
&gt; &#43;Signed-off-by: Mark Wielaard &lt;mark@klomp.org&gt;<br>
&gt; &#43;Signed-off-by: Ubuntu &lt;lisa@shuagr-yocto-build.mdn4q2lr1oauhmi=
zmzsslly3ad.xx.internal.cloudapp.net&gt;<br>
&gt; &#43;---<br>
&gt; &#43; libelf/ChangeLog&nbsp;&nbsp;&nbsp; | 13 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &#43; libelf/note_xlate.h |&nbsp; 4 &#43;&#43;--<br>
&gt; &#43; 2 files changed, 15 insertions(&#43;), 2 deletions(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/libelf/ChangeLog b/libelf/ChangeLog<br>
&gt; &#43;index 68c4fbd..892e6e7 100644<br>
&gt; &#43;--- a/libelf/ChangeLog<br>
&gt; &#43;&#43;&#43;&#43; b/libelf/ChangeLog<br>
&gt; &#43;@@ -1,3 &#43;1,16 @@<br>
&gt; &#43;&#43;&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD<br>
&gt; &#43;&#43;=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &#43;&#43;2019-01-16&nbsp; Mark Wielaard&nbsp; &lt;mark@klomp.org&gt;<=
br>
&gt; &#43;&#43;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; * note_xlate.h (elf_cvt_note): Check n_na=
mesz and n_descsz don't<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; overflow note_len into note header.<br>
&gt; &#43;&#43;<br>
&gt; &#43;&#43;2018-11-17&nbsp; Mark Wielaard&nbsp; &lt;mark@klomp.org&gt;<=
br>
&gt; &#43;&#43;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; * elf32_updatefile.c (updatemmap): Make s=
ure to call convert<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; function on a properly aligned destinatio=
n.<br>
&gt; &#43;&#43;<br>
&gt; &#43;&#43;&gt;&gt;&gt;&gt;&gt;&gt;&gt; e65d91d... libelf: Correct over=
flow check in note_xlate.<br>
&gt; &#43; 2018-11-16&nbsp; Mark Wielaard&nbsp; &lt;mark@klomp.org&gt;<br>
&gt; &#43; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * libebl.h (__elf32_msize): Mark w=
ith const attribute.<br>
&gt; &#43;diff --git a/libelf/note_xlate.h b/libelf/note_xlate.h<br>
&gt; &#43;index 9bdc3e2..bc9950f 100644<br>
&gt; &#43;--- a/libelf/note_xlate.h<br>
&gt; &#43;&#43;&#43;&#43; b/libelf/note_xlate.h<br>
&gt; &#43;@@ -46,13 &#43;46,13 @@ elf_cvt_note (void *dest, const void *src=
, size_t len, int encode,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* desc needs to be aligned.=
&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note_len &#43;=3D n-&gt;n_na=
mesz;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note_len =3D nhdr8 ? NOTE_AL=
IGN8 (note_len) : NOTE_ALIGN4 (note_len);<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (note_len &gt; len || note_len=
 &lt; 8)<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (note_len &gt; len || note=
_len &lt; sizeof *n)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* data as a whole needs to =
be aligned.&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note_len &#43;=3D n-&gt;n_de=
scsz;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note_len =3D nhdr8 ? NOTE_AL=
IGN8 (note_len) : NOTE_ALIGN4 (note_len);<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (note_len &gt; len || note_len=
 &lt; 8)<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (note_len &gt; len || note=
_len &lt; sizeof *n)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Copy or skip the note dat=
a.&nbsp; */<br>
&gt; &#43;-- <br>
&gt; &#43;2.7.4<br>
&gt; &#43;<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch =
b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a1bb309<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta/recipes-devtools/elfutils/files/CVE-2019-7665.p=
atch<br>
&gt; @@ -0,0 &#43;1,154 @@<br>
&gt; &#43;From 4323d46c4a369b614aa1f574805860b3434552df Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Mark Wielaard &lt;mark@klomp.org&gt;<br>
&gt; &#43;Date: Wed, 16 Jan 2019 15:41:31 &#43;0100<br>
&gt; &#43;Subject: [PATCH] CVE: CVE-2019-7665<br>
&gt; &#43;<br>
&gt; &#43;Upstream-Status: Backport<br>
&gt; &#43;<br>
&gt; &#43;Sign off: Shubham Agrawal &lt;shuagr@microsoft.com&gt;<br>
&gt; &#43;<br>
&gt; &#43;libebl: Check NT_PLATFORM core notes contain a zero terminated st=
ring.<br>
&gt; &#43;<br>
&gt; &#43;Most strings in core notes are fixed size. But NT_PLATFORM contai=
ns just<br>
&gt; &#43;a variable length string. Check that it is actually zero terminat=
ed<br>
&gt; &#43;before passing to readelf to print.<br>
&gt; &#43;<br>
&gt; &#43;https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsourceware.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D24089&amp;amp;data=3D02%=
7C01%7Cshuagr%40microsoft.com%7C0a3b7e85865a440119d508d7406bb255%7C72f988bf=
86f141af91ab2d7cd011db47%7C1%7C0%7C637048703613961219&amp;amp;sdata=3DWQe4u=
pdGnCdqEq%2FgiVbXZT%2FWc4sUd%2FoBef7x9f7jGE8%3D&amp;amp;reserved=3D0<br>
&gt; &#43;<br>
&gt; &#43;Signed-off-by: Mark Wielaard &lt;mark@klomp.org&gt;<br>
&gt; &#43;Signed-off-by: Ubuntu &lt;lisa@shuagr-yocto-build.mdn4q2lr1oauhmi=
zmzsslly3ad.xx.internal.cloudapp.net&gt;<br>
&gt; &#43;---<br>
&gt; &#43; libdwfl/linux-core-attach.c |&nbsp; 9 &#43;&#43;&#43;&#43;&#43;-=
---<br>
&gt; &#43; libebl/eblcorenote.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 39 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;--------------------<br>
&gt; &#43; libebl/libebl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;-<br>
&gt; &#43; src/readelf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;-<br>
&gt; &#43; 4 files changed, 27 insertions(&#43;), 26 deletions(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-att=
ach.c<br>
&gt; &#43;index 6c99b9e..c0f1b0d 100644<br>
&gt; &#43;--- a/libdwfl/linux-core-attach.c<br>
&gt; &#43;&#43;&#43;&#43; b/libdwfl/linux-core-attach.c<br>
&gt; &#43;@@ -137,7 &#43;137,7 @@ core_next_thread (Dwfl *dwfl __attribute_=
_ ((unused)), void *dwfl_arg,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const Ebl_Register_Location =
*reglocs;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t nitems;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const Ebl_Core_Item *items;<=
br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! ebl_core_note (core_arg-&gt=
;ebl, &amp;nhdr, name,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! ebl_core_note (core_arg=
-&gt;ebl, &amp;nhdr, name, desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &amp;regs_offset, &amp;nregloc, &amp;reglocs, &amp;nitems, &amp;items)=
)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This note may be ju=
st not recognized, skip it.&nbsp; */<br>
&gt; &#43;@@ -191,8 &#43;191,9 @@ core_set_initial_registers (Dwfl_Thread *=
thread, void *thread_arg_voidp)<br>
&gt; &#43;&nbsp;&nbsp; const Ebl_Register_Location *reglocs;<br>
&gt; &#43;&nbsp;&nbsp; size_t nitems;<br>
&gt; &#43;&nbsp;&nbsp; const Ebl_Core_Item *items;<br>
&gt; &#43;-&nbsp; int core_note_err =3D ebl_core_note (core_arg-&gt;ebl, &a=
mp;nhdr, name, &amp;regs_offset,<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;nregloc, &amp;re=
glocs, &amp;nitems, &amp;items);<br>
&gt; &#43;&#43;&nbsp; int core_note_err =3D ebl_core_note (core_arg-&gt;ebl=
, &amp;nhdr, name, desc,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;regs_offset,=
 &amp;nregloc, &amp;reglocs,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;nitems, &amp=
;items);<br>
&gt; &#43;&nbsp;&nbsp; /* __libdwfl_attach_state_for_core already verified =
the note is there.&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp; assert (core_note_err !=3D 0);<br>
&gt; &#43;&nbsp;&nbsp; assert (nhdr.n_type =3D=3D NT_PRSTATUS);<br>
&gt; &#43;@@ -383,7 &#43;384,7 @@ dwfl_core_file_attach (Dwfl *dwfl, Elf *c=
ore)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const Ebl_Register_Location =
*reglocs;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t nitems;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const Ebl_Core_Item *items;<=
br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! ebl_core_note (ebl, &amp;nh=
dr, name,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! ebl_core_note (ebl, &am=
p;nhdr, name, desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &amp;regs_offset, &amp;nregloc, &amp;reglocs, &amp;nitems, &amp;items)=
)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This note may be ju=
st not recognized, skip it.&nbsp; */<br>
&gt; &#43;diff --git a/libebl/eblcorenote.c b/libebl/eblcorenote.c<br>
&gt; &#43;index 783f981..7fab397 100644<br>
&gt; &#43;--- a/libebl/eblcorenote.c<br>
&gt; &#43;&#43;&#43;&#43; b/libebl/eblcorenote.c<br>
&gt; &#43;@@ -36,11 &#43;36,13 @@<br>
&gt; &#43; #include &lt;inttypes.h&gt;<br>
&gt; &#43; #include &lt;stdio.h&gt;<br>
&gt; &#43; #include &lt;stddef.h&gt;<br>
&gt; &#43;&#43;#include &lt;string.h&gt;<br>
&gt; &#43; #include &lt;libeblP.h&gt;<br>
&gt; &#43; <br>
&gt; &#43; <br>
&gt; &#43; int<br>
&gt; &#43; ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const char *name=
,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 const char *desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; GElf_Word *regs_offset, size_t *nregloc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; const Ebl_Register_Location **reglocs, size_t *nitems,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; const Ebl_Core_Item **items)<br>
&gt; &#43;@@ -51,28 &#43;53,25 @@ ebl_core_note (Ebl *ebl, const GElf_Nhdr =
*nhdr, const char *name,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The machine specific func=
tion did not know this type.&nbsp; */<br>
&gt; &#43; <br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *regs_offset =3D 0;<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *nregloc =3D 0;<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *reglocs =3D NULL;<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (nhdr-&gt;n_type)<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NT_PLATFORM is kind of spe=
cial since it needs a zero terminated<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string (oth=
er notes often have a fixed size string).&nbsp; */<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const Ebl_Core_Item pl=
atform[] =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;-#define ITEMS(type, table)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case type:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *items =3D table;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *nitems =3D sizeof ta=
ble / sizeof table[0];&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D 1;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;P=
latform&quot;,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type =3D ELF_T_B=
YTE, .count =3D 0, .format =3D 's'<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; };<br>
&gt; &#43; <br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const Ebl_Core_Item platfo=
rm[] =3D<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .name =3D &quot;Platform&quot;,<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .type =3D ELF_T_BYTE, .count =3D 0, .format =3D 's'<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITEMS (NT_PLATFORM, platform);<br=
>
&gt; &#43;-<br>
&gt; &#43;-#undef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITEMS<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nhdr-&gt;n_type =3D=3D NT=
_PLATFORM<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; memchr (desc, '\0'=
, nhdr-&gt;n_descsz) !=3D NULL)<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *regs_offset =3D 0;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *nregloc =3D 0;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *reglocs =3D NULL;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *items =3D platform;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *nitems =3D 1;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D 1;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43; <br>
&gt; &#43;diff --git a/libebl/libebl.h b/libebl/libebl.h<br>
&gt; &#43;index ca9b9fe..24922eb 100644<br>
&gt; &#43;--- a/libebl/libebl.h<br>
&gt; &#43;&#43;&#43;&#43; b/libebl/libebl.h<br>
&gt; &#43;@@ -319,7 &#43;319,8 @@ typedef struct<br>
&gt; &#43; <br>
&gt; &#43; /* Describe the format of a core file note with the given header=
 and NAME.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; NAME is not guaranteed terminated, it's NHDR-&=
gt;n_namesz raw bytes.&nbsp; */<br>
&gt; &#43;-extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr, const=
 char *name,<br>
&gt; &#43;&#43;extern int ebl_core_note (Ebl *ebl, const GElf_Nhdr *nhdr,<b=
r>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const ch=
ar *name, const char *desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
Elf_Word *regs_offset, size_t *nregloc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
onst Ebl_Register_Location **reglocs,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
ize_t *nitems, const Ebl_Core_Item **items)<br>
&gt; &#43;diff --git a/src/readelf.c b/src/readelf.c<br>
&gt; &#43;index 3a73710..71651e0 100644<br>
&gt; &#43;--- a/src/readelf.c<br>
&gt; &#43;&#43;&#43;&#43; b/src/readelf.c<br>
&gt; &#43;@@ -12153,7 &#43;12153,7 @@ handle_core_note (Ebl *ebl, const GEl=
f_Nhdr *nhdr,<br>
&gt; &#43;&nbsp;&nbsp; size_t nitems;<br>
&gt; &#43;&nbsp;&nbsp; const Ebl_Core_Item *items;<br>
&gt; &#43; <br>
&gt; &#43;-&nbsp; if (! ebl_core_note (ebl, nhdr, name,<br>
&gt; &#43;&#43;&nbsp; if (! ebl_core_note (ebl, nhdr, name, desc,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;regs_offset, &=
amp;nregloc, &amp;reglocs, &amp;nitems, &amp;items))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43; <br>
&gt; &#43;-- <br>
&gt; &#43;2.7.4<br>
&gt; &#43;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW2PR2101MB089120BDA262C3520325EF2EDB850MW2PR2101MB0891_--
