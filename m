Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id C641378493;
	Tue,  6 Feb 2018 22:41:31 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id w50so3659967wrc.2;
	Tue, 06 Feb 2018 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=70IbVv/yRvDzUFeX4Hndae/OAhoUAsXgPSpVRExNl70=;
	b=eo3JuHRI0TkRMKocR9OcSdDONe359cH7RLuJh17O0GE6Rx34IJoBtBTEY/CsUwWBXj
	DmRXw5++gNmqlBNmuqk40C2CVgHz1BxraNaF6DQz6wJ8NFluJQsqgqxhv7Y1aRQ20sah
	qid5SpbMChC6wDGMvz/dvgbZDp1ioH4Uv+VHlY9vcoYjIQlODXLwQlyfvQU9T3HRn2ns
	87Ww5mAkav9o36MNtFBLb/7h9wKQlI7IAx8f6fV2XTsza3ePedAeiVHYdzsfAfSwvWRp
	dz9f8esaw/D1WXuEg5zXDLhqYSobvsrK0xuzP+ZYLyhWz77IXgyo5+83ZhUoEvK+hevh
	5NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=70IbVv/yRvDzUFeX4Hndae/OAhoUAsXgPSpVRExNl70=;
	b=mcLkCKXNteBdcjCwLzuV+gmtTHT9UQjjVfgoC8ZgY+dki6lsqLqjmnAId6uFANld7r
	VBuxVdrTAiNpELjMS+tBA9IWtUUxpRwNcvGg/atT2nQRYCTpNg2Us4AXhgSyG1v7Lst2
	MBqOshyB7YApCXgXsDF66tOBW0jEzSnZedid3eMjSmv/g3gaEH7HVdiVIy7X/drd8xAA
	W8TcXVumWYpP6dR+a3dNKrNrvEJeH51cilimpjIyKQES5D1a5nmzFXcdYKGqHYmQR4Fo
	9lsNQmZLJUzb/ZaaawES8NEjk3Q88NS4Fa0ugESNd5G7G/BogjKWw+T7HJX14SX2gk8M
	tzBA==
X-Gm-Message-State: APf1xPDiuLdv7KC83jdnuwC8woSzVscxCVB0G+HnbFPkd+BvuG69jsg8
	cwwkPSfw57ZBJev6/1kJsfopWnhcp6zEL3eGHHP7oA==
X-Google-Smtp-Source: AH8x227D94Dnn+gLj/yc6EC+BAVhL8YvJgysl9TOF/Yj8sOUtrY9rZHa1rF+jLI3jea6ce3xWYvpimVQrbaaK3hZ10Y=
X-Received: by 10.223.189.136 with SMTP id l8mr3725880wrh.58.1517956892323;
	Tue, 06 Feb 2018 14:41:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 6 Feb 2018 14:41:31 -0800 (PST)
In-Reply-To: <CA+chaQdbEHUAhDjNGhJvNVgZG7_g5h02tZZhOy7A1qppgcGs_g@mail.gmail.com>
References: <151791522137.12584.390331907954611211@git.openembedded.org>
	<20180206110703.83BD6234808@git.openembedded.org>
	<CA+chaQdbEHUAhDjNGhJvNVgZG7_g5h02tZZhOy7A1qppgcGs_g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2018 23:41:31 +0100
Message-ID: <CA+chaQfE8Qtsc5LjNXXqhDaM-MS6tnpwAzi5_dEsHcU3B037Hw@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Feb 2018 22:41:32 -0000
Content-Type: multipart/alternative; boundary="089e082b0df059f332056492e1a3"

--089e082b0df059f332056492e1a3
Content-Type: text/plain; charset="UTF-8"

https://github.com/iputils/iputils/blob/master/RELNOTES.old

mentiones that IDN was enabled by default in:
[s20160308] and surprisingly the same in [s20150815]
but there are no release notes for s20151218 version we were using until
now, don't know how it really relates to [s20150815].

https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547

Easiest way to reproduce this failure is to remove libidn from gnutls
PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG at
all (like the one in meta-gplv2).

First it leads to following QA issue:
http://errors.yoctoproject.org/Errors/Build/53212/
ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping rdepends
on libidn, but it isn't a build dependency, missing libidn in DEPENDS or
PACKAGECONFIG? [build-deps]
ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-traceroute6
rdepends on libidn, but it isn't a build dependency, missing libidn in
DEPENDS or PACKAGECONFIG? [build-deps]
ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.
ERROR: iputils-s20161105-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
ERROR: Task
(/OE/build/oe-core/openembedded-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa)
failed with exit code '1'

But if you cleansstate iputils as well (after removing libidn from gnutls
PACKAGECONFIG) to empty iputils RSS, then you get the error about missing
idna.h:
http://errors.yoctoproject.org/Errors/Build/53213/

Adding the libidn dependency explicitly in iputils recipe fixes the issue.

Regards,

