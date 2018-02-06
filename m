Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 326D1783AE;
	Tue,  6 Feb 2018 22:03:13 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v15so3564942wrb.8;
	Tue, 06 Feb 2018 14:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BMYwoOmEaRtO76j8NnJOPOvfv2HzckhBc18tLqaDY3E=;
	b=WpDJMELwb5r+PRvQrcV7w+iPU27R13LPrad5Trtr1PS4u/l+07+iokrqhChzflNxO2
	WbS/kDJlH1FWOCOOVLIW/vcHSkFXRAwC+dGLaCoCWHgMdSVCbz1yqyYsG2F1X94K8a+s
	ymvB1ZsYpmDNDxrDE5S8ZKVF3C73HunhDoCA/vvOwG6utjS1nZKIgAOgCUY8Bhrs8qRJ
	CJLFuUSOIAyZqNK5O9Nr5P9NKQSZTK+PHbLuJKopSJW5PMasG23rYGcPLUV+rwvFTem2
	pGbDbOTcSTd6E1BfyXKcTNii9KPggWsimEQKAyKqr2djV0sOThpRZrQRAiZVCm1GywQB
	4EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BMYwoOmEaRtO76j8NnJOPOvfv2HzckhBc18tLqaDY3E=;
	b=JAl40UU6+/XNzMciEDOwk1IxW+Jbu/J/YPsuJWed/Kq7fTWaVJIz1z5XKqmxMeXUce
	BZKm3P7NB7inCb7rcpW6KjW6k2A3UvUschEDRrVnDvO/7hgCaZBWMYblU/nUC1SjK9Q+
	3h6BorgPWds5IK9Y/tac/J0Uw6Ojk521kV40/Ks+/GCGEm9B55dhlFTVY7Zlvzd6uEG7
	bGSBJ1eigtXPBNVgouPZOmLiORZ6oF/L1xtHpNperDScPaT9TAMA5wWfzjB+2Qc+3yRR
	xcYZANazIL2fhd1hSfRn/ywFsF9ZhEgICC4bv9S86MY9QDLlFG+RkUiVZrTaIIXdkPA0
	xjUg==
X-Gm-Message-State: APf1xPAUehya3DNv3HgpzwCDujGWQa8c7dwBpUs018bswRbIOGTCEgqW
	A+p+ywopSb/Rpy0v/FkTbV+98I8HsE2ypKvIvSJqXA==
X-Google-Smtp-Source: AH8x225Z8EePf2kXBwfMSKli1D3A5s9c58KFx5RX7vTaF4T6vN6kUS67Oe43+aKcnA6r4i9fcqILuyZ6WNI3UH/KtEk=
X-Received: by 10.223.171.24 with SMTP id q24mr3665107wrc.206.1517954594814;
	Tue, 06 Feb 2018 14:03:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 6 Feb 2018 14:03:14 -0800 (PST)
In-Reply-To: <20180206110703.83BD6234808@git.openembedded.org>
References: <151791522137.12584.390331907954611211@git.openembedded.org>
	<20180206110703.83BD6234808@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2018 23:03:14 +0100
Message-ID: <CA+chaQdbEHUAhDjNGhJvNVgZG7_g5h02tZZhOy7A1qppgcGs_g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 57/62: iputils: update to 20161105
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:15 -0000
Content-Type: multipart/alternative; boundary="94eb2c1b54d468e5f10564925824"

--94eb2c1b54d468e5f10564925824
Content-Type: text/plain; charset="UTF-8"

Doesn't this new version depend on libidn?

Maybe it should be new PACKAGECONFIG or something, but here all builds fail
with:

| In file included from ping_common.c:1:0:
| ping.h:39:10: fatal error: idna.h: No such file or directory
|  #include <idna.h>
|           ^~~~~~~~

I'm running another build with just oe-core and nodistro to check if it
fails the same there as well.

Regards,

