Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7394E93709
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 11:10:17 +0000 (UTC)
Subject: Re: [mickledore][PATCH] glibc: Fix CVE-2023-5156
To: openembedded-core@lists.openembedded.org
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 05 Oct 2023 04:10:10 -0700
References: <CAOSpxda5TtVoFHKu3HBZR_aSXVTaO6Ay3CmYPesbdFMzUiRtmA@mail.gmail.com>
In-Reply-To: <CAOSpxda5TtVoFHKu3HBZR_aSXVTaO6Ay3CmYPesbdFMzUiRtmA@mail.gmail.com>
Message-ID: <4021.1696504210173345028@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KR570VEWAe7LNGhDzwGO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188718

--KR570VEWAe7LNGhDzwGO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2023 at 07:57 PM, Steve Sakoman wrote:

>=20
>=20
>> There are 2 files in the patch sent and the first
>> patch(0024-CVE-2023-5156-1.patch) is the duplicate of
>> https://lists.openembedded.org/g/openembedded-core/message/188490 (CVE-2=
023-4806)
>> which was sent to the mailing list.
>> Will I have to drop the (0024-CVE-2023-5156-1.patch) and send the second
>> patch as a V2 ??
>=20
> Actually I'd prefer that you do an update to the latest head of
> release/2.37/master since it includes the fixes for CVE-2023-4806,
> CVE-2023-5156, and the newly announced CVE-2023-4911)
>=20
> Is this something you can do quickly? I'd like to fast track that fix.
>=20
> Steve

The glibc updates to the latest head of release/2.37/master are sent here, =
https://lists.openembedded.org/g/openembedded-core/message/188717

Regards,

Yash.

>=20
>=20
> On Tue, Oct 3, 2023 at 8:08=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
>=20
>> Unfortunately this patch doesn't apply (even after I edited for the
>> previous addition of glibc: fix CVE-2023-4806
>>=20
>> ERROR: glibc-2.37-r1 do_patch: Applying patch
>> '0024-CVE-2023-5156-1.patch' on target directory
>> '/home/steve/builds/poky-contrib-mickledore/build/tmp/work/core2-64-poky=
-linux/glibc/2.37-r1/git'
>>=20
>> CmdError('quilt --quiltrc
>> /home/steve/builds/poky-contrib-mickledore/build/tmp/work/core2-64-poky-=
linux/glibc/2.37-r1/recipe-sysroot-native/etc/quiltrc
>>=20
>> push', 0, 'stdout: Applying patch 0024-CVE-2023-5156-1.patch
>> patching file nss/Makefile
>> Hunk #1 FAILED at 82.
>> Hunk #2 FAILED at 145.
>> Hunk #3 FAILED at 180.
>> Hunk #4 FAILED at 195.
>> Hunk #5 FAILED at 215.
>> 5 out of 5 hunks FAILED -- rejects in file nss/Makefile
>> The next patch would create the file nss/nss_test_gai_hv2_canonname.c,
>> which already exists! Applying it anyway.
>> patching file nss/nss_test_gai_hv2_canonname.c
>> Hunk #1 FAILED at 1.
>> 1 out of 1 hunk FAILED -- rejects in file nss/nss_test_gai_hv2_canonname=
.c
>>=20
>> The next patch would create the file nss/tst-nss-gai-hv2-canonname.c,
>> which already exists! Applying it anyway.
>> patching file nss/tst-nss-gai-hv2-canonname.c
>> Hunk #1 FAILED at 1.
>> 1 out of 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv2-canonname.=
c
>> The next patch would create the file nss/tst-nss-gai-hv2-canonname.h,
>> which already exists! Applying it anyway.
>> patching file nss/tst-nss-gai-hv2-canonname.h
>> Hunk #1 FAILED at 1.
>> 1 out of 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv2-canonname.=
h
>> The next patch would empty out the file
>> nss/tst-nss-gai-hv2-canonname.root/postclean.req,
>> which is already empty! Applying it anyway.
>> patching file nss/tst-nss-gai-hv2-canonname.root/postclean.req
>> The next patch would create the file
>> nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script,
>> which already exists! Applying it anyway.
>> patching file
>> nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
>> Hunk #1 FAILED at 1.
>> 1 out of 1 hunk FAILED -- rejects in file
>> nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
>> patching file sysdeps/posix/getaddrinfo.c
>> Hunk #1 FAILED at 120.
>> Hunk #2 FAILED at 165.
>> Hunk #3 FAILED at 203.
>> Hunk #4 succeeded at 248 with fuzz 2 (offset 10 lines).
>> Hunk #5 FAILED at 271.
>> Hunk #6 FAILED at 333.
>> Hunk #7 FAILED at 780.
>> 6 out of 7 hunks FAILED -- rejects in file sysdeps/posix/getaddrinfo.c
>> Patch 0024-CVE-2023-5156-1.patch can be reverse-applied
>>=20
>> Steve
>>=20
>> On Tue, Oct 3, 2023 at 1:30=E2=80=AFAM <Deepthi.Hemraj@windriver.com> wr=
ote:
>>=20
>>> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>>>=20
>>> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>>> ---
>>> .../glibc/glibc/0024-CVE-2023-5156-1.patch | 329 ++++++++++++++++++
>>> .../glibc/glibc/0024-CVE-2023-5156-2.patch | 93 +++++
>>> meta/recipes-core/glibc/glibc_2.37.bb | 2 +
>>> 3 files changed, 424 insertions(+)
>>> create mode 100644
>>> meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
>>> create mode 100644
>>> meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
>>>=20
>>> diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
>>> b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
>>> new file mode 100644
>>> index 0000000000..65afaa446a
>>> --- /dev/null
>>> +++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
>>> @@ -0,0 +1,329 @@
>>> +From: Siddhesh Poyarekar <siddhesh@sourceware.org>
>>> +Date: Fri, 15 Sep 2023 17:51:12 +0000 (-0400)
>>> +Subject: getaddrinfo: Fix use after free in getcanonname (CVE-2023-480=
6)
>>> +X-Git-Url: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_pl=
ain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994
>>>=20
>>> +
>>> +getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
>>> +
>>> +When an NSS plugin only implements the _gethostbyname2_r and
>>> +_getcanonname_r callbacks, getaddrinfo could use memory that was freed
>>> +during tmpbuf resizing, through h_name in a previous query response.
>>> +
>>> +The backing store for res->at->name when doing a query with
>>> +gethostbyname3_r or gethostbyname2_r is tmpbuf, which is reallocated i=
n
>>> +gethosts during the query. For AF_INET6 lookup with AI_ALL |
>>> +AI_V4MAPPED, gethosts gets called twice, once for a v6 lookup and seco=
nd
>>> +for a v4 lookup. In this case, if the first call reallocates tmpbuf
>>> +enough number of times, resulting in a malloc, th->h_name (that
>>> +res->at->name refers to) ends up on a heap allocated storage in tmpbuf=
.
>>> +Now if the second call to gethosts also causes the plugin callback to
>>> +return NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF
>>> +reference in res->at->name. This then gets dereferenced in the
>>> +getcanonname_r plugin call, resulting in the use after free.
>>> +
>>> +Fix this by copying h_name over and freeing it at the end. This
>>> +resolves BZ #30843, which is assigned CVE-2023-4806.
>>> +
>>> +Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>>> +
>>> +Upstream-Status: Backport [ https://sourceware.org/git/?p=3Dglibc.git;=
a=3Dcommitdiff_plain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994
>>> ]
>>> +
>>> +CVE: CVE-2023-5156
>>> +
>>> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>>> +
>>> +---
>>> +
>>> +diff --git a/nss/Makefile b/nss/Makefile
>>> +index 06fcdc450f..8a5126ecf3 100644
>>> +--- a/nss/Makefile
>>> ++++ b/nss/Makefile
>>> +@@ -82,6 +82,7 @@ tests-container :=3D \
>>> + tst-nss-test3 \
>>> + tst-reload1 \
>>> + tst-reload2 \
>>> ++ tst-nss-gai-hv2-canonname \
>>> + # tests-container
>>> +
>>> + # Tests which need libdl
>>> +@@ -145,7 +146,8 @@ libnss_compat-inhibit-o =3D $(filter-out
>>> .os,$(object-suffixes))
>>> + ifeq ($(build-static-nss),yes)
>>> + tests-static +=3D tst-nss-static
>>> + endif
>>> +-extra-test-objs +=3D nss_test1.os nss_test2.os nss_test_errno.os
>>> ++extra-test-objs +=3D nss_test1.os nss_test2.os nss_test_errno.os \
>>> ++ nss_test_gai_hv2_canonname.os
>>> +
>>> + include ../Rules
>>> +
>>> +@@ -180,12 +182,16 @@ rtld-tests-LDFLAGS +=3D
>>> -Wl,--dynamic-list=3Dnss_test.ver
>>> + libof-nss_test1 =3D extramodules
>>> + libof-nss_test2 =3D extramodules
>>> + libof-nss_test_errno =3D extramodules
>>> ++libof-nss_test_gai_hv2_canonname =3D extramodules
>>> + $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os $(link-libc-deps)
>>> + $(build-module)
>>> + $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
>>> + $(build-module)
>>> + $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os
>>> $(link-libc-deps)
>>> + $(build-module)
>>> ++$(objpfx)/libnss_test_gai_hv2_canonname.so: \
>>> ++ $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
>>> ++ $(build-module)
>>> + $(objpfx)nss_test2.os : nss_test1.c
>>> + # Use the nss_files suffix for these objects as well.
>>> + $(objpfx)/libnss_test1.so$(libnss_files.so-version):
>>> $(objpfx)/libnss_test1.so
>>> +@@ -195,10 +201,14 @@
>>> $(objpfx)/libnss_test2.so$(libnss_files.so-version):
>>> $(objpfx)/libnss_test2.so
>>> + $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
>>> + $(objpfx)/libnss_test_errno.so
>>> + $(make-link)
>>> ++$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version):=
 \
