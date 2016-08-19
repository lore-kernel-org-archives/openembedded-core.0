Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id A12F57318F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:50:17 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ez1so3667355pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=TMWUSWDS03rC4KzoNEo+/YZL9ZppL9rWxOIp851DQLg=;
	b=lEv6pj7xfGvaKNmWgbvssJVrXui/i7sJmBTrei/E89EsEeCXfPvhgGbkJG/qZyMmHz
	U2+MpqhKlRICr1q8MtdmZQnLv5ri06Cod55V0iLkCHNp3LIiA3Zak5VS+0stQ2CHUDhC
	jAtGR5SksLOF1rHe656fhCz8gk6/ofV+tf4sFQmZ6BObcFvXG1reT8wg1/K9LOUPksxH
	h62nwUxscOFURXhQvVuOiMRcNGwVdS4gMtBkRhmaF+tot/MEVj0Y4+d2IEqf38bfarPb
	04K/3OuLNZsPoMYnm4ztr0e0vvoi8MdYqTTY5KXzYkjmIt71hRxJNX1aJb492YQQcVaD
	A2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TMWUSWDS03rC4KzoNEo+/YZL9ZppL9rWxOIp851DQLg=;
	b=Di9ZgaD7PnEE0q1Zj9OiSISud/bxoj6U6EtoY5/wJyBV9d9jcTx9fjlPSXlPmgD1/c
	OObFVWI3aX71eU2NSb/oFkT7gh2re4d6TY0DU0DgmOmUak6XQiPmXQVnzPGX9lFNGgg7
	ujtrAlfR9gzOsChUU9tTa1FyTUPNpG2hXuQnCwnBZtiO4DdCRnnhdgwxEJ5VJ5YUiBPh
	Yg4Y97RCvGKwyfBFnSz0MJK5rjUAfJ5aeY0qT123Cq4vkhrtzpbEwHa7JH0e2BjY8meb
	Xo3GmmgxRaJ5KM8hWV2btRWzCVBdhUZe7XRAwIehQx02nCiCSMITtDCEP28yTqtk+Cw1
	kYHA==
X-Gm-Message-State: AEkoouswUGulKLUzRhHeFiloj7caWBfYr6n0IiEqkS3BfpWyhdUqnaD6G5/3BEi9qbyIBA==
X-Received: by 10.66.150.39 with SMTP id uf7mr15346131pab.23.1471625417859;
	Fri, 19 Aug 2016 09:50:17 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	fe8sm12881883pad.2.2016.08.19.09.50.16
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:50:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471602690.24738.4.camel@andred.net>
Date: Fri, 19 Aug 2016 09:50:19 -0700
Message-Id: <16EEA94A-3B8F-4EE9-81DA-881E60A3272C@gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<1471602690.24738.4.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Fri, 19 Aug 2016 16:50:17 -0000
X-Groupsio-MsgNum: 85987
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3E1EC2B8-C578-4F08-80AB-C489B4E1E8EC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3E1EC2B8-C578-4F08-80AB-C489B4E1E8EC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

OK this can be merged.

> On Aug 19, 2016, at 3:31 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> ping?
>=20
> A.
>=20
>=20
> On Do, 2016-08-11 at 15:06 +0100, Andr=C3=A9 Draszik wrote:
>> The libnl+musl combination has two issues at the moment:
>> a) a public header file #include's an incorrect file
>>    (sys/poll.h instead of poll.h), which causes warnings and
>>    potentially errors (-Werror) in a musl based system
>> b) musl only ever provides the XSI version of strerror_r()
>>=20
>> a) can be fixed using a generic patch
>> b) has to be applied on demand for musl-based systems, only
>>=20
>> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> ---
>>  ...nclude-standard-poll.h-instead-of-sys-pol.patch |  40 +++++++
>>  .../libnl/0002-musl-fix-strerror_r-usage.patch     | 124
>> +++++++++++++++++++++
>>  meta/recipes-support/libnl/libnl_3.2.25.bb         |   2 +
>>  3 files changed, 166 insertions(+)
>>  create mode 100644 meta/recipes-support/libnl/libnl/0001-netlink.h-
>> include-standard-poll.h-instead-of-sys-pol.patch
>>  create mode 100644 meta/recipes-support/libnl/libnl/0002-musl-fix-
>> strerror_r-usage.patch
>>=20
>> diff --git a/meta/recipes-support/libnl/libnl/0001-netlink.h-include-
>> standard-poll.h-instead-of-sys-pol.patch b/meta/recipes-
>> =
support/libnl/libnl/0001-netlink.h-include-standard-poll.h-instead-of-sys-=

