Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBD2747FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:02:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id i2so23214116uah.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/jU0woKmqT8XgDxXVbaOtzaP9DhZuVDpx8Azuvjj5eE=;
	b=Q8XBoIhoMyr1TQTPY0BalWTlVF5iNp/Me4dzXpAK1NBsXetQwRFkZzMxoFRRzJv1pr
	I7qi/k0ju1WO5rH4GCP2W65kt+ksEemlJUoenKv78tFfoR6RBGkXdKIQ2B7rLQXHmG49
	sMXEEgZ53z28nB5DV+BkyLzwOt8MeB5Raq4FT7g4Cm6PWF0a7M/uNF+vhmcvzt8hDq4a
	Q2R3K3ax2keUukhmixypIDBquopZ+rMkFF2uwGD6MTguSHcchG5V16HA6R0MrdHxSNyT
	EhCpz+20dT/2l/qej6yKx9eRhAEQnrUAD5LoqlvV7HwRuGsVAvbzmPwMJjiYUH8vayqP
	tARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/jU0woKmqT8XgDxXVbaOtzaP9DhZuVDpx8Azuvjj5eE=;
	b=HSvxWAY74KIdlw+UNndRQqOBCn5+hPFOhIGYwt4a96FevjdINDcLb8MmqYYAj4+qd/
	GxZ2yES70JNbbxZDUsEu6skArePcdFajuKmF0L1P9rL06k+6F/nwhsdfgiedtDV0BeLT
	MiANX+bspsHUtqHlTEPyiAbYt74O1JxQMFjN5yI0wD02A1YFnmtyxcbTAFzqFVrRN4l6
	WTTjnVeI56qSZCUmaTrXR2YZGeOa05D79FuJSKLCmtN6/rPj8Up4/HYL8WoS474yjpwk
	2kSnzUAhTnz2333jvdWYDFr6TfUVpCuGF4z7l4FPxeDatNsLvcilNxxYV9irUo2XrEcp
	rf2g==
X-Gm-Message-State: ALQs6tBBHLLRNuv+lDMx2VcpzxSJsd7OgA0Kbf3UwgRjZrMrkDte/NIR
	RG4c3pp+l6ZYQTxatyFQ3CdjWJWelKihoeD9F0vGYw==
X-Google-Smtp-Source: AB8JxZp4CzeimEOlFevFA5aYj/CIZf61vUwA6n+5fjHsFHq0bwqajg7Xu37+6Ceq5vsG5UhDP/Wt2k0zfnfbb9+h2s0=
X-Received: by 10.176.10.129 with SMTP id d1mr38730361uak.39.1525878178592;
	Wed, 09 May 2018 08:02:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.44 with HTTP; Wed, 9 May 2018 08:02:37 -0700 (PDT)
In-Reply-To: <1824420.23D1t2XzuG@yow-masselst-lx1>
References: <CAC+thW1hEyOHdtCMPBW3EpZtAt=J0WwBQ1Y26tRY1mMB_M5TMA@mail.gmail.com>
	<1824420.23D1t2XzuG@yow-masselst-lx1>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 9 May 2018 17:02:37 +0200
Message-ID: <CAC+thW0mCX2C=WYLaEcoBLG-2X7TDXJ3NSg-4=+JSYDpeRvPFg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
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
X-List-Received-Date: Wed, 09 May 2018 15:02:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2018 at 4:46 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Wednesday, May 9, 2018 10:36:17 AM EDT Andrea Galbusera wrote:
>> Hi Mark!
>>
>> Il mer 9 mag 2018, 15:56 Mark Asselstine <mark.asselstine@windriver.com>=
 ha
>>
>> scritto:
>> > On Wednesday, May 9, 2018 8:16:08 AM EDT Andrea Galbusera wrote:
>> > > When gcrypt support is present in PACKAGECONFIG, build fails due to =
the
>> >
>> > bug
>> >
>> > > reported in [1]. Since this is already solved upstream, this commit
>> > > backports the corresponding patch.
>> > >
>> > > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893602
>> > >
>> > > Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>> >
>> > Thanks Andrea, I can confirm this fixes a build failure we were seeing=
 as
>> > well.
>>
>> Thanks for further testing the patch so quickly!
>
> No problem. I had a build going with the same upstream patch in place whe=
n I
> saw your email.
>
>>
>> Out of curiosity... Are you also enabling gcrypt support to workaround t=
he
>> implict dependency resolved used to have upon gcrypt in the past?
>
> We have been enabling gcrypt since 2016 when building systemd. We found t=
hat
> there was upstream work which meant that gcrypt was necessary and not opt=
ional
> (as it appeared). I don't think we ever revisited this since that initial
> discovery.

