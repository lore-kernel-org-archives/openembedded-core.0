Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1FAA0605BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 21:12:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d127so20727730wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 14:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=am2Mccs1AMAmNpcsCQ9X3RaugwLuQZWNkqnWY5Sl90U=;
	b=u9RNCJvdYAV++WJGFai4vvZIH69Bq6VFsd330BvzkVRcGL69yDYfgKysYVWB+2niyg
	RANUkG6oHel5VyOPsU/SQ5M0oJ0T77plto+jzpMFn+0whjIfHB9LeNKpWVRfymN/G0tL
	RN54GCjmQOQ2pHQTo/HEe4ExrjpstaxqVn24x2Ici1Wph5mrsJumYgxe4E6EO8gsSQSL
	ZG49a0JrKWX2ji6KD/e2gI8npjV0d8mwbz9blwUoolL0mAh6VVHk+XAYbWrvfGOed8H4
	igIX3yJFZEAz4u7OELRS7Tg3Etsx32CIOgi7RAkTelHOGo1NvmgZuXF1PP/qCoDng7rW
	p33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=am2Mccs1AMAmNpcsCQ9X3RaugwLuQZWNkqnWY5Sl90U=;
	b=WCH/F0D71D+/s2APGu9YhvzFkdepnUeagtmJi0ytFYWY6EaduWHSgFWO2TObf0Aj9j
	GiCbLEySp1KOCaprYPx0I4aOBEezs2JAkUFpQTMyWuNpxKwEHRQIlhhvADSWYmQbQTWo
	pZURodHgU19fjxZZwkt7VhgrExniwWkCJdwmhpiJ2FDjrtAiNw4usZKnLHkWeww4Ezze
	ibV9e/dxfluXY4xc/Ya9iQxdK7JggNC6Y1Al/rlQf4+QijWLjN/sHIy5slQRsTBXTEqJ
	EZj5MWkXZlCyIN5APTOHAtkIo46QOi+89r35/Ooylo51Jz9WGQq+Ec54+D6fGB0TYHJC
	UoNg==
X-Gm-Message-State: AODbwcB/5req7xuCronugwnR9O/GEelrTu2UX2i3a90vxKIGASGGlKkS
	PPyxfFo3sjeLW1Hc9uX3+UZN4oW32w==
X-Received: by 10.80.144.118 with SMTP id z51mr7245783edz.143.1496437978362;
	Fri, 02 Jun 2017 14:12:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 2 Jun 2017 14:12:27 -0700 (PDT)
In-Reply-To: <20170522050042.42403-5-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-5-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Jun 2017 14:12:27 -0700
Message-ID: <CAMKF1srgnO95oL5gZVbt++sby+7rXYpVNDfg=r+9z7Eujh3oow@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [PATCH 05/15] libidn: Fix hardened build with musl
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
X-List-Received-Date: Fri, 02 Jun 2017 21:12:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Armin

Please backport this patch to pyro as well.