On Tue, Feb 6, 2018 at 11:03 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Doesn't this new version depend on libidn?
>
> Maybe it should be new PACKAGECONFIG or something, but here all builds
> fail with:
>
> | In file included from ping_common.c:1:0:
> | ping.h:39:10: fatal error: idna.h: No such file or directory
> |  #include <idna.h>
> |           ^~~~~~~~
>
> I'm running another build with just oe-core and nodistro to check if it
> fails the same there as well.
>
> Regards,
>
> On Tue, Feb 6, 2018 at 12:07 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
>> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> AuthorDate: Thu Feb 1 20:02:08 2018 +0200
>>
>>     iputils: update to 20161105
>>
>>     We've been using obsolete upstream URI for quite a while; meanwhile
>>     a lot of development has happened
>>
>>     Drop all the patches: they are either changing the code that has been
>> refactored,
>>     or are backports.
>>
>>     Add a new musl fix patch from gentoo.
>>
>>     ping6 and tracepath6 variants have been folded into standard versions.
>>
>>     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  .../iputils/files/0001-Fix-build-on-MUSL.patch     | 93
>> ++++++++++++++++++++++
>>  .../files/0001-Fix-header-inclusion-for-musl.patch | 92
>> ---------------------
>>  .../0001-Intialize-struct-elements-by-name.patch   | 52 ------------
>>  ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ----------
>>  .../iputils/files/debian/targets.diff              | 15 ----
>>  .../iputils/files/debian/use_gethostbyname2.diff   | 31 --------
>>  .../iputils/files/nsgmls-path-fix.patch            | 27 -------
>>  .../{iputils_s20151218.bb => iputils_s20161105.bb} | 33 +++-----
>>  8 files changed, 103 insertions(+), 284 deletions(-)
>>
>> diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
>> b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
>> new file mode 100644
>> index 0000000..c86dafc
>> --- /dev/null
>> +++ b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
>> @@ -0,0 +1,93 @@
>> +From c6c5966d9fae27bc2f0a34ab59b999555111bd2d Mon Sep 17 00:00:00 2001
>> +From: Aric Belsito <lluixhi@gmail.com>
>> +Date: Sun, 29 Oct 2017 23:17:03 +0100
>> +Subject: [PATCH] Fix build on MUSL
>> +
>> +Add missing AI_IDN and NI_IDN declarations.
>> +
>> +Bug: https://bugs.gentoo.org/503914
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +---
>> + arping.c      |  7 +++++++
>> + ping.h        | 11 +++++++++++
>> + tracepath.c   |  8 ++++++++
>> + traceroute6.c |  4 ++++
>> + 4 files changed, 30 insertions(+)
>> +
>> +diff --git a/arping.c b/arping.c
>> +index 1a3f40b..531d29d 100644
>> +--- a/arping.c
>> ++++ b/arping.c
>> +@@ -45,6 +45,13 @@ struct sysfs_devattr_values;
>> + #ifdef USE_IDN
>> + #include <idna.h>
>> + #include <locale.h>
>> ++
>> ++#ifndef AI_IDN
>> ++#define AI_IDN 0x0040
>> ++#endif
>> ++#ifndef AI_CANONIDN
>> ++#define AI_CANONIDN 0x0080
>> ++#endif
>> + #endif
>> +
>> + #include "SNAPSHOT.h"
>> +diff --git a/ping.h b/ping.h
>> +index 749f3ff..227315f 100644
>> +--- a/ping.h
>> ++++ b/ping.h
>> +@@ -38,6 +38,17 @@
>> + #include <locale.h>
>> + #include <idna.h>
>> + #include <stringprep.h>
>> ++
>> ++#ifndef AI_IDN
>> ++#define AI_IDN 0x0040
>> ++#endif
>> ++#ifndef AI_CANONIDN
>> ++#define AI_CANONIDN 0x0080
>> ++#endif
>> ++#ifndef NI_IDN
>> ++#define NI_IDN 32
>> ++#endif
>> ++
>> + #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
>> + #define getnameinfo_flags NI_IDN
>> + #else
>> +diff --git a/tracepath.c b/tracepath.c
>> +index 74a829d..dcec5b9 100644
>> +--- a/tracepath.c
>> ++++ b/tracepath.c
>> +@@ -30,6 +30,14 @@
>> + #ifdef USE_IDN
>> + #include <idna.h>
>> + #include <locale.h>
>> ++
>> ++#ifndef AI_IDN
>> ++#define AI_IDN 0x0040
>> ++#endif
>> ++#ifndef NI_IDN
>> ++#define NI_IDN 32
>> ++#endif
>> ++
>> + #define getnameinfo_flags     NI_IDN
>> + #else
>> + #define getnameinfo_flags     0
>> +diff --git a/traceroute6.c b/traceroute6.c
>> +index 48fc5c5..8d1eebf 100644
>> +--- a/traceroute6.c
>> ++++ b/traceroute6.c
>> +@@ -251,6 +251,10 @@
>> + #include <idna.h>
>> + #include <locale.h>
>> +
>> ++#ifndef NI_IDN
>> ++#define NI_IDN 32
>> ++#endif
>> ++
>> + #define getnameinfo_flags     NI_IDN
>> + #else
>> + #define getnameinfo_flags     0
>> +--
>> +2.15.1
>> +
>> diff --git a/meta/recipes-extended/iputils/files/0001-Fix-header-inclusion-for-musl.patch
>> b/meta/recipes-extended/iputils/files/0001-Fix-header-inclus
>> ion-for-musl.patch
>> deleted file mode 100644
>> index 20ef07e..0000000
>> --- a/meta/recipes-extended/iputils/files/0001-Fix-header-inclus
>> ion-for-musl.patch
>> +++ /dev/null
>> @@ -1,92 +0,0 @@
>> -From be0bb81d72fea4d20da74f4f2236aa145684f332 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 6 Jan 2016 14:14:22 -0800
>> -Subject: [PATCH] Fix header inclusion for musl
>> -
>> -Fix errors e.g.
>> -
>> -In file included from tracepath.c:17:0:
>> -/usr/include/linux/errqueue.h:33:18:
>> -error: array type has incomplete element type 'struct timespec'
>> -  struct timespec ts[3];
>> -                  ^
>> -tracepath.c: In function 'main':
>> -tracepath.c:329:16: error: 'INT_MAX' undeclared (first use in this
>> -function)
>> -      overhead, INT_MAX);
>> -                ^
>> -tracepath.c:329:16: note: each undeclared identifier is reported only
>> -once for each function it appears in
>> -Makefile:131: recipe for target 'tracepath.o' failed
>> -make: *** [tracepath.o] Error 1
>> -
>> -ping_common.c: In function 'main_loop':
>> -ping_common.c:756:15: error: 'HZ' undeclared (first use in this
>> -function)
>> -    if (1000 % HZ == 0 ? next <= 1000 / HZ : (next < INT_MAX / HZ &&
>> -next * HZ <= 1000)) {
>> -
>> -protocols/timed.h is not needed and is absent in musl
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -Upstream-Status: Pending
>> -
>> - clockdiff.c   | 1 -
>> - ping_common.c | 1 +
>> - tracepath.c   | 2 ++
>> - tracepath6.c  | 1 +
>> - 4 files changed, 4 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/clockdiff.c b/clockdiff.c
>> -index 7c1ea1b..1d6341e 100644
>> ---- a/clockdiff.c
>> -+++ b/clockdiff.c
>> -@@ -14,7 +14,6 @@
>> - #include <netinet/ip.h>
>> - #include <netinet/ip_icmp.h>
>> - #define TSPTYPES
>> --#include <protocols/timed.h>
>> - #include <fcntl.h>
>> - #include <netdb.h>
>> - #include <arpa/inet.h>
>> -diff --git a/ping_common.c b/ping_common.c
>> -index 7f82851..3ce699d 100644
>> ---- a/ping_common.c
>> -+++ b/ping_common.c
>> -@@ -2,6 +2,7 @@
>> - #include <ctype.h>
>> - #include <sched.h>
>> - #include <math.h>
>> -+#include <asm-generic/param.h>
>> -
>> - int options;
>> -
>> -diff --git a/tracepath.c b/tracepath.c
>> -index 89e6d16..c9d6ddd 100644
>> ---- a/tracepath.c
>> -+++ b/tracepath.c
>> -@@ -12,6 +12,8 @@
>> - #include <stdio.h>
>> - #include <stdlib.h>
>> - #include <unistd.h>
>> -+#include <limits.h>
>> -+#include <time.h>
>> - #include <sys/socket.h>
>> - #include <linux/types.h>
>> - #include <linux/errqueue.h>
>> -diff --git a/tracepath6.c b/tracepath6.c
>> -index 126fadf..9d5745c 100644
>> ---- a/tracepath6.c
>> -+++ b/tracepath6.c
>> -@@ -12,6 +12,7 @@
>> - #include <stdio.h>
>> - #include <stdlib.h>
>> - #include <unistd.h>
>> -+#include <limits.h>
>> - #include <sys/socket.h>
>> - #include <netinet/in.h>
>> - #include <netinet/icmp6.h>
>> ---
>> -2.6.4
>> -
>> diff --git a/meta/recipes-extended/iputils/files/0001-Intialize-struct-elements-by-name.patch
>> b/meta/recipes-extended/iputils/files/0001-Intialize-struct-
>> elements-by-name.patch
>> deleted file mode 100644
>> index 6da01dc..0000000
>> --- a/meta/recipes-extended/iputils/files/0001-Intialize-struct-
>> elements-by-name.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From 000629f74908a2a95f6104444c77ad93cf40d62d Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 13 Jan 2016 08:50:50 +0000
>> -Subject: [PATCH] Intialize struct elements by name
>> -
>> -makes it portable across glibc and musl
>> -
>> -Fixes errors
>> -
>> -| ping.c: In function 'send_probe':
>> -| ping.c:735:19: warning: initialization makes integer from pointer
>> -without a cast [-Wint-conversion]
>> -|           &iov, 1, &cmsg, 0, 0 };
>> -|                    ^
>> -| ping.c:735:19: note: (near initialization for 'm.__pad1')
>> -| ping.c:735:19: error: initializer element is not computable at load
>> -time
>> -| ping.c:735:19: note: (near initialization for 'm.__pad1')
>> -| make: *** [ping.o] Error 1
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -Upstream-Status: Pending
>> -
>> - ping.c | 11 +++++++++--
>> - 1 file changed, 9 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/ping.c b/ping.c
>> -index 4989760..e67f381 100644
>> ---- a/ping.c
>> -+++ b/ping.c
>> -@@ -731,8 +731,15 @@ int send_probe()
>> -
>> -       do {
>> -               static struct iovec iov = {outpack, 0};
>> --              static struct msghdr m = { &whereto, sizeof(whereto),
>> --                                                 &iov, 1, &cmsg, 0, 0 };
>> -+              static struct msghdr m = {
>> -+                      .msg_name = &whereto,
>> -+                      .msg_namelen = sizeof(whereto),
>> -+                      .msg_iov = &iov,
>> -+                      .msg_iovlen = 1,
>> -+                      .msg_control = &cmsg,
>> -+                      .msg_controllen = 0,
>> -+                      .msg_flags= 0,
>> -+              };
>> -               m.msg_controllen = cmsg_len;
>> -               iov.iov_len = cc;
>> -
>> ---
>> -2.7.0
>> -
>> diff --git a/meta/recipes-extended/iputils/files/arping-fix-arping-
>> hang-if-SIGALRM-is-blocked.patch b/meta/recipes-extended/iputil
>> s/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
>> deleted file mode 100644
>> index 7b56276..0000000
>> --- a/meta/recipes-extended/iputils/files/arping-fix-arping-
>> hang-if-SIGALRM-is-blocked.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -arping: fix arping hang if SIGALRM is blocked
>> -
>> -Unblock SIGALRM so that the previously called alarm() can prevent
>> -recvfrom() from blocking forever in case the inherited procmask is
>> -blocking SIGALRM and no packet is received.
>> -
>> -Upstream-Status: Backport
>> -
>> -Reported-by: Rui Prior <rprior@dcc.fc.up.pt>
>> -RH-Bugzilla: #1085971
>> -Signed-off-by: Jan Synacek <jsynacek@redhat.com>
>> -Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
>> -
>> -diff --git a/arping.c.orig b/arping.c
>> -index 35408c1..2098159 100644
>> ---- a/arping.c.orig
>> -+++ b/arping.c
>> -@@ -1215,16 +1215,22 @@ main(int argc, char **argv)
>> -               socklen_t alen = sizeof(from);
>> -               int cc;
>> -
>> -+              sigemptyset(&sset);
>> -+              sigaddset(&sset, SIGALRM);
>> -+              sigaddset(&sset, SIGINT);
>> -+              /* Unblock SIGALRM so that the previously called alarm()
>> -+               * can prevent recvfrom from blocking forever in case the
>> -+               * inherited procmask is blocking SIGALRM and no packet
>> -+               * is received. */
>> -+              sigprocmask(SIG_UNBLOCK, &sset, &osset);
>> -+
>> -               if ((cc = recvfrom(s, packet, sizeof(packet), 0,
>> -                                  (struct sockaddr *)&from, &alen)) < 0)
>> {
>> -                       perror("arping: recvfrom");
>> -                       continue;
>> -               }
>> -
>> --              sigemptyset(&sset);
>> --              sigaddset(&sset, SIGALRM);
>> --              sigaddset(&sset, SIGINT);
>> --              sigprocmask(SIG_BLOCK, &sset, &osset);
>> -+              sigprocmask(SIG_BLOCK, &sset, NULL);
>> -               recv_pack(packet, cc, (struct sockaddr_ll *)&from);
>> -               sigprocmask(SIG_SETMASK, &osset, NULL);
>> -       }
>> diff --git a/meta/recipes-extended/iputils/files/debian/targets.diff
>> b/meta/recipes-extended/iputils/files/debian/targets.diff
>> deleted file mode 100644
>> index 2cb5576..0000000
>> --- a/meta/recipes-extended/iputils/files/debian/targets.diff
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Inappropriate [disable feature]
>> -
>> -Index: iputils-s20121221/Makefile
>> -===================================================================
>> ---- iputils-s20121221.orig/Makefile
>> -+++ iputils-s20121221/Makefile
>> -@@ -106,7 +106,7 @@ endif
>> - endif
>> -
>> - # -------------------------------------
>> --IPV4_TARGETS=tracepath ping clockdiff rdisc arping tftpd rarpd
>> -+IPV4_TARGETS=tracepath ping clockdiff arping
>> - IPV6_TARGETS=tracepath6 traceroute6 ping6
>> - TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS)
>> -
>> diff --git a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
>> b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
>> deleted file mode 100644
>> index d3b1886..0000000
>> --- a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Upstream-Status: Pending [from other distro Debian]
>> -
>> -Index: iputils-s20121221/tracepath.c
>> -===================================================================
>> ---- iputils-s20121221.orig/tracepath.c
>> -+++ iputils-s20121221/tracepath.c
>> -@@ -370,9 +370,9 @@ main(int argc, char **argv)
>> -       }
>> - #endif
>> -
>> --      he = gethostbyname(p);
>> -+      he = gethostbyname2(argv[0], AF_INET);
>> -       if (he == NULL) {
>> --              herror("gethostbyname");
>> -+              herror("gethostbyname2");
>> -               exit(1);
>> -       }
>> -
>> -Index: iputils-s20121221/ping.c
>> -===================================================================
>> ---- iputils-s20121221.orig/ping.c
>> -+++ iputils-s20121221/ping.c
>> -@@ -279,7 +279,7 @@ main(int argc, char **argv)
>> - #else
>> -                       idn = target;
>> - #endif
>> --                      hp = gethostbyname(idn);
>> -+                      hp = gethostbyname2(idn, AF_INET);
>> -                       if (!hp) {
>> -                               fprintf(stderr, "ping: unknown host
>> %s\n", target);
>> -                               exit(2);
>> diff --git a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
>> b/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
>> deleted file mode 100644
>> index 92bf946..0000000
>> --- a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -Fix nsgmls path issue
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
>> -
>> -Index: iputils-s20101006/doc/Makefile
>> -===================================================================
>> ---- iputils-s20101006.orig/doc/Makefile        2011-09-13
>> 20:42:27.000000000 +0800
>> -+++ iputils-s20101006/doc/Makefile     2011-09-13 21:01:52.000000000
>> +0800
>> -@@ -27,10 +27,15 @@
>> - # docbook2man produces utterly ugly output and I did not find
>> - # any way to customize this but hacking backend perl script a little.
>> - # Well, hence...
>> -+# nsgmls seems append path to search directory according to the sysid
>> path.
>> -+# e.g. if input ../index.db, it would search $search_directory/../
>> rather than
>> -+# $search_directory, which leads searching failure. Fixing nsgmls
>> probably
>> -+# introduce some side effects, so use this ugly hack: running nsgmls in
>> current
>> -+# directory, and running docbook2man in tmp directory.
>> -
>> - $(MANFILES): index.db
>> -       @-mkdir tmp.db2man
>> --      @set -e; cd tmp.db2man; nsgmls ../$< | sgmlspl ../
>> docbook2man-spec.pl ; mv $@ ..
>> -+      @set -e; nsgmls $< >tmp.db2man/output; cd tmp.db2man; cat output
>> | sgmlspl ../docbook2man-spec.pl ;     mv $@ ..
>> -       @-rm -rf tmp.db2man
>> -
>> - clean:
>> diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb
>> b/meta/recipes-extended/iputils/iputils_s20161105.bb
>> similarity index 56%
>> rename from meta/recipes-extended/iputils/iputils_s20151218.bb
>> rename to meta/recipes-extended/iputils/iputils_s20161105.bb
>> index 46de6fc..ad7dbc4 100644
>> --- a/meta/recipes-extended/iputils/iputils_s20151218.bb
>> +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
>> @@ -1,7 +1,7 @@
>>  SUMMARY = "Network monitoring tools"
>>  DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
>>  tracepath, tracepath6, ping, ping6 and arping."
>> -HOMEPAGE = "http://www.skbuff.net/iputils"
>> +HOMEPAGE = "https://github.com/iputils/iputils"
>>  SECTION = "console/network"
>>
>>  LICENSE = "BSD & GPLv2+"
>> @@ -13,20 +13,13 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;end
>> line=35;md5=f9ceb201733e9a6cf8f
>>
>>  DEPENDS = "gnutls libcap libgcrypt"
>>
>> +SRC_URI = "git://github.com/iputils/iputils \
>> +           file://0001-Fix-build-on-MUSL.patch \
>> +           "
>> +S = "${WORKDIR}/git"
>> +SRCREV = "bffc0e957b98d626ab4cea218c89251201425442"
>>
>> -SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
>> -           file://debian/use_gethostbyname2.diff \
>> -           file://debian/targets.diff \
>> -           file://nsgmls-path-fix.patch \
>> -           file://0001-Fix-header-inclusion-for-musl.patch \
>> -           file://0001-Intialize-struct-elements-by-name.patch \
>> -           file://arping-fix-arping-hang-if-SIGALRM-is-blocked.patch \
>> -          "
>> -
>> -SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
>> -SRC_URI[sha256sum] = "549f58d71951e52b46595829134d4
>> e330642f522f50026917fadc349a54825a1"
>> -
>> -UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
>> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
>>
>>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>>
>> @@ -38,11 +31,10 @@ do_install () {
>>         install -m 0755 -d ${D}${base_bindir}
>>         # SUID root programs
>>         install -m 4555 ping ${D}${base_bindir}/ping
>> -       install -m 4555 ping6 ${D}${base_bindir}/ping6
>>         install -m 4555 traceroute6 ${D}${base_bindir}/
>>         install -m 4555 clockdiff ${D}${base_bindir}/
>>         # Other programgs
>> -       for i in arping tracepath tracepath6; do
>> +       for i in arping tracepath; do
>>           install -m 0755 $i ${D}${base_bindir}/
>>         done
>>  }
>> @@ -54,19 +46,14 @@ ALTERNATIVE_PRIORITY = "100"
>>  ALTERNATIVE_${PN}-ping = "ping"
>>  ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
>>
>> -ALTERNATIVE_${PN}-ping6 = "ping6"
>> -ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
>> -
>> -PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath
>> ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
>> +PACKAGES += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6
>> ${PN}-clockdiff"
>>
>>  ALLOW_EMPTY_${PN} = "1"
>> -RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath
>> ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
>> +RDEPENDS_${PN} += "${PN}-ping ${PN}-arping ${PN}-tracepath
>> ${PN}-traceroute6 ${PN}-clockdiff"
>>
>>  FILES_${PN}    = ""
>>  FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
>> -FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
>>  FILES_${PN}-arping = "${base_bindir}/arping"
>>  FILES_${PN}-tracepath = "${base_bindir}/tracepath"
>> -FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
>>  FILES_${PN}-traceroute6        = "${base_bindir}/traceroute6"
>>  FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
>
>

--089e082b0df059f332056492e1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://github.com/iputils/iputils/blob/master/=
RELNOTES.old">https://github.com/iputils/iputils/blob/master/RELNOTES.old</=
a><br><div><br></div><div>mentiones that IDN was enabled by default in:</di=
v><div>[s20160308] and surprisingly the same in=C2=A0[s20150815]<br></div><=
div>but there are no release notes for=C2=A0s20151218 version we were using=
 until now, don&#39;t know how it really relates to=C2=A0<span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">[s20150815].</span></div><div><br></div><div><a href=3D"https://git=
hub.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547">ht=
tps://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e2=
94547</a><br></div><div><br></div><div>Easiest way to reproduce this failur=
e is to remove libidn from gnutls PACKAGECONFIG or to use gnutls which does=
n&#39;t have libidn PACKAGECONFIG at all (like the one in meta-gplv2).</div=
><div><br></div><div>First it leads to following QA issue:</div><div><a hre=
f=3D"http://errors.yoctoproject.org/Errors/Build/53212/">http://errors.yoct=
oproject.org/Errors/Build/53212/</a><br></div><div><div>ERROR: iputils-s201=
61105-r0 do_package_qa: QA Issue: iputils-ping rdepends on libidn, but it i=
sn&#39;t a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [b=
uild-deps]</div><div>ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: i=
putils-traceroute6 rdepends on libidn, but it isn&#39;t a build dependency,=
 missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]</div><div>ERROR: =
