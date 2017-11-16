Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E28360685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 03:12:14 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s11so14093899pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EaJsBXaZ8v0tO9XiHjD5rvD4Y3Le2WJrPly9btqmBnw=;
	b=SrCs486m25wgHstXeVjlwKr6cMawGbvN/P2ndjnD9NR3nY1L3B5wvQuq6neL6JV1jv
	xoQfdlAMHWs2gQ5xg2KXXI7xKFM3jlfB2PED8CtKkTGMfBX6QVipnaxQrJUi8oNsoo7d
	tGI4QL3LU2O218Y/SI9Fhsab4IXQG6xYpsXj0zoGXPEFkH2IGlqTWRWeRad+hUqeXEf5
	1WEi/1L0mlMQ/htN/fLzR9/2MCs17nJrrtaf9UkZPcC8Wu8Dwd2fQS4/z9hv/fVteDih
	JD3VTnOYS7CgOMHH1xeXRTZYqSChmJOUFDop2ONhf4LShAUAu7A9FLuk0KSPOgrPmiwG
	TWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EaJsBXaZ8v0tO9XiHjD5rvD4Y3Le2WJrPly9btqmBnw=;
	b=kv19FEaS8XEDWiitNsTbo3C9e1XB7024me7lugkMk5IjUmYBnmRhzo77sccEvof62b
	AJf01WuAzSCg2UOiutL/7irQYQ33TEIjHQOLzvRZ/LGH7PwFikc/KXhd3luzUB2NRy5e
	AATDQk4+iC8bLEKA+snYk8SwlkYNDrdsCCeHJqhxriMph//yLRhKdqEMl1mMzBmjioQz
	SMZoDpJv/aktZjzbpuPybvQFFAVvzpki4f7Xw70TigncK0dRUdwx2vK6kd/OOlmQkmJV
	iomZVdb9ZROG/TfL0ThmGK4IFmLfit0vexJehhack0DPNUmfCWrTsKV3SPbUhv1+stK3
	to9g==
X-Gm-Message-State: AJaThX5Nx5e/r+2gHr96OGCzBW2c+P3oG7JU4ZvSj1gaR9nGQH/YzeAJ
	tZ//8WvryWBQ+Crv19wdkObjzyJoyVJ9NUvpDPg=
X-Google-Smtp-Source: AGs4zMY2yGY3z03x7whDEuD0uVgCIFRagz2Ed26Vz4k9qBn3EAeYb4lzlCQTradNq3qu2Hj9ZATNu5xrfTd/0jB6eX4=
X-Received: by 10.84.244.129 with SMTP id h1mr226616pll.255.1510801935669;
	Wed, 15 Nov 2017 19:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20171115203605.19088-1-george.mccollister@gmail.com>
	<20171115203605.19088-2-george.mccollister@gmail.com>
In-Reply-To: <20171115203605.19088-2-george.mccollister@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2017 03:12:05 +0000
Message-ID: <CAMKF1srPrXPAsbfkwX_z_yRPZ0ZhGTOBrThmTrDGokqzX52wmA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	George McCollister <george.mccollister@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH v2 2/2] glibc: Fix CVE-2017-1000366
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
X-List-Received-Date: Thu, 16 Nov 2017 03:12:14 -0000
Content-Type: multipart/alternative; boundary="089e08244d58b39f15055e10fc6d"

--089e08244d58b39f15055e10fc6d
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 12:36 PM George McCollister <
george.mccollister@gmail.com> wrote:

> Add backported patches from the upstream release/2.24/master branch to
> fix CVE-2017-1000366
>

This seems fine for morty

