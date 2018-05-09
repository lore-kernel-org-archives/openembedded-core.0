Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2A68174D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 14:36:36 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id j7-v6so21825785vkc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=sXANgmwx0oQMbtvlZ/3SsEz5bq6rPBA7KS9G5FdycVc=;
	b=WVkyaKVqZyD2Hw30ZRyQO4Vz+9VMpBRZu69yLs8hsbDTqkUNlbmjaE3n+sqwLq+ilT
	8oGP0/xjvFR47VbOurXvgq+LQUuvUq7vg1EIfJqQXYxmkkzziq4CC4cKgLWW1J+5bwkd
	5Xo8ywxBm4EXoGMfUq2qbyDO9zEP7YcZ7t5doivH+Efivtps/r1esgmfKfX/ggJNiLwn
	ARIzmMbEKMMGdK9ZO2rnKC49Y5Ggb4VeUie1Z2L8cJxGS8W6Hac2aCxd187tyX0ZtDGj
	Uw9SCIkrAWWM2MOMZgnIeBv86WwRwepjc8LT3BE3tm1eoTlnDNQ6qK+sTvdK+m8/0nCF
	qcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=sXANgmwx0oQMbtvlZ/3SsEz5bq6rPBA7KS9G5FdycVc=;
	b=dB19bVDlFS1T7i0z+0nHvCBOvjyjaBi23eeasYBjmQCNSgrhmM/T4nqWYG+mEOcDNE
	+xcoeWS0OSfNsgYAaf11V40L73hX12+Ne13uNgAc2Ev7IVvpQuGyFiOl70X30gMpbco0
	dWjztNKhWH4KaZ/HPab/10CW/dkDJITm+TBgy+LthxRE1bkYdzriRw0U7OzGAw47j98P
	/It9laEsYbulAXTdrnaNtusSWomWRccBs9hD2/GTpef0KW2FKi9cu5C+26hPcUXEBp7p
	binkBxieXEW03SJJKLpJMpH2fK3vYmv0qp10sruFC6lwqMryJQpQ765z6OiEjPOzwowh
	xCIw==
X-Gm-Message-State: ALQs6tBo2h4wPS/ArrqDTf0VUu2l0bYV5btHc5S5ZMh6ZQr3vkAVUE76
	NDXvkeadKqoGhUZwiAeh1hzqfV1syjUGXKI+vDo=
X-Google-Smtp-Source: AB8JxZpjrtRRM89oTV0FbREToxe/t81RCwDdhZ1b0PpNy1XN7A9TYbspb865S4HnqFG0d8GVYQz/1hp+6qCLgUVPVDs=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr37119167vke.5.1525876597511; 
	Wed, 09 May 2018 07:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.44 with HTTP; Wed, 9 May 2018 07:36:17 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 9 May 2018 16:36:17 +0200
Message-ID: <CAC+thW1hEyOHdtCMPBW3EpZtAt=J0WwBQ1Y26tRY1mMB_M5TMA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 May 2018 14:36:37 -0000
Content-Type: multipart/alternative; boundary="00000000000090da53056bc6d4f4"

--00000000000090da53056bc6d4f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark!

Il mer 9 mag 2018, 15:56 Mark Asselstine <mark.asselstine@windriver.com> ha
scritto:

> On Wednesday, May 9, 2018 8:16:08 AM EDT Andrea Galbusera wrote:
> > When gcrypt support is present in PACKAGECONFIG, build fails due to the
> bug
> > reported in [1]. Since this is already solved upstream, this commit
> > backports the corresponding patch.
> >
> > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893602
> >
> > Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>
> Thanks Andrea, I can confirm this fixes a build failure we were seeing as
> well.
>

Thanks for further testing the patch so quickly!

Out of curiosity... Are you also enabling gcrypt support to workaround the
implict dependency resolved used to have upon gcrypt in the past? It took
me a few hours to figure out what was specific in my configuration, since
this bug was obviously not exposed in configurations currently built by the
autobuilders!

As a side note, I know there is a newer released version of systemd (238),
but upgrading such a complex recipe was not an option for me in the short.
I'm CC-ing the recipe's maintainer here, in case there's already an effort
to upgrade to 238...