iputils-s20161105-r0 do_package_qa: QA run found fatal errors. Please consi=
der fixing them.</div><div>ERROR: iputils-s20161105-r0 do_package_qa: Funct=
ion failed: do_package_qa</div><div>ERROR: Logfile of failure stored in: /O=
E/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/=
log.do_package_qa.7627</div><div>ERROR: Task (/OE/build/oe-core/openembedde=
d-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) fa=
iled with exit code &#39;1&#39;</div></div><div><br></div><div>But if you c=
leansstate iputils as well (after removing libidn from gnutls PACKAGECONFIG=
) to empty iputils RSS, then you get the error about missing idna.h:</div><=
div><a href=3D"http://errors.yoctoproject.org/Errors/Build/53213/">http://e=
rrors.yoctoproject.org/Errors/Build/53213/</a><br></div><div><br></div><div=
>Adding the libidn dependency explicitly in iputils recipe fixes the issue.=
</div><div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Tue, Feb 6, 2018 at 11:03 PM, Martin Jansa =
<span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">Doesn&#39;t this new version depend on libidn?<=
div><br></div><div>Maybe it should be new PACKAGECONFIG or something, but h=
ere all builds fail with:</div><div><br></div><div><div>| In file included =
from ping_common.c:1:0:</div><div>| ping.h:39:10: fatal error: idna.h: No s=
uch file or directory</div><div>|=C2=A0 #include &lt;idna.h&gt;</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~</div></div><div><br></div=
><div>I&#39;m running another build with just oe-core and nodistro to check=
 if it fails the same there as well.</div><div><br></div><div>Regards,</div=
