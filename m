Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABC77DDAC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 05:03:04 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c5so5155337pll.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 22:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AzDppWZcPCv54uyycqAWB6qVO/DVP+LUGOV+xH6E5Fc=;
	b=jt40ckMHJgTnPvdpDHMv2grMlFewkFoFHPG7LrLLLitBE/hxgSQWbrs9qs/1c5Oqzv
	AYhynBWn6nvA6Pk3Jy5I3rJa0it5IB/L1PsdyG83+rakSmNLr7fTnEEmn0SlyKzEu8bO
	xR9JSBva/RbY4F15YjoNCmKgWSbOO54mWXfnNdnrm3MolF4XHA5Uld0utfaY/RO91dZQ
	uCfeUy8WLFoG5FpD7TcHU9dipV/WI97WOl/NTneo9sO7wpxXVwgs8/E+bzTMPeQIMYeX
	UZLzR021IkS/Crn2m7UgLKXfhoiJZrl5YenMAAxwInrhFH61uagzFjlzbHjiUYTXjIhr
	2oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AzDppWZcPCv54uyycqAWB6qVO/DVP+LUGOV+xH6E5Fc=;
	b=c4rac99uVxzsXT/myNCmda139fv5PO6yfNvL7t7AdYphBFYmP7hka2OxkGTcRBB0hF
	7seW1ndYRep7p7LrJTBTrV0ZvS9+ypsYPZleF3OeQqOGy9iGl3J9PFQ19htIjS9uMvMD
	YZzPIfh7TES0XE1bIUjWqN6KSxqBz2plz129Mhw/ktDGEFR+oFwNAONz8kS4rSWEInVQ
	0HXhuA3ek2w2PY+f0drVeK+XOCE5lIfTKdabpXd5FahZTKwfK3xKKeTDO0w8pAgJP5es
	EGdUaTW51KvN5E3Ve1fneX77cZdMiYQ61+/RPwy2eEqPsY+d3eABRqh69ty5xGtzu+xu
	Q/Sg==
X-Gm-Message-State: APjAAAWnKxRJmIYnjdAqExhWqUu1IWI24haKFSIN9zC1qta8wt+RfSC0
	bfZtE7oeiO3RTmJbTZoSuIbEz305n5E=
X-Google-Smtp-Source: APXvYqz4j60/EKTtM4obf4fDORm8zOgx28joFrY+U+V4mczGeHwKSNbyUUdjyls9EkNZyzxuSgfh/Q==
X-Received: by 2002:a17:902:9b83:: with SMTP id
	y3mr64262179plp.165.1558242184907; 
	Sat, 18 May 2019 22:03:04 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	n15sm22065157pfb.111.2019.05.18.22.03.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 22:03:04 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190518065124.12643-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5777a0ee-2f78-8348-bbe8-f2ac9d9320b1@gmail.com>
Date: Sat, 18 May 2019 22:03:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190518065124.12643-1-bunk@stusta.de>
Subject: Re: [PATCH] systemd: Some upstreamable musl patches have been upstreamed
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
X-List-Received-Date: Sun, 19 May 2019 05:03:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

thanks for doing this work. This looks ok.

