Received: from us-smtp-delivery-110.mimecast.com (us-smtp-delivery-110.mimecast.com [216.205.24.110])
 by mx.groups.io with SMTP id smtpd.web11.14823.1631121875433448095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 10:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=mimecast20210517 header.b=X9BmfG+N;
 spf=permerror, err=parse error for token &{10 18 _spf.psm.knowbe4.com}: limit exceeded (domain: globallogic.com, ip: 216.205.24.110, mailfrom: oleh.matiusha@globallogic.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
	s=mimecast20210517; t=1631121874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iUtnfgiU4upTM78xzhXxVWPapgUIE2m75BBhtpmsTGE=;
	b=X9BmfG+NeJtwcdHeAGZU/FUq/4WsBaAD8HtF+lGNM/RO1ateB+1HbKkq/mw9tZVXU8Gtk4
	wBTMoMuRka0Vqcxzp2hbBmUyVmFEPfvD7kCKYfTq4deIJRtraVWevHgUnV8LNk0siXxL+1
	BnkF+eG/L4/oxDzaedwkmQrpah4lZRkUQbYPcCcdv0LHNvFGrog+jHjXN8dSI/cZEOLMo6
	1rXNurANarusgaS7GdQ/yxkoaczhbZWYpUcOj3VYHhQwd/UBB5bANQEct2xLLSg0gv5Bz7
	HTOjcGzEf5Tr7X15i4xNOpSmmcsr+qNaiGeB8aa47DXUtkc1hefYtsnp8Pmfbg==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-R09JO8CqPX-On1n3LNGBOQ-1; Wed, 08 Sep 2021 13:24:33 -0400
X-MC-Unique: R09JO8CqPX-On1n3LNGBOQ-1
Received: by mail-ej1-f72.google.com with SMTP id 22-20020a170906301600b005ca77a21183so1323120ejz.20
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 10:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rwz08i/pWuXbE88ajasAOs8/VGmHaVtBZ6ggjTqKkZQ=;
        b=frH/VAirq/EjO+LTYgVSO1/QsmjcDy56YHCP/VRxY1PId2NklYys1QVqnv9Xtajntm
         gArHZT4YQSPTM4yJqwyUFAKytpuXSBAtwxxf899JgbWY9M9gLSsP1SItG1PwsC8mdqB5
         bg6nkungbeIXHOeqDkkzZOygxua1VxtJDDddlwxjEhN/RZgO8FriE0C2Tl3ocjrNGu3/
         yS4+txIWEXUf2kkmlmq1GO8wNZjAKpsqNG0Nxi6kkWhHbrq+e2hFUwzG84HGVrMftcce
         4SR69dj8wJxp9hRTEk6mexo0ZZKSwAEqqb74p8xTKyBOdjtnvJa5hcATIcvUU0L8qcz7
         xo4Q==
X-Gm-Message-State: AOAM532wJkiqL8IpmkQeyPlJHsOgJzZ5/tNPtOEbJ1SV2NolHAyYcptO
	1d7m0opPfyWDNJXjFR306bLaEI7ivsI15/PIR+G5JsD+263V6eN17h+uBcLX1NL6QvCykpkjDre
	UTAZpFPi1VbNaqRde/pxriVfFLX3oSXo36/v2Umo=
X-Received: by 2002:a05:6402:34c5:: with SMTP id w5mr4727232edc.67.1631121871837;
        Wed, 08 Sep 2021 10:24:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnD8vK806C2/1A9yzfPEXxFS+3/xlYr1GabTt/Is/GMBrKfjOSoK8N+Q5gNK3MKsQG0psCHA==
X-Received: by 2002:a05:6402:34c5:: with SMTP id w5mr4727197edc.67.1631121871392;
        Wed, 08 Sep 2021 10:24:31 -0700 (PDT)
Return-Path: <oleh.matiusha@globallogic.com>
Received: from kbp1-lhp-f71885.bcm.net.ua ([178.54.245.173])
        by smtp.gmail.com with ESMTPSA id t5sm1493247edd.66.2021.09.08.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:24:30 -0700 (PDT)
From: "Oleh Matiusha" <oleh.matiusha@globallogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleh Matiusha <oleh.matiusha@globallogic.com>
Subject: [PATCH v2] findutils: add ptest
Date: Wed,  8 Sep 2021 20:17:54 +0300
Message-Id: <20210908171753.2619967-1-oleh.matiusha@globallogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA110A380 smtp.mailfrom=oleh.matiusha@globallogic.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: globallogic.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Fixed warning spotted by Alexandre Belloni by adding findutils-ptest to pte=
st-packagelists.inc.=20
Placed it in PTESTS_SLOW since it takes 36s to execute this ptest on qemu.

Signed-off-by: Oleh Matiusha <oleh.matiusha@globallogic.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/findutils/findutils.inc |  6 +-
 .../findutils/findutils/run-ptest             | 57 +++++++++++++++++++
 .../findutils/findutils_4.8.0.bb              | 11 ++++
 4 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index e0ae1dd971..2cd97d90ec 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -71,6 +71,7 @@ PTESTS_SLOW =3D "\
     coreutils-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
+    findutils-ptest \
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-e=
xtended/findutils/findutils.inc
index ea8a1b7afe..ddcc05750b 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -6,9 +6,11 @@ HOMEPAGE =3D "http://www.gnu.org/software/findutils/"
 BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dfindutils"
 SECTION =3D "console/utils"
=20
-SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
+          file://run-ptest \
+          "
=20
-inherit autotools gettext texinfo update-alternatives
+inherit autotools gettext texinfo update-alternatives ptest
=20
 ALTERNATIVE:${PN} =3D "find xargs"
 ALTERNATIVE_PRIORITY =3D "100"
diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/rec=
ipes-extended/findutils/findutils/run-ptest
new file mode 100644
index 0000000000..ec71583c51
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -0,0 +1,57 @@
+#!/bin/bash
+
+# create temporary symlink to workaround missing oldfind
+ln -s /usr/bin/find /tmp/oldfind
+# make oldfind visible
+export PATH=3D"/tmp:${PATH}"
+
+export built_programs=3D"find xargs locate updatedb"
+
+# this gets substituted by sed during build
+export VERSION=3D"__run_ptest_version__"
+
+# define missing functions for tests/init.sh
+fu_path_prepend_ () {
+=09path_prepend_ $@
+}
+
+print_ver_ () {
+=09:
+}
+
+skip_if_root_ () {
+=09[ $(id -u) =3D 0 ] && exit 77;
+}
+
+require_root_ () {
+=09[ $(id -u) =3D 0 ] || exit 77;
+}
+
+expensive_ () {
+=09:
+}
+
+export -f fu_path_prepend_
+export -f print_ver_
+export -f skip_if_root_
+export -f require_root_
+export -f expensive_
+
+
+for f in tests/*/*.sh; do
+=09bash $f ;
+=09case $? in
+=09=090 )
+=09=09=09echo -n "PASS";;
+=09=0977 )
+=09=09=09echo -n "SKIP";;
+=09=09* )
+=09=09=09echo -n "FAIL";;
+=09esac
+=09echo ": $f"
+done
+
+#remove symlink
+rm -f /tmp/oldfind
+
+echo
diff --git a/meta/recipes-extended/findutils/findutils_4.8.0.bb b/meta/reci=
pes-extended/findutils/findutils_4.8.0.bb
index 675e53c0da..356fb05be6 100644
--- a/meta/recipes-extended/findutils/findutils_4.8.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.8.0.bb
@@ -12,3 +12,14 @@ SRC_URI[sha256sum] =3D "57127b7e97d91282c6ace556378d5455=
a9509898297e46e10443016ea1
 CACHED_CONFIGUREVARS +=3D "gl_cv_func_wcwidth_works=3Dyes"
=20
 EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
+
+RDEPENDS:${PN}-ptest +=3D "bash sed grep"
+
+do_install_ptest:class-target() {
+=09mkdir -p ${D}${PTEST_PATH}/tests/
+=09cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+=09# substitute value in run-ptest with actual version
+=09sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
+
+}
--=20
2.25.1

