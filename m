Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 53C3D74F98
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:19:19 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id r2-v6so15655748lff.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ykb+L0g8reH8LK2t27VVVR6aq0Jkqgeyeogmva9ygjk=;
	b=B6BaickrzGt5Q9rfMn3TgXlcuzs3ZjWMm9U7eH30ISxhVahLKZoKlnlh3yYctKDHBX
	Q4dL8PZXpKfZRITZARr/F7KcjY5DtnQm7sFDhuc8bGTKz8lSLKRrHMX2Ih1JZXfHqsB9
	E5vQUHiXA2BJ1ouK+YFEe2Zgn8N6Fij3+zUxmyD/GbJbhzNqmxUumT29TvyrDTxlGkkB
	T0+Fq5e/YtKJrfniYUL8W14LwhmaKyUaoFdEMYRX2SbfZ+33LTm5e9+4pNF3FC6hnTRj
	uDzYjPJW+3W3Xz7r+rTn69JGYQDOcRXL7xZ1aRdtMUavLXtJOaaIIph21UyRMrf3fPOt
	ubGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ykb+L0g8reH8LK2t27VVVR6aq0Jkqgeyeogmva9ygjk=;
	b=Dn8tngfGWvW5LsGuyrAGfqTWPF35d2V2qtBT+mvgktEZSqrpzBUuJvp7c3DTnZPhLE
	4o5KpgpfYlnqrn596tonLQl9y8g4D/UN0o3fYRe3fAPbtG6ECTJzxBvN/JqwcnA43Tn+
	n4+CLIo4/5AeB+bF0a7vs1tj+I4K4W/8MPDvqWW3NHwRlYO23hatUAkBI5jKNOJzeAf6
	bgJFVX+jPtLwEKZhtBxCnSqpS5Kpl08p8jPk3UpfTIADRKKbG98cPdhrsVJ1PxG4COVa
	x6hlM5X8MHEo6Kmju+/EFoIj6/zlHgawTl5+205eZ5BVZnLDO79lLJthxojSEL5dLaOW
	pMqw==
X-Gm-Message-State: ALQs6tC2LRQvu2t8nMrV0FRDqIgmInWrn5Etdh3wc2roL+dgS10MO9E7
	NBrkpQfpqfFBBcojjbTHiDBt6c2KdJ0TnUM8XoAOVA==
X-Google-Smtp-Source: AB8JxZq9h+6xW43i50IbcM39wyU+/6b9OYtPyJmqVAoyr+cHJkhlhV8YFb4aT5Fvo0DGcTGnVfMoHfNWnq0xuH1pYmU=
X-Received: by 2002:a19:d514:: with SMTP id
	m20-v6mr27913492lfg.5.1525881521984; 
	Wed, 09 May 2018 08:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP;
	Wed, 9 May 2018 08:58:41 -0700 (PDT)
In-Reply-To: <20180509121608.26333-1-gizero@gmail.com>
References: <20180509121608.26333-1-gizero@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 9 May 2018 09:58:41 -0600
Message-ID: <CACS+7ZSWAko8+fu62jjtWNjEi_EupQG9faGG6dNfCsXEf63AZw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: backport patch to fix build when gcrypt is enabled
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
X-List-Received-Date: Wed, 09 May 2018 16:19:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 9 May 2018 at 06:16, Andrea Galbusera <gizero@gmail.com> wrote:
> When gcrypt support is present in PACKAGECONFIG, build fails due to the b=
ug
> reported in [1]. Since this is already solved upstream, this commit backp=
orts
> the corresponding patch.
>
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893602

I should have checked the mailing list. I *just* sent a similar patch.

Note to self, don't sit on changes for a week :)

