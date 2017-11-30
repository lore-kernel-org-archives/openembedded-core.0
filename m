Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 034CC77811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 15:16:20 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id d21so4403554pll.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=uwXE3tCHQngwhnbw4cNtcFWCzggW/noHi/JM4aS3a3g=;
	b=I1kCSi6aEj+BsvxzT7pMwbIE8OrHmeHgc9Ca7ljVufWvIaW/7muJ3USqaHucVPsTOe
	QYJzZ+LPZ4R8RgZes52UyoaQI/w7OI44Pj6THVArKyoFNREVSmEc1M247nSLm9MdUlDv
	PKsS1Qai0QIJR8Jxg6tg6h4OhRDpfF8yL6gBXrgOf8y4WwsGzXdzUTdsUMA87x22NpE4
	ZAYBtcY3rn2RzTWR+soOwM6L9oAmR3TLPDcXiTwS/yj2fx5u01gJ2TiUUWMFgdEMhzsa
	UK5OM8P43bC7OWFN95qlUJuW++bMA3uIV+T6Qhc7wGFqIP9Nx+tAGlcN4+75u9L/EeD+
	U7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uwXE3tCHQngwhnbw4cNtcFWCzggW/noHi/JM4aS3a3g=;
	b=fwc+AioZYSiDVoLEsr287ovrLYGTmzOT6RdzlDtlrui8p5J9hZ01qlTPeW640nzamH
	YBOFECxoWi4dJAkf7Baa7SeRDsKO0dCMapkx0SBq/VmrKPHHEaqiRjU9ogxNFV/SaB5o
	PLYTOVvc6mtz3zs0xRtNQdTEEzSiMpI/kRLwuNBP0kdEnqmzcgAEYz2lDTCzh1PGJwId
	djfVhOMBlSQkP20gCiRrxfxZn6dMVZCyxMRTweklgBki8Gmhe8mbmNaeEbVTOEF5h+J4
	rO8+A6xpqDIh5m3fd8OurOqAhWhjW3CSMZCjH0B/5dl7YBgW18dEll/n++cJX7AFtkIB
	C4kA==
X-Gm-Message-State: AJaThX6FaMeKjGviHXLKC0O1/vC3nmtfKjMnqROEBeNgbErd8uKdTexj
	LvdZKnbJOvPhg7I8jshmDtyczQ==
X-Google-Smtp-Source: AGs4zMbxcZ/5JldIcHCmZTbku3DITzam2MM3kiukVP40Aif6/MwYfs+MQcVrqkPdvlWYgpCYMN2dwg==
X-Received: by 10.159.229.136 with SMTP id az8mr2938872plb.423.1512054981251; 
	Thu, 30 Nov 2017 07:16:21 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:d931:40ea:f4e3:3a31?
	([2601:202:4001:9ea0:d931:40ea:f4e3:3a31])
	by smtp.gmail.com with ESMTPSA id
	i16sm7407374pgv.46.2017.11.30.07.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 07:16:20 -0800 (PST)
To: George McCollister <george.mccollister@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171121200352.6348-1-george.mccollister@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a4c0420e-9c6b-0702-68c2-7c504660a15e@gmail.com>
Date: Thu, 30 Nov 2017 07:16:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171121200352.6348-1-george.mccollister@gmail.com>
Subject: Re: [pyro][PATCH] glibc: Fix CVE-2017-1000366
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
X-List-Received-Date: Thu, 30 Nov 2017 15:16:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/21/2017 12:03 PM, George McCollister wrote:
> Add backported patches from the upstream release/2.25/master branch to
> fix CVE-2017-1000366. Also add a backported patch that resolves SSE
> related build problems introduced by these patches.

Thanks for the patch. This series causes an error when: bitbake
core-image-sato -c populate_sdk, so its on hold.


t -MT
/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/build-x86_64-pokysdk-linux/elf/dl-runtime.os
| cc1: all warnings being treated as errors
| ../o-iterator.mk:9: recipe for target
'/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/build-x86_64-pokysdk-linux/elf/rtld.os'
failed
| make[2]: ***
[/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/build-x86_64-pokysdk-linux/elf/rtld.os]
Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
'/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/git/elf'
| Makefile:235: recipe for target 'elf/subdir_lib' failed
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory
'/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/git'
| Makefile:9: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/build/build_artifacts/pyro/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-glibc/2.25-r0/temp/log.do_compile.24883)
ERROR: Task
(virtual:nativesdk:/home/akuster/OE/pyro/poky-contrib/meta/recipes-core/glibc/glibc_2.25.bb:do_compile)
failed with exit code '1'


