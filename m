Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.42079.1629218828646235212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 09:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpMD3Nti;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso7250762pjy.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=fnsT3+fI/a7et6aHZRTO/VePfVj+uHm7OE9OfIFUi5w=;
        b=TpMD3Nti6XqYictj2Zgkm994QXzO2mKr5HN/2Cikgty9NarnGokRUBQTaH/RlOd7Ii
         7a/BWa4cCvYf+VaFj3w84v5eovoVoXhH6E0PxneA2sbdrpZSxdrGxSSX9JjP1jgk5GyW
         qbEgwnoFu/UJc6wmORSL/K9NzA7ytvnewElGQOdb7dOl8nRDQur/h6P+6CLgERuLGnGO
         PKidpqyV5QEBC3sBoJVidcE5khYm73jNu7OJrNYhaUWRYNlgJD/BMxqxs371cnRvMKr4
         acte7nN0Wox8e5WVHpWBfbzGPKbu1j1aDnuUh79q29VllhX54JGsFin9DfVWV+C/pF0B
         jiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=fnsT3+fI/a7et6aHZRTO/VePfVj+uHm7OE9OfIFUi5w=;
        b=hmGHTSl9F4JeLyZLlgY0zFkfsaq8K1M4he07vsptkRExINKTeDqA0idF0ypk+3suPY
         VHHqGrNlsUgjHBVqvxGsIVWf/D5nxmGtnySTrXXyPu7766foZ0ktbOy4iYSL8CspNuyb
         js1EoiIlYtdsd5pihNYS4tjJE2I3V3b9SXm5QNFpY/vvhFmygcZG8YpKK226wd6MfnFO
         IqksJtR2ZidJzSHhgAbDPQChsnGBudI2TIZePTSvwGMCmTP53z6d6p9tXo5bcW1Bwf4g
         gJylQxrRC/L0dZ91JWXsEW1Kn6uCGaviPu2u0gdJUFJ6+eLqUe09rtMeep6aQZY/kad2
         XkiQ==
X-Gm-Message-State: AOAM533GGLglhuE/OIJ72eMFRgOpYw3sqqy3KSsPsLy6IB4ROCty77U+
	oTWD86cgMhtWqvVpUQkeI0w=
X-Google-Smtp-Source: ABdhPJxXn2RV4hPXuXV9kC05gD0/U05jPPC0Vt0DlFfSiwoC6e4rvkqI/aCgl8rM7MaBIhDzy7FefQ==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr4370366pgh.211.1629218828159;
        Tue, 17 Aug 2021 09:47:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:1c82:e45d:69ec:9a23? ([2601:646:9200:a0f0:1c82:e45d:69ec:9a23])
        by smtp.gmail.com with UTF8SMTPSA id q21sm3707012pgk.71.2021.08.17.09.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 09:47:07 -0700 (PDT)
Message-ID: <6c073c98-b5c8-20f3-46ee-659b39435b94@gmail.com>
Date: Tue, 17 Aug 2021 09:47:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [OE-core] [PATCH 2/2] binutils: Apply upstream patch to fix 'too many open files' on qtwebengine
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210817143255.2529848-1-schnitzeltony@gmail.com>
 <20210817143255.2529848-2-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210817143255.2529848-2-schnitzeltony@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/17/21 7:32 AM, Andreas Müller wrote:
> Since upgrade of binutils to 2.37 builds of qtwebengine failed to link even
> with ulimits -n 1000000 (!!).
> Fix that by applying a patch from stable 'binutils-2_37-branch'.
> 


lgtm

> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../binutils/binutils-2.37.inc                |   1 +
>   ...le-descriptor-if-there-is-no-archive.patch | 234 ++++++++++++++++++
>   2 files changed, 235 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
> index 4218c0a616..6093558e4b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -35,5 +35,6 @@ SRC_URI = "\
>        file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>        file://0015-sync-with-OE-libtool-changes.patch \
>        file://0016-Check-for-clang-before-checking-gcc-version.patch \
> +     file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
>   "
>   S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> new file mode 100644
> index 0000000000..9becee39a2
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> @@ -0,0 +1,234 @@
> +From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Mon, 26 Jul 2021 05:59:55 -0700
> +Subject: [PATCH] bfd: Close the file descriptor if there is no archive fd
> +
> +Close the file descriptor if there is no archive plugin file descriptor
> +to avoid running out of file descriptors on thin archives with many
> +archive members.
> +
> +bfd/
> +
> +	PR ld/28138
> +	* plugin.c (bfd_plugin_close_file_descriptor): Close the file
> +	descriptor there is no archive plugin file descriptor.
> +
> +ld/
> +
> +	PR ld/28138
> +	* testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
> +	native build.
> +
> +	PR ld/28138
> +	* testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
> +	* testsuite/ld-plugin/pr28138.c: New file.
> +	* testsuite/ld-plugin/pr28138-1.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-2.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-3.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-4.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-5.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-6.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-7.c: Likewise.
> +
> +(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
> +(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
> +
> +Upstream-Status: Accepted[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
> +---
> + bfd/plugin.c                       |  8 +++++++
> + ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
> + ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
> + 10 files changed, 104 insertions(+)
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138.c
> +
> +diff --git a/bfd/plugin.c b/bfd/plugin.c
> +index 6cfa2b66470..3bab8febe88 100644
> +--- a/bfd/plugin.c
> ++++ b/bfd/plugin.c
> +@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd)
> + 	     && !bfd_is_thin_archive (abfd->my_archive))
> + 	abfd = abfd->my_archive;
> +
> ++      /* Close the file descriptor if there is no archive plugin file
> ++	 descriptor.  */
> ++      if (abfd->archive_plugin_fd == -1)
> ++	{
> ++	  close (fd);
> ++	  return;
> ++	}
> ++
> +       abfd->archive_plugin_fd_open_count--;
> +       /* Dup the archive plugin file descriptor for later use, which
> + 	 will be closed by _bfd_archive_close_and_cleanup.  */
> +diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto.exp
> +index def69e43ab3..999d911ce6a 100644
> +--- a/ld/testsuite/ld-plugin/lto.exp
> ++++ b/ld/testsuite/ld-plugin/lto.exp
> +@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available] } {
> +     }
> + }
> +
> ++run_cc_link_tests [list \
> ++    [list \
> ++	"Build pr28138.a" \
> ++	"-T" "" \
> ++	{pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
> ++	 pr28138-6.c pr28138-7.c} {} "pr28138.a" \
> ++    ] \
> ++    [list \
> ++	"Build pr28138.o" \
> ++	"" "" \
> ++	{pr28138.c} {} \
> ++    ] \
> ++]
> ++
> ++set exec_output [run_host_cmd "sh" \
> ++			      "-c \"ulimit -n 20; \
> ++			      $CC -Btmpdir/ld -o tmpdir/pr28138 \
> ++			      tmpdir/pr28138.o tmpdir/pr28138.a\""]
> ++set exec_output [prune_warnings $exec_output]
> ++if [string match "" $exec_output] then {
> ++    if { [isnative] } {
> ++	set exec_output [run_host_cmd "tmpdir/pr28138" ""]
> ++	if [string match "PASS" $exec_output] then {
> ++	    pass "PR ld/28138"
> ++	} else {
> ++	    fail "PR ld/28138"
> ++	}
> ++    } else {
> ++	pass "PR ld/28138"
> ++    }
> ++} else {
> ++    fail "PR ld/28138"
> ++}
> ++
> + set testname "Build liblto-11.a"
> + remote_file host delete "tmpdir/liblto-11.a"
> + set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a tmpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
> +diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin/pr28138-1.c
> +new file mode 100644
> +index 00000000000..51d119e1642
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-1.c
> +@@ -0,0 +1,6 @@
> ++extern int a0(void);
> ++int
> ++a1(void)
> ++{
> ++  return 1 + a0();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin/pr28138-2.c
> +new file mode 100644
> +index 00000000000..1120cd797e9
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-2.c
> +@@ -0,0 +1,6 @@
> ++extern int a1(void);
> ++int
> ++a2(void)
> ++{
> ++  return 1 + a1();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin/pr28138-3.c
> +new file mode 100644
> +index 00000000000..ec464947ee6
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-3.c
> +@@ -0,0 +1,6 @@
> ++extern int a2(void);
> ++int
> ++a3(void)
> ++{
> ++  return 1 + a2();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin/pr28138-4.c
> +new file mode 100644
> +index 00000000000..475701b2c5c
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-4.c
> +@@ -0,0 +1,6 @@
> ++extern int a3(void);
> ++int
> ++a4(void)
> ++{
> ++  return 1 + a3();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin/pr28138-5.c
> +new file mode 100644
> +index 00000000000..e24f86c363e
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-5.c
> +@@ -0,0 +1,6 @@
> ++extern int a4(void);
> ++int
> ++a5(void)
> ++{
> ++  return 1 + a4();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin/pr28138-6.c
> +new file mode 100644
> +index 00000000000..b5b938bdb21
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-6.c
> +@@ -0,0 +1,6 @@
> ++extern int a5(void);
> ++int
> ++a6(void)
> ++{
> ++  return 1 + a5();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin/pr28138-7.c
> +new file mode 100644
> +index 00000000000..4ef75bf0f0c
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-7.c
> +@@ -0,0 +1,6 @@
> ++extern int a6(void);
> ++int
> ++a7(void)
> ++{
> ++  return 1 + a6();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/pr28138.c
> +new file mode 100644
> +index 00000000000..68252c9f382
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138.c
> +@@ -0,0 +1,20 @@
> ++#include <stdio.h>
> ++
> ++extern int a7(void);
> ++
> ++int
> ++a0(void)
> ++{
> ++  return 0;
> ++}
> ++
> ++int
> ++main()
> ++{
> ++  if (a7() == 7)
> ++    {
> ++      printf ("PASS\n");
> ++      return 0;
> ++    }
> ++  return 1;
> ++}
> +--
> +2.31.1
> +
> 
> 
> 
> 
> 
