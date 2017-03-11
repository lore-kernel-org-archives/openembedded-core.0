Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEC877738
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4B4942E315
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ouGLWWXBPt19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id B659E2E2F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6AB01A075
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BC191A07C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8E4FA3B9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B5ECHK022731
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B5EC1P022730
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 06:14:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 06:14:10 +0100
Message-Id: <4556b40ea15a747a1c2e943905d3e02f5fcecf5f.1489209195.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489209195.git.pkj@axis.com>
References: <cover.1489209195.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] bitbake.conf: Add 'sftp' to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Sat, 11 Mar 2017 05:14:12 -0000

This is necessary to be able to use the sftp fetcher.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5699099b41..4cf1f5d6ff 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ps stty ip ssh scp ping vi"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg"
+HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp"
 
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-- 
2.12.0


