Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 60DCB601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 17:09:55 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e128so26402412pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Ax9IrCmHVl6BMk99cjNCQCFkU5VUNzJwLDGJi7m5Clk=;
	b=N3f2MFyuHdB6mFLfqPA4/ZaKcnUiGJlOWEhpilUX9vO+4rLoLFvI7Do0bVaNfJxu+Z
	yVOKmipp7qHwNEiQHl2SsT2Otrupzv+NxxxeA9+wl73eXDFSIrG5yib8wzVjpYRwKWl7
	tAmWJ5KGd0xL3FGhpEWEZNvc3pnItEZJPyl1lDgUG+tzuVpUwOUrLiH9thagaWgbnxNj
	sChaj9FBe7gjQcX7pblPvJtGv+njC86QtYTDiWNNMXxMXff3cq6YfGawvoCyrIvcF5RH
	pxujcgHaFIb4jOGfsHA4JjcMNd1RXIYSOmJ/cZpA4FQlHgnILtzIn5svc/k38uzxlVqD
	EhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ax9IrCmHVl6BMk99cjNCQCFkU5VUNzJwLDGJi7m5Clk=;
	b=K3ymqKopq51jwKSAPABDEQiC7LkUIIScaOzJj0MiV+53DnFDDOwjIulsaGXtFDtmfP
	kYE4Zmc7zx7qgL7X3EAQgOXaPU3WjGQ7gCfeq61Uw8OUbHaZbLXUw4xStZTAqCicKF9d
	p7EheY4n0B14iJdnfOG0cHHEcA7fJFV6Son8rg3LCTGcIvkIcQinG+H24y+bMSRiZBfE
	rYHlpyQ9R1MHnLKErHeaGAl8S7pqsTu+BfZU1GJS28Z2LIE+1LoctYFZU6VlG0yirJuI
	hkz6qhQmZgfiMa6UCNB4XXymP17F9BL0WZgYxFtJW2BQYOvZWZRVBJ8f1aZ2jqDDkOfp
	yJUQ==
X-Gm-Message-State: AD7BkJLVkCJrXD9ZmVuQ56zhICC2bPjptJkKsrhrPD+yPJcK9CFkPo97u7kIaMw0fPia9g==
X-Received: by 10.98.86.146 with SMTP id h18mr14991949pfj.9.1459357796458;
	Wed, 30 Mar 2016 10:09:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:153e:3940:320e:6ae3?
	([2601:646:8800:5a9a:153e:3940:320e:6ae3])
	by smtp.gmail.com with ESMTPSA id
	r65sm7276809pfa.27.2016.03.30.10.09.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 10:09:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459345278.3751.1.camel@linux.intel.com>
Date: Wed, 30 Mar 2016 10:09:51 -0700
Message-Id: <28FCA53D-D0E7-47FD-8CA3-D7D37F098062@gmail.com>
References: <1459292571-13876-1-git-send-email-raj.khem@gmail.com>
	<1459345278.3751.1.camel@linux.intel.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Wed, 30 Mar 2016 17:09:56 -0000
X-Groupsio-MsgNum: 80307
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C82FAC83-D4C5-42D7-993C-A1F2BDAE268B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C82FAC83-D4C5-42D7-993C-A1F2BDAE268B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 30, 2016, at 6:41 AM, Joshua G Lock =
<joshua.g.lock@linux.intel.com> wrote:
>=20
> On Tue, 2016-03-29 at 23:02 +0000, Khem Raj wrote:
>> We can replace __WORDSIZE with UINTPTR_MAX
>> sys/user.h is in conflict with asm/ptrace.h on musl
>=20
> psmisc is failing to build on the autobuilder with this patch =
included:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
> s/65/steps/BuildImages/logs/stdio
>=20
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-
> gpl3/builds/721/steps/BuildImages/logs/stdio

Thanks for pointing out. It seems to be x86 only case. I will add =
appropriate guards
and send a v2.