> Mark
>
> > ---
> >  ...rename-noreturn-into-_noreturn_-8456.patch | 203 ++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_237.bb      |   1 +
> >  2 files changed, 204 insertions(+)
> >  create mode 100644
> > meta/recipes-core/systemd/systemd/0033-basic-macros-
> rename-noreturn-into-_n
> > oreturn_-8456.patch
> >
> > diff --git
> > a/meta/recipes-core/systemd/systemd/0033-basic-macros-
> rename-noreturn-into-
> > _noreturn_-8456.patch
> > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
> rename-noreturn-into-
> > _noreturn_-8456.patch new file mode 100644
> > index 0000000000..59647b22f8
> > --- /dev/null
> > +++
> > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
> rename-noreturn-into-
> > _noreturn_-8456.patch @@ -0,0 +1,203 @@
> > +From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2001
> > +From: Franck Bui <fbui@suse.com>
> > +Date: Thu, 15 Mar 2018 06:23:46 +0100
> > +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +"noreturn" is reserved and can be used in other header files we includ=
e:
> > +
> > +  [   16s] In file included from /usr/include/gcrypt.h:30:0,
> > +  [   16s]                  from ../src/journal/journal-file.h:26,
> > +  [   16s]                  from ../src/journal/journal-vacuum.c:31:
> > +  [   16s] /usr/include/gpg-error.h:1544:46: error: expected =E2=80=98=
,=E2=80=99 or =E2=80=98;=E2=80=99
> > before =E2=80=98)=E2=80=99 token +  [   16s]  void gpgrt_log_bug (const=
 char *fmt, ...)
