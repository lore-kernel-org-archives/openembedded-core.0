Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F76C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:06:26 +0000 (UTC)
Received: from mail1.bemta32.sdw.messagelabs.com
 (mail1.bemta32.sdw.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.52508.1638803185266766098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=gGvGJYrE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638803183; i=@fujitsu.com;
	bh=m0/bIfFcx7NnLawxfdzRrIseESqU1xdW8rZ4NaMXNNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=gGvGJYrEBHBcbnsxNz07RvN6by9t3tYAJC4LIHDIAPKsiv03Yd/hPmN1bYwyx3aAY
	 SdqrRLih9V5KB66cS2H2sKjQiFQM9aGl61ur8puOD2RcsofENWdBJVTOxPlgjXz6Fe
	 AV5UFsXOswDpJN+duUfX5UwPFC5KWuv4VuTKubZPnAGaoz0jf6sCx0UCiLy7LRZJGj
	 QmxgAUdSiLhxndvLHVVJzmklpL/5+S8grzV40OhWU4lvr795Mi/Ys0U8drlCBMCCRE
	 8MCWPnJ9OhFDP1YmYm0OS+h9xipS3AEJ3pQYn6KW9R3yapTU4whnl1+u1EWnn3NOK6
	 t5c8Xj4yF0//g==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id F1/7B-28795-FE62EA16;
 Mon, 06 Dec 2021 15:06:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MRovtebV2
  iwdVrXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b1XZ9ZCh4bVixvP8XewNil3cXIxSEkMJ1J
  ovffOXYIZzejxI4rx4AcTg42AV2Jc4/XAtkcHCICehJX/4mCmMICthLTTseDVLAIqEjMP9DAB
  hLmFXCXWNEeBBKWEFCQmPLwPTOIzSsgKHFy5hMWEJtZQFWi+8hTJghbXqJ562xmkFYJAUWJ2d
  PlIVorJF4fvsQ8gZF3FpLuWUi6ZyHpXsDIvIrRKqkoMz2jJDcxM0fX0MBA19DQVNdQ18jAWC+
  xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzDoUooZT+9g3NT3U+8QoyQHk5Io
  r4fYukQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErz7VYBygkWp6akVaZk5wAiASUtw8CiJ8G5QA
  krzFhck5hZnpkOkTjEqSonzHlUFSgiAJDJK8+DaYFF3iVFWSpiXkYGBQYinILUoN7MEVf4Voz
  gHo5Iw7y2QKTyZeSVw018BLWYCWhzTvxpkcUkiQkqqgSnTOvDUh/QbL6MfPVh8htnj2YqtXVG
  C3Mx2kzfZrq27tHriNp6tsT9iX2kWlDho/LvuVykb8kvbUaeS3fuIVcSJ/9M3Pb/t9kQ7JcaP
  4aKwe15vjn/wqWk/o7yqHkndFVwjtW9jgXLDkp9uuVwBh26qZl9i25EmucD4sbe5mIeftvQHn
  dw1EpmWPZOuqFg1FikuZ/e1a+SYpaEsMXHjZCuViP59AY91mwyC/kTdXcZ2s8jcxes2w44DxV
  LdeWs8Q17aSx/M5b4cy7R5Vj9z/4mPoht3rz/UpFe0Wfhf49sXMcbvT1pfUZx3pTviCtuFtZO
  33n53MJezwaj0S7f9llKPHRvtrk2zv9HD9301hxJLcUaioRZzUXEiAE+XErE1AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1638803182!31737!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19075 invoked from network); 6 Dec 2021 15:06:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:06:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B6F6Gx7022180
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Dec 2021 15:06:22 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:06:15 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.61 -> 1.4.63
Date: Tue, 7 Dec 2021 08:06:06 +0800
Message-ID: <1638835566-3825-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159235

refresh 0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch

Changelog from 1.4.61:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Important changes:
support pcre2; HTTP Digest auth userhash

