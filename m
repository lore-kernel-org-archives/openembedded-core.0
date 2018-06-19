Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6D34754CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:09:01 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w7-v6so20294647wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=uZXBRKDriRULKiBLFf8w5x1vzbeVXhZqRKI1oykJF7g=;
	b=iix/H2hL1QW8DwFkbDK2ijlTVmyKSUINE/dCtr2YAYJshk45ajDr6rgtcn52OZZ8xA
	QMQs6TbFQUV0eH6lBUc15qZcATw/JKwkmB5ZmtcXpGyI1tpWAWnuFAThh9xzBlEf0c0A
	QnzBJ9uuxcft6Z8dO5MakUm68U/sSWqvPVmzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uZXBRKDriRULKiBLFf8w5x1vzbeVXhZqRKI1oykJF7g=;
	b=lG+HYoIaU4Kn1GGt/o/u3D1tWecznKUKd3l2I7WrCGdt85jfGPzXxHvt/2LstJJdyJ
	DnTlm7lYkbO2NREJ4ijHyToQ6L8p+z/eOTWOYm3APsJVMvlZ44OxYHZ5oEw1e43GmZRd
	Fd5iBlZoz8RV8Yr+68BXQ5B5MEliOppxOYouZpJ/T/vU9Wb4jvdBwuRYG9r7nU69Q2/A
	sZ5DljNv99yFb7c24yMPau+NoNfrCIFCpXMjaf6FAEMkCn6iU9+HR1LLa0bpqmUSCvQf
	o/FLs+YSPveJiTYppU3I1aQNYqlbMizg9QsfgNSy8wDk6J12PJRBktOp5jIU1GcNpgNX
	9u9w==
X-Gm-Message-State: APt69E3eHrSs1Sy+JQ6Ihd4OFQXBf6J/sXL53ggy+/ecBhmhkDc0HPha
	KoCo/ktfJtK/YFMQh5BuNpUmG6BFDJw=
X-Google-Smtp-Source: ADUXVKKetFmJcMNwAU/wUe+c8L6ALS6j2JbrietjF8rcywnbo2UbJC328nDsKyl50GNmVKDAByulpg==
X-Received: by 2002:adf:fac6:: with SMTP id
	a6-v6mr13165437wrs.74.1529410142309; 
	Tue, 19 Jun 2018 05:09:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j131-v6sm18244178wmg.24.2018.06.19.05.09.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 05:09:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 13:09:00 +0100
Message-Id: <20180619120900.12437-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] subversion: 1.9.7 -> 1.10.0
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
X-List-Received-Date: Tue, 19 Jun 2018 12:09:02 -0000

License changed since licenses for the bundled linenoise and lz4 codebases
were added. We don't build either of them. Add MIT since utf8proc is MIT
licensed.

Configure to use the internal utf8proc codebase since we have no copy of that in
OE-Core, nor any need to add one.

Add a dependency on lz4 which is now required rather than using the internal
codebase within subversion.

Drop a patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{subversion_1.9.7.bb => subversion_1.10.0.bb}    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.9.7.bb => subversion_1.10.0.bb} (91%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.7.bb b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
similarity index 91%
rename from meta/recipes-devtools/subversion/subversion_1.9.7.bb
rename to meta/recipes-devtools/subversion/subversion_1.10.0.bb
index da9de9d5b92..82454ae63c3 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.7.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
@@ -1,21 +1,20 @@
 SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.tigris.org"
 SECTION = "console/network"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
+LICENSE = "Apache-2 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=83206f39819e7a4dfca2ff7c190f6ce0"
 
-DEPENDS = "apr-util serf sqlite3 file"
+DEPENDS = "apr-util serf sqlite3 file lz4"
 DEPENDS_append_class-native = " file-replacement-native"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
-           file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
            "
 
-SRC_URI[md5sum] = "05b0c677681073920f938c1f322e0be2"
-SRC_URI[sha256sum] = "c3b118333ce12e501d509e66bb0a47bcc34d053990acab45559431ac3e491623"
+SRC_URI[md5sum] = "0126847f9e8cb8ed0b90a6a18b203309"
+SRC_URI[sha256sum] = "2cf23f3abb837dea0585a6b0ebd70e80e01f95bddef7c1aa097c18e3eaa6b584"
 
 inherit autotools pkgconfig gettext
 
@@ -31,6 +30,7 @@ EXTRA_OECONF = " \
     --without-berkeley-db \
     --without-swig \
     --disable-keychain \
+    --with-utf8proc=internal \
     ac_cv_path_RUBY=none \
 "
 
-- 
2.17.1