>
> > GPGRT_ATTR_NR_PRINTF(1,2); +
> > +Here we include grcrypt.h (which in turns include gpg-error.h) *after*
> we
> > +"noreturn" was defined in macro.h.
> > +---
> > + src/basic/log.c                         |  4 ++--
> > + src/basic/log.h                         |  4 ++--
> > + src/basic/macro.h                       | 19 +++++++++----------
> > + src/basic/process-util.c                |  2 +-
> > + src/basic/process-util.h                |  2 +-
> > + src/core/main.c                         |  4 ++--
> > + src/journal/test-journal-interleaving.c |  2 +-
> > + src/shared/pager.c                      |  2 +-
> > + src/udev/collect/collect.c              |  2 +-
> > + 9 files changed, 20 insertions(+), 21 deletions(-)
> > +
> > +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/845=
6
> ]
> > +
> > +diff --git a/src/basic/log.c b/src/basic/log.c
> > +index 7a7f2cbec..16a2431c5 100644
> > +--- a/src/basic/log.c
> > ++++ b/src/basic/log.c
> > +@@ -814,7 +814,7 @@ static void log_assert(
> > +         log_dispatch_internal(level, 0, file, line, func, NULL, NULL,
> > NULL, NULL, buffer); + }
> > +
> > +-noreturn void log_assert_failed_realm(
> > ++_noreturn_ void log_assert_failed_realm(
> > +                 LogRealm realm,
> > +                 const char *text,
> > +                 const char *file,
> > +@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
> > +         abort();
> > + }
> > +
> > +-noreturn void log_assert_failed_unreachable_realm(
> > ++_noreturn_ void log_assert_failed_unreachable_realm(
> > +                 LogRealm realm,
> > +                 const char *text,
> > +                 const char *file,
> > +diff --git a/src/basic/log.h b/src/basic/log.h
> > +index efcf0f1bf..314be128a 100644
> > +--- a/src/basic/log.h
> > ++++ b/src/basic/log.h
> > +@@ -186,7 +186,7 @@ int log_dump_internal(
> > +                 char *buffer);
> > +
> > + /* Logging for various assertions */
> > +-noreturn void log_assert_failed_realm(
> > ++_noreturn_ void log_assert_failed_realm(
> > +                 LogRealm realm,
> > +                 const char *text,
> > +                 const char *file,
> > +@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
> > + #define log_assert_failed(text, ...) \
> > +         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
> > +
> > +-noreturn void log_assert_failed_unreachable_realm(
> > ++_noreturn_ void log_assert_failed_unreachable_realm(
> > +                 LogRealm realm,
> > +                 const char *text,
> > +                 const char *file,
> > +diff --git a/src/basic/macro.h b/src/basic/macro.h
> > +index 95be63a20..8911edfc4 100644
> > +--- a/src/basic/macro.h
> > ++++ b/src/basic/macro.h
> > +@@ -53,6 +53,15 @@
> > + #else
> > + #define _fallthrough_
> > + #endif
> > ++/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> > ++ * compiler versions */
> > ++#ifndef _noreturn_
> > ++#if __STDC_VERSION__ >=3D 201112L
> > ++#define _noreturn_ _Noreturn
> > ++#else
> > ++#define _noreturn_ __attribute__((noreturn))
> > ++#endif
> > ++#endif
> > +
> > + /* Temporarily disable some warnings */
> > + #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
>    \
> > +@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigned
> long
> > u) { + #endif
> > + #endif
> > +
> > +-/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> > +- * compiler versions */
> > +-#ifndef noreturn
> > +-#if __STDC_VERSION__ >=3D 201112L
> > +-#define noreturn _Noreturn
> > +-#else
> > +-#define noreturn __attribute__((noreturn))
> > +-#endif
> > +-#endif
> > +-
> > + #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
> > +         static inline void func##p(type *p) {                   \
> > +                 if (*p)                                         \
> > +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> > +index aa9846db5..e6120af5b 100644
> > +--- a/src/basic/process-util.c
> > ++++ b/src/basic/process-util.c
> > +@@ -987,7 +987,7 @@ bool is_main_thread(void) {
> > +         return cached > 0;
> > + }
> > +
> > +-noreturn void freeze(void) {
> > ++_noreturn_ void freeze(void) {
> > +
> > +         log_close();
> > +
> > +diff --git a/src/basic/process-util.h b/src/basic/process-util.h
> > +index 93029e36e..5170adec7 100644
> > +--- a/src/basic/process-util.h
> > ++++ b/src/basic/process-util.h
> > +@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
> > +
> > + bool is_main_thread(void);
> > +
> > +-noreturn void freeze(void);
> > ++_noreturn_ void freeze(void);
> > +
> > + bool oom_score_adjust_is_valid(int oa);
> > +
> > +diff --git a/src/core/main.c b/src/core/main.c
> > +index 076846a41..4b2d14923 100644
> > +--- a/src/core/main.c
> > ++++ b/src/core/main.c
> > +@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT64_M=
AX;
> > + static sd_id128_t arg_machine_id =3D {};
> > + static EmergencyAction arg_cad_burst_action =3D
> > EMERGENCY_ACTION_REBOOT_FORCE; +
> > +-noreturn static void freeze_or_reboot(void) {
> > ++_noreturn_ static void freeze_or_reboot(void) {
> > +
> > +         if (arg_crash_reboot) {
> > +                 log_notice("Rebooting in 10s...");
> > +@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
> > +         freeze();
> > + }
> > +
> > +-noreturn static void crash(int sig) {
> > ++_noreturn_ static void crash(int sig) {
> > +         struct sigaction sa;
> > +         pid_t pid;
> > +
> > +diff --git a/src/journal/test-journal-interleaving.c
> > b/src/journal/test-journal-interleaving.c +index 5a88b2774..d87bdbdd3
> > 100644
> > +--- a/src/journal/test-journal-interleaving.c
> > ++++ b/src/journal/test-journal-interleaving.c
> > +@@ -37,7 +37,7 @@
> > +
> > + static bool arg_keep =3D false;
> > +
> > +-noreturn static void log_assert_errno(const char *text, int error,
> const
> > char *file, int line, const char *func) { ++_noreturn_ static void
> > log_assert_errno(const char *text, int error, const char *file, int lin=
e,
> > const char *func) { +         log_internal(LOG_CRIT, error, file, line,
> > func,
> > +                      "'%s' failed at %s:%u (%s): %m", text, file, lin=
e,
> > func); +         abort();
> > +diff --git a/src/shared/pager.c b/src/shared/pager.c
> > +index 75db3c985..681af9c40 100644
> > +--- a/src/shared/pager.c
> > ++++ b/src/shared/pager.c
> > +@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;
> > + static bool stdout_redirected =3D false;
> > + static bool stderr_redirected =3D false;
> > +
> > +-noreturn static void pager_fallback(void) {
> > ++_noreturn_ static void pager_fallback(void) {
> > +         int r;
> > +
> > +         r =3D copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1, =
0);
> > +diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
> > +index 2821640e9..c8fa47b3d 100644
> > +--- a/src/udev/collect/collect.c
> > ++++ b/src/udev/collect/collect.c
> > +@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct
> > udev_list_node *node) +         return container_of(node, struct _mate,
> > node);
> > + }
> > +
> > +-noreturn static void sig_alrm(int signo)
> > ++_noreturn_ static void sig_alrm(int signo)
> > + {
> > +         exit(4);
> > + }
> > +--
> > +2.17.0
> > +
> > diff --git a/meta/recipes-core/systemd/systemd_237.bb
> > b/meta/recipes-core/systemd/systemd_237.bb index 1d04796f39..6f59e6064e
> > 100644
> > --- a/meta/recipes-core/systemd/systemd_237.bb
> > +++ b/meta/recipes-core/systemd/systemd_237.bb
> > @@ -50,6 +50,7 @@ SRC_URI +=3D "file://touchscreen.rules \
> >
> > file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch =
\
> > file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch =
\
> > file://0032-memfd.patch \
> > +
> > file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \ "
> >  SRC_URI_append_qemuall =3D "
> > file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
>
>
>
>

--00000000000090da53056bc6d4f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div>Hi Mark!<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">Il mer 9 mag 2018, 15:56 Mark Asselstine &lt;<a hr=
ef=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselsti=
ne@windriver.com</a><wbr>&gt; ha scritto:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Wednesday, May 9, 2018 8:16:08 AM EDT Andrea Galbusera wrote:<br>
&gt; When gcrypt support is present in PACKAGECONFIG, build fails due to th=
e bug<br>
&gt; reported in [1]. Since this is already solved upstream, this commit<br=
>
&gt; backports the corresponding patch.<br>
&gt; <br>
&gt; [1] <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893=
602" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugs.debian.or=
g/cgi-<wbr>bin/bugreport.cgi?bug=3D893602</a><br>
&gt; <br>
&gt; Signed-off-by: Andrea Galbusera &lt;<a href=3D"mailto:gizero@gmail.com=
" rel=3D"noreferrer" target=3D"_blank">gizero@gmail.com</a>&gt;<br>
<br>
Thanks Andrea, I can confirm this fixes a build failure we were seeing as <=
br>
well.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks for further testing the patch so quickly!</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Out of curiosity... Are you also enabling gcr=
ypt support to workaround the implict dependency resolved used to have upon=
 gcrypt in the past? It took me a few hours to figure out what was specific=
 in my configuration, since this bug was obviously not exposed in configura=
tions currently built by the autobuilders!</div><div dir=3D"auto"><br></div=
><div>As a side note, I know there is a newer released version of systemd (=
238), but upgrading such a complex recipe was not an option for me in the s=
hort. I&#39;m CC-ing the recipe&#39;s maintainer here, in case there&#39;s =
already an effort to upgrade to 238...=C2=A0 =C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
Mark<br>
<br>
&gt; ---<br>
&gt;=C2=A0 ...rename-noreturn-into-_<wbr>noreturn_-8456.patch | 203 +++++++=
+++++++++++<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">syst<wbr>emd_237.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 204 insertions(+)<br>
&gt;=C2=A0 create mode 100644<br>
&gt; meta/recipes-core/systemd/<wbr>systemd/0033-basic-macros-<wbr>rename-n=
oreturn-into-_n<br>
&gt; oreturn_-8456.patch<br>
&gt; <br>
&gt; diff --git<br>
&gt; a/meta/recipes-core/systemd/<wbr>systemd/0033-basic-macros-<wbr>rename=
-noreturn-into-<br>
&gt; _noreturn_-8456.patch<br>
&gt; b/meta/recipes-core/systemd/<wbr>systemd/0033-basic-macros-<wbr>rename=
-noreturn-into-<br>
&gt; _noreturn_-8456.patch new file mode 100644<br>
&gt; index 0000000000..59647b22f8<br>
&gt; --- /dev/null<br>
&gt; +++<br>
&gt; b/meta/recipes-core/systemd/<wbr>systemd/0033-basic-macros-<wbr>rename=
-noreturn-into-<br>
&gt; _noreturn_-8456.patch @@ -0,0 +1,203 @@<br>
&gt; +From 848e863acc51ecfb0f3955c4988745<wbr>88201d9130 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Franck Bui &lt;<a href=3D"mailto:fbui@suse.com" rel=3D"noreferr=
er" target=3D"_blank">fbui@suse.com</a>&gt;<br>
&gt; +Date: Thu, 15 Mar 2018 06:23:46 +0100<br>
&gt; +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456=
)<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +&quot;noreturn&quot; is reserved and can be used in other header file=
s we include:<br>
&gt; +<br>
&gt; +=C2=A0 [=C2=A0 =C2=A016s] In file included from /usr/include/gcrypt.h=
:30:0,<br>
&gt; +=C2=A0 [=C2=A0 =C2=A016s]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 from ../src/journal/journal-file.h:<wbr>26,<br>
&gt; +=C2=A0 [=C2=A0 =C2=A016s]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 from ../src/journal/journal-vacuum.<wbr>c:31:<br>
&gt; +=C2=A0 [=C2=A0 =C2=A016s] /usr/include/gpg-error.h:1544:<wbr>46: erro=
r: expected =E2=80=98,=E2=80=99 or =E2=80=98;=E2=80=99<br>
&gt; before =E2=80=98)=E2=80=99 token +=C2=A0 [=C2=A0 =C2=A016s]=C2=A0 void=
 gpgrt_log_bug (const char *fmt, ...)=C2=A0 =C2=A0<br>
&gt; GPGRT_ATTR_NR_PRINTF(1,2); +<br>
&gt; +Here we include grcrypt.h (which in turns include gpg-error.h) *after=
* we<br>
&gt; +&quot;noreturn&quot; was defined in macro.h.<br>
&gt; +---<br>
&gt; + src/basic/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; + src/basic/log.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; + src/basic/macro.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++----------<br>
&gt; + src/basic/process-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + src/basic/process-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + src/core/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; + src/journal/test-journal-<wbr>interleaving.c |=C2=A0 2 +-<br>
&gt; + src/shared/pager.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + src/udev/collect/collect.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt; + 9 files changed, 20 insertions(+), 21 deletions(-)<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/systemd/syst=
emd/pull/8456" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/systemd/<wbr>systemd/pull/8456</a>]<br>
&gt; +<br>
&gt; +diff --git a/src/basic/log.c b/src/basic/log.c<br>
&gt; +index 7a7f2cbec..16a2431c5 100644<br>
&gt; +--- a/src/basic/log.c<br>
&gt; ++++ b/src/basic/log.c<br>
&gt; +@@ -814,7 +814,7 @@ static void log_assert(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_dispatch_internal(level, 0, fil=
e, line, func, NULL, NULL,<br>
&gt; NULL, NULL, buffer); + }<br>
&gt; +<br>
&gt; +-noreturn void log_assert_failed_realm(<br>
&gt; ++_noreturn_ void log_assert_failed_realm(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LogReal=
m realm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *text,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *file,<br>
&gt; +@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
&gt; + }<br>
&gt; +<br>
&gt; +-noreturn void log_assert_failed_unreachable_<wbr>realm(<br>
&gt; ++_noreturn_ void log_assert_failed_unreachable_<wbr>realm(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LogReal=
m realm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *text,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *file,<br>
&gt; +diff --git a/src/basic/log.h b/src/basic/log.h<br>
&gt; +index efcf0f1bf..314be128a 100644<br>
&gt; +--- a/src/basic/log.h<br>
&gt; ++++ b/src/basic/log.h<br>
&gt; +@@ -186,7 +186,7 @@ int log_dump_internal(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *b=
uffer);<br>
&gt; +<br>
&gt; + /* Logging for various assertions */<br>
&gt; +-noreturn void log_assert_failed_realm(<br>
&gt; ++_noreturn_ void log_assert_failed_realm(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LogReal=
m realm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *text,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *file,<br>
&gt; +@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(<br>
&gt; + #define log_assert_failed(text, ...) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_assert_failed_realm(LOG_<wbr>RE=
ALM, (text), __VA_ARGS__)<br>
&gt; +<br>
&gt; +-noreturn void log_assert_failed_unreachable_<wbr>realm(<br>
&gt; ++_noreturn_ void log_assert_failed_unreachable_<wbr>realm(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LogReal=
m realm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *text,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *file,<br>
&gt; +diff --git a/src/basic/macro.h b/src/basic/macro.h<br>
&gt; +index 95be63a20..8911edfc4 100644<br>
&gt; +--- a/src/basic/macro.h<br>
&gt; ++++ b/src/basic/macro.h<br>
&gt; +@@ -53,6 +53,15 @@<br>
&gt; + #else<br>
&gt; + #define _fallthrough_<br>
&gt; + #endif<br>
&gt; ++/* Define C11 noreturn without &lt;stdnoreturn.h&gt; and even on old=
er gcc<br>
&gt; ++ * compiler versions */<br>
&gt; ++#ifndef _noreturn_<br>
&gt; ++#if __STDC_VERSION__ &gt;=3D 201112L<br>
&gt; ++#define _noreturn_ _Noreturn<br>
&gt; ++#else<br>
&gt; ++#define _noreturn_ __attribute__((noreturn))<br>
&gt; ++#endif<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; + /* Temporarily disable some warnings */<br>
&gt; + #define DISABLE_WARNING_DECLARATION_<wbr>AFTER_STATEMENT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigne=
d long<br>
&gt; u) { + #endif<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-/* Define C11 noreturn without &lt;stdnoreturn.h&gt; and even on old=
er gcc<br>
&gt; +- * compiler versions */<br>
&gt; +-#ifndef noreturn<br>
&gt; +-#if __STDC_VERSION__ &gt;=3D 201112L<br>
&gt; +-#define noreturn _Noreturn<br>
&gt; +-#else<br>
&gt; +-#define noreturn __attribute__((noreturn))<br>
&gt; +-#endif<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; + #define DEFINE_TRIVIAL_CLEANUP_FUNC(<wbr>type, func)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static inline void func##p(type *p)=
 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*p)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; +diff --git a/src/basic/process-util.c b/src/basic/process-util.c<br>
&gt; +index aa9846db5..e6120af5b 100644<br>
&gt; +--- a/src/basic/process-util.c<br>
&gt; ++++ b/src/basic/process-util.c<br>
&gt; +@@ -987,7 +987,7 @@ bool is_main_thread(void) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cached &gt; 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-noreturn void freeze(void) {<br>
&gt; ++_noreturn_ void freeze(void) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_close();<br>
&gt; +<br>
&gt; +diff --git a/src/basic/process-util.h b/src/basic/process-util.h<br>
&gt; +index 93029e36e..5170adec7 100644<br>
&gt; +--- a/src/basic/process-util.h<br>
&gt; ++++ b/src/basic/process-util.h<br>
&gt; +@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);<br>
&gt; +<br>
&gt; + bool is_main_thread(void);<br>
&gt; +<br>
&gt; +-noreturn void freeze(void);<br>
&gt; ++_noreturn_ void freeze(void);<br>
&gt; +<br>
&gt; + bool oom_score_adjust_is_valid(int oa);<br>
&gt; +<br>
&gt; +diff --git a/src/core/main.c b/src/core/main.c<br>
&gt; +index 076846a41..4b2d14923 100644<br>
&gt; +--- a/src/core/main.c<br>
&gt; ++++ b/src/core/main.c<br>
&gt; +@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT64_=
MAX;<br>
&gt; + static sd_id128_t arg_machine_id =3D {};<br>
&gt; + static EmergencyAction arg_cad_burst_action =3D<br>
&gt; EMERGENCY_ACTION_REBOOT_FORCE; +<br>
&gt; +-noreturn static void freeze_or_reboot(void) {<br>
&gt; ++_noreturn_ static void freeze_or_reboot(void) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg_crash_reboot) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_not=
ice(&quot;Rebooting in 10s...&quot;);<br>
&gt; +@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freeze();<br>
&gt; + }<br>
&gt; +<br>
&gt; +-noreturn static void crash(int sig) {<br>
&gt; ++_noreturn_ static void crash(int sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sigaction sa;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
&gt; +<br>
&gt; +diff --git a/src/journal/test-journal-<wbr>interleaving.c<br>
&gt; b/src/journal/test-journal-<wbr>interleaving.c +index 5a88b2774..d87bd=
bdd3<br>
&gt; 100644<br>
&gt; +--- a/src/journal/test-journal-<wbr>interleaving.c<br>
&gt; ++++ b/src/journal/test-journal-<wbr>interleaving.c<br>
&gt; +@@ -37,7 +37,7 @@<br>
&gt; +<br>
&gt; + static bool arg_keep =3D false;<br>
&gt; +<br>
&gt; +-noreturn static void log_assert_errno(const char *text, int error, c=
onst<br>
&gt; char *file, int line, const char *func) { ++_noreturn_ static void<br>
&gt; log_assert_errno(const char *text, int error, const char *file, int li=
ne,<br>
&gt; const char *func) { +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_internal(LO=
G_CRIT, error, file, line,<br>
&gt; func,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;&#39;%s&#39; failed at %s:%u (%s): %m&quot;, text, file, line=
,<br>
&gt; func); +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
&gt; +diff --git a/src/shared/pager.c b/src/shared/pager.c<br>
&gt; +index 75db3c985..681af9c40 100644<br>
&gt; +--- a/src/shared/pager.c<br>
&gt; ++++ b/src/shared/pager.c<br>
&gt; +@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;<br>
&gt; + static bool stdout_redirected =3D false;<br>
&gt; + static bool stderr_redirected =3D false;<br>
&gt; +<br>
&gt; +-noreturn static void pager_fallback(void) {<br>
&gt; ++_noreturn_ static void pager_fallback(void) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D copy_bytes(STDIN_FILENO, STDO=
UT_FILENO, (uint64_t) -1, 0);<br>
&gt; +diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c<=
br>
&gt; +index 2821640e9..c8fa47b3d 100644<br>
&gt; +--- a/src/udev/collect/collect.c<br>
&gt; ++++ b/src/udev/collect/collect.c<br>
&gt; +@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct<br>
&gt; udev_list_node *node) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return contai=
ner_of(node, struct _mate,<br>
&gt; node);<br>
&gt; + }<br>
&gt; +<br>
&gt; +-noreturn static void sig_alrm(int signo)<br>
&gt; ++_noreturn_ static void sig_alrm(int signo)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(4);<br>
&gt; + }<br>
&gt; +--<br>
&gt; +2.17.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a><=
br>
&gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a> index 1d047=
96f39..6f59e6064e<br>
&gt; 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a><br>
&gt; @@ -50,6 +50,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; file://0030-fix-missing-of-__<wbr>register_atfork-for-non-glibc-<wbr>b=
uild.patch \<br>
&gt; file://0031-fix-missing-ULONG_<wbr>LONG_MAX-definition-in-case-<wbr>of=
-mus.patch \<br>
&gt; file://0032-memfd.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; file://0033-basic-macros-<wbr>rename-noreturn-into-_<wbr>noreturn_-845=
6.patch \ &quot;<br>
&gt;=C2=A0 SRC_URI_append_qemuall =3D &quot;<br>
&gt; file://0001-core-device.c-<wbr>Change-the-default-device-<wbr>timeout-=
to-2.patch&quot;<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div></div>

--00000000000090da53056bc6d4f4--
