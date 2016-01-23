Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id E63EF7705D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:18 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 94so7509721qgt.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=m5xncimz/flxVfzEqOgUqzjWK9lgfU9Cnk/4m9AAUOM=;
	b=aNQZ23AHbDrTWJuW0o0ADnekWUw0VeHwL8DJ8w+OtIO9beQ6PBlEe5hRcKQuUIxAvB
	3pM129wdxGF1sqEqOFuYEltA3tytN9slOSnVmQHVr5Gn06f6uZFtda/tx10B7PHZafR4
	tUeqIGGtHiepebV3pZT2lBZlCZzgeZGBxOl2V6XLSezi5Cl/0l0/9Y5FjqLFL0Xvgm+L
	XEg+O8areZZPVg8UlSYifGJj+gEmHJW+1LvDJvXruj+NKodFl3FP5vAFXvnusy+jnLAB
	GaQVo0PCSnMnQbevXxN7xoV8udM7xBgJDRPfKy4a74uTZzLX2BgnMH2ke3+mPY4ZeeR/
	yseQ==
X-Gm-Message-State: AG10YORsvqiRqj8mrl09H5nZIprfrSo9AU52Kc8L3oEPPKm6IxKK8kDpmc6PgzGIxf4o6w==
X-Received: by 10.140.249.68 with SMTP id u65mr13279261qhc.53.1453590619425;
	Sat, 23 Jan 2016 15:10:19 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:00 -0500
Message-Id: <e9d7ef7044e92e7247a27671f58e24afe5791982.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 03/13] pyrtm: update to 0.4.2
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:22 -0000

---
 .../recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/pyrtm_0.2.bb
rename to meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 3d382b9..5d47e2b 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -3,7 +3,9 @@ AUTHOR = "Sridhar Ratnakumar / srid"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
-inherit pypi distutils
+PYPI_PACKAGE_EXT = "tar.bz2"
+
+SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
+SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
 
-SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
-SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
+inherit pypi distutils
-- 
1.9.1