></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Tue, Feb 6, 2018 at 12:07 PM,  <span dir=
=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">=
git@git.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">This is an automated email from the git hooks/post-receive script.<br=
>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 5997981fa2c22609a88b8cbb595dbf<wbr>7758b2f7c2<br>
Author: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.int=
el.com" target=3D"_blank">alexander.kanavin@linux.intel<wbr>.com</a>&gt;<br=
>
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
der.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.inte=
l<wbr>.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../iputils/files/0001-Fix-bu<wbr>ild-on-MUSL.patch=C2=A0 =C2=A0 =C2=
=A0| 93 ++++++++++++++++++++++<br>
=C2=A0.../files/0001-Fix-header-inc<wbr>lusion-for-musl.patch | 92 --------=
-------------<br>
=C2=A0.../0001-Intialize-struct-ele<wbr>ments-by-name.patch=C2=A0 =C2=A0| 5=
2 ------------<br>
=C2=A0...ing-fix-arping-hang-if-SIG<wbr>ALRM-is-blocked.patch | 44 --------=
--<br>
=C2=A0.../iputils/files/debian/targ<wbr>ets.diff=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 15 ----<br>
=C2=A0.../iputils/files/debian/use_<wbr>gethostbyname2.diff=C2=A0 =C2=A0| 3=
1 --------<br>
=C2=A0.../iputils/files/nsgmls-<wbr>path-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 27 -------<br>
=C2=A0.../{<a href=3D"http://iputils_s20151218.bb" rel=3D"noreferrer" targe=
t=3D"_blank">iputils_s20151218.bb</a> =3D&gt; <a href=3D"http://iputils_s20=
161105.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a>} |=
 33 +++-----<br>