>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>
> Changes in v2:
>  - Fix commit message
>
>  ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  71 +++++++
>  ...ject-overly-long-LD_PRELOAD-path-elements.patch | 145 +++++++++++++
>  ...Reject-overly-long-LD_AUDIT-path-elements.patch | 231
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb              |   3 +
>  4 files changed, 450 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
>  create mode 100644
> meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
>  create mode 100644
> meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> b/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> new file mode 100644
> index 0000000000..78e9ea9e65
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
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
> +
> https://sourceware.org/git/?p=glibc.git;a=commit;h=87bd4186da10371f46e2f1a7bf7c0a45bb04f1ac
> +
> https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
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
> ++  [21624] Unsafe alloca allows local attackers to alias stack and heap
> (CVE-2017-1000366)
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
> diff --git
> a/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> b/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> new file mode 100644
> index 0000000000..7f81ed1566
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> @@ -0,0 +1,145 @@
> +From 6d49272e6d6741496e3456f2cc22ebc2b9f7f989 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 22:31:04 +0200
> +Subject: [PATCH] ld.so: Reject overly long LD_PRELOAD path elements
> +
> +(cherry picked from commit 6d0ba622891bed9d8394eef1935add53003b12e8)
> +
> +Upstream-Status: Backport
> +
> https://sourceware.org/git/?p=glibc.git;a=commit;h=aab04ca5d359150e17631e6a9b44b65e93bdc467
> +
> https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
> +
> +CVE: CVE-2017-1000366
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog  |  7 ++++++
> + elf/rtld.c | 82
> ++++++++++++++++++++++++++++++++++++++++++++++++++------------
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
> +@@ -1481,23 +1546,8 @@ ERROR: ld.so: object '%s' cannot be loaded as
> audit interface: %s; ignored.\n",
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
> diff --git
> a/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> b/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> new file mode 100644
> index 0000000000..b52b8a1fa7
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
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
> +
> https://sourceware.org/git/?p=glibc.git;a=commit;h=2febff860b31df3666bef5ade0d0744c93f76a74
> +
> https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=stretch&id=2755c57269f24e9d59c22c49788f92515346c1bb
> +
> +CVE: CVE-2017-1000366
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +---
> + ChangeLog  |  11 +++++++
> + elf/rtld.c | 110
> ++++++++++++++++++++++++++++++++++++++++++++++++++++---------
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
> +@@ -1322,11 +1400,13 @@ of this helper program; chances are you did not
> intend to run this program.\n\
> +     GL(dl_rtld_map).l_tls_modid = _dl_next_tls_modid ();
> +
> +   /* If we have auditing DSOs to load, do it now.  */
> +-  if (__glibc_unlikely (audit_list != NULL))
> ++  bool need_security_init = true;
> ++  if (__glibc_unlikely (audit_list != NULL)
> ++      || __glibc_unlikely (audit_list_string != NULL))
> +     {
> +-      /* Iterate over all entries in the list.  The order is important.
> */
> +       struct audit_ifaces *last_audit = NULL;
> +-      struct audit_list *al = audit_list->next;
> ++      struct audit_list_iter al_iter;
> ++      audit_list_iter_init (&al_iter);
> +
> +       /* Since we start using the auditing DSOs right away we need to
> +        initialize the data structures now.  */
> +@@ -1337,9 +1417,14 @@ of this helper program; chances are you did not
> intend to run this program.\n\
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
> +@@ -1348,7 +1433,7 @@ of this helper program; chances are you did not
> intend to run this program.\n\
> +            no DF_STATIC_TLS bit is set.  The reason is that we know
> +            glibc will use the static model.  */
> +         struct dlmopen_args dlmargs;
> +-        dlmargs.fname = al->name;
> ++        dlmargs.fname = name;
> +         dlmargs.map = NULL;
> +
> +         const char *objname;
> +@@ -1361,7 +1446,7 @@ of this helper program; chances are you did not
> intend to run this program.\n\
> +           not_loaded:
> +             _dl_error_printf ("\
> + ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s;
> ignored.\n",
> +-                              al->name, err_str);
> ++                              name, err_str);
> +             if (malloced)
> +               free ((char *) err_str);
> +           }
> +@@ -1465,10 +1550,7 @@ ERROR: ld.so: object '%s' cannot be loaded as
> audit interface: %s; ignored.\n",
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
> +@@ -1732,7 +1814,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit
> interface: %s; ignored.\n",
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
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb
> b/meta/recipes-core/glibc/glibc_2.24.bb
> index 4c7d901149..4eba6aceb6 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -46,6 +46,9 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0005-Remove-__ASSUME_REQUEUE_PI.patch \
>             file://0006-Fix-atomic_fetch_xor_release.patch \
>
> file://0001-CVE-2015-5180-resolv-Fix-crash-with-internal-QTYPE-B.patch \
> +
>  file://0001-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch \
> +
>  file://0002-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch \
> +
>  file://0003-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch \
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
>

