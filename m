Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C981160990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 01:00:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2013 18:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,963,1367996400"; d="scan'208";a="393806898"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2013 18:00:32 -0700
Message-ID: <521BFA2A.4090508@linux.intel.com>
Date: Mon, 26 Aug 2013 18:00:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Li Zhijian <lizhijian@cn.fujitsu.com>
References: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
In-Reply-To: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grep-2.5.1a: fix grep for LSB compliance
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
X-List-Received-Date: Tue, 27 Aug 2013 01:00:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 08/27/2013 02:43 AM, Li Zhijian wrote:
> add patch from grep-2.5.1-55.el5.src.rpm and
> enable configration option of --without-include-regex
>
> LSB core-tests failed at /tset/LI18NUX2K.L1/utils/grep-tp/T.grep-tp 5,T.egrep-tp 5
> which is intend to verify this utility can perform pattern matching in searches
> without regard to case if -i option is specified.
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>   .../grep/grep-2.5.1a/grep-2.5-i18n.patch           |  303 +++++++
>   .../grep/grep-2.5.1a/grep-2.5.1-bracket.patch      |   11 +
>   .../grep/grep-2.5.1a/grep-2.5.1-color.patch        |   10 +
>   .../grep/grep-2.5.1a/grep-2.5.1-dfa-optional.patch |   67 ++
>   .../grep/grep-2.5.1a/grep-2.5.1-egf-speedup.patch  |  823 ++++++++++++++++++++
>   .../grep/grep-2.5.1a/grep-2.5.1-fgrep.patch        |  145 ++++
>   .../grep/grep-2.5.1a/grep-2.5.1-icolor.patch       |   36 +
>   .../grep/grep-2.5.1a/grep-2.5.1-manpage.patch      |   19 +
>   .../grep/grep-2.5.1a/grep-2.5.1-oi.patch           |   48 ++
>   .../grep/grep-2.5.1a/grep-2.5.1-tests.patch        |  138 ++++
>   .../grep/grep-2.5.1a/grep-2.5.1-w.patch            |  121 +++
>   .../recipes-extended/grep/grep-2.5.1a/grep-P.patch |   14 +
>   .../grep/grep-2.5.1a/grep-bz434934.patch           |   17 +
>   .../grep/grep-2.5.1a/grep-bz460641.patch           |   11 +
>   .../grep/grep-2.5.1a/grep-empty-pattern.patch      |   36 +
>   .../grep/grep-2.5.1a/grep-man-label.patch          |   22 +
>   .../grep/grep-2.5.1a/grep-skip.patch               |   42 +
>   meta/recipes-extended/grep/grep_2.5.1a.bb          |   23 +-
>   18 files changed, 1883 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5-i18n.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-bracket.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-color.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-dfa-optional.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-egf-speedup.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-fgrep.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-icolor.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-manpage.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-oi.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-tests.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-w.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-P.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-bz434934.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-bz460641.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-empty-pattern.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-man-label.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-skip.patch
>
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5-i18n.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5-i18n.patch
> new file mode 100644
> index 0000000..8dc3dfe
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5-i18n.patch
> @@ -0,0 +1,303 @@
> +--- grep-2.5.1/src/dfa.c	2004-02-26 13:09:54.000000000 +0000
> ++++ grep-2.5.1/src/dfa.c	2004-05-18 16:43:31.189200479 +0100
> +@@ -414,7 +414,7 @@
> +
> + /* This function fetch a wide character, and update cur_mb_len,
> +    used only if the current locale is a multibyte environment.  */
> +-static wchar_t
> ++static wint_t
> + fetch_wc (char const *eoferr)
> + {
> +   wchar_t wc;
> +@@ -423,7 +423,7 @@
> +       if (eoferr != 0)
> + 	dfaerror (eoferr);
> +       else
> +-	return -1;
> ++	return WEOF;
> +     }
> +
> +   cur_mb_len = mbrtowc(&wc, lexptr, lexleft, &mbs);
> +@@ -459,7 +459,7 @@
> + static void
> + parse_bracket_exp_mb ()
> + {
> +-  wchar_t wc, wc1, wc2;
> ++  wint_t wc, wc1, wc2;
> +
> +   /* Work area to build a mb_char_classes.  */
> +   struct mb_char_classes *work_mbc;
> +@@ -496,7 +496,7 @@
> +     work_mbc->invert = 0;
> +   do
> +     {
> +-      wc1 = -1; /* mark wc1 is not initialized".  */
> ++      wc1 = WEOF; /* mark wc1 is not initialized".  */
> +
> +       /* Note that if we're looking at some other [:...:] construct,
> + 	 we just treat it as a bunch of ordinary characters.  We can do
> +@@ -586,7 +586,7 @@
> + 		      work_mbc->coll_elems[work_mbc->ncoll_elems++] = elem;
> + 		    }
> +  		}
> +-	      wc1 = wc = -1;
> ++	      wc1 = wc = WEOF;
> + 	    }
> + 	  else
> + 	    /* We treat '[' as a normal character here.  */
> +@@ -600,7 +600,7 @@
> + 	    wc = fetch_wc(("Unbalanced ["));
> + 	}
> +
> +-      if (wc1 == -1)
> ++      if (wc1 == WEOF)
> + 	wc1 = fetch_wc(_("Unbalanced ["));
> +
> +       if (wc1 == L'-')
> +@@ -630,17 +630,17 @@
> + 	    }
> + 	  REALLOC_IF_NECESSARY(work_mbc->range_sts, wchar_t,
> + 			       range_sts_al, work_mbc->nranges + 1);
> +-	  work_mbc->range_sts[work_mbc->nranges] = wc;
> ++	  work_mbc->range_sts[work_mbc->nranges] = (wchar_t)wc;
> + 	  REALLOC_IF_NECESSARY(work_mbc->range_ends, wchar_t,
> + 			       range_ends_al, work_mbc->nranges + 1);
> +-	  work_mbc->range_ends[work_mbc->nranges++] = wc2;
> ++	  work_mbc->range_ends[work_mbc->nranges++] = (wchar_t)wc2;
> + 	}
> +-      else if (wc != -1)
> ++      else if (wc != WEOF)
> + 	/* build normal characters.  */
> + 	{
> + 	  REALLOC_IF_NECESSARY(work_mbc->chars, wchar_t, chars_al,
> + 			       work_mbc->nchars + 1);
> +-	  work_mbc->chars[work_mbc->nchars++] = wc;
> ++	  work_mbc->chars[work_mbc->nchars++] = (wchar_t)wc;
> + 	}
> +     }
> +   while ((wc = wc1) != L']');
> +@@ -2552,6 +2552,8 @@
> +     }
> +
> +   /* match with a character?  */
> ++  if (case_fold)
> ++    wc = towlower (wc);
> +   for (i = 0; i<work_mbc->nchars; i++)
> +     {
> +       if (wc == work_mbc->chars[i])
> +--- grep-2.5.1/src/grep.c.i18n	2002-03-26 15:54:12.000000000 +0000
> ++++ grep-2.5.1/src/grep.c	2004-02-26 13:09:54.000000000 +0000
> +@@ -30,6 +30,12 @@
> + # include <sys/time.h>
> + # include <sys/resource.h>
> + #endif
> ++#if defined HAVE_WCTYPE_H && defined HAVE_WCHAR_H && defined HAVE_MBRTOWC
> ++/* We can handle multibyte string.  */
> ++# define MBS_SUPPORT
> ++# include <wchar.h>
> ++# include <wctype.h>
> ++#endif
> + #include <stdio.h>
> + #include "system.h"
> + #include "getopt.h"
> +@@ -1697,6 +1703,37 @@
> +   if (!install_matcher (matcher) && !install_matcher ("default"))
> +     abort ();
> +
> ++#ifdef MBS_SUPPORT
> ++  if (MB_CUR_MAX != 1 && match_icase)
> ++    {
> ++      wchar_t wc;
> ++      mbstate_t cur_state, prev_state;
> ++      int i, len = strlen(keys);
> ++
> ++      memset(&cur_state, 0, sizeof(mbstate_t));
> ++      for (i = 0; i <= len ;)
> ++	{
> ++	  size_t mbclen;
> ++	  mbclen = mbrtowc(&wc, keys + i, len - i, &cur_state);
> ++	  if (mbclen == (size_t) -1 || mbclen == (size_t) -2 || mbclen == 0)
> ++	    {
> ++	      /* An invalid sequence, or a truncated multibyte character.
> ++		 We treat it as a singlebyte character.  */
> ++	      mbclen = 1;
> ++	    }
> ++	  else
> ++	    {
> ++	      if (iswupper((wint_t)wc))
> ++		{
> ++		  wc = towlower((wint_t)wc);
> ++		  wcrtomb(keys + i, wc, &cur_state);
> ++		}
> ++	    }
> ++	  i += mbclen;
> ++	}
> ++    }
> ++#endif /* MBS_SUPPORT */
> ++
> +   (*compile)(keys, keycc);
> +
> +   if ((argc - optind > 1 && !no_filenames) || with_filenames)
> +--- grep-2.5.1/src/search.c.i18n	2004-02-26 13:09:54.000000000 +0000
> ++++ grep-2.5.1/src/search.c	2004-02-26 13:17:12.000000000 +0000
> +@@ -149,15 +149,16 @@
> + static char*
> + check_multibyte_string(char const *buf, size_t size)
> + {
> +-  char *mb_properties = malloc(size);
> ++  char *mb_properties = xmalloc(size);
> +   mbstate_t cur_state;
> ++  wchar_t wc;
> +   int i;
> +   memset(&cur_state, 0, sizeof(mbstate_t));
> +   memset(mb_properties, 0, sizeof(char)*size);
> +   for (i = 0; i < size ;)
> +     {
> +       size_t mbclen;
> +-      mbclen = mbrlen(buf + i, size - i, &cur_state);
> ++      mbclen = mbrtowc(&wc, buf + i, size - i, &cur_state);
> +
> +       if (mbclen == (size_t) -1 || mbclen == (size_t) -2 || mbclen == 0)
> + 	{
> +@@ -165,6 +166,14 @@
> + 	     We treat it as a singlebyte character.  */
> + 	  mbclen = 1;
> + 	}
> ++      else if (match_icase)
> ++	{
> ++	  if (iswupper((wint_t)wc))
> ++	    {
> ++	      wc = towlower((wint_t)wc);
> ++	      wcrtomb(buf + i, wc, &cur_state);
> ++	    }
> ++	}
> +       mb_properties[i] = mbclen;
> +       i += mbclen;
> +     }
> +@@ -233,7 +242,7 @@
> +       static char const line_end[] = "\\)$";
> +       static char const word_beg[] = "\\(^\\|[^[:alnum:]_]\\)\\(";
> +       static char const word_end[] = "\\)\\([^[:alnum:]_]\\|$\\)";
> +-      char *n = malloc (sizeof word_beg - 1 + size + sizeof word_end);
> ++      char *n = xmalloc (sizeof word_beg - 1 + size + sizeof word_end);
> +       size_t i;
> +       strcpy (n, match_lines ? line_beg : word_beg);
> +       i = strlen (n);
> +@@ -316,7 +325,7 @@
> +       static char const line_end[] = ")$";
> +       static char const word_beg[] = "(^|[^[:alnum:]_])(";
> +       static char const word_end[] = ")([^[:alnum:]_]|$)";
> +-      char *n = malloc (sizeof word_beg - 1 + size + sizeof word_end);
> ++      char *n = xmalloc (sizeof word_beg - 1 + size + sizeof word_end);
> +       size_t i;
> +       strcpy (n, match_lines ? line_beg : word_beg);
> +       i = strlen(n);
> +@@ -339,14 +348,20 @@
> +   char eol = eolbyte;
> +   int backref, start, len;
> +   struct kwsmatch kwsm;
> +-  size_t i;
> ++  size_t i, ret_val;
> + #ifdef MBS_SUPPORT
> +   char *mb_properties = NULL;
> +-#endif /* MBS_SUPPORT */
> +-
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && kwset)
> +-    mb_properties = check_multibyte_string(buf, size);
> ++  if (MB_CUR_MAX > 1)
> ++    {
> ++      if (match_icase)
> ++        {
> ++          char *case_buf = xmalloc(size);
> ++          memcpy(case_buf, buf, size);
> ++          buf = case_buf;
> ++        }
> ++      if (kwset)
> ++        mb_properties = check_multibyte_string(buf, size);
> ++    }
> + #endif /* MBS_SUPPORT */
> +
> +   buflim = buf + size;
> +@@ -455,8 +470,13 @@
> +
> +  failure:
> + #ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && mb_properties)
> +-    free (mb_properties);
> ++  if (MB_CUR_MAX > 1)
> ++    {
> ++      if (mb_properties)
> ++	free (mb_properties);
> ++      if (match_icase)
> ++	free ((char *) buf);
> ++    }
> + #endif /* MBS_SUPPORT */
> +   return (size_t) -1;
> +
> +@@ -467,8 +487,13 @@
> +
> +  success_in_start_and_len:
> + #ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1 && mb_properties)
> +-    free (mb_properties);
> ++  if (MB_CUR_MAX > 1)
> ++    {
> ++      if (mb_properties)
> ++	free (mb_properties);
> ++      if (match_icase)
> ++	free ((char *) buf);
> ++    }
> + #endif /* MBS_SUPPORT */
> +   *match_size = len;
> +   return start;
> +@@ -504,10 +529,19 @@
> +   register size_t len;
> +   char eol = eolbyte;
> +   struct kwsmatch kwsmatch;
> ++  size_t ret_val;
> + #ifdef MBS_SUPPORT
> +-  char *mb_properties;
> ++  char *mb_properties = NULL;
> +   if (MB_CUR_MAX > 1)
> +-    mb_properties = check_multibyte_string (buf, size);
> ++    {
> ++      if (match_icase)
> ++        {
> ++          char *case_buf = xmalloc(size);
> ++          memcpy(case_buf, buf, size);
> ++          buf = case_buf;
> ++        }
> ++      mb_properties = check_multibyte_string(buf, size);
> ++    }
> + #endif /* MBS_SUPPORT */
> +
> +   for (beg = buf; beg <= buf + size; ++beg)
> +@@ -565,7 +599,12 @@
> +  failure:
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1)
> +-    free (mb_properties);
> ++    {
> ++      if (match_icase)
> ++        free((char *) buf);
> ++      if (mb_properties)
> ++        free(mb_properties);
> ++    }
> + #endif /* MBS_SUPPORT */
> +   return -1;
> +
> +@@ -581,7 +620,12 @@
> +   *match_size = len;
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1)
> +-    free (mb_properties);
> ++    {
> ++      if (mb_properties)
> ++	free (mb_properties);
> ++      if (match_icase)
> ++	free ((char *) buf);
> ++    }
> + #endif /* MBS_SUPPORT */
> +   return beg - buf;
> + }
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-bracket.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-bracket.patch
> new file mode 100644
> index 0000000..f99571c
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-bracket.patch
> @@ -0,0 +1,11 @@
> +--- grep-2.5.1/src/dfa.c.bracket	2003-10-30 16:21:14.000000000 +0000
> ++++ grep-2.5.1/src/dfa.c	2003-10-30 16:22:38.000000000 +0000
> +@@ -586,7 +586,7 @@
> + 		      work_mbc->coll_elems[work_mbc->ncoll_elems++] = elem;
> + 		    }
> +  		}
> +-	      wc = -1;
> ++	      wc1 = wc = -1;
> + 	    }
> + 	  else
> + 	    /* We treat '[' as a normal character here.  */
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-color.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-color.patch
> new file mode 100644
> index 0000000..f54c258
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-color.patch
> @@ -0,0 +1,10 @@
> +--- grep-2.5.1/src/grep.c.color	2004-11-16 16:46:22.845505847 +0000
> ++++ grep-2.5.1/src/grep.c	2004-11-16 16:46:27.961530537 +0000
> +@@ -607,6 +607,7 @@
> + 	  fputs ("\33[00m", stdout);
> + 	  beg = b + match_size;
> + 	}
> ++      fputs ("\33[K", stdout);
> +     }
> +   fwrite (beg, 1, lim - beg, stdout);
> +   if (ferror (stdout))
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-dfa-optional.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-dfa-optional.patch
> new file mode 100644
> index 0000000..784eba9
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-dfa-optional.patch
> @@ -0,0 +1,67 @@
> +--- grep-2.5.1a/src/search.c.dfa-optional	2005-01-07 14:58:45.714869815 +0000
> ++++ grep-2.5.1a/src/search.c	2005-01-07 14:58:45.725867716 +0000
> +@@ -327,12 +327,34 @@
> +   int backref, start, len;
> +   struct kwsmatch kwsm;
> +   size_t i, ret_val;
> ++  static int use_dfa;
> ++  static int use_dfa_checked = 0;
> + #ifdef MBS_SUPPORT
> +   int mb_cur_max = MB_CUR_MAX;
> +   mbstate_t mbs;
> +   memset (&mbs, '\0', sizeof (mbstate_t));
> + #endif /* MBS_SUPPORT */
> +
> ++  if (!use_dfa_checked)
> ++    {
> ++      char *grep_use_dfa = getenv ("GREP_USE_DFA");
> ++      if (!grep_use_dfa)
> ++	{
> ++#ifdef MBS_SUPPORT
> ++	  /* Turn off DFA when processing multibyte input. */
> ++	  use_dfa = (MB_CUR_MAX == 1);
> ++#else
> ++	  use_dfa = 1;
> ++#endif /* MBS_SUPPORT */
> ++	}
> ++      else
> ++	{
> ++	  use_dfa = atoi (grep_use_dfa);
> ++	}
> ++
> ++      use_dfa_checked = 1;
> ++    }
> ++
> +   buflim = buf + size;
> +
> +   for (beg = end = buf; end < buflim; beg = end)
> +@@ -400,7 +422,8 @@
> + #endif /* MBS_SUPPORT */
> + 		  (kwsm.index < kwset_exact_matches))
> + 		goto success_in_beg_and_end;
> +-	      if (dfaexec (&dfa, beg, end - beg, &backref) == (size_t) -1)
> ++	      if (use_dfa &&
> ++		  dfaexec (&dfa, beg, end - beg, &backref) == (size_t) -1)
> + 		continue;
> + 	    }
> + 	  else
> +@@ -409,7 +432,9 @@
> + #ifdef MBS_SUPPORT
> + 	      size_t bytes_left = 0;
> + #endif /* MBS_SUPPORT */
> +-	      size_t offset = dfaexec (&dfa, beg, buflim - beg, &backref);
> ++	      size_t offset = 0;
> ++	      if (use_dfa)
> ++		offset = dfaexec (&dfa, beg, buflim - beg, &backref);
> + 	      if (offset == (size_t) -1)
> + 		break;
> + 	      /* Narrow down to the line we've found. */
> +@@ -451,7 +476,7 @@
> + 		--beg;
> + 	    }
> + 	  /* Successful, no backreferences encountered! */
> +-	  if (!backref)
> ++	  if (use_dfa && !backref)
> + 	    goto success_in_beg_and_end;
> + 	}
> +       else
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-egf-speedup.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-egf-speedup.patch
> new file mode 100644
> index 0000000..08e92c7
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-egf-speedup.patch
> @@ -0,0 +1,823 @@
> +--- grep-2.5.1/src/search.c	2004-12-31 15:28:35.720391036 +0000
> ++++ grep-2.5.1a/src/search.c	2005-01-07 14:53:10.308860193 +0000
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
> + #if defined HAVE_WCTYPE_H && defined HAVE_WCHAR_H && defined HAVE_MBRTOWC
> + /* We can handle multibyte string.  */
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
> +@@ -70,9 +77,10 @@
> +    call the regexp matcher at all. */
> + static int kwset_exact_matches;
> +
> +-#if defined(MBS_SUPPORT)
> +-static char* check_multibyte_string PARAMS ((char const *buf, size_t size));
> +-#endif
> ++/* UTF-8 encoding allows some optimizations that we can't otherwise
> ++   assume in a multibyte encoding. */
> ++static int using_utf8;
> ++
> + static void kwsinit PARAMS ((void));
> + static void kwsmusts PARAMS ((void));
> + static void Gcompile PARAMS ((char const *, size_t));
> +@@ -84,6 +92,15 @@
> + static size_t Pexecute PARAMS ((char const *, size_t, size_t *, int));
> +
> + void
> ++check_utf8 (void)
> ++{
> ++#ifdef HAVE_LANGINFO_CODESET
> ++  if (strcmp (nl_langinfo (CODESET), "UTF-8") == 0)
> ++    using_utf8 = 1;
> ++#endif
> ++}
> ++
> ++void
> + dfaerror (char const *mesg)
> + {
> +   error (2, 0, mesg);
> +@@ -141,47 +158,6 @@
> +     }
> + }
> +
> +-#ifdef MBS_SUPPORT
> +-/* This function allocate the array which correspond to "buf".
> +-   Then this check multibyte string and mark on the positions which
> +-   are not singlebyte character nor the first byte of a multibyte
> +-   character.  Caller must free the array.  */
> +-static char*
> +-check_multibyte_string(char const *buf, size_t size)
> +-{
> +-  char *mb_properties = xmalloc(size);
> +-  mbstate_t cur_state;
> +-  wchar_t wc;
> +-  int i;
> +-  memset(&cur_state, 0, sizeof(mbstate_t));
> +-  memset(mb_properties, 0, sizeof(char)*size);
> +-  for (i = 0; i < size ;)
> +-    {
> +-      size_t mbclen;
> +-      mbclen = mbrtowc(&wc, buf + i, size - i, &cur_state);
> +-
> +-      if (mbclen == (size_t) -1 || mbclen == (size_t) -2 || mbclen == 0)
> +-	{
> +-	  /* An invalid sequence, or a truncated multibyte character.
> +-	     We treat it as a singlebyte character.  */
> +-	  mbclen = 1;
> +-	}
> +-      else if (match_icase)
> +-	{
> +-	  if (iswupper((wint_t)wc))
> +-	    {
> +-	      wc = towlower((wint_t)wc);
> +-	      wcrtomb(buf + i, wc, &cur_state);
> +-	    }
> +-	}
> +-      mb_properties[i] = mbclen;
> +-      i += mbclen;
> +-    }
> +-
> +-  return mb_properties;
> +-}
> +-#endif
> +-
> + static void
> + Gcompile (char const *pattern, size_t size)
> + {
> +@@ -190,6 +166,7 @@
> +   size_t total = size;
> +   char const *motif = pattern;
> +
> ++  check_utf8 ();
> +   re_set_syntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE | (match_icase ? RE_ICASE : 0));
> +   dfasyntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE, match_icase, eolbyte);
> +
> +@@ -266,6 +243,7 @@
> +   size_t total = size;
> +   char const *motif = pattern;
> +
> ++  check_utf8 ();
> +   if (strcmp (matcher, "awk") == 0)
> +     {
> +       re_set_syntax (RE_SYNTAX_AWK | (match_icase ? RE_ICASE : 0));
> +@@ -350,18 +328,9 @@
> +   struct kwsmatch kwsm;
> +   size_t i, ret_val;
> + #ifdef MBS_SUPPORT
> +-  char *mb_properties = NULL;
> +-  if (MB_CUR_MAX > 1)
> +-    {
> +-      if (match_icase)
> +-        {
> +-          char *case_buf = xmalloc(size);
> +-          memcpy(case_buf, buf, size);
> +-          buf = case_buf;
> +-        }
> +-      if (kwset)
> +-        mb_properties = check_multibyte_string(buf, size);
> +-    }
> ++  int mb_cur_max = MB_CUR_MAX;
> ++  mbstate_t mbs;
> ++  memset (&mbs, '\0', sizeof (mbstate_t));
> + #endif /* MBS_SUPPORT */
> +
> +   buflim = buf + size;
> +@@ -373,21 +342,63 @@
> + 	  if (kwset)
> + 	    {
> + 	      /* Find a possible match using the KWset matcher. */
> +-	      size_t offset = kwsexec (kwset, beg, buflim - beg, &kwsm);
> ++#ifdef MBS_SUPPORT
> ++	      size_t bytes_left = 0;
> ++#endif /* MBS_SUPPORT */
> ++	      size_t offset;
> ++#ifdef MBS_SUPPORT
> ++	      /* kwsexec doesn't work with match_icase and multibyte input. */
> ++	      if (match_icase && mb_cur_max > 1)
> ++		/* Avoid kwset */
> ++		offset = 0;
> ++	      else
> ++#endif /* MBS_SUPPORT */
> ++	      offset = kwsexec (kwset, beg, buflim - beg, &kwsm);
> + 	      if (offset == (size_t) -1)
> + 	        goto failure;
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1 && !using_utf8)
> ++		{
> ++		  bytes_left = offset;
> ++		  while (bytes_left)
> ++		    {
> ++		      size_t mlen = mbrlen (beg, bytes_left, &mbs);
> ++		      if (mlen == (size_t) -1 || mlen == 0)
> ++			{
> ++			  /* Incomplete character: treat as single-byte. */
> ++			  memset (&mbs, '\0', sizeof (mbstate_t));
> ++			  beg++;
> ++			  bytes_left--;
> ++			  continue;
> ++			}
> ++
> ++		      if (mlen == (size_t) -2)
> ++			/* Offset points inside multibyte character:
> ++			 * no good. */
> ++			break;
> ++
> ++		      beg += mlen;
> ++		      bytes_left -= mlen;
> ++		    }
> ++		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> + 	      beg += offset;
> + 	      /* Narrow down to the line containing the candidate, and
> + 		 run it through DFA. */
> + 	      end = memchr(beg, eol, buflim - beg);
> + 	      end++;
> + #ifdef MBS_SUPPORT
> +-	      if (MB_CUR_MAX > 1 && mb_properties[beg - buf] == 0)
> ++	      if (mb_cur_max > 1 && bytes_left)
> + 		continue;
> +-#endif
> ++#endif /* MBS_SUPPORT */
> + 	      while (beg > buf && beg[-1] != eol)
> + 		--beg;
> +-	      if (kwsm.index < kwset_exact_matches)
> ++	      if (
> ++#ifdef MBS_SUPPORT
> ++		  !(match_icase && mb_cur_max > 1) &&
> ++#endif /* MBS_SUPPORT */
> ++		  (kwsm.index < kwset_exact_matches))
> + 		goto success_in_beg_and_end;
> + 	      if (dfaexec (&dfa, beg, end - beg, &backref) == (size_t) -1)
> + 		continue;
> +@@ -395,13 +406,47 @@
> + 	  else
> + 	    {
> + 	      /* No good fixed strings; start with DFA. */
> ++#ifdef MBS_SUPPORT
> ++	      size_t bytes_left = 0;
> ++#endif /* MBS_SUPPORT */
> + 	      size_t offset = dfaexec (&dfa, beg, buflim - beg, &backref);
> + 	      if (offset == (size_t) -1)
> + 		break;
> + 	      /* Narrow down to the line we've found. */
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1 && !using_utf8)
> ++		{
> ++		  bytes_left = offset;
> ++		  while (bytes_left)
> ++		    {
> ++		      size_t mlen = mbrlen (beg, bytes_left, &mbs);
> ++		      if (mlen == (size_t) -1 || mlen == 0)
> ++			{
> ++			  /* Incomplete character: treat as single-byte. */
> ++			  memset (&mbs, '\0', sizeof (mbstate_t));
> ++			  beg++;
> ++			  bytes_left--;
> ++			  continue;
> ++			}
> ++
> ++		      if (mlen == (size_t) -2)
> ++			/* Offset points inside multibyte character:
> ++			 * no good. */
> ++			break;
> ++
> ++		      beg += mlen;
> ++		      bytes_left -= mlen;
> ++		    }
> ++		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> + 	      beg += offset;
> + 	      end = memchr (beg, eol, buflim - beg);
> + 	      end++;
> ++#ifdef MBS_SUPPORT
> ++	      if (mb_cur_max > 1 && bytes_left)
> ++		continue;
> ++#endif /* MBS_SUPPORT */
> + 	      while (beg > buf && beg[-1] != eol)
> + 		--beg;
> + 	    }
> +@@ -469,15 +514,6 @@
> +     } /* for (beg = end ..) */
> +
> +  failure:
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> +-    {
> +-      if (mb_properties)
> +-	free (mb_properties);
> +-      if (match_icase)
> +-	free ((char *) buf);
> +-    }
> +-#endif /* MBS_SUPPORT */
> +   return (size_t) -1;
> +
> +  success_in_beg_and_end:
> +@@ -486,24 +522,144 @@
> +   /* FALLTHROUGH */
> +
> +  success_in_start_and_len:
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> +-    {
> +-      if (mb_properties)
> +-	free (mb_properties);
> +-      if (match_icase)
> +-	free ((char *) buf);
> +-    }
> +-#endif /* MBS_SUPPORT */
> +   *match_size = len;
> +   return start;
> + }
> +
> ++#ifdef MBS_SUPPORT
> ++static int f_i_multibyte; /* whether we're using the new -Fi MB method */
> ++static struct
> ++{
> ++  wchar_t **patterns;
> ++  size_t count, maxlen;
> ++  unsigned char *match;
> ++} Fimb;
> ++#endif
> ++
> + static void
> + Fcompile (char const *pattern, size_t size)
> + {
> ++  int mb_cur_max = MB_CUR_MAX;
> +   char const *beg, *lim, *err;
> +
> ++  check_utf8 ();
> ++#ifdef MBS_SUPPORT
> ++  /* Support -F -i for UTF-8 input. */
> ++  if (match_icase && mb_cur_max > 1)
> ++    {
> ++      mbstate_t mbs;
> ++      wchar_t *wcpattern = xmalloc ((size + 1) * sizeof (wchar_t));
> ++      const char *patternend = pattern;
> ++      size_t wcsize;
> ++      kwset_t fimb_kwset = NULL;
> ++      char *starts = NULL;
> ++      wchar_t *wcbeg, *wclim;
> ++      size_t allocated = 0;
> ++
> ++      memset (&mbs, '\0', sizeof (mbs));
> ++# ifdef __GNU_LIBRARY__
> ++      wcsize = mbsnrtowcs (wcpattern, &patternend, size, size, &mbs);
> ++      if (patternend != pattern + size)
> ++	wcsize = (size_t) -1;
> ++# else
> ++      {
> ++	char *patterncopy = xmalloc (size + 1);
> ++
> ++	memcpy (patterncopy, pattern, size);
> ++	patterncopy[size] = '\0';
> ++	patternend = patterncopy;
> ++	wcsize = mbsrtowcs (wcpattern, &patternend, size, &mbs);
> ++	if (patternend != patterncopy + size)
> ++	  wcsize = (size_t) -1;
> ++	free (patterncopy);
> ++      }
> ++# endif
> ++      if (wcsize + 2 <= 2)
> ++	{
> ++fimb_fail:
> ++	  free (wcpattern);
> ++	  free (starts);
> ++	  if (fimb_kwset)
> ++	    kwsfree (fimb_kwset);
> ++	  free (Fimb.patterns);
> ++	  Fimb.patterns = NULL;
> ++	}
> ++      else
> ++	{
> ++	  if (!(fimb_kwset = kwsalloc (NULL)))
> ++	    error (2, 0, _("memory exhausted"));
> ++
> ++	  starts = xmalloc (mb_cur_max * 3);
> ++	  wcbeg = wcpattern;
> ++	  do
> ++	    {
> ++	      int i;
> ++	      size_t wclen;
> ++
> ++	      if (Fimb.count >= allocated)
> ++		{
> ++		  if (allocated == 0)
> ++		    allocated = 128;
> ++		  else
> ++		    allocated *= 2;
> ++		  Fimb.patterns = xrealloc (Fimb.patterns,
> ++					    sizeof (wchar_t *) * allocated);
> ++		}
> ++	      Fimb.patterns[Fimb.count++] = wcbeg;
> ++	      for (wclim = wcbeg;
> ++		   wclim < wcpattern + wcsize && *wclim != L'\n'; ++wclim)
> ++		*wclim = towlower (*wclim);
> ++	      *wclim = L'\0';
> ++	      wclen = wclim - wcbeg;
> ++	      if (wclen > Fimb.maxlen)
> ++		Fimb.maxlen = wclen;
> ++	      if (wclen > 3)
> ++		wclen = 3;
> ++	      if (wclen == 0)
> ++		{
> ++		  if ((err = kwsincr (fimb_kwset, "", 0)) != 0)
> ++		    error (2, 0, err);
> ++		}
> ++	      else
> ++		for (i = 0; i < (1 << wclen); i++)
> ++		  {
> ++		    char *p = starts;
> ++		    int j, k;
> ++
> ++		    for (j = 0; j < wclen; ++j)
> ++		      {
> ++			wchar_t wc = wcbeg[j];
> ++			if (i & (1 << j))
> ++			  {
> ++			    wc = towupper (wc);
> ++			    if (wc == wcbeg[j])
> ++			      continue;
> ++			  }
> ++			k = wctomb (p, wc);
> ++			if (k <= 0)
> ++			  goto fimb_fail;
> ++			p += k;
> ++		      }
> ++		    if ((err = kwsincr (fimb_kwset, starts, p - starts)) != 0)
> ++		      error (2, 0, err);
> ++		  }
> ++	      if (wclim < wcpattern + wcsize)
> ++		++wclim;
> ++	      wcbeg = wclim;
> ++	    }
> ++	  while (wcbeg < wcpattern + wcsize);
> ++	  f_i_multibyte = 1;
> ++	  kwset = fimb_kwset;
> ++	  free (starts);
> ++	  Fimb.match = xmalloc (Fimb.count);
> ++	  if ((err = kwsprep (kwset)) != 0)
> ++	    error (2, 0, err);
> ++	  return;
> ++	}
> ++    }
> ++#endif /* MBS_SUPPORT */
> ++
> ++
> +   kwsinit ();
> +   beg = pattern;
> +   do
> +@@ -522,6 +678,76 @@
> +     error (2, 0, err);
> + }
> +
> ++#ifdef MBS_SUPPORT
> ++static int
> ++Fimbexec (const char *buf, size_t size, size_t *plen, int exact)
> ++{
> ++  size_t len, letter, i;
> ++  int ret = -1;
> ++  mbstate_t mbs;
> ++  wchar_t wc;
> ++  int patterns_left;
> ++
> ++  assert (match_icase && f_i_multibyte == 1);
> ++  assert (MB_CUR_MAX > 1);
> ++
> ++  memset (&mbs, '\0', sizeof (mbs));
> ++  memset (Fimb.match, '\1', Fimb.count);
> ++  letter = len = 0;
> ++  patterns_left = 1;
> ++  while (patterns_left && len <= size)
> ++    {
> ++      size_t c;
> ++
> ++      patterns_left = 0;
> ++      if (len < size)
> ++	{
> ++	  c = mbrtowc (&wc, buf + len, size - len, &mbs);
> ++	  if (c + 2 <= 2)
> ++	    return ret;
> ++
> ++	  wc = towlower (wc);
> ++	}
> ++      else
> ++	{
> ++	  c = 1;
> ++	  wc = L'\0';
> ++	}
> ++
> ++      for (i = 0; i < Fimb.count; i++)
> ++	{
> ++	  if (Fimb.match[i])
> ++	    {
> ++	      if (Fimb.patterns[i][letter] == L'\0')
> ++		{
> ++		  /* Found a match. */
> ++		  *plen = len;
> ++		  if (!exact && !match_words)
> ++		    return 0;
> ++		  else
> ++		    {
> ++		      /* For -w or exact look for longest match.  */
> ++		      ret = 0;
> ++		      Fimb.match[i] = '\0';
> ++		      continue;
> ++		    }
> ++		}
> ++
> ++	      if (Fimb.patterns[i][letter] == wc)
> ++		patterns_left = 1;
> ++	      else
> ++		Fimb.match[i] = '\0';
> ++	    }
> ++	}
> ++
> ++      len += c;
> ++      letter++;
> ++    }
> ++
> ++  return ret;
> ++}
> ++#endif /* MBS_SUPPORT */
> ++
> + static size_t
> + Fexecute (char const *buf, size_t size, size_t *match_size, int exact)
> + {
> +@@ -531,80 +757,258 @@
> +   struct kwsmatch kwsmatch;
> +   size_t ret_val;
> + #ifdef MBS_SUPPORT
> +-  char *mb_properties = NULL;
> +-  if (MB_CUR_MAX > 1)
> +-    {
> +-      if (match_icase)
> +-        {
> +-          char *case_buf = xmalloc(size);
> +-          memcpy(case_buf, buf, size);
> +-          buf = case_buf;
> +-        }
> +-      mb_properties = check_multibyte_string(buf, size);
> +-    }
> ++  int mb_cur_max = MB_CUR_MAX;
> ++  mbstate_t mbs;
> ++  memset (&mbs, '\0', sizeof (mbstate_t));
> ++  const char *last_char = NULL;
> + #endif /* MBS_SUPPORT */
> +
> +   for (beg = buf; beg <= buf + size; ++beg)
> +     {
> +-      size_t offset = kwsexec (kwset, beg, buf + size - beg, &kwsmatch);
> ++      size_t offset;
> ++      offset = kwsexec (kwset, beg, buf + size - beg, &kwsmatch);
> ++
> +       if (offset == (size_t) -1)
> + 	goto failure;
> + #ifdef MBS_SUPPORT
> +-      if (MB_CUR_MAX > 1 && mb_properties[offset+beg-buf] == 0)
> +-	continue; /* It is a part of multibyte character.  */
> ++      if (mb_cur_max > 1 && !using_utf8)
> ++	{
> ++	  size_t bytes_left = offset;
> ++	  while (bytes_left)
> ++	    {
> ++	      size_t mlen = mbrlen (beg, bytes_left, &mbs);
> ++
> ++	      last_char = beg;
> ++	      if (mlen == (size_t) -1 || mlen == 0)
> ++		{
> ++		  /* Incomplete character: treat as single-byte. */
> ++		  memset (&mbs, '\0', sizeof (mbstate_t));
> ++		  beg++;
> ++		  bytes_left--;
> ++		  continue;
> ++		}
> ++
> ++	      if (mlen == (size_t) -2)
> ++		/* Offset points inside multibyte character: no good. */
> ++		break;
> ++
> ++	      beg += mlen;
> ++	      bytes_left -= mlen;
> ++	    }
> ++
> ++	  if (bytes_left)
> ++	    continue;
> ++	}
> ++      else
> + #endif /* MBS_SUPPORT */
> +       beg += offset;
> ++#ifdef MBS_SUPPORT
> ++      /* For f_i_multibyte, the string at beg now matches first 3 chars of
> ++	 one of the search strings (less if there are shorter search strings).
> ++	 See if this is a real match.  */
> ++      if (f_i_multibyte
> ++	  && Fimbexec (beg, buf + size - beg, &kwsmatch.size[0], exact))
> ++	goto next_char;
> ++#endif /* MBS_SUPPORT */
> +       len = kwsmatch.size[0];
> +       if (exact && !match_words)
> + 	goto success_in_beg_and_len;
> +       if (match_lines)
> + 	{
> + 	  if (beg > buf && beg[-1] != eol)
> +-	    continue;
> ++	    goto next_char;
> + 	  if (beg + len < buf + size && beg[len] != eol)
> +-	    continue;
> ++	    goto next_char;
> + 	  goto success;
> + 	}
> +       else if (match_words)
> +-	for (try = beg; len; )
> +-	  {
> +-	    if (try > buf && WCHAR((unsigned char) try[-1]))
> +-	      break;
> +-	    if (try + len < buf + size && WCHAR((unsigned char) try[len]))
> +-	      {
> +-		offset = kwsexec (kwset, beg, --len, &kwsmatch);
> +-		if (offset == (size_t) -1)
> +-		  {
> ++	{
> ++	  while (len)
> ++	    {
> ++	      int word_match = 0;
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
> ++			  s = beg - 1;
> ++			  while (s > buf
> ++				 && (unsigned char) *s >= 0x80
> ++				 && (unsigned char) *s <= 0xbf)
> ++			    --s;
> ++			}
> ++		      else
> ++			s = last_char;
> ++		      mr = mbtowc (&pwc, s, beg - s);
> ++		      if (mr <= 0)
> ++			memset (&mbs, '\0', sizeof (mbstate_t));
> ++		      else if ((iswalnum (pwc) || pwc == L'_')
> ++			       && mr == (int) (beg - s))
> ++			goto next_char;
> ++		    }
> ++		  else
> + #endif /* MBS_SUPPORT */
> +-		    return offset;
> +-		  }
> +-		try = beg + offset;
> +-		len = kwsmatch.size[0];
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
> ++		  mr = mbtowc (&nwc, beg + len, buf + size - beg - len);
> ++		  if (mr <= 0)
> ++		    {
> ++		      memset (&mbs, '\0', sizeof (mbstate_t));
> ++		      word_match = 1;
> ++		    }
> ++		  else if (!iswalnum (nwc) && nwc != L'_')
> ++		    word_match = 1;
> ++		}
> ++	      else
> ++#endif /* MBS_SUPPORT */
> ++		if (beg + len >= buf + size || !WCHAR ((unsigned char) beg[len]))
> ++		  word_match = 1;
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
> ++		  offset = kwsexec (kwset, beg, len, &kwsmatch);
> ++
> ++		  if (offset == -1)
> ++		    goto next_char; /* Try a different anchor. */
> ++#ifdef MBS_SUPPORT
> ++		  if (mb_cur_max > 1 && !using_utf8)
> ++		    {
> ++		      size_t bytes_left = offset;
> ++		      while (bytes_left)
> ++			{
> ++			  size_t mlen = mbrlen (beg, bytes_left, &mbs);
> ++
> ++			  last_char = beg;
> ++			  if (mlen == (size_t) -1 || mlen == 0)
> ++			    {
> ++			      /* Incomplete character: treat as single-byte. */
> ++			      memset (&mbs, '\0', sizeof (mbstate_t));
> ++			      beg++;
> ++			      bytes_left--;
> ++			      continue;
> ++			    }
> ++
> ++			  if (mlen == (size_t) -2)
> ++			    {
> ++			      /* Offset points inside multibyte character:
> ++			       * no good. */
> ++			      break;
> ++			    }
> ++
> ++			  beg += mlen;
> ++			  bytes_left -= mlen;
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
> ++		  beg += offset;
> ++#ifdef MBS_SUPPORT
> ++		  /* The string at beg now matches first 3 chars of one of
> ++		     the search strings (less if there are shorter search
> ++		     strings).  See if this is a real match.  */
> ++		  if (f_i_multibyte
> ++		      && Fimbexec (beg, len - offset, &kwsmatch.size[0],
> ++				   exact))
> ++		    goto next_char;
> ++#endif /* MBS_SUPPORT */
> ++		  len = kwsmatch.size[0];
> ++		}
> ++	    }
> ++	}
> +       else
> + 	goto success;
> ++next_char:;
> ++#ifdef MBS_SUPPORT
> ++      /* Advance to next character.  For MB_CUR_MAX == 1 case this is handled
> ++	 by ++beg above.  */
> ++      if (mb_cur_max > 1)
> ++	{
> ++	  if (using_utf8)
> ++	    {
> ++	      unsigned char c = *beg;
> ++	      if (c >= 0xc2)
> ++		{
> ++		  if (c < 0xe0)
> ++		    ++beg;
> ++		  else if (c < 0xf0)
> ++		    beg += 2;
> ++		  else if (c < 0xf8)
> ++		    beg += 3;
> ++		  else if (c < 0xfc)
> ++		    beg += 4;
> ++		  else if (c < 0xfe)
> ++		    beg += 5;
> ++		}
> ++	    }
> ++	  else
> ++	    {
> ++	      size_t l = mbrlen (beg, buf + size - beg, &mbs);
> ++
> ++	      last_char = beg;
> ++	      if (l + 2 >= 2)
> ++		beg += l - 1;
> ++	      else
> ++		memset (&mbs, '\0', sizeof (mbstate_t));
> ++	    }
> ++	}
> ++#endif /* MBS_SUPPORT */
> +     }
> +
> +  failure:
> ++  return -1;
> ++
> ++ success:
> + #ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> ++  if (mb_cur_max > 1 && !using_utf8)
> +     {
> +-      if (match_icase)
> +-        free((char *) buf);
> +-      if (mb_properties)
> +-        free(mb_properties);
> ++      end = beg + len;
> ++      while (end < buf + size)
> ++	{
> ++	  size_t mlen = mbrlen (end, buf + size - end, &mbs);
> ++	  if (mlen == (size_t) -1 || mlen == (size_t) -2 || mlen == 0)
> ++	    {
> ++	      memset (&mbs, '\0', sizeof (mbstate_t));
> ++	      mlen = 1;
> ++	    }
> ++	  if (mlen == 1 && *end == eol)
> ++	    break;
> ++
> ++	  end += mlen;
> ++	}
> +     }
> ++  else
> + #endif /* MBS_SUPPORT */
> +-  return -1;
> +-
> +- success:
> +   end = memchr (beg + len, eol, (buf + size) - (beg + len));
> ++
> +   end++;
> +   while (buf < beg && beg[-1] != eol)
> +     --beg;
> +@@ -613,15 +1017,6 @@
> +
> +  success_in_beg_and_len:
> +   *match_size = len;
> +-#ifdef MBS_SUPPORT
> +-  if (MB_CUR_MAX > 1)
> +-    {
> +-      if (mb_properties)
> +-	free (mb_properties);
> +-      if (match_icase)
> +-	free ((char *) buf);
> +-    }
> +-#endif /* MBS_SUPPORT */
> +   return beg - buf;
> + }
> +
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-fgrep.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-fgrep.patch
> new file mode 100644
> index 0000000..c7f8f96
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-fgrep.patch
> @@ -0,0 +1,145 @@
> +--- grep-2.5.1/src/search.c.fgrep	2001-04-19 04:42:14.000000000 +0100
> ++++ grep-2.5.1/src/search.c	2004-02-26 13:09:32.000000000 +0000
> +@@ -360,13 +360,7 @@
> + 	      /* Find a possible match using the KWset matcher. */
> + 	      size_t offset = kwsexec (kwset, beg, buflim - beg, &kwsm);
> + 	      if (offset == (size_t) -1)
> +-		{
> +-#ifdef MBS_SUPPORT
> +-		  if (MB_CUR_MAX > 1)
> +-		    free(mb_properties);
> +-#endif
> +-		  return (size_t)-1;
> +-		}
> ++	        goto failure;
> + 	      beg += offset;
> + 	      /* Narrow down to the line containing the candidate, and
> + 		 run it through DFA. */
> +@@ -379,7 +373,7 @@
> + 	      while (beg > buf && beg[-1] != eol)
> + 		--beg;
> + 	      if (kwsm.index < kwset_exact_matches)
> +-		goto success;
> ++		goto success_in_beg_and_end;
> + 	      if (dfaexec (&dfa, beg, end - beg, &backref) == (size_t) -1)
> + 		continue;
> + 	    }
> +@@ -398,7 +392,7 @@
> + 	    }
> + 	  /* Successful, no backreferences encountered! */
> + 	  if (!backref)
> +-	    goto success;
> ++	    goto success_in_beg_and_end;
> + 	}
> +       else
> + 	end = beg + size;
> +@@ -413,14 +407,11 @@
> + 				       end - beg - 1, &(patterns[i].regs))))
> + 	    {
> + 	      len = patterns[i].regs.end[0] - start;
> +-	      if (exact)
> +-		{
> +-		  *match_size = len;
> +-		  return start;
> +-		}
> ++	      if (exact && !match_words)
> ++	        goto success_in_start_and_len;
> + 	      if ((!match_lines && !match_words)
> + 		  || (match_lines && len == end - beg - 1))
> +-		goto success;
> ++		goto success_in_beg_and_end;
> + 	      /* If -w, check if the match aligns with word boundaries.
> + 		 We do this iteratively because:
> + 		 (a) the line may contain more than one occurence of the
> +@@ -434,7 +425,7 @@
> + 		    if ((start == 0 || !WCHAR ((unsigned char) beg[start - 1]))
> + 			&& (len == end - beg - 1
> + 			    || !WCHAR ((unsigned char) beg[start + len])))
> +-		      goto success;
> ++		      goto success_in_beg_and_end;
> + 		    if (len > 0)
> + 		      {
> + 			/* Try a shorter length anchored at the same place. */
> +@@ -461,19 +452,26 @@
> + 	    }
> + 	} /* for Regex patterns.  */
> +     } /* for (beg = end ..) */
> ++
> ++ failure:
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1 && mb_properties)
> +     free (mb_properties);
> + #endif /* MBS_SUPPORT */
> +   return (size_t) -1;
> +
> +- success:
> ++ success_in_beg_and_end:
> ++  len = end - beg;
> ++  start = beg - buf;
> ++  /* FALLTHROUGH */
> ++
> ++ success_in_start_and_len:
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1 && mb_properties)
> +     free (mb_properties);
> + #endif /* MBS_SUPPORT */
> +-  *match_size = end - beg;
> +-  return beg - buf;
> ++  *match_size = len;
> ++  return start;
> + }
> +
> + static void
> +@@ -516,28 +514,15 @@
> +     {
> +       size_t offset = kwsexec (kwset, beg, buf + size - beg, &kwsmatch);
> +       if (offset == (size_t) -1)
> +-	{
> +-#ifdef MBS_SUPPORT
> +-	  if (MB_CUR_MAX > 1)
> +-	    free(mb_properties);
> +-#endif /* MBS_SUPPORT */
> +-	  return offset;
> +-	}
> ++	goto failure;
> + #ifdef MBS_SUPPORT
> +       if (MB_CUR_MAX > 1 && mb_properties[offset+beg-buf] == 0)
> + 	continue; /* It is a part of multibyte character.  */
> + #endif /* MBS_SUPPORT */
> +       beg += offset;
> +       len = kwsmatch.size[0];
> +-      if (exact)
> +-	{
> +-	  *match_size = len;
> +-#ifdef MBS_SUPPORT
> +-	  if (MB_CUR_MAX > 1)
> +-	    free (mb_properties);
> +-#endif /* MBS_SUPPORT */
> +-	  return beg - buf;
> +-	}
> ++      if (exact && !match_words)
> ++	goto success_in_beg_and_len;
> +       if (match_lines)
> + 	{
> + 	  if (beg > buf && beg[-1] != eol)
> +@@ -551,6 +536,7 @@
> + 	goto success;
> +     }
> +
> ++ failure:
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1)
> +     free (mb_properties);
> +@@ -583,7 +569,11 @@
> +   end++;
> +   while (buf < beg && beg[-1] != eol)
> +     --beg;
> +-  *match_size = end - beg;
> ++  len = end - beg;
> ++  /* FALLTHROUGH */
> ++
> ++ success_in_beg_and_len:
> ++  *match_size = len;
> + #ifdef MBS_SUPPORT
> +   if (MB_CUR_MAX > 1)
> +     free (mb_properties);
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-icolor.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-icolor.patch
> new file mode 100644
> index 0000000..14b2617
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-icolor.patch
> @@ -0,0 +1,36 @@
> +--- grep-2.5.1a/src/grep.c.icolor	2005-01-07 12:05:20.877785250 +0000
> ++++ grep-2.5.1a/src/grep.c	2005-01-07 12:05:44.690194388 +0000
> +@@ -564,33 +564,6 @@
> +     {
> +       size_t match_size;
> +       size_t match_offset;
> +-      if(match_icase)
> +-        {
> +-	  /* Yuck, this is tricky */
> +-          char *buf = (char*) xmalloc (lim - beg);
> +-	  char *ibeg = buf;
> +-	  char *ilim = ibeg + (lim - beg);
> +-	  int i;
> +-	  for (i = 0; i < lim - beg; i++)
> +-	    ibeg[i] = tolower (beg[i]);
> +-	  while ((match_offset = (*execute) (ibeg, ilim-ibeg, &match_size, 1))
> +-		 != (size_t) -1)
> +-	    {
> +-	      char const *b = beg + match_offset;
> +-	      if (b == lim)
> +-		break;
> +-	      fwrite (beg, sizeof (char), match_offset, stdout);
> +-	      printf ("\33[%sm", grep_color);
> +-	      fwrite (b, sizeof (char), match_size, stdout);
> +-	      fputs ("\33[00m", stdout);
> +-	      beg = b + match_size;
> +-	      ibeg = ibeg + match_offset + match_size;
> +-	    }
> +-	  fwrite (beg, 1, lim - beg, stdout);
> +-	  free (buf);
> +-	  lastout = lim;
> +-	  return;
> +-	}
> +       while (lim-beg && (match_offset = (*execute) (beg, lim - beg, &match_size, 1))
> + 	     != (size_t) -1)
> + 	{
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-manpage.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-manpage.patch
> new file mode 100644
> index 0000000..284f0c4
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-manpage.patch
> @@ -0,0 +1,19 @@
> +--- grep-2.5.1/doc/grep.1.manpage	2002-01-22 13:20:04.000000000 +0000
> ++++ grep-2.5.1/doc/grep.1	2003-10-08 09:37:32.000000000 +0100
> +@@ -191,6 +191,7 @@
> + .I PATTERN
> + as a list of fixed strings, separated by newlines,
> + any of which is to be matched.
> ++.TP
> + .BR \-P ", " \-\^\-perl-regexp
> + Interpret
> + .I PATTERN
> +@@ -302,7 +303,7 @@
> + This is especially useful for tools like zgrep, e.g.
> + .B "gzip -cd foo.gz |grep --label=foo something"
> + .TP
> +-.BR \-\^\-line-buffering
> ++.BR \-\^\-line-buffered
> + Use line buffering, it can be a performance penality.
> + .TP
> + .BR \-q ", " \-\^\-quiet ", " \-\^\-silent
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-oi.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-oi.patch
> new file mode 100644
> index 0000000..eb997ad
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-oi.patch
> @@ -0,0 +1,48 @@
> +--- grep-2.5.1/lib/posix/regex.h.oi	2004-01-05 12:09:12.984391131 +0000
> ++++ grep-2.5.1/lib/posix/regex.h	2004-01-05 12:09:24.717990622 +0000
> +@@ -109,6 +109,10 @@
> +    If not set, \{, \}, {, and } are literals.  */
> + #define RE_INTERVALS (RE_HAT_LISTS_NOT_NEWLINE << 1)
> +
> ++/* If this bit is set, then ignore case when matching.
> ++   If not set, then case is significant.  */
> ++#define RE_ICASE (RE_INVALID_INTERVAL_ORD << 1)
> ++
> + /* If this bit is set, +, ? and | aren't recognized as operators.
> +    If not set, they are.  */
> + #define RE_LIMITED_OPS (RE_INTERVALS << 1)
> +--- grep-2.5.1/src/search.c.oi	2004-01-05 12:07:00.550199415 +0000
> ++++ grep-2.5.1/src/search.c	2004-01-05 12:07:00.566197505 +0000
> +@@ -31,7 +31,7 @@
> +
> + #include "system.h"
> + #include "grep.h"
> +-#include "regex.h"
> ++#include <regex.h>
> + #include "dfa.h"
> + #include "kwset.h"
> + #include "error.h"
> +@@ -190,7 +190,7 @@
> +   size_t total = size;
> +   char const *motif = pattern;
> +
> +-  re_set_syntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE);
> ++  re_set_syntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE | (match_icase ? RE_ICASE : 0));
> +   dfasyntax (RE_SYNTAX_GREP | RE_HAT_LISTS_NOT_NEWLINE, match_icase, eolbyte);
> +
> +   /* For GNU regex compiler we have to pass the patterns separately to detect
> +@@ -268,12 +268,12 @@
> +
> +   if (strcmp (matcher, "awk") == 0)
> +     {
> +-      re_set_syntax (RE_SYNTAX_AWK);
> ++      re_set_syntax (RE_SYNTAX_AWK | (match_icase ? RE_ICASE : 0));
> +       dfasyntax (RE_SYNTAX_AWK, match_icase, eolbyte);
> +     }
> +   else
> +     {
> +-      re_set_syntax (RE_SYNTAX_POSIX_EGREP);
> ++      re_set_syntax (RE_SYNTAX_POSIX_EGREP | (match_icase ? RE_ICASE : 0));
> +       dfasyntax (RE_SYNTAX_POSIX_EGREP, match_icase, eolbyte);
> +     }
> +
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-tests.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-tests.patch
> new file mode 100644
> index 0000000..2934a21
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-tests.patch
> @@ -0,0 +1,138 @@
> +--- grep-2.5.1/tests/Makefile.am.jj	2001-03-07 05:11:27.000000000 +0100
> ++++ grep-2.5.1/tests/Makefile.am	2004-12-31 11:42:41.595492300 +0100
> +@@ -3,7 +3,8 @@
> + AWK=@AWK@
> +
> + TESTS = warning.sh khadafy.sh spencer1.sh bre.sh ere.sh \
> +-        status.sh empty.sh options.sh backref.sh file.sh
> ++        status.sh empty.sh options.sh backref.sh file.sh \
> ++        fmbtest.sh
> + EXTRA_DIST = $(TESTS) \
> +              khadafy.lines khadafy.regexp \
> +              spencer1.awk spencer1.tests \
> +--- grep-2.5.1/tests/fmbtest.sh	2004-12-31 13:30:23.942871250 +0100
> ++++ grep-2.5.1/tests/fmbtest.sh	2004-12-31 14:09:13.219463855 +0100
> +@@ -0,0 +1,111 @@
> ++#!/bin/sh
> ++
> ++: ${srcdir=.}
> ++
> ++# If cs_CZ.UTF-8 locale doesn't work, skip this test silently
> ++LC_ALL=cs_CZ.UTF-8 locale -k LC_CTYPE 2>/dev/null | ${GREP} -q charmap.*UTF-8 \
> ++  || exit 77
> ++
> ++failures=0
> ++
> ++cat > csinput <<EOF
> ++01 Žluťoučká číše
> ++Čí� E 02
> ++03 Z číší Čiší cosi
> ++04 Čí
> ++� e 05
> ++06 ČČČČČČČíšČÍ� číš
> ++07 ČČČ ČČČČíšČÍ� číšEEEE
> ++čAs 08
> ++09Čapka
> ++10ČaSy se měnÍ
> ++ČÍšE11
> ++Čas12
> ++𝇕ČÍšE𝇓13
> ++ŽČÍšE𝇓14
> ++𝇕ČÍšEŽ15
> ++ŽČÍšEŽ16
> ++ČÍšE𝇓17
> ++ČÍšEŽ18
> ++19𝇕ČÍše
> ++20ŽČÍše
> ++EOF
> ++cat > cspatfile <<EOF
> ++ČÍšE
> ++Čas
> ++EOF
> ++
> ++for mode in F G E; do
> ++
> ++test1="$(echo `LC_ALL=cs_CZ.UTF-8 ${GREP} -${mode} -f cspatfile csinput \
> ++	       | LC_ALL=C sed 's/^.*\([0-9][0-9]\).*$/\1/'`)"
> ++if test "$test1" != "11 12 13 14 15 16 17 18"; then
> ++  echo "Test #1 ${mode} failed: $test1"
> ++  failures=1
> ++fi
> ++
> ++test2="$(echo `LC_ALL=cs_CZ.UTF-8 ${GREP} -${mode}i -f cspatfile csinput \
> ++	       | LC_ALL=C sed 's/^.*\([0-9][0-9]\).*$/\1/'`)"
> ++if test "$test2" != "01 02 07 08 10 11 12 13 14 15 16 17 18 19 20"; then
> ++  echo "Test #2 ${mode} failed: $test2"
> ++  failures=1
> ++fi
> ++
> ++test3="$(echo `LC_ALL=cs_CZ.UTF-8 ${GREP} -${mode}i -e 'ČÍšE' -e 'Čas' csinput \
> ++	       | LC_ALL=C sed 's/^.*\([0-9][0-9]\).*$/\1/'`)"
> ++if test "$test3" != "01 02 07 08 10 11 12 13 14 15 16 17 18 19 20"; then
> ++  echo "Test #3 ${mode} failed: $test3"
> ++  failures=1
> ++fi
> ++
> ++test4="$(echo `LC_ALL=cs_CZ.UTF-8 ${GREP} -${mode}iw -f cspatfile csinput \
> ++	       | LC_ALL=C sed 's/^.*\([0-9][0-9]\).*$/\1/'`)"
> ++if test "$test4" != "01 02 08 13 17 19"; then
> ++  echo "Test #4 ${mode} failed: $test4"
> ++  failures=1
> ++fi
> ++
> ++done
> ++
> ++# Test that -F --color=always prefers longer matches.
> ++test5="`echo 'Cosi tu ČišÍ...' \
> ++	| LC_ALL=cs_CZ.UTF-8 ${GREP} --color=always -Fi -e 'čiš' -e 'čiší'`"
> ++if echo "$test5" | LC_ALL=C ${GREP} -q 'Cosi tu .*\[.*mČišÍ.*\[.*m\(.\[K\)\?\.\.\.'; then
> ++  :
> ++else
> ++  echo "Test #5 F failed: $test5"
> ++  failures=1
> ++fi
> ++
> ++for mode in G E; do
> ++
> ++# Test that -{G,E} --color=always prefers earlier pattern matches.
> ++test6="`echo 'Cosi tu ČišÍ...' \
> ++	| LC_ALL=cs_CZ.UTF-8 ${GREP} --color=always -${mode}i -e 'čiš' -e 'čiší'`"
> ++if echo "$test6" | LC_ALL=C ${GREP} -q 'Cosi tu .*\[.*mČiš.*\[.*m\(.\[K\)\?Í\.\.\.'; then
> ++  :
> ++else
> ++  echo "Test #6 ${mode} failed: $test6"
> ++  failures=1
> ++fi
> ++
> ++# Test that -{G,E} --color=always prefers earlier pattern matches.
> ++test7="`echo 'Cosi tu ČišÍ...' \
> ++	| LC_ALL=cs_CZ.UTF-8 ${GREP} --color=always -${mode}i -e 'čiší' -e 'čiš'`"
> ++if echo "$test7" | LC_ALL=C ${GREP} -q 'Cosi tu .*\[.*mČišÍ.*\[.*m\(.\[K\)\?\.\.\.'; then
> ++  :
> ++else
> ++  echo "Test #7 ${mode} failed: $test7"
> ++  failures=1
> ++fi
> ++
> ++test8="$(echo `LC_ALL=cs_CZ.UTF-8 ${GREP} -${mode}i -e 'Č.šE' -e 'Č[a-f]s' csinput \
> ++	       | LC_ALL=C sed 's/^.*\([0-9][0-9]\).*$/\1/'`)"
> ++if test "$test8" != "01 02 07 08 10 11 12 13 14 15 16 17 18 19 20"; then
> ++  echo "Test #8 ${mode} failed: $test8"
> ++  failures=1
> ++fi
> ++
> ++done
> ++
> ++exit $failures
> +--- grep-2.5.1/tests/Makefile.in.jj	2004-12-31 11:42:53.000000000 +0100
> ++++ grep-2.5.1/tests/Makefile.in	2004-12-31 11:43:36.871514505 +0100
> +@@ -97,7 +97,8 @@ install_sh = @install_sh@
> + AWK = @AWK@
> +
> + TESTS = warning.sh khadafy.sh spencer1.sh bre.sh ere.sh \
> +-        status.sh empty.sh options.sh backref.sh file.sh
> ++        status.sh empty.sh options.sh backref.sh file.sh \
> ++	fmbtest.sh
> +
> + EXTRA_DIST = $(TESTS) \
> +              khadafy.lines khadafy.regexp \
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-w.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-w.patch
> new file mode 100644
> index 0000000..79ae2ae
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-2.5.1-w.patch
> @@ -0,0 +1,121 @@
> +--- grep-2.5.1a/src/search.c.w	2006-02-20 14:27:27.000000000 +0000
> ++++ grep-2.5.1a/src/search.c	2006-02-20 14:32:07.000000000 +0000
> +@@ -507,10 +507,114 @@
> + 	      if (match_words)
> + 		while (start >= 0)
> + 		  {
> +-		    if ((start == 0 || !WCHAR ((unsigned char) beg[start - 1]))
> +-			&& (len == end - beg - 1
> +-			    || !WCHAR ((unsigned char) beg[start + len])))
> +-		      goto success_in_beg_and_end;
> ++		    int lword_match = 0;
> ++		    if (start == 0)
> ++		      lword_match = 1;
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
> ++			       before the match position (== beg + start). */
> ++			    if (using_utf8)
> ++			      {
> ++				/* UTF-8 is a special case: scan backwards
> ++				   until we find a 7-bit character or a
> ++				   lead byte. */
> ++				s = beg + start - 1;
> ++				while (s > buf
> ++				       && (unsigned char) *s >= 0x80
> ++				       && (unsigned char) *s <= 0xbf)
> ++				  --s;
> ++			      }
> ++			    else
> ++			      {
> ++				/* Scan forwards to find the start of the
> ++				   last complete character before the
> ++				   match position.  */
> ++				size_t bytes_left = start - 1;
> ++				s = beg;
> ++				while (bytes_left > 0)
> ++				  {
> ++				    mr = mbrlen (s, bytes_left, &mbs);
> ++				    if (mr == (size_t) -1 || mr == 0)
> ++				      {
> ++					memset (&mbs, '\0', sizeof (mbs));
> ++					s++;
> ++					bytes_left--;
> ++					continue;
> ++				      }
> ++				    if (mr == (size_t) -2)
> ++				      {
> ++					memset (&mbs, '\0', sizeof (mbs));
> ++					break;
> ++				      }
> ++				    s += mr;
> ++				    bytes_left -= mr;
> ++				  }
> ++			      }
> ++			    mr = mbrtowc (&pwc, s, beg + start - s, &mbs);
> ++			    if (mr == (size_t) -2 || mr == (size_t) -1 ||
> ++				mr == 0)
> ++			      {
> ++				memset (&mbs, '\0', sizeof (mbstate_t));
> ++				lword_match = 1;
> ++			      }
> ++			    else if (!(iswalnum (pwc) || pwc == L'_')
> ++				     && mr == beg + start - s)
> ++			      lword_match = 1;
> ++			  }
> ++			else
> ++#endif /* MBS_SUPPORT */
> ++			if (!WCHAR ((unsigned char) beg[start - 1]))
> ++			  lword_match = 1;
> ++		      }
> ++
> ++		    if (lword_match)
> ++		      {
> ++			int rword_match = 0;
> ++			if (start + len == end - beg - 1)
> ++			  rword_match = 1;
> ++			else
> ++			  {
> ++#ifdef MBS_SUPPORT
> ++			    if (mb_cur_max > 1)
> ++			      {
> ++				wchar_t nwc;
> ++				int mr;
> ++
> ++				mr = mbtowc (&nwc, beg + start + len,
> ++					     end - beg - start - len - 1);
> ++				if (mr <= 0)
> ++				  {
> ++				    memset (&mbs, '\0', sizeof (mbstate_t));
> ++				    rword_match = 1;
> ++				  }
> ++				else if (!iswalnum (nwc) && nwc != L'_')
> ++				  rword_match = 1;
> ++			      }
> ++			    else
> ++#endif /* MBS_SUPPORT */
> ++			    if (!WCHAR ((unsigned char) beg[start + len]))
> ++			      rword_match = 1;
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
> + 			/* Try a shorter length anchored at the same place. */
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-P.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-P.patch
> new file mode 100644
> index 0000000..9dca4ad
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-P.patch
> @@ -0,0 +1,14 @@
> +--- grep-2.5.1a/src/search.c.P	2006-02-03 14:08:00.000000000 +0000
> ++++ grep-2.5.1a/src/search.c	2006-02-03 14:11:20.000000000 +0000
> +@@ -1234,8 +1234,9 @@
> +       char eol = eolbyte;
> +       if (!exact)
> + 	{
> +-	  end = memchr (end, eol, buflim - end);
> +-	  end++;
> ++	  while (end < buflim)
> ++	    if (*end++ == eol)
> ++	      break;
> + 	  while (buf < beg && beg[-1] != eol)
> + 	    --beg;
> + 	}
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-bz434934.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-bz434934.patch
> new file mode 100644
> index 0000000..677e586
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-bz434934.patch
> @@ -0,0 +1,17 @@
> +2009-01-26  Stepan Kasal  <skasal@redhat.com>
> +
> +	* src/grep.c (prpending) fix off-by-one error in the execute call;
> +	also in upstream, see https://savannah.gnu.org/patch/?3840
> +
> +
> +--- grep-2.5.1/src/grep.c	2009-01-26 15:31:11.404091000 +0100
> ++++ grep-2.5.1/src/grep.c	2009-01-26 16:29:42.821903000 +0100
> +@@ -635,7 +635,7 @@
> +       size_t match_size;
> +       --pending;
> +       if (outleft
> +-	  || (((*execute) (lastout, nl - lastout, &match_size, 0) == (size_t) -1)
> ++	  || (((*execute) (lastout, nl + 1 - lastout, &match_size, 0) == (size_t) -1)
> + 	      == !out_invert))
> + 	prline (lastout, nl + 1, '-');
> +       else
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-bz460641.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-bz460641.patch
> new file mode 100644
> index 0000000..cd826f8
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-bz460641.patch
> @@ -0,0 +1,11 @@
> +--- grep-2.5.1a/src/search.c.bz460641	2009-01-26 15:17:19.227844000 +0100
> ++++ grep-2.5.1a/src/search.c	2009-01-26 15:29:34.585838000 +0100
> +@@ -900,7 +900,7 @@
> +   const char *last_char = NULL;
> + #endif /* MBS_SUPPORT */
> +
> +-  for (beg = buf; beg <= buf + size; ++beg)
> ++  for (beg = buf; beg < buf + size; ++beg)
> +     {
> +       size_t offset;
> +       offset = kwsexec (kwset, beg, buf + size - beg, &kwsmatch);
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-empty-pattern.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-empty-pattern.patch
> new file mode 100644
> index 0000000..acb702a
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-empty-pattern.patch
> @@ -0,0 +1,36 @@
> +--- grep-2.5.1a/src/grep.c.empty-pattern	2006-11-22 19:05:43.000000000 +0000
> ++++ grep-2.5.1a/src/grep.c	2006-11-22 19:22:04.000000000 +0000
> +@@ -1667,9 +1667,6 @@
> + 	  out_invert ^= 1;
> + 	  match_lines = match_words = 0;
> + 	}
> +-      else
> +-	/* Strip trailing newline. */
> +-        --keycc;
> +     }
> +   else
> +     if (optind < argc)
> +--- grep-2.5.1a/src/search.c.empty-pattern	2006-11-22 19:21:11.000000000 +0000
> ++++ grep-2.5.1a/src/search.c	2006-11-22 19:35:06.000000000 +0000
> +@@ -204,6 +204,10 @@
> +       motif = sep;
> +     } while (sep && total != 0);
> +
> ++  /* Strip trailing newline. */
> ++  if (size && pattern[size - 1] == '\n')
> ++    size--;
> ++
> +   /* In the match_words and match_lines cases, we use a different pattern
> +      for the DFA matcher that will quickly throw out cases that won't work.
> +      Then if DFA succeeds we do some hairy stuff using the regex matcher
> +@@ -288,6 +292,10 @@
> +       motif = sep;
> +     } while (sep && total != 0);
> +
> ++  /* Strip trailing newline. */
> ++  if (size && pattern[size - 1] == '\n')
> ++    size--;
> ++
> +   /* In the match_words and match_lines cases, we use a different pattern
> +      for the DFA matcher that will quickly throw out cases that won't work.
> +      Then if DFA succeeds we do some hairy stuff using the regex matcher
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-man-label.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-man-label.patch
> new file mode 100644
> index 0000000..316e577
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-man-label.patch
> @@ -0,0 +1,22 @@
> +--- grep-2.5.1a/doc/grep.texi.man-label	2004-11-12 12:26:48.000000000 +0100
> ++++ grep-2.5.1a/doc/grep.texi	2009-05-07 16:23:45.050654000 +0200
> +@@ -364,7 +364,7 @@
> + @cindex changing name of standard input
> + Displays input actually coming from standard input as input coming from file
> + @var{LABEL}. This is especially useful for tools like zgrep, e.g.
> +-@command{gzip -cd foo.gz |grep --label=foo something}
> ++@command{gzip -cd foo.gz |grep -H --label=foo something}
> +
> + @item -L
> + @itemx --files-without-match
> +--- grep-2.5.1a/doc/grep.1.man-label	2009-05-07 16:19:48.856815000 +0200
> ++++ grep-2.5.1a/doc/grep.1	2009-05-07 16:26:12.847116000 +0200
> +@@ -301,7 +301,7 @@
> + Displays input actually coming from standard input as input coming from file
> + .I LABEL.
> + This is especially useful for tools like zgrep, e.g.
> +-.B "gzip -cd foo.gz |grep --label=foo something"
> ++.B "gzip -cd foo.gz |grep -H --label=foo something"
> + .TP
> + .BR \-\^\-line-buffered
> + Use line buffering, it can be a performance penality.
> diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-skip.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-skip.patch
> new file mode 100644
> index 0000000..fb6645f
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-skip.patch
> @@ -0,0 +1,42 @@
> +--- grep-2.5.1a/src/grep.c.skip	2006-05-31 09:26:58.000000000 +0100
> ++++ grep-2.5.1a/src/grep.c	2006-05-31 09:28:24.000000000 +0100
> +@@ -261,19 +261,6 @@
> +   bufbeg[-1] = eolbyte;
> +   bufdesc = fd;
> +
> +-  if (fstat (fd, &stats->stat) != 0)
> +-    {
> +-      error (0, errno, "fstat");
> +-      return 0;
> +-    }
> +-  if (directories == SKIP_DIRECTORIES && S_ISDIR (stats->stat.st_mode))
> +-    return 0;
> +-#ifndef DJGPP
> +-  if (devices == SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) || S_ISBLK(stats->stat.st_mode) || S_ISSOCK(stats->stat.st_mode)))
> +-#else
> +-  if (devices == SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) || S_ISBLK(stats->stat.st_mode)))
> +-#endif
> +-    return 0;
> +   if (S_ISREG (stats->stat.st_mode))
> +     {
> +       if (file)
> +@@ -875,6 +862,19 @@
> +     }
> +   else
> +     {
> ++      if (stat (file, &stats->stat) != 0)
> ++        {
> ++          suppressible_error (file, errno);
> ++          return 1;
> ++        }
> ++      if (directories == SKIP_DIRECTORIES && S_ISDIR (stats->stat.st_mode))
> ++        return 1;
> ++#ifndef DJGPP
> ++      if (devices == SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) || S_ISBLK(stats->stat.st_mode) || S_ISSOCK(stats->stat.st_mode) || S_ISFIFO(stats->stat.st_mode)))
> ++#else
> ++      if (devices == SKIP_DEVICES && (S_ISCHR(stats->stat.st_mode) || S_ISBLK(stats->stat.st_mode)))
> ++#endif
> ++        return 1;
> +       while ((desc = open (file, O_RDONLY)) < 0 && errno == EINTR)
> + 	continue;
> +
> diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
> index 088959c..d964d84 100644
> --- a/meta/recipes-extended/grep/grep_2.5.1a.bb
> +++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
> @@ -5,7 +5,7 @@ SECTION = "console/utils"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
>              file://uclibc-fix.patch \
> @@ -13,8 +13,25 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
>              file://gettext.patch \
>              file://fix64-int-to-pointer.patch \
>              file://Makevars \
> -           file://grep-CVE-2012-5667.patch \

Why are you removing this patch?

Will an update to 2.5.3 accomplish the same thing as these patches?

Also all of your patches above are missing Upstream-Status and 
Signed-off-by:

See the Patch Guildlines on OE-Core:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks

Sau!

>              file://fix-for-texinfo-5.1.patch \
> +           file://grep-2.5.1-fgrep.patch \
> +           file://grep-2.5.1-bracket.patch \
> +           file://grep-2.5-i18n.patch \
> +           file://grep-2.5.1-oi.patch \
> +           file://grep-2.5.1-manpage.patch \
> +           file://grep-2.5.1-color.patch \
> +           file://grep-2.5.1-icolor.patch \
> +           file://grep-skip.patch \
> +           file://grep-2.5.1-egf-speedup.patch \
> +           file://grep-2.5.1-dfa-optional.patch \
> +           file://grep-2.5.1-tests.patch \
> +           file://grep-2.5.1-w.patch \
> +           file://grep-P.patch \
> +           file://grep-CVE-2012-5667.patch \
> +           file://grep-empty-pattern.patch \
> +           file://grep-bz460641.patch \
> +           file://grep-bz434934.patch \
> +           file://grep-man-label.patch \
>             "
>
>   SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
> @@ -22,7 +39,7 @@ SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92b
>
>   inherit autotools gettext
>
> -EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
> +EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses --without-included-regex"
>
>   CFLAGS += "-D PROTOTYPES"
>   do_configure_prepend () {
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

