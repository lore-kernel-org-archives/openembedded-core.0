Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaIrt-00078W-5c
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 06:54:14 +0200
Received: by mail-pa0-f47.google.com with SMTP id kl13so1835004pab.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=KHVvkIMV/KOLVgdA1Sf8dfOPpCKHiTWIfcan1scKdCc=;
	b=IUu2pH0XibAIgEWwN+HihRQCf50TMavdgm00ET+55zTwrSxhNxv4syEx+3K/S3kz52
	IkQlT85hHT/z6Qshk+0q4ZsyrPRvwA3RUgI7hCOkEJxJmjJWnla4/MxDlk2olmXFDgeH
	HS5knLGkRWx1HwYFkrx21GwhRvEHdbs6RU1Eqb8fynIM/Lj5sXoloMv9ZcX6AfRtzUHf
	9aeaDCo355y26HOW+fR0I966ofFAE1ZOwgQ4O51WUkgdy1IzBhW6f8pIAOqBqOHLvOIn
	yBJ1+jFhSckbt+CO/WcfVQUTK27iEgcRjJzAaUxpKSP/Ikh1NXv1XEAzUk0Wll1iKeKk
	2e+w==
X-Received: by 10.69.0.132 with SMTP id ay4mr10788378pbd.62.1368074169075;
	Wed, 08 May 2013 21:36:09 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gc5sm1390698pbb.19.2013.05.08.21.36.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 21:36:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368013438-15107-2-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 8 May 2013 21:36:06 -0700
Message-Id: <D0F767EF-AD39-4598-A4AC-C863B50F5D24@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1368013438-15107-2-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gdb: add 7.6 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 04:54:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 8, 2013, at 4:43 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-devtools/gdb/gdb-7.6.inc              | 11 ++++++++++
> .../gdb/gdb-7.6/gdbserver-cflags-last.diff         | 25 =
++++++++++++++++++++++
> .../recipes-devtools/gdb/gdb-cross-canadian_7.6.bb |  5 +++++
> meta/recipes-devtools/gdb/gdb-cross_7.6.bb         |  4 ++++
> meta/recipes-devtools/gdb/gdb_7.6.bb               |  3 +++
> 5 files changed, 48 insertions(+)
> create mode 100644 meta/recipes-devtools/gdb/gdb-7.6.inc
> create mode 100644 =
meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
> create mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> create mode 100644 meta/recipes-devtools/gdb/gdb_7.6.bb
>=20

also get rid of 6.5

> diff --git a/meta/recipes-devtools/gdb/gdb-7.6.inc =
b/meta/recipes-devtools/gdb/gdb-7.6.inc
> new file mode 100644
> index 0000000..20c4ea1
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-7.6.inc
> @@ -0,0 +1,11 @@
> +LICENSE=3D"GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> +		    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504=
 \
> +		    =
file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +		    =
file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674"
> +
> +PR =3D "${INC_PR}.0"

get rid of PR and INC_PR=20

otherwise looks ok

> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +SRC_URI[md5sum] =3D "a9836707337e5f7bf76a009a8904f470"
> +SRC_URI[sha256sum] =3D =
"8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
> diff --git =
a/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff =
b/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
> new file mode 100644
> index 0000000..4dfc419
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
> @@ -0,0 +1,25 @@
> +Upstream-Status: Pending
> +
> +---
> + gdb/gdbserver/Makefile.in |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +--- gdb/gdbserver/Makefile.in.orig
> ++++ gdb/gdbserver/Makefile.in
> +@@ -118,14 +118,14 @@ WARN_CFLAGS_NO_FORMAT =3D `echo " $(WARN_C
> + # CFLAGS is specifically reserved for setting from the command line
> + # when running make.  I.E.  "make CFLAGS=3D-Wmissing-prototypes".
> + CFLAGS =3D @CFLAGS@
> +=20
> + # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
> +-INTERNAL_CFLAGS_BASE =3D  ${CFLAGS} ${GLOBAL_CFLAGS} \
> ++INTERNAL_CFLAGS_BASE =3D  ${GLOBAL_CFLAGS} \
> + 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
> + INTERNAL_WARN_CFLAGS =3D  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
> +-INTERNAL_CFLAGS =3D  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) =
-DGDBSERVER
> ++INTERNAL_CFLAGS =3D  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) =
${CFLAGS} -DGDBSERVER
> +=20
> + # LDFLAGS is specifically reserved for setting from the command line
> + # when running make.
> + LDFLAGS =3D @LDFLAGS@
> + INTERNAL_LDFLAGS =3D $(LDFLAGS) @RDYNAMIC@
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb =
b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> new file mode 100644
> index 0000000..a2194a1
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> @@ -0,0 +1,5 @@
> +require gdb-common.inc
> +require gdb-cross-canadian.inc
> +require gdb-7.6.inc
> +
> +GDBPROPREFIX =3D "--program-prefix=3D'${TARGET_PREFIX}'"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.6.bb =
b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> new file mode 100644
> index 0000000..62f6937
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> @@ -0,0 +1,4 @@
> +require gdb-cross.inc
> +require gdb-7.6.inc
> +
> +SRC_URI +=3D "file://sim-install-6.6.patch"
> diff --git a/meta/recipes-devtools/gdb/gdb_7.6.bb =
b/meta/recipes-devtools/gdb/gdb_7.6.bb
> new file mode 100644
> index 0000000..0c9818d
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb_7.6.bb
> @@ -0,0 +1,3 @@
> +require gdb.inc
> +require gdb-7.6.inc
> +
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