Exactly same situation here! ;-) I asked in the hope I could hijack
updates on the same old and somewhat confusing topic. I took the time
to revisit my application layer to drop systemd features that now
built by default (namely networkd and resolved) when the gcrypt
not-so-optional issue come to mind...

>
>> It took
>> me a few hours to figure out what was specific in my configuration, sinc=
e
>> this bug was obviously not exposed in configurations currently built by =
the
>> autobuilders!
>
> We do nightly builds of meta-overc (https://github.com/OverC/meta-overc) =
where
> we often catch things the autobuilds miss. You most likely don't care abo=
ut
> the content of meta-overc but it might be worthwhile to keep an eye on co=
mmits
> we do there since we often stage systemd and other fixes there while they=
 are
> pending for other oe/yocto repos.

Good to know! ;-)

>
>>
>> As a side note, I know there is a newer released version of systemd (238=
),
>> but upgrading such a complex recipe was not an option for me in the shor=
t.
>> I'm CC-ing the recipe's maintainer here, in case there's already an effo=
rt
>> to upgrade to 238...
>
> Makes sense, it's the "smart thing to do". Since meta-overc does lots of =
work
> around containers we can be sensitive to systemd uprev's but are usually =
quick
> to address any issues the uprev might cause.
>
> Mark
>
>>
>> > Mark
>> >
>> > > ---
>> > >
>> > >  ...rename-noreturn-into-_noreturn_-8456.patch | 203 +++++++++++++++=
+++
>> > >  meta/recipes-core/systemd/systemd_237.bb      |   1 +
>> > >  2 files changed, 204 insertions(+)
>> > >  create mode 100644
>> > >
>> > > meta/recipes-core/systemd/systemd/0033-basic-macros-
>> >
>> > rename-noreturn-into-_n
>> >
>> > > oreturn_-8456.patch
>> > >
>> > > diff --git
>> > > a/meta/recipes-core/systemd/systemd/0033-basic-macros-
>> >
>> > rename-noreturn-into-
>> >
>> > > _noreturn_-8456.patch
>> > > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
>> >
>> > rename-noreturn-into-
>> >
>> > > _noreturn_-8456.patch new file mode 100644
>> > > index 0000000000..59647b22f8
>> > > --- /dev/null
>> > > +++
>> > > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
>> >
>> > rename-noreturn-into-
>> >
>> > > _noreturn_-8456.patch @@ -0,0 +1,203 @@
>> > > +From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2=
001
>> > > +From: Franck Bui <fbui@suse.com>
>> > > +Date: Thu, 15 Mar 2018 06:23:46 +0100
>> > > +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#84=
56)
>> > > +MIME-Version: 1.0
>> > > +Content-Type: text/plain; charset=3DUTF-8
>> > > +Content-Transfer-Encoding: 8bit
>> > > +
>> > > +"noreturn" is reserved and can be used in other header files we
>> > > include:
>> > > +
>> > > +  [   16s] In file included from /usr/include/gcrypt.h:30:0,
>> > > +  [   16s]                  from ../src/journal/journal-file.h:26,
>> > > +  [   16s]                  from ../src/journal/journal-vacuum.c:31=
:
>> > > +  [   16s] /usr/include/gpg-error.h:1544:46: error: expected =E2=80=
=98,=E2=80=99 or =E2=80=98;=E2=80=99
>> > > before =E2=80=98)=E2=80=99 token +  [   16s]  void gpgrt_log_bug (co=
nst char *fmt, ...)
>> > >
>> > > GPGRT_ATTR_NR_PRINTF(1,2); +
>> > > +Here we include grcrypt.h (which in turns include gpg-error.h) *aft=
er*
>> >
>> > we
>> >
>> > > +"noreturn" was defined in macro.h.
>> > > +---
>> > > + src/basic/log.c                         |  4 ++--
>> > > + src/basic/log.h                         |  4 ++--
>> > > + src/basic/macro.h                       | 19 +++++++++----------
>> > > + src/basic/process-util.c                |  2 +-
>> > > + src/basic/process-util.h                |  2 +-
>> > > + src/core/main.c                         |  4 ++--
>> > > + src/journal/test-journal-interleaving.c |  2 +-
>> > > + src/shared/pager.c                      |  2 +-
>> > > + src/udev/collect/collect.c              |  2 +-
>> > > + 9 files changed, 20 insertions(+), 21 deletions(-)
>> > > +
>> > > +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/=
8456
>> >
>> > ]
>> >
>> > > +
>> > > +diff --git a/src/basic/log.c b/src/basic/log.c
>> > > +index 7a7f2cbec..16a2431c5 100644
>> > > +--- a/src/basic/log.c
>> > > ++++ b/src/basic/log.c
>> > > +@@ -814,7 +814,7 @@ static void log_assert(
>> > > +         log_dispatch_internal(level, 0, file, line, func, NULL, NU=
LL,
>> > > NULL, NULL, buffer); + }
>> > > +
>> > > +-noreturn void log_assert_failed_realm(
>> > > ++_noreturn_ void log_assert_failed_realm(
>> > > +                 LogRealm realm,
>> > > +                 const char *text,
>> > > +                 const char *file,
>> > > +@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
>> > > +         abort();
>> > > + }
>> > > +
>> > > +-noreturn void log_assert_failed_unreachable_realm(
>> > > ++_noreturn_ void log_assert_failed_unreachable_realm(
>> > > +                 LogRealm realm,
>> > > +                 const char *text,
>> > > +                 const char *file,
>> > > +diff --git a/src/basic/log.h b/src/basic/log.h
>> > > +index efcf0f1bf..314be128a 100644
>> > > +--- a/src/basic/log.h
>> > > ++++ b/src/basic/log.h
>> > > +@@ -186,7 +186,7 @@ int log_dump_internal(
>> > > +                 char *buffer);
>> > > +
>> > > + /* Logging for various assertions */
>> > > +-noreturn void log_assert_failed_realm(
>> > > ++_noreturn_ void log_assert_failed_realm(
>> > > +                 LogRealm realm,
>> > > +                 const char *text,
>> > > +                 const char *file,
>> > > +@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
>> > > + #define log_assert_failed(text, ...) \
>> > > +         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
>> > > +
>> > > +-noreturn void log_assert_failed_unreachable_realm(
>> > > ++_noreturn_ void log_assert_failed_unreachable_realm(
>> > > +                 LogRealm realm,
>> > > +                 const char *text,
>> > > +                 const char *file,
>> > > +diff --git a/src/basic/macro.h b/src/basic/macro.h
>> > > +index 95be63a20..8911edfc4 100644
>> > > +--- a/src/basic/macro.h
>> > > ++++ b/src/basic/macro.h
>> > > +@@ -53,6 +53,15 @@
>> > > + #else
>> > > + #define _fallthrough_
>> > > + #endif
>> > > ++/* Define C11 noreturn without <stdnoreturn.h> and even on older g=
cc
>> > > ++ * compiler versions */
>> > > ++#ifndef _noreturn_
>> > > ++#if __STDC_VERSION__ >=3D 201112L
>> > > ++#define _noreturn_ _Noreturn
>> > > ++#else
>> > > ++#define _noreturn_ __attribute__((noreturn))
>> > > ++#endif
>> > > ++#endif
>> > > +
>> > > + /* Temporarily disable some warnings */
>> > > + #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
>> > >
>> >    \
>> > >
>> > > +@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsig=
ned
>> >
>> > long
>> >
>> > > u) { + #endif
>> > > + #endif
>> > > +
>> > > +-/* Define C11 noreturn without <stdnoreturn.h> and even on older g=
cc
>> > > +- * compiler versions */
>> > > +-#ifndef noreturn
>> > > +-#if __STDC_VERSION__ >=3D 201112L
>> > > +-#define noreturn _Noreturn
>> > > +-#else
>> > > +-#define noreturn __attribute__((noreturn))
>> > > +-#endif
>> > > +-#endif
>> > > +-
>> > > + #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
>> > > +         static inline void func##p(type *p) {                   \
>> > > +                 if (*p)                                         \
>> > > +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
>> > > +index aa9846db5..e6120af5b 100644
>> > > +--- a/src/basic/process-util.c
>> > > ++++ b/src/basic/process-util.c
>> > > +@@ -987,7 +987,7 @@ bool is_main_thread(void) {
>> > > +         return cached > 0;
>> > > + }
>> > > +
>> > > +-noreturn void freeze(void) {
>> > > ++_noreturn_ void freeze(void) {
>> > > +
>> > > +         log_close();
>> > > +
>> > > +diff --git a/src/basic/process-util.h b/src/basic/process-util.h
>> > > +index 93029e36e..5170adec7 100644
>> > > +--- a/src/basic/process-util.h
>> > > ++++ b/src/basic/process-util.h
>> > > +@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
>> > > +
>> > > + bool is_main_thread(void);
>> > > +
>> > > +-noreturn void freeze(void);
>> > > ++_noreturn_ void freeze(void);
>> > > +
>> > > + bool oom_score_adjust_is_valid(int oa);
>> > > +
>> > > +diff --git a/src/core/main.c b/src/core/main.c
>> > > +index 076846a41..4b2d14923 100644
>> > > +--- a/src/core/main.c
>> > > ++++ b/src/core/main.c
>> > > +@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT6=
4_MAX;
>> > > + static sd_id128_t arg_machine_id =3D {};
>> > > + static EmergencyAction arg_cad_burst_action =3D
>> > > EMERGENCY_ACTION_REBOOT_FORCE; +
>> > > +-noreturn static void freeze_or_reboot(void) {
>> > > ++_noreturn_ static void freeze_or_reboot(void) {
>> > > +
>> > > +         if (arg_crash_reboot) {
>> > > +                 log_notice("Rebooting in 10s...");
>> > > +@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
>> > > +         freeze();
>> > > + }
>> > > +
>> > > +-noreturn static void crash(int sig) {
>> > > ++_noreturn_ static void crash(int sig) {
>> > > +         struct sigaction sa;
>> > > +         pid_t pid;
>> > > +
>> > > +diff --git a/src/journal/test-journal-interleaving.c
>> > > b/src/journal/test-journal-interleaving.c +index 5a88b2774..d87bdbdd=
3
>> > > 100644
>> > > +--- a/src/journal/test-journal-interleaving.c
>> > > ++++ b/src/journal/test-journal-interleaving.c
>> > > +@@ -37,7 +37,7 @@
>> > > +
>> > > + static bool arg_keep =3D false;
>> > > +
>> > > +-noreturn static void log_assert_errno(const char *text, int error,
>> >
>> > const
>> >
>> > > char *file, int line, const char *func) { ++_noreturn_ static void
>> > > log_assert_errno(const char *text, int error, const char *file, int
>> > > line,
>> > > const char *func) { +         log_internal(LOG_CRIT, error, file, li=
ne,
>> > > func,
>> > > +                      "'%s' failed at %s:%u (%s): %m", text, file,
>> > > line,
>> > > func); +         abort();
>> > > +diff --git a/src/shared/pager.c b/src/shared/pager.c
>> > > +index 75db3c985..681af9c40 100644
>> > > +--- a/src/shared/pager.c
>> > > ++++ b/src/shared/pager.c
>> > > +@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;
>> > > + static bool stdout_redirected =3D false;
>> > > + static bool stderr_redirected =3D false;
>> > > +
>> > > +-noreturn static void pager_fallback(void) {
>> > > ++_noreturn_ static void pager_fallback(void) {
>> > > +         int r;
>> > > +
>> > > +         r =3D copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -=
1, 0);
>> > > +diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.=
c
>> > > +index 2821640e9..c8fa47b3d 100644
>> > > +--- a/src/udev/collect/collect.c
>> > > ++++ b/src/udev/collect/collect.c
>> > > +@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct
>> > > udev_list_node *node) +         return container_of(node, struct _ma=
te,
>> > > node);
>> > > + }
>> > > +
>> > > +-noreturn static void sig_alrm(int signo)
>> > > ++_noreturn_ static void sig_alrm(int signo)
>> > > + {
>> > > +         exit(4);
>> > > + }
>> > > +--
>> > > +2.17.0
>> > > +
>> > > diff --git a/meta/recipes-core/systemd/systemd_237.bb
>> > > b/meta/recipes-core/systemd/systemd_237.bb index 1d04796f39..6f59e60=
64e
>> > > 100644
>> > > --- a/meta/recipes-core/systemd/systemd_237.bb
>> > > +++ b/meta/recipes-core/systemd/systemd_237.bb
>> > > @@ -50,6 +50,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>> > >
>> > > file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.pat=
ch \
>> > > file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.pat=
ch \
>> > > file://0032-memfd.patch \
>> > > +
>> > > file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch =
\ "
>> > >
>> > >  SRC_URI_append_qemuall =3D "
>> > >
>> > > file://0001-core-device.c-Change-the-default-device-timeout-to-2.pat=
ch"
>
>
>
>