>>> ++ $(objpfx)/libnss_test_gai_hv2_canonname.so
>>> ++ $(make-link)
>>> + $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
>>> + $(objpfx)/libnss_test1.so$(libnss_files.so-version) \
>>> + $(objpfx)/libnss_test2.so$(libnss_files.so-version) \
>>> +- $(objpfx)/libnss_test_errno.so$(libnss_files.so-version)
>>> ++ $(objpfx)/libnss_test_errno.so$(libnss_files.so-version) \
>>> ++ $(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version)
>>> +
>>> + ifeq (yes,$(have-thread-library))
>>> + $(objpfx)tst-cancel-getpwuid_r: $(shared-thread-library)
>>> +@@ -215,3 +225,4 @@ LDFLAGS-tst-nss-test3 =3D -Wl,--disable-new-dtags
>>> + LDFLAGS-tst-nss-test4 =3D -Wl,--disable-new-dtags
>>> + LDFLAGS-tst-nss-test5 =3D -Wl,--disable-new-dtags
>>> + LDFLAGS-tst-nss-test_errno =3D -Wl,--disable-new-dtags
>>> ++LDFLAGS-tst-nss-test_gai_hv2_canonname =3D -Wl,--disable-new-dtags
>>> +diff --git a/nss/nss_test_gai_hv2_canonname.c
>>> b/nss/nss_test_gai_hv2_canonname.c
>>> +new file mode 100644
>>> +index 0000000000..4439c83c9f
>>> +--- /dev/null
>>> ++++ b/nss/nss_test_gai_hv2_canonname.c
>>> +@@ -0,0 +1,56 @@
>>> ++/* NSS service provider that only provides gethostbyname2_r.
>>> ++ Copyright The GNU Toolchain Authors.
>>> ++ This file is part of the GNU C Library.
>>> ++
>>> ++ The GNU C Library is free software; you can redistribute it and/or
>>> ++ modify it under the terms of the GNU Lesser General Public
>>> ++ License as published by the Free Software Foundation; either
>>> ++ version 2.1 of the License, or (at your option) any later version.
>>> ++
>>> ++ The GNU C Library is distributed in the hope that it will be useful,
>>> ++ but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>>> ++ Lesser General Public License for more details.
>>> ++
>>> ++ You should have received a copy of the GNU Lesser General Public
>>> ++ License along with the GNU C Library; if not, see
>>> ++ < https://www.gnu.org/licenses/ >. */
>>> ++
>>> ++#include <nss.h>
>>> ++#include <stdlib.h>
>>> ++#include <string.h>
>>> ++#include "nss/tst-nss-gai-hv2-canonname.h"
>>> ++
>>> ++/* Catch misnamed and functions. */
>>> ++#pragma GCC diagnostic error "-Wmissing-prototypes"
>>> ++NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)
>>> ++
>>> ++extern enum nss_status _nss_files_gethostbyname2_r (const char *, int=
,
>>> ++ struct hostent *, char *,
>>> ++ size_t, int *, int *);
>>> ++
>>> ++enum nss_status
>>> ++_nss_test_gai_hv2_canonname_gethostbyname2_r (const char *name, int a=
f,
>>> ++ struct hostent *result,
>>> ++ char *buffer, size_t buflen,
>>> ++ int *errnop, int *herrnop)
>>> ++{
>>> ++ return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen=
,
>>> errnop,
>>> ++ herrnop);
>>> ++}
>>> ++
>>> ++enum nss_status
>>> ++_nss_test_gai_hv2_canonname_getcanonname_r (const char *name, char
>>> *buffer,
>>> ++ size_t buflen, char **result,
>>> ++ int *errnop, int *h_errnop)
>>> ++{
>>> ++ /* We expect QUERYNAME, which is a small enough string that it
>>> shouldn't fail
>>> ++ the test. */
>>> ++ if (memcmp (QUERYNAME, name, sizeof (QUERYNAME))
>>> ++ || buflen < sizeof (QUERYNAME))
>>> ++ abort ();
>>> ++
>>> ++ strncpy (buffer, name, buflen);
>>> ++ *result =3D buffer;
>>> ++ return NSS_STATUS_SUCCESS;
>>> ++}
>>> +diff --git a/nss/tst-nss-gai-hv2-canonname.c
>>> b/nss/tst-nss-gai-hv2-canonname.c
>>> +new file mode 100644
>>> +index 0000000000..d5f10c07d6
>>> +--- /dev/null
>>> ++++ b/nss/tst-nss-gai-hv2-canonname.c
>>> +@@ -0,0 +1,63 @@
>>> ++/* Test NSS query path for plugins that only implement gethostbyname2
>>> ++ (#30843).
>>> ++ Copyright The GNU Toolchain Authors.
>>> ++ This file is part of the GNU C Library.
>>> ++
>>> ++ The GNU C Library is free software; you can redistribute it and/or
>>> ++ modify it under the terms of the GNU Lesser General Public
>>> ++ License as published by the Free Software Foundation; either
>>> ++ version 2.1 of the License, or (at your option) any later version.
>>> ++
>>> ++ The GNU C Library is distributed in the hope that it will be useful,
>>> ++ but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>>> ++ Lesser General Public License for more details.
>>> ++
>>> ++ You should have received a copy of the GNU Lesser General Public
>>> ++ License along with the GNU C Library; if not, see
>>> ++ < https://www.gnu.org/licenses/ >. */
>>> ++
>>> ++#include <nss.h>
>>> ++#include <netdb.h>
>>> ++#include <stdlib.h>
>>> ++#include <string.h>
>>> ++#include <support/check.h>
>>> ++#include <support/xstdio.h>
>>> ++#include "nss/tst-nss-gai-hv2-canonname.h"
>>> ++
>>> ++#define PREPARE do_prepare
>>> ++
>>> ++static void do_prepare (int a, char **av)
>>> ++{
>>> ++ FILE *hosts =3D xfopen ("/etc/hosts", "w");
>>> ++ for (unsigned i =3D 2; i < 255; i++)
>>> ++ {
>>> ++ fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);
>>> ++ fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);
>>> ++ }
>>> ++ xfclose (hosts);
>>> ++}
>>> ++
>>> ++static int
>>> ++do_test (void)
>>> ++{
>>> ++ __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
>>> ++
>>> ++ struct addrinfo hints =3D {};
>>> ++ struct addrinfo *result =3D NULL;
>>> ++
>>> ++ hints.ai_family =3D AF_INET6;
>>> ++ hints.ai_flags =3D AI_ALL | AI_V4MAPPED | AI_CANONNAME;
>>> ++
>>> ++ int ret =3D getaddrinfo (QUERYNAME, NULL, &hints, &result);
>>> ++
>>> ++ if (ret !=3D 0)
>>> ++ FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_strerror (ret));
>>> ++
>>> ++ TEST_COMPARE_STRING (result->ai_canonname, QUERYNAME);
>>> ++
>>> ++ freeaddrinfo(result);
>>> ++ return 0;
>>> ++}
>>> ++
>>> ++#include <support/test-driver.c>
>>> +diff --git a/nss/tst-nss-gai-hv2-canonname.h
>>> b/nss/tst-nss-gai-hv2-canonname.h
>>> +new file mode 100644
>>> +index 0000000000..14f2a9cb08
>>> +--- /dev/null
>>> ++++ b/nss/tst-nss-gai-hv2-canonname.h
>>> +@@ -0,0 +1 @@
>>> ++#define QUERYNAME "test.example.com"
>>> +diff --git a/nss/tst-nss-gai-hv2-canonname.root/postclean.req
>>> b/nss/tst-nss-gai-hv2-canonname.root/postclean.req
>>> +new file mode 100644
>>> +index 0000000000..e69de29bb2
>>> +diff --git
>>> a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
>>> b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
>>> +new file mode 100644
>>> +index 0000000000..31848b4a28
>>> +--- /dev/null
>>> ++++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.scr=
ipt
>>>=20
>>> +@@ -0,0 +1,2 @@
>>> ++cp $B/nss/libnss_test_gai_hv2_canonname.so
>>> $L/libnss_test_gai_hv2_canonname.so.2
>>> ++su
>>> +diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
>>> +index 6ae6744fe4..47f421fddf 100644
>>> +--- a/sysdeps/posix/getaddrinfo.c
>>> ++++ b/sysdeps/posix/getaddrinfo.c
>>> +@@ -120,6 +120,7 @@ struct gaih_result
>>> + {
>>> + struct gaih_addrtuple *at;
>>> + char *canon;
>>> ++ char *h_name;
>>> + bool free_at;
>>> + bool got_ipv6;
>>> + };
>>> +@@ -165,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)
>>> + if (res->free_at)
>>> + free (res->at);
>>> + free (res->canon);
>>> ++ free (res->h_name);
>>> + memset (res, 0, sizeof (*res));
>>> + }
>>> +
>>> +@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const str=
uct
>>> gaih_typeproto *tp,
>>> + return 0;
>>> + }
>>> +
>>> +-/* Convert struct hostent to a list of struct gaih_addrtuple objects.
>>> h_name
>>> +- is not copied, and the struct hostent object must not be deallocated
>>> +- prematurely. The new addresses are appended to the tuple array in RE=
S.
>>> */
>>> ++/* Convert struct hostent to a list of struct gaih_addrtuple objects.
>>> The new
>>> ++ addresses are appended to the tuple array in RES. */
>>> + static bool
>>> + convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int
>>> family,
>>> + struct hostent *h, struct gaih_result *res)
>>> +@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct
>>> addrinfo *req, int family,
>>> + res->at =3D array;
>>> + res->free_at =3D true;
>>> +
>>> ++ /* Duplicate h_name because it may get reclaimed when the underlying
>>> storage
>>> ++ is freed. */
>>> ++ if (res->h_name =3D=3D NULL)
>>> ++ {
>>> ++ res->h_name =3D __strdup (h->h_name);
>>> ++ if (res->h_name =3D=3D NULL)
>>> ++ return false;
>>> ++ }
>>> ++
>>> + /* Update the next pointers on reallocation. */
>>> + for (size_t i =3D 0; i < old; i++)
>>> + array[i].next =3D array + i + 1;
>>> +@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct
>>> addrinfo *req, int family,
>>> + }
>>> + array[i].next =3D array + i + 1;
>>> + }
>>> +- array[0].name =3D h->h_name;
>>> + array[count - 1].next =3D NULL;
>>> +
>>> + return true;
>>> +@@ -324,15 +333,15 @@ gethosts (nss_gethostbyname3_r fct, int family,
>>> const char *name,
>>> + memory allocation failure. The returned string is allocated on the
>>> + heap; the caller has to free it. */
>>> + static char *
>>> +-getcanonname (nss_action_list nip, struct gaih_addrtuple *at, const c=
har
>>> *name)
>>> ++getcanonname (nss_action_list nip, const char *hname, const char *nam=
e)
>>> + {
>>> + nss_getcanonname_r *cfct =3D __nss_lookup_function (nip,
>>> "getcanonname_r");
>>> + char *s =3D (char *) name;
>>> + if (cfct !=3D NULL)
>>> + {
>>> + char buf[256];
>>> +- if (DL_CALL_FCT (cfct, (at->name ?: name, buf, sizeof (buf),
>>> +- &s, &errno, &h_errno)) !=3D NSS_STATUS_SUCCESS)
>>> ++ if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf), &s, &errno=
,
>>> ++ &h_errno)) !=3D NSS_STATUS_SUCCESS)
>>> + /* If the canonical name cannot be determined, use the passed
>>> + string. */
>>> + s =3D (char *) name;
>>> +@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct
>>> addrinfo *req,
>>> + if ((req->ai_flags & AI_CANONNAME) !=3D 0
>>> + && res->canon =3D=3D NULL)
>>> + {
>>> +- char *canonbuf =3D getcanonname (nip, res->at, name);
>>> ++ char *canonbuf =3D getcanonname (nip, res->h_name, name);
>>> + if (canonbuf =3D=3D NULL)
>>> + {
>>> + __resolv_context_put (res_ctx);
>>> diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
>>> b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
>>> new file mode 100644
>>> index 0000000000..507db5e13b
>>> --- /dev/null
>>> +++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
>>> @@ -0,0 +1,93 @@
>>> +From: Romain Geissler <romain.geissler@amadeus.com>
>>> +Date: Mon, 25 Sep 2023 00:21:51 +0000 (+0100)
>>> +Subject: Fix leak in getaddrinfo introduced by the fix for CVE-2023-48=
06
>>> [BZ #30843]
>>> +X-Git-Url: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_pl=
ain;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796
>>>=20
>>> +
>>> +Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ
>>> #30843]
>>> +
>>> +This patch fixes a very recently added leak in getaddrinfo.
>>> +
>>> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
>>> +
>>> +Upstream-Status: Backport [ https://sourceware.org/git/?p=3Dglibc.git;=
a=3Dcommitdiff_plain;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796
>>> ]
>>> +
>>> +CVE: CVE-2023-5156
>>> +
>>> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>>> +
>>> +---
>>> +
>>> +diff --git a/nss/Makefile b/nss/Makefile
>>> +index 8a5126ecf3..668ba34b18 100644
>>> +--- a/nss/Makefile
>>> ++++ b/nss/Makefile
>>> +@@ -149,6 +149,15 @@ endif
>>> + extra-test-objs +=3D nss_test1.os nss_test2.os nss_test_errno.os \
>>> + nss_test_gai_hv2_canonname.os
>>> +
>>> ++ifeq ($(run-built-tests),yes)
>>> ++ifneq (no,$(PERL))
>>> ++tests-special +=3D $(objpfx)mtrace-tst-nss-gai-hv2-canonname.out
>>> ++endif
>>> ++endif
>>> ++
>>> ++generated +=3D mtrace-tst-nss-gai-hv2-canonname.out \
>>> ++ tst-nss-gai-hv2-canonname.mtrace
>>> ++
>>> + include ../Rules
>>> +
>>> + ifeq (yes,$(have-selinux))
>>> +@@ -217,6 +226,17 @@ endif
>>> + $(objpfx)tst-nss-files-alias-leak.out: $(objpfx)/libnss_files.so
>>> + $(objpfx)tst-nss-files-alias-truncated.out: $(objpfx)/libnss_files.so
>>> +
>>> ++tst-nss-gai-hv2-canonname-ENV =3D \
>>> ++ MALLOC_TRACE=3D$(objpfx)tst-nss-gai-hv2-canonname.mtrace \
>>> ++ LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
>>> ++$(objpfx)mtrace-tst-nss-gai-hv2-canonname.out: \
>>> ++ $(objpfx)tst-nss-gai-hv2-canonname.out
>>> ++ { test -r $(objpfx)tst-nss-gai-hv2-canonname.mtrace \
>>> ++ || ( echo "tst-nss-gai-hv2-canonname.mtrace does not exist"; exit 77=
; )
>>> \
>>> ++ && $(common-objpfx)malloc/mtrace \
>>> ++ $(objpfx)tst-nss-gai-hv2-canonname.mtrace; } > $@; \
>>> ++ $(evaluate-test)
>>> ++
>>> + # Disable DT_RUNPATH on NSS tests so that the glibc internal NSS
>>> + # functions can load testing NSS modules via DT_RPATH.
>>> + LDFLAGS-tst-nss-test1 =3D -Wl,--disable-new-dtags
>>> +diff --git a/nss/tst-nss-gai-hv2-canonname.c
>>> b/nss/tst-nss-gai-hv2-canonname.c
>>> +index d5f10c07d6..7db53cf09d 100644
>>> +--- a/nss/tst-nss-gai-hv2-canonname.c
>>> ++++ b/nss/tst-nss-gai-hv2-canonname.c
>>> +@@ -21,6 +21,7 @@
>>> + #include <netdb.h>
>>> + #include <stdlib.h>
>>> + #include <string.h>
>>> ++#include <mcheck.h>
>>> + #include <support/check.h>
>>> + #include <support/xstdio.h>
>>> + #include "nss/tst-nss-gai-hv2-canonname.h"
>>> +@@ -41,6 +42,8 @@ static void do_prepare (int a, char **av)
>>> + static int
>>> + do_test (void)
>>> + {
>>> ++ mtrace ();
>>> ++
>>> + __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
>>> +
>>> + struct addrinfo hints =3D {};
>>> +diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
>>> +index 47f421fddf..531124958d 100644
>>> +--- a/sysdeps/posix/getaddrinfo.c
>>> ++++ b/sysdeps/posix/getaddrinfo.c
>>> +@@ -1196,9 +1196,7 @@ free_and_return:
>>> + if (malloc_name)
>>> + free ((char *) name);
>>> + free (addrmem);
>>> +- if (res.free_at)
>>> +- free (res.at);
>>> +- free (res.canon);
>>> ++ gaih_result_reset (&res);
>>> +
>>> + return result;
>>> + }
>>> diff --git a/meta/recipes-core/glibc/glibc_2.37.bb
>>> b/meta/recipes-core/glibc/glibc_2.37.bb
>>> index caf454f368..b88bc5fc4f 100644
>>> --- a/meta/recipes-core/glibc/glibc_2.37.bb
>>> +++ b/meta/recipes-core/glibc/glibc_2.37.bb
>>> @@ -50,6 +50,8 @@ SRC_URI =3D
>>> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>>> file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch =
\
>>> file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch =
\
>>> file://0023-CVE-2023-4527.patch \
>>> + file://0024-CVE-2023-5156-1.patch \
>>> + file://0024-CVE-2023-5156-2.patch \
>>> "
>>> S =3D "${WORKDIR}/git"
>>> B =3D "${WORKDIR}/build-${TARGET_SYS}"
>>> --
>>> 2.39.0
>>=20
>>=20
>=20
>

--KR570VEWAe7LNGhDzwGO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2023 at 07:57 PM, Steve Sakoman wrote:<br />
<blockquote>
<blockquote>There are 2 files in the patch sent and the first patch(0024-CV=
E-2023-5156-1.patch) is the duplicate of<br /><a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/188490" target=3D"_blank" rel=3D"n=
oopener">https://lists.openembedded.org/g/openembedded-core/message/188490<=
/a> (CVE-2023-4806) which was sent to the mailing list.<br />Will I have to=
 drop the (0024-CVE-2023-5156-1.patch) and send the second patch as a V2 ??=
</blockquote>
Actually I'd prefer that you do an update to the latest head of<br />releas=
e/2.37/master since it includes the fixes for CVE-2023-4806,<br />CVE-2023-=
5156, and the newly announced CVE-2023-4911)<br /><br />Is this something y=
ou can do quickly? I'd like to fast track that fix.<br /><br />Steve</block=
quote>
<p>The glibc updates to the latest head of release/2.37/master are sent her=
e,&nbsp;<a href=3D"https://lists.openembedded.org/g/openembedded-core/messa=
ge/188717" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.or=
g/g/openembedded-core/message/188717</a>&nbsp;</p>
<p>&nbsp;</p>
<p>Regards,</p>
<p>Yash.</p>
<blockquote><br />On Tue, Oct 3, 2023 at 8:08=E2=80=AFAM Steve Sakoman via<=
br />lists.openembedded.org &lt;steve=3Dsakoman.com@lists.openembedded.org&=
gt;<br />wrote:<br />
<blockquote>Unfortunately this patch doesn't apply (even after I edited for=
 the<br />previous addition of glibc: fix CVE-2023-4806<br /><br />ERROR: g=
libc-2.37-r1 do_patch: Applying patch<br />'0024-CVE-2023-5156-1.patch' on =
target directory<br />'/home/steve/builds/poky-contrib-mickledore/build/tmp=
/work/core2-64-poky-linux/glibc/2.37-r1/git'<br />CmdError('quilt --quiltrc=
<br />/home/steve/builds/poky-contrib-mickledore/build/tmp/work/core2-64-po=
ky-linux/glibc/2.37-r1/recipe-sysroot-native/etc/quiltrc<br />push', 0, 'st=
dout: Applying patch 0024-CVE-2023-5156-1.patch<br />patching file nss/Make=
file<br />Hunk #1 FAILED at 82.<br />Hunk #2 FAILED at 145.<br />Hunk #3 FA=
ILED at 180.<br />Hunk #4 FAILED at 195.<br />Hunk #5 FAILED at 215.<br />5=
 out of 5 hunks FAILED -- rejects in file nss/Makefile<br />The next patch =
would create the file nss/nss_test_gai_hv2_canonname.c,<br />which already =
exists! Applying it anyway.<br />patching file nss/nss_test_gai_hv2_canonna=
me.c<br />Hunk #1 FAILED at 1.<br />1 out of 1 hunk FAILED -- rejects in fi=
le nss/nss_test_gai_hv2_canonname.c<br />The next patch would create the fi=
le nss/tst-nss-gai-hv2-canonname.c,<br />which already exists! Applying it =
anyway.<br />patching file nss/tst-nss-gai-hv2-canonname.c<br />Hunk #1 FAI=
LED at 1.<br />1 out of 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv=
2-canonname.c<br />The next patch would create the file nss/tst-nss-gai-hv2=
-canonname.h,<br />which already exists! Applying it anyway.<br />patching =
file nss/tst-nss-gai-hv2-canonname.h<br />Hunk #1 FAILED at 1.<br />1 out o=
f 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv2-canonname.h<br />The=
 next patch would empty out the file<br />nss/tst-nss-gai-hv2-canonname.roo=
t/postclean.req,<br />which is already empty! Applying it anyway.<br />patc=
hing file nss/tst-nss-gai-hv2-canonname.root/postclean.req<br />The next pa=
tch would create the file<br />nss/tst-nss-gai-hv2-canonname.root/tst-nss-g=
ai-hv2-canonname.script,<br />which already exists! Applying it anyway.<br =
/>patching file nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonnam=
e.script<br />Hunk #1 FAILED at 1.<br />1 out of 1 hunk FAILED -- rejects i=
n file<br />nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.sc=
ript<br />patching file sysdeps/posix/getaddrinfo.c<br />Hunk #1 FAILED at =
120.<br />Hunk #2 FAILED at 165.<br />Hunk #3 FAILED at 203.<br />Hunk #4 s=
ucceeded at 248 with fuzz 2 (offset 10 lines).<br />Hunk #5 FAILED at 271.<=
br />Hunk #6 FAILED at 333.<br />Hunk #7 FAILED at 780.<br />6 out of 7 hun=
ks FAILED -- rejects in file sysdeps/posix/getaddrinfo.c<br />Patch 0024-CV=
E-2023-5156-1.patch can be reverse-applied<br /><br />Steve<br /><br />On T=
ue, Oct 3, 2023 at 1:30=E2=80=AFAM &lt;Deepthi.Hemraj@windriver.com&gt; wro=
te:<br />
<blockquote>From: Deepthi Hemraj &lt;Deepthi.Hemraj@windriver.com&gt;<br />=
<br />Signed-off-by: Deepthi Hemraj &lt;Deepthi.Hemraj@windriver.com&gt;<br=
 />---<br />.../glibc/glibc/0024-CVE-2023-5156-1.patch | 329 ++++++++++++++=
++++<br />.../glibc/glibc/0024-CVE-2023-5156-2.patch | 93 +++++<br />meta/r=
ecipes-core/glibc/glibc_2.37.bb | 2 +<br />3 files changed, 424 insertions(=
+)<br />create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-5156=
-1.patch<br />create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-202=
3-5156-2.patch<br /><br />diff --git a/meta/recipes-core/glibc/glibc/0024-C=
VE-2023-5156-1.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.p=
atch<br />new file mode 100644<br />index 0000000000..65afaa446a<br />--- /=
dev/null<br />+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patc=
h<br />@@ -0,0 +1,329 @@<br />+From: Siddhesh Poyarekar &lt;siddhesh@source=
ware.org&gt;<br />+Date: Fri, 15 Sep 2023 17:51:12 +0000 (-0400)<br />+Subj=
ect: getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)<br />+=
X-Git-Url: <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitd=
iff_plain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994" target=3D"_blank" r=
el=3D"noopener">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_pl=
ain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994</a><br />+<br />+getaddrin=
fo: Fix use after free in getcanonname (CVE-2023-4806)<br />+<br />+When an=
 NSS plugin only implements the _gethostbyname2_r and<br />+_getcanonname_r=
 callbacks, getaddrinfo could use memory that was freed<br />+during tmpbuf=
 resizing, through h_name in a previous query response.<br />+<br />+The ba=
cking store for res-&gt;at-&gt;name when doing a query with<br />+gethostby=
name3_r or gethostbyname2_r is tmpbuf, which is reallocated in<br />+gethos=
ts during the query. For AF_INET6 lookup with AI_ALL |<br />+AI_V4MAPPED, g=
ethosts gets called twice, once for a v6 lookup and second<br />+for a v4 l=
ookup. In this case, if the first call reallocates tmpbuf<br />+enough numb=
er of times, resulting in a malloc, th-&gt;h_name (that<br />+res-&gt;at-&g=
t;name refers to) ends up on a heap allocated storage in tmpbuf.<br />+Now =
if the second call to gethosts also causes the plugin callback to<br />+ret=
urn NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF<br />+re=
ference in res-&gt;at-&gt;name. This then gets dereferenced in the<br />+ge=
tcanonname_r plugin call, resulting in the use after free.<br />+<br />+Fix=
 this by copying h_name over and freeing it at the end. This<br />+resolves=
 BZ #30843, which is assigned CVE-2023-4806.<br />+<br />+Signed-off-by: Si=
ddhesh Poyarekar &lt;siddhesh@sourceware.org&gt;<br />+<br />+Upstream-Stat=
us: Backport [<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcomm=
itdiff_plain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994" target=3D"_blank=
" rel=3D"noopener">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff=
_plain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994</a>]<br />+<br />+CVE: =
CVE-2023-5156<br />+<br />+Signed-off-by: Deepthi Hemraj &lt;Deepthi.Hemraj=
@windriver.com&gt;<br />+<br />+---<br />+<br />+diff --git a/nss/Makefile =
b/nss/Makefile<br />+index 06fcdc450f..8a5126ecf3 100644<br />+--- a/nss/Ma=
kefile<br />++++ b/nss/Makefile<br />+@@ -82,6 +82,7 @@ tests-container :=
=3D \<br />+ tst-nss-test3 \<br />+ tst-reload1 \<br />+ tst-reload2 \<br /=
>++ tst-nss-gai-hv2-canonname \<br />+ # tests-container<br />+<br />+ # Te=
sts which need libdl<br />+@@ -145,7 +146,8 @@ libnss_compat-inhibit-o =3D =
$(filter-out .os,$(object-suffixes))<br />+ ifeq ($(build-static-nss),yes)<=
br />+ tests-static +=3D tst-nss-static<br />+ endif<br />+-extra-test-objs=
 +=3D nss_test1.os nss_test2.os nss_test_errno.os<br />++extra-test-objs +=
=3D nss_test1.os nss_test2.os nss_test_errno.os \<br />++ nss_test_gai_hv2_=
canonname.os<br />+<br />+ include ../Rules<br />+<br />+@@ -180,12 +182,16=
 @@ rtld-tests-LDFLAGS +=3D -Wl,--dynamic-list=3Dnss_test.ver<br />+ libof-=
nss_test1 =3D extramodules<br />+ libof-nss_test2 =3D extramodules<br />+ l=
ibof-nss_test_errno =3D extramodules<br />++libof-nss_test_gai_hv2_canonnam=
e =3D extramodules<br />+ $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os =
$(link-libc-deps)<br />+ $(build-module)<br />+ $(objpfx)/libnss_test2.so: =
$(objpfx)nss_test2.os $(link-libc-deps)<br />+ $(build-module)<br />+ $(obj=
pfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-deps)<br =
/>+ $(build-module)<br />++$(objpfx)/libnss_test_gai_hv2_canonname.so: \<br=
 />++ $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)<br />++ $(bu=
ild-module)<br />+ $(objpfx)nss_test2.os : nss_test1.c<br />+ # Use the nss=
_files suffix for these objects as well.<br />+ $(objpfx)/libnss_test1.so$(=
libnss_files.so-version): $(objpfx)/libnss_test1.so<br />+@@ -195,10 +201,1=
4 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version): $(objpfx)/libnss_=
test2.so<br />+ $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \=
<br />+ $(objpfx)/libnss_test_errno.so<br />+ $(make-link)<br />++$(objpfx)=
/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \<br />++ $(ob=
jpfx)/libnss_test_gai_hv2_canonname.so<br />++ $(make-link)<br />+ $(patsub=
st %,$(objpfx)%.out,$(tests) $(tests-container)) : \<br />+ $(objpfx)/libns=
s_test1.so$(libnss_files.so-version) \<br />+ $(objpfx)/libnss_test2.so$(li=
bnss_files.so-version) \<br />+- $(objpfx)/libnss_test_errno.so$(libnss_fil=
es.so-version)<br />++ $(objpfx)/libnss_test_errno.so$(libnss_files.so-vers=
ion) \<br />++ $(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-=
version)<br />+<br />+ ifeq (yes,$(have-thread-library))<br />+ $(objpfx)ts=
t-cancel-getpwuid_r: $(shared-thread-library)<br />+@@ -215,3 +225,4 @@ LDF=
LAGS-tst-nss-test3 =3D -Wl,--disable-new-dtags<br />+ LDFLAGS-tst-nss-test4=
 =3D -Wl,--disable-new-dtags<br />+ LDFLAGS-tst-nss-test5 =3D -Wl,--disable=
