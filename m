Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11636.1610040042693316972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 09:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7649031B
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Jan 2021 09:20:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 178133F719
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Jan 2021 09:20:40 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ruby: remove tcl DEPENDS
Date: Thu,  7 Jan 2021 17:20:39 +0000
Message-Id: <20210107172039.790825-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The integrated Tcl/Tk module was removed in Ruby 2.4[1] back in 2016, so =
this
build dependency can be removed.

[1] https://github.com/ruby/ruby/commit/303dc3c591e324b6bbc691326d8bea76f=
e3b8fda

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/=
ruby/ruby.inc
index a38b3fe624..7b6d4edc61 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "\
     file://LEGAL;md5=3D2b6d62dc0d608f34d510ca3f428110ec \
 "
=20
-DEPENDS =3D "ruby-native zlib openssl tcl libyaml gdbm readline libffi"
+DEPENDS =3D "ruby-native zlib openssl libyaml gdbm readline libffi"
 DEPENDS_class-native =3D "openssl-native libyaml-native readline-native =
zlib-native"
=20
 SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
--=20
2.25.1

