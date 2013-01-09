Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tt1eb-0005zp-UH
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 20:49:39 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so2590141iej.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 11:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=e54S65GUOx6bsxmR6EukZeXavKUu7Gzjr7wsH1uNAYs=;
	b=PkmLw7RlY/EON5fTqrAvOoZ+Yg32LZocTaCfU6TijfOyboxHg+0J7//QeQ7Kgnraq1
	pJ7tWFeNRyJnqGYA4oI49vpE1yUPYJnYSnBi+7sBQaya2pgwXJ2YcqH0YeFTxYwflbe2
	lB9oNBBYceMKZuJCK4rPRAABhI4tjMZZa7jCVITapoNdGHM3XhS/XwfTHZk1+AuotGEC
	PjrnGTMcqNzKz3IAAaSA0FCg5im4BQD/9J6981xN5iZevf3fgM53DtjsoVzerhdhTSKZ
	pcMJIQgvBVHA95BoFdYBohsKbOUPgM7cCkR45w5wzcearSS1DWBPlq4fKU0fpw05NQKv
	2X2g==
Received: by 10.50.179.71 with SMTP id de7mr2721589igc.84.1357760065003; Wed,
	09 Jan 2013 11:34:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 11:33:54 -0800 (PST)
In-Reply-To: <1357754185-17000-1-git-send-email-sgw@linux.intel.com>
References: <1357754185-17000-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 11:33:54 -0800
Message-ID: <CAMKF1sqCcBzze_rt5dQAu+Zpy=5y+7nsRmE0dsEznq3BfE8Lcg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: update configure for eglibc 2.17
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
X-List-Received-Date: Wed, 09 Jan 2013 19:49:45 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Khem Raj <raj.khem@gmail.com>

On Wed, Jan 9, 2013 at 9:56 AM, Saul Wold <sgw@linux.intel.com> wrote:
> Tested with both eglibc 2.16 and 2.17
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  ...ibc-2.16.patch => configure-with-newer-glibc.patch} | 18 +++++++++++++-----
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb       |  4 ++--
>  2 files changed, 15 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/valgrind/valgrind-3.7.0/{configure-with-glibc-2.16.patch => configure-with-newer-glibc.patch} (62%)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch
> similarity index 62%
> rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
> rename to meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch
> index c622637..b369de8 100644
> --- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch
> @@ -1,13 +1,14 @@
>  Add case for glibc 2.16 and correct error message to denote support until 2.16
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
>  Upstream-Status: Pending
>  Index: valgrind-3.7.0/configure.in
>  ===================================================================
> ---- valgrind-3.7.0.orig/configure.in   2012-07-04 12:57:10.557192441 -0700
> -+++ valgrind-3.7.0/configure.in        2012-07-04 12:57:58.785194776 -0700
> -@@ -788,6 +788,13 @@
> +--- valgrind-3.7.0.orig/configure.in
> ++++ valgrind-3.7.0/configure.in
> +@@ -788,6 +788,20 @@ case "${GLIBC_VERSION}" in
>         DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
>         DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
>         ;;
> @@ -18,15 +19,22 @@ Index: valgrind-3.7.0/configure.in
>  +      DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
>  +      DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
>  +      ;;
> ++     2.17)
> ++      AC_MSG_RESULT(2.17 family)
> ++      AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
> ++      DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
> ++      DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
> ++      DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
> ++      ;;
>        darwin)
>         AC_MSG_RESULT(Darwin)
>         AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
> -@@ -801,7 +808,7 @@
> +@@ -801,7 +815,7 @@ case "${GLIBC_VERSION}" in
>
>        *)
>         AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
>  -      AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.14])
> -+      AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
> ++      AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.17])
>         AC_MSG_ERROR([or Darwin libc])
>         ;;
>   esac
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index 3def11d..0bf6ef4 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>
>  X11DEPENDS = "virtual/libx11"
>  DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> -PR = "r7"
> +PR = "r8"
>
>  SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>            file://fix_issue_caused_by_ccache.patch \
> @@ -18,7 +18,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>             file://fix_for_automake_1.11.2.patch \
>             file://configure-fix.patch \
>             file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
> -           file://configure-with-glibc-2.16.patch \
> +           file://configure-with-newer-glibc.patch \
>            "
>
>  SRC_URI_append_powerpc = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
> --
> 1.8.0.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


