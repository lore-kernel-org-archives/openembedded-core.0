Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E10CD7F2D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 23:50:31 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t12so22252812qtp.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 16:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=jSKmD5PZe8pQUL+gubZSlieXCi6JG4n33X+oNWWkTqI=;
	b=nXQ3+IhsNiyFWGzutNIzwh0GsjdBXUKdVTTbILn+szFI4+1J0LbeNlZ/xv2PzRa7OW
	8nJcrf+zrVrNvmchnZlV5DDoIzSW/oTYqN3q9OR3Ox9pX/pl9kZ38hVWw/yBWkTqC0DR
	qnSdTM/Waz7wFU02F4YW4IS1cC52n6JFBNAJE4pZ2FgvVAMrLIUwXo03paJZlXTE2Pta
	boHyBG86gitl9QHZ4jRc8dpKIj7J4wT/j+s1dl0rrpaxciWhFvi9m0Rh1GsehirricXX
	vuVaxi33WuJ6Y2PoIfXsljBw094bIZj7Hd/b+6knZG7oW6lIcirOlZ5WZ+EjY2zgl+hL
	intQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=jSKmD5PZe8pQUL+gubZSlieXCi6JG4n33X+oNWWkTqI=;
	b=tuKuHApXCvn3BCPMO2wEB7I2KMbvwxzGiTiWV/LYxBp5uDi6F6swSqxUDUthEM7s6p
	+YWsGFKpvJirCp//dXCVRtRVHou3MMcHTjiUrV/sP9higcve/iSdx1Vcyv2H5c6ojxic
	s2kvAYtWcC7+U5qzirRidqOX2KhGxemWxaJ95w7vLjosiJD9y2uN3wMrcR93kmkBKKWU
	NVjkRJRgIsXSrRpfbz6r+/bypkl0X3kVn5fFXHGgX2p2qX66CtAklAvjttFuAyJl1rNJ
	5LS/gWEg9SqENdAamkRBMGP23XtBKWHfutGIKQnEXoX+Z5RZUVo0w7Sm+jOLlrEEMGel
	2IJQ==
X-Gm-Message-State: APjAAAWblmMkh5sJ3WVmmt+eww8dOpaKETirsCP2/RnDZp6RnSv4YqBF
	5PW38iEmX6InCAYB3kYSVjE0WGhiDxVLhjGUpW6EpcrO
X-Google-Smtp-Source: APXvYqw6Ier+RUgxpX30ux/j8Pgc+9C246+7C8Q8yqsI4FoI0FRqOjhjrCF5KzGArqu2AbYuWAw1mcD98GfyiMo2WI4=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr28154540qtn.378.1567554632373;
	Tue, 03 Sep 2019 16:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190831142252.7204-1-raj.khem@gmail.com>
In-Reply-To: <20190831142252.7204-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2019 16:50:06 -0700
Message-ID: <CAMKF1spmWGzRPyih6uZsDmZj4Rwb0s_uwLOaDJuVGxyvtbS-jw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Tue, 03 Sep 2019 23:50:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin

Can we cherry-pick this patch to warrior and thud, please ?

On Sat, Aug 31, 2019 at 7:23 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libgpg-error-1.36-gawk5-support.patch     | 142 ++++++++++++++++++
>  .../libgpg-error/libgpg-error_1.36.bb         |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
> new file mode 100644
> index 0000000000..2db11b2176
> --- /dev/null
> +++ b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
> @@ -0,0 +1,142 @@
> +From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Mon, 15 Apr 2019 15:10:44 +0900
> +Subject: [PATCH] awk: Prepare for Gawk 5.0.
> +
> +* src/Makefile.am: Use pkg_namespace (instead of namespace).
> +* src/mkerrnos.awk: Likewise.
> +* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
> +* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
> +
> +--
> +
> +In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
> +which only allows escaping specific characters.
> +
> +GnuPG-bug-id: 4459
> +Reported-by: Marius Schamschula
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +Upstream-Status: Backport [https://dev.gnupg.org/T4459]
> +---
> + lang/cl/mkerrcodes.awk |  2 +-
> + src/Makefile.am        |  2 +-
> + src/mkerrcodes.awk     |  2 +-
> + src/mkerrcodes1.awk    |  2 +-
> + src/mkerrcodes2.awk    |  2 +-
> + src/mkerrnos.awk       |  2 +-
> + src/mkstrtable.awk     | 10 +++++-----
> + 7 files changed, 11 insertions(+), 11 deletions(-)
> +
> +--- a/lang/cl/mkerrcodes.awk
> ++++ b/lang/cl/mkerrcodes.awk
> +@@ -122,7 +122,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -293,7 +293,7 @@ code-from-errno.h: mkerrcodes$(EXEEXT_FO
> +
> + errnos-sym.h: Makefile mkstrtable.awk errnos.in
> +       $(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
> +-              -v prefix=GPG_ERR_ -v namespace=errnos_ \
> ++              -v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
> +               $(srcdir)/errnos.in >$@
> +
> +
> +--- a/src/mkerrcodes.awk
> ++++ b/src/mkerrcodes.awk
> +@@ -85,7 +85,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +--- a/src/mkerrcodes1.awk
> ++++ b/src/mkerrcodes1.awk
> +@@ -81,7 +81,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +--- a/src/mkerrcodes2.awk
> ++++ b/src/mkerrcodes2.awk
> +@@ -91,7 +91,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +--- a/src/mkerrnos.awk
> ++++ b/src/mkerrnos.awk
> +@@ -83,7 +83,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +--- a/src/mkstrtable.awk
> ++++ b/src/mkstrtable.awk
> +@@ -77,7 +77,7 @@
> + #
> + # The variable prefix can be used to prepend a string to each message.
> + #
> +-# The variable namespace can be used to prepend a string to each
> ++# The variable pkg_namespace can be used to prepend a string to each
> + # variable and macro name.
> +
> + BEGIN {
> +@@ -102,7 +102,7 @@ header {
> +       print "/* The purpose of this complex string table is to produce";
> +       print "   optimal code with a minimum of relocations.  */";
> +       print "";
> +-      print "static const char " namespace "msgstr[] = ";
> ++      print "static const char " pkg_namespace "msgstr[] = ";
> +       header = 0;
> +     }
> +   else
> +@@ -110,7 +110,7 @@ header {
> + }
> +
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[     ]+$/, ""); # Strip trailing space and tab characters.
> +
> +   if (/^$/)
> +@@ -150,7 +150,7 @@ END {
> +   else
> +     print "  gettext_noop (\"" last_msgstr "\");";
> +   print "";
> +-  print "static const int " namespace "msgidx[] =";
> ++  print "static const int " pkg_namespace "msgidx[] =";
> +   print "  {";
> +   for (i = 0; i < coded_msgs; i++)
> +     print "    " pos[i] ",";
> +@@ -158,7 +158,7 @@ END {
> +   print "  };";
> +   print "";
> +   print "static GPG_ERR_INLINE int";
> +-  print namespace "msgidxof (int code)";
> ++  print pkg_namespace "msgidxof (int code)";
> +   print "{";
> +   print "  return (0 ? 0";
> +
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
> index 2db544a12e..b11ab0548d 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
> @@ -14,6 +14,7 @@ SECTION = "libs"
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>             file://pkgconfig.patch \
> +           file://libgpg-error-1.36-gawk5-support.patch \
>           "
>
>  SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
> --
> 2.23.0
>

