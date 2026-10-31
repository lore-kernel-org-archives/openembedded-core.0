Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3743.1793405763043807540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gNOBplq0;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10822515e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405761; x=1794010561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B0TrtbR6yzRP1pQeoThvh7wqjUnHLUS9A3nsWlFaWpg=;
        b=gNOBplq0rh6lKTELn403dPchdtGrbNQNZsZy6vi6kX0VuyXRgZaDAvOgErfoGxIhow
         ye/Fig9B4qulZpnOmcF2FpPimn4f7YtfvOTNwlMwVpvmfS6UxJWoYvIJsu+t9GgcTxY1
         EcaAsNVrRM8gPxDXcBJCJqCdkfrBC6MVpX8hC8RuM5TuN9lauS6f5LZM7WH23tBzH9NL
         Yl1HMNRHv6QaTaLvNvbVOeZAD0IpfQo0QjAPwAKMs1ci9Pgo+OqDZA06AUexIEr0rSB/
         yBUMlKh0Wuriw8jN6AtzPsyTRlS4HfvqKYO2cWzrELhFsddqUijh6qSFDUsZc7kkFxHS
         G3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405761; x=1794010561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B0TrtbR6yzRP1pQeoThvh7wqjUnHLUS9A3nsWlFaWpg=;
        b=bvK7zYwSWNvCyJzlPJ7DoOA7tbz5YVO/OlINY+CVOyH2FnRXqRmBxMjci3t6yHxIGW
         5/Hgc8jAYXaVegfNay+iHo2JsFo2qVrMIVQrSIsimLu6k538a0cBhmLi0H+mUILL4frN
         Dce2TJE5RbDxUtJyV7wSG7uasjdap+699x7+9qYHzUysHaD8hJT46Yj6qow0czKtL6yK
         0Fg1PkOyeP1lX6M01Zod9bv5K7lMR7GvX76u3OXmUwCRhGqpmhM/GYeZFVS2XVpUbc+H
         Ag+MFcbz5AUrrXTBMvc1+cnN9VQR65AzvUPBReXO9KE50clClQHhh/LTMygrgzkNjrFz
         dsbQ==
X-Gm-Message-State: AFq9FYIBrvbTpaBW8RnxvP7nHP3DGvU12zUMX9324t26gn+AHCVSuZJX
	bCXfewwe5PDs5Oi4wtYRPnRhyZOlJfdr1p5ZXRvVm/lfEJPB4fE6guxJTwYmqOcGe4e8tkVveJH
	QMX3H5ns=
X-Gm-Gg: AYBFou3BkXvYXglFCf4xeBK7QTyJ5T9ixnr0v3Z8XvARZUJG6gG8+8LHEOjwctLYtI8
	ZFrnGPRxoHEPBoIHEQVu7Udhrt8s8Mv4zU/JL4nXoJvBl+eMmkH2U2vRv8LcR9ViBFQYjztY1FL
	9SvJqatH4840Tcg58J7ofuIxB8hGmwx0faEPzmTV/uyb1QddoO3EMm0SU5b8Ha1zZdhd6T6BBeP
	ix3q1QiBZiYIKZQtH4m5wVpbFVrZn8TmHlpP+AEqvtrW/eGgKJS58k0rjhQJmyqbUEUj7bWofEW
	q2rGkLjPCRS/VNHlMVQ2AgLwRjp7G50E/cE0FpuRTnPyCX8JxY7VbQTJwxi4p81ZLU9JPvhhnaU
	ACPammGOlGat1nAWXdtt2tsZ7jvoDAA2g0ysZUWoRLP4l8etEIqKfv2uimRx/QJj2Q4T3baIyBO
	8fUv6p0Mqd/qKSc6p0a0KGbIcByQGIT1BzEM+p0dBUEzpTSoAAtoJEdcw8DyeAacg+ftZIUvyf/
	Ov+Mq3LV+yyVraOBferjFDWwSxUJaF/d6hvoXYep84mjTGY+g4o77UpKXdx4IUnKQ8zosP5sSDP
	8N9+KlFgwcyctAhzJ/UaopdLBe8qWaugKzs+FCYlvYBsiCxGmngbL94enpk4P1+KrUhksSQXJFK
	fPfh9cTumJ0k5YKHbQ9BQvuPDqv7k
X-Received: by 2002:a05:600c:e545:b0:4ad:181a:4354 with SMTP id 5b1f17b1804b1-4ad181a4478mr30232815e9.30.1793405761223;
        Fri, 30 Oct 2026 17:16:01 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/55] glibc: patch CVE-2026-8674
Date: Sat, 31 Oct 2026 01:14:52 +0100
Message-ID: <2ee1db69d295556b5aa99965ff088e844c1eb168.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249106
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0042-CVE-2026-8674.patch      | 118 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0042-CVE-2026-8674.patch