--089e08244d58b39f15055e10fc6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Nov 15, 2017 =
at 12:36 PM George McCollister &lt;<a href=3D"mailto:george.mccollister@gma=
il.com">george.mccollister@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Add backported patches from the upstream release/2.24/mast=
er branch to<br>
fix CVE-2017-1000366<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This seems fine =
for morty</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister@=
gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
=C2=A0- Fix commit message<br>
<br>
=C2=A0...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |=C2=A0 71 +++++++=
<br>
=C2=A0...ject-overly-long-LD_PRELOAD-path-elements.patch | 145 ++++++++++++=
+<br>
=C2=A0...Reject-overly-long-LD_AUDIT-path-elements.patch | 231 ++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 450 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2017-100036=
6-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0002-ld.so-Reject-ov=
erly-long-LD_PRELOAD-path-elements.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0003-ld.so-Reject-ov=
erly-long-LD_AUDIT-path-elements.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_=
LIBRARY_PATH-for-AT_SECUR.patch b/meta/recipes-core/glibc/glibc/0001-CVE-20=
17-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch<br>
new file mode 100644<br>
index 0000000000..78e9ea9e65<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2017-1000366-Ignore-LD_LIBRARY=
_PATH-for-AT_SECUR.patch<br>
@@ -0,0 +1,71 @@<br>
+From 400f170750a4b2c94a2670ca44de166cc5dd6e3b Mon Sep 17 00:00:00 2001<br>
+From: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com" target=3D"_=
blank">fweimer@redhat.com</a>&gt;<br>
+Date: Mon, 19 Jun 2017 18:33:26 +0200<br>
+Subject: [PATCH] CVE-2017-1000366: Ignore LD_LIBRARY_PATH for AT_SECURE=3D=
1<br>
+ programs [BZ #21624]<br>
+<br>
+LD_LIBRARY_PATH can only be used to reorder system search paths, which<br>
+is not useful functionality.<br>
+<br>
+This makes an exploitable unbounded alloca in _dl_init_paths unreachable<b=
r>
+for AT_SECURE=3D1 programs.<br>
+<br>
+(cherry picked from commit f6110a8fee2ca36f8e2d2abecf3cba9fa7b8ea7d)<br>
+<br>
+Upstream-Status: Backport<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D87bd41=
86da10371f46e2f1a7bf7c0a45bb04f1ac" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D87bd4186da10371f46e2=
f1a7bf7c0a45bb04f1ac</a><br>
+<a href=3D"https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=
=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb" rel=3D"norefe=
rrer" target=3D"_blank">https://anonscm.debian.org/cgit/pkg-glibc/glibc.git=
/commit/?h=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb</a><=
br>
+<br>
+CVE: CVE-2017-1000366<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
+---<br>
+ ChangeLog=C2=A0 | 7 +++++++<br>
+ NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ elf/rtld.c | 3 ++-<br>
+ 3 files changed, 10 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 2bdaf69e43..7a999802dd 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,10 @@<br>
++2017-06-19=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 [BZ #21624]<br>
++=C2=A0 =C2=A0 =C2=A0 CVE-2017-1000366<br>
++=C2=A0 =C2=A0 =C2=A0 * elf/rtld.c (process_envvars): Ignore LD_LIBRARY_PA=
TH for<br>
++=C2=A0 =C2=A0 =C2=A0 __libc_enable_secure.<br>
++<br>
+ 2016-12-31=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[BZ #18784]<br>
+diff --git a/NEWS b/NEWS<br>
+index 4b1ca3cb65..66b49dbbc0 100644<br>
+--- a/NEWS<br>
++++ b/NEWS<br>
+@@ -17,6 +17,7 @@ using `glibc&#39; in the &quot;product&quot; field.<br>
+=C2=A0 =C2=A0question type which is outside the range of valid question ty=
pe values.<br>
+=C2=A0 =C2=A0(CVE-2015-5180)<br>
+<br>
++=C2=A0 [21624] Unsafe alloca allows local attackers to alias stack and he=
ap (CVE-2017-1000366)<br>
+ Version 2.24<br>
+<br>
+ * The minimum Linux kernel version that this version of the GNU C Library=
<br>
+diff --git a/elf/rtld.c b/elf/rtld.c<br>
+index 647661ca45..215a9aec8f 100644<br>
+--- a/elf/rtld.c<br>
++++ b/elf/rtld.c<br>
+@@ -2437,7 +2437,8 @@ process_envvars (enum mode *modep)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The library search path.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (memcmp (envline, &quot;LIBRARY_PATH&quot;=
, 12) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!__libc_enable_secure<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; memcmp (envline, &qu=
ot;LIBRARY_PATH&quot;, 12) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library_path =3D &amp;envl=
ine[13];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+--<br>
+2.15.0<br>
+<br>
diff --git a/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD=
_PRELOAD-path-elements.patch b/meta/recipes-core/glibc/glibc/0002-ld.so-Rej=
ect-overly-long-LD_PRELOAD-path-elements.patch<br>
new file mode 100644<br>
index 0000000000..7f81ed1566<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0002-ld.so-Reject-overly-long-LD_PRELOA=
D-path-elements.patch<br>
@@ -0,0 +1,145 @@<br>
+From 6d49272e6d6741496e3456f2cc22ebc2b9f7f989 Mon Sep 17 00:00:00 2001<br>
+From: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com" target=3D"_=
blank">fweimer@redhat.com</a>&gt;<br>
+Date: Mon, 19 Jun 2017 22:31:04 +0200<br>
+Subject: [PATCH] ld.so: Reject overly long LD_PRELOAD path elements<br>
+<br>
+(cherry picked from commit 6d0ba622891bed9d8394eef1935add53003b12e8)<br>
+<br>
+Upstream-Status: Backport<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Daab04c=
a5d359150e17631e6a9b44b65e93bdc467" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Daab04ca5d359150e1763=
1e6a9b44b65e93bdc467</a><br>
+<a href=3D"https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=
=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb" rel=3D"norefe=
rrer" target=3D"_blank">https://anonscm.debian.org/cgit/pkg-glibc/glibc.git=
/commit/?h=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb</a><=
br>
+<br>
+CVE: CVE-2017-1000366<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
+---<br>
+ ChangeLog=C2=A0 |=C2=A0 7 ++++++<br>
+ elf/rtld.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++-------=
-----<br>
+ 2 files changed, 73 insertions(+), 16 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 7a999802dd..ea5ecd4a1e 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,10 @@<br>
++2017-06-19=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 * elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LIMIT):=
 Define.<br>
++=C2=A0 =C2=A0 =C2=A0 (dso_name_valid_for_suid): New function.<br>
++=C2=A0 =C2=A0 =C2=A0 (handle_ld_preload): Likewise.<br>
++=C2=A0 =C2=A0 =C2=A0 (dl_main): Call it.=C2=A0 Remove alloca.<br>
++<br>
+ 2017-06-19=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[BZ #21624]<br>
+diff --git a/elf/rtld.c b/elf/rtld.c<br>
+index 215a9aec8f..1d8eab9fe2 100644<br>
+--- a/elf/rtld.c<br>
++++ b/elf/rtld.c<br>
+@@ -99,6 +99,35 @@ uintptr_t __pointer_chk_guard_local<br>
+ strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)<br>
+ #endif<br>
+<br>
++/* Length limits for names and paths, to protect the dynamic linker,<br>
++=C2=A0 =C2=A0particularly when __libc_enable_secure is active.=C2=A0 */<b=
r>
++#ifdef NAME_MAX<br>
++# define SECURE_NAME_LIMIT NAME_MAX<br>
++#else<br>
++# define SECURE_NAME_LIMIT 255<br>
++#endif<br>
++#ifdef PATH_MAX<br>
++# define SECURE_PATH_LIMIT PATH_MAX<br>
++#else<br>
++# define SECURE_PATH_LIMIT 1024<br>
++#endif<br>
++<br>
++/* Check that AT_SECURE=3D0, or that the passed name does not contain<br>
++=C2=A0 =C2=A0directories and is not overly long.=C2=A0 Reject empty names=
<br>
++=C2=A0 =C2=A0unconditionally.=C2=A0 */<br>
++static bool<br>
++dso_name_valid_for_suid (const char *p)<br>
++{<br>
++=C2=A0 if (__glibc_unlikely (__libc_enable_secure))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Ignore pathnames with directories for AT_SECURE=
=3D1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0programs, and also skip overlong names.=C2=A0 =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen (p);<br>
++=C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D SECURE_NAME_LIMIT || memchr (p, &#39=
;/&#39;, len) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 return *p !=3D &#39;\0&#39;;<br>
++}<br>
+<br>
+ /* List of auditing DSOs.=C2=A0 */<br>
+ static struct audit_list<br>
+@@ -730,6 +759,42 @@ static const char *preloadlist attribute_relro;<br>
+ /* Nonzero if information about versions has to be printed.=C2=A0 */<br>
+ static int version_info attribute_relro;<br>
+<br>
++/* The LD_PRELOAD environment variable gives list of libraries<br>
++=C2=A0 =C2=A0separated by white space or colons that are loaded before th=
e<br>
++=C2=A0 =C2=A0executable&#39;s dependencies and prepended to the global sc=
ope list.<br>
++=C2=A0 =C2=A0(If the binary is running setuid all elements containing a &=
#39;/&#39; are<br>
++=C2=A0 =C2=A0ignored since it is insecure.)=C2=A0 Return the number of pr=
eloads<br>
++=C2=A0 =C2=A0performed.=C2=A0 */<br>
++unsigned int<br>
++handle_ld_preload (const char *preloadlist, struct link_map *main_map)<br=
>
++{<br>
++=C2=A0 unsigned int npreloads =3D 0;<br>
++=C2=A0 const char *p =3D preloadlist;<br>
++=C2=A0 char fname[SECURE_PATH_LIMIT];<br>
++<br>
++=C2=A0 while (*p !=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Split preload list at space/colon.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 size_t len =3D strcspn (p, &quot; :&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (len &gt; 0 &amp;&amp; len &lt; sizeof (fname))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy (fname, p, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fname[len] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 fname[0] =3D &#39;\0&#39;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Skip over the substring and the following delimit=
er.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 p +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 if (*p !=3D &#39;\0&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 ++p;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (dso_name_valid_for_suid (fname))<br>
++=C2=A0 =C2=A0 =C2=A0 npreloads +=3D do_preload (fname, main_map, &quot;LD=
_PRELOAD&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 return npreloads;<br>
++}<br>
++<br>
+ static void<br>
+ dl_main (const ElfW(Phdr) *phdr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ElfW(Word) phnum,<br>
+@@ -1481,23 +1546,8 @@ ERROR: ld.so: object &#39;%s&#39; cannot be loaded =
as audit interface: %s; ignored.\n&quot;,<br>
+<br>
+=C2=A0 =C2=A0if (__glibc_unlikely (preloadlist !=3D NULL))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* The LD_PRELOAD environment variable gives list of=
 libraries<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0separated by white space or colons that are lo=
aded before the<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0executable&#39;s dependencies and prepended to=
 the global scope<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0list.=C2=A0 If the binary is running setuid al=
l elements<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0containing a &#39;/&#39; are ignored since it =
is insecure.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 char *list =3D strdupa (preloadlist);<br>
+-=C2=A0 =C2=A0 =C2=A0 char *p;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HP_TIMING_NOW (start);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Prevent optimizing strsep.=C2=A0 Speed is not imp=
ortant here.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 while ((p =3D (strsep) (&amp;list, &quot; :&quot;)) =
!=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 if (p[0] !=3D &#39;\0&#39;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (__builtin_expect (! __libc=
_enable_secure, 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strchr (p, &#39;/&#39=
;) =3D=3D NULL))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 npreloads +=3D do_preload (p, main_map, &quot=
;LD_PRELOAD&quot;);<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 npreloads +=3D handle_ld_preload (preloadlist, main_=
map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HP_TIMING_NOW (stop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HP_TIMING_DIFF (diff, start, stop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HP_TIMING_ACCUM_NT (load_time, diff);<br>
+--<br>
+2.15.0<br>
+<br>
diff --git a/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD=
_AUDIT-path-elements.patch b/meta/recipes-core/glibc/glibc/0003-ld.so-Rejec=
t-overly-long-LD_AUDIT-path-elements.patch<br>
new file mode 100644<br>
index 0000000000..b52b8a1fa7<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0003-ld.so-Reject-overly-long-LD_AUDIT-=
path-elements.patch<br>
@@ -0,0 +1,231 @@<br>
+From c0b25407def32718147530da72959a034cd1318d Mon Sep 17 00:00:00 2001<br>
+From: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com" target=3D"_=
blank">fweimer@redhat.com</a>&gt;<br>
+Date: Mon, 19 Jun 2017 22:32:12 +0200<br>
+Subject: [PATCH] ld.so: Reject overly long LD_AUDIT path elements<br>
+<br>
+Also only process the last LD_AUDIT entry.<br>
+<br>
+(cherry picked from commit 81b82fb966ffbd94353f793ad17116c6088dedd9)<br>
+<br>
+Upstream-Status: Backport<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D2febff=
860b31df3666bef5ade0d0744c93f76a74" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D2febff860b31df3666be=
f5ade0d0744c93f76a74</a><br>
+<a href=3D"https://anonscm.debian.org/cgit/pkg-glibc/glibc.git/commit/?h=
=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb" rel=3D"norefe=
rrer" target=3D"_blank">https://anonscm.debian.org/cgit/pkg-glibc/glibc.git=
/commit/?h=3Dstretch&amp;id=3D2755c57269f24e9d59c22c49788f92515346c1bb</a><=
br>
+<br>
+CVE: CVE-2017-1000366<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
+---<br>
+ ChangeLog=C2=A0 |=C2=A0 11 +++++++<br>
+ elf/rtld.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++----=
-----<br>
+ 2 files changed, 106 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index ea5ecd4a1e..638cb632b1 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,14 @@<br>
++2017-06-19=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 * elf/rtld.c (audit_list_string): New variable.<br>
++=C2=A0 =C2=A0 =C2=A0 (audit_list): Update comment.<br>
++=C2=A0 =C2=A0 =C2=A0 (struct audit_list_iter): Define.<br>
++=C2=A0 =C2=A0 =C2=A0 (audit_list_iter_init, audit_list_iter_next): New fu=
nction.<br>
++=C2=A0 =C2=A0 =C2=A0 (dl_main): Use struct audit_list_iter to process aud=
it modules.<br>
++=C2=A0 =C2=A0 =C2=A0 (process_dl_audit): Call dso_name_valid_for_suid.<br=
>
++=C2=A0 =C2=A0 =C2=A0 (process_envvars): Set audit_list_string instead of =
calling<br>
++=C2=A0 =C2=A0 =C2=A0 process_dl_audit.<br>
++<br>
+ 2017-06-19=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redha=
t.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LI=
MIT): Define.<br>
+diff --git a/elf/rtld.c b/elf/rtld.c<br>
+index 1d8eab9fe2..302bb63620 100644<br>
+--- a/elf/rtld.c<br>
++++ b/elf/rtld.c<br>
+@@ -129,13 +129,91 @@ dso_name_valid_for_suid (const char *p)<br>
+=C2=A0 =C2=A0return *p !=3D &#39;\0&#39;;<br>
+ }<br>
+<br>
+-/* List of auditing DSOs.=C2=A0 */<br>
++/* LD_AUDIT variable contents.=C2=A0 Must be processed before the<br>
++=C2=A0 =C2=A0audit_list below.=C2=A0 */<br>
++const char *audit_list_string;<br>
++<br>
++/* Cyclic list of auditing DSOs.=C2=A0 audit_list-&gt;next is the first<b=
r>
++=C2=A0 =C2=A0element.=C2=A0 */<br>
+ static struct audit_list<br>
+ {<br>
+=C2=A0 =C2=A0const char *name;<br>
+=C2=A0 =C2=A0struct audit_list *next;<br>
+ } *audit_list;<br>
+<br>
++/* Iterator for audit_list_string followed by audit_list.=C2=A0 */<br>
++struct audit_list_iter<br>
++{<br>
++=C2=A0 /* Tail of audit_list_string still needing processing, or NULL.=C2=
=A0 */<br>
++=C2=A0 const char *audit_list_tail;<br>
++<br>
++=C2=A0 /* The list element returned in the previous iteration.=C2=A0 NULL=
 before<br>
++=C2=A0 =C2=A0 =C2=A0the first element.=C2=A0 */<br>
++=C2=A0 struct audit_list *previous;<br>
++<br>
++=C2=A0 /* Scratch buffer for returning a name which is part of<br>
++=C2=A0 =C2=A0 =C2=A0audit_list_string.=C2=A0 */<br>
++=C2=A0 char fname[SECURE_NAME_LIMIT];<br>
++};<br>
++<br>
++/* Initialize an audit list iterator.=C2=A0 */<br>
++static void<br>
++audit_list_iter_init (struct audit_list_iter *iter)<br>
++{<br>
++=C2=A0 iter-&gt;audit_list_tail =3D audit_list_string;<br>
++=C2=A0 iter-&gt;previous =3D NULL;<br>
++}<br>
++<br>
++/* Iterate through both audit_list_string and audit_list.=C2=A0 */<br>
++static const char *<br>
++audit_list_iter_next (struct audit_list_iter *iter)<br>
++{<br>
++=C2=A0 if (iter-&gt;audit_list_tail !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* First iterate over audit_list_string.=C2=A0 */<br=
>
++=C2=A0 =C2=A0 =C2=A0 while (*iter-&gt;audit_list_tail !=3D &#39;\0&#39;)<=
br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Split audit list at colon.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strcspn (iter-&gt;audit_list_t=
ail, &quot;:&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; 0 &amp;&amp; len &lt; sizeof (it=
er-&gt;fname))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy (iter-&gt;fname, iter-&g=
t;audit_list_tail, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;fname[len] =3D &#39;\0=
&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do not return this name to the call=
er.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;fname[0] =3D &#39;\0&#39;;<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip over the substring and the following =
delimiter.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;audit_list_tail +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*iter-&gt;audit_list_tail =3D=3D &#39;:&#=
39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++iter-&gt;audit_list_tail;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the name is valid, return it.=C2=A0 */<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dso_name_valid_for_suid (iter-&gt;fname))=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return iter-&gt;fname;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Otherwise, wrap around and try the next na=
me.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 /* Fall through to the procesing of audit_list.=C2=
=A0 */<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (iter-&gt;previous =3D=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (audit_list =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 /* No pre-parsed audit list.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 /* Start of audit list.=C2=A0 The first list element=
 is at<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0audit_list-&gt;next (cyclic list).=C2=A0 */<br=
>
++=C2=A0 =C2=A0 =C2=A0 iter-&gt;previous =3D audit_list-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 return iter-&gt;previous-&gt;name;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (iter-&gt;previous =3D=3D audit_list)<br>
++=C2=A0 =C2=A0 /* Cyclic list wrap-around.=C2=A0 */<br>
++=C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 iter-&gt;previous =3D iter-&gt;previous-&gt;next;<br>
++=C2=A0 return iter-&gt;previous-&gt;name;<br>
++}<br>
++<br>
+ #ifndef HAVE_INLINED_SYSCALLS<br>
+ /* Set nonzero during loading and initialization of executable and<br>
+=C2=A0 =C2=A0 libraries, cleared before the executable&#39;s entry point r=
uns.=C2=A0 This<br>
+@@ -1322,11 +1400,13 @@ of this helper program; chances are you did not in=
tend to run this program.\n\<br>
+=C2=A0 =C2=A0 =C2=A0GL(dl_rtld_map).l_tls_modid =3D _dl_next_tls_modid ();=
<br>
+<br>
+=C2=A0 =C2=A0/* If we have auditing DSOs to load, do it now.=C2=A0 */<br>
+-=C2=A0 if (__glibc_unlikely (audit_list !=3D NULL))<br>
++=C2=A0 bool need_security_init =3D true;<br>
++=C2=A0 if (__glibc_unlikely (audit_list !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 || __glibc_unlikely (audit_list_string !=3D NULL))<b=
r>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Iterate over all entries in the list.=C2=A0 The o=
rder is important.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct audit_ifaces *last_audit =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 struct audit_list *al =3D audit_list-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 struct audit_list_iter al_iter;<br>
++=C2=A0 =C2=A0 =C2=A0 audit_list_iter_init (&amp;al_iter);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Since we start using the auditing DSOs right=
 away we need to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initialize the data structures now.=C2=A0 */<b=
r>
+@@ -1337,9 +1417,14 @@ of this helper program; chances are you did not int=
end to run this program.\n\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 use different values (especially the pointer g=
uard) and will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail later on.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0security_init ();<br>
++=C2=A0 =C2=A0 =C2=A0 need_security_init =3D false;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 do<br>
++=C2=A0 =C2=A0 =C2=A0 while (true)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name =3D audit_list_iter_next (&a=
mp;al_iter);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int tls_idx =3D GL(dl_tls_max_dtv_idx);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Now it is time to determine the layou=
t of the static TLS<br>
+@@ -1348,7 +1433,7 @@ of this helper program; chances are you did not inte=
nd to run this program.\n\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no DF_STATIC_TLS bit is set.=C2=
=A0 The reason is that we know<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glibc will use the static model.=
=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dlmopen_args dlmargs;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dlmargs.fname =3D al-&gt;name;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dlmargs.fname =3D name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlmargs.map =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *objname;<br>
+@@ -1361,7 +1446,7 @@ of this helper program; chances are you did not inte=
nd to run this program.\n\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not_loaded:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_error_printf (&quot;\<=
br>
+ ERROR: ld.so: object &#39;%s&#39; cannot be loaded as audit interface: %s=
; ignored.\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 al-&gt;name, err_str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, err_str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (malloced)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free ((char *) err_=
str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1465,10 +1550,7 @@ ERROR: ld.so: object &#39;%s&#39; cannot be loaded =
as audit interface: %s; ignored.\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto not_loa=
ded;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 al =3D al-&gt;next;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 while (al !=3D audit_list-&gt;next);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have any auditing modules, announce th=
at we already<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 have two objects loaded.=C2=A0 */<br>
+@@ -1732,7 +1814,7 @@ ERROR: ld.so: object &#39;%s&#39; cannot be loaded a=
s audit interface: %s; ignored.\n&quot;,<br>
+=C2=A0 =C2=A0if (tcbp =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0tcbp =3D init_tls ();<br>
+<br>
+-=C2=A0 if (__glibc_likely (audit_list =3D=3D NULL))<br>
++=C2=A0 if (__glibc_likely (need_security_init))<br>
+=C2=A0 =C2=A0 =C2=A0/* Initialize security features.=C2=A0 But only if we =
have not done it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 earlier.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0security_init ();<br>
+@@ -2363,9 +2445,7 @@ process_dl_audit (char *str)<br>
+=C2=A0 =C2=A0char *p;<br>
+<br>
+=C2=A0 =C2=A0while ((p =3D (strsep) (&amp;str, &quot;:&quot;)) !=3D NULL)<=
br>
+-=C2=A0 =C2=A0 if (p[0] !=3D &#39;\0&#39;<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (__builtin_expect (! __libc_enable_secure=
, 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strchr (p, &#39;/&#39;) =3D=3D NULL=
))<br>
++=C2=A0 =C2=A0 if (dso_name_valid_for_suid (p))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is using the local malloc, not the syst=
em malloc.=C2=A0 The<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory can never be freed.=C2=A0 */<br>
+@@ -2429,7 +2509,7 @@ process_envvars (enum mode *modep)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp (envline, &quot;AUDIT&quot;, =
5) =3D=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_dl_audit (&amp;envline[6]);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audit_list_string =3D &amp;envline[6];=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 7:<br>
+--<br>
+2.15.0<br>
+<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.24.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.24.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.24.bb</a><br>
index 4c7d901149..4eba6aceb6 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.24.bb</a><br>
@@ -46,6 +46,9 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Remove-__ASSUME_REQUE=
UE_PI.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Fix-atomic_fetch_xor_=
release.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-CVE-2015-5180-resolv-=
Fix-crash-with-internal-QTYPE-B.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2017-1000366-Igno=
re-LD_LIBRARY_PATH-for-AT_SECUR.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-ld.so-Reject-overly-l=
ong-LD_PRELOAD-path-elements.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-ld.so-Reject-overly-l=
ong-LD_AUDIT-path-elements.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;\<br>
--<br>
2.15.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--089e08244d58b39f15055e10fc6d--