On Sun, May 21, 2017 at 10:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Re-introduce the patch that was deemed to be not needed
> but it infact is still needed with musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libidn/0001-idn-format-security-warnings.patch | 181 +++++++++++++++=
++++++
>  meta/recipes-extended/libidn/libidn_1.33.bb        |   1 +
>  2 files changed, 182 insertions(+)
>  create mode 100644 meta/recipes-extended/libidn/libidn/0001-idn-format-s=
ecurity-warnings.patch
>
> diff --git a/meta/recipes-extended/libidn/libidn/0001-idn-format-security=
-warnings.patch b/meta/recipes-extended/libidn/libidn/0001-idn-format-secur=
ity-warnings.patch
> new file mode 100644
> index 0000000000..5adc7d9fd9
> --- /dev/null
> +++ b/meta/recipes-extended/libidn/libidn/0001-idn-format-security-warnin=
gs.patch
> @@ -0,0 +1,181 @@
> +From 82f98dcbc429bbe89a9837c533cbcbc02e77c790 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <adraszik@tycoint.com>
> +Date: Tue, 28 Jun 2016 12:43:31 +0100
> +Subject: [PATCH] idn: fix printf() format security warnings
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| ../../libidn-1.32/src/idn.c: In function 'main':
> +| ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be spe=
cified"));
> +|        ^~~~~
> +| ../../libidn-1.32/src/idn.c:187:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|      fprintf (stderr, _("Type each input string on a line by itself, "
> +|      ^~~~~~~
> +| ../../libidn-1.32/src/idn.c:202:4: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|     error (EXIT_FAILURE, errno, _("input error"));
> +|     ^~~~~
> +| ../../libidn-1.32/src/idn.c:220:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|         _("could not convert from UTF-8 to UCS-4"));
> +|         ^
> +| ../../libidn-1.32/src/idn.c:245:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|         _("could not convert from UTF-8 to UCS-4"));
> +|         ^
> +| ../../libidn-1.32/src/idn.c:281:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|       _("could not convert from UTF-8 to UCS-4"));
> +|       ^
> +| ../../libidn-1.32/src/idn.c:340:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|       _("could not convert from UCS-4 to UTF-8"));
> +|       ^
> +| ../../libidn-1.32/src/idn.c:364:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|       _("could not convert from UCS-4 to UTF-8"));
> +|       ^
> +| ../../libidn-1.32/src/idn.c:442:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|         _("could not convert from UCS-4 to UTF-8"));
> +|         ^
> +| ../../libidn-1.32/src/idn.c:498:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|       _("could not convert from UTF-8 to UCS-4"));
> +|       ^
> +| ../../libidn-1.32/src/idn.c:527:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|      _("could not convert from UTF-8 to UCS-4"));
> +|      ^
> +| ../../libidn-1.32/src/idn.c:540:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|       error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
> +|       ^~~~~
> +| ../../libidn-1.32/src/idn.c:551:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
> +|      _("could not convert from UTF-8 to UCS-4"));
> +|      ^
> +
> +Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> +---
> +Upstream-Status: Pending
> +
> + src/idn.c | 27 ++++++++++++++-------------
> + 1 file changed, 14 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/idn.c b/src/idn.c
> +index be1c7d1..68e4291 100644
> +--- a/src/idn.c
> ++++ b/src/idn.c
> +@@ -170,7 +170,7 @@ main (int argc, char *argv[])
> +       (args_info.idna_to_unicode_given ? 1 : 0) +
> +       (args_info.nfkc_given ? 1 : 0) !=3D 1)
> +     {
> +-      error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be speci=
fied"));
> ++      error (0, 0, "%s", _("only one of -s, -e, -d, -a, -u or -n can be=
 specified"));
> +       usage (EXIT_FAILURE);
> +     }
> +
> +@@ -185,7 +185,7 @@ main (int argc, char *argv[])
> +   if (!args_info.quiet_given
> +       && args_info.inputs_num =3D=3D 0
> +       && isatty (fileno (stdin)))
> +-    fprintf (stderr, _("Type each input string on a line by itself, "
> ++    fprintf (stderr, "%s", _("Type each input string on a line by itsel=
f, "
> +                      "terminated by a newline character.\n"));
> +
> +   do
> +@@ -197,7 +197,7 @@ main (int argc, char *argv[])
> +         if (feof (stdin))
> +           break;
> +
> +-        error (EXIT_FAILURE, errno, _("input error"));
> ++        error (EXIT_FAILURE, errno, "%s", _("input error"));
> +       }
> +
> +       if (strlen (line) > 0)
> +@@ -215,7 +215,7 @@ main (int argc, char *argv[])
> +         if (!q)
> +           {
> +             free (p);
> +-            error (EXIT_FAILURE, 0,
> ++            error (EXIT_FAILURE, 0, "%s",
> +                    _("could not convert from UTF-8 to UCS-4"));
> +           }
> +
> +@@ -240,7 +240,7 @@ main (int argc, char *argv[])
> +         if (!q)
> +           {
> +             free (r);
> +-            error (EXIT_FAILURE, 0,
> ++            error (EXIT_FAILURE, 0, "%s",
> +                    _("could not convert from UTF-8 to UCS-4"));
> +           }
> +
> +@@ -277,7 +277,7 @@ main (int argc, char *argv[])
> +         q =3D stringprep_utf8_to_ucs4 (p, -1, &len);
> +         free (p);
> +         if (!q)
> +-          error (EXIT_FAILURE, 0,
> ++          error (EXIT_FAILURE, 0, "%s",
> +                  _("could not convert from UTF-8 to UCS-4"));
> +
> +         if (args_info.debug_given)
> +@@ -336,7 +336,7 @@ main (int argc, char *argv[])
> +         r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
> +         free (q);
> +         if (!r)
> +-          error (EXIT_FAILURE, 0,
> ++          error (EXIT_FAILURE, 0, "%s",
> +                  _("could not convert from UCS-4 to UTF-8"));
> +
> +         p =3D stringprep_utf8_to_locale (r);
> +@@ -360,7 +360,7 @@ main (int argc, char *argv[])
> +         q =3D stringprep_utf8_to_ucs4 (p, -1, NULL);
> +         free (p);
> +         if (!q)
> +-          error (EXIT_FAILURE, 0,
> ++          error (EXIT_FAILURE, 0, "%s",
> +                  _("could not convert from UCS-4 to UTF-8"));
> +
> +         if (args_info.debug_given)
> +@@ -438,7 +438,7 @@ main (int argc, char *argv[])
> +         if (!q)
> +           {
> +             free (p);
> +-            error (EXIT_FAILURE, 0,
> ++            error (EXIT_FAILURE, 0, "%s",
> +                    _("could not convert from UCS-4 to UTF-8"));
> +           }
> +
> +@@ -494,7 +494,7 @@ main (int argc, char *argv[])
> +         r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
> +         free (q);
> +         if (!r)
> +-          error (EXIT_FAILURE, 0,
> ++          error (EXIT_FAILURE, 0, "%s",
> +                  _("could not convert from UTF-8 to UCS-4"));
> +
> +         p =3D stringprep_utf8_to_locale (r);
> +@@ -523,7 +523,7 @@ main (int argc, char *argv[])
> +             if (!q)
> +               {
> +                 free (p);
> +-                error (EXIT_FAILURE, 0,
> ++                error (EXIT_FAILURE, 0, "%s",
> +                        _("could not convert from UTF-8 to UCS-4"));
> +               }
> +
> +@@ -537,7 +537,8 @@ main (int argc, char *argv[])
> +         r =3D stringprep_utf8_nfkc_normalize (p, -1);
> +         free (p);
> +         if (!r)
> +-          error (EXIT_FAILURE, 0, _("could not do NFKC normalization"))=
;
> ++          error (EXIT_FAILURE, 0, "%s",
> ++                 _("could not do NFKC normalization"));
> +
> +         if (args_info.debug_given)
> +           {
> +@@ -547,7 +548,7 @@ main (int argc, char *argv[])
> +             if (!q)
> +               {
> +                 free (r);
> +-                error (EXIT_FAILURE, 0,
> ++                error (EXIT_FAILURE, 0, "%s",
> +                        _("could not convert from UTF-8 to UCS-4"));
> +               }
> +
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/libidn/libidn_1.33.bb b/meta/recipes-e=
xtended/libidn/libidn_1.33.bb
> index 109cc7f3f5..9e8bdbae18 100644
> --- a/meta/recipes-extended/libidn/libidn_1.33.bb
> +++ b/meta/recipes-extended/libidn/libidn_1.33.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
>             file://dont-depend-on-help2man.patch \
>             file://0001-idn-fix-printf-format-security-warnings.patch \
>             file://gcc7-compatibility.patch \
> +           file://0001-idn-format-security-warnings.patch \
>  "
>
>  SRC_URI[md5sum] =3D "a9aa7e003665de9c82bd3f9fc6ccf308"
> --
> 2.13.0
>