=C2=A08 files changed, 103 insertions(+), 284 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/iputil<wbr>s/files/0001-Fix-build-on-<wb=
r>MUSL.patch b/meta/recipes-extended/iputil<wbr>s/files/0001-Fix-build-on-<=
wbr>MUSL.patch<br>
new file mode 100644<br>
index 0000000..c86dafc<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/iputil<wbr>s/files/0001-Fix-build-on-<wbr>MUSL.=
patch<br>
@@ -0,0 +1,93 @@<br>
+From c6c5966d9fae27bc2f0a34ab59b999<wbr>555111bd2d Mon Sep 17 00:00:00 200=
1<br>
+From: Aric Belsito &lt;<a href=3D"mailto:lluixhi@gmail.com" target=3D"_bla=
nk">lluixhi@gmail.com</a>&gt;<br>
+Date: Sun, 29 Oct 2017 23:17:03 +0100<br>
+Subject: [PATCH] Fix build on MUSL<br>
+<br>
+Add missing AI_IDN and NI_IDN declarations.<br>
+<br>
+Bug: <a href=3D"https://bugs.gentoo.org/503914" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.gentoo.org/503914</a><br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/0001-Fix-header-inclu=
s<wbr>ion-for-musl.patch b/meta/recipes-extended/iputil<wbr>s/files/0001-Fi=
x-header-inclus<wbr>ion-for-musl.patch<br>
deleted file mode 100644<br>
index 20ef07e..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/0001-Fix-header-inclus<wbr>i=
on-for-musl.patch<br>
+++ /dev/null<br>
@@ -1,92 +0,0 @@<br>
-From be0bb81d72fea4d20da74f4f2236aa<wbr>145684f332 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 6 Jan 2016 14:14:22 -0800<br>
-Subject: [PATCH] Fix header inclusion for musl<br>
-<br>
-Fix errors e.g.<br>
-<br>
-In file included from tracepath.c:17:0:<br>
-/usr/include/linux/errqueue.h<wbr>:33:18:<br>
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
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/0001-Intialize-struct=
-<wbr>elements-by-name.patch b/meta/recipes-extended/iputil<wbr>s/files/000=
1-Intialize-struct-<wbr>elements-by-name.patch<br>
deleted file mode 100644<br>
index 6da01dc..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/0001-Intialize-struct-<wbr>e=
lements-by-name.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 000629f74908a2a95f6104444c77ad<wbr>93cf40d62d Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
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
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/arping-fix-arping-<wb=
r>hang-if-SIGALRM-is-blocked.<wbr>patch b/meta/recipes-extended/iputil<wbr>=
s/files/arping-fix-arping-<wbr>hang-if-SIGALRM-is-blocked.<wbr>patch<br>
deleted file mode 100644<br>
index 7b56276..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/arping-fix-arping-<wbr>hang-=
if-SIGALRM-is-blocked.<wbr>patch<br>
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
-Reported-by: Rui Prior &lt;<a href=3D"mailto:rprior@dcc.fc.up.pt" target=
=3D"_blank">rprior@dcc.fc.up.pt</a>&gt;<br>
-RH-Bugzilla: #1085971<br>
-Signed-off-by: Jan Synacek &lt;<a href=3D"mailto:jsynacek@redhat.com" targ=
et=3D"_blank">jsynacek@redhat.com</a>&gt;<br>
-Signed-off-by: Zhenbo Gao &lt;<a href=3D"mailto:zhenbo.gao@windriver.com" =
target=3D"_blank">zhenbo.gao@windriver.com</a>&gt;<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/debian/targets.diff b=
/meta/recipes-extended/iputil<wbr>s/files/debian/targets.diff<br>
deleted file mode 100644<br>
index 2cb5576..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/debian/targets.diff<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Inappropriate [disable feature]<br>
-<br>
-Index: iputils-s20121221/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20121221.orig/Makefil<wbr>e<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/debian/use_gethostbyn=
a<wbr>me2.diff b/meta/recipes-extended/iputil<wbr>s/files/debian/use_gethos=
tbyna<wbr>me2.diff<br>
deleted file mode 100644<br>
index d3b1886..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/debian/use_gethostbyna<wbr>m=
e2.diff<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-Upstream-Status: Pending [from other distro Debian]<br>
-<br>
-Index: iputils-s20121221/tracepath.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20121221.orig/tracepa<wbr>th.c<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/files/nsgmls-path-fix.patch=
 b/meta/recipes-extended/iputil<wbr>s/files/nsgmls-path-fix.patch<br>