>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  70 +++++++
>  ...ject-overly-long-LD_PRELOAD-path-elements.patch | 144 +++++++++++++
>  ...Reject-overly-long-LD_AUDIT-path-elements.patch | 230 +++++++++++++++++++++
>  ...ssing-IS_IN-libc-guards-to-vectorized-str.patch |  62 ++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |   4 +
>  5 files changed, 510 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0030-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0031-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch b/meta/recipes-core/glibc/glibc/0028-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> new file mode 100644
> index 0000000000..0178d50ff0
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
> @@ -0,0 +1,70 @@
> +From 4002021818bc31aec9b353c6e13ce9f82e84cd38 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 18:31:27 +0200
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
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=3c7cd21290cabdadd72984fb69bc51e64ff1002d
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
> +index f140ee67de..7bfdf45bb5 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	[BZ #21624]
> ++	CVE-2017-1000366
> ++	* elf/rtld.c (process_envvars): Ignore LD_LIBRARY_PATH for
> ++	__libc_enable_secure.
> ++
> + 2017-02-05  Siddhesh Poyarekar  <siddhesh@sourceware.org>
> + 
> + 	* version.h (RELEASE): Set to "stable"
> +diff --git a/NEWS b/NEWS
> +index ec15dde761..f7d38536d6 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -5,6 +5,7 @@ See the end for copying conditions.
> + Please send GNU C library bug reports via <http://sourceware.org/bugzilla/>
> + using `glibc' in the "product" field.
> + 
> ++  [21624] Unsafe alloca allows local attackers to alias stack and heap (CVE-2017-1000366)
> + Version 2.25
> + 
> + * The feature test macro __STDC_WANT_LIB_EXT2__, from ISO/IEC TR
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index a036ece956..2fc33a6178 100644
> +--- a/elf/rtld.c
> ++++ b/elf/rtld.c
> +@@ -2418,7 +2418,8 @@ process_envvars (enum mode *modep)
> + 
> + 	case 12:
> + 	  /* The library search path.  */
> +-	  if (memcmp (envline, "LIBRARY_PATH", 12) == 0)
> ++	  if (!__libc_enable_secure
> ++	      && memcmp (envline, "LIBRARY_PATH", 12) == 0)
> + 	    {
> + 	      library_path = &envline[13];
> + 	      break;
> +-- 
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0029-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch b/meta/recipes-core/glibc/glibc/0029-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> new file mode 100644
> index 0000000000..142bd86d2f
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
> @@ -0,0 +1,144 @@
> +From d4fe2023bb908b85d577ac3843acd44bada330ce Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 22:31:04 +0200
> +Subject: [PATCH] ld.so: Reject overly long LD_PRELOAD path elements
> +
> +(cherry picked from commit 6d0ba622891bed9d8394eef1935add53003b12e8)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=46703a3995aa3ca2b816814aa4ad05ed524194dd
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
> +index 7bfdf45bb5..0aff2bd347 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	* elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LIMIT): Define.
> ++	(dso_name_valid_for_suid): New function.
> ++	(handle_ld_preload): Likewise.
> ++	(dl_main): Call it.  Remove alloca.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> + 
> + 	[BZ #21624]
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 2fc33a6178..4badcf6590 100644
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
> ++	 programs, and also skip overlong names.  */
> ++      size_t len = strlen (p);
> ++      if (len >= SECURE_NAME_LIMIT || memchr (p, '/', len) != NULL)
> ++	return false;
> ++    }
> ++  return *p != '\0';
> ++}
> + 
> + /* List of auditing DSOs.  */
> + static struct audit_list
> +@@ -716,6 +745,42 @@ static const char *preloadlist attribute_relro;
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
> ++	{
> ++	  memcpy (fname, p, len);
> ++	  fname[len] = '\0';
> ++	}
> ++      else
> ++	fname[0] = '\0';
> ++
> ++      /* Skip over the substring and the following delimiter.  */
> ++      p += len;
> ++      if (*p != '\0')
> ++	++p;
> ++
> ++      if (dso_name_valid_for_suid (fname))
> ++	npreloads += do_preload (fname, main_map, "LD_PRELOAD");
> ++    }
> ++  return npreloads;
> ++}
> ++
> + static void
> + dl_main (const ElfW(Phdr) *phdr,
> + 	 ElfW(Word) phnum,
> +@@ -1462,23 +1527,8 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> + 
> +   if (__glibc_unlikely (preloadlist != NULL))
> +     {
> +-      /* The LD_PRELOAD environment variable gives list of libraries
> +-	 separated by white space or colons that are loaded before the
> +-	 executable's dependencies and prepended to the global scope
> +-	 list.  If the binary is running setuid all elements
> +-	 containing a '/' are ignored since it is insecure.  */
> +-      char *list = strdupa (preloadlist);
> +-      char *p;
> +-
> +       HP_TIMING_NOW (start);
> +-
> +-      /* Prevent optimizing strsep.  Speed is not important here.  */
> +-      while ((p = (strsep) (&list, " :")) != NULL)
> +-	if (p[0] != '\0'
> +-	    && (__builtin_expect (! __libc_enable_secure, 1)
> +-		|| strchr (p, '/') == NULL))
> +-	  npreloads += do_preload (p, main_map, "LD_PRELOAD");
> +-
> ++      npreloads += handle_ld_preload (preloadlist, main_map);
> +       HP_TIMING_NOW (stop);
> +       HP_TIMING_DIFF (diff, start, stop);
> +       HP_TIMING_ACCUM_NT (load_time, diff);
> +-- 
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0030-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch b/meta/recipes-core/glibc/glibc/0030-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> new file mode 100644
> index 0000000000..2b633e730d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0030-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
> @@ -0,0 +1,230 @@
> +From 3e09d900f710318eddc474644aeb2e496be0ce02 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Jun 2017 22:32:12 +0200
> +Subject: [PATCH] ld.so: Reject overly long LD_AUDIT path elements
> +
> +Also only process the last LD_AUDIT entry.
> +
> +(cherry picked from commit 81b82fb966ffbd94353f793ad17116c6088dedd9)
> +
> +Upstream-Status: Backport
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=c69d4a0f680a24fdbe323764a50382ad324041e9
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
> +index 0aff2bd347..94ba05ed1f 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,14 @@
> ++2017-06-19  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	* elf/rtld.c (audit_list_string): New variable.
> ++	(audit_list): Update comment.
> ++	(struct audit_list_iter): Define.
> ++	(audit_list_iter_init, audit_list_iter_next): New function.
> ++	(dl_main): Use struct audit_list_iter to process audit modules.
> ++	(process_dl_audit): Call dso_name_valid_for_suid.
> ++	(process_envvars): Set audit_list_string instead of calling
> ++	process_dl_audit.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> + 
> + 	* elf/rtld.c (SECURE_NAME_LIMIT, SECURE_PATH_LIMIT): Define.
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 4badcf6590..369724babe 100644
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
> ++	{
> ++	  /* Split audit list at colon.  */
> ++	  size_t len = strcspn (iter->audit_list_tail, ":");
> ++	  if (len > 0 && len < sizeof (iter->fname))
> ++	    {
> ++	      memcpy (iter->fname, iter->audit_list_tail, len);
> ++	      iter->fname[len] = '\0';
> ++	    }
> ++	  else
> ++	    /* Do not return this name to the caller.  */
> ++	    iter->fname[0] = '\0';
> ++
> ++	  /* Skip over the substring and the following delimiter.  */
> ++	  iter->audit_list_tail += len;
> ++	  if (*iter->audit_list_tail == ':')
> ++	    ++iter->audit_list_tail;
> ++
> ++	  /* If the name is valid, return it.  */
> ++	  if (dso_name_valid_for_suid (iter->fname))
> ++	    return iter->fname;
> ++	  /* Otherwise, wrap around and try the next name.  */
> ++	}
> ++      /* Fall through to the procesing of audit_list.  */
> ++    }
> ++
> ++  if (iter->previous == NULL)
> ++    {
> ++      if (audit_list == NULL)
> ++	/* No pre-parsed audit list.  */
> ++	return NULL;
> ++      /* Start of audit list.  The first list element is at
> ++	 audit_list->next (cyclic list).  */
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
> +@@ -1303,11 +1381,13 @@ of this helper program; chances are you did not intend to run this program.\n\
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
> + 	 initialize the data structures now.  */
> +@@ -1318,9 +1398,14 @@ of this helper program; chances are you did not intend to run this program.\n\
> + 	 use different values (especially the pointer guard) and will
> + 	 fail later on.  */
> +       security_init ();
> ++      need_security_init = false;
> + 
> +-      do
> ++      while (true)
> + 	{
> ++	  const char *name = audit_list_iter_next (&al_iter);
> ++	  if (name == NULL)
> ++	    break;
> ++
> + 	  int tls_idx = GL(dl_tls_max_dtv_idx);
> + 
> + 	  /* Now it is time to determine the layout of the static TLS
> +@@ -1329,7 +1414,7 @@ of this helper program; chances are you did not intend to run this program.\n\
> + 	     no DF_STATIC_TLS bit is set.  The reason is that we know
> + 	     glibc will use the static model.  */
> + 	  struct dlmopen_args dlmargs;
> +-	  dlmargs.fname = al->name;
> ++	  dlmargs.fname = name;
> + 	  dlmargs.map = NULL;
> + 
> + 	  const char *objname;
> +@@ -1342,7 +1427,7 @@ of this helper program; chances are you did not intend to run this program.\n\
> + 	    not_loaded:
> + 	      _dl_error_printf ("\
> + ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +-				al->name, err_str);
> ++				name, err_str);
> + 	      if (malloced)
> + 		free ((char *) err_str);
> + 	    }
> +@@ -1446,10 +1531,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> + 		  goto not_loaded;
> + 		}
> + 	    }
> +-
> +-	  al = al->next;
> + 	}
> +-      while (al != audit_list->next);
> + 
> +       /* If we have any auditing modules, announce that we already
> + 	 have two objects loaded.  */
> +@@ -1713,7 +1795,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> +   if (tcbp == NULL)
> +     tcbp = init_tls ();
> + 
> +-  if (__glibc_likely (audit_list == NULL))
> ++  if (__glibc_likely (need_security_init))
> +     /* Initialize security features.  But only if we have not done it
> +        earlier.  */
> +     security_init ();
> +@@ -2344,9 +2426,7 @@ process_dl_audit (char *str)
> +   char *p;
> + 
> +   while ((p = (strsep) (&str, ":")) != NULL)
> +-    if (p[0] != '\0'
> +-	&& (__builtin_expect (! __libc_enable_secure, 1)
> +-	    || strchr (p, '/') == NULL))
> ++    if (dso_name_valid_for_suid (p))
> +       {
> + 	/* This is using the local malloc, not the system malloc.  The
> + 	   memory can never be freed.  */
> +@@ -2410,7 +2490,7 @@ process_envvars (enum mode *modep)
> + 	      break;
> + 	    }
> + 	  if (memcmp (envline, "AUDIT", 5) == 0)
> +-	    process_dl_audit (&envline[6]);
> ++	    audit_list_string = &envline[6];
> + 	  break;
> + 
> + 	case 7:
> +-- 
> +2.15.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/0031-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch b/meta/recipes-core/glibc/glibc/0031-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
> new file mode 100644
> index 0000000000..eeba66d30f
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0031-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch
> @@ -0,0 +1,62 @@
> +From b30b4ac52748507c8a87c2bd1869f42fbf5b4f99 Mon Sep 17 00:00:00 2001
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
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=adc7e06fb412a2a1ee52f8cb788caf436335b9f3
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
> +index 94ba05ed1f..9eb60e7728 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2017-06-14  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	* sysdeps/i386/i686/multiarch/strcspn-c.c: Add IS_IN (libc) guard.
> ++	* sysdeps/i386/i686/multiarch/varshift.c: Likewise.
> ++
> + 2017-06-19  Florian Weimer  <fweimer@redhat.com>
> + 
> + 	* elf/rtld.c (audit_list_string): New variable.
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
> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
> index cf9c4f71b8..e9ef0e0d5e 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
> @@ -42,6 +42,10 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
> +           file://0028-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch \
> +           file://0029-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch \
> +           file://0030-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch \
> +           file://0031-i686-Add-missing-IS_IN-libc-guards-to-vectorized-str.patch \
>  "
>  
>  NATIVESDKFIXES ?= ""


