Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 6547C77238
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:04:39 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 684771764; Fri, 05 Feb 2016 13:04:41 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkH-000CXI-6S; Fri, 05 Feb 2016 18:04:37 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkH-0002Bx-5q; Fri, 05 Feb 2016 18:04:37 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri,  5 Feb 2016 18:04:15 +0000
Message-Id: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 00/15] Prepare for EXTRA_OEMAKE = "" in bitbake.conf
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
X-List-Received-Date: Fri, 05 Feb 2016 18:04:43 -0000

This series (sent only to openembedded-core) fixes various recipes
that rely on the current default value of
EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value in the
hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.

With these patches applied and bitbake.conf setting EXTRA_OEMAKE = "",
I was able to build "bitbake world" for qemux86, qemuarm, qemuppc and
qemumips successfully. I plan to do more build testing and some actual
runtime testing before submitting the change to bitbake.conf.

It's highly likely that such a change will break recipes in meta-oe
and other layers too. I hope to do some testing with meta-oe soon.

The affected recipes are:

 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
 meta/recipes-bsp/libacpi/libacpi_0.2.bb
 meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
 meta/recipes-connectivity/openssl/openssl.inc
 meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
 meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
 meta/recipes-devtools/perl/perl-native_5.22.1.bb
 meta/recipes-devtools/perl/perl_5.22.1.bb
 meta/recipes-extended/ed/ed_1.9.bb
 meta/recipes-extended/iputils/iputils_s20151218.bb
 meta/recipes-extended/pigz/pigz.inc
 meta/recipes-extended/stat/stat_3.3.bb
 meta/recipes-extended/sysklogd/sysklogd.inc
 meta/recipes-extended/unzip/unzip_6.0.bb
 meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

Mike.