deleted file mode 100644<br>
index 92bf946..0000000<br>
--- a/meta/recipes-extended/iputil<wbr>s/files/nsgmls-path-fix.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-Fix nsgmls path issue<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Zhai Edwin &lt;<a href=3D"mailto:edwin.zhai@intel.com" targ=
et=3D"_blank">edwin.zhai@intel.com</a>&gt;<br>
-<br>
-Index: iputils-s20101006/doc/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- iputils-s20101006.orig/doc/Mak<wbr>efile=C2=A0 =C2=A0 =C2=A0 =C2=A0 20=
11-09-13 20:42:27.000000000 +0800<br>
-+++ iputils-s20101006/doc/<wbr>Makefile=C2=A0 =C2=A0 =C2=A02011-09-13 21:0=
1:52.000000000 +0800<br>
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
diff --git a/meta/recipes-extended/iputil<wbr>s/<a href=3D"http://iputils_s=
20151218.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a> =
b/meta/recipes-extended/iputil<wbr>s/<a href=3D"http://iputils_s20161105.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br>
similarity index 56%<br>
rename from meta/recipes-extended/iputils/<a href=3D"http://iputils_s201512=
18.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20151218.bb</a><b=
r>
rename to meta/recipes-extended/iputils/<a href=3D"http://iputils_s20161105=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20161105.bb</a><br>
index 46de6fc..ad7dbc4 100644<br>
--- a/meta/recipes-extended/iputil<wbr>s/<a href=3D"http://iputils_s2015121=
8.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a><br>
+++ b/meta/recipes-extended/iputil<wbr>s/<a href=3D"http://iputils_s2016110=
5.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Network monitoring tools&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Utilities for the IP protocol, including tracer=
oute6, \<br>
=C2=A0tracepath, tracepath6, ping, ping6 and arping.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.skbuff.net/iputils" rel=3D"norefe=
rrer" target=3D"_blank">http://www.skbuff.net/iputils</a><wbr>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/iputils/iputils" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/iputils/ip<wbr>utils</a>&qu=
ot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD &amp; GPLv2+&quot;<br>
@@ -13,20 +13,13 @@ LIC_FILES_CHKSUM =3D &quot;file://ping.c;beginline=3D1;=
end<wbr>line=3D35;md5=3Df9ceb201733e9a6cf8<wbr>f<br>
<br>
=C2=A0DEPENDS =3D &quot;gnutls libcap libgcrypt&quot;<br>
<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils" rel=
=3D"noreferrer" target=3D"_blank">github.com/iputils/iput<wbr>ils</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-on-<wbr>MUS=
L.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;bffc0e957b98d626ab4cea218c892<wbr>51201425442&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.skbuff.net/iputils/$%7BBPN%7D-$%7B=
PV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://www.skbuff.net/i=
putils<wbr>/${BPN}-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/use_gethostbyna<wbr=
>me2.diff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/targets.diff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nsgmls-path-fix.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-header-inclus<wbr=
>ion-for-musl.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Intialize-struct-<wbr=
>elements-by-name.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arping-fix-arping-<wbr>han=
g-if-SIGALRM-is-blocked.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;8aaa7395f27dff9f57ae016d4bc75<wbr>3ce&quot;<br>
-SRC_URI[sha256sum] =3D &quot;549f58d71951e52b46595829134d4<wbr>e330642f522=
f50026917fadc349a54<wbr>825a1&quot;<br>
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
<span class=3D"m_-3784645872650506308HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--089e082b0df059f332056492e1a3--
