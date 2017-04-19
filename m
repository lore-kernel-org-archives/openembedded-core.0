Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4D88971C54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:36:45 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r190so15809118wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LazWxnP+9w1pvh3ujH8HAf04A9uwJHz0//T9mJTmJ3g=;
	b=g9IkBDXw28ftVCNOKburdpDUUEb+AFOVJcTL1GC3zBQCCIrjienoPVzWA50WgCLs5G
	39tQ0l2DOmqbS/aPbLfzjq/LpoXi75gJ8FBoZfUTNlh/XCUBiNUoBvJGZEGNsZnyLiQb
	Wj7Z8UuCaoDZzT779V+dReshsKFbRS+bm+oZt9iV/4giy0PaS8MPMy/E2A84Lb79OAIJ
	nex5nscHwzTw61uZUoacZUBi9WCWXBMh4CPiYuGTbkoP9vL5f/FpNDH8sJQttri4EvzG
	myiCvvI+1+NnNra1kS5/JHS1UXz3wVs8cWggxCyyAbbWt0yziBHxrWarZ3hc1a45zSJE
	90+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LazWxnP+9w1pvh3ujH8HAf04A9uwJHz0//T9mJTmJ3g=;
	b=frighzxvBCX4C5dcILcdOFpzrmhQt6v5/xrG75o+gA8rzFUPJRnUrx8eQidHfTzkHn
	pI2BOBmp9jmpRfuvTB5rRNPuilsSmEU32okdW5KoNtncn+ds1dROY2BrRPCm2aRVrykR
	JuWQIxmldHKuqumSZ9l5h4+Bdh0OwwjeQJE4YWVa8vCk9rwl9YqepfDEYMxK1TJbUE7W
	u5yjx44bSGjXGiSVbwedyklng68qNB14PZQjBVnqSFNZrR9V2whH6BBfo8r4M2GYfPVn
	QwgPknrniV2PIT3i1IVYgExBXMEhXdJTdvY20iSPDdgdDLKjikzPE0jIz4kyWM8EMGEu
	rWkw==
X-Gm-Message-State: AN3rC/6qvCRJkasa7dTpH15dmquq42kmlkdeT+91dKjkFP/uBxx88oAE
	2ckEvW0er/FloHXvahEnNk9Dh2Focg==
X-Received: by 10.28.153.194 with SMTP id b185mr18602456wme.101.1492619805846; 
	Wed, 19 Apr 2017 09:36:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 19 Apr 2017 09:36:15 -0700 (PDT)
In-Reply-To: <1492614389.15070.3.camel@andred.net>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-5-raj.khem@gmail.com>
	<1492614389.15070.3.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2017 09:36:15 -0700
Message-ID: <CAMKF1so8Q3w7uRsduLD=ti3YCfZSC8SuOZYTXRh=xvgoCg5ftg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libidn: Fix build with gcc7
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
X-List-Received-Date: Wed, 19 Apr 2017 16:36:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 8:06 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Tue, 2017-04-18 at 18:58 -0700, Khem Raj wrote:
>> Replace a local patch for format warning with the one
>> that got committed upstream
>
> This commit message is confusing, as the two patches are unrelated and th=
ey
> are addressing different issues.
>
> You are:
> - removing a patch that fixed Wformat-security warnings / errors
>   (not upstreamed)
> - adding a patch that fixes other (unrelated) Wformat warnings
>   (from upstream)
>


The backport obviously is a different patch and works fine with
security flags turned on. Can you point
whats missing from outgoing patch that we need ?