-new-dtags<br />+ LDFLAGS-tst-nss-test_errno =3D -Wl,--disable-new-dtags<br=
 />++LDFLAGS-tst-nss-test_gai_hv2_canonname =3D -Wl,--disable-new-dtags<br =
/>+diff --git a/nss/nss_test_gai_hv2_canonname.c b/nss/nss_test_gai_hv2_can=
onname.c<br />+new file mode 100644<br />+index 0000000000..4439c83c9f<br /=
>+--- /dev/null<br />++++ b/nss/nss_test_gai_hv2_canonname.c<br />+@@ -0,0 =
+1,56 @@<br />++/* NSS service provider that only provides gethostbyname2_r=
.<br />++ Copyright The GNU Toolchain Authors.<br />++ This file is part of=
 the GNU C Library.<br />++<br />++ The GNU C Library is free software; you=
 can redistribute it and/or<br />++ modify it under the terms of the GNU Le=
sser General Public<br />++ License as published by the Free Software Found=
ation; either<br />++ version 2.1 of the License, or (at your option) any l=
ater version.<br />++<br />++ The GNU C Library is distributed in the hope =
that it will be useful,<br />++ but WITHOUT ANY WARRANTY; without even the =
implied warranty of<br />++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE. See the GNU<br />++ Lesser General Public License for more details.<b=
r />++<br />++ You should have received a copy of the GNU Lesser General Pu=
blic<br />++ License along with the GNU C Library; if not, see<br />++ &lt;=
<a href=3D"https://www.gnu.org/licenses/" target=3D"_blank" rel=3D"noopener=
">https://www.gnu.org/licenses/</a>&gt;. */<br />++<br />++#include &lt;nss=
.h&gt;<br />++#include &lt;stdlib.h&gt;<br />++#include &lt;string.h&gt;<br=
 />++#include "nss/tst-nss-gai-hv2-canonname.h"<br />++<br />++/* Catch mis=