>=20
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 49
>> ++++++++++++++++++++++
>>  meta/recipes-extended/psmisc/psmisc_22.21.bb       |  8 ++--
>>  2 files changed, 54 insertions(+), 3 deletions(-)
>>  create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Use-
>> UINTPTR_MAX-instead-of-__WORDSIZE.patch
>>=20
>> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-
>> UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-
>> extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-
>> __WORDSIZE.patch
>> new file mode 100644
>> index 0000000..2e70d5e
>> --- /dev/null
>> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-
>> instead-of-__WORDSIZE.patch
>> @@ -0,0 +1,49 @@
>> +=46rom 004de754e8b2c3cbfaf3aeba511a1c4149b23eb4 Mon Sep 17 00:00:00
>> 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 24 Mar 2016 15:46:14 +0000
>> +Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
>> +
>> +Do not include sys/user.h since it conflicts with
>> +pt_regs struct from kernel APIs in asm/ptrace.h
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + src/peekfd.c | 12 ++++++------
>> + 1 file changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/src/peekfd.c b/src/peekfd.c
>> +index cba2130..e2c39cd 100644
>> +--- a/src/peekfd.c
>> ++++ b/src/peekfd.c
>> +@@ -30,8 +30,8 @@
>> + #include <asm/ptrace.h>
>> + #include <byteswap.h>
>> + #include <endian.h>
>> +-#include <sys/user.h>
>> + #include <stdlib.h>
>> ++#include <stdint.h>
>> + #include <getopt.h>
>> + #include <ctype.h>
>> +
>> +@@ -228,11 +228,11 @@ int main(int argc, char **argv)
>> + 		if (WIFSTOPPED(status)) {
>> + #ifdef PPC
>> + 			struct pt_regs regs;
>> +-			regs.gpr[0] =3D ptrace(PTRACE_PEEKUSER, pid,
>> __WORDSIZE/8 * PT_R0, 0);
>> +-			regs.gpr[3] =3D ptrace(PTRACE_PEEKUSER, pid,
>> __WORDSIZE/8 * PT_R3, 0);
>> +-			regs.gpr[4] =3D ptrace(PTRACE_PEEKUSER, pid,
>> __WORDSIZE/8 * PT_R4, 0);
>> +-			regs.gpr[5] =3D ptrace(PTRACE_PEEKUSER, pid,
>> __WORDSIZE/8 * PT_R5, 0);
>> +-			regs.orig_gpr3 =3D ptrace(PTRACE_PEEKUSER,
>> pid, __WORDSIZE/8 * PT_ORIG_R3, 0);
>> ++			regs.gpr[0] =3D ptrace(PTRACE_PEEKUSER, pid,
>> UINTPTR_MAX/8 * PT_R0, 0);
>> ++			regs.gpr[3] =3D ptrace(PTRACE_PEEKUSER, pid,
>> UINTPTR_MAX/8 * PT_R3, 0);
>> ++			regs.gpr[4] =3D ptrace(PTRACE_PEEKUSER, pid,
>> UINTPTR_MAX/8 * PT_R4, 0);
>> ++			regs.gpr[5] =3D ptrace(PTRACE_PEEKUSER, pid,
>> UINTPTR_MAX/8 * PT_R5, 0);
>> ++			regs.orig_gpr3 =3D ptrace(PTRACE_PEEKUSER,
>> pid, UINTPTR_MAX/8 * PT_ORIG_R3, 0);
>> + #elif defined(ARM)
>> + 			struct pt_regs regs;
>> + 			ptrace(PTRACE_GETREGS, pid, 0, &regs);
>> +--
>> +1.8.3.1
>> +
>> diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> b/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> index 66aba9e..1c6473e 100644
>> --- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> +++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e
>> 8d672dc4c32c317bb3"
>>  SRC_URI[md5sum] =3D "935c0fd6eb208288262b385fa656f1bf"
>>  SRC_URI[sha256sum] =3D
>> "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
>>=20
>> -SRC_URI +=3D =
"file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>> \
>> -            file://0002-Include-limits.h-for-PATH_MAX.patch \
>> -            "
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
>> +           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
>> +           file://0002-Include-limits.h-for-PATH_MAX.patch \
>> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
>> +           "
>> --
>> 1.9.1
>>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C82FAC83-D4C5-42D7-993C-A1F2BDAE268B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8CGIACgkQuwUzVZGdMxSDBgCbBP7jhV/PFJBhiMIvd/0tjKW4
jFIAn3/KaMW53tMR3vMO7usNYUVkcCn4
=FCnb
-----END PGP SIGNATURE-----

--Apple-Mail=_C82FAC83-D4C5-42D7-993C-A1F2BDAE268B--
