Received: from us-smtp-delivery-110.mimecast.com (us-smtp-delivery-110.mimecast.com [170.10.133.110])
 by mx.groups.io with SMTP id smtpd.web10.33556.1631010955632548029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 03:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=mimecast20210517 header.b=jePaUzUR;
 spf=permerror, err=parse error for token &{10 18 _spf.psm.knowbe4.com}: limit exceeded (domain: globallogic.com, ip: 170.10.133.110, mailfrom: oleh.matiusha@globallogic.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
	s=mimecast20210517; t=1631010953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CKi6/7ExH0/u5t3U48ji/tkcMB3jpS4XelAz1ruNO60=;
	b=jePaUzURoyPW8x+FuOQSeXrsRNVLq8PMoM3UlHT4SssHhcVCD/glEZ3hWcyEo9+9j9fvA8
	eGuZC/cYbG+Y26ccoR5JxT0C90PbEFYpKHq0+vVbwQz4PnTUhaKMYrVNiC6rtS/38SZi2f
	nXXClYObq71y18h07AGSsh00aOUBhgOiYN8VgNtwlAryVM2S2vPectmJVKoTfyRtuwvbSF
	Cw6X/jgcGsbvNicfpW6U50tabAXSb5lAQ1fOX0+v0hNg5F0lw4t7QMPLphIu47dcF53pZY
	uzYtJBT0N63CLf7xJpvayu2RzgryO4Mr5oc69kFGrd1xmxxo7pOIUy4d/Phpcg==
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-L9DHkeAiO4GGWKV-AR_4hg-1; Tue, 07 Sep 2021 06:35:52 -0400
X-MC-Unique: L9DHkeAiO4GGWKV-AR_4hg-1
Received: by mail-lj1-f199.google.com with SMTP id 192-20020a2e05c90000b02901b91e6a0ebaso4672747ljf.13
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 03:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWsE4mAIx7YvL+4sCN82DMHCz4o6jRd1tJG1LF+9vMc=;
        b=CycNlpzMFNjEvA3LfVBoLZAsAlHIGWXxcyCKn8RlNfX74XG/vg6/IRGMcHUKGPJVEF
         UT54T9+9ZPMaRZ1eZTVrH1XaRWcOnWsBgTD2PIY0jcwy9zarLILlJvWfjMwPZaZxm9mM
         PQXPOuu8vteZiSKGSSpNFfD5Km5CqI9fnIoAly6n+EfhuLS7zdP1bW0BdMjYvqnRd79M
         RBLuyhEH2y4lrFncPHDr0MuuLYi3zwCpqjm1h2vkHiaiNtiSUWvE9tCkwbDfZ5hG67ev
         m6+xU0V1Xp7uPgGcMJymPRnPcSrvNhbr1pPC8F5SECU7L17IUSatoSMDMc7plpl/qNnO
         1Bqg==
X-Gm-Message-State: AOAM532J+4C9RuNAPzOk9mFTZxgqH0247f8MjZi2odCNqtVpgGzDJV+L
	9nkZOR0CZrIFnaFQSmi/6Soy0IO5+uklCBeN8lggMO2Oc67rQw36z/nNQUOyzcLsuPkr9myWAde
	XyH7zrDXTOvoGHaUbYOkWG/E8KR9Ovyq5+loGLwQ=
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr12115750lfq.14.1631010950407;
        Tue, 07 Sep 2021 03:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi/1svusH7662F9z2kXgsZxc9N0SgOClA5gr5tp8v/SAkSsm5T2cDxVaRRZDLe3m94lXuO8w==
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr12115728lfq.14.1631010949968;
        Tue, 07 Sep 2021 03:35:49 -0700 (PDT)
Return-Path: <oleh.matiusha@globallogic.com>
Received: from kbp1-lhp-f71885.synapse.com ([178.54.245.173])
        by smtp.gmail.com with ESMTPSA id b19sm963497lfb.135.2021.09.07.03.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 03:35:49 -0700 (PDT)
From: oleh.matiusha@globallogic.com
To: openembedded-core@lists.openembedded.org
Cc: Oleh Matiusha <oleh.matiusha@globallogic.com>
Subject: [PATCH] findutils: add ptest
Date: Tue,  7 Sep 2021 13:35:41 +0300
Message-Id: <20210907103541.739344-1-oleh.matiusha@globallogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA110A380 smtp.mailfrom=oleh.matiusha@globallogic.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: globallogic.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Oleh Matiusha <oleh.matiusha@globallogic.com>
---
 meta/recipes-extended/findutils/findutils.inc |  6 +-
 .../findutils/findutils/run-ptest             | 57 +++++++++++++++++++
 .../findutils/findutils_4.8.0.bb              | 11 ++++
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils/run-ptest

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

