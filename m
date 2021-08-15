Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.8960.1629014008929052658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJTpejS/;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id n7so22423685ljq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4hhlkpPXRzVKeCBDgWuF9kwaxODddvOrFQSuDKEnob4=;
        b=gJTpejS/V4UVeapnlvG+TAfJvU2jGA8Xrcmtg3S1NGXUQ9lKbLsu4Jv1azZR48ND/y
         RY+LPFcDtliL13H1iElxogPGUs5ku11LdPtF3hMykuvFv5TgrILJ5QghnL9TvfhpsTn1
         Wt+KQt1L/YvBF0N/9brsN/FebPW23ZyjToJuSV4kBZf4MPccKpUtCfPz27fz8pQClVOw
         0l3cUsCRbVkXXzP+Yt9BWRd14vA8yiYqLV4Kapdw+f/XdjlUK/hqC1hRAasZtchtCvmH
         JpUcSUSW8H37N2ReUbcTlVXKJqB6VLmpq1O3aLwYpvZuDEuOwEJUCtgi6/DPIvDZC4xV
         hNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hhlkpPXRzVKeCBDgWuF9kwaxODddvOrFQSuDKEnob4=;
        b=Vwd77QMhmsXCs4r8OQi4RyIfNMWU836kOfZOYbSVE+4HmY3IANyURez2Dsohuuu3cp
         aDoJxiI0H1/CydHcTo9iIDi+AqZWAaLEgqlSTQN8Ew8sM45HArpWbWKdXfOs+z+Sm640
         gTGed4jr9k/Y4Ap5Z27YWZpr90xCVPwr9ORvT7lU7UeRNdgSpGIjZiJK3F8+y1UwO3MA
         ZGwzrndMbBbOYpNsC7MiwPq4vOBFyeO0xaVgfUBonKSD1y57u5P+nQzHGwrC1Q2FW4zN
         2qy+VIa5bL2Kn/FZzZsM+uCQNMyqoGn7Cs6l5vUdv+afOZlraAahffuwCHP5aL/gUvjr
         DwMw==
X-Gm-Message-State: AOAM533Ev4Q7En4YV4Fcos0/pH0we+JPAAAazJrFknl7PoDNnOpilkSs
	aEWeC4WvIgNMe1gR9FNVA7R2VNKzBW3QoPQfozY=
X-Google-Smtp-Source: ABdhPJz9yS9tRufIs1KXKiDuwQtuwgGdjpfAzlg94jSkdO48zqsGxzdA4j9cnDE44aQg3akNhiUp/nWUl8RanTVeJOE=
X-Received: by 2002:a05:651c:390:: with SMTP id e16mr3356483ljp.344.1629014006994;
 Sun, 15 Aug 2021 00:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210809083931.100208-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210809083931.100208-1-vinay.m.engg@gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sun, 15 Aug 2021 13:23:16 +0530
Message-ID: <CANUMPcV7nZHOuHbmJzsn6PSDJgXfX=+Y75jiEeVSL6SeDJexPw@mail.gmail.com>
Subject: Re: [hardknott][PATCH v2] glibc: Fix CVE-2021-35942
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>, 
	vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

Please let me know in case any corrections are needed.

Regards,
Vinay

On Mon, Aug 9, 2021 at 2:10 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Source: https://sourceware.org/git/glibc.git
> Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
>
> Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> glibc-2.33 source.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
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
> index bb35c50c98..7f516d2bbe 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
>             file://CVE-2021-33574_1.patch \
>             file://CVE-2021-33574_2.patch \
> +           file://CVE-2021-35942.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.31.1
>
