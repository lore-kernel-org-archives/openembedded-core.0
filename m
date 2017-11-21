Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C6D31787B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 21:54:04 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p9so11258133pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8+UD6JK0/KCTl5yqdOMilwPJtxSbgAvZv0OeVbzHB8Y=;
	b=SCX+2wxejTmXSEXR3Iz79Ik2WqqCrt7pBKH6k9U4qKPZHO1KlYjVeZVsVHywMXwu+Z
	ClbdSoTuaTTLV2moe6bSNVyaE+XJNf0I018Lom60mxZPiIdN2te5IIoOjVms8WsULS3x
	d+PzCaoZdNbUOHyRMenGtxrxPKTpGCF3JIw6kwt2JWBAF84gRGCDF/Etb7NhUZZIzNMt
	SxNXK3/As+LPeOgpDMP4msEByfhs0Ea4S0udEhvQ1htrOWzKZTVYMPTHOLV2MW7DUMrl
	JYenbafbjDoY+sDrNGTx/n88pJul+Q/PV+T0znxhzvq+eytbGHfwHnmuvcy2uU5L+BJ/
	F4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8+UD6JK0/KCTl5yqdOMilwPJtxSbgAvZv0OeVbzHB8Y=;
	b=cEzRw66/Sjk5JBbdhZXTGCkgb2jU3f8h4/5B75H7B6S0K49DbuRYC9fkf+28Qo7EiG
	/uxdToWaD89I5/WPuUaKNmyBmfvqSWNE7fZXGqa8q39ZwjvVwB9NonhPDdegnFBJGfPE
	ZilhznOdIALnfRnk1ujKkUTXmB/9zf7CsizYrIflFx/YE7KiciZkilhqiseGdWtsk57k
	BkLDQAegr+Hzg7ITSc6yQWI4N7yVZmS/Df/E2y5miPxP/cSG1BAh1vHeFXWJ2TNA/cAu
	tL8ofmFyyyVzyWGe9SJYZ31tVB1GHH6LMzF15i0P02sQRoQLmhUjiQwfuLvtrlEpq3BV
	G0Gw==
X-Gm-Message-State: AJaThX62F4wq1XleReawSvL2J7Wrcd7CQ2vmI2UaDmXLWp3wo0TUkCR0
	/IaaywzSqjEpNESLPqYam5T5KtaZvRcD80LvLaQ=
X-Google-Smtp-Source: AGs4zMZhvcacH4i4qXxKEfa7qVK6SJpY8+XwhgsEk1A9eENPNlbojdoCMyFxnIHCSKYGlWXc2T4PdsEGRB1u1vBb2Ww=
X-Received: by 10.99.109.2 with SMTP id i2mr18746888pgc.269.1511301245458;
	Tue, 21 Nov 2017 13:54:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 21 Nov 2017 13:53:34 -0800 (PST)
In-Reply-To: <20171121200121.5896-2-george.mccollister@gmail.com>
References: <20171121200121.5896-1-george.mccollister@gmail.com>
	<20171121200121.5896-2-george.mccollister@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Nov 2017 13:53:34 -0800
Message-ID: <CAMKF1sqTyU-ftqjQtBJERGDeAhT_gXXmPVc9VFnVSMJQLN130w@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v3 2/2] glibc: Fix CVE-2017-1000366
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
X-List-Received-Date: Tue, 21 Nov 2017 21:54:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 12:01 PM, George McCollister
<george.mccollister@gmail.com> wrote:
> Add backported patches from the upstream release/2.24/master branch to
> fix CVE-2017-1000366. Also add a backported patch that resolves SSE
> related build problems introduced by these patches.
>

these patches look ok. what arches has you tested it on

> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>
> Changes in v2:
>  - Fix commit message
>
> Changes in v3:
>  - Added upstream patch to fix SSE issue introduced by this patch
>    series.
>
>  ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  71 +++++++
>  ...ject-overly-long-LD_PRELOAD-path-elements.patch | 145 +++++++++++++
>  ...Reject-overly-long-LD_AUDIT-path-elements.patch | 231 +++++++++++++++++++++
>  ...ssing-IS_IN-libc-guards-to-vectorized-str.patch |  62 ++++++
>  meta/recipes-core/glibc/glibc_2.24.bb              |   4 +
>  5 files changed, 513 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0004-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> new file mode 100644
> index 0000000000..78e9ea9e65
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> @@ -0,0 +1,71 @@
> +From 400f170750a4b2c94a2670ca44de166cc5dd6e3b Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 18:33:26 +0200
> +Subject: [PATCH] CVE-2017-1000366: Ignore LD_LIBRARY_PATH for AT_SECURE=1
> + programs [BZ #21624]
> +
> +LD_LIBRARY_PATH can only be used to reorder system search paths, which
> +is not useful functionality.
> +
> +This makes an exploitable unbounded alloca in _dl_init_paths unreachable
> +for AT_SECURE=1 programs.
> +
> +(cherry picked from commit f6110a8fee2ca36f8e2d2abecf3cba9fa7b8ea7d)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=87bd4186da10371f46e2f1a7bf7c0a45bb04f1ac
> +https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
> +
> +CVE: CVE-2017-1000366
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog  | 7 +++++++
> + NEWS       | 1 +
> + elf/rtld.c | 3 ++-
> + 3 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 2bdaf69e43..7a999802dd 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++      [BZ #21624]
> ++      CVE-2017-1000366
> ++      * elf/rtld.c (process_envvars): Ignore LD_LIBRARY_PATH for
> ++      __libc_enable_secure.
> ++
> + 2016-12-31  Florian Weimer  <fweimer@redhat.com>
> +
> +       [BZ #18784]
> +diff --git a/NEWS b/NEWS
> +index 4b1ca3cb65..66b49dbbc0 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -17,6 +17,7 @@ using `glibc' in the "product" field.
> +   question type which is outside the range of valid question type values.
> +   (CVE-2015-5180)
> +
> ++  [21624] Unsafe alloca allows local attackers to alias stack and heap (CVE-2017-1000366)
> + Version 2.24
> +
> + * The minimum Linux kernel version that this version of the GNU C Library
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 647661ca45..215a9aec8f 100644
> +--- a/elf/rtld.c
> ++++ b/elf/rtld.c
> +@@ -2437,7 +2437,8 @@ process_envvars (enum mode *modep)
> +
> +       case 12:
> +         /* The library search path.  */
> +-        if (memcmp (envline, "LIBRARY_PATH", 12) == 0)
> ++        if (!__libc_enable_secure
> ++            && memcmp (envline, "LIBRARY_PATH", 12) == 0)
> +           {
> +             library_path = &envline[13];
> +             break;
> +--
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch b/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> new file mode 100644
> index 0000000000..7f81ed1566
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> @@ -0,0 +1,145 @@
> +From 6d49272e6d6741496e3456f2cc22ebc2b9f7f989 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 22:31:04 +0200
> +Subject: [PATCH] ld.so: Reject overly long LD_PRELOAD path elements
> +
> +(cherry picked from commit 6d0ba622891bed9d8394eef1935add53003b12e8)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=aab04ca5d359150e17631e6a9b44b65e93bdc467
> +https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
> +
> +CVE: CVE-2017-1000366
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog  |  7 ++++++
> + elf/rtld.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++------------
> + 2 files changed, 73 insertions(+), 16 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 7a999802dd..ea5ecd4a1e 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++      * elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LIMIT): Define.
> ++      (dso_name_valid_for_suid): New function.
> ++      (handle_ld_preload): Likewise.
> ++      (dl_main): Call it.  Remove alloca.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> +
> +       [BZ #21624]
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 215a9aec8f..1d8eab9fe2 100644
> +--- a/elf/rtld.c
> ++++ b/elf/rtld.c
> +@@ -99,6 +99,35 @@ uintptr_t __pointer_chk_guard_local
> + strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
> + #endif
> +
> ++/* Length limits for names and paths, to protect the dynamic linker,
> ++   particularly when __libc_enable_secure is active.  */
> ++#ifdef NAME_MAX
> ++# define SECURE_NAME_LIMIT NAME_MAX
> ++#else
> ++# define SECURE_NAME_LIMIT 255
> ++#endif
> ++#ifdef PATH_MAX
> ++# define SECURE_PATH_LIMIT PATH_MAX
> ++#else
> ++# define SECURE_PATH_LIMIT 1024
> ++#endif
> ++
> ++/* Check that AT_SECURE=0, or that the passed name does not contain
> ++   directories and is not overly long.  Reject empty names
> ++   unconditionally.  */
> ++static bool
> ++dso_name_valid_for_suid (const char *p)
> ++{
> ++  if (__glibc_unlikely (__libc_enable_secure))
> ++    {
> ++      /* Ignore pathnames with directories for AT_SECURE=1
> ++       programs, and also skip overlong names.  */
> ++      size_t len = strlen (p);
> ++      if (len >= SECURE_NAME_LIMIT || memchr (p, '/', len) != NULL)
> ++      return false;
> ++    }
> ++  return *p != '\0';
> ++}
> +
> + /* List of auditing DSOs.  */
> + static struct audit_list
> +@@ -730,6 +759,42 @@ static const char *preloadlist attribute_relro;
> + /* Nonzero if information about versions has to be printed.  */
> + static int version_info attribute_relro;
> +
> ++/* The LD_PRELOAD environment variable gives list of libraries
> ++   separated by white space or colons that are loaded before the
> ++   executable's dependencies and prepended to the global scope list.
> ++   (If the binary is running setuid all elements containing a '/' are
> ++   ignored since it is insecure.)  Return the number of preloads
> ++   performed.  */
> ++unsigned int
> ++handle_ld_preload (const char *preloadlist, struct link_map *main_map)
> ++{
> ++  unsigned int npreloads = 0;
> ++  const char *p = preloadlist;
> ++  char fname[SECURE_PATH_LIMIT];
> ++
> ++  while (*p != '\0')
> ++    {
> ++      /* Split preload list at space/colon.  */
> ++      size_t len = strcspn (p, " :");
> ++      if (len > 0 && len < sizeof (fname))
> ++      {
> ++        memcpy (fname, p, len);
> ++        fname[len] = '\0';
> ++      }
> ++      else
> ++      fname[0] = '\0';
> ++
> ++      /* Skip over the substring and the following delimiter.  */
> ++      p += len;
> ++      if (*p != '\0')
> ++      ++p;
> ++
> ++      if (dso_name_valid_for_suid (fname))
> ++      npreloads += do_preload (fname, main_map, "LD_PRELOAD");
> ++    }
> ++  return npreloads;
> ++}
> ++
> + static void
> + dl_main (const ElfW(Phdr) *phdr,
> +        ElfW(Word) phnum,
> +@@ -1481,23 +1546,8 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +
> +   if (__glibc_unlikely (preloadlist != NULL))
> +     {
> +-      /* The LD_PRELOAD environment variable gives list of libraries
> +-       separated by white space or colons that are loaded before the
> +-       executable's dependencies and prepended to the global scope
> +-       list.  If the binary is running setuid all elements
> +-       containing a '/' are ignored since it is insecure.  */
> +-      char *list = strdupa (preloadlist);
> +-      char *p;
> +-
> +       HP_TIMING_NOW (start);
> +-
> +-      /* Prevent optimizing strsep.  Speed is not important here.  */
> +-      while ((p = (strsep) (&list, " :")) != NULL)
> +-      if (p[0] != '\0'
> +-          && (__builtin_expect (! __libc_enable_secure, 1)
> +-              || strchr (p, '/') == NULL))
> +-        npreloads += do_preload (p, main_map, "LD_PRELOAD");
> +-
> ++      npreloads += handle_ld_preload (preloadlist, main_map);
> +       HP_TIMING_NOW (stop);
> +       HP_TIMING_DIFF (diff, start, stop);
> +       HP_TIMING_ACCUM_NT (load_time, diff);
> +--
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch b/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> new file mode 100644
> index 0000000000..b52b8a1fa7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> @@ -0,0 +1,231 @@
> +From c0b25407def32718147530da72959a034cd1318d Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 22:32:12 +0200
> +Subject: [PATCH] ld.so: Reject overly long LD_AUDIT path elements
> +
> +Also only process the last LD_AUDIT entry.
> +
> +(cherry picked from commit 81b82fb966ffbd94353f793ad17116c6088dedd9)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=2febff860b31df3666bef5ade0d0744c93f76a74
> +https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
> +
> +CVE: CVE-2017-1000366
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog  |  11 +++++++
> + elf/rtld.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++---------
> + 2 files changed, 106 insertions(+), 15 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index ea5ecd4a1e..638cb632b1 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,14 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++      * elf/rtld.c (audit_list_string): New variable.
> ++      (audit_list): Update comment.
> ++      (struct audit_list_iter): Define.
> ++      (audit_list_iter_init, audit_list_iter_next): New function.
> ++      (dl_main): Use struct audit_list_iter to process audit modules.
> ++      (process_dl_audit): Call dso_name_valid_for_suid.
> ++      (process_envvars): Set audit_list_string instead of calling
> ++      process_dl_audit.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> +
> +       * elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LIMIT): Define.
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 1d8eab9fe2..302bb63620 100644
> +--- a/elf/rtld.c
> ++++ b/elf/rtld.c
> +@@ -129,13 +129,91 @@ dso_name_valid_for_suid (const char *p)
> +   return *p != '\0';
> + }
> +
> +-/* List of auditing DSOs.  */
> ++/* LD_AUDIT variable contents.  Must be processed before the
> ++   audit_list below.  */
> ++const char *audit_list_string;
> ++
> ++/* Cyclic list of auditing DSOs.  audit_list->next is the first
> ++   element.  */
> + static struct audit_list
> + {
> +   const char *name;
> +   struct audit_list *next;
> + } *audit_list;
> +
> ++/* Iterator for audit_list_string followed by audit_list.  */
> ++struct audit_list_iter
> ++{
> ++  /* Tail of audit_list_string still needing processing, or NULL.  */
> ++  const char *audit_list_tail;
> ++
> ++  /* The list element returned in the previous iteration.  NULL before
> ++     the first element.  */
> ++  struct audit_list *previous;
> ++
> ++  /* Scratch buffer for returning a name which is part of
> ++     audit_list_string.  */
> ++  char fname[SECURE_NAME_LIMIT];
> ++};
> ++
> ++/* Initialize an audit list iterator.  */
> ++static void
> ++audit_list_iter_init (struct audit_list_iter *iter)
> ++{
> ++  iter->audit_list_tail = audit_list_string;
> ++  iter->previous = NULL;
> ++}
> ++
> ++/* Iterate through both audit_list_string and audit_list.  */
> ++static const char *
> ++audit_list_iter_next (struct audit_list_iter *iter)
> ++{
> ++  if (iter->audit_list_tail != NULL)
> ++    {
> ++      /* First iterate over audit_list_string.  */
> ++      while (*iter->audit_list_tail != '\0')
> ++      {
> ++        /* Split audit list at colon.  */
> ++        size_t len = strcspn (iter->audit_list_tail, ":");
> ++        if (len > 0 && len < sizeof (iter->fname))
> ++          {
> ++            memcpy (iter->fname, iter->audit_list_tail, len);
> ++            iter->fname[len] = '\0';
> ++          }
> ++        else
> ++          /* Do not return this name to the caller.  */
> ++          iter->fname[0] = '\0';
> ++
> ++        /* Skip over the substring and the following delimiter.  */
> ++        iter->audit_list_tail += len;
> ++        if (*iter->audit_list_tail == ':')
> ++          ++iter->audit_list_tail;
> ++
> ++        /* If the name is valid, return it.  */
> ++        if (dso_name_valid_for_suid (iter->fname))
> ++          return iter->fname;
> ++        /* Otherwise, wrap around and try the next name.  */
> ++      }
> ++      /* Fall through to the procesing of audit_list.  */
> ++    }
> ++
> ++  if (iter->previous == NULL)
> ++    {
> ++      if (audit_list == NULL)
> ++      /* No pre-parsed audit list.  */
> ++      return NULL;
> ++      /* Start of audit list.  The first list element is at
> ++       audit_list->next (cyclic list).  */
> ++      iter->previous = audit_list->next;
> ++      return iter->previous->name;
> ++    }
> ++  if (iter->previous == audit_list)
> ++    /* Cyclic list wrap-around.  */
> ++    return NULL;
> ++  iter->previous = iter->previous->next;
> ++  return iter->previous->name;
> ++}
> ++
> + #ifndef HAVE_INLINED_SYSCALLS
> + /* Set nonzero during loading and initialization of executable and
> +    libraries, cleared before the executable's entry point runs.  This
> +@@ -1322,11 +1400,13 @@ of this helper program; chances are you did not intend to run this program.\n\
> +     GL(dl_rtld_map).l_tls_modid = _dl_next_tls_modid ();
> +
> +   /* If we have auditing DSOs to load, do it now.  */
> +-  if (__glibc_unlikely (audit_list != NULL))
> ++  bool need_security_init = true;
> ++  if (__glibc_unlikely (audit_list != NULL)
> ++      || __glibc_unlikely (audit_list_string != NULL))
> +     {
> +-      /* Iterate over all entries in the list.  The order is important.  */
> +       struct audit_ifaces *last_audit = NULL;
> +-      struct audit_list *al = audit_list->next;
> ++      struct audit_list_iter al_iter;
> ++      audit_list_iter_init (&al_iter);
> +
> +       /* Since we start using the auditing DSOs right away we need to
> +        initialize the data structures now.  */
> +@@ -1337,9 +1417,14 @@ of this helper program; chances are you did not intend to run this program.\n\
> +        use different values (especially the pointer guard) and will
> +        fail later on.  */
> +       security_init ();
> ++      need_security_init = false;
> +
> +-      do
> ++      while (true)
> +       {
> ++        const char *name = audit_list_iter_next (&al_iter);
> ++        if (name == NULL)
> ++          break;
> ++
> +         int tls_idx = GL(dl_tls_max_dtv_idx);
> +
> +         /* Now it is time to determine the layout of the static TLS
> +@@ -1348,7 +1433,7 @@ of this helper program; chances are you did not intend to run this program.\n\
> +            no DF_STATIC_TLS bit is set.  The reason is that we know
> +            glibc will use the static model.  */
> +         struct dlmopen_args dlmargs;
> +-        dlmargs.fname = al->name;
> ++        dlmargs.fname = name;
> +         dlmargs.map = NULL;
> +
> +         const char *objname;
> +@@ -1361,7 +1446,7 @@ of this helper program; chances are you did not intend to run this program.\n\
> +           not_loaded:
> +             _dl_error_printf ("\
> + ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +-                              al->name, err_str);
> ++                              name, err_str);
> +             if (malloced)
> +               free ((char *) err_str);
> +           }
> +@@ -1465,10 +1550,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +                 goto not_loaded;
> +               }
> +           }
> +-
> +-        al = al->next;
> +       }
> +-      while (al != audit_list->next);
> +
> +       /* If we have any auditing modules, announce that we already
> +        have two objects loaded.  */
> +@@ -1732,7 +1814,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +   if (tcbp == NULL)
> +     tcbp = init_tls ();
> +
> +-  if (__glibc_likely (audit_list == NULL))
> ++  if (__glibc_likely (need_security_init))
> +     /* Initialize security features.  But only if we have not done it
> +        earlier.  */
> +     security_init ();
> +@@ -2363,9 +2445,7 @@ process_dl_audit (char *str)
> +   char *p;
> +
> +   while ((p = (strsep) (&str, ":")) != NULL)
> +-    if (p[0] != '\0'
> +-      && (__builtin_expect (! __libc_enable_secure, 1)
> +-          || strchr (p, '/') == NULL))
> ++    if (dso_name_valid_for_suid (p))
> +       {
> +       /* This is using the local malloc, not the system malloc.  The
> +          memory can never be freed.  */
> +@@ -2429,7 +2509,7 @@ process_envvars (enum mode *modep)
> +             break;
> +           }
> +         if (memcmp (envline, "AUDIT", 5) == 0)
> +-          process_dl_audit (&envline[6]);
> ++          audit_list_string = &envline[6];
> +         break;
> +
> +       case 7:
> +--
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0004-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch b/meta/recipes-core/glibc/glibc/0004-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
> new file mode 100644
> index 0000000000..43c4398fec
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0004-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
> @@ -0,0 +1,62 @@
> +From 203835b3bf6f1edfe1ebe4a7fa15dc085e6dc8f7 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 14 Jun 2017 08:11:22 +0200
> +Subject: [PATCH] i686: Add missing IS_IN (libc) guards to vectorized strcspn
> +
> +Since commit d957c4d3fa48d685ff2726c605c988127ef99395 (i386: Compile
> +rtld-*.os with -mno-sse -mno-mmx -mfpmath=387), vector intrinsics can
> +no longer be used in ld.so, even if the compiled code never makes it
> +into the final ld.so link.  This commit adds the missing IS_IN (libc)
> +guard to the SSE 4.2 strcspn implementation, so that it can be used from
> +ld.so in the future.
> +
> +(cherry picked from commit 69052a3a95da37169a08f9e59b2cc1808312753c)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=86ac4a78a9218d1e1dcfbacc6f7d09957c1fe3a4
> +
> +Required to build fixes for CVE-2017-1000366.
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog                               | 5 +++++
> + sysdeps/i386/i686/multiarch/strcspn-c.c | 6 ++++--
> + sysdeps/i386/i686/multiarch/varshift.c  | 4 +++-
> + 3 files changed, 12 insertions(+), 3 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 638cb632b1..3f89a2cdb2 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2017-06-14  Florian Weimer  <fweimer@redhat.com>
> ++
> ++      * sysdeps/i386/i686/multiarch/strcspn-c.c: Add IS_IN (libc) guard.
> ++      * sysdeps/i386/i686/multiarch/varshift.c: Likewise.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> +
> +       * elf/rtld.c (audit_list_string): New variable.
> +diff --git a/sysdeps/i386/i686/multiarch/strcspn-c.c b/sysdeps/i386/i686/multiarch/strcspn-c.c
> +index 6d61e190a8..ec230fb383 100644
> +--- a/sysdeps/i386/i686/multiarch/strcspn-c.c
> ++++ b/sysdeps/i386/i686/multiarch/strcspn-c.c
> +@@ -1,2 +1,4 @@
> +-#define __strcspn_sse2 __strcspn_ia32
> +-#include <sysdeps/x86_64/multiarch/strcspn-c.c>
> ++#if IS_IN (libc)
> ++# define __strcspn_sse2 __strcspn_ia32
> ++# include <sysdeps/x86_64/multiarch/strcspn-c.c>
> ++#endif
> +diff --git a/sysdeps/i386/i686/multiarch/varshift.c b/sysdeps/i386/i686/multiarch/varshift.c
> +index 7760b966e2..6742a35d41 100644
> +--- a/sysdeps/i386/i686/multiarch/varshift.c
> ++++ b/sysdeps/i386/i686/multiarch/varshift.c
> +@@ -1 +1,3 @@
> +-#include <sysdeps/x86_64/multiarch/varshift.c>
> ++#if IS_IN (libc)
> ++# include <sysdeps/x86_64/multiarch/varshift.c>
> ++#endif
> +--
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index 4c7d901149..359379bac5 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -46,6 +46,10 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0005-Remove-__ASSUME_REQUEUE_PI.patch \
>             file://0006-Fix-atomic_fetch_xor_release.patch \
>             file://0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch \
> +           file://0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch \
> +           file://0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch \
> +           file://0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch \
> +           file://0004-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch \
>  "
>
>  SRC_URI += "\
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

