Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web12.862.1609870610384280793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 10:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PLoTqv3u;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id j17so308521ybt.9
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 10:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lIP+jI6sJGZjVtfvbrKNks7HsPS1Xp3LwsTkocd0Uo0=;
        b=PLoTqv3ur4H+Lncx2wnKUtcjjJRXwrz5MIm/EzAzW4kzmWiuf49Z3CLkBex1GkmK+6
         Uo2qmlvceWX5y+j5m9rvXdirt28zvR9v5wUTNFjJKjZhis/WKsg+KbywCfIcVhQxmHyL
         wPgcyjMHCJHG7TGTRKAvfwAaiETaUxRpum6dYpzpZpmuEJp9A9W1MYkgoQMzLTj0eRZT
         EfW1DLBrDqALRnHxIaOar/Rq/bP0l87QBzqvp2F1Eor2pQZmuw8qAalfRzZGa+2TUCxL
         U/5sBbSk4bna18dv+9CFH4CNZaMU3G8/qxobbH1dobdnGgqy753ZtmwX0ni8JochtUSm
         JVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lIP+jI6sJGZjVtfvbrKNks7HsPS1Xp3LwsTkocd0Uo0=;
        b=AeWkGACocfFoA4VmZjvGUF71CfmGe38tCT5kGZMjzQxtLJaWkiCRTj+fGlKYGpoKxJ
         F0Ay+vGSPn3R8tgx1mPjj6AWUdTjrYl3Jb+IGbg1hrfH5DWL9dPD0HtCUxrE89c7mcg9
         Ef5GMmDiXB/ewobm5rIOa/beeIna/252QjLGCZzaPbPw8WafJndvP0bJnRjbO5aiPFlt
         JjGzb3PliQIsi9TXk5rdta6RZs3W9q5OJDcK0NfQk71Crp9DBv/cipxDEVo7vgW6c+ut
         LdDTUQKAzuJU1WHqrepYVybyAbTuG2AYzjHiAlSGlLg79J1sWEJReimjnTuvrOEBCG2R
         ysQg==
X-Gm-Message-State: AOAM532bBpPqHWfHvcu22mMGnrzY7sHwoC1j8U5EM3lWs+TxCWLIx07M
	d0jHnMY4JkVz1F1oTXTG/uttPLU+DfTXm+Ky6Jw=
X-Google-Smtp-Source: ABdhPJxyQXJDIkz7NQJW/MysuVXX9ZPK8iv6NYTHGM0iuUq0nBbxzgYaXEEhJmwtBSEZCHWIHG9SgAqMt+05jqN/mkY=
X-Received: by 2002:a25:8b:: with SMTP id 133mr910439yba.513.1609870609432;
 Tue, 05 Jan 2021 10:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20201214095331.43421-1-mikko.rapeli@bmw.de> <X/QV16T6IZdItue8@korppu>
In-Reply-To: <X/QV16T6IZdItue8@korppu>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 5 Jan 2021 08:16:38 -1000
Message-ID: <CAGDS+nn_1PHdFWRR7BnzNebh5YYpjE=UNeWKEdX-Mb53JyR19A@mail.gmail.com>
Subject: Re: [PATCH v2][dunfell] systemd: update from 244.3 to 244.5 stable release
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, joe.slater@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 4, 2021 at 9:31 PM <Mikko.Rapeli@bmw.de> wrote:
>
> Hi,
>
> Could this be considered for dunfell? I've hit some systemd crashes and w=
hile
> not all of them are fixed by this, updating to latest systemd stable poin=
t
> release makes sense.

Yes!  Sorry I somehow missed seeing this patch.  Will add it to the
next set of patches.

Thanks,

Steve