diff --git a/meta/recipes-core/glibc/glibc/0042-CVE-2026-8674.patch b/meta/recipes-core/glibc/glibc/0042-CVE-2026-8674.patch
new file mode 100644
index 00000000000..bbdeafd5f38
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0042-CVE-2026-8674.patch
@@ -0,0 +1,118 @@
+From c97fdd483232a831829aaff458a212307f1bf4bc Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Mon, 14 Sep 2026 17:08:03 -0300
+Subject: [PATCH] resolv: Fix assertion failure on search list truncation [BZ
+ 31026, CVE-2026-8674]
+
+update_from_conf copies the search list into the 256-byte
+resp->defdname and truncates it when an entry does not fit, then
+asserts that resolv_conf_matches accepts the result.
+
+The truncation check there compared the accumulated size against
+sizeof (resp->dnsrch) (the pointer array) instead of resp->defdname,
+and the empty-list case did not account for a first entry that does
+not fit at all.  A long search domain in resolv.conf or LOCALDOMAIN
+thus aborts any process using the resolver.
+
+Check whether the entry fits in the remaining defdname space, matching
+alloc_buffer_copy_string, and also accept an empty resp->dnsrch when
+the first entry is too long.  Add tests covering both cases through
+the search and domain directives.
+
+Checked on x86_64-linux-gnu and i686-linux-gnu.
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+
+(cherry picked from commit 506ea57086bfb9ce3daff1c14246a1cb532aba0a)
+(cherry picked from commit c0c8a45dee30c8089822d859575a3ad4324b15ff)
+
+CVE: CVE-2026-8674
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=c97fdd483232a831829aaff458a212307f1bf4bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ resolv/resolv_conf.c                  | 19 +++++++++------
+ resolv/tst-resolv-res_init-skeleton.c | 35 +++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+), 7 deletions(-)
+
+diff --git a/resolv/resolv_conf.c b/resolv/resolv_conf.c
+index dcf92ee90e..0418267044 100644
+--- a/resolv/resolv_conf.c
++++ b/resolv/resolv_conf.c
+@@ -281,8 +281,12 @@ resolv_conf_matches (const struct __res_state *resp,
+   {
+     if (resp->dnsrch[0] == NULL)
+       {
+-        /* Empty search list.  No default domain name.  */
+-        return conf->search_list_size == 0 && resp->defdname[0] == '\0';
++        /* Empty search list, or the first entry does not fit in
++           resp->defdname.  No default domain name.  */
++        return resp->defdname[0] == '\0'
++          && (conf->search_list_size == 0
++              || (strlen (conf->search_list[0]) + 1
++                  > sizeof (resp->defdname)));
+       }
+ 
+     if (resp->dnsrch[0] != resp->defdname)
+@@ -309,11 +313,12 @@ resolv_conf_matches (const struct __res_state *resp,
+           }
+         else
+           {
+-            /* resp->dnsrch is truncated if the number of elements
+-               exceeds MAXDNSRCH, or if the combined storage space for
+-               the search list exceeds what can be stored in
+-               resp->defdname.  */
+-            if (i == MAXDNSRCH || search_list_size > sizeof (resp->dnsrch))
++            /* resp->dnsrch is truncated if the number of elements exceeds
++               MAXDNSRCH, or if conf->search_list[i] does not fit in the
++               remaining space of resp->defdname.  */
++            if (i == MAXDNSRCH
++                || (search_list_size + strlen (conf->search_list[i]) + 1
++                    > sizeof (resp->defdname)))
+               break;
+             /* Otherwise, a mismatch indicates a match failure.  */
+             return false;
+diff --git a/resolv/tst-resolv-res_init-skeleton.c b/resolv/tst-resolv-res_init-skeleton.c
+index 3ccbe71db9..4e9c57f3cb 100644
+--- a/resolv/tst-resolv-res_init-skeleton.c
++++ b/resolv/tst-resolv-res_init-skeleton.c
+@@ -713,6 +713,41 @@ struct test_case test_cases[] =
+      "nameserver 192.0.2.1\n"
+      "; nameserver[0]: [192.0.2.1]:53\n"
+     },
++/* Search list entries which do not fit in the legacy 256-byte
++   resp->defdname buffer (bug 31026).  LONG244 is 244 characters long,
++   so it does not fit after "example.com\0" (12 bytes).  LONG256 is 256
++   characters long, so it does not fit even as the first entry.  */
++#define LBL63 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
++#define LONG244 LBL63 "." LBL63 "." LBL63 "." \
++  "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
++#define LONG256 LBL63 "." LBL63 "." LBL63 "." LBL63 "a"
++    {.name = "search list truncated at long entry after short entry",
++     .conf = "nameserver 192.0.2.1\n"
++     "search example.com " LONG244 "\n",
++     .expected = "search example.com\n"
++     "; search[0]: example.com\n"
++     "; search[1]: " LONG244 "\n"
++     "nameserver 192.0.2.1\n"
++     "; nameserver[0]: [192.0.2.1]:53\n"
++    },
++    {.name = "search list truncated at long first entry",
++     .conf = "nameserver 192.0.2.1\n"
++     "search " LONG256 " example.com\n",
++     .expected = "; search[0]: " LONG256 "\n"
++     "; search[1]: example.com\n"
++     "nameserver 192.0.2.1\n"
++     "; nameserver[0]: [192.0.2.1]:53\n"
++    },
++    {.name = "long first entry from the domain directive",
++     .conf = "nameserver 192.0.2.1\n"
++     "domain " LONG256 "\n",
++     .expected = "; search[0]: " LONG256 "\n"
++     "nameserver 192.0.2.1\n"
++     "; nameserver[0]: [192.0.2.1]:53\n"
++    },
++#undef LONG256
++#undef LONG244
++#undef LBL63
+     {.name = "trust-ad flag",
+      .conf = "options trust-ad\n"
+      "nameserver 192.0.2.1\n",
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 3e95792b359..3b27328c21a 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -74,6 +74,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0039-CVE-2026-77117-CVE-2026-80489.patch \
            file://0040-CVE-2026-18374-01.patch \
            file://0041-CVE-2026-18374-02.patch \
+           file://0042-CVE-2026-8674.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