named and functions. */<br />++#pragma GCC diagnostic error "-Wmissing-prot=
otypes"<br />++NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)<br />+=
+<br />++extern enum nss_status _nss_files_gethostbyname2_r (const char *, =
int,<br />++ struct hostent *, char *,<br />++ size_t, int *, int *);<br />=
++<br />++enum nss_status<br />++_nss_test_gai_hv2_canonname_gethostbyname2=
_r (const char *name, int af,<br />++ struct hostent *result,<br />++ char =
*buffer, size_t buflen,<br />++ int *errnop, int *herrnop)<br />++{<br />++=
 return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen, errn=
op,<br />++ herrnop);<br />++}<br />++<br />++enum nss_status<br />++_nss_t=
est_gai_hv2_canonname_getcanonname_r (const char *name, char *buffer,<br />=
++ size_t buflen, char **result,<br />++ int *errnop, int *h_errnop)<br />+=
+{<br />++ /* We expect QUERYNAME, which is a small enough string that it s=
houldn't fail<br />++ the test. */<br />++ if (memcmp (QUERYNAME, name, siz=
eof (QUERYNAME))<br />++ || buflen &lt; sizeof (QUERYNAME))<br />++ abort (=
);<br />++<br />++ strncpy (buffer, name, buflen);<br />++ *result =3D buff=
er;<br />++ return NSS_STATUS_SUCCESS;<br />++}<br />+diff --git a/nss/tst-=
nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c<br />+new file mo=
de 100644<br />+index 0000000000..d5f10c07d6<br />+--- /dev/null<br />++++ =
b/nss/tst-nss-gai-hv2-canonname.c<br />+@@ -0,0 +1,63 @@<br />++/* Test NSS=
 query path for plugins that only implement gethostbyname2<br />++ (#30843)=
.<br />++ Copyright The GNU Toolchain Authors.<br />++ This file is part of=
 the GNU C Library.<br />++<br />++ The GNU C Library is free software; you=
 can redistribute it and/or<br />++ modify it under the terms of the GNU Le=
sser General Public<br />++ License as published by the Free Software Found=
ation; either<br />++ version 2.1 of the License, or (at your option) any l=
ater version.<br />++<br />++ The GNU C Library is distributed in the hope =
that it will be useful,<br />++ but WITHOUT ANY WARRANTY; without even the =
implied warranty of<br />++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE. See the GNU<br />++ Lesser General Public License for more details.<b=
r />++<br />++ You should have received a copy of the GNU Lesser General Pu=
blic<br />++ License along with the GNU C Library; if not, see<br />++ &lt;=
<a href=3D"https://www.gnu.org/licenses/" target=3D"_blank" rel=3D"noopener=
">https://www.gnu.org/licenses/</a>&gt;. */<br />++<br />++#include &lt;nss=
.h&gt;<br />++#include &lt;netdb.h&gt;<br />++#include &lt;stdlib.h&gt;<br =
/>++#include &lt;string.h&gt;<br />++#include &lt;support/check.h&gt;<br />=
++#include &lt;support/xstdio.h&gt;<br />++#include "nss/tst-nss-gai-hv2-ca=
nonname.h"<br />++<br />++#define PREPARE do_prepare<br />++<br />++static =
void do_prepare (int a, char **av)<br />++{<br />++ FILE *hosts =3D xfopen =
("/etc/hosts", "w");<br />++ for (unsigned i =3D 2; i &lt; 255; i++)<br />+=
+ {<br />++ fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);=
<br />++ fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);<br />++ }<=
br />++ xfclose (hosts);<br />++}<br />++<br />++static int<br />++do_test =
(void)<br />++{<br />++ __nss_configure_lookup ("hosts", "test_gai_hv2_cano=
nname");<br />++<br />++ struct addrinfo hints =3D {};<br />++ struct addri=
nfo *result =3D NULL;<br />++<br />++ hints.ai_family =3D AF_INET6;<br />++=
 hints.ai_flags =3D AI_ALL | AI_V4MAPPED | AI_CANONNAME;<br />++<br />++ in=
t ret =3D getaddrinfo (QUERYNAME, NULL, &amp;hints, &amp;result);<br />++<b=
r />++ if (ret !=3D 0)<br />++ FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_=
strerror (ret));<br />++<br />++ TEST_COMPARE_STRING (result-&gt;ai_canonna=
me, QUERYNAME);<br />++<br />++ freeaddrinfo(result);<br />++ return 0;<br =
/>++}<br />++<br />++#include &lt;support/test-driver.c&gt;<br />+diff --gi=
t a/nss/tst-nss-gai-hv2-canonname.h b/nss/tst-nss-gai-hv2-canonname.h<br />=
+new file mode 100644<br />+index 0000000000..14f2a9cb08<br />+--- /dev/nul=
l<br />++++ b/nss/tst-nss-gai-hv2-canonname.h<br />+@@ -0,0 +1 @@<br />++#d=
efine QUERYNAME "test.example.com"<br />+diff --git a/nss/tst-nss-gai-hv2-c=
anonname.root/postclean.req b/nss/tst-nss-gai-hv2-canonname.root/postclean.=
req<br />+new file mode 100644<br />+index 0000000000..e69de29bb2<br />+dif=
f --git a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.scri=
pt b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script<br=
 />+new file mode 100644<br />+index 0000000000..31848b4a28<br />+--- /dev/=