> On Mon, Dec 14, 2020 at 11:53:31AM +0200, mcfrisk@lakka.kapsi.fi wrote:
> > Brings in a number of fixes from upstream stable tree:
> >
> > $ git log --format=3D"%h %s" v244.3..v244.5
> > 3ceaa81c61 kernel-install/90-loaderentry: fix when /boot is not mountpo=
int
> > ecbb5a4f67 nspawn: fix fd leak on failure path
> > a09947ddd4 nspawn: check return of setsid()
> > 334f8e2e8f dissect: is_loop_device() returns negative on error, don't m=
istake that is true
> > b6efbbfb00 dissect: always invalidate secondary arch partitions if we f=
ound primary arch
> > dc5c5cd5c8 util: wireguard is merged into upstream kernel
> > 6349956dda fstab-generator: add 'nofail' when  NFS 'bg' option is used
> > f4777883f9 busctl: add missing shortopt -l
> > 9f6249eb7f bootctl: handle if LoaderSystemToken is invalid for some rea=
son
> > bda316cc0a hashmap: make sure to initialize shared hash key atomically
> > b80ea9e3da backlight: do not claim that ID_BACKLIGHT_CLAMP=3D property =
is not set
> > c829f6e7ca coredump: don't convert s =E2=86=92 =C2=B5s twice
> > bb9d872398 firstboot: fill empty color if ansi_color unavailable from o=
s-release
> > 156570cc77 resolved: make sure we initialize t->answer_errno before com=
pleting the transaction
> > 02bba02fa6 src/shared/dissect-image.c: fix build without blkdid (#16901=
)
> > 13cb598631 analyze: fix error handling in one case
> > 6ab20e9f3b units: add missing usb-gadget.target
> > 9ef259dd4d login/logind: Include sys/stat.h for struct stat usage
> > 7762e59fd4 partition/makefs: Include missing sys/file.h header
> > 3528ace8fb networkctl: label command does not take any argument
> > 34b4dc64c6 missing: Add new Linux capability
> > ba28e6fc45 tty-ask-pw-agent: properly propagate error
> > 7b6e0f74f2 tty-ask-pw-agent: the message string might not be set
> > 0bfe4bd39b tty-ask-pw-agent: make sure "--list" works correctly
> > 0783b4f8ce path: Improve $PATH search directory case
> > d0735d81d4 path: Skip directories when finalising $PATH search
> > 436872f995 rules: don't install 80-drivers.rules when kmod is disabled
> > 342dc4c15f zsh: correct journalctl command completion parsing
> > fec0bb6df4 basic/missing_syscall: fix syscall numbers for arm64 :(
> > bea900bb31 shared/install: fix preset operations for non-service instan=
tiated units
> > 677fb2b663 user-runtime-dir: deal gracefully with missing logind proper=
ties
> > 11a97bc230 shared/seccomp: do not use ifdef guards around textual sysca=
ll names
> > d411a4d6a6 machine-id-setup: don't use KVM or container manager supplie=
d uuid if in chroot env
> > 9b078df0ba analyze-security: do not assign badness to filtered-out sysc=
alls
> > da0cc77b52 load-fragment: fix grammar in error messages
> > 74d7c53e5f test: accept that char device 0/0 can now be created witout =
privileges
> > 5c35bcf329 tools/make-man-index: fix purpose text that contains tags
> > da1eb548fb Newer Glibc use faccessat2 to implement faccessat
> > b44e86ef76 bless-boot: add missing verb to --help
> > 88b6379bcd fix typo in systemctl help
> > d091e19bbd _sd-common.h: avoid parsing errors with Coverity
> > d56055f47f nspawn: Fix incorrect usage of putenv
> > 674a2beff0 udev: fix codesonar warnings
> > 16477684d2 sd-boot: fix -Wpointer-sign warning
> > cc8aeb9916 network: fix static assertion on IPPROTO_MAX range
> > f047b0706c sd-boot: fix menu ordering with boot counting
> > 896de33984 tests: add a testcase for https://github.com/systemd/systemd=
/issues/15885
> > bbc6ff960a network: Fix crash when SendOption=3D is invalid
> > 1599741b55 kernel-install: strip BOOT_IMAGE=3D from kernel options
> > 1d1f5006cb basic/user-util: always use base 10 for user/group numbers
> > b07d782047 parse-util: backport safe_atou32_full()
> > 7bc54463ce Fix build with =C2=B5httpd 0.9.71
> > b074499894 random-seed: add missing header for GRND_NONBLOCK (#14988)
> > ec9fd71358 makefs: strdup arguments to mkfs
> > efd5b1d443 network-generator: allow empty hostname
> > c188248371 network: DHCP lease load SIP copy paste error
> > cd7d8bb962 davfs is a network file system
> > 6aae7f596a logind: log a more accurate error when we failed at session =
creation
> > f4d5928122 docs: Add syntax for templated units to systemd.preset man p=
age
> > 148f7b147a man: add a tiny bit of markup
> > dbe16df9cd test: wait a bit after starting the test service
> > a713f52ddb fix journalctl regression (#15099)
> > 49e7c3b617 core: transition to FINAL_SIGTERM state after ExecStopPost=
=3D
> > d25598854d journalctl: show duplicate entries if they are from the same=
 file (#14898)
> > 037a0fa5d0 udev: fix SECLABEL{selinux} issue (#15064)
> > 9de06cd65a dissect-image: avoid scanning partitions
> > fa65938017 test: ignore IAB capabilities in `test-execute`
> > 16cac70094 Support compiling with clang and gnu11 standard
> > 1ea52d91c8 Typo fix
> > 869614a551 boot: Ensure ARM UEFI binary does not contain FP/SIMD instru=
ctions
> >
> > Patches CVE-2020-13776.patch and systemd-udev-seclabel-options-crash-fi=
x.patch
> > can be dropped as they are already applied in 244.5 upstream release.
> >
> > Not needed on master branch or gatesgarth as they run newer systemd ver=
sion 246.
> >
> > Tested on an ARM64 target with automatic tests which are passing on our=
 side.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  ...md-boot_244.3.bb =3D> systemd-boot_244.5.bb} |  0
> >  meta/recipes-core/systemd/systemd.inc         |  2 +-
> >  .../systemd/systemd/CVE-2020-13776.patch      | 96 -------------------
> >  ...temd-udev-seclabel-options-crash-fix.patch | 30 ------
> >  .../{systemd_244.3.bb =3D> systemd_244.5.bb}    |  5 +-
> >  5 files changed, 4 insertions(+), 129 deletions(-)
> >  rename meta/recipes-core/systemd/{systemd-boot_244.3.bb =3D> systemd-b=
oot_244.5.bb} (100%)
> >  delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.pa=
tch
> >  delete mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-secl=
abel-options-crash-fix.patch
> >  rename meta/recipes-core/systemd/{systemd_244.3.bb =3D> systemd_244.5.=
bb} (99%)
> >
> > v2: added dunfell patch prefix
> >
> > diff --git a/meta/recipes-core/systemd/systemd-boot_244.3.bb b/meta/rec=
ipes-core/systemd/systemd-boot_244.5.bb
> > similarity index 100%
> > rename from meta/recipes-core/systemd/systemd-boot_244.3.bb
> > rename to meta/recipes-core/systemd/systemd-boot_244.5.bb
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/=
systemd/systemd.inc
> > index e73b397b5d..3165d13f03 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7aba=
abaa882bbe \
> >                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> >
> > -SRCREV =3D "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
> > +SRCREV =3D "3ceaa81c61b654ebf562464d142675bd4d57d7b6"
> >  SRCBRANCH =3D "v244-stable"
> >  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dgi=
t;branch=3D${SRCBRANCH}"
> >
> > diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch b/m=
eta/recipes-core/systemd/systemd/CVE-2020-13776.patch
> > deleted file mode 100644
> > index 7b5e3e7f7a..0000000000
> > --- a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
> > +++ /dev/null
> > @@ -1,96 +0,0 @@
> > -From 156a5fd297b61bce31630d7a52c15614bf784843 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbysze=
k@in.waw.pl>
> > -Date: Sun, 31 May 2020 18:21:09 +0200
> > -Subject: [PATCH 1/1] basic/user-util: always use base 10 for user/grou=
p
> > - numbers
> > -
> > -We would parse numbers with base prefixes as user identifiers. For exa=
mple,
> > -"0x2b3bfa0" would be interpreted as UID=3D=3D45334432 and "01750" woul=
d be
> > -interpreted as UID=3D=3D1000. This parsing was used also in cases wher=
e either a
> > -user/group name or number may be specified. This means that names like
> > -0x2b3bfa0 would be ambiguous: they are a valid user name according to =
our
> > -documented relaxed rules, but they would also be parsed as numeric uid=
s.
> > -
> > -This behaviour is definitely not expected by users, since tools genera=
lly only
> > -accept decimal numbers (e.g. id, getent passwd), while other tools onl=
y accept
> > -user names and thus will interpret such strings as user names without =
even
> > -attempting to convert them to numbers (su, ssh). So let's follow suit =
and only
> > -accept numbers in decimal notation. Effectively this means that we wil=
l reject
> > -such strings as a username/uid/groupname/gid where strict mode is used=
, and try
> > -to look up a user/group with such a name in relaxed mode.
> > -
> > -Since the function changed is fairly low-level and fairly widely used,=
 this
> > -affects multiple tools: loginctl show-user/enable-linger/disable-linge=
r foo',
> > -the third argument in sysusers.d, fourth and fifth arguments in tmpfil=
es.d,
> > -etc.
> > -
> > -Fixes #15985.
> > ----
> > - src/basic/user-util.c     |  2 +-
> > - src/test/test-user-util.c | 10 ++++++++++
> > - 2 files changed, 11 insertions(+), 1 deletion(-)
> > -
> > ---- end of commit 156a5fd297b61bce31630d7a52c15614bf784843 ---
> > -
> > -
> > -Add definition of safe_atou32_full() from commit b934ac3d6e7dcad114776=
ef30ee9098693e7ab7e
> > -
> > -CVE: CVE-2020-13776
> > -
> > -Upstream-Status: Backport [https://github.com/systemd/systemd.git]
> > -
> > -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > -
> > -
> > -
> > ---- git.orig/src/basic/user-util.c
> > -+++ git/src/basic/user-util.c
> > -@@ -49,7 +49,7 @@ int parse_uid(const char *s, uid_t *ret)
> > -         assert(s);
> > -
> > -         assert_cc(sizeof(uid_t) =3D=3D sizeof(uint32_t));
> > --        r =3D safe_atou32(s, &uid);
> > -+        r =3D safe_atou32_full(s, 10, &uid);
> > -         if (r < 0)
> > -                 return r;
> > -
> > ---- git.orig/src/test/test-user-util.c
> > -+++ git/src/test/test-user-util.c
> > -@@ -48,9 +48,19 @@ static void test_parse_uid(void) {
> > -
> > -         r =3D parse_uid("65535", &uid);
> > -         assert_se(r =3D=3D -ENXIO);
> > -+        assert_se(uid =3D=3D 100);
> > -+
> > -+        r =3D parse_uid("0x1234", &uid);
> > -+        assert_se(r =3D=3D -EINVAL);
> > -+        assert_se(uid =3D=3D 100);
> > -+
> > -+        r =3D parse_uid("01234", &uid);
> > -+        assert_se(r =3D=3D 0);
> > -+        assert_se(uid =3D=3D 1234);
> > -
> > -         r =3D parse_uid("asdsdas", &uid);
> > -         assert_se(r =3D=3D -EINVAL);
> > -+        assert_se(uid =3D=3D 1234);
> > - }
> > -
> > - static void test_uid_ptr(void) {
> > ---- git.orig/src/basic/parse-util.h
> > -+++ git/src/basic/parse-util.h
> > -@@ -45,9 +45,13 @@ static inline int safe_atoux16(const cha
> > -
> > - int safe_atoi16(const char *s, int16_t *ret);
> > -
> > --static inline int safe_atou32(const char *s, uint32_t *ret_u) {
> > -+static inline int safe_atou32_full(const char *s, unsigned base, uint=
32_t *ret_u) {
> > -         assert_cc(sizeof(uint32_t) =3D=3D sizeof(unsigned));
> > --        return safe_atou(s, (unsigned*) ret_u);
> > -+        return safe_atou_full(s, base, (unsigned*) ret_u);
> > -+}
> > -+
> > -+static inline int safe_atou32(const char *s, uint32_t *ret_u) {
> > -+        return safe_atou32_full(s, 0, (unsigned*) ret_u);
> > - }
> > -
> > - static inline int safe_atoi32(const char *s, int32_t *ret_i) {
> > diff --git a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-op=
tions-crash-fix.patch b/meta/recipes-core/systemd/systemd/systemd-udev-secl=
abel-options-crash-fix.patch
> > deleted file mode 100644
> > index 27b2b60fad..0000000000
> > --- a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-c=
rash-fix.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From 0335d110afc08baf47d76b7011ce02510dfdd524 Mon Sep 17 00:00:00 2001
> > -From: Valery0xff <valery.chernous@gmail.com>
> > -Date: Wed, 11 Mar 2020 02:20:36 +0200
> > -Subject: [PATCH] udev: fix SECLABEL{selinux} issue (#15064)
> > -
> > -Add SECLABEL{selinux}=3D"some value" cause udevadm crash
> > -systemd-udevd[x]: Worker [x] terminated by signal 11 (SEGV)
> > -
> > -It happens since 25de7aa7b90 (Yu Watanabe 2019-04-25 01:21:11 +0200)
> > -when udev rules processing changed to token model. Yu forgot store
> > -attr to SECLABEL token so fix it.
> > ----
> > - src/udev/udev-rules.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -Upstream-Status: Backport [https://github.com/systemd/systemd/commit/0=
335d110afc08baf47d76b7011ce02510dfdd524.patch]
> > ----
> > -diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> > -index b9b350d1ef..b990f68e93 100644
> > ---- a/src/udev/udev-rules.c
> > -+++ b/src/udev/udev-rules.c
> > -@@ -921,7 +921,7 @@ static int parse_token(UdevRules *rules, const cha=
r *key, char *attr, UdevRuleOp
> > -                         op =3D OP_ASSIGN;
> > -                 }
> > -
> > --                r =3D rule_line_add_token(rule_line, TK_A_SECLABEL, o=
p, value, NULL);
> > -+                r =3D rule_line_add_token(rule_line, TK_A_SECLABEL, o=
p, value, attr);
> > -         } else if (streq(key, "RUN")) {
> > -                 if (is_match || op =3D=3D OP_REMOVE)
> > -                         return log_token_invalid_op(rules, key);
> > diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-=
core/systemd/systemd_244.5.bb
> > similarity index 99%
> > rename from meta/recipes-core/systemd/systemd_244.3.bb
> > rename to meta/recipes-core/systemd/systemd_244.5.bb
> > index 64e3b18333..8c95648ca0 100644
> > --- a/meta/recipes-core/systemd/systemd_244.3.bb
> > +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> > @@ -20,8 +20,6 @@ SRC_URI +=3D "file://touchscreen.rules \
> >             file://99-default.preset \
> >             file://0001-binfmt-Don-t-install-dependency-links-at-instal=
l-tim.patch \
> >             file://0003-implment-systemd-sysv-install-for-OE.patch \
> > -           file://CVE-2020-13776.patch \
> > -           file://systemd-udev-seclabel-options-crash-fix.patch \
> >             "
> >
> >  # patches needed by musl
> > @@ -51,6 +49,9 @@ SRC_URI_MUSL =3D "\
> >                 file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-de=
finition.patch \
> >                 "
> >
> > +# already applied in 244.5
> > +CVE_CHECK_WHITELIST +=3D "CVE-2020-13776"
> > +
> >  PAM_PLUGINS =3D " \
> >      pam-plugin-unix \
> >      pam-plugin-loginuid \
> > --
> > 2.20.1