>
> Cheers,
> Andre'
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...1-idn-fix-printf-format-security-warnings.patch | 825
>> +++++++++++++++++----
>>  .../libidn/libidn/gcc7-compatibility.patch         | 334 +++++++++
>>  meta/recipes-extended/libidn/libidn_1.33.bb        |   1 +
>>  3 files changed, 1004 insertions(+), 156 deletions(-)
>>  create mode 100644 meta/recipes-extended/libidn/libidn/gcc7-
>> compatibility.patch
>>
>> diff --git a/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-
>> format-security-warnings.patch b/meta/recipes-extended/libidn/libidn/000=
1-
>> idn-fix-printf-format-security-warnings.patch
>> index 5adc7d9fd98..2d5faabb240 100644
>> --- a/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-
>> security-warnings.patch
>> +++ b/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-
>> security-warnings.patch
>> @@ -1,181 +1,694 @@
>> -From 82f98dcbc429bbe89a9837c533cbcbc02e77c790 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <adraszik@tycoint.com>
>> -Date: Tue, 28 Jun 2016 12:43:31 +0100
>> -Subject: [PATCH] idn: fix printf() format security warnings
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> +From 7148adf34dae30345c2e4d9d437838a45ba6f6e8 Mon Sep 17 00:00:00 2001
>> +From: =3D?utf8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
>> +Date: Wed, 1 Feb 2017 11:06:39 +0100
>> +Subject: [PATCH] Fix -Wformat warnings
>>
>> -| ../../libidn-1.32/src/idn.c: In function 'main':
>> -| ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be
>> specified"));
>> -|        ^~~~~
>> -| ../../libidn-1.32/src/idn.c:187:5: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|      fprintf (stderr, _("Type each input string on a line by itself, =
"
>> -|      ^~~~~~~
>> -| ../../libidn-1.32/src/idn.c:202:4: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|     error (EXIT_FAILURE, errno, _("input error"));
>> -|     ^~~~~
>> -| ../../libidn-1.32/src/idn.c:220:8: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|         _("could not convert from UTF-8 to UCS-4"));
>> -|         ^
>> -| ../../libidn-1.32/src/idn.c:245:8: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|         _("could not convert from UTF-8 to UCS-4"));
>> -|         ^
>> -| ../../libidn-1.32/src/idn.c:281:6: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|       _("could not convert from UTF-8 to UCS-4"));
>> -|       ^
>> -| ../../libidn-1.32/src/idn.c:340:6: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|       _("could not convert from UCS-4 to UTF-8"));
>> -|       ^
>> -| ../../libidn-1.32/src/idn.c:364:6: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|       _("could not convert from UCS-4 to UTF-8"));
>> -|       ^
>> -| ../../libidn-1.32/src/idn.c:442:8: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|         _("could not convert from UCS-4 to UTF-8"));
>> -|         ^
>> -| ../../libidn-1.32/src/idn.c:498:6: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|       _("could not convert from UTF-8 to UCS-4"));
>> -|       ^
>> -| ../../libidn-1.32/src/idn.c:527:5: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|      _("could not convert from UTF-8 to UCS-4"));
>> -|      ^
>> -| ../../libidn-1.32/src/idn.c:540:6: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|       error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
>> -|       ^~~~~
>> -| ../../libidn-1.32/src/idn.c:551:5: error: format not a string literal
>> and no format arguments [-Werror=3Dformat-security]
>> -|      _("could not convert from UTF-8 to UCS-4"));
>> -|      ^
>> -
>> -Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>>  ---
>> -Upstream-Status: Pending
>> +Upstream-Status: Backport
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> - src/idn.c | 27 ++++++++++++++-------------
>> - 1 file changed, 14 insertions(+), 13 deletions(-)
>> + examples/example.c     |  6 +++---
>> + examples/example3.c    |  4 ++--
>> + examples/example4.c    |  4 ++--
>> + examples/example5.c    |  2 +-
>> + src/idn.c              |  2 +-
>> + tests/tst_idna.c       | 25 +++++++++++++------------
>> + tests/tst_idna2.c      |  8 ++++----
>> + tests/tst_idna3.c      |  8 ++++----
>> + tests/tst_nfkc.c       |  8 ++++----
>> + tests/tst_pr29.c       | 12 ++++++------
>> + tests/tst_punycode.c   | 13 +++++++------
>> + tests/tst_strerror.c   | 20 ++++++++++----------
>> + tests/tst_stringprep.c | 12 ++++++------
>> + tests/tst_tld.c        | 20 ++++++++++----------
>> + tests/utils.c          |  6 +++---
>> + 15 files changed, 76 insertions(+), 74 deletions(-)
>>
>> +diff --git a/examples/example.c b/examples/example.c
>> +index 6e91783..24f64e0 100644
>> +--- a/examples/example.c
>> ++++ b/examples/example.c
>> +@@ -55,7 +55,7 @@ main (void)
>> +
>> +   printf ("Before locale2utf8 (length %ld): ", (long int) strlen (buf)=
);
>> +   for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   p =3D stringprep_locale_to_utf8 (buf);
>> +@@ -69,7 +69,7 @@ main (void)
>> +
>> +   printf ("Before stringprep (length %ld): ", (long int) strlen (buf))=
;
>> +   for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   rc =3D stringprep (buf, BUFSIZ, 0, stringprep_nameprep);
>> +@@ -79,7 +79,7 @@ main (void)
>> +     {
>> +       printf ("After stringprep (length %ld): ", (long int) strlen
>> (buf));
>> +       for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +       printf ("\n");
>> +     }
>> +
>> +diff --git a/examples/example3.c b/examples/example3.c
>> +index fc11c1c..ffb9042 100644
>> +--- a/examples/example3.c
>> ++++ b/examples/example3.c
>> +@@ -56,7 +56,7 @@ main (void)
>> +
>> +   printf ("Read string (length %ld): ", (long int) strlen (buf));
>> +   for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   rc =3D idna_to_ascii_lz (buf, &p, 0);
>> +@@ -68,7 +68,7 @@ main (void)
>> +
>> +   printf ("ACE label (length %ld): '%s'\n", (long int) strlen (p), p);
>> +   for (i =3D 0; i < strlen (p); i++)
>> +-    printf ("%02x ", p[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) p[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   free (p);
>> +diff --git a/examples/example4.c b/examples/example4.c
>> +index 1b319c9..a3315a1 100644
>> +--- a/examples/example4.c
>> ++++ b/examples/example4.c
>> +@@ -56,7 +56,7 @@ main (void)
>> +
>> +   printf ("Read string (length %ld): ", (long int) strlen (buf));
>> +   for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   rc =3D idna_to_unicode_lzlz (buf, &p, 0);
>> +@@ -68,7 +68,7 @@ main (void)
>> +
>> +   printf ("ACE label (length %ld): '%s'\n", (long int) strlen (p), p);
>> +   for (i =3D 0; i < strlen (p); i++)
>> +-    printf ("%02x ", p[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) p[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   free (p);
>> +diff --git a/examples/example5.c b/examples/example5.c
>> +index df55798..29d40b9 100644
>> +--- a/examples/example5.c
>> ++++ b/examples/example5.c
>> +@@ -68,7 +68,7 @@ main (void)
>> +
>> +   printf ("Read string (length %ld): ", (long int) strlen (buf));
>> +   for (i =3D 0; i < strlen (buf); i++)
>> +-    printf ("%02x ", buf[i] & 0xFF);
>> ++    printf ("%02x ", (unsigned) buf[i] & 0xFF);
>> +   printf ("\n");
>> +
>> +   p =3D stringprep_locale_to_utf8 (buf);
>>  diff --git a/src/idn.c b/src/idn.c
>> -index be1c7d1..68e4291 100644
>> +index be1c7d1..13eb3c9 100644
>>  --- a/src/idn.c
>>  +++ b/src/idn.c
>> -@@ -170,7 +170,7 @@ main (int argc, char *argv[])
>> -       (args_info.idna_to_unicode_given ? 1 : 0) +
>> -       (args_info.nfkc_given ? 1 : 0) !=3D 1)
>> +@@ -419,7 +419,7 @@ main (int argc, char *argv[])
>> +           size_t i;
>> +           for (i =3D 0; p[i]; i++)
>> +             fprintf (stderr, "output[%lu] =3D U+%04x\n",
>> +-                     (unsigned long) i, p[i]);
>> ++                     (unsigned long) i, (unsigned) p[i]);
>> +         }
>> +
>> +       fprintf (stdout, "%s\n", p);
>> +diff --git a/tests/tst_idna.c b/tests/tst_idna.c
>> +index 415764e..4ac046f 100644
>> +--- a/tests/tst_idna.c
>> ++++ b/tests/tst_idna.c
>> +@@ -220,13 +220,14 @@ doit (void)
>> +   char label[100];
>> +   uint32_t *ucs4label =3D NULL;
>> +   uint32_t tmp[100];
>> +-  size_t len, len2, i;
>> ++  size_t len, len2;
>> +   int rc;
>> ++  unsigned i;
>> +
>> +   for (i =3D 0; i < sizeof (idna) / sizeof (idna[0]); i++)
>>       {
>> --      error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be
>> specified"));
>> -+      error (0, 0, "%s", _("only one of -s, -e, -d, -a, -u or -n can b=
e
>> specified"));
>> -       usage (EXIT_FAILURE);
>> -     }
>> +       if (debug)
>> +-    printf ("IDNA entry %ld: %s\n", i, idna[i].name);
>> ++    printf ("IDNA entry %u: %s\n", i, idna[i].name);
>>
>> -@@ -185,7 +185,7 @@ main (int argc, char *argv[])
>> -   if (!args_info.quiet_given
>> -       && args_info.inputs_num =3D=3D 0
>> -       && isatty (fileno (stdin)))
>> --    fprintf (stderr, _("Type each input string on a line by itself, "
>> -+    fprintf (stderr, "%s", _("Type each input string on a line by
>> itself, "
>> -                    "terminated by a newline character.\n"));
>> -
>> -   do
>> -@@ -197,7 +197,7 @@ main (int argc, char *argv[])
>> -       if (feof (stdin))
>> -         break;
>> +       if (debug)
>> +     {
>> +@@ -237,7 +238,7 @@ doit (void)
>> +       rc =3D idna_to_ascii_4i (idna[i].in, idna[i].inlen, label,
>> idna[i].flags);
>> +       if (rc !=3D idna[i].toasciirc)
>> +     {
>> +-      fail ("IDNA entry %ld failed: %d\n", i, rc);
>> ++      fail ("IDNA entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -256,7 +257,7 @@ doit (void)
>> +       if (strlen (idna[i].out) !=3D strlen (label) ||
>> +           strcasecmp (idna[i].out, label) !=3D 0)
>> +         {
>> +-          fail ("IDNA entry %ld failed\n", i);
>> ++          fail ("IDNA entry %u failed\n", i);
>> +           if (debug)
>> +             printf ("ERROR\n");
>> +         }
>> +@@ -273,8 +274,8 @@ doit (void)
>>
>> --      error (EXIT_FAILURE, errno, _("input error"));
>> -+      error (EXIT_FAILURE, errno, "%s", _("input error"));
>> +       if (debug)
>> +     {
>> +-      printf ("in: %s (%ld=3D=3D%ld)\n", idna[i].out, strlen
>> (idna[i].out),
>> +-              len);
>> ++      printf ("in: %s (%d=3D=3D%d)\n", idna[i].out, (int) strlen
>> (idna[i].out),
>> ++              (int) len);
>> +       ucs4print (ucs4label, len);
>>       }
>>
>> -       if (strlen (line) > 0)
>> -@@ -215,7 +215,7 @@ main (int argc, char *argv[])
>> -       if (!q)
>> +@@ -282,20 +283,20 @@ doit (void)
>> +       rc =3D idna_to_unicode_44i (ucs4label, len, tmp, &len2,
>> idna[i].flags);
>> +       if (debug)
>> +     {
>> +-      printf ("expected out (%ld):\n",
>> ++      printf ("expected out (%lu):\n",
>> +               rc =3D=3D IDNA_SUCCESS ? idna[i].inlen : len);
>> +       if (rc =3D=3D IDNA_SUCCESS)
>> +         ucs4print (idna[i].in, idna[i].inlen);
>> +       else
>> +         ucs4print (ucs4label, len);
>> +
>> +-      printf ("computed out (%ld):\n", len2);
>> ++      printf ("computed out (%d):\n", (int) len2);
>> +       ucs4print (tmp, len2);
>> +     }
>> +
>> +       if (rc !=3D idna[i].tounicoderc)
>> +     {
>> +-      fail ("IDNA entry %ld failed: %d\n", i, rc);
>> ++      fail ("IDNA entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -309,11 +310,11 @@ doit (void)
>> +       if (debug)
>>           {
>> -           free (p);
>> --          error (EXIT_FAILURE, 0,
>> -+          error (EXIT_FAILURE, 0, "%s",
>> -                  _("could not convert from UTF-8 to UCS-4"));
>> +           if (rc =3D=3D IDNA_SUCCESS)
>> +-            printf ("len=3D%ld len2=3D%ld\n", len2, idna[i].inlen);
>> ++            printf ("len=3D%d len2=3D%d\n", (int) len2, (int)
>> idna[i].inlen);
>> +           else
>> +-            printf ("len=3D%ld len2=3D%ld\n", len, len2);
>> ++            printf ("len=3D%d len2=3D%d\n", (int) len, (int) len2);
>>           }
>> +-      fail ("IDNA entry %ld failed\n", i);
>> ++      fail ("IDNA entry %u failed\n", i);
>> +       if (debug)
>> +         printf ("ERROR\n");
>> +     }
>> +diff --git a/tests/tst_idna2.c b/tests/tst_idna2.c
>> +index 65b3a4d..38932ca 100644
>> +--- a/tests/tst_idna2.c
>> ++++ b/tests/tst_idna2.c
>> +@@ -461,14 +461,14 @@ static const struct idna idna[] =3D {
>> + void
>> + doit (void)
>> + {
>> +-  size_t i;
>> ++  unsigned i;
>> +   char *out;
>> +   int rc;
>> +
>> +   for (i =3D 0; i < sizeof (idna) / sizeof (idna[0]); i++)
>> +     {
>> +       if (debug)
>> +-    printf ("IDNA2 entry %ld\n", i);
>> ++    printf ("IDNA2 entry %u\n", i);
>> +
>> +       if (debug)
>> +     {
>> +@@ -487,7 +487,7 @@ doit (void)
>> +                          IDNA_USE_STD3_ASCII_RULES);
>> +       if (rc !=3D IDNA_SUCCESS && strlen (idna[i].out) > 0)
>> +     {
>> +-      fail ("IDNA2 entry %ld failed: %d\n", i, rc);
>> ++      fail ("IDNA2 entry %u failed: %d\n", i, rc);
>> +       continue;
>> +     }
>>
>> -@@ -240,7 +240,7 @@ main (int argc, char *argv[])
>> -       if (!q)
>> +@@ -504,7 +504,7 @@ doit (void)
>> +       if (strlen (idna[i].out) !=3D strlen (out) ||
>> +           strcasecmp (idna[i].out, out) !=3D 0)
>>           {
>> -           free (r);
>> --          error (EXIT_FAILURE, 0,
>> -+          error (EXIT_FAILURE, 0, "%s",
>> -                  _("could not convert from UTF-8 to UCS-4"));
>> +-          fail ("IDNA2 entry %ld failed\n", i);
>> ++          fail ("IDNA2 entry %u failed\n", i);
>> +           if (debug)
>> +             printf ("ERROR\n");
>>           }
>> +diff --git a/tests/tst_idna3.c b/tests/tst_idna3.c
>> +index a189378..f65628c 100644
>> +--- a/tests/tst_idna3.c
>> ++++ b/tests/tst_idna3.c
>> +@@ -59,13 +59,13 @@ doit (void)
>> + {
>> +   int rc;
>> +   char *out =3D NULL;
>> +-  size_t i;
>> ++  unsigned i;
>> +
>> +   for (i =3D 0; i < sizeof (idna) / sizeof (idna[0]); i++)
>> +     {
>> +       rc =3D idna_to_unicode_8z8z (idna[i].in, &out, 0);
>> +       if (rc !=3D IDNA_SUCCESS)
>> +-    fail ("IDNA3[%ld] failed %d\n", i, rc);
>> ++    fail ("IDNA3[%u] failed %d\n", i, rc);
>>
>> -@@ -277,7 +277,7 @@ main (int argc, char *argv[])
>> -       q =3D stringprep_utf8_to_ucs4 (p, -1, &len);
>> -       free (p);
>> -       if (!q)
>> --        error (EXIT_FAILURE, 0,
>> -+        error (EXIT_FAILURE, 0, "%s",
>> -                _("could not convert from UTF-8 to UCS-4"));
>> -
>> -       if (args_info.debug_given)
>> -@@ -336,7 +336,7 @@ main (int argc, char *argv[])
>> -       r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
>> -       free (q);
>> -       if (!r)
>> --        error (EXIT_FAILURE, 0,
>> -+        error (EXIT_FAILURE, 0, "%s",
>> -                _("could not convert from UCS-4 to UTF-8"));
>> -
>> -       p =3D stringprep_utf8_to_locale (r);
>> -@@ -360,7 +360,7 @@ main (int argc, char *argv[])
>> -       q =3D stringprep_utf8_to_ucs4 (p, -1, NULL);
>> -       free (p);
>> -       if (!q)
>> --        error (EXIT_FAILURE, 0,
>> -+        error (EXIT_FAILURE, 0, "%s",
>> -                _("could not convert from UCS-4 to UTF-8"));
>> -
>> -       if (args_info.debug_given)
>> -@@ -438,7 +438,7 @@ main (int argc, char *argv[])
>> -       if (!q)
>> +       if (debug && rc =3D=3D IDNA_SUCCESS)
>> +     {
>> +@@ -75,9 +75,9 @@ doit (void)
>> +     }
>> +
>> +       if (strcmp (out, idna[i].out) !=3D 0)
>> +-    fail ("IDNA3[%ld] failed\n", i);
>> ++    fail ("IDNA3[%u] failed\n", i);
>> +       else if (debug)
>> +-    printf ("IDNA3[%ld] success\n", i);
>> ++    printf ("IDNA3[%u] success\n", i);
>> +
>> +       if (out)
>> +     idn_free (out);
>> +diff --git a/tests/tst_nfkc.c b/tests/tst_nfkc.c
>> +index d150fec..f5af9c6 100644
>> +--- a/tests/tst_nfkc.c
>> ++++ b/tests/tst_nfkc.c
>> +@@ -68,18 +68,18 @@ void
>> + doit (void)
>> + {
>> +   char *out;
>> +-  size_t i;
>> ++  unsigned i;
>> +
>> +   for (i =3D 0; i < sizeof (nfkc) / sizeof (nfkc[0]); i++)
>> +     {
>> +       if (debug)
>> +-    printf ("NFKC entry %ld\n", i);
>> ++    printf ("NFKC entry %u\n", i);
>> +
>> +       out =3D stringprep_utf8_nfkc_normalize (nfkc[i].in,
>> +                                         (ssize_t) strlen
>> (nfkc[i].in));
>> +       if (out =3D=3D NULL)
>> +     {
>> +-      fail ("NFKC entry %ld failed fatally\n", i);
>> ++      fail ("NFKC entry %u failed fatally\n", i);
>> +       continue;
>> +     }
>> +
>> +@@ -114,7 +114,7 @@ doit (void)
>> +       if (strlen (nfkc[i].out) !=3D strlen (out) ||
>> +       memcmp (nfkc[i].out, out, strlen (out)) !=3D 0)
>> +     {
>> +-      fail ("NFKC entry %ld failed\n", i);
>> ++      fail ("NFKC entry %u failed\n", i);
>> +       if (debug)
>> +         printf ("ERROR\n");
>> +     }
>> +diff --git a/tests/tst_pr29.c b/tests/tst_pr29.c
>> +index 3dc5466..11d0ede 100644
>> +--- a/tests/tst_pr29.c
>> ++++ b/tests/tst_pr29.c
>> +@@ -91,7 +91,7 @@ static const struct tv tv[] =3D {
>> + void
>> + doit (void)
>> + {
>> +-  size_t i;
>> ++  unsigned i;
>> +   int rc;
>> +
>> +   for (i =3D 0; i < sizeof (tv) / sizeof (tv[0]); i++)
>> +@@ -100,7 +100,7 @@ doit (void)
>> +     {
>> +       uint32_t *p, *q;
>> +
>> +-      printf ("PR29 entry %ld: %s\n", i, tv[i].name);
>> ++      printf ("PR29 entry %u: %s\n", i, tv[i].name);
>> +
>> +       printf ("in:\n");
>> +       ucs4print (tv[i].in, tv[i].inlen);
>> +@@ -120,7 +120,7 @@ doit (void)
>> +       rc =3D pr29_4 (tv[i].in, tv[i].inlen);
>> +       if (rc !=3D tv[i].rc)
>> +     {
>> +-      fail ("PR29 entry %ld failed (expected %d): %d\n", i,
>> tv[i].rc, rc);
>> ++      fail ("PR29 entry %u failed (expected %d): %d\n", i, tv[i].rc,
>> rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -129,7 +129,7 @@ doit (void)
>> +       rc =3D pr29_4z (tv[i].in);
>> +       if (rc !=3D tv[i].rc)
>> +     {
>> +-      fail ("PR29 entry %ld failed (expected %d): %d\n", i,
>> tv[i].rc, rc);
>> ++      fail ("PR29 entry %u failed (expected %d): %d\n", i, tv[i].rc,
>> rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -142,7 +142,7 @@ doit (void)
>> +     p =3D stringprep_ucs4_to_utf8 (tv[i].in, (ssize_t) tv[i].inlen,
>> +                                  &items_read, &items_written);
>> +     if (p =3D=3D NULL)
>> +-      fail ("FAIL: stringprep_ucs4_to_utf8(tv[%ld]) =3D=3D NULL\n", i)=
;
>> ++      fail ("FAIL: stringprep_ucs4_to_utf8(tv[%u]) =3D=3D NULL\n", i);
>> +     if (debug)
>> +       hexprint (p, strlen (p));
>> +
>> +@@ -150,7 +150,7 @@ doit (void)
>> +     free (p);
>> +     if (rc !=3D tv[i].rc)
>> +       {
>> +-        fail ("PR29 entry %ld failed (expected %d): %d\n",
>> ++        fail ("PR29 entry %u failed (expected %d): %d\n",
>> +               i, tv[i].rc, rc);
>> +         if (debug)
>> +           printf ("FATAL\n");
>> +diff --git a/tests/tst_punycode.c b/tests/tst_punycode.c
>> +index 493b8a2..997744a 100644
>> +--- a/tests/tst_punycode.c
>> ++++ b/tests/tst_punycode.c
>> +@@ -173,7 +173,8 @@ doit (void)
>> +   char *p;
>> +   uint32_t *q;
>> +   int rc;
>> +-  size_t i, outlen;
>> ++  size_t outlen;
>> ++  unsigned i;
>> +
>> +   p =3D malloc (sizeof (*p) * BUFSIZ);
>> +   if (p =3D=3D NULL)
>> +@@ -186,7 +187,7 @@ doit (void)
>> +   for (i =3D 0; i < sizeof (punycode) / sizeof (punycode[0]); i++)
>> +     {
>> +       if (debug)
>> +-    printf ("PUNYCODE entry %ld: %s\n", i, punycode[i].name);
>> ++    printf ("PUNYCODE entry %u: %s\n", i, punycode[i].name);
>> +
>> +       if (debug)
>> +     {
>> +@@ -199,7 +200,7 @@ doit (void)
>> +                         NULL, &outlen, p);
>> +       if (rc !=3D punycode[i].rc)
>> +     {
>> +-      fail ("punycode_encode() entry %ld failed: %d\n", i, rc);
>> ++      fail ("punycode_encode() entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -221,7 +222,7 @@ doit (void)
>> +       if (strlen (punycode[i].out) !=3D strlen (p) ||
>> +           memcmp (punycode[i].out, p, strlen (p)) !=3D 0)
>> +         {
>> +-          fail ("punycode() entry %ld failed\n", i);
>> ++          fail ("punycode() entry %u failed\n", i);
>> +           if (debug)
>> +             printf ("ERROR\n");
>> +         }
>> +@@ -241,7 +242,7 @@ doit (void)
>> +                         &outlen, q, NULL);
>> +       if (rc !=3D punycode[i].rc)
>> +     {
>> +-      fail ("punycode() entry %ld failed: %d\n", i, rc);
>> ++      fail ("punycode() entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -262,7 +263,7 @@ doit (void)
>> +       if (punycode[i].inlen !=3D outlen ||
>> +           memcmp (punycode[i].in, q, outlen) !=3D 0)
>>           {
>> -           free (p);
>> --          error (EXIT_FAILURE, 0,
>> -+          error (EXIT_FAILURE, 0, "%s",
>> -                  _("could not convert from UCS-4 to UTF-8"));
>> +-          fail ("punycode_decode() entry %ld failed\n", i);
>> ++          fail ("punycode_decode() entry %u failed\n", i);
>> +           if (debug)
>> +             printf ("ERROR\n");
>>           }
>> +diff --git a/tests/tst_strerror.c b/tests/tst_strerror.c
>> +index 71fff59..730f5e4 100644
>> +--- a/tests/tst_strerror.c
>> ++++ b/tests/tst_strerror.c
>> +@@ -110,7 +110,7 @@ doit (void)
>> +   /* Iterate through all error codes. */
>> +
>> +   {
>> +-    size_t i;
>> ++    unsigned i;
>> +     const char *last_p =3D NULL;
>> +
>> +     for (i =3D 0;; i++)
>> +@@ -126,13 +126,13 @@ doit (void)
>> +         break;
>> +       }
>> +     if (debug)
>> +-      printf ("idna %ld: %s\n", i, p);
>> ++      printf ("idna %u: %s\n", i, p);
>> +     last_p =3D p;
>> +       }
>> +   }
>> +
>> +   {
>> +-    size_t i;
>> ++    unsigned i;
>> +     const char *last_p =3D NULL;
>> +
>> +     for (i =3D 0;; i++)
>> +@@ -141,13 +141,13 @@ doit (void)
>> +     if (p =3D=3D last_p)
>> +       break;
>> +     if (debug)
>> +-      printf ("pr29 %ld: %s\n", i, p);
>> ++      printf ("pr29 %u: %s\n", i, p);
>> +     last_p =3D p;
>> +       }
>> +   }
>> +
>> +   {
>> +-    size_t i;
>> ++    unsigned i;
>> +     const char *last_p =3D NULL;
>> +
>> +     for (i =3D 0;; i++)
>> +@@ -156,13 +156,13 @@ doit (void)
>> +     if (p =3D=3D last_p)
>> +       break;
>> +     if (debug)
>> +-      printf ("punycode %ld: %s\n", i, p);
>> ++      printf ("punycode %u: %s\n", i, p);
>> +     last_p =3D p;
>> +       }
>> +   }
>>
>> -@@ -494,7 +494,7 @@ main (int argc, char *argv[])
>> -       r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
>> -       free (q);
>> -       if (!r)
>> --        error (EXIT_FAILURE, 0,
>> -+        error (EXIT_FAILURE, 0, "%s",
>> -                _("could not convert from UTF-8 to UCS-4"));
>> -
>> -       p =3D stringprep_utf8_to_locale (r);
>> -@@ -523,7 +523,7 @@ main (int argc, char *argv[])
>> -           if (!q)
>> -             {
>> -               free (p);
>> --              error (EXIT_FAILURE, 0,
>> -+              error (EXIT_FAILURE, 0, "%s",
>> -                      _("could not convert from UTF-8 to UCS-4"));
>> -             }
>> -
>> -@@ -537,7 +537,8 @@ main (int argc, char *argv[])
>> -       r =3D stringprep_utf8_nfkc_normalize (p, -1);
>> -       free (p);
>> -       if (!r)
>> --        error (EXIT_FAILURE, 0, _("could not do NFKC
>> normalization"));
>> -+        error (EXIT_FAILURE, 0, "%s",
>> -+               _("could not do NFKC normalization"));
>> -
>> -       if (args_info.debug_given)
>> +   {
>> +-    size_t i;
>> ++    unsigned i;
>> +     const char *last_p =3D NULL;
>> +
>> +     for (i =3D 0;; i++)
>> +@@ -183,13 +183,13 @@ doit (void)
>> +         break;
>> +       }
>> +     if (debug)
>> +-      printf ("stringprep %ld: %s\n", i, p);
>> ++      printf ("stringprep %u: %s\n", i, p);
>> +     last_p =3D p;
>> +       }
>> +   }
>> +
>> +   {
>> +-    size_t i;
>> ++    unsigned i;
>> +     const char *last_p =3D NULL;
>> +
>> +     for (i =3D 0;; i++)
>> +@@ -198,7 +198,7 @@ doit (void)
>> +     if (p =3D=3D last_p)
>> +       break;
>> +     if (debug)
>> +-      printf ("tld %ld: %s\n", i, p);
>> ++      printf ("tld %u: %s\n", i, p);
>> +     last_p =3D p;
>> +       }
>> +   }
>> +diff --git a/tests/tst_stringprep.c b/tests/tst_stringprep.c
>> +index 149ce6f..7c9ab06 100644
>> +--- a/tests/tst_stringprep.c
>> ++++ b/tests/tst_stringprep.c
>> +@@ -205,7 +205,7 @@ doit (void)
>> + {
>> +   char *p;
>> +   int rc;
>> +-  size_t i;
>> ++  unsigned i;
>> +
>> +   if (!stringprep_check_version (STRINGPREP_VERSION))
>> +     fail ("stringprep_check_version failed (header %s runtime %s)\n",
>> +@@ -224,7 +224,7 @@ doit (void)
>> +   for (i =3D 0; i < sizeof (strprep) / sizeof (strprep[0]); i++)
>> +     {
>> +       if (debug)
>> +-    printf ("STRINGPREP entry %ld\n", i);
>> ++    printf ("STRINGPREP entry %u\n", i);
>> +
>> +       if (debug)
>> +     {
>> +@@ -247,12 +247,12 @@ doit (void)
>> +       continue;
>> +     else if (l =3D=3D NULL)
>> +       {
>> +-        fail ("bad UTF-8 in entry %ld\n", i);
>> ++        fail ("bad UTF-8 in entry %u\n", i);
>> +         continue;
>> +       }
>> +     else if (strcmp (strprep[i].in, x) !=3D 0)
>> +       {
>> +-        fail ("bad UTF-8 in entry %ld\n", i);
>> ++        fail ("bad UTF-8 in entry %u\n", i);
>> +         if (debug)
>> +           {
>> +             puts ("expected:");
>> +@@ -274,7 +274,7 @@ doit (void)
>> +                            "Nameprep", strprep[i].flags);
>> +       if (rc !=3D strprep[i].rc)
>> +     {
>> +-      fail ("stringprep() entry %ld failed: %d\n", i, rc);
>> ++      fail ("stringprep() entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       if (rc =3D=3D STRINGPREP_OK)
>> +@@ -302,7 +302,7 @@ doit (void)
>> +       if (strlen (strprep[i].out) !=3D strlen (p) ||
>> +           memcmp (strprep[i].out, p, strlen (p)) !=3D 0)
>>           {
>> -@@ -547,7 +548,7 @@ main (int argc, char *argv[])
>> -           if (!q)
>> -             {
>> -               free (r);
>> --              error (EXIT_FAILURE, 0,
>> -+              error (EXIT_FAILURE, 0, "%s",
>> -                      _("could not convert from UTF-8 to UCS-4"));
>> -             }
>> +-          fail ("stringprep() entry %ld failed\n", i);
>> ++          fail ("stringprep() entry %ld failed\n", (long) i);
>> +           if (debug)
>> +             printf ("ERROR\n");
>> +         }
>> +diff --git a/tests/tst_tld.c b/tests/tst_tld.c
>> +index 2f8e12e..d038c79 100644
>> +--- a/tests/tst_tld.c
>> ++++ b/tests/tst_tld.c
>> +@@ -80,7 +80,7 @@ const Tld_table * my_tld_tables[] =3D
>> + void
>> + doit (void)
>> + {
>> +-  size_t i;
>> ++  unsigned i;
>> +   const Tld_table *tldtable;
>> +   char *out;
>> +   size_t errpos;
>> +@@ -206,7 +206,7 @@ doit (void)
>> +   for (i =3D 0; i < sizeof (tld) / sizeof (tld[0]); i++)
>> +     {
>> +       if (debug)
>> +-    printf ("TLD entry %ld: %s\n", i, tld[i].name);
>> ++    printf ("TLD entry %u: %s\n", i, tld[i].name);
>> +
>> +       if (debug)
>> +     {
>> +@@ -217,7 +217,7 @@ doit (void)
>> +       tldtable =3D tld_default_table (tld[i].tld, NULL);
>> +       if (tldtable =3D=3D NULL)
>> +     {
>> +-      fail ("TLD entry %ld tld_get_table (%s)\n", i, tld[i].tld);
>> ++      fail ("TLD entry %u tld_get_table (%s)\n", i, tld[i].tld);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -226,7 +226,7 @@ doit (void)
>> +       rc =3D tld_check_4t (tld[i].in, tld[i].inlen, &errpos, tldtable)=
;
>> +       if (rc !=3D tld[i].rc)
>> +     {
>> +-      fail ("TLD entry %ld failed: %d\n", i, rc);
>> ++      fail ("TLD entry %u failed: %d\n", i, rc);
>> +       if (debug)
>> +         printf ("FATAL\n");
>> +       continue;
>> +@@ -237,7 +237,7 @@ doit (void)
>>
>> +       if (rc !=3D tld[i].rc)
>> +     {
>> +-      fail ("TLD entry %ld failed\n", i);
>> ++      fail ("TLD entry %u failed\n", i);
>> +       if (debug)
>> +         printf ("ERROR\n");
>> +     }
>> +@@ -245,12 +245,12 @@ doit (void)
>> +     {
>> +       if (debug)
>> +         printf ("returned errpos %ld expected errpos %ld\n",
>> +-                errpos, tld[i].errpos);
>> ++                (long) errpos, (long) tld[i].errpos);
>> +
>> +       if (tld[i].errpos !=3D errpos)
>> +         {
>> +-          fail ("TLD entry %ld failed because errpos %ld !=3D %ld\n",
>> i,
>> +-                tld[i].errpos, errpos);
>> ++          fail ("TLD entry %u failed because errpos %ld !=3D %ld\n",
>> i,
>> ++                (long) tld[i].errpos, (long) errpos);
>> +           if (debug)
>> +             printf ("ERROR\n");
>> +         }
>> +@@ -262,12 +262,12 @@ doit (void)
>> +     rc =3D tld_check_8z (tld[i].example, &errpos, NULL);
>> +     if (rc !=3D tld[i].rc)
>> +       {
>> +-        fail ("TLD entry %ld failed\n", i);
>> ++        fail ("TLD entry %u failed\n", i);
>> +         if (debug)
>> +           printf ("ERROR\n");
>> +       }
>> +     if (debug)
>> +-      printf ("TLD entry %ld tld_check_8z (%s)\n", i,
>> tld[i].example);
>> ++      printf ("TLD entry %u tld_check_8z (%s)\n", i,
>> tld[i].example);
>> +       }
>> +     }
>> + }
>> +diff --git a/tests/utils.c b/tests/utils.c
>> +index 717ee01..5577dc3 100644
>> +--- a/tests/utils.c
>> ++++ b/tests/utils.c
>> +@@ -49,7 +49,7 @@ escapeprint (const char *str, size_t len)
>> + {
>> +   size_t i;
>> +
>> +-  printf (" (length %ld bytes):\n\t", len);
>> ++  printf (" (length %ld bytes):\n\t", (long) len);
>> +   for (i =3D 0; i < len; i++)
>> +     {
>> +       if (((str[i] & 0xFF) >=3D 'A' && (str[i] & 0xFF) <=3D 'Z') ||
>> +@@ -58,7 +58,7 @@ escapeprint (const char *str, size_t len)
>> +       || (str[i] & 0xFF) =3D=3D ' ' || (str[i] & 0xFF) =3D=3D '.')
>> +     printf ("%c", (str[i] & 0xFF));
>> +       else
>> +-    printf ("\\x%02X", (str[i] & 0xFF));
>> ++    printf ("\\x%02X", (unsigned) (str[i] & 0xFF));
>> +       if ((i + 1) % 16 =3D=3D 0 && (i + 1) < len)
>> +     printf ("'\n\t'");
>> +     }
>> +@@ -73,7 +73,7 @@ hexprint (const char *str, size_t len)
>> +   printf ("\t;; ");
>> +   for (i =3D 0; i < len; i++)
>> +     {
>> +-      printf ("%02x ", (str[i] & 0xFF));
>> ++      printf ("%02x ", (unsigned) (str[i] & 0xFF));
>> +       if ((i + 1) % 8 =3D=3D 0)
>> +     printf (" ");
>> +       if ((i + 1) % 16 =3D=3D 0 && i + 1 < len)
>>  --
>> -2.8.1
>> +1.9.1
>>
>> diff --git a/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patc=
h
>> b/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch
>> new file mode 100644
>> index 00000000000..546a6eaafcf
>> --- /dev/null
>> +++ b/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch
>> @@ -0,0 +1,334 @@
>> +From 230930b3bc3e431b819eb45420cb42475d83ca93 Mon Sep 17 00:00:00 2001
>> +From: =3D?utf8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
>> +Date: Wed, 1 Feb 2017 10:44:36 +0100
>> +Subject: [PATCH] Update intprops.h for gcc-7 compatibility
>> +
>> +---
>> +Upstream-Status: Backport
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> + gl/intprops.h          | 65 ++++++++++++++++++++++++++++++------------
>> --------
>> + lib/gltests/intprops.h | 65 ++++++++++++++++++++++++++++++------------
>> --------
>> + 2 files changed, 78 insertions(+), 52 deletions(-)
>> +
>> +diff --git a/gl/intprops.h b/gl/intprops.h
>> +index e1fce5c..eb06b69 100644
>> +--- a/gl/intprops.h
>> ++++ b/gl/intprops.h
>> +@@ -1,18 +1,18 @@
>> + /* intprops.h -- properties of integer types
>> +
>> +-   Copyright (C) 2001-2016 Free Software Foundation, Inc.
>> ++   Copyright (C) 2001-2017 Free Software Foundation, Inc.
>> +
>> +    This program is free software: you can redistribute it and/or modif=
y
>> it
>> +-   under the terms of the GNU General Public License as published
>> +-   by the Free Software Foundation; either version 3 of the License, o=
r
>> ++   under the terms of the GNU Lesser General Public License as publish=
ed
>> ++   by the Free Software Foundation; either version 2.1 of the License,
>> or
>> +    (at your option) any later version.
>> +
>> +    This program is distributed in the hope that it will be useful,
>> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +-   GNU General Public License for more details.
>> ++   GNU Lesser General Public License for more details.
>> +
>> +-   You should have received a copy of the GNU General Public License
>> ++   You should have received a copy of the GNU Lesser General Public
>> License
>> +    along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
>>   */
>> +
>> + /* Written by Paul Eggert.  */
>> +@@ -47,12 +47,16 @@
>> +
>> + /* Minimum and maximum values for integer types and expressions.  */
>> +
>> ++/* The width in bits of the integer type or expression T.
>> ++   Padding bits are not supported; this is checked at compile-time
>> below.  */
>> ++#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
>> ++
>> + /* The maximum and minimum values for the integer type T.  */
>> + #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
>> + #define
>> TYPE_MAXIMUM(t)                                                 \
>> +   ((t) (! TYPE_SIGNED
>> (t)                                               \
>> +         ? (t)
>> -1                                                        \
>> +-        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
>> ++        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
>> +
>> + /* The maximum and minimum values for the type of the expression E,
>> +    after integer promotion.  E should not have side effects.  */
>> +@@ -65,7 +69,13 @@
>> +    ? _GL_SIGNED_INT_MAXIMUM
>> (e)                                         \
>> +    : _GL_INT_NEGATE_CONVERT (e, 1))
>> + #define
>> _GL_SIGNED_INT_MAXIMUM(e)                                       \
>> +-  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1)=
 *
>> 2 + 1)
>> ++  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + =
1)
>> ++
>> ++/* Work around OpenVMS incompatibility with C99.  */
>> ++#if !defined LLONG_MAX && defined __INT64_MAX
>> ++# define LLONG_MAX __INT64_MAX
>> ++# define LLONG_MIN __INT64_MIN
>> ++#endif
>> +
>> + /* This include file assumes that signed types are two's complement
>> without
>> +    padding bits; the above macros have undefined behavior otherwise.
>> +@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) =3D=3D LONG_MAX);
>> + verify (TYPE_MINIMUM (long long int) =3D=3D LLONG_MIN);
>> + verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_MAX);
>> + #endif
>> ++/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if
>> defined.  */
>> ++#ifdef UINT_WIDTH
>> ++verify (TYPE_WIDTH (unsigned int) =3D=3D UINT_WIDTH);
>> ++#endif
>> +
>> + /* Does the __typeof__ keyword work?  This could be done by
>> +    'configure', but for now it's easier to do it by hand.  */
>> +-#if (2 <=3D __GNUC__ || defined __IBM__TYPEOF__ \
>> ++#if (2 <=3D __GNUC__ \
>> ++     || (1210 <=3D __IBMC__ && defined __IBM__TYPEOF__) \
>> +      || (0x5110 <=3D __SUNPRO_C && !__STDC__))
>> + # define _GL_HAVE___TYPEOF__ 1
>> + #else
>> +@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +    signed, this macro may overestimate the true bound by one byte when
>> +    applied to unsigned types of size 2, 4, 16, ... bytes.  */
>> + #define INT_STRLEN_BOUND(t)                                     \
>> +-  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
>> +-                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
>> ++  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)=
)
>> \
>> +    + _GL_SIGNED_TYPE_OR_EXPR (t))
>> +
>> + /* Bound on buffer size needed to represent an integer type or
>> expression T,
>> +@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG=
_MAX);
>> +    ? (a) < (min) >> (b)                                 \
>> +    : (max) >> (b) < (a))
>> +
>> +-/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
>> +-#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <=3D __GNUC__)
>> ++/* True if __builtin_add_overflow (A, B, P) works when P is non-
>> null.  */
>> ++#define _GL_HAS_BUILTIN_OVERFLOW (5 <=3D __GNUC__)
>> ++
>> ++/* True if __builtin_add_overflow_p (A, B, C) works.  */
>> ++#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <=3D __GNUC__)
>> +
>> + /* The _GL*_OVERFLOW macros have the same restrictions as the
>> +    *_RANGE_OVERFLOW macros, except that they do not assume that operan=
ds
>> +    (e.g., A and B) have the same type as MIN and MAX.  Instead, they
>> assume
>> +    that the result (e.g., A + B) has that type.  */
>> +-#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
>> +-# define _GL_ADD_OVERFLOW(a, b, min, max)
>> +-   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
>> +-# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
>> +-   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
>> +-# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
>> +-   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
>> ++#if _GL_HAS_BUILTIN_OVERFLOW_P
>> ++# define _GL_ADD_OVERFLOW(a, b, min,
>> max)                               \
>> ++   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
>> ++# define _GL_SUBTRACT_OVERFLOW(a, b, min,
>> max)                          \
>> ++   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
>> ++# define _GL_MULTIPLY_OVERFLOW(a, b, min,
>> max)                          \
>> ++   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
>> + #else
>> + # define _GL_ADD_OVERFLOW(a, b, min,
>> max)                                \
>> +    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min,
>> max)                  \
>> +@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
>> + #define INT_SUBTRACT_OVERFLOW(a, b) \
>> +   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
>> +-#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
>> ++#if _GL_HAS_BUILTIN_OVERFLOW_P
>> + # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
>> + #else
>> + # define INT_NEGATE_OVERFLOW(a) \
>> +@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_=
MAX);
>> + #define INT_MULTIPLY_WRAPV(a, b, r) \
>> +   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow,
>> INT_MULTIPLY_OVERFLOW)
>> +
>> +-#ifndef __has_builtin
>> +-# define __has_builtin(x) 0
>> +-#endif
>> +-
>> + /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See=
:
>> +    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D68193
>> +    https://llvm.org/bugs/show_bug.cgi?id=3D25390
>> +@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
>> +    overflow predicate.  Return 1 if the result overflows.  See above
>> +    for restrictions.  */
>> +-#if 5 <=3D __GNUC__ || __has_builtin (__builtin_add_overflow)
>> ++#if _GL_HAS_BUILTIN_OVERFLOW
>> + # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, =
b,
>> r)
>> + #elif 201112 <=3D __STDC_VERSION__ && !_GL__GENERIC_BOGUS
>> + # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
>> +@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> + # else
>> + #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
>> +     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
>> +-                     long int, LONG_MIN, LONG_MAX))
>> ++                     long int, LONG_MIN, LONG_MAX)
>> + # endif
>> + #endif
>> +
>> +diff --git a/lib/gltests/intprops.h b/lib/gltests/intprops.h
>> +index e1fce5c..eb06b69 100644
>> +--- a/lib/gltests/intprops.h
>> ++++ b/lib/gltests/intprops.h
>> +@@ -1,18 +1,18 @@
>> + /* intprops.h -- properties of integer types
>> +
>> +-   Copyright (C) 2001-2016 Free Software Foundation, Inc.
>> ++   Copyright (C) 2001-2017 Free Software Foundation, Inc.
>> +
>> +    This program is free software: you can redistribute it and/or modif=
y
>> it
>> +-   under the terms of the GNU General Public License as published
>> +-   by the Free Software Foundation; either version 3 of the License, o=
r
>> ++   under the terms of the GNU Lesser General Public License as publish=
ed
>> ++   by the Free Software Foundation; either version 2.1 of the License,
>> or
>> +    (at your option) any later version.
>> +
>> +    This program is distributed in the hope that it will be useful,
>> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +-   GNU General Public License for more details.
>> ++   GNU Lesser General Public License for more details.
>> +
>> +-   You should have received a copy of the GNU General Public License
>> ++   You should have received a copy of the GNU Lesser General Public
>> License
>> +    along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
>>   */
>> +
>> + /* Written by Paul Eggert.  */
>> +@@ -47,12 +47,16 @@
>> +
>> + /* Minimum and maximum values for integer types and expressions.  */
>> +
>> ++/* The width in bits of the integer type or expression T.
>> ++   Padding bits are not supported; this is checked at compile-time
>> below.  */
>> ++#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
>> ++
>> + /* The maximum and minimum values for the integer type T.  */
>> + #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
>> + #define
>> TYPE_MAXIMUM(t)                                                 \
>> +   ((t) (! TYPE_SIGNED
>> (t)                                               \
>> +         ? (t)
>> -1                                                        \
>> +-        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
>> ++        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
>> +
>> + /* The maximum and minimum values for the type of the expression E,
>> +    after integer promotion.  E should not have side effects.  */
>> +@@ -65,7 +69,13 @@
>> +    ? _GL_SIGNED_INT_MAXIMUM
>> (e)                                         \
>> +    : _GL_INT_NEGATE_CONVERT (e, 1))
>> + #define
>> _GL_SIGNED_INT_MAXIMUM(e)                                       \
>> +-  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1)=
 *
>> 2 + 1)
>> ++  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + =
1)
>> ++
>> ++/* Work around OpenVMS incompatibility with C99.  */
>> ++#if !defined LLONG_MAX && defined __INT64_MAX
>> ++# define LLONG_MAX __INT64_MAX
>> ++# define LLONG_MIN __INT64_MIN
>> ++#endif
>> +
>> + /* This include file assumes that signed types are two's complement
>> without
>> +    padding bits; the above macros have undefined behavior otherwise.
>> +@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) =3D=3D LONG_MAX);
>> + verify (TYPE_MINIMUM (long long int) =3D=3D LLONG_MIN);
>> + verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_MAX);
>> + #endif
>> ++/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if
>> defined.  */
>> ++#ifdef UINT_WIDTH
>> ++verify (TYPE_WIDTH (unsigned int) =3D=3D UINT_WIDTH);
>> ++#endif
>> +
>> + /* Does the __typeof__ keyword work?  This could be done by
>> +    'configure', but for now it's easier to do it by hand.  */
>> +-#if (2 <=3D __GNUC__ || defined __IBM__TYPEOF__ \
>> ++#if (2 <=3D __GNUC__ \
>> ++     || (1210 <=3D __IBMC__ && defined __IBM__TYPEOF__) \
>> +      || (0x5110 <=3D __SUNPRO_C && !__STDC__))
>> + # define _GL_HAVE___TYPEOF__ 1
>> + #else
>> +@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +    signed, this macro may overestimate the true bound by one byte when
>> +    applied to unsigned types of size 2, 4, 16, ... bytes.  */
>> + #define INT_STRLEN_BOUND(t)                                     \
>> +-  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
>> +-                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
>> ++  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)=
)
>> \
>> +    + _GL_SIGNED_TYPE_OR_EXPR (t))
>> +
>> + /* Bound on buffer size needed to represent an integer type or
>> expression T,
>> +@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG=
_MAX);
>> +    ? (a) < (min) >> (b)                                 \
>> +    : (max) >> (b) < (a))
>> +
>> +-/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
>> +-#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <=3D __GNUC__)
>> ++/* True if __builtin_add_overflow (A, B, P) works when P is non-
>> null.  */
>> ++#define _GL_HAS_BUILTIN_OVERFLOW (5 <=3D __GNUC__)
>> ++
>> ++/* True if __builtin_add_overflow_p (A, B, C) works.  */
>> ++#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <=3D __GNUC__)
>> +
>> + /* The _GL*_OVERFLOW macros have the same restrictions as the
>> +    *_RANGE_OVERFLOW macros, except that they do not assume that operan=
ds
>> +    (e.g., A and B) have the same type as MIN and MAX.  Instead, they
>> assume
>> +    that the result (e.g., A + B) has that type.  */
>> +-#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
>> +-# define _GL_ADD_OVERFLOW(a, b, min, max)
>> +-   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
>> +-# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
>> +-   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
>> +-# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
>> +-   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
>> ++#if _GL_HAS_BUILTIN_OVERFLOW_P
>> ++# define _GL_ADD_OVERFLOW(a, b, min,
>> max)                               \
>> ++   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
>> ++# define _GL_SUBTRACT_OVERFLOW(a, b, min,
>> max)                          \
>> ++   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
>> ++# define _GL_MULTIPLY_OVERFLOW(a, b, min,
>> max)                          \
>> ++   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
>> + #else
>> + # define _GL_ADD_OVERFLOW(a, b, min,
>> max)                                \
>> +    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min,
>> max)                  \
>> +@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
>> + #define INT_SUBTRACT_OVERFLOW(a, b) \
>> +   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
>> +-#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
>> ++#if _GL_HAS_BUILTIN_OVERFLOW_P
>> + # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
>> + #else
>> + # define INT_NEGATE_OVERFLOW(a) \
>> +@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_=
MAX);
>> + #define INT_MULTIPLY_WRAPV(a, b, r) \
>> +   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow,
>> INT_MULTIPLY_OVERFLOW)
>> +
>> +-#ifndef __has_builtin
>> +-# define __has_builtin(x) 0
>> +-#endif
>> +-
>> + /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See=
:
>> +    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D68193
>> +    https://llvm.org/bugs/show_bug.cgi?id=3D25390
>> +@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> +    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
>> +    overflow predicate.  Return 1 if the result overflows.  See above
>> +    for restrictions.  */
>> +-#if 5 <=3D __GNUC__ || __has_builtin (__builtin_add_overflow)
>> ++#if _GL_HAS_BUILTIN_OVERFLOW
>> + # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, =
b,
>> r)
>> + #elif 201112 <=3D __STDC_VERSION__ && !_GL__GENERIC_BOGUS
>> + # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
>> +@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) =3D=3D LLONG_M=
AX);
>> + # else
>> + #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
>> +     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
>> +-                     long int, LONG_MIN, LONG_MAX))
>> ++                     long int, LONG_MIN, LONG_MAX)
>> + # endif
>> + #endif
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-extended/libidn/libidn_1.33.bb b/meta/recipes-
>> extended/libidn/libidn_1.33.bb
>> index d3d0f557bba..109cc7f3f55 100644
>> --- a/meta/recipes-extended/libidn/libidn_1.33.bb
>> +++ b/meta/recipes-extended/libidn/libidn_1.33.bb
>> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz =
\
>>             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.1=
2.
>> patch \
>>             file://dont-depend-on-help2man.patch \
>>             file://0001-idn-fix-printf-format-security-warnings.patch \
>> +           file://gcc7-compatibility.patch \
>>  "
>>
>>  SRC_URI[md5sum] =3D "a9aa7e003665de9c82bd3f9fc6ccf308"
>> --
>> 2.12.2
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

