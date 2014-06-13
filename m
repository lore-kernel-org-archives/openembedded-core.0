Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5546FD72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:38:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DGbwXG022091; Fri, 13 Jun 2014 17:37:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ILaIpY4YJSSE; Fri, 13 Jun 2014 17:37:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DGbo4K022076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 17:37:52 +0100
Message-ID: <1402677465.29913.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 17:37:45 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] git: don't hardcode the full path to perl
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
X-List-Received-Date: Fri, 13 Jun 2014 16:38:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Christopher Larson <kergoth@gmail.com>

Hardcoded paths to perl don't make sense, use from the environment instead.

[Patch taken from meta-mentor by RP]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 96254f0..0b3807b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -16,6 +16,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 inherit autotools-brokensep perlnative
 
 EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
 EXTRA_OEMAKE_append_class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
 
 do_compile_prepend () {