On 5/17/19 11:51 PM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   ...cy-ULONG_LONG_MAX-with-the-C99-ULLON.patch | 50 +++++++++++++++++++
>   ...udev-event.c-must-include-sys-wait.h.patch | 35 +++++++++++++
>   ...G_LONG_MAX-definition-in-case-of-mus.patch | 27 ----------
>   ...-sys-wait.h-to-avoid-compile-failure.patch | 33 ------------
>   .../0023-socket-util.h-include-string.h.patch | 20 ++++----
>   ...s-utilh-add-missing-sys-stat-include.patch | 16 +++---
>   meta/recipes-core/systemd/systemd_242.bb      |  4 +-
>   7 files changed, 105 insertions(+), 80 deletions(-)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch b/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
> new file mode 100644
> index 0000000000..6f192a2ad2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
> @@ -0,0 +1,50 @@
> +From f491dfdc88ddbba36a24a75b2063aff027461b83 Mon Sep 17 00:00:00 2001
> +From: Adrian Bunk <bunk@stusta.de>
> +Date: Thu, 16 May 2019 22:20:07 +0300
> +Subject: Replace the legacy ULONG_LONG_MAX with the C99 ULLONG_MAX
> +
> +Upstream-Status: Backport
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +---
> + src/journal-remote/journal-remote-main.c | 4 ++--
> + src/shutdown/shutdown.c                  | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
> +index 2321a91e7b..d32c51c3ce 100644
> +--- a/src/journal-remote/journal-remote-main.c
> ++++ b/src/journal-remote/journal-remote-main.c
> +@@ -528,7 +528,7 @@ static int dispatch_http_event(sd_event_source *event,
> +                                void *userdata) {
> +         MHDDaemonWrapper *d = userdata;
> +         int r;
> +-        MHD_UNSIGNED_LONG_LONG timeout = ULONG_LONG_MAX;
> ++        MHD_UNSIGNED_LONG_LONG timeout = ULLONG_MAX;
> +
> +         assert(d);
> +
> +@@ -538,7 +538,7 @@ static int dispatch_http_event(sd_event_source *event,
> +                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
> +                                        "MHD_run failed!");
> +         if (MHD_get_timeout(d->daemon, &timeout) == MHD_NO)
> +-                timeout = ULONG_LONG_MAX;
> ++                timeout = ULLONG_MAX;
> +
> +         r = sd_event_source_set_time(d->timer_event, timeout);
> +         if (r < 0) {
> +diff --git a/src/shutdown/shutdown.c b/src/shutdown/shutdown.c
> +index 35b2c2aa46..9623fe9ea2 100644
> +--- a/src/shutdown/shutdown.c
> ++++ b/src/shutdown/shutdown.c
> +@@ -212,7 +212,7 @@ static int sync_making_progress(unsigned long long *prev_dirty) {
> + }
> +
> + static void sync_with_progress(void) {
> +-        unsigned long long dirty = ULONG_LONG_MAX;
> ++        unsigned long long dirty = ULLONG_MAX;
> +         unsigned checks;
> +         pid_t pid;
> +         int r;
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
> new file mode 100644
> index 0000000000..565deba1d0
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
> @@ -0,0 +1,35 @@
> +From 010f917cf222d2c7205584056fe0e4c581a2e1b1 Mon Sep 17 00:00:00 2001
> +From: Adrian Bunk <bunk@stusta.de>
> +Date: Thu, 16 May 2019 22:09:46 +0300
> +Subject: src/udev/udev-event.c must #include <sys/wait.h>
> +
> +Fixes the following build failure with musl:
> +../git/src/udev/udev-event.c: In function 'spawn_wait':
> +../git/src/udev/udev-event.c:600:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
> +         r = sd_event_add_child(e, NULL, spawn->pid, WEXITED, on_spawn_sigchld, spawn);
> +                                                     ^~~~~~~
> +
> +This looks like a bug in udev-event.c that could also have broken
> +the compilation after some future glibc header reshuffle.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +---
> + src/udev/udev-event.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
> +index cab1b5ac0c..a0a7ac0f9e 100644
> +--- a/src/udev/udev-event.c
> ++++ b/src/udev/udev-event.c
> +@@ -7,6 +7,7 @@
> + #include <stddef.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <sys/wait.h>
> + #include <unistd.h>
> +
> + #include "sd-event.h"
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
> deleted file mode 100644
> index dbaae4f398..0000000000
> --- a/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From aa6cd19ae428769a38fe7d95f98db0a9c19ae90a Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 25 Feb 2019 15:14:49 +0800
> -Subject: [PATCH 12/24] fix missing ULONG_LONG_MAX definition in case of musl
> -
> -Upstream-Status: Inappropriate [musl]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/basic/missing_type.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
> -index 23602eb..7d7c1e4 100644
> ---- a/src/basic/missing_type.h
> -+++ b/src/basic/missing_type.h
> -@@ -39,3 +39,7 @@ typedef int (*__compar_fn_t)(const void *, const void *);
> - #ifndef FTW_SKIP_SIBLINGS
> - #define FTW_SKIP_SIBLINGS 3
> - #endif
> -+
> -+#ifndef ULONG_LONG_MAX
> -+#define ULONG_LONG_MAX ULLONG_MAX
> -+#endif
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch b/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
> deleted file mode 100644
> index 47212bc3c1..0000000000
> --- a/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 6c5364736f5afd1106ac240f03806af53979cc60 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Mon, 25 Feb 2019 15:56:50 +0800
> -Subject: [PATCH 22/24] include sys/wait.h to avoid compile failure
> -
> -Fix the following error:
> -src/udev/udev-event.c:581:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
> -
> -Upstream-Status: Inappropriate [musl specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/udev/udev-event.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
> -index 07b7365..e532bb7 100644
> ---- a/src/udev/udev-event.c
> -+++ b/src/udev/udev-event.c
> -@@ -8,7 +8,9 @@
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> --
> -+#ifndef __GLIBC__
> -+#include <sys/wait.h>
> -+#endif
> - #include "sd-event.h"
> -
> - #include "alloc-util.h"
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
> index 22186b8a7e..37987b57f6 100644
> --- a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
> +++ b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
> @@ -1,12 +1,12 @@
> -From 93e6b81b721d9eb966a257bfdf7df6e8280b885c Mon Sep 17 00:00:00 2001
> +From 56fb30d93e96d7f983af0cb4dff9155da91dd671 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 16:37:19 +0800
> -Subject: [PATCH 23/24] socket-util.h: include string.h
> +Subject: socket-util.h: include string.h
>   
>   Fix the following compile error:
>   src/basic/socket-util.h:187:30: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
>   
> -Upstream-Status: Pending
> +Upstream-Status: Accepted
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   ---
> @@ -14,17 +14,17 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/basic/socket-util.h b/src/basic/socket-util.h
> -index 574d2b7..097aa4d 100644
> +index 6920fd99ba..36ec422f2c 100644
>   --- a/src/basic/socket-util.h
>   +++ b/src/basic/socket-util.h
> -@@ -12,6 +12,7 @@
> +@@ -9,6 +9,7 @@
> + #include <netinet/in.h>
> + #include <stdbool.h>
> + #include <stddef.h>
> ++#include <string.h>
>    #include <sys/socket.h>
>    #include <sys/types.h>
>    #include <sys/un.h>
> -+#include <string.h>
> -
> - #include "macro.h"
> - #include "missing_socket.h"
>   --
> -2.7.4
> +2.20.1
>   
> diff --git a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
> index bae9d3eaad..ada404b053 100644
> --- a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
> +++ b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
> @@ -1,30 +1,30 @@
> -From 2560a6b7b9adc5bd5dec0f87c2e3025ced8a2af2 Mon Sep 17 00:00:00 2001
> +From 56e3c9581e2c9b7435d5fcbd74b47c7ccf6b3891 Mon Sep 17 00:00:00 2001
>   From: Andrej Valek <andrej.valek@siemens.com>
>   Date: Thu, 18 Apr 2019 10:47:11 +0200
> -Subject: [PATCH] fs-utilh: add missing sys/stat include
> +Subject: fs-util.h: add missing sys/stat include
>   
>   fix error:
>   | error: passing argument 5 of 'chase_symlinks_and_stat' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   
>   Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>   
> -Upstream-Status: Pending
> +Upstream-Status: Accepted
>   ---
>    src/basic/fs-util.h | 1 +
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> -index b965120..e2fdfff 100644
> +index b9651205e6..c153bc4448 100644
>   --- a/src/basic/fs-util.h
>   +++ b/src/basic/fs-util.h
> -@@ -8,6 +8,7 @@
> +@@ -7,6 +7,7 @@
> + #include <stdbool.h>
>    #include <stdint.h>
>    #include <sys/inotify.h>
> - #include <sys/types.h>
>   +#include <sys/stat.h>
> + #include <sys/types.h>
>    #include <unistd.h>
>    
> - #include "errno-util.h"
>   --
> -2.11.0
> +2.20.1
>   
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 20714fc70a..2dda0d0b95 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -38,7 +38,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>                  file://0008-add-missing-FTW_-macros-for-musl.patch \
>                  file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
>                  file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
> -               file://0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
> +               file://0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch \
>                  file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
>                  file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
>                  file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> @@ -47,7 +47,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>                  file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
>                  file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
>                  file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
> -               file://0022-include-sys-wait.h-to-avoid-compile-failure.patch \
> +               file://0001-src-udev-udev-event.c-must-include-sys-wait.h.patch \
>                  file://0023-socket-util.h-include-string.h.patch \
>                  file://0024-test-json.c-define-M_PIl.patch \
>                  file://0025-fs-utilh-add-missing-sys-stat-include.patch \
> 

