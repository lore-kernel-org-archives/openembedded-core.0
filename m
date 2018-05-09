Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9FBD74F41
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:59:30 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id y72-v6so37937972lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=0e3qy0FJrnFDkubuQrnjfKRs9oIhEKHfignX1C+jbfM=;
	b=TX6BmxYoha7SuZWFDcQa77LifaacA5vRfGr5pAgGGf+5TGa+LTSpIh83hH0qQNOcZq
	YP9CGQQA4j0Z67mPk0s0E3ByjERm5zRRtR/cqik+q1uJU1qF0nbXENd9iVQ+flw6juSA
	JUVKu83Lrloyz+r+0SsraWW098TUUrJnYq9hRqftmrmbSszxYFUUgCfXiEhcEya2grNE
	wQNToaUQxTn7JS6Rr2B7kxZfgwnIpTNNhOePU1b6xm6+ci4iHvzGsB0+QP7tQfX3Wzhx
	ozXZDHpR8t83iNUmX3rO+uoaz392qjv98/ypyf4LaVFcOO4E/KKmFMY0y9ID4OPIyW1+
	X/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=0e3qy0FJrnFDkubuQrnjfKRs9oIhEKHfignX1C+jbfM=;
	b=I6rQ/Cqx/rVnrJsbyB4LWwuNN3R/n3Cxtom7W5XUUZUgmN9VrM2WDYYthHKrwnlSZY
	AyBYG2ruTA9u+eLEb+PgwOlNbxn7tG1m3MQiFJaD2Ua4V12VKQyPSE74ReFefU836SEh
	pRoxhJt7DMPOGuXBwgOiNPyJ/l/hrKUe6ffEjSDIl8oy1JfeUBuwQ5cJ59YLSN4hFOqN
	/WtciyLZCl/9NbJ7QF8wPv/DAwTOiYpq720sijtH/iJMgMEQeNOBTOVKPsSPdwPU+Hgf
	QGoFDnQGHtAtSoDdtV/YwZeuy5opmMa0SFSd/5+8w/2mJgLqptu4qfr5c618tTVJv5gE
	5/zA==
X-Gm-Message-State: ALKqPwfIkvoD9gd2T/q59X5je90K8oJBC4CdSXd/UAreaM4a6Vpy245q
	A8EhExduDrPZAURjsc3LDPhg44OOZIaWiR3C8o2aHA==
X-Google-Smtp-Source: AB8JxZqn6EwAc9XEfRPZeBe4FAYPHyvBhcZTu/z4TXQXmhZw9GRX0VcTaq8bFgE+1Xt0oWjH+6Z4VxZt8SRn231IVFI=
X-Received: by 2002:a2e:650a:: with SMTP id
	z10-v6mr12647981ljb.41.1525881570685; 
	Wed, 09 May 2018 08:59:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP;
	Wed, 9 May 2018 08:59:30 -0700 (PDT)
In-Reply-To: <20180509154920.5987-2-danismostlikely@gmail.com>
References: <20180509154920.5987-1-danismostlikely@gmail.com>
	<20180509154920.5987-2-danismostlikely@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 9 May 2018 09:59:30 -0600
Message-ID: <CACS+7ZSvNYxKYRbfph7SVuEd1084Zm0vtS62ANAKoqqoF7rYKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: backport fix for newer gpg-error.
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
X-List-Received-Date: Wed, 09 May 2018 15:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 9 May 2018 at 09:49, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Fix a #define conflict with new libgpg-error when gcrypt PACKAGECONFIG
> option is enabled.

Looks like this is a duplicate.

