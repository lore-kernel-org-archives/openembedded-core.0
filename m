Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 493956FE5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 14:31:32 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so7087687pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VvQQWgf1pjQ3YvBQWVNIodrdIoMLEx3BTpvDKntQrNM=;
	b=DB3VkYro3FZ/tOyDm5osg9/f+U1mUhG57Ty+4NpqPjjmcqOvfNp2ztlSVU67DROdS0
	c5tmWpx3GAX7vQH7VErzTs54g0kXellbrEGdVVk0LYtU9SgtfbFux2C7qCbSQdtenrMB
	nuxKhE8nNzbrgyLbH6RIgCwUFsALm6hDmvZmgRVKy9xb7UrKNuznFiUTyQK6X3bOn9mI
	AhfFVrPUs9vBN51u2xQHiaDXlJ6VXWezfDqQN2+PteRJPuiFTHf52N5wA7UHuddj18J4
	NleiZMdaArjteHHl/EJL8Db5jRwVybzxecSLNCRa5y6nORwYiuslxkj5VAg7Xr6o9AZK
	iu+A==
X-Received: by 10.68.111.193 with SMTP id ik1mr2648341pbb.145.1407508293990;
	Fri, 08 Aug 2014 07:31:33 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id j1sm4642182pdh.31.2014.08.08.07.31.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 07:31:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 07:31:00 -0700
Message-Id: <1407508260-5380-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] perl-rdepends: add CPAN, CPAN::Meta requirements
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
X-List-Received-Date: Fri, 08 Aug 2014 14:31:41 -0000

While testing libmodule-build-tiny-perl, it was discovered that
perl-module-cpan is missing some RDEPENDS.

* Run "perl -mCPAN::Meta" on a target, the following is missing:
  -- perl-module-parse-cpan-meta (Parse::CPAN::Meta)

* Run "perl -mCPAN" on a target, the following (and others) are
  missing:
  -- perl-module-file-glob (File::Glob)
  -- perl-module-config-git (Config_git)

* Also added missing modules from runtime-requires in
  https://metacpan.org/source/ANDK/CPAN-2.05/META.json

This patch adds them to perl-rdepends for  ${PN}-module-cpan

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
index 9bd2e39..041471a 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
@@ -347,36 +347,56 @@ RDEPENDS_${PN}-module-corelist += "${PN}-module-strict"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-vars"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-version"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-archive-tar"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-b"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-build"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-carp"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-config"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-config-git"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-compress-zlib"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-cpan"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-cwd"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-data-dumper"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-digest-md5"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-digest-sha"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-dirhandle"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-exporter"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-cbuilder"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-makemaker"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-manifest"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-mm"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-mm-unix"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-file-copy"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-file-find"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-file-glob"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-file-path"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-file-temp"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-http-tiny"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-io-compress-base"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-json-pp"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-lib"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-list-util"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-mime-base64"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-net-ftp"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-net-ping"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-overload"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-parse-cpan-meta"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-posix"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-safe"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-strict"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-sys-hostname"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-term-readline"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-test-harness"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-test-more"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-text-wrap"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-time-local"
+RDEPENDS_${PN}-module-cpan += "${PN}-module-unicore"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-vars"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-version"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-warnings"
-- 
1.9.3