bugfixes:
[mod_alias] fix use-after-free bug (fixes #3114)
[core] clean up fdlog_st and log_error_st decls
[core] 'struct log_error_st'->'log_error_st'
[core] remove redundant asserts
[core] explicitly include sys/cdefs.h
[tests] t/test_mod_ssi
[core] fdevent_socket_nb_cloexec_init()
[core] fdevent_impl.c separate from fdevent.c
[core] merge fdevent impls into fdevent_impl.c
[core] fdevent_fdnode.c separate from fdevent.c
[core] close backend socket fds more quickly
[core] use TCP_CORK w/ TLS if cq length > 16k
[core] warn if dynamic modules before mod_auth
[mod_cgi] check fd-to-cgi not -1 before close
[core] libev EV_ERROR conflicts with kqueue
[tests] disable test_mod_ssi in cmake (temporary)
[tests] disable test_mod_ssi in cmake (temporary)
[tests] reenable test_mod_ssi in cmake
[core] run plugin cleanup hooks in reverse
[core] fix removal of server.pid-file when testing (fixes #3115)
[doc] improve sample configs
[doc] expand vhosts.template
[doc] improve sample configs
[core] use ck_assert() in vector.[ch]
[tests] mod_ssi tests moved to src/t/test_mod_ssi
[mod_ssi] 0-init ssi_val_t in ssi_ctx_t
[mod_ssi] fix ancient bugs; replace cond parser
[mod_ssi] remove mod_ssi parser generator file
[mod_ssi] merge mod_ssi_expr.c into mod_ssi.c
[core] uint_fast32_t tweaks
[core] better asm for binary num to ascii string
[tests] t/test_mod now runs all t/test_mod_*.c
[tests] t/test_mod_alias.c
[tests] remove unused mod from tests/lighttpd.conf
[mod_evasive] smaller funcs for testing
[tests] t/test_mod_evasive.c
[mod_evasive] update comment to add references
[tests] combine tests into test_common.c
[core] get_http_method_key() tweak
[mod_dirlisting] check for disabled cache at start
[core] buffer_append_string_encoded_json()
[mod_dirlisting] (experimental) json (disabled)
[tests] t/test_mod needs -ldl on Debian
[core] save config regex captures only if used
[core] save pcre result state in config_pcre_match
[core] use stack w/ pcre_exec unless save captures
[core] extend pcre_keyvalue_ctx to pass more state
[core] pcre2 support (=E2=80=94with-pcre2)
[core] allocate one fewer cond_match_t, if needed
[core] allocate pcre output vector on demand
[build] configure.ac with AC_PROG_CC_C99 (fixes #3116)
[build] CI builds now use pcre2 (upgrade pcre)
[core] fix compiler warning in 32-bit build
[build] fix CMake pcre2 detection
[mod_auth] RFC7616 HTTP Digest username* userhash
[mod_dirlisting] fix bug not showing HEADER.txt
[tests] t/test_mod_ssi adjust to follow symlinks
[mod_auth] quiet coverity warning
[doc] refresh/update dependency lists in doc
[core] fix crash when using lighttpd -1 with pipes (fixes #3117)
[core] import xxHash v0.8.1
[core] isolate use of sys/filio.h
[core] fix reqpool mem corruption in 1.4.62 (fixes #3118)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...or-pcre-dependency-instead-of-config.patch | 25 ++++++++++---------
 ...{lighttpd_1.4.61.bb =3D> lighttpd_1.4.63.bb} |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.61.bb =3D> lighttpd_1.4.63.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
index f17bdce2c0..b60102ecc1 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
@@ -6,28 +6,29 @@ Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
 RP 2014/5/22
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  configure.ac | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5383cec..c29a902 100644
+index 806347b..81a7997 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
+@@ -913,10 +913,18 @@ AC_ARG_WITH([pcre2],
  )
- AC_MSG_RESULT([$WITH_PCRE])
+ AC_MSG_RESULT([$WITH_PCRE2])
  
--if test "$WITH_PCRE" !=3D no; then
--  if test "$WITH_PCRE" !=3D yes; then
--    PCRE_LIB=3D"-L$WITH_PCRE/lib -lpcre"
+-if test "$WITH_PCRE2" !=3D no; then
+-  if test "$WITH_PCRE2" !=3D yes; then
+-    PCRE_LIB=3D"-L$WITH_PCRE2/lib -lpcre2-8"
 -    CPPFLAGS=3D"$CPPFLAGS -I$WITH_PCRE/include"
 +if test "$WITH_PCRE" !=3D "no"; then
 +  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
-+				PCRE_LIB=3D${PCREPKG_LIBS}
-+				CPPFLAGS=3D"$CPPFLAGS ${PCREPKG_CFLAGS}"
++                               PCRE_LIB=3D${PCREPKG_LIBS}
++                               CPPFLAGS=3D"$CPPFLAGS ${PCREPKG_CFLAGS}"
 +  ], [
-+				AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel package or build with --without-pcre])
++                               AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel package or build with --without-pcre])
 +  ])
 +
 +  if test x"$PCRE_LIB" !=3D x; then
@@ -35,8 +36,8 @@ index 5383cec..c29a902 100644
 +    AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
 +    AC_SUBST(PCRE_LIB)
    else
-     AC_PATH_PROG([PCRECONFIG], [pcre-config])
-     if test -n "$PCRECONFIG"; then
+     AC_PATH_PROG([PCRE2CONFIG], [pcre2-config])
+     if test -n "$PCRE2CONFIG"; then
 -- 
-2.15.0
+2.25.1
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
index 32b0ae4ace..6c1476be1a 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
            "
 
-SRC_URI[sha256sum] =3D "43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432"
+SRC_URI[sha256sum] =3D "2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9"
 
 DEPENDS =3D "virtual/crypt"
 
-- 
2.25.1


