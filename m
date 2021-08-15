Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.8850.1629013786228799875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 00:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IO6GNIVY;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id n17so28148416lft.13
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/emCG+SnzRWYEVzluLfYMwTT2sr91CWE7WMdQqhJHo=;
        b=IO6GNIVYPc6xZWd6nnVkwVX2D2ZKf4MmsBcqTZQk3HkOyglbGsvHpxSCbze/l0nSuQ
         98dfCzWH1bWyZ+yuDznHPKRLLV+KbA0SkxD8NH3m79f910BV71/yBx4Dhrc9K6B9H6nS
         02AsoyXRJCYAL0jRLsuEj1c6Q/9lVl2JcoOsfbwfgI7TrCTRrAdWSmwz9Ey1dpayTXRR
         ThGYzb6B36JAFKYIDJUSIz//oQ90WeI8CSYQ+fPQDgwKXvncUHB/yGcEcL0QsaTpyy93
         YQ75LTnz4BYgJzBz8XFOo7cHkZcR9YVvfAQbt30TMHEayyBag48wWdIhOGVtx2Kcp6Wj
         JfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/emCG+SnzRWYEVzluLfYMwTT2sr91CWE7WMdQqhJHo=;
        b=Y+u/TNXfD6klHWoxA2MtwJaTvOrQF+aFMRr/HugYIrVWu6ncelfp5eQkxS79tONjW4
         e38MZcbk5YaRM80YT1k9QgNezHquHVLRiAUEAOqgRgDpp8pm6z9dp3HTHnjWj0DJib6x
         h0OmCgsmLwOq+JOLoH0CEf1KTvuxCEbef4vphVeLyLSmlEYU9vmAfMcoQ8XD3zlLyudc
         zWFNSrO0M6O+7k/hY+uiJjmLOp4ALceMKfRL+fR5TlZ1o38GShXrKvpPiY+fkJE7ymng
         Ghblvxlk7VYM52srNcDGSBhCEe1c70Uo1dr/pRvjRPG2ca/hR13eObzJ1lOM24Irtk0k
         yjgA==
X-Gm-Message-State: AOAM532bVACagl8XA9qZfbHYTfetWsMrzSj0yAQ9SBYR4gOzGcQWwwQb
	GqvtbUSUvvCY0W2HUK1jGIopeteUOra23xk+d/A=
X-Google-Smtp-Source: ABdhPJwscmfqX+YMY/1oXT0F4Ogk+8zfLPhsKoBLkNOp7K6iy30TYycf0kgprzn94cy+pf1JUxixF5jKI4mIGhdEvOM=
X-Received: by 2002:a05:6512:324b:: with SMTP id c11mr7566751lfr.434.1629013784342;
 Sun, 15 Aug 2021 00:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210728075215.154410-1-vinay.m.engg@gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sun, 15 Aug 2021 13:19:33 +0530
Message-ID: <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-35942
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Any update on the above patch.
Please let me know if anything is pending from my side.

Regards,
Vinay

On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Source: https://sourceware.org/git/glibc.git
> Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
>
> Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> glibc-2.33 source.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> new file mode 100644
> index 0000000000..5cae1bc91c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> @@ -0,0 +1,44 @@
> +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@linux-m68k.org>
> +Date: Fri, 25 Jun 2021 15:02:47 +0200
> +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> + 28011)
> +
> +Use strtoul instead of atoi so that overflow can be detected.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> +CVE: CVE-2021-35942
> +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> +---
> + posix/wordexp-test.c | 1 +
> + posix/wordexp.c      | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> +index f93a546d7e..9df02dbbb3 100644
> +--- a/posix/wordexp-test.c
> ++++ b/posix/wordexp-test.c
> +@@ -183,6 +183,7 @@ struct test_case_struct
> +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> +
> +     /* Flags not already covered (testit() has special handling for these) */
> +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> +diff --git a/posix/wordexp.c b/posix/wordexp.c
> +index bcbe96e48d..1f3b09f721 100644
> +--- a/posix/wordexp.c
> ++++ b/posix/wordexp.c
> +@@ -1399,7 +1399,7 @@ envsubst:
> +   /* Is it a numeric parameter? */
> +   else if (isdigit (env[0]))
> +     {
> +-      int n = atoi (env);
> ++      unsigned long n = strtoul (env, NULL, 10);
> +
> +       if (n >= __libc_argc)
> +       /* Substitute NULL. */
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> index e9f01a14c5..abb01f8468 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>             file://mte-backports.patch \
>             file://CVE-2021-33574.patch \
> +           file://CVE-2021-35942.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.31.1
>
