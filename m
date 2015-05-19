Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB0960138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 02:50:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="92346967"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 May 2015 10:54:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4J2meir027743
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 10:48:40 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 19 May 2015 10:50:11 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] grep_2.5.1a: fix grep for LSB compliance.
Thread-Index: AQHQiTzWHWa/6ffzQEyd0DC7T2+Yv52Cp3yA
Date: Tue, 19 May 2015 02:50:07 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8739034B2@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1431054756-2068-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1431054756-2068-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.25]
MIME-Version: 1.0
Subject: Re: [PATCH] grep_2.5.1a: fix grep for LSB compliance.
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
X-List-Received-Date: Tue, 19 May 2015 02:50:11 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping

There are two versions of recipe grep.
One is 2.21 and the LICENSE is GPLv3.
The other is 2.5.1a and the LICENSE is GPLv2.
If you use the version 2.5.1a and this patch is need to fix LSB compliance.

Thanks.

Li xin
> -----Original Message-----
> From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Sent: Friday, May 08, 2015 11:13 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Subject: [PATCH] grep_2.5.1a: fix grep for LSB compliance.
>=20
> The LSB test requires the grep egrep and fgrep can perform pattern matchi=
ng in
> searches without regard to case if -i option is specified.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../grep/grep-2.5.1a/grep-fix-LSB-NG-Cases.patch   | 1414
> ++++++++++++++++++++
>  meta/recipes-extended/grep/grep_2.5.1a.bb          |    4 +-
>  2 files changed, 1417 insertions(+), 1 deletion(-)  create mode 100644
> meta/recipes-extended/grep/grep-2.5.1a/grep-fix-LSB-NG-Cases.patch
>=20
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-fix-LSB-NG-Cases=
.patch
> b/meta/recipes-extended/grep/grep-2.5.1a/grep-fix-LSB-NG-Cases.patch
> new file mode 100644
> index 0000000..6ed6968
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-fix-LSB-NG-Cases.patch
> @@ -0,0 +1,1414 @@
> +From baf14fa6a796753d3b74d74fa69fff0d38fea540 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Thu, 7 May 2015 18:28:46 +0900
> +Subject: [PATCH] grep: fix LSB NG Cases.
> +
> +NG Cases:
> +/tset/LI18NUX2K.L1/utils/egrep-tp/T.egrep-tp 5
> +/tset/LI18NUX2K.L1/utils/fgrep/T.fgrep 5
> +/tset/LI18NUX2K.L1/utils/grep-tp/T.grep-tp 5
> +
> +this patch is from Debian.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + doc/grep.1        |   5 +-
> + doc/grep.texi     |   2 +-
> + lib/posix/regex.h |   4 +
> + src/dfa.c         |  22 +-
> + src/grep.c        |  96 ++++---
> + src/search.c      | 833
> +++++++++++++++++++++++++++++++++++++++++++++---------
> + tests/Makefile.am |   3 +-
> + tests/Makefile.in |   3 +-
> + 8 files changed, 776 insertions(+), 192 deletions(-)
> +
> +diff --git a/doc/grep.1 b/doc/grep.1
> +index 314669a..02288ff 100644
> +--- a/doc/grep.1
> ++++ b/doc/grep.1
> +@@ -191,6 +191,7 @@ Interpret
> + .I PATTERN
> + as a list of fixed strings, separated by newlines,  any of which is to
> +be matched.
> ++.TP
> + .BR \-P ", " \-\^\-perl-regexp
> + Interpret
> + .I PATTERN
> +@@ -300,9 +301,9 @@ Show only the part of a matching line that matches
> +Displays input actually coming from standard input as input coming from
> +file  .I LABEL.
> + This is especially useful for tools like zgrep, e.g.
> +-.B "gzip -cd foo.gz |grep --label=3Dfoo something"
> ++.B "gzip -cd foo.gz |grep -H --label=3Dfoo something"
> + .TP
> +-.BR \-\^\-line-buffering
> ++.BR \-\^\-line-buffered
> + Use line buffering, it can be a performance penality.
> + .TP
> + .BR \-q ", " \-\^\-quiet ", " \-\^\-silent diff --git a/doc/grep.texi
> +b/doc/grep.texi index 0aa2f4a..d84ed8a 100644
> +--- a/doc/grep.texi
> ++++ b/doc/grep.texi
> +@@ -364,7 +364,7 @@ Set the line buffering policy, this can be a perform=
ance
> penality.
> + @cindex changing name of standard input  Displays input actually
> +coming from standard input as input coming from file  @var{LABEL}. This
> +is especially useful for tools like zgrep, e.g.
> +-@command{gzip -cd foo.gz |grep --label=3Dfoo something}
> ++@command{gzip -cd foo.gz |grep -H --label=3Dfoo something}
> +
> + @item -L
> + @itemx --files-without-match
> +diff --git a/lib/posix/regex.h b/lib/posix/regex.h index
> +63c2fef..7bb2b0e 100644
> +--- a/lib/posix/regex.h
> ++++ b/lib/posix/regex.h
> +@@ -109,6 +109,10 @@ typedef unsigned long int reg_syntax_t;
> +    If not set, \{, \}, {, and } are literals.  */  #define
> +RE_INTERVALS (RE_HAT_LISTS_NOT_NEWLINE << 1)
> +
> ++/* If this bit is set, then ignore case when matching.
> ++   If not set, then case is significant.  */ #define RE_ICASE
> ++(RE_INVALID_INTERVAL_ORD << 1)
> ++
> + /* If this bit is set, +, ? and | aren't recognized as operators.
> +    If not set, they are.  */
> + #define RE_LIMITED_OPS (RE_INTERVALS << 1) diff --git a/src/dfa.c
> +b/src/dfa.c index 590bfa7..27c876a 100644
> +--- a/src/dfa.c
> ++++ b/src/dfa.c
> +@@ -414,7 +414,7 @@ update_mb_len_index (unsigned char const *p, int
> +len)
> +
> + /* This function fetch a wide character, and update cur_mb_len,
> +    used only if the current locale is a multibyte environment.  */
> +-static wchar_t
> ++static wint_t
> + fetch_wc (char const *eoferr)
> + {
> +   wchar_t wc;
> +@@ -423,7 +423,7 @@ fetch_wc (char const *eoferr)
> +       if (eoferr !=3D 0)
> + 	dfaerror (eoferr);
> +       else
> +-	return -1;
> ++	return WEOF;
> +     }
> +
> +   cur_mb_len =3D mbrtowc(&wc, lexptr, lexleft, &mbs); @@ -459,7 +459,7
> +@@ fetch_wc (char const *eoferr)  static void  parse_bracket_exp_mb ()
> +{
> +-  wchar_t wc, wc1, wc2;
> ++  wint_t wc, wc1, wc2;
> +
> +   /* Work area to build a mb_char_classes.  */
> +   struct mb_char_classes *work_mbc;
> +@@ -496,7 +496,7 @@ parse_bracket_exp_mb ()
> +     work_mbc->invert =3D 0;
> +   do
> +     {
> +-      wc1 =3D -1; /* mark wc1 is not initialized".  */
> ++      wc1 =3D WEOF; /* mark wc1 is not initialized".  */
> +
> +       /* Note that if we're looking at some other [:...:] construct,
> + 	 we just treat it as a bunch of ordinary characters.  We can do @@
> +-586,7 +586,7 @@ parse_bracket_exp_mb ()
> + 		      work_mbc->coll_elems[work_mbc->ncoll_elems++] =3D elem;
> + 		    }
> +  		}
> +-	      wc =3D -1;
> ++	      wc1 =3D wc =3D WEOF;
> + 	    }
> + 	  else
> + 	    /* We treat '[' as a normal character here.  */ @@ -600,7 +600,7
> +@@ parse_bracket_exp_mb ()
> + 	    wc =3D fetch_wc(("Unbalanced ["));
> + 	}
> +
> +-      if (wc1 =3D=3D -1)
> ++      if (wc1 =3D=3D WEOF)
> + 	wc1 =3D fetch_wc(_("Unbalanced ["));
> +
> +       if (wc1 =3D=3D L'-')
> +@@ -630,17 +630,17 @@ parse_bracket_exp_mb ()
> + 	    }
> + 	  REALLOC_IF_NECESSARY(work_mbc->range_sts, wchar_t,
> + 			       range_sts_al, work_mbc->nranges + 1);
> +-	  work_mbc->range_sts[work_mbc->nranges] =3D wc;
> ++	  work_mbc->range_sts[work_mbc->nranges] =3D (wchar_t)wc;
> + 	  REALLOC_IF_NECESSARY(work_mbc->range_ends, wchar_t,
> + 			       range_ends_al, work_mbc->nranges + 1);
> +-	  work_mbc->range_ends[work_mbc->nranges++] =3D wc2;
> ++	  work_mbc->range_ends[work_mbc->nranges++] =3D (wchar_t)wc2;
> + 	}
> +-      else if (wc !=3D -1)
> ++      else if (wc !=3D WEOF)
> + 	/* build normal characters.  */
> + 	{
> + 	  REALLOC_IF_NECESSARY(work_mbc->chars, wchar_t, chars_al,
> + 			       work_mbc->nchars + 1);
> +-	  work_mbc->chars[work_mbc->nchars++] =3D wc;
> ++	  work_mbc->chars[work_mbc->nchars++] =3D (wchar_t)wc;
> + 	}
> +     }
> +   while ((wc =3D wc1) !=3D L']');
> +@@ -2552,6 +2552,8 @@ match_mb_charset (struct dfa *d, int s, position p=
os,
> int index)
> +     }
> +
> +   /* match with a character?  */
> ++  if (case_fold)
> ++    wc =3D towlower (wc);
> +   for (i =3D 0; i<work_mbc->nchars; i++)
> +     {
> +       if (wc =3D=3D work_mbc->chars[i])
> +diff --git a/src/grep.c b/src/grep.c
> +index 2fb2fac..3fd4b47 100644
> +--- a/src/grep.c
> ++++ b/src/grep.c
> +@@ -30,6 +30,12 @@
> + # include <sys/time.h>
> + # include <sys/resource.h>
> + #endif
> ++#if defined HAVE_WCTYPE_H && defined HAVE_WCHAR_H && defined
> ++HAVE_MBRTOWC
> ++/* We can handle multibyte string.  */ # define MBS_SUPPORT # include
> ++<wchar.h> # include <wctype.h> #endif
> + #include <stdio.h>
> + #include "system.h"
> + #include "getopt.h"
> +@@ -255,19 +261,6 @@ reset (int fd, char const *file, struct stats *stat=
s)
> +   bufbeg[-1] =3D eolbyte;
> +   bufdesc =3D fd;
> +
> +-  if (fstat (fd, &stats->stat) !=3D 0)
> +-    {
> +-      error (0, errno, "fstat");
> +-      return 0;
> +-    }
> +-  if (directories =3D=3D SKIP_DIRECTORIES && S_ISDIR (stats->stat.st_mo=
de))
> +-    return 0;
> +-#ifndef DJGPP
> +-  if (devices =3D=3D SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) ||
> +S_ISBLK(stats->stat.st_mode) || S_ISSOCK(stats->stat.st_mode))) -#else
> +-  if (devices =3D=3D SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) ||
> +S_ISBLK(stats->stat.st_mode))) -#endif
> +-    return 0;
> +   if (S_ISREG (stats->stat.st_mode))
> +     {
> +       if (file)
> +@@ -558,33 +551,6 @@ prline (char const *beg, char const *lim, int sep)
> +     {
> +       size_t match_size;
> +       size_t match_offset;
> +-      if(match_icase)
> +-        {
> +-	  /* Yuck, this is tricky */
> +-          char *buf =3D (char*) xmalloc (lim - beg);
> +-	  char *ibeg =3D buf;
> +-	  char *ilim =3D ibeg + (lim - beg);
> +-	  int i;
> +-	  for (i =3D 0; i < lim - beg; i++)
> +-	    ibeg[i] =3D tolower (beg[i]);
> +-	  while ((match_offset =3D (*execute) (ibeg, ilim-ibeg, &match_size, 1=
))
> +-		 !=3D (size_t) -1)
> +-	    {
> +-	      char const *b =3D beg + match_offset;
> +-	      if (b =3D=3D lim)
> +-		break;
> +-	      fwrite (beg, sizeof (char), match_offset, stdout);
> +-	      printf ("\33[%sm", grep_color);
> +-	      fwrite (b, sizeof (char), match_size, stdout);
> +-	      fputs ("\33[00m", stdout);
> +-	      beg =3D b + match_size;
> +-	      ibeg =3D ibeg + match_offset + match_size;
> +-	    }
> +-	  fwrite (beg, 1, lim - beg, stdout);
> +-	  free (buf);
> +-	  lastout =3D lim;
> +-	  return;
> +-	}
> +       while (lim-beg && (match_offset =3D (*execute) (beg, lim - beg,
> &match_size, 1))
> + 	     !=3D (size_t) -1)
> + 	{
> +@@ -601,6 +567,7 @@ prline (char const *beg, char const *lim, int sep)
> + 	  fputs ("\33[00m", stdout);
> + 	  beg =3D b + match_size;
> + 	}
> ++      fputs ("\33[K", stdout);
> +     }
> +   fwrite (beg, 1, lim - beg, stdout);
> +   if (ferror (stdout))
> +@@ -623,7 +590,7 @@ prpending (char const *lim)
> +       size_t match_size;
> +       --pending;
> +       if (outleft
> +-	  || (((*execute) (lastout, nl - lastout, &match_size, 0) =3D=3D (size=
_t) -1)
> ++	  || (((*execute) (lastout, nl + 1 - lastout, &match_size, 0) =3D=3D
> ++(size_t) -1)
> + 	      =3D=3D !out_invert))
> + 	prline (lastout, nl + 1, '-');
> +       else
> +@@ -895,6 +862,19 @@ grepfile (char const *file, struct stats *stats)
> +     }
> +   else
> +     {
> ++      if (stat (file, &stats->stat) !=3D 0)
> ++        {
> ++          suppressible_error (file, errno);
> ++          return 1;
> ++        }
> ++      if (directories =3D=3D SKIP_DIRECTORIES && S_ISDIR (stats->stat.s=
t_mode))
> ++        return 1;
> ++#ifndef DJGPP
> ++      if (devices =3D=3D SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) =
||
> ++S_ISBLK(stats->stat.st_mode) || S_ISSOCK(stats->stat.st_mode) ||
> S_ISFIFO(stats->stat.st_mode))) #else
> ++      if (devices =3D=3D SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) =
||
> ++S_ISBLK(stats->stat.st_mode))) #endif
> ++        return 1;
> +       while ((desc =3D open (file, O_RDONLY)) < 0 && errno =3D=3D EINTR=
)
> + 	continue;
> +
> +@@ -1681,9 +1661,6 @@ warranty; not even for MERCHANTABILITY or FITNESS
> FOR A PARTICULAR PURPOSE.\n"))
> + 	  out_invert ^=3D 1;
> + 	  match_lines =3D match_words =3D 0;
> + 	}
> +-      else
> +-	/* Strip trailing newline. */
> +-        --keycc;
> +     }
> +   else
> +     if (optind < argc)
> +@@ -1697,6 +1674,37 @@ warranty; not even for MERCHANTABILITY or FITNESS
> FOR A PARTICULAR PURPOSE.\n"))
> +   if (!install_matcher (matcher) && !install_matcher ("default"))
> +     abort ();
> +
> ++#ifdef MBS_SUPPORT
> ++  if (MB_CUR_MAX !=3D 1 && match_icase)
> ++    {
> ++      wchar_t wc;
> ++      mbstate_t cur_state, prev_state;
> ++      int i, len =3D strlen(keys);
> ++
> ++      memset(&cur_state, 0, sizeof(mbstate_t));
> ++      for (i =3D 0; i <=3D len ;)
> ++	{
> ++	  size_t mbclen;
> ++	  mbclen =3D mbrtowc(&wc, keys + i, len - i, &cur_state);
> ++	  if (mbclen =3D=3D (size_t) -1 || mbclen =3D=3D (size_t) -2 || mbclen=
 =3D=3D 0)
> ++	    {
> ++	      /* An invalid sequence, or a truncated multibyte character.
> ++		 We treat it as a singlebyte character.  */
> ++	      mbclen =3D 1;
> ++	    }
> ++	  else
> ++	    {
> ++	      if (iswupper((wint_t)wc))
> ++		{
> ++		  wc =3D towlower((wint_t)wc);
> ++		  wcrtomb(keys + i, wc, &cur_state);
> ++		}
> ++	    }
> ++	  i +=3D mbclen;
> ++	}
> ++    }
> ++#endif /* MBS_SUPPORT */
> ++
> +   (*compile)(keys, keycc);
> +
> +   if ((argc - optind > 1 && !no_filenames) || with_filenames) diff
> +--git a/src/search.c b/src/search.c index 7bd233f..3c6a485 100644
> +--- a/src/search.c
> ++++ b/src/search.c
> +@@ -18,9 +18,13 @@
> +
> + /* Written August 1992 by Mike Haertel. */
> +
> ++#ifndef _GNU_SOURCE
> ++# define _GNU_SOURCE 1
> ++#endif
> + #ifdef HAVE_CONFIG_H
> + # include <config.h>
> + #endif
> ++#include <assert.h>
> + #include <sys/types.h>
> + #if defined HAVE_WCTYPE_H && defined HAVE_WCHAR_H && defined
> +HAVE_MBRTOWC
> + /* We can handle multibyte string.  */ @@ -31,7 +35,7 @@
> +
> + #include "system.h"
> + #include "grep.h"
> +-#include "regex.h"
> ++#include <regex.h>
> + #include "dfa.h"
> + #include "kwset.h"
> + #include "error.h"
> +@@ -39,6 +43,9 @@
> + #ifdef HAVE_LIBPCRE
> + # include <pcre.h>
> + #endif
> ++#ifdef HAVE_LANGINFO_CODESET
> ++# include <langinfo.h>
> ++#endif
> +
> + #define NCHAR (UCHAR_MAX + 1)
> +
> +@@ -70,9 +77,10 @@ static kwset_t kwset;
> +    call the regexp matcher at all. */
> + static int kwset_exact_matches;
> +
> +-#if defined(MBS_SUPPORT)
> +-static char* check_multibyte_string PARAMS ((char const *buf, size_t
> +size)); -#endif
> ++/* UTF-8 encoding allows some optimizations that we can't otherwise
> ++   assume in a multibyte encoding. */
> ++static int using_utf8;
> ++
> + static void kwsinit PARAMS ((void));
> + static void kwsmusts PARAMS ((void));
> + static void Gcompile PARAMS ((char const *, size_t)); @@ -84,6 +92,15
> +@@ static void Pcompile PARAMS ((char const *, size_t ));  static
> +size_t Pexecute PARAMS ((char const *, size_t, size_t *, int));
> +
> + void
> ++check_utf8 (void)
> ++{
> ++#ifdef HAVE_LANGINFO_CODESET
> ++  if (strcmp (nl_langinfo (CODESET), "UTF-8") =3D=3D 0)
> ++    using_utf8 =3D 1;
> ++#endif
> ++}
> ++
> ++void
> + dfaerror (char const *mesg)
> + {
> +   error (2, 0, mesg);
> +@@ -141,38 +158,6 @@ kwsmusts (void)
> +     }
> + }
> +
> +-#ifdef MBS_SUPPORT
> +-/* This function allocate the array which correspond to "buf".
> +-   Then this check multibyte string and mark on the positions which
> +-   are not singlebyte character nor the first byte of a multibyte
> +-   character.  Caller must free the array.  */
> +-static char*
> +-check_multibyte_string(char const *buf, size_t size) -{
> +-  char *mb_properties =3D malloc(size);
> +-  mbstate_t cur_state;
> +-  int i;
> +-  memset(&cur_state, 0, sizeof(mbstate_t));
> +-  memset(mb_properties, 0, sizeof(char)*size);
> +-  for (i =3D 0; i < size ;)
> +-    {
> +-      size_t mbclen;
> +-      mbclen =3D mbrlen(buf + i, size - i, &cur_state);
> +-
> +-      if (mbclen =3D=3D (size_t) -1 || mbclen =3D=3D (size_t) -2 || mbc=
len =3D=3D 0)
> +-	{
> +-	  /* An invalid sequence, or a truncated multibyte character.
> +-	     We treat it as a singlebyte character.  */
> +-	  mbclen =3D 1;
> +-	}
> +-      mb_properties[i] =3D mbclen;
> +-      i +=3D mbclen;
> +-    }
> +-
> +-  return mb_properties;
> +-}
> +-#endif
> +-
> + static void
> + Gcompile (char const *pattern, size_t size)  { @@ -181,7 +166,8 @@
> +Gcompile (char const *pattern, size_t size)
> +   size_t total =3D size;
> +   char const *motif =3D pattern;
> +
> +-  re_set_syntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE);
> ++  check_utf8 ();
> ++  re_set_syntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE |
> ++ (match_icase ? RE_ICASE : 0));
> +   dfasyntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE, match_icase,
> + eolbyte);
> +
> +   /* For GNU regex compiler we have to pass the patterns separately to
> +detect @@ -218,6 +204,10 @@ Gcompile (char const *pattern, size_t size)
> +       motif =3D sep;
> +     } while (sep && total !=3D 0);
> +
> ++  /* Strip trailing newline. */
> ++  if (size && pattern[size - 1] =3D=3D '\n')
> ++    size--;
> ++
> +   /* In the match_words and match_lines cases, we use a different patte=
rn
> +      for the DFA matcher that will quickly throw out cases that won't w=
ork.
> +      Then if DFA succeeds we do some hairy stuff using the regex
> +matcher @@ -233,7 +223,7 @@ Gcompile (char const *pattern, size_t size)
> +       static char const line_end[] =3D "\\)$";
> +       static char const word_beg[] =3D "\\(^\\|[^[:alnum:]_]\\)\\(";
> +       static char const word_end[] =3D "\\)\\([^[:alnum:]_]\\|$\\)";
> +-      char *n =3D malloc (sizeof word_beg - 1 + size + sizeof word_end)=
;
> ++      char *n =3D xmalloc (sizeof word_beg - 1 + size + sizeof
> ++ word_end);
> +       size_t i;
> +       strcpy (n, match_lines ? line_beg : word_beg);
> +       i =3D strlen (n);
> +@@ -257,14 +247,15 @@ Ecompile (char const *pattern, size_t size)
> +   size_t total =3D size;
> +   char const *motif =3D pattern;
> +
> ++  check_utf8 ();
> +   if (strcmp (matcher, "awk") =3D=3D 0)
> +     {
> +-      re_set_syntax (RE_SYNTAX_AWK);
> ++      re_set_syntax (RE_SYNTAX_AWK | (match_icase ? RE_ICASE : 0));
> +       dfasyntax (RE_SYNTAX_AWK, match_icase, eolbyte);
> +     }
> +   else
> +     {
> +-      re_set_syntax (RE_SYNTAX_POSIX_EGREP);
> ++      re_set_syntax (RE_SYNTAX_POSIX_EGREP | (match_icase ? RE_ICASE :
> ++ 0));
> +       dfasyntax (RE_SYNTAX_POSIX_EGREP, match_icase, eolbyte);
> +     }
> +
> +@@ -301,6 +292,10 @@ Ecompile (char const *pattern, size_t size)
> +       motif =3D sep;
> +     } while (sep && total !=3D 0);
> +
> ++  /* Strip trailing newline. */
> ++  if (size && pattern[size - 1] =3D=3D '\n')
> ++    size--;
> ++
> +   /* In the match_words and match_lines cases, we use a different patte=
rn
> +      for the DFA matcher that will quickly throw out cases that won't w=
ork.
> +      Then if DFA succeeds we do some hairy stuff using the regex
> +matcher @@ -316,7 +311,7 @@ Ecompile (char const *pattern, size_t size)
> +       static char const line_end[] =3D ")$";
> +       static char const word_beg[] =3D "(^|[^[:alnum:]_])(";
> +       static char const word_end[] =3D ")([^[:alnum:]_]|$)";
> +-      char *n =3D malloc (sizeof word_beg - 1 + size + sizeof word_end)=
;
> ++      char *n =3D xmalloc (sizeof word_beg - 1 + size + sizeof
> ++ word_end);
> +       size_t i;
> +       strcpy (n, match_lines ? line_beg : word_beg);
> +       i =3D strlen(n);
> +@@ -339,15 +334,34 @@ EGexecute (char const *buf, size_t size, size_t
> *match_size, int exact)
> +   char eol =3D eolbyte;
> +   int backref, start, len;
> +   struct kwsmatch kwsm;
> +-  size_t i;
> ++  size_t i, ret_val;
> ++  static int use_dfa;
> ++  static int use_dfa_checked =3D 0;
> + #ifdef MBS_SUPPORT
> +-  char *mb_properties =3D NULL;
> ++  int mb_cur_max =3D MB_CUR_MAX;
> ++  mbstate_t mbs;
> ++  memset (&mbs, '\0', sizeof (mbstate_t));
> + #endif /* MBS_SUPPORT */
> +
> ++  if (!use_dfa_checked)
> ++    {
> ++      char *grep_use_dfa =3D getenv ("GREP_USE_DFA");
> ++      if (!grep_use_dfa)
> ++	{
> + #ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && kwset)
> +-    mb_properties =3D check_multibyte_string(buf, size);
> ++	  /* Turn off DFA when processing multibyte input. */
> ++	  use_dfa =3D (MB_CUR_MAX =3D=3D 1);
> ++#else
> ++	  use_dfa =3D 1;
> + #endif /* MBS_SUPPORT */
> ++	}
> ++      else
> ++	{
> ++	  use_dfa =3D atoi (grep_use_dfa);
> ++	}
> ++
> ++      use_dfa_checked =3D 1;
> ++    }
> +
> +   buflim =3D buf + size;
> +
> +@@ -358,47 +372,120 @@ EGexecute (char const *buf, size_t size, size_t
> *match_size, int exact)
> + 	  if (kwset)
> + 	    {
> + 	      /* Find a possible match using the KWset matcher. */
> +-	      size_t offset =3D kwsexec (kwset, beg, buflim - beg, &kwsm);
> ++#ifdef MBS_SUPPORT
> ++	      size_t bytes_left =3D 0;
> ++#endif /* MBS_SUPPORT */
> ++	      size_t offset;
> ++#ifdef MBS_SUPPORT
> ++	      /* kwsexec doesn't work with match_icase and multibyte input. */
> ++	      if (match_icase && mb_cur_max > 1)
> ++		/* Avoid kwset */
> ++		offset =3D 0;
> ++	      else
> ++#endif /* MBS_SUPPORT */
> ++	      offset =3D kwsexec (kwset, beg, buflim - beg, &kwsm);
> + 	      if (offset =3D=3D (size_t) -1)
> +-		{
> ++	        goto failure;
> + #ifdef MBS_SUPPORT
> +-		  if (MB_CUR_MAX > 1)
> +-		    free(mb_properties);
> +-#endif
> +-		  return (size_t)-1;
> ++	      if (mb_cur_max > 1 && !using_utf8)
> ++		{
> ++		  bytes_left =3D offset;
> ++		  while (bytes_left)
> ++		    {
> ++		      size_t mlen =3D mbrlen (beg, bytes_left, &mbs);
> ++		      if (mlen =3D=3D (size_t) -1 || mlen =3D=3D 0)
> ++			{
> ++			  /* Incomplete character: treat as single-byte. */
> ++			  memset (&mbs, '\0', sizeof (mbstate_t));
> ++			  beg++;
> ++			  bytes_left--;
> ++			  continue;
> ++			}
> ++
> ++		      if (mlen =3D=3D (size_t) -2)
> ++			/* Offset points inside multibyte character:
> ++			 * no good. */
> ++			break;
> ++
> ++		      beg +=3D mlen;
> ++		      bytes_left -=3D mlen;
> ++		    }
> + 		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> + 	      beg +=3D offset;
> + 	      /* Narrow down to the line containing the candidate, and
> + 		 run it through DFA. */
> + 	      end =3D memchr(beg, eol, buflim - beg);
> + 	      end++;
> + #ifdef MBS_SUPPORT
> +-	      if (MB_CUR_MAX > 1 && mb_properties[beg - buf] =3D=3D 0)
> ++	      if (mb_cur_max > 1 && bytes_left)
> + 		continue;
> +-#endif
> ++#endif /* MBS_SUPPORT */
> + 	      while (beg > buf && beg[-1] !=3D eol)
> + 		--beg;
> +-	      if (kwsm.index < kwset_exact_matches)
> +-		goto success;
> +-	      if (dfaexec (&dfa, beg, end - beg, &backref) =3D=3D (size_t) -1)
> ++	      if (
> ++#ifdef MBS_SUPPORT
> ++		  !(match_icase && mb_cur_max > 1) && #endif /* MBS_SUPPORT */
> ++		  (kwsm.index < kwset_exact_matches))
> ++		goto success_in_beg_and_end;
> ++	      if (use_dfa &&
> ++		  dfaexec (&dfa, beg, end - beg, &backref) =3D=3D (size_t) -1)
> + 		continue;
> + 	    }
> + 	  else
> + 	    {
> + 	      /* No good fixed strings; start with DFA. */
> +-	      size_t offset =3D dfaexec (&dfa, beg, buflim - beg, &backref);
> ++#ifdef MBS_SUPPORT
> ++	      size_t bytes_left =3D 0;
> ++#endif /* MBS_SUPPORT */
> ++	      size_t offset =3D 0;
> ++	      if (use_dfa)
> ++		offset =3D dfaexec (&dfa, beg, buflim - beg, &backref);
> + 	      if (offset =3D=3D (size_t) -1)
> + 		break;
> + 	      /* Narrow down to the line we've found. */
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1 && !using_utf8)
> ++		{
> ++		  bytes_left =3D offset;
> ++		  while (bytes_left)
> ++		    {
> ++		      size_t mlen =3D mbrlen (beg, bytes_left, &mbs);
> ++		      if (mlen =3D=3D (size_t) -1 || mlen =3D=3D 0)
> ++			{
> ++			  /* Incomplete character: treat as single-byte. */
> ++			  memset (&mbs, '\0', sizeof (mbstate_t));
> ++			  beg++;
> ++			  bytes_left--;
> ++			  continue;
> ++			}
> ++
> ++		      if (mlen =3D=3D (size_t) -2)
> ++			/* Offset points inside multibyte character:
> ++			 * no good. */
> ++			break;
> ++
> ++		      beg +=3D mlen;
> ++		      bytes_left -=3D mlen;
> ++		    }
> ++		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> + 	      beg +=3D offset;
> + 	      end =3D memchr (beg, eol, buflim - beg);
> + 	      end++;
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1 && bytes_left)
> ++		continue;
> ++#endif /* MBS_SUPPORT */
> + 	      while (beg > buf && beg[-1] !=3D eol)
> + 		--beg;
> + 	    }
> + 	  /* Successful, no backreferences encountered! */
> +-	  if (!backref)
> +-	    goto success;
> ++	  if (use_dfa && !backref)
> ++	    goto success_in_beg_and_end;
> + 	}
> +       else
> + 	end =3D beg + size;
> +@@ -413,14 +500,11 @@ EGexecute (char const *buf, size_t size, size_t
> *match_size, int exact)
> + 				       end - beg - 1, &(patterns[i].regs))))
> + 	    {
> + 	      len =3D patterns[i].regs.end[0] - start;
> +-	      if (exact)
> +-		{
> +-		  *match_size =3D len;
> +-		  return start;
> +-		}
> ++	      if (exact && !match_words)
> ++	        goto success_in_start_and_len;
> + 	      if ((!match_lines && !match_words)
> + 		  || (match_lines && len =3D=3D end - beg - 1))
> +-		goto success;
> ++		goto success_in_beg_and_end;
> + 	      /* If -w, check if the match aligns with word boundaries.
> + 		 We do this iteratively because:
> + 		 (a) the line may contain more than one occurence of the @@ -431,10
> ++515,114 @@ EGexecute (char const *buf, size_t size, size_t *match_size,=
 int
> exact)
> + 	      if (match_words)
> + 		while (start >=3D 0)
> + 		  {
> +-		    if ((start =3D=3D 0 || !WCHAR ((unsigned char) beg[start - 1]))
> +-			&& (len =3D=3D end - beg - 1
> +-			    || !WCHAR ((unsigned char) beg[start + len])))
> +-		      goto success;
> ++		    int lword_match =3D 0;
> ++		    if (start =3D=3D 0)
> ++		      lword_match =3D 1;
> ++		    else
> ++		      {
> ++			assert (start > 0);
> ++#ifdef MBS_SUPPORT
> ++			if (mb_cur_max > 1)
> ++			  {
> ++			    const char *s;
> ++			    size_t mr;
> ++			    wchar_t pwc;
> ++
> ++			    /* Locate the start of the multibyte character
> ++			       before the match position (=3D=3D beg + start). */
> ++			    if (using_utf8)
> ++			      {
> ++				/* UTF-8 is a special case: scan backwards
> ++				   until we find a 7-bit character or a
> ++				   lead byte. */
> ++				s =3D beg + start - 1;
> ++				while (s > buf
> ++				       && (unsigned char) *s >=3D 0x80
> ++				       && (unsigned char) *s <=3D 0xbf)
> ++				  --s;
> ++			      }
> ++			    else
> ++			      {
> ++				/* Scan forwards to find the start of the
> ++				   last complete character before the
> ++				   match position.  */
> ++				size_t bytes_left =3D start - 1;
> ++				s =3D beg;
> ++				while (bytes_left > 0)
> ++				  {
> ++				    mr =3D mbrlen (s, bytes_left, &mbs);
> ++				    if (mr =3D=3D (size_t) -1 || mr =3D=3D 0)
> ++				      {
> ++					memset (&mbs, '\0', sizeof (mbs));
> ++					s++;
> ++					bytes_left--;
> ++					continue;
> ++				      }
> ++				    if (mr =3D=3D (size_t) -2)
> ++				      {
> ++					memset (&mbs, '\0', sizeof (mbs));
> ++					break;
> ++				      }
> ++				    s +=3D mr;
> ++				    bytes_left -=3D mr;
> ++				  }
> ++			      }
> ++			    mr =3D mbrtowc (&pwc, s, beg + start - s, &mbs);
> ++			    if (mr =3D=3D (size_t) -2 || mr =3D=3D (size_t) -1 ||
> ++				mr =3D=3D 0)
> ++			      {
> ++				memset (&mbs, '\0', sizeof (mbstate_t));
> ++				lword_match =3D 1;
> ++			      }
> ++			    else if (!(iswalnum (pwc) || pwc =3D=3D L'_')
> ++				     && mr =3D=3D beg + start - s)
> ++			      lword_match =3D 1;
> ++			  }
> ++			else
> ++#endif /* MBS_SUPPORT */
> ++			if (!WCHAR ((unsigned char) beg[start - 1]))
> ++			  lword_match =3D 1;
> ++		      }
> ++
> ++		    if (lword_match)
> ++		      {
> ++			int rword_match =3D 0;
> ++			if (start + len =3D=3D end - beg - 1)
> ++			  rword_match =3D 1;
> ++			else
> ++			  {
> ++#ifdef MBS_SUPPORT
> ++			    if (mb_cur_max > 1)
> ++			      {
> ++				wchar_t nwc;
> ++				int mr;
> ++
> ++				mr =3D mbtowc (&nwc, beg + start + len,
> ++					     end - beg - start - len - 1);
> ++				if (mr <=3D 0)
> ++				  {
> ++				    memset (&mbs, '\0', sizeof (mbstate_t));
> ++				    rword_match =3D 1;
> ++				  }
> ++				else if (!iswalnum (nwc) && nwc !=3D L'_')
> ++				  rword_match =3D 1;
> ++			      }
> ++			    else
> ++#endif /* MBS_SUPPORT */
> ++			    if (!WCHAR ((unsigned char) beg[start + len]))
> ++			      rword_match =3D 1;
> ++			  }
> ++
> ++			if (rword_match)
> ++			  {
> ++			    if (!exact)
> ++			      /* Returns the whole line. */
> ++			      goto success_in_beg_and_end;
> ++			    else
> ++			      /* Returns just this word match. */
> ++			      goto success_in_start_and_len;
> ++			  }
> ++		      }
> + 		    if (len > 0)
> + 		      {
> + 			/* Try a shorter length anchored at the same place. */ @@ -461,26
> ++649,154 @@ EGexecute (char const *buf, size_t size, size_t *match_size,=
 int
> exact)
> + 	    }
> + 	} /* for Regex patterns.  */
> +     } /* for (beg =3D end ..) */
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && mb_properties)
> +-    free (mb_properties);
> +-#endif /* MBS_SUPPORT */
> ++
> ++ failure:
> +   return (size_t) -1;
> +
> +- success:
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && mb_properties)
> +-    free (mb_properties);
> +-#endif /* MBS_SUPPORT */
> +-  *match_size =3D end - beg;
> +-  return beg - buf;
> ++ success_in_beg_and_end:
> ++  len =3D end - beg;
> ++  start =3D beg - buf;
> ++  /* FALLTHROUGH */
> ++
> ++ success_in_start_and_len:
> ++  *match_size =3D len;
> ++  return start;
> + }
> +
> ++#ifdef MBS_SUPPORT
> ++static int f_i_multibyte; /* whether we're using the new -Fi MB method
> ++*/ static struct {
> ++  wchar_t **patterns;
> ++  size_t count, maxlen;
> ++  unsigned char *match;
> ++} Fimb;
> ++#endif
> ++
> + static void
> + Fcompile (char const *pattern, size_t size) {
> ++  int mb_cur_max =3D MB_CUR_MAX;
> +   char const *beg, *lim, *err;
> +
> ++  check_utf8 ();
> ++#ifdef MBS_SUPPORT
> ++  /* Support -F -i for UTF-8 input. */
> ++  if (match_icase && mb_cur_max > 1)
> ++    {
> ++      mbstate_t mbs;
> ++      wchar_t *wcpattern =3D xmalloc ((size + 1) * sizeof (wchar_t));
> ++      const char *patternend =3D pattern;
> ++      size_t wcsize;
> ++      kwset_t fimb_kwset =3D NULL;
> ++      char *starts =3D NULL;
> ++      wchar_t *wcbeg, *wclim;
> ++      size_t allocated =3D 0;
> ++
> ++      memset (&mbs, '\0', sizeof (mbs)); # ifdef __GNU_LIBRARY__
> ++      wcsize =3D mbsnrtowcs (wcpattern, &patternend, size, size, &mbs);
> ++      if (patternend !=3D pattern + size)
> ++	wcsize =3D (size_t) -1;
> ++# else
> ++      {
> ++	char *patterncopy =3D xmalloc (size + 1);
> ++
> ++	memcpy (patterncopy, pattern, size);
> ++	patterncopy[size] =3D '\0';
> ++	patternend =3D patterncopy;
> ++	wcsize =3D mbsrtowcs (wcpattern, &patternend, size, &mbs);
> ++	if (patternend !=3D patterncopy + size)
> ++	  wcsize =3D (size_t) -1;
> ++	free (patterncopy);
> ++      }
> ++# endif
> ++      if (wcsize + 2 <=3D 2)
> ++	{
> ++fimb_fail:
> ++	  free (wcpattern);
> ++	  free (starts);
> ++	  if (fimb_kwset)
> ++	    kwsfree (fimb_kwset);
> ++	  free (Fimb.patterns);
> ++	  Fimb.patterns =3D NULL;
> ++	}
> ++      else
> ++	{
> ++	  if (!(fimb_kwset =3D kwsalloc (NULL)))
> ++	    error (2, 0, _("memory exhausted"));
> ++
> ++	  starts =3D xmalloc (mb_cur_max * 3);
> ++	  wcbeg =3D wcpattern;
> ++	  do
> ++	    {
> ++	      int i;
> ++	      size_t wclen;
> ++
> ++	      if (Fimb.count >=3D allocated)
> ++		{
> ++		  if (allocated =3D=3D 0)
> ++		    allocated =3D 128;
> ++		  else
> ++		    allocated *=3D 2;
> ++		  Fimb.patterns =3D xrealloc (Fimb.patterns,
> ++					    sizeof (wchar_t *) * allocated);
> ++		}
> ++	      Fimb.patterns[Fimb.count++] =3D wcbeg;
> ++	      for (wclim =3D wcbeg;
> ++		   wclim < wcpattern + wcsize && *wclim !=3D L'\n'; ++wclim)
> ++		*wclim =3D towlower (*wclim);
> ++	      *wclim =3D L'\0';
> ++	      wclen =3D wclim - wcbeg;
> ++	      if (wclen > Fimb.maxlen)
> ++		Fimb.maxlen =3D wclen;
> ++	      if (wclen > 3)
> ++		wclen =3D 3;
> ++	      if (wclen =3D=3D 0)
> ++		{
> ++		  if ((err =3D kwsincr (fimb_kwset, "", 0)) !=3D 0)
> ++		    error (2, 0, err);
> ++		}
> ++	      else
> ++		for (i =3D 0; i < (1 << wclen); i++)
> ++		  {
> ++		    char *p =3D starts;
> ++		    int j, k;
> ++
> ++		    for (j =3D 0; j < wclen; ++j)
> ++		      {
> ++			wchar_t wc =3D wcbeg[j];
> ++			if (i & (1 << j))
> ++			  {
> ++			    wc =3D towupper (wc);
> ++			    if (wc =3D=3D wcbeg[j])
> ++			      continue;
> ++			  }
> ++			k =3D wctomb (p, wc);
> ++			if (k <=3D 0)
> ++			  goto fimb_fail;
> ++			p +=3D k;
> ++		      }
> ++		    if ((err =3D kwsincr (fimb_kwset, starts, p - starts)) !=3D 0)
> ++		      error (2, 0, err);
> ++		  }
> ++	      if (wclim < wcpattern + wcsize)
> ++		++wclim;
> ++	      wcbeg =3D wclim;
> ++	    }
> ++	  while (wcbeg < wcpattern + wcsize);
> ++	  f_i_multibyte =3D 1;
> ++	  kwset =3D fimb_kwset;
> ++	  free (starts);
> ++	  Fimb.match =3D xmalloc (Fimb.count);
> ++	  if ((err =3D kwsprep (kwset)) !=3D 0)
> ++	    error (2, 0, err);
> ++	  return;
> ++	}
> ++    }
> ++#endif /* MBS_SUPPORT */
> ++
> ++
> +   kwsinit ();
> +   beg =3D pattern;
> +   do
> +@@ -499,6 +815,76 @@ Fcompile (char const *pattern, size_t size)
> +     error (2, 0, err);
> + }
> +
> ++#ifdef MBS_SUPPORT
> ++static int
> ++Fimbexec (const char *buf, size_t size, size_t *plen, int exact) {
> ++  size_t len, letter, i;
> ++  int ret =3D -1;
> ++  mbstate_t mbs;
> ++  wchar_t wc;
> ++  int patterns_left;
> ++
> ++  assert (match_icase && f_i_multibyte =3D=3D 1);  assert (MB_CUR_MAX >
> ++ 1);
> ++
> ++  memset (&mbs, '\0', sizeof (mbs));
> ++  memset (Fimb.match, '\1', Fimb.count);  letter =3D len =3D 0;
> ++ patterns_left =3D 1;  while (patterns_left && len <=3D size)
> ++    {
> ++      size_t c;
> ++
> ++      patterns_left =3D 0;
> ++      if (len < size)
> ++	{
> ++	  c =3D mbrtowc (&wc, buf + len, size - len, &mbs);
> ++	  if (c + 2 <=3D 2)
> ++	    return ret;
> ++
> ++	  wc =3D towlower (wc);
> ++	}
> ++      else
> ++	{
> ++	  c =3D 1;
> ++	  wc =3D L'\0';
> ++	}
> ++
> ++      for (i =3D 0; i < Fimb.count; i++)
> ++	{
> ++	  if (Fimb.match[i])
> ++	    {
> ++	      if (Fimb.patterns[i][letter] =3D=3D L'\0')
> ++		{
> ++		  /* Found a match. */
> ++		  *plen =3D len;
> ++		  if (!exact && !match_words)
> ++		    return 0;
> ++		  else
> ++		    {
> ++		      /* For -w or exact look for longest match.  */
> ++		      ret =3D 0;
> ++		      Fimb.match[i] =3D '\0';
> ++		      continue;
> ++		    }
> ++		}
> ++
> ++	      if (Fimb.patterns[i][letter] =3D=3D wc)
> ++		patterns_left =3D 1;
> ++	      else
> ++		Fimb.match[i] =3D '\0';
> ++	    }
> ++	}
> ++
> ++      len +=3D c;
> ++      letter++;
> ++    }
> ++
> ++  return ret;
> ++}
> ++#endif /* MBS_SUPPORT */
> ++
> + static size_t
> + Fexecute (char const *buf, size_t size, size_t *match_size, int exact)
> +{ @@ -506,88 +892,268 @@ Fexecute (char const *buf, size_t size, size_t
> +*match_size, int exact)
> +   register size_t len;
> +   char eol =3D eolbyte;
> +   struct kwsmatch kwsmatch;
> ++  size_t ret_val;
> + #ifdef MBS_SUPPORT
> +-  char *mb_properties;
> +-  if (MB_CUR_MAX > 1)
> +-    mb_properties =3D check_multibyte_string (buf, size);
> ++  int mb_cur_max =3D MB_CUR_MAX;
> ++  mbstate_t mbs;
> ++  memset (&mbs, '\0', sizeof (mbstate_t));  const char *last_char =3D
> ++ NULL;
> + #endif /* MBS_SUPPORT */
> +
> +-  for (beg =3D buf; beg <=3D buf + size; ++beg)
> ++  for (beg =3D buf; beg < buf + size; ++beg)
> +     {
> +-      size_t offset =3D kwsexec (kwset, beg, buf + size - beg, &kwsmatc=
h);
> ++      size_t offset;
> ++      offset =3D kwsexec (kwset, beg, buf + size - beg, &kwsmatch);
> ++
> +       if (offset =3D=3D (size_t) -1)
> +-	{
> ++	goto failure;
> + #ifdef MBS_SUPPORT
> +-	  if (MB_CUR_MAX > 1)
> +-	    free(mb_properties);
> +-#endif /* MBS_SUPPORT */
> +-	  return offset;
> ++      if (mb_cur_max > 1 && !using_utf8)
> ++	{
> ++	  size_t bytes_left =3D offset;
> ++	  while (bytes_left)
> ++	    {
> ++	      size_t mlen =3D mbrlen (beg, bytes_left, &mbs);
> ++
> ++	      last_char =3D beg;
> ++	      if (mlen =3D=3D (size_t) -1 || mlen =3D=3D 0)
> ++		{
> ++		  /* Incomplete character: treat as single-byte. */
> ++		  memset (&mbs, '\0', sizeof (mbstate_t));
> ++		  beg++;
> ++		  bytes_left--;
> ++		  continue;
> ++		}
> ++
> ++	      if (mlen =3D=3D (size_t) -2)
> ++		/* Offset points inside multibyte character: no good. */
> ++		break;
> ++
> ++	      beg +=3D mlen;
> ++	      bytes_left -=3D mlen;
> ++	    }
> ++
> ++	  if (bytes_left)
> ++	    continue;
> + 	}
> +-#ifdef MBS_SUPPORT
> +-      if (MB_CUR_MAX > 1 && mb_properties[offset+beg-buf] =3D=3D 0)
> +-	continue; /* It is a part of multibyte character.  */
> ++      else
> + #endif /* MBS_SUPPORT */
> +       beg +=3D offset;
> +-      len =3D kwsmatch.size[0];
> +-      if (exact)
> +-	{
> +-	  *match_size =3D len;
> + #ifdef MBS_SUPPORT
> +-	  if (MB_CUR_MAX > 1)
> +-	    free (mb_properties);
> ++      /* For f_i_multibyte, the string at beg now matches first 3 chars=
 of
> ++	 one of the search strings (less if there are shorter search strings).
> ++	 See if this is a real match.  */
> ++      if (f_i_multibyte
> ++	  && Fimbexec (beg, buf + size - beg, &kwsmatch.size[0], exact))
> ++	goto next_char;
> + #endif /* MBS_SUPPORT */
> +-	  return beg - buf;
> +-	}
> ++      len =3D kwsmatch.size[0];
> ++      if (exact && !match_words)
> ++	goto success_in_beg_and_len;
> +       if (match_lines)
> + 	{
> + 	  if (beg > buf && beg[-1] !=3D eol)
> +-	    continue;
> ++	    goto next_char;
> + 	  if (beg + len < buf + size && beg[len] !=3D eol)
> +-	    continue;
> ++	    goto next_char;
> + 	  goto success;
> + 	}
> +       else if (match_words)
> +-	for (try =3D beg; len; )
> +-	  {
> +-	    if (try > buf && WCHAR((unsigned char) try[-1]))
> +-	      break;
> +-	    if (try + len < buf + size && WCHAR((unsigned char) try[len]))
> +-	      {
> +-		offset =3D kwsexec (kwset, beg, --len, &kwsmatch);
> +-		if (offset =3D=3D (size_t) -1)
> +-		  {
> ++	{
> ++	  while (len)
> ++	    {
> ++	      int word_match =3D 0;
> ++	      if (beg > buf)
> ++		{
> + #ifdef MBS_SUPPORT
> +-		    if (MB_CUR_MAX > 1)
> +-		      free (mb_properties);
> ++		  if (mb_cur_max > 1)
> ++		    {
> ++		      const char *s;
> ++		      int mr;
> ++		      wchar_t pwc;
> ++
> ++		      if (using_utf8)
> ++			{
> ++			  s =3D beg - 1;
> ++			  while (s > buf
> ++				 && (unsigned char) *s >=3D 0x80
> ++				 && (unsigned char) *s <=3D 0xbf)
> ++			    --s;
> ++			}
> ++		      else
> ++			s =3D last_char;
> ++		      mr =3D mbtowc (&pwc, s, beg - s);
> ++		      if (mr <=3D 0)
> ++			memset (&mbs, '\0', sizeof (mbstate_t));
> ++		      else if ((iswalnum (pwc) || pwc =3D=3D L'_')
> ++			       && mr =3D=3D (int) (beg - s))
> ++			goto next_char;
> ++		    }
> ++		  else
> + #endif /* MBS_SUPPORT */
> +-		    return offset;
> +-		  }
> +-		try =3D beg + offset;
> +-		len =3D kwsmatch.size[0];
> +-	      }
> +-	    else
> +-	      goto success;
> +-	  }
> ++		  if (WCHAR ((unsigned char) beg[-1]))
> ++		    goto next_char;
> ++		}
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1)
> ++		{
> ++		  wchar_t nwc;
> ++		  int mr;
> ++
> ++		  mr =3D mbtowc (&nwc, beg + len, buf + size - beg - len);
> ++		  if (mr <=3D 0)
> ++		    {
> ++		      memset (&mbs, '\0', sizeof (mbstate_t));
> ++		      word_match =3D 1;
> ++		    }
> ++		  else if (!iswalnum (nwc) && nwc !=3D L'_')
> ++		    word_match =3D 1;
> ++		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> ++		if (beg + len >=3D buf + size || !WCHAR ((unsigned char) beg[len]))
> ++		  word_match =3D 1;
> ++	      if (word_match)
> ++		{
> ++		  if (!exact)
> ++		    /* Returns the whole line now we know there's a word match. */
> ++		    goto success;
> ++		  else
> ++		    /* Returns just this word match. */
> ++		    goto success_in_beg_and_len;
> ++		}
> ++	      if (len > 0)
> ++		{
> ++		  /* Try a shorter length anchored at the same place. */
> ++		  --len;
> ++		  offset =3D kwsexec (kwset, beg, len, &kwsmatch);
> ++
> ++		  if (offset =3D=3D -1)
> ++		    goto next_char; /* Try a different anchor. */ #ifdef MBS_SUPPORT
> ++		  if (mb_cur_max > 1 && !using_utf8)
> ++		    {
> ++		      size_t bytes_left =3D offset;
> ++		      while (bytes_left)
> ++			{
> ++			  size_t mlen =3D mbrlen (beg, bytes_left, &mbs);
> ++
> ++			  last_char =3D beg;
> ++			  if (mlen =3D=3D (size_t) -1 || mlen =3D=3D 0)
> ++			    {
> ++			      /* Incomplete character: treat as single-byte. */
> ++			      memset (&mbs, '\0', sizeof (mbstate_t));
> ++			      beg++;
> ++			      bytes_left--;
> ++			      continue;
> ++			    }
> ++
> ++			  if (mlen =3D=3D (size_t) -2)
> ++			    {
> ++			      /* Offset points inside multibyte character:
> ++			       * no good. */
> ++			      break;
> ++			    }
> ++
> ++			  beg +=3D mlen;
> ++			  bytes_left -=3D mlen;
> ++			}
> ++
> ++		      if (bytes_left)
> ++			{
> ++			  memset (&mbs, '\0', sizeof (mbstate_t));
> ++			  goto next_char; /* Try a different anchor. */
> ++			}
> ++		    }
> ++		  else
> ++#endif /* MBS_SUPPORT */
> ++		  beg +=3D offset;
> ++#ifdef MBS_SUPPORT
> ++		  /* The string at beg now matches first 3 chars of one of
> ++		     the search strings (less if there are shorter search
> ++		     strings).  See if this is a real match.  */
> ++		  if (f_i_multibyte
> ++		      && Fimbexec (beg, len - offset, &kwsmatch.size[0],
> ++				   exact))
> ++		    goto next_char;
> ++#endif /* MBS_SUPPORT */
> ++		  len =3D kwsmatch.size[0];
> ++		}
> ++	    }
> ++	}
> +       else
> + 	goto success;
> +-    }
> +-
> ++next_char:;
> + #ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> +-    free (mb_properties);
> ++      /* Advance to next character.  For MB_CUR_MAX =3D=3D 1 case this =
is
> handled
> ++	 by ++beg above.  */
> ++      if (mb_cur_max > 1)
> ++	{
> ++	  if (using_utf8)
> ++	    {
> ++	      unsigned char c =3D *beg;
> ++	      if (c >=3D 0xc2)
> ++		{
> ++		  if (c < 0xe0)
> ++		    ++beg;
> ++		  else if (c < 0xf0)
> ++		    beg +=3D 2;
> ++		  else if (c < 0xf8)
> ++		    beg +=3D 3;
> ++		  else if (c < 0xfc)
> ++		    beg +=3D 4;
> ++		  else if (c < 0xfe)
> ++		    beg +=3D 5;
> ++		}
> ++	    }
> ++	  else
> ++	    {
> ++	      size_t l =3D mbrlen (beg, buf + size - beg, &mbs);
> ++
> ++	      last_char =3D beg;
> ++	      if (l + 2 >=3D 2)
> ++		beg +=3D l - 1;
> ++	      else
> ++		memset (&mbs, '\0', sizeof (mbstate_t));
> ++	    }
> ++	}
> + #endif /* MBS_SUPPORT */
> ++    }
> ++
> ++ failure:
> +   return -1;
> +
> +  success:
> ++#ifdef MBS_SUPPORT
> ++  if (mb_cur_max > 1 && !using_utf8)
> ++    {
> ++      end =3D beg + len;
> ++      while (end < buf + size)
> ++	{
> ++	  size_t mlen =3D mbrlen (end, buf + size - end, &mbs);
> ++	  if (mlen =3D=3D (size_t) -1 || mlen =3D=3D (size_t) -2 || mlen =3D=
=3D 0)
> ++	    {
> ++	      memset (&mbs, '\0', sizeof (mbstate_t));
> ++	      mlen =3D 1;
> ++	    }
> ++	  if (mlen =3D=3D 1 && *end =3D=3D eol)
> ++	    break;
> ++
> ++	  end +=3D mlen;
> ++	}
> ++    }
> ++  else
> ++#endif /* MBS_SUPPORT */
> +   end =3D memchr (beg + len, eol, (buf + size) - (beg + len));
> ++
> +   end++;
> +   while (buf < beg && beg[-1] !=3D eol)
> +     --beg;
> +-  *match_size =3D end - beg;
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> +-    free (mb_properties);
> +-#endif /* MBS_SUPPORT */
> ++  len =3D end - beg;
> ++  /* FALLTHROUGH */
> ++
> ++ success_in_beg_and_len:
> ++  *match_size =3D len;
> +   return beg - buf;
> + }
> +
> +@@ -701,8 +1267,9 @@ Pexecute (char const *buf, size_t size, size_t
> *match_size, int exact)
> +       char eol =3D eolbyte;
> +       if (!exact)
> + 	{
> +-	  end =3D memchr (end, eol, buflim - end);
> +-	  end++;
> ++	  while (end < buflim)
> ++	    if (*end++ =3D=3D eol)
> ++	      break;
> + 	  while (buf < beg && beg[-1] !=3D eol)
> + 	    --beg;
> + 	}
> +diff --git a/tests/Makefile.am b/tests/Makefile.am index
> +599db67..002014a 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -3,7 +3,8 @@
> + AWK=3D@AWK@
> +
> + TESTS =3D warning.sh khadafy.sh spencer1.sh bre.sh ere.sh \
> +-        status.sh empty.sh options.sh backref.sh file.sh
> ++        status.sh empty.sh options.sh backref.sh file.sh \
> ++        fmbtest.sh
> + EXTRA_DIST =3D $(TESTS) \
> +              khadafy.lines khadafy.regexp \
> +              spencer1.awk spencer1.tests \ diff --git
> +a/tests/Makefile.in b/tests/Makefile.in index db3d066..e5b3f47 100644
> +--- a/tests/Makefile.in
> ++++ b/tests/Makefile.in
> +@@ -97,7 +97,8 @@ install_sh =3D @install_sh@  AWK =3D @AWK@
> +
> + TESTS =3D warning.sh khadafy.sh spencer1.sh bre.sh ere.sh \
> +-        status.sh empty.sh options.sh backref.sh file.sh
> ++        status.sh empty.sh options.sh backref.sh file.sh \
> ++	fmbtest.sh
> +
> + EXTRA_DIST =3D $(TESTS) \
> +              khadafy.lines khadafy.regexp \
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb
> b/meta/recipes-extended/grep/grep_2.5.1a.bb
> index 178fc31..cc05678 100644
> --- a/meta/recipes-extended/grep/grep_2.5.1a.bb
> +++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
>             file://Makevars \
>             file://grep-CVE-2012-5667.patch \
>             file://fix-for-texinfo-5.1.patch \
> +           file://grep-fix-LSB-NG-Cases.patch \
>            "
>=20
>  SRC_URI[md5sum] =3D "52202fe462770fa6be1bb667bd6cf30c"
> @@ -22,7 +23,8 @@ SRC_URI[sha256sum] =3D
> "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92b
>=20
>  inherit autotools gettext texinfo
>=20
> -EXTRA_OECONF =3D "--disable-perl-regexp"
> +EXTRA_OECONF =3D "--disable-perl-regexp \
> +                --without-included-regex"
>=20
>  CFLAGS +=3D "-D PROTOTYPES"
>  do_configure_prepend () {
> --
> 1.8.4.2


