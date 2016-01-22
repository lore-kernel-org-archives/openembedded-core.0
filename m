Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78FDF73172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 07:08:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 123so15474742wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 23:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GIiiV/G5HV4Ezg/eZQDMVXFrg2JRn9Ek26u0gB4hVg4=;
	b=rTmTK1kjQU5oi1GFFhRNYqP6LIimannn0HFIit4ARUBMS29++0ZKxc/SfceN+4Q0jw
	XEZ0davPVPARWeHQhZEmKVRFi/G31i3TEJBYemw1zvjZduqXEtiRLqgBJ1xKIqFa0Qpw
	gW3H64LHu7ZDDWyq/5YLV6y2q1xhMQRLdqfJ4kgwXuR4WvflHn6VUqeVzPj4UZr7L3d6
	5aiOUbXXPZFZq7QbSqGyrhKfUdh1meLVwJ0CPxFXdgUkG92llqevrgqXtwXscnq1XjbB
	kVBFHDf/9YpD7RSSeS2h2H4gS1OCpQzFXG5CI5o5dm9v6mA7BL69CF8yISc7VnKd1gnI
	aLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=GIiiV/G5HV4Ezg/eZQDMVXFrg2JRn9Ek26u0gB4hVg4=;
	b=RfnQ0LjNFCtWQF4+bgJmSKefD/qYEzq1q9VoF+vHVE73p/oFwutrnLZYsUuBPF6d3q
	OhpslvJ/tNRkDaX274CrNDkPhj6E/wDNlMpNrFohwc8qd21TnFhYIrkNFrC8+wv9BVrA
	ZEMGBjbNt2gnSszfNtPq8r5mdGJZbPlykyW3/YmW1BXRDDT6P+UtnDPCU164y06IJquk
	WPmTyES2Orj7rQVsmeGuMKDpQDKY3vxzp/7ZiJ2R2/hraMenngWYm3fmhLJGAnmuo+rp
	OuvrmiUnC49PQj1dIH2NeowyAY7MW1Q1SulI7oVSuPvk7TBdAAc8SpRPOwqAlzFFVBTL
	yMeA==
X-Gm-Message-State: AG10YOQ3Lil4TYZMrVvIA+Xb9BW1DWq6egPlm78rVZujmGfBjDun1ABq9nfGCS6K7/W/mPKP/TjSMWw5XpF/CQ==
MIME-Version: 1.0
X-Received: by 10.28.53.193 with SMTP id c184mr1733932wma.4.1453446527160;
	Thu, 21 Jan 2016 23:08:47 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 21 Jan 2016 23:08:47 -0800 (PST)
In-Reply-To: <1452681963-25495-1-git-send-email-maxin.john@intel.com>
References: <1452681963-25495-1-git-send-email-maxin.john@intel.com>
Date: Thu, 21 Jan 2016 23:08:47 -0800
Message-ID: <CAJ86T=Uc5XTZu5UGPZfck9Vt6V-c=dBTD9mXdq+ZaT_0qsz7mw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Fri, 22 Jan 2016 07:08:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 2:46 AM, Maxin B. John <maxin.john@intel.com> wrote:
> 3.9.2 -> 3.10.0
>
> 1. Fixed a parallel build problem
> 2. Added a PACKAGECONFIG for readline
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc            |  2 ++
>  meta/recipes-support/sqlite/sqlite3/parallel.patch | 24 ++++++++++++++++++++++
>  .../sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} |  8 +++++---
>  3 files changed, 31 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/parallel.patch
>  rename meta/recipes-support/sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} (71%)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 2e3791b..5eb5de3 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -9,6 +9,8 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF = "--enable-shared --enable-threadsafe"
>  EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline"
> +PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"

Adding this without also adding PACKAGECONFIG ?= "readline" or similar
means target sqlite3 will now build with readline support disabled.

Was that the intention?

>  export config_BUILD_CC = "${BUILD_CC}"
>  export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
>  export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
> diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta/recipes-support/sqlite/sqlite3/parallel.patch
> new file mode 100644
> index 0000000..87471f0
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/parallel.patch
> @@ -0,0 +1,24 @@
> +build: Fix parallel build problems
> +
> +Avoid parallel build errors related to sqlite3.o target.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> +diff -Naur sqlite-autoconf-3100000-orig/Makefile.am sqlite-autoconf-3100000/Makefile.am
> +--- sqlite-autoconf-3100000-orig/Makefile.am  2016-01-06 14:03:00.000000000 +0200
> ++++ sqlite-autoconf-3100000/Makefile.am       2016-01-12 13:14:03.620117514 +0200
> +@@ -6,10 +6,8 @@
> + libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
> +
> + bin_PROGRAMS = sqlite3
> +-sqlite3_SOURCES = shell.c sqlite3.h
> +-EXTRA_sqlite3_SOURCES = sqlite3.c
> +-sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
> +-sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
> ++sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
> ++sqlite3_LDADD = @READLINE_LIBS@
> + sqlite3_CFLAGS = $(AM_CFLAGS)
> +
> + include_HEADERS = sqlite3.h sqlite3ext.h
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
> similarity index 71%
> rename from meta/recipes-support/sqlite/sqlite3_3.9.2.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.10.0.bb
> index 18b1a2b..092f782 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
> @@ -10,10 +10,12 @@ def sqlite_download_version(d):
>
>  PE = "3"
>  SQLITE_PV = "${@sqlite_download_version(d)}"
> -SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
> +SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> +           file://parallel.patch \
> +          "
>
> -SRC_URI[md5sum] = "bc4eb5b3fc5cfcb6e059794306cac1ca"
> -SRC_URI[sha256sum] = "064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b"
> +SRC_URI[md5sum] = "274364e6ca5c1104d42912f11e61ed26"
> +SRC_URI[sha256sum] = "43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042"
>
>  UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
>  UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