null<br />++++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonna=
me.script<br />+@@ -0,0 +1,2 @@<br />++cp $B/nss/libnss_test_gai_hv2_canonn=
ame.so $L/libnss_test_gai_hv2_canonname.so.2<br />++su<br />+diff --git a/s=
ysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c<br />+index 6ae674=
4fe4..47f421fddf 100644<br />+--- a/sysdeps/posix/getaddrinfo.c<br />++++ b=
/sysdeps/posix/getaddrinfo.c<br />+@@ -120,6 +120,7 @@ struct gaih_result<b=
r />+ {<br />+ struct gaih_addrtuple *at;<br />+ char *canon;<br />++ char =
*h_name;<br />+ bool free_at;<br />+ bool got_ipv6;<br />+ };<br />+@@ -165=
,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)<br />+ if (res-&gt=
;free_at)<br />+ free (res-&gt;at);<br />+ free (res-&gt;canon);<br />++ fr=
ee (res-&gt;h_name);<br />+ memset (res, 0, sizeof (*res));<br />+ }<br />+=
<br />+@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const s=
truct gaih_typeproto *tp,<br />+ return 0;<br />+ }<br />+<br />+-/* Conver=
t struct hostent to a list of struct gaih_addrtuple objects. h_name<br />+-=
 is not copied, and the struct hostent object must not be deallocated<br />=
+- prematurely. The new addresses are appended to the tuple array in RES. *=
/<br />++/* Convert struct hostent to a list of struct gaih_addrtuple objec=
ts. The new<br />++ addresses are appended to the tuple array in RES. */<br=
 />+ static bool<br />+ convert_hostent_to_gaih_addrtuple (const struct add=
rinfo *req, int family,<br />+ struct hostent *h, struct gaih_result *res)<=
br />+@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct =
addrinfo *req, int family,<br />+ res-&gt;at =3D array;<br />+ res-&gt;free=
_at =3D true;<br />+<br />++ /* Duplicate h_name because it may get reclaim=
ed when the underlying storage<br />++ is freed. */<br />++ if (res-&gt;h_n=
ame =3D=3D NULL)<br />++ {<br />++ res-&gt;h_name =3D __strdup (h-&gt;h_nam=
e);<br />++ if (res-&gt;h_name =3D=3D NULL)<br />++ return false;<br />++ }=
<br />++<br />+ /* Update the next pointers on reallocation. */<br />+ for =
(size_t i =3D 0; i &lt; old; i++)<br />+ array[i].next =3D array + i + 1;<b=
r />+@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct ad=
drinfo *req, int family,<br />+ }<br />+ array[i].next =3D array + i + 1;<b=
r />+ }<br />+- array[0].name =3D h-&gt;h_name;<br />+ array[count - 1].nex=
t =3D NULL;<br />+<br />+ return true;<br />+@@ -324,15 +333,15 @@ gethosts=
 (nss_gethostbyname3_r fct, int family, const char *name,<br />+ memory all=
ocation failure. The returned string is allocated on the<br />+ heap; the c=
aller has to free it. */<br />+ static char *<br />+-getcanonname (nss_acti=
on_list nip, struct gaih_addrtuple *at, const char *name)<br />++getcanonna=
me (nss_action_list nip, const char *hname, const char *name)<br />+ {<br /=
>+ nss_getcanonname_r *cfct =3D __nss_lookup_function (nip, "getcanonname_r=
");<br />+ char *s =3D (char *) name;<br />+ if (cfct !=3D NULL)<br />+ {<b=
r />+ char buf[256];<br />+- if (DL_CALL_FCT (cfct, (at-&gt;name ?: name, b=
uf, sizeof (buf),<br />+- &amp;s, &amp;errno, &amp;h_errno)) !=3D NSS_STATU=
S_SUCCESS)<br />++ if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf)=
, &amp;s, &amp;errno,<br />++ &amp;h_errno)) !=3D NSS_STATUS_SUCCESS)<br />=
+ /* If the canonical name cannot be determined, use the passed<br />+ stri=
ng. */<br />+ s =3D (char *) name;<br />+@@ -771,7 +780,7 @@ get_nss_addres=
ses (const char *name, const struct addrinfo *req,<br />+ if ((req-&gt;ai_f=
lags &amp; AI_CANONNAME) !=3D 0<br />+ &amp;&amp; res-&gt;canon =3D=3D NULL=
)<br />+ {<br />+- char *canonbuf =3D getcanonname (nip, res-&gt;at, name);=
<br />++ char *canonbuf =3D getcanonname (nip, res-&gt;h_name, name);<br />=
+ if (canonbuf =3D=3D NULL)<br />+ {<br />+ __resolv_context_put (res_ctx);=
<br />diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch=
 b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch<br />new file m=
ode 100644<br />index 0000000000..507db5e13b<br />--- /dev/null<br />+++ b/=
meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch<br />@@ -0,0 +1,93=
 @@<br />+From: Romain Geissler &lt;romain.geissler@amadeus.com&gt;<br />+D=
ate: Mon, 25 Sep 2023 00:21:51 +0000 (+0100)<br />+Subject: Fix leak in get=
addrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]<br />+X-Git-Ur=
l: <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_plai=
n;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796" target=3D"_blank" rel=3D"no=
opener">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_plain;h=3D=
ec6b95c3303c700eb89eebeda2d7264cc184a796</a><br />+<br />+Fix leak in getad=
drinfo introduced by the fix for CVE-2023-4806 [BZ #30843]<br />+<br />+Thi=
s patch fixes a very recently added leak in getaddrinfo.<br />+<br />+Revie=
wed-by: Siddhesh Poyarekar &lt;siddhesh@sourceware.org&gt;<br />+<br />+Ups=
tream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3Dglibc.gi=
t;a=3Dcommitdiff_plain;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796" target=
=3D"_blank" rel=3D"noopener">https://sourceware.org/git/?p=3Dglibc.git;a=3D=
commitdiff_plain;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796</a>]<br />+<b=
r />+CVE: CVE-2023-5156<br />+<br />+Signed-off-by: Deepthi Hemraj &lt;Deep=
thi.Hemraj@windriver.com&gt;<br />+<br />+---<br />+<br />+diff --git a/nss=
/Makefile b/nss/Makefile<br />+index 8a5126ecf3..668ba34b18 100644<br />+--=
- a/nss/Makefile<br />++++ b/nss/Makefile<br />+@@ -149,6 +149,15 @@ endif<=
br />+ extra-test-objs +=3D nss_test1.os nss_test2.os nss_test_errno.os \<b=
r />+ nss_test_gai_hv2_canonname.os<br />+<br />++ifeq ($(run-built-tests),=
yes)<br />++ifneq (no,$(PERL))<br />++tests-special +=3D $(objpfx)mtrace-ts=
t-nss-gai-hv2-canonname.out<br />++endif<br />++endif<br />++<br />++genera=
ted +=3D mtrace-tst-nss-gai-hv2-canonname.out \<br />++ tst-nss-gai-hv2-can=
onname.mtrace<br />++<br />+ include ../Rules<br />+<br />+ ifeq (yes,$(hav=
e-selinux))<br />+@@ -217,6 +226,17 @@ endif<br />+ $(objpfx)tst-nss-files-=
alias-leak.out: $(objpfx)/libnss_files.so<br />+ $(objpfx)tst-nss-files-ali=
as-truncated.out: $(objpfx)/libnss_files.so<br />+<br />++tst-nss-gai-hv2-c=
anonname-ENV =3D \<br />++ MALLOC_TRACE=3D$(objpfx)tst-nss-gai-hv2-canonnam=
e.mtrace \<br />++ LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.s=
o<br />++$(objpfx)mtrace-tst-nss-gai-hv2-canonname.out: \<br />++ $(objpfx)=
tst-nss-gai-hv2-canonname.out<br />++ { test -r $(objpfx)tst-nss-gai-hv2-ca=
nonname.mtrace \<br />++ || ( echo "tst-nss-gai-hv2-canonname.mtrace does n=
ot exist"; exit 77; ) \<br />++ &amp;&amp; $(common-objpfx)malloc/mtrace \<=
br />++ $(objpfx)tst-nss-gai-hv2-canonname.mtrace; } &gt; $@; \<br />++ $(e=
valuate-test)<br />++<br />+ # Disable DT_RUNPATH on NSS tests so that the =
glibc internal NSS<br />+ # functions can load testing NSS modules via DT_R=
PATH.<br />+ LDFLAGS-tst-nss-test1 =3D -Wl,--disable-new-dtags<br />+diff -=
-git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c<br=
 />+index d5f10c07d6..7db53cf09d 100644<br />+--- a/nss/tst-nss-gai-hv2-can=
onname.c<br />++++ b/nss/tst-nss-gai-hv2-canonname.c<br />+@@ -21,6 +21,7 @=
@<br />+ #include &lt;netdb.h&gt;<br />+ #include &lt;stdlib.h&gt;<br />+ #=
include &lt;string.h&gt;<br />++#include &lt;mcheck.h&gt;<br />+ #include &=
lt;support/check.h&gt;<br />+ #include &lt;support/xstdio.h&gt;<br />+ #inc=
lude "nss/tst-nss-gai-hv2-canonname.h"<br />+@@ -41,6 +42,8 @@ static void =
do_prepare (int a, char **av)<br />+ static int<br />+ do_test (void)<br />=
+ {<br />++ mtrace ();<br />++<br />+ __nss_configure_lookup ("hosts", "tes=
t_gai_hv2_canonname");<br />+<br />+ struct addrinfo hints =3D {};<br />+di=
ff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c<br />+=
index 47f421fddf..531124958d 100644<br />+--- a/sysdeps/posix/getaddrinfo.c=
<br />++++ b/sysdeps/posix/getaddrinfo.c<br />+@@ -1196,9 +1196,7 @@ free_a=
nd_return:<br />+ if (malloc_name)<br />+ free ((char *) name);<br />+ free=
 (addrmem);<br />+- if (res.free_at)<br />+- free (res.at);<br />+- free (r=
es.canon);<br />++ gaih_result_reset (&amp;res);<br />+<br />+ return resul=
t;<br />+ }<br />diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/=
recipes-core/glibc/glibc_2.37.bb<br />index caf454f368..b88bc5fc4f 100644<b=
r />--- a/meta/recipes-core/glibc/glibc_2.37.bb<br />+++ b/meta/recipes-cor=
e/glibc/glibc_2.37.bb<br />@@ -50,6 +50,8 @@ SRC_URI =3D "${GLIBC_GIT_URI};=
branch=3D${SRCBRANCH};name=3Dglibc \<br />file://0021-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br />file://0022-Avoid-hardcoded-bu=
ild-time-paths-in-the-output-binar.patch \<br />file://0023-CVE-2023-4527.p=
atch \<br />+ file://0024-CVE-2023-5156-1.patch \<br />+ file://0024-CVE-20=
23-5156-2.patch \<br />"<br />S =3D "${WORKDIR}/git"<br />B =3D "${WORKDIR}=
/build-${TARGET_SYS}"<br />--<br />2.39.0</blockquote>
</blockquote>
</blockquote>

--KR570VEWAe7LNGhDzwGO--