>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  ...rename-noreturn-into-_noreturn_-8456.patch | 203 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_237.bb      |   1 +
>  2 files changed, 204 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0033-basic-macros-r=
ename-noreturn-into-_noreturn_-8456.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-n=
oreturn-into-_noreturn_-8456.patch b/meta/recipes-core/systemd/systemd/0033=
-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
> new file mode 100644
> index 0000000000..59647b22f8
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn=
-into-_noreturn_-8456.patch
> @@ -0,0 +1,203 @@
> +From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2001
> +From: Franck Bui <fbui@suse.com>
> +Date: Thu, 15 Mar 2018 06:23:46 +0100
> +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +"noreturn" is reserved and can be used in other header files we include:
> +
> +  [   16s] In file included from /usr/include/gcrypt.h:30:0,
> +  [   16s]                  from ../src/journal/journal-file.h:26,
> +  [   16s]                  from ../src/journal/journal-vacuum.c:31:
> +  [   16s] /usr/include/gpg-error.h:1544:46: error: expected =E2=80=98,=
=E2=80=99 or =E2=80=98;=E2=80=99 before =E2=80=98)=E2=80=99 token
> +  [   16s]  void gpgrt_log_bug (const char *fmt, ...)    GPGRT_ATTR_NR_P=
RINTF(1,2);
> +
> +Here we include grcrypt.h (which in turns include gpg-error.h) *after* w=
e
> +"noreturn" was defined in macro.h.
> +---
> + src/basic/log.c                         |  4 ++--
> + src/basic/log.h                         |  4 ++--
> + src/basic/macro.h                       | 19 +++++++++----------
> + src/basic/process-util.c                |  2 +-
> + src/basic/process-util.h                |  2 +-
> + src/core/main.c                         |  4 ++--
> + src/journal/test-journal-interleaving.c |  2 +-
> + src/shared/pager.c                      |  2 +-
> + src/udev/collect/collect.c              |  2 +-
> + 9 files changed, 20 insertions(+), 21 deletions(-)
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/8456]
> +
> +diff --git a/src/basic/log.c b/src/basic/log.c
> +index 7a7f2cbec..16a2431c5 100644
> +--- a/src/basic/log.c
> ++++ b/src/basic/log.c
> +@@ -814,7 +814,7 @@ static void log_assert(
> +         log_dispatch_internal(level, 0, file, line, func, NULL, NULL, N=
ULL, NULL, buffer);
> + }
> +
> +-noreturn void log_assert_failed_realm(
> ++_noreturn_ void log_assert_failed_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
> +         abort();
> + }
> +
> +-noreturn void log_assert_failed_unreachable_realm(
> ++_noreturn_ void log_assert_failed_unreachable_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +diff --git a/src/basic/log.h b/src/basic/log.h
> +index efcf0f1bf..314be128a 100644
> +--- a/src/basic/log.h
> ++++ b/src/basic/log.h
> +@@ -186,7 +186,7 @@ int log_dump_internal(
> +                 char *buffer);
> +
> + /* Logging for various assertions */
> +-noreturn void log_assert_failed_realm(
> ++_noreturn_ void log_assert_failed_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
> + #define log_assert_failed(text, ...) \
> +         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
> +
> +-noreturn void log_assert_failed_unreachable_realm(
> ++_noreturn_ void log_assert_failed_unreachable_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +diff --git a/src/basic/macro.h b/src/basic/macro.h
> +index 95be63a20..8911edfc4 100644
> +--- a/src/basic/macro.h
> ++++ b/src/basic/macro.h
> +@@ -53,6 +53,15 @@
> + #else
> + #define _fallthrough_
> + #endif
> ++/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> ++ * compiler versions */
> ++#ifndef _noreturn_
> ++#if __STDC_VERSION__ >=3D 201112L
> ++#define _noreturn_ _Noreturn
> ++#else
> ++#define _noreturn_ __attribute__((noreturn))
> ++#endif
> ++#endif
> +
> + /* Temporarily disable some warnings */
> + #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                    =
 \
> +@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigned l=
ong u) {
> + #endif
> + #endif
> +
> +-/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> +- * compiler versions */
> +-#ifndef noreturn
> +-#if __STDC_VERSION__ >=3D 201112L
> +-#define noreturn _Noreturn
> +-#else
> +-#define noreturn __attribute__((noreturn))
> +-#endif
> +-#endif
> +-
> + #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
> +         static inline void func##p(type *p) {                   \
> +                 if (*p)                                         \
> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> +index aa9846db5..e6120af5b 100644
> +--- a/src/basic/process-util.c
> ++++ b/src/basic/process-util.c
> +@@ -987,7 +987,7 @@ bool is_main_thread(void) {
> +         return cached > 0;
> + }
> +
> +-noreturn void freeze(void) {
> ++_noreturn_ void freeze(void) {
> +
> +         log_close();
> +
> +diff --git a/src/basic/process-util.h b/src/basic/process-util.h
> +index 93029e36e..5170adec7 100644
> +--- a/src/basic/process-util.h
> ++++ b/src/basic/process-util.h
> +@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
> +
> + bool is_main_thread(void);
> +
> +-noreturn void freeze(void);
> ++_noreturn_ void freeze(void);
> +
> + bool oom_score_adjust_is_valid(int oa);
> +
> +diff --git a/src/core/main.c b/src/core/main.c
> +index 076846a41..4b2d14923 100644
> +--- a/src/core/main.c
> ++++ b/src/core/main.c
> +@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT64_MAX=
;
> + static sd_id128_t arg_machine_id =3D {};
> + static EmergencyAction arg_cad_burst_action =3D EMERGENCY_ACTION_REBOOT=
_FORCE;
> +
> +-noreturn static void freeze_or_reboot(void) {
> ++_noreturn_ static void freeze_or_reboot(void) {
> +
> +         if (arg_crash_reboot) {
> +                 log_notice("Rebooting in 10s...");
> +@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
> +         freeze();
> + }
> +
> +-noreturn static void crash(int sig) {
> ++_noreturn_ static void crash(int sig) {
> +         struct sigaction sa;
> +         pid_t pid;
> +
> +diff --git a/src/journal/test-journal-interleaving.c b/src/journal/test-=
journal-interleaving.c
> +index 5a88b2774..d87bdbdd3 100644
> +--- a/src/journal/test-journal-interleaving.c
> ++++ b/src/journal/test-journal-interleaving.c
> +@@ -37,7 +37,7 @@
> +
> + static bool arg_keep =3D false;
> +
> +-noreturn static void log_assert_errno(const char *text, int error, cons=
t char *file, int line, const char *func) {
> ++_noreturn_ static void log_assert_errno(const char *text, int error, co=
nst char *file, int line, const char *func) {
> +         log_internal(LOG_CRIT, error, file, line, func,
> +                      "'%s' failed at %s:%u (%s): %m", text, file, line,=
 func);
> +         abort();
> +diff --git a/src/shared/pager.c b/src/shared/pager.c
> +index 75db3c985..681af9c40 100644
> +--- a/src/shared/pager.c
> ++++ b/src/shared/pager.c
> +@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;
> + static bool stdout_redirected =3D false;
> + static bool stderr_redirected =3D false;
> +
> +-noreturn static void pager_fallback(void) {
> ++_noreturn_ static void pager_fallback(void) {
> +         int r;
> +
> +         r =3D copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1, 0)=
;
> +diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
> +index 2821640e9..c8fa47b3d 100644
> +--- a/src/udev/collect/collect.c
> ++++ b/src/udev/collect/collect.c
> +@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct udev_l=
ist_node *node)
> +         return container_of(node, struct _mate, node);
> + }
> +
> +-noreturn static void sig_alrm(int signo)
> ++_noreturn_ static void sig_alrm(int signo)
> + {
> +         exit(4);
> + }
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core=
/systemd/systemd_237.bb
> index 1d04796f39..6f59e6064e 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -50,6 +50,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://0030-fix-missing-of-__register_atfork-for-non-glibc-bu=
ild.patch \
>             file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-=
mus.patch \
>             file://0032-memfd.patch \
> +           file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456=
.patch \
>             "
>  SRC_URI_append_qemuall =3D " file://0001-core-device.c-Change-the-defaul=
t-device-timeout-to-2.patch"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