>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  ...rename-noreturn-into-_noreturn_-8456.patch | 200 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_237.bb      |   1 +
>  2 files changed, 201 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-macros-r=
ename-noreturn-into-_noreturn_-8456.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-basic-macros-rename-n=
oreturn-into-_noreturn_-8456.patch b/meta/recipes-core/systemd/systemd/0001=
-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
> new file mode 100644
> index 00000000000..5e1d6383fc5
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-basic-macros-rename-noreturn=
-into-_noreturn_-8456.patch
> @@ -0,0 +1,200 @@
> +Upstream-Status: Backport
> +
> +From da2c92fd08f6ffb432de16128ff5670c91005e8f Mon Sep 17 00:00:00 2001
> +From: Franck Bui <fbui@suse.com>
> +Date: Thu, 15 Mar 2018 06:23:46 +0100
> +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)
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
> +diff --git a/src/basic/log.c b/src/basic/log.c
> +index 12ee65a5c..837c7631d 100644
> +--- a/src/basic/log.c
> ++++ b/src/basic/log.c
> +@@ -808,7 +808,7 @@ static void log_assert(
> +         log_dispatch_internal(level, 0, file, line, func, NULL, NULL, N=
ULL, NULL, buffer);
> + }
> +
> +-noreturn void log_assert_failed_realm(
> ++_noreturn_ void log_assert_failed_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +@@ -820,7 +820,7 @@ noreturn void log_assert_failed_realm(
> +         abort();
> + }
> +
> +-noreturn void log_assert_failed_unreachable_realm(
> ++_noreturn_ void log_assert_failed_unreachable_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +diff --git a/src/basic/log.h b/src/basic/log.h
> +index 5b5a25bd6..c057794c1 100644
> +--- a/src/basic/log.h
> ++++ b/src/basic/log.h
> +@@ -199,7 +199,7 @@ int log_dump_internal(
> +                 char *buffer);
> +
> + /* Logging for various assertions */
> +-noreturn void log_assert_failed_realm(
> ++_noreturn_ void log_assert_failed_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +@@ -208,7 +208,7 @@ noreturn void log_assert_failed_realm(
> + #define log_assert_failed(text, ...) \
> +         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
> +
> +-noreturn void log_assert_failed_unreachable_realm(
> ++_noreturn_ void log_assert_failed_unreachable_realm(
> +                 LogRealm realm,
> +                 const char *text,
> +                 const char *file,
> +diff --git a/src/basic/macro.h b/src/basic/macro.h
> +index 89bdd852a..3a6fc6f58 100644
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
> +index dc7c9ef9e..f84debdd5 100644
> +--- a/src/basic/process-util.c
> ++++ b/src/basic/process-util.c
> +@@ -940,7 +940,7 @@ bool is_main_thread(void) {
> +         return cached > 0;
> + }
> +
> +-noreturn void freeze(void) {
> ++_noreturn_ void freeze(void) {
> +
> +         log_close();
> +
> +diff --git a/src/basic/process-util.h b/src/basic/process-util.h
> +index 9fabe4a5b..1a3f3ca11 100644
> +--- a/src/basic/process-util.h
> ++++ b/src/basic/process-util.h
> +@@ -90,7 +90,7 @@ int pid_from_same_root_fs(pid_t pid);
> +
> + bool is_main_thread(void);
> +
> +-noreturn void freeze(void);
> ++_noreturn_ void freeze(void);
> +
> + bool oom_score_adjust_is_valid(int oa);
> +
> +diff --git a/src/core/main.c b/src/core/main.c
> +index 56200a8fa..484b53d5f 100644
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
> +index 3e278bd63..c0761a374 100644
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
> +2.18.0-dev
> +
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core=
/systemd/systemd_237.bb
> index 150f5b2e180..744d622ab86 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -50,6 +50,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://0030-fix-missing-of-__register_atfork-for-non-glibc-bu=
ild.patch \
>             file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-=
mus.patch \
>             file://0032-memfd.patch \
> +           file://0001-basic-macros-rename-noreturn-into-_noreturn_-8456=
.patch \
>             "
>  SRC_URI_append_qemuall =3D " file://0001-core-device.c-Change-the-defaul=
t-device-timeout-to-2.patch"
>
> --
> 2.18.0-dev
>