>> pol.patch
>> new file mode 100644
>> index 0000000..c9096ce
>> --- /dev/null
>> +++ =
b/meta/recipes-support/libnl/libnl/0001-netlink.h-include-standard-
>> poll.h-instead-of-sys-pol.patch
>> @@ -0,0 +1,40 @@
>> +=46rom 7f73d736db539eb4c6e7d59ed9332615d10ea785 Mon Sep 17 00:00:00 =
2001
>> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
>> +Date: Thu, 11 Aug 2016 11:53:44 +0100
>> +Subject: [PATCH 1/2] netlink.h: #include standard poll.h instead of
>> sys/poll.h
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +musl issues a #warning if a non-standard file like is included
>> +instead of the posix version (sys/poll.h vs poll.h in this
>> +case).
>> +Given netlink.h is installed and intended to be used by other
>> +projects, those other projects fail to compile if they enable
>> +-Werror (e.g. crda).
>> +
>> +Just do the correct thing and #include <poll.h> (the file
>> +specified by posix).
>> +
>> +Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> +---
>> +Upstream-Status: Pending
>> + include/netlink/netlink.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/include/netlink/netlink.h b/include/netlink/netlink.h
>> +index 28dba06..61656b3 100644
>> +--- a/include/netlink/netlink.h
>> ++++ b/include/netlink/netlink.h
>> +@@ -16,7 +16,7 @@
>> + #include <stdint.h>
>> + #include <string.h>
>> + #include <stdlib.h>
>> +-#include <sys/poll.h>
>> ++#include <poll.h>
>> + #include <sys/socket.h>
>> + #include <sys/types.h>
>> + #include <sys/time.h>
>> +--
>> +2.8.1
>> +
>> diff --git =
a/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-
>> usage.patch =
b/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-
>> usage.patch
>> new file mode 100644
>> index 0000000..3ded5b1
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-
>> usage.patch
>> @@ -0,0 +1,124 @@
>> +=46rom 4a88a12742ffc0a3ba3b4d4bd1398fa278ab1738 Mon Sep 17 00:00:00 =
2001
>> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
>> +Date: Thu, 11 Aug 2016 13:15:23 +0100
>> +Subject: [PATCH 2/2] musl: fix strerror_r() usage
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +glibc provides two versions of strerror_r(), which
>> +can be chosen between using feature test macros
>> +_GNU_SOURCE and _POSIX_C_SOURCE.
>> +musl on the other hand only ever provides the posix
>> +version of strerror_r().
>> +
>> +While this patch is not switching to the XSI version
>> +of strerror_r() in general, all implementations of
>> +the XSI version I have checked (bionic, uclibc,
>> +musl, glibc), fill buf with as many bytes as possible
>> +and NUL-terminate buf correctly.
>> +
>> +Switch to using XSI semantics. (This patch is only
>> +intended to be applied when compiling against
>> +musl - unfortunately musl doesn't provide any
>> +preprocessor directives to detect use of musl.)
>> +
>> +Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> +---
>> +Upstream-Status: Inappropriate [musl specific]
>> + lib/fib_lookup/lookup.c | 5 ++++-
>> + lib/handlers.c          | 3 ++-
>> + lib/msg.c               | 3 ++-
>> + lib/route/route_obj.c   | 3 ++-
>> + src/lib/utils.c         | 6 ++++--
>> + 5 files changed, 14 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/lib/fib_lookup/lookup.c b/lib/fib_lookup/lookup.c
>> +index 3d07317..490f04e 100644
>> +--- a/lib/fib_lookup/lookup.c
>> ++++ b/lib/fib_lookup/lookup.c
>> +@@ -125,6 +125,9 @@ static void result_dump_line(struct nl_object =
*obj,
>> struct nl_dump_params *p)
>> + {
>> + 	struct flnl_result *res =3D (struct flnl_result *) obj;
>> + 	char buf[256];
>> ++	char buf2[256];
>> ++
>> ++	strerror_r(-res->fr_error, buf2, sizeof(buf2));
>> +
>> + 	nl_dump_line(p, "table %s prefixlen %u next-hop-selector %u\n",
>> + 		rtnl_route_table2str(res->fr_table_id, buf,
>> sizeof(buf)),
>> +@@ -133,7 +136,7 @@ static void result_dump_line(struct nl_object =
*obj,
>> struct nl_dump_params *p)
>> + 		     nl_rtntype2str(res->fr_type, buf, sizeof(buf)));
>> + 	nl_dump(p, "scope %s error %s (%d)\n",
>> + 		rtnl_scope2str(res->fr_scope, buf, sizeof(buf)),
>> +-		strerror_r(-res->fr_error, buf, sizeof(buf)), res-
>>> fr_error);
>> ++		buf2, res->fr_error);
>> + }
>> +
>> + static void result_dump_details(struct nl_object *obj, struct
>> nl_dump_params *p)
>> +diff --git a/lib/handlers.c b/lib/handlers.c
>> +index a6a97bb..1b9bb4f 100644
>> +--- a/lib/handlers.c
>> ++++ b/lib/handlers.c
>> +@@ -81,8 +81,9 @@ static int nl_error_handler_verbose(struct =
sockaddr_nl
>> *who,
>> + 	FILE *ofd =3D arg ? arg : stderr;
>> + 	char buf[256];
>> +
>> ++	strerror_r(-e->error, buf, sizeof(buf));
>> + 	fprintf(ofd, "-- Error received: %s\n-- Original message: ",
>> +-		strerror_r(-e->error, buf, sizeof(buf)));
>> ++		buf);
>> + 	print_header_content(ofd, &e->msg);
>> + 	fprintf(ofd, "\n");
>> +
>> +diff --git a/lib/msg.c b/lib/msg.c
>> +index bcf1aa8..eec2833 100644
>> +--- a/lib/msg.c
>> ++++ b/lib/msg.c
>> +@@ -916,8 +916,9 @@ static void dump_error_msg(struct nl_msg *msg, =
FILE
>> *ofd)
>> + 		char buf[256];
>> + 		struct nl_msg *errmsg;
>> +
>> ++		strerror_r(-err->error, buf, sizeof(buf));
>> + 		fprintf(ofd, "    .error =3D %d \"%s\"\n", err->error,
>> +-			strerror_r(-err->error, buf, sizeof(buf)));
>> ++			buf);
>> + 		fprintf(ofd, "  [ORIGINAL MESSAGE] %zu octets\n",
>> sizeof(*hdr));
>> +
>> + 		errmsg =3D nlmsg_inherit(&err->msg);
>> +diff --git a/lib/route/route_obj.c b/lib/route/route_obj.c
>> +index dd4bf49..6fc4321 100644
>> +--- a/lib/route/route_obj.c
>> ++++ b/lib/route/route_obj.c
>> +@@ -257,9 +257,10 @@ static void route_dump_details(struct nl_object =
*a,
>> struct nl_dump_params *p)
>> + 	}
>> +
>> + 	if ((r->ce_mask & ROUTE_ATTR_CACHEINFO) && r-
>>> rt_cacheinfo.rtci_error) {
>> ++		strerror_r(-r->rt_cacheinfo.rtci_error, buf,
>> sizeof(buf));
>> + 		nl_dump_line(p, "    cacheinfo error %d (%s)\n",
>> + 			r->rt_cacheinfo.rtci_error,
>> +-			strerror_r(-r->rt_cacheinfo.rtci_error, buf,
>> sizeof(buf)));
>> ++			buf);
>> + 	}
>> +
>> + 	if (r->ce_mask & ROUTE_ATTR_METRICS) {
>> +diff --git a/src/lib/utils.c b/src/lib/utils.c
>> +index e5eacde..d9cc7a8 100644
>> +--- a/src/lib/utils.c
>> ++++ b/src/lib/utils.c
>> +@@ -79,8 +79,10 @@ void nl_cli_fatal(int err, const char *fmt, ...)
>> + 		vfprintf(stderr, fmt, ap);
>> + 		va_end(ap);
>> + 		fprintf(stderr, "\n");
>> +-	} else
>> +-		fprintf(stderr, "%s\n", strerror_r(err, buf,
>> sizeof(buf)));
>> ++	} else {
>> ++		strerror_r(err, buf, sizeof(buf));
>> ++		fprintf(stderr, "%s\n", buf);
>> ++	}
>> +
>> + 	exit(abs(err));
>> + }
>> +--
>> +2.8.1
>> +
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb =
b/meta/recipes-
>> support/libnl/libnl_3.2.25.bb
>> index cabe841..540b019 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.25.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
>> @@ -13,7 +13,9 @@ DEPENDS =3D "flex-native bison-native"
>>  SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz =
\
>>             file://fix-pktloc_syntax_h-race.patch \
>>             file://fix-pc-file.patch \
>> +           =
file://0001-netlink.h-include-standard-poll.h-instead-of-sys-
>> pol.patch \
>>            "
>> +SRC_URI_append_libc-musl =3D " =
file://0002-musl-fix-strerror_r-usage.patch"
>>=20
>>  SRC_URI[md5sum] =3D "03f74d0cd5037cadc8cdfa313bbd195c"
>>  SRC_URI[sha256sum] =3D
>> "8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_3E1EC2B8-C578-4F08-80AB-C489B4E1E8EC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3OMsACgkQuwUzVZGdMxSDfQCfY9lnbC9mhn9y7yBk5a0SaFXv
pswAn2xNEZ8UxiSdbLu4DkFw91eGoT2E
=kWG+
-----END PGP SIGNATURE-----

--Apple-Mail=_3E1EC2B8-C578-4F08-80AB-C489B4E1E8EC--