On Tue, Feb 6, 2018 at 12:07 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> AuthorDate: Thu Feb 1 20:02:08 2018 +0200
>
>     iputils: update to 20161105
>
>     We've been using obsolete upstream URI for quite a while; meanwhile
>     a lot of development has happened
>
>     Drop all the patches: they are either changing the code that has been
> refactored,
>     or are backports.
>
>     Add a new musl fix patch from gentoo.
>
>     ping6 and tracepath6 variants have been folded into standard versions.
>
>     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../iputils/files/0001-Fix-build-on-MUSL.patch     | 93
> ++++++++++++++++++++++
>  .../files/0001-Fix-header-inclusion-for-musl.patch | 92
> ---------------------
>  .../0001-Intialize-struct-elements-by-name.patch   | 52 ------------
>  ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ----------
>  .../iputils/files/debian/targets.diff              | 15 ----
>  .../iputils/files/debian/use_gethostbyname2.diff   | 31 --------
>  .../iputils/files/nsgmls-path-fix.patch            | 27 -------
>  .../{iputils_s20151218.bb => iputils_s20161105.bb} | 33 +++-----
>  8 files changed, 103 insertions(+), 284 deletions(-)
>
> diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
> b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
> new file mode 100644
> index 0000000..c86dafc
> --- /dev/null
> +++ b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
> @@ -0,0 +1,93 @@
> +From c6c5966d9fae27bc2f0a34ab59b999555111bd2d Mon Sep 17 00:00:00 2001
> +From: Aric Belsito <lluixhi@gmail.com>
> +Date: Sun, 29 Oct 2017 23:17:03 +0100
> +Subject: [PATCH] Fix build on MUSL
> +
> +Add missing AI_IDN and NI_IDN declarations.
> +
> +Bug: https://bugs.gentoo.org/503914
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + arping.c      |  7 +++++++
> + ping.h        | 11 +++++++++++
> + tracepath.c   |  8 ++++++++
> + traceroute6.c |  4 ++++
> + 4 files changed, 30 insertions(+)
> +
> +diff --git a/arping.c b/arping.c
> +index 1a3f40b..531d29d 100644
> +--- a/arping.c
> ++++ b/arping.c
> +@@ -45,6 +45,13 @@ struct sysfs_devattr_values;
> + #ifdef USE_IDN
> + #include <idna.h>
> + #include <locale.h>
> ++
> ++#ifndef AI_IDN
> ++#define AI_IDN 0x0040
> ++#endif
> ++#ifndef AI_CANONIDN
> ++#define AI_CANONIDN 0x0080
> ++#endif
> + #endif
> +
> + #include "SNAPSHOT.h"
> +diff --git a/ping.h b/ping.h
> +index 749f3ff..227315f 100644
> +--- a/ping.h
> ++++ b/ping.h
> +@@ -38,6 +38,17 @@
> + #include <locale.h>
> + #include <idna.h>
> + #include <stringprep.h>
> ++
> ++#ifndef AI_IDN
> ++#define AI_IDN 0x0040
> ++#endif
> ++#ifndef AI_CANONIDN
> ++#define AI_CANONIDN 0x0080
> ++#endif
> ++#ifndef NI_IDN
> ++#define NI_IDN 32
> ++#endif
> ++
> + #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
> + #define getnameinfo_flags NI_IDN
> + #else
> +diff --git a/tracepath.c b/tracepath.c
> +index 74a829d..dcec5b9 100644
> +--- a/tracepath.c
> ++++ b/tracepath.c
> +@@ -30,6 +30,14 @@
> + #ifdef USE_IDN
> + #include <idna.h>
> + #include <locale.h>
> ++
> ++#ifndef AI_IDN
> ++#define AI_IDN 0x0040
> ++#endif
> ++#ifndef NI_IDN
> ++#define NI_IDN 32
> ++#endif
> ++
> + #define getnameinfo_flags     NI_IDN
> + #else
> + #define getnameinfo_flags     0
> +diff --git a/traceroute6.c b/traceroute6.c
> +index 48fc5c5..8d1eebf 100644
> +--- a/traceroute6.c
> ++++ b/traceroute6.c
> +@@ -251,6 +251,10 @@
> + #include <idna.h>
> + #include <locale.h>
> +
> ++#ifndef NI_IDN
> ++#define NI_IDN 32
> ++#endif
> ++
> + #define getnameinfo_flags     NI_IDN
> + #else
> + #define getnameinfo_flags     0
> +--
> +2.15.1
> +
> diff --git a/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
> b/meta/recipes-extended/iputils/files/0001-Fix-header-
> inclusion-for-musl.patch
> deleted file mode 100644
> index 20ef07e..0000000
> --- a/meta/recipes-extended/iputils/files/0001-Fix-header-
> inclusion-for-musl.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From be0bb81d72fea4d20da74f4f2236aa145684f332 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 6 Jan 2016 14:14:22 -0800
> -Subject: [PATCH] Fix header inclusion for musl
> -
> -Fix errors e.g.
> -
> -In file included from tracepath.c:17:0:
> -/usr/include/linux/errqueue.h:33:18:
> -error: array type has incomplete element type 'struct timespec'
> -  struct timespec ts[3];
> -                  ^
> -tracepath.c: In function 'main':
> -tracepath.c:329:16: error: 'INT_MAX' undeclared (first use in this
> -function)
> -      overhead, INT_MAX);
> -                ^
> -tracepath.c:329:16: note: each undeclared identifier is reported only
> -once for each function it appears in
> -Makefile:131: recipe for target 'tracepath.o' failed
> -make: *** [tracepath.o] Error 1
> -
> -ping_common.c: In function 'main_loop':
> -ping_common.c:756:15: error: 'HZ' undeclared (first use in this
> -function)
> -    if (1000 % HZ == 0 ? next <= 1000 / HZ : (next < INT_MAX / HZ &&
> -next * HZ <= 1000)) {
> -
> -protocols/timed.h is not needed and is absent in musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - clockdiff.c   | 1 -
> - ping_common.c | 1 +
> - tracepath.c   | 2 ++
> - tracepath6.c  | 1 +
> - 4 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/clockdiff.c b/clockdiff.c
> -index 7c1ea1b..1d6341e 100644
> ---- a/clockdiff.c
> -+++ b/clockdiff.c
> -@@ -14,7 +14,6 @@
> - #include <netinet/ip.h>
> - #include <netinet/ip_icmp.h>
> - #define TSPTYPES
> --#include <protocols/timed.h>
> - #include <fcntl.h>
> - #include <netdb.h>
> - #include <arpa/inet.h>
> -diff --git a/ping_common.c b/ping_common.c
> -index 7f82851..3ce699d 100644
> ---- a/ping_common.c
> -+++ b/ping_common.c
> -@@ -2,6 +2,7 @@
> - #include <ctype.h>
> - #include <sched.h>
> - #include <math.h>
> -+#include <asm-generic/param.h>
> -
> - int options;
> -
> -diff --git a/tracepath.c b/tracepath.c
> -index 89e6d16..c9d6ddd 100644
> ---- a/tracepath.c
> -+++ b/tracepath.c
> -@@ -12,6 +12,8 @@
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> -+#include <limits.h>
> -+#include <time.h>
> - #include <sys/socket.h>
> - #include <linux/types.h>
> - #include <linux/errqueue.h>
> -diff --git a/tracepath6.c b/tracepath6.c
> -index 126fadf..9d5745c 100644
> ---- a/tracepath6.c
> -+++ b/tracepath6.c
> -@@ -12,6 +12,7 @@
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> -+#include <limits.h>
> - #include <sys/socket.h>
> - #include <netinet/in.h>
> - #include <netinet/icmp6.h>
> ---
> -2.6.4
> -
> diff --git a/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
> b/meta/recipes-extended/iputils/files/0001-Intialize-
> struct-elements-by-name.patch
> deleted file mode 100644
> index 6da01dc..0000000
> --- a/meta/recipes-extended/iputils/files/0001-Intialize-
> struct-elements-by-name.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 000629f74908a2a95f6104444c77ad93cf40d62d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 13 Jan 2016 08:50:50 +0000
> -Subject: [PATCH] Intialize struct elements by name
> -
> -makes it portable across glibc and musl
> -
> -Fixes errors
> -
> -| ping.c: In function 'send_probe':
> -| ping.c:735:19: warning: initialization makes integer from pointer
> -without a cast [-Wint-conversion]
> -|           &iov, 1, &cmsg, 0, 0 };
> -|                    ^
> -| ping.c:735:19: note: (near initialization for 'm.__pad1')
> -| ping.c:735:19: error: initializer element is not computable at load
> -time
> -| ping.c:735:19: note: (near initialization for 'm.__pad1')
> -| make: *** [ping.o] Error 1
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - ping.c | 11 +++++++++--
> - 1 file changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/ping.c b/ping.c
> -index 4989760..e67f381 100644
> ---- a/ping.c
> -+++ b/ping.c
> -@@ -731,8 +731,15 @@ int send_probe()
> -
> -       do {
> -               static struct iovec iov = {outpack, 0};
> --              static struct msghdr m = { &whereto, sizeof(whereto),
> --                                                 &iov, 1, &cmsg, 0, 0 };
> -+              static struct msghdr m = {
> -+                      .msg_name = &whereto,
> -+                      .msg_namelen = sizeof(whereto),
> -+                      .msg_iov = &iov,
> -+                      .msg_iovlen = 1,
> -+                      .msg_control = &cmsg,
> -+                      .msg_controllen = 0,
> -+                      .msg_flags= 0,
> -+              };
> -               m.msg_controllen = cmsg_len;
> -               iov.iov_len = cc;
> -
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/iputils/files/arping-fix-
> arping-hang-if-SIGALRM-is-blocked.patch b/meta/recipes-extended/
> iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
> deleted file mode 100644
> index 7b56276..0000000
> --- a/meta/recipes-extended/iputils/files/arping-fix-
> arping-hang-if-SIGALRM-is-blocked.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -arping: fix arping hang if SIGALRM is blocked
> -
> -Unblock SIGALRM so that the previously called alarm() can prevent
> -recvfrom() from blocking forever in case the inherited procmask is
> -blocking SIGALRM and no packet is received.
> -
> -Upstream-Status: Backport
> -
> -Reported-by: Rui Prior <rprior@dcc.fc.up.pt>
> -RH-Bugzilla: #1085971
> -Signed-off-by: Jan Synacek <jsynacek@redhat.com>
> -Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> -
> -diff --git a/arping.c.orig b/arping.c
> -index 35408c1..2098159 100644
> ---- a/arping.c.orig
> -+++ b/arping.c
> -@@ -1215,16 +1215,22 @@ main(int argc, char **argv)
> -               socklen_t alen = sizeof(from);
> -               int cc;
> -
> -+              sigemptyset(&sset);
> -+              sigaddset(&sset, SIGALRM);
> -+              sigaddset(&sset, SIGINT);
> -+              /* Unblock SIGALRM so that the previously called alarm()
> -+               * can prevent recvfrom from blocking forever in case the
> -+               * inherited procmask is blocking SIGALRM and no packet
> -+               * is received. */
> -+              sigprocmask(SIG_UNBLOCK, &sset, &osset);
> -+
> -               if ((cc = recvfrom(s, packet, sizeof(packet), 0,
> -                                  (struct sockaddr *)&from, &alen)) < 0) {
> -                       perror("arping: recvfrom");
> -                       continue;
> -               }
> -
> --              sigemptyset(&sset);
> --              sigaddset(&sset, SIGALRM);
> --              sigaddset(&sset, SIGINT);
> --              sigprocmask(SIG_BLOCK, &sset, &osset);
> -+              sigprocmask(SIG_BLOCK, &sset, NULL);
> -               recv_pack(packet, cc, (struct sockaddr_ll *)&from);
> -               sigprocmask(SIG_SETMASK, &osset, NULL);
> -       }
> diff --git a/meta/recipes-extended/iputils/files/debian/targets.diff
> b/meta/recipes-extended/iputils/files/debian/targets.diff
> deleted file mode 100644
> index 2cb5576..0000000
> --- a/meta/recipes-extended/iputils/files/debian/targets.diff
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Index: iputils-s20121221/Makefile
> -===================================================================
> ---- iputils-s20121221.orig/Makefile
> -+++ iputils-s20121221/Makefile
> -@@ -106,7 +106,7 @@ endif
> - endif
> -
> - # -------------------------------------
> --IPV4_TARGETS=tracepath ping clockdiff rdisc arping tftpd rarpd
> -+IPV4_TARGETS=tracepath ping clockdiff arping
> - IPV6_TARGETS=tracepath6 traceroute6 ping6
> - TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS)
> -
> diff --git a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
> b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
> deleted file mode 100644
> index d3b1886..0000000
> --- a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Upstream-Status: Pending [from other distro Debian]
> -
> -Index: iputils-s20121221/tracepath.c
> -===================================================================
> ---- iputils-s20121221.orig/tracepath.c
> -+++ iputils-s20121221/tracepath.c
> -@@ -370,9 +370,9 @@ main(int argc, char **argv)
> -       }
> - #endif
> -
> --      he = gethostbyname(p);
> -+      he = gethostbyname2(argv[0], AF_INET);
> -       if (he == NULL) {
> --              herror("gethostbyname");
> -+              herror("gethostbyname2");
> -               exit(1);
> -       }
> -
> -Index: iputils-s20121221/ping.c
> -===================================================================
> ---- iputils-s20121221.orig/ping.c
> -+++ iputils-s20121221/ping.c
> -@@ -279,7 +279,7 @@ main(int argc, char **argv)
> - #else
> -                       idn = target;
> - #endif
> --                      hp = gethostbyname(idn);
> -+                      hp = gethostbyname2(idn, AF_INET);
> -                       if (!hp) {
> -                               fprintf(stderr, "ping: unknown host %s\n",
> target);
> -                               exit(2);
> diff --git a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
> b/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
> deleted file mode 100644
> index 92bf946..0000000
> --- a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Fix nsgmls path issue
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> -
> -Index: iputils-s20101006/doc/Makefile
> -===================================================================
> ---- iputils-s20101006.orig/doc/Makefile        2011-09-13
> 20:42:27.000000000 +0800
> -+++ iputils-s20101006/doc/Makefile     2011-09-13 21:01:52.000000000 +0800
> -@@ -27,10 +27,15 @@
> - # docbook2man produces utterly ugly output and I did not find
> - # any way to customize this but hacking backend perl script a little.
> - # Well, hence...
> -+# nsgmls seems append path to search directory according to the sysid
> path.
> -+# e.g. if input ../index.db, it would search $search_directory/../
> rather than
> -+# $search_directory, which leads searching failure. Fixing nsgmls
> probably
> -+# introduce some side effects, so use this ugly hack: running nsgmls in
> current
> -+# directory, and running docbook2man in tmp directory.
> -
> - $(MANFILES): index.db
> -       @-mkdir tmp.db2man
> --      @set -e; cd tmp.db2man; nsgmls ../$< | sgmlspl ../
> docbook2man-spec.pl ; mv $@ ..
> -+      @set -e; nsgmls $< >tmp.db2man/output; cd tmp.db2man; cat output |
> sgmlspl ../docbook2man-spec.pl ;     mv $@ ..
> -       @-rm -rf tmp.db2man
> -
> - clean:
> diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb
> b/meta/recipes-extended/iputils/iputils_s20161105.bb
> similarity index 56%
> rename from meta/recipes-extended/iputils/iputils_s20151218.bb
> rename to meta/recipes-extended/iputils/iputils_s20161105.bb
> index 46de6fc..ad7dbc4 100644
> --- a/meta/recipes-extended/iputils/iputils_s20151218.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Network monitoring tools"
>  DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
>  tracepath, tracepath6, ping, ping6 and arping."
> -HOMEPAGE = "http://www.skbuff.net/iputils"
> +HOMEPAGE = "https://github.com/iputils/iputils"
>  SECTION = "console/network"
>
>  LICENSE = "BSD & GPLv2+"
> @@ -13,20 +13,13 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;
> endline=35;md5=f9ceb201733e9a6cf8f
>
>  DEPENDS = "gnutls libcap libgcrypt"
>
> +SRC_URI = "git://github.com/iputils/iputils \
> +           file://0001-Fix-build-on-MUSL.patch \
> +           "
> +S = "${WORKDIR}/git"
> +SRCREV = "bffc0e957b98d626ab4cea218c89251201425442"
>
> -SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
> -           file://debian/use_gethostbyname2.diff \
> -           file://debian/targets.diff \
> -           file://nsgmls-path-fix.patch \
> -           file://0001-Fix-header-inclusion-for-musl.patch \
> -           file://0001-Intialize-struct-elements-by-name.patch \
> -           file://arping-fix-arping-hang-if-SIGALRM-is-blocked.patch \
> -          "
> -
> -SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
> -SRC_URI[sha256sum] = "549f58d71951e52b46595829134d4e
> 330642f522f50026917fadc349a54825a1"
> -
> -UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
>
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>
> @@ -38,11 +31,10 @@ do_install () {
>         install -m 0755 -d ${D}${base_bindir}
>         # SUID root programs
>         install -m 4555 ping ${D}${base_bindir}/ping
> -       install -m 4555 ping6 ${D}${base_bindir}/ping6
>         install -m 4555 traceroute6 ${D}${base_bindir}/
>         install -m 4555 clockdiff ${D}${base_bindir}/
>         # Other programgs
> -       for i in arping tracepath tracepath6; do
> +       for i in arping tracepath; do
>           install -m 0755 $i ${D}${base_bindir}/
>         done
>  }
> @@ -54,19 +46,14 @@ ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE_${PN}-ping = "ping"
>  ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
>
> -ALTERNATIVE_${PN}-ping6 = "ping6"
> -ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
> -
> -PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath
> ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
> +PACKAGES += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6
> ${PN}-clockdiff"
>
>  ALLOW_EMPTY_${PN} = "1"
> -RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath
> ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
> +RDEPENDS_${PN} += "${PN}-ping ${PN}-arping ${PN}-tracepath
> ${PN}-traceroute6 ${PN}-clockdiff"
>
>  FILES_${PN}    = ""
>  FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
> -FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
>  FILES_${PN}-arping = "${base_bindir}/arping"
>  FILES_${PN}-tracepath = "${base_bindir}/tracepath"
> -FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
>  FILES_${PN}-traceroute6        = "${base_bindir}/traceroute6"
>  FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--94eb2c1b54d468e5f10564925824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t this new version depend on libidn?<div><br></d=
iv><div>Maybe it should be new PACKAGECONFIG or something, but here all bui=
lds fail with:</div><div><br></div><div><div>| In file included from ping_c=
ommon.c:1:0:</div><div>| ping.h:39:10: fatal error: idna.h: No such file or=
 directory</div><div>|=C2=A0 #include &lt;idna.h&gt;</div><div>|=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~</div></div><div><br></div><div>I&#3=
9;m running another build with just oe-core and nodistro to check if it fai=
ls the same there as well.</div><div><br></div><div>Regards,</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Feb 6, 2018 =
at 12:07 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.=
org" target=3D"_blank">git@git.openembedded.org</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">This is an automated email from the git hooks/=
post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 5997981fa2c22609a88b8cbb595dbf<wbr>7758b2f7c2<br>
Author: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.int=
el.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
AuthorDate: Thu Feb 1 20:02:08 2018 +0200<br>
<br>
=C2=A0 =C2=A0 iputils: update to 20161105<br>
<br>
=C2=A0 =C2=A0 We&#39;ve been using obsolete upstream URI for quite a while;=
 meanwhile<br>
=C2=A0 =C2=A0 a lot of development has happened<br>
<br>
=C2=A0 =C2=A0 Drop all the patches: they are either changing the code that =
has been refactored,<br>
=C2=A0 =C2=A0 or are backports.<br>
<br>
=C2=A0 =C2=A0 Add a new musl fix patch from gentoo.<br>
<br>
=C2=A0 =C2=A0 ping6 and tracepath6 variants have been folded into standard =
versions.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexan=
der.kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;=
<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../iputils/files/0001-Fix-<wbr>build-on-MUSL.patch=C2=A0 =C2=A0 =C2=
=A0| 93 ++++++++++++++++++++++<br>
=C2=A0.../files/0001-Fix-header-<wbr>inclusion-for-musl.patch | 92 --------=
-------------<br>
=C2=A0.../0001-Intialize-struct-<wbr>elements-by-name.patch=C2=A0 =C2=A0| 5=
2 ------------<br>
=C2=A0...ing-fix-arping-hang-if-<wbr>SIGALRM-is-blocked.patch | 44 --------=
--<br>
=C2=A0.../iputils/files/debian/<wbr>targets.diff=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 15 ----<br>
=C2=A0.../iputils/files/debian/use_<wbr>gethostbyname2.diff=C2=A0 =C2=A0| 3=
1 --------<br>
=C2=A0.../iputils/files/nsgmls-path-<wbr>fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 27 -------<br>
=C2=A0.../{<a href=3D"http://iputils_s20151218.bb" rel=3D"noreferrer" targe=
t=3D"_blank">iputils_s20151218.bb</a> =3D&gt; <a href=3D"http://iputils_s20=
161105.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a>} |=
 33 +++-----<br>
=C2=A08 files changed, 103 insertions(+), 284 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/0001-Fix-build-<wbr>o=
n-MUSL.patch b/meta/recipes-extended/<wbr>iputils/files/0001-Fix-build-<wbr=
>on-MUSL.patch<br>
new file mode 100644<br>
index 0000000..c86dafc<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>iputils/files/0001-Fix-build-<wbr>on-MUSL.=
patch<br>
@@ -0,0 +1,93 @@<br>
+From c6c5966d9fae27bc2f0a34ab59b999<wbr>555111bd2d Mon Sep 17 00:00:00 200=
1<br>
+From: Aric Belsito &lt;<a href=3D"mailto:lluixhi@gmail.com">lluixhi@gmail.=
com</a>&gt;<br>
+Date: Sun, 29 Oct 2017 23:17:03 +0100<br>
+Subject: [PATCH] Fix build on MUSL<br>
+<br>
+Add missing AI_IDN and NI_IDN declarations.<br>
+<br>
+Bug: <a href=3D"https://bugs.gentoo.org/503914" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.gentoo.org/503914</a><br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ arping.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
+ ping.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br>
+ tracepath.c=C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
+ traceroute6.c |=C2=A0 4 ++++<br>
+ 4 files changed, 30 insertions(+)<br>
+<br>
+diff --git a/arping.c b/arping.c<br>
+index 1a3f40b..531d29d 100644<br>
+--- a/arping.c<br>
++++ b/arping.c<br>
+@@ -45,6 +45,13 @@ struct sysfs_devattr_values;<br>
+ #ifdef USE_IDN<br>
+ #include &lt;idna.h&gt;<br>
+ #include &lt;locale.h&gt;<br>
++<br>
++#ifndef AI_IDN<br>
++#define AI_IDN 0x0040<br>
++#endif<br>
++#ifndef AI_CANONIDN<br>
++#define AI_CANONIDN 0x0080<br>
++#endif<br>
+ #endif<br>
+<br>
+ #include &quot;SNAPSHOT.h&quot;<br>
+diff --git a/ping.h b/ping.h<br>
+index 749f3ff..227315f 100644<br>
+--- a/ping.h<br>
++++ b/ping.h<br>
+@@ -38,6 +38,17 @@<br>
+ #include &lt;locale.h&gt;<br>
+ #include &lt;idna.h&gt;<br>
+ #include &lt;stringprep.h&gt;<br>
++<br>
++#ifndef AI_IDN<br>
++#define AI_IDN 0x0040<br>
++#endif<br>
++#ifndef AI_CANONIDN<br>
++#define AI_CANONIDN 0x0080<br>
++#endif<br>
++#ifndef NI_IDN<br>
++#define NI_IDN 32<br>
++#endif<br>
++<br>
+ #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)<br>
+ #define getnameinfo_flags NI_IDN<br>
+ #else<br>
+diff --git a/tracepath.c b/tracepath.c<br>
+index 74a829d..dcec5b9 100644<br>
+--- a/tracepath.c<br>
++++ b/tracepath.c<br>
+@@ -30,6 +30,14 @@<br>
+ #ifdef USE_IDN<br>
+ #include &lt;idna.h&gt;<br>
+ #include &lt;locale.h&gt;<br>
++<br>
++#ifndef AI_IDN<br>
++#define AI_IDN 0x0040<br>
++#endif<br>
++#ifndef NI_IDN<br>
++#define NI_IDN 32<br>
++#endif<br>
++<br>
+ #define getnameinfo_flags=C2=A0 =C2=A0 =C2=A0NI_IDN<br>
+ #else<br>
+ #define getnameinfo_flags=C2=A0 =C2=A0 =C2=A00<br>
+diff --git a/traceroute6.c b/traceroute6.c<br>
+index 48fc5c5..8d1eebf 100644<br>
+--- a/traceroute6.c<br>
++++ b/traceroute6.c<br>
+@@ -251,6 +251,10 @@<br>
+ #include &lt;idna.h&gt;<br>
+ #include &lt;locale.h&gt;<br>
+<br>
++#ifndef NI_IDN<br>
++#define NI_IDN 32<br>
++#endif<br>
++<br>
+ #define getnameinfo_flags=C2=A0 =C2=A0 =C2=A0NI_IDN<br>
+ #else<br>
+ #define getnameinfo_flags=C2=A0 =C2=A0 =C2=A00<br>
+--<br>
+2.15.1<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/0001-Fix-header-<wbr>=
inclusion-for-musl.patch b/meta/recipes-extended/<wbr>iputils/files/0001-Fi=
x-header-<wbr>inclusion-for-musl.patch<br>
deleted file mode 100644<br>
index 20ef07e..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/0001-Fix-header-<wbr>inclusi=
on-for-musl.patch<br>
+++ /dev/null<br>
@@ -1,92 +0,0 @@<br>
-From be0bb81d72fea4d20da74f4f2236aa<wbr>145684f332 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Wed, 6 Jan 2016 14:14:22 -0800<br>
-Subject: [PATCH] Fix header inclusion for musl<br>
-<br>
-Fix errors e.g.<br>
-<br>
-In file included from tracepath.c:17:0:<br>
-/usr/include/linux/errqueue.<wbr>h:33:18:<br>
-error: array type has incomplete element type &#39;struct timespec&#39;<br=
>
-=C2=A0 struct timespec ts[3];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
-tracepath.c: In function &#39;main&#39;:<br>
-tracepath.c:329:16: error: &#39;INT_MAX&#39; undeclared (first use in this=
<br>
-function)<br>
-=C2=A0 =C2=A0 =C2=A0 overhead, INT_MAX);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
-tracepath.c:329:16: note: each undeclared identifier is reported only<br>
-once for each function it appears in<br>
-Makefile:131: recipe for target &#39;tracepath.o&#39; failed<br>
-make: *** [tracepath.o] Error 1<br>
-<br>
-ping_common.c: In function &#39;main_loop&#39;:<br>
-ping_common.c:756:15: error: &#39;HZ&#39; undeclared (first use in this<br=
>
-function)<br>
-=C2=A0 =C2=A0 if (1000 % HZ =3D=3D 0 ? next &lt;=3D 1000 / HZ : (next &lt;=
 INT_MAX / HZ &amp;&amp;<br>
-next * HZ &lt;=3D 1000)) {<br>
-<br>
-protocols/timed.h is not needed and is absent in musl<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- clockdiff.c=C2=A0 =C2=A0| 1 -<br>
- ping_common.c | 1 +<br>
- tracepath.c=C2=A0 =C2=A0| 2 ++<br>
- tracepath6.c=C2=A0 | 1 +<br>
- 4 files changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/clockdiff.c b/clockdiff.c<br>
-index 7c1ea1b..1d6341e 100644<br>
---- a/clockdiff.c<br>
-+++ b/clockdiff.c<br>
-@@ -14,7 +14,6 @@<br>
- #include &lt;netinet/ip.h&gt;<br>
- #include &lt;netinet/ip_icmp.h&gt;<br>
- #define TSPTYPES<br>
--#include &lt;protocols/timed.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;netdb.h&gt;<br>
- #include &lt;arpa/inet.h&gt;<br>
-diff --git a/ping_common.c b/ping_common.c<br>
-index 7f82851..3ce699d 100644<br>
---- a/ping_common.c<br>
-+++ b/ping_common.c<br>
-@@ -2,6 +2,7 @@<br>
- #include &lt;ctype.h&gt;<br>
- #include &lt;sched.h&gt;<br>
- #include &lt;math.h&gt;<br>
-+#include &lt;asm-generic/param.h&gt;<br>
-<br>
- int options;<br>
-<br>
-diff --git a/tracepath.c b/tracepath.c<br>
-index 89e6d16..c9d6ddd 100644<br>
---- a/tracepath.c<br>
-+++ b/tracepath.c<br>
-@@ -12,6 +12,8 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#include &lt;limits.h&gt;<br>
-+#include &lt;time.h&gt;<br>
- #include &lt;sys/socket.h&gt;<br>
- #include &lt;linux/types.h&gt;<br>
- #include &lt;linux/errqueue.h&gt;<br>
-diff --git a/tracepath6.c b/tracepath6.c<br>
-index 126fadf..9d5745c 100644<br>
---- a/tracepath6.c<br>
-+++ b/tracepath6.c<br>
-@@ -12,6 +12,7 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#include &lt;limits.h&gt;<br>
- #include &lt;sys/socket.h&gt;<br>
- #include &lt;netinet/in.h&gt;<br>
- #include &lt;netinet/icmp6.h&gt;<br>
---<br>
-2.6.4<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/0001-Intialize-<wbr>s=
truct-elements-by-name.patch b/meta/recipes-extended/<wbr>iputils/files/000=
1-Intialize-<wbr>struct-elements-by-name.patch<br>
deleted file mode 100644<br>
index 6da01dc..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/0001-Intialize-<wbr>struct-e=
lements-by-name.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 000629f74908a2a95f6104444c77ad<wbr>93cf40d62d Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Wed, 13 Jan 2016 08:50:50 +0000<br>
-Subject: [PATCH] Intialize struct elements by name<br>
-<br>
-makes it portable across glibc and musl<br>
-<br>
-Fixes errors<br>
-<br>
-| ping.c: In function &#39;send_probe&#39;:<br>
-| ping.c:735:19: warning: initialization makes integer from pointer<br>
-without a cast [-Wint-conversion]<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;iov, 1, &amp;cmsg, 0, 0 };<=
br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<b=
r>
-| ping.c:735:19: note: (near initialization for &#39;m.__pad1&#39;)<br>
-| ping.c:735:19: error: initializer element is not computable at load<br>
-time<br>
-| ping.c:735:19: note: (near initialization for &#39;m.__pad1&#39;)<br>
-| make: *** [ping.o] Error 1<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- ping.c | 11 +++++++++--<br>
- 1 file changed, 9 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/ping.c b/ping.c<br>
-index 4989760..e67f381 100644<br>
---- a/ping.c<br>
-+++ b/ping.c<br>
-@@ -731,8 +731,15 @@ int send_probe()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static struct iovec=
 iov =3D {outpack, 0};<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct msghdr m =
=3D { &amp;whereto, sizeof(whereto),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;iov, 1, &amp;cmsg, 0, 0 };<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct msghdr m =
=3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_name =3D &amp;whereto,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_namelen =3D sizeof(whereto),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_iov =3D &amp;iov,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_iovlen =3D 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_control =3D &amp;cmsg,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_controllen =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_flags=3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.msg_controllen =
=3D cmsg_len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov.iov_len =3D cc;=
<br>
-<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/arping-fix-<wbr>arpin=
g-hang-if-SIGALRM-is-<wbr>blocked.patch b/meta/recipes-extended/<wbr>iputil=
s/files/arping-fix-<wbr>arping-hang-if-SIGALRM-is-<wbr>blocked.patch<br>
deleted file mode 100644<br>
index 7b56276..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/arping-fix-<wbr>arping-hang-=
if-SIGALRM-is-<wbr>blocked.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-arping: fix arping hang if SIGALRM is blocked<br>
-<br>
-Unblock SIGALRM so that the previously called alarm() can prevent<br>
-recvfrom() from blocking forever in case the inherited procmask is<br>
-blocking SIGALRM and no packet is received.<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Reported-by: Rui Prior &lt;<a href=3D"mailto:rprior@dcc.fc.up.pt">rprior@d=
cc.fc.up.pt</a>&gt;<br>
-RH-Bugzilla: #1085971<br>
-Signed-off-by: Jan Synacek &lt;<a href=3D"mailto:jsynacek@redhat.com">jsyn=
acek@redhat.com</a>&gt;<br>
-Signed-off-by: Zhenbo Gao &lt;<a href=3D"mailto:zhenbo.gao@windriver.com">=
zhenbo.gao@windriver.com</a>&gt;<br>
-<br>
-diff --git a/arping.c.orig b/arping.c<br>
-index 35408c1..2098159 100644<br>
---- a/arping.c.orig<br>
-+++ b/arping.c<br>
-@@ -1215,16 +1215,22 @@ main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t alen =3D =
sizeof(from);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cc;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sset);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sset, SIG=
ALRM);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sset, SIG=
INT);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Unblock SIGALRM so th=
at the previously called alarm()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* can prevent recv=
from from blocking forever in case the<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* inherited procma=
sk is blocking SIGALRM and no packet<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is received. */<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_UNBLOCK,=
 &amp;sset, &amp;osset);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((cc =3D recvfro=
m(s, packet, sizeof(packet), 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct sockaddr *)&amp;from,=
 &amp;alen)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0perror(&quot;arping: recvfrom&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sset);<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sset, SIG=
ALRM);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sset, SIG=
INT);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &=
amp;sset, &amp;osset);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &=
amp;sset, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recv_pack(packet, c=
c, (struct sockaddr_ll *)&amp;from);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigprocmask(SIG_SET=
MASK, &amp;osset, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/debian/targets.<wbr>d=
iff b/meta/recipes-extended/<wbr>iputils/files/debian/targets.<wbr>diff<br>
deleted file mode 100644<br>
index 2cb5576..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/debian/targets.<wbr>diff<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Inappropriate [disable feature]<br>
-<br>
-Index: iputils-s20121221/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20121221.orig/<wbr>Makefile<br>
-+++ iputils-s20121221/Makefile<br>
-@@ -106,7 +106,7 @@ endif<br>
- endif<br>
-<br>
- # ------------------------------<wbr>-------<br>
--IPV4_TARGETS=3Dtracepath ping clockdiff rdisc arping tftpd rarpd<br>
-+IPV4_TARGETS=3Dtracepath ping clockdiff arping<br>
- IPV6_TARGETS=3Dtracepath6 traceroute6 ping6<br>
- TARGETS=3D$(IPV4_TARGETS) $(IPV6_TARGETS)<br>
-<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/debian/use_<wbr>getho=
stbyname2.diff b/meta/recipes-extended/<wbr>iputils/files/debian/use_<wbr>g=
ethostbyname2.diff<br>
deleted file mode 100644<br>
index d3b1886..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/debian/use_<wbr>gethostbynam=
e2.diff<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-Upstream-Status: Pending [from other distro Debian]<br>
-<br>
-Index: iputils-s20121221/tracepath.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20121221.orig/<wbr>tracepath.c<br>
-+++ iputils-s20121221/tracepath.c<br>
-@@ -370,9 +370,9 @@ main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 he =3D gethostbyname(p);<br>
-+=C2=A0 =C2=A0 =C2=A0 he =3D gethostbyname2(argv[0], AF_INET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (he =3D=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 herror(&quot;gethostbyna=
me&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 herror(&quot;gethostbyna=
me2&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-Index: iputils-s20121221/ping.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20121221.orig/ping.c<br>
-+++ iputils-s20121221/ping.c<br>
-@@ -279,7 +279,7 @@ main(int argc, char **argv)<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0idn =3D target;<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hp =3D gethostbyname(idn);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hp =3D gethostbyname2(idn, AF_INET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!hp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;ping: unknown h=
ost %s\n&quot;, target);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(2);<br>
diff --git a/meta/recipes-extended/<wbr>iputils/files/nsgmls-path-fix.<wbr>=
patch b/meta/recipes-extended/<wbr>iputils/files/nsgmls-path-fix.<wbr>patch=
<br>
deleted file mode 100644<br>
index 92bf946..0000000<br>
--- a/meta/recipes-extended/<wbr>iputils/files/nsgmls-path-fix.<wbr>patch<b=
r>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-Fix nsgmls path issue<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Zhai Edwin &lt;<a href=3D"mailto:edwin.zhai@intel.com">edwi=
n.zhai@intel.com</a>&gt;<br>
-<br>
-Index: iputils-s20101006/doc/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20101006.orig/doc/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 20=
11-09-13 20:42:27.000000000 +0800<br>
-+++ iputils-s20101006/doc/Makefile=C2=A0 =C2=A0 =C2=A02011-09-13 21:01:52.=
000000000 +0800<br>
-@@ -27,10 +27,15 @@<br>
- # docbook2man produces utterly ugly output and I did not find<br>
- # any way to customize this but hacking backend perl script a little.<br>
- # Well, hence...<br>
-+# nsgmls seems append path to search directory according to the sysid pat=
h.<br>
-+# e.g. if input ../index.db, it would search $search_directory/../ rather=
 than<br>
-+# $search_directory, which leads searching failure. Fixing nsgmls probabl=
y<br>
-+# introduce some side effects, so use this ugly hack: running nsgmls in c=
urrent<br>
-+# directory, and running docbook2man in tmp directory.<br>
-<br>
- $(MANFILES): index.db<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@-mkdir tmp.db2man<br>
--=C2=A0 =C2=A0 =C2=A0 @set -e; cd tmp.db2man; nsgmls ../$&lt; | sgmlspl ..=
/<a href=3D"http://docbook2man-spec.pl" rel=3D"noreferrer" target=3D"_blank=
">docbook2man-spec.pl</a> ; mv $@ ..<br>
-+=C2=A0 =C2=A0 =C2=A0 @set -e; nsgmls $&lt; &gt;tmp.db2man/output; cd tmp.=
db2man; cat output | sgmlspl ../<a href=3D"http://docbook2man-spec.pl" rel=
=3D"noreferrer" target=3D"_blank">docbook2man-spec.pl</a> ;=C2=A0 =C2=A0 =
=C2=A0mv $@ ..<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@-rm -rf tmp.db2man<br>
-<br>
- clean:<br>
diff --git a/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s=
20151218.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a> =
b/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s20161105.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br>
similarity index 56%<br>
rename from meta/recipes-extended/iputils/<a href=3D"http://iputils_s201512=
18.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20151218.bb</a><b=
r>
rename to meta/recipes-extended/iputils/<a href=3D"http://iputils_s20161105=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20161105.bb</a><br>
index 46de6fc..ad7dbc4 100644<br>
--- a/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s2015121=
8.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a><br>
+++ b/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s2016110=
5.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Network monitoring tools&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Utilities for the IP protocol, including tracer=
oute6, \<br>
=C2=A0tracepath, tracepath6, ping, ping6 and arping.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.skbuff.net/iputils" rel=3D"norefe=
rrer" target=3D"_blank">http://www.skbuff.net/iputils</a><wbr>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/iputils/iputils" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/iputils/<wbr>iputils</a>&qu=
ot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD &amp; GPLv2+&quot;<br>
@@ -13,20 +13,13 @@ LIC_FILES_CHKSUM =3D &quot;file://ping.c;beginline=3D1;=
<wbr>endline=3D35;md5=3D<wbr>f9ceb201733e9a6cf8f<br>
<br>
=C2=A0DEPENDS =3D &quot;gnutls libcap libgcrypt&quot;<br>
<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils" rel=
=3D"noreferrer" target=3D"_blank">github.com/iputils/<wbr>iputils</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-on-MUSL.<wb=
r>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;<wbr>bffc0e957b98d626ab4cea218c8925<wbr>1201425442&quot;<=
br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.skbuff.net/iputils/${BPN}-${PV}.ta=
r.bz2" rel=3D"noreferrer" target=3D"_blank">http://www.skbuff.net/<wbr>iput=
ils/${BPN}-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/use_<wbr>gethostbyn=
ame2.diff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/targets.diff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nsgmls-path-fix.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-header-<wbr>inclu=
sion-for-musl.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Intialize-struct-<wbr=
>elements-by-name.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arping-fix-arping-hang-<wb=
r>if-SIGALRM-is-blocked.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>8aaa7395f27dff9f57ae016d4bc753<wbr>ce&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>549f58d71951e52b46595829134d4e<wbr>33064=
2f522f50026917fadc349a548<wbr>25a1&quot;<br>
-<br>
-UPSTREAM_CHECK_REGEX =3D &quot;iputils-(?P&lt;pver&gt;s\d+).tar&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;s\d+)&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
<br>
@@ -38,11 +31,10 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 -d ${D}${base_bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # SUID root programs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 4555 ping ${D}${base_bindir}/ping<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 4555 ping6 ${D}${base_bindir}/ping6<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 4555 traceroute6 ${D}${base_bindir}/=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 4555 clockdiff ${D}${base_bindir}/<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Other programgs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in arping tracepath tracepath6; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in arping tracepath; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 $i ${D}${base_bindir}/<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
@@ -54,19 +46,14 @@ ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
=C2=A0ALTERNATIVE_${PN}-ping =3D &quot;ping&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[ping] =3D &quot;${base_bindir}/ping&quot;<br>
<br>
-ALTERNATIVE_${PN}-ping6 =3D &quot;ping6&quot;<br>
-ALTERNATIVE_LINK_NAME[ping6] =3D &quot;${base_bindir}/ping6&quot;<br>
-<br>
-PACKAGES +=3D &quot;${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${=
PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff&quot;<br>
+PACKAGES +=3D &quot;${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-tracerou=
te6 ${PN}-clockdiff&quot;<br>
<br>
=C2=A0ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-RDEPENDS_${PN} +=3D &quot;${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracep=
ath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff&quot;<br>
+RDEPENDS_${PN} +=3D &quot;${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-tr=
aceroute6 ${PN}-clockdiff&quot;<br>
<br>
=C2=A0FILES_${PN}=C2=A0 =C2=A0 =3D &quot;&quot;<br>
=C2=A0FILES_${PN}-ping =3D &quot;${base_bindir}/ping.${BPN}&quot;<br>
-FILES_${PN}-ping6 =3D &quot;${base_bindir}/ping6.${BPN}&quot;<br>
=C2=A0FILES_${PN}-arping =3D &quot;${base_bindir}/arping&quot;<br>
=C2=A0FILES_${PN}-tracepath =3D &quot;${base_bindir}/tracepath&quot;<br>
-FILES_${PN}-tracepath6 =3D &quot;${base_bindir}/tracepath6&quot;<br>
=C2=A0FILES_${PN}-traceroute6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${base_b=
indir}/traceroute6&quot;<br>
=C2=A0FILES_${PN}-clockdiff =3D &quot;${base_bindir}/clockdiff&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--94eb2c1b54d468e5f10564925824--
