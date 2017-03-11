Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 973CB77738
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C642E2E2F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hL3dj6feDNpz
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id A96B12E286
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 978FB1A077
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C6B41A075
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 808D02B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B5ECJI022727
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:14:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B5ECgk022726
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 06:14:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 06:14:09 +0100
Message-Id: <cover.1489209195.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/1] Whitelist sftp
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
X-List-Received-Date: Sat, 11 Mar 2017 05:14:13 -0000

I have been trying out the whitelisting of tools in $PATH, and it
seems to work very well. However, one thing that I realized is that
the tools used by the various fetchers need to be whitelisted. This
patch adds sftp to HOSTTOOLS_NONFATAL as that is the only fetcher we
use appart from git and wget, but I expect other tools such as cvs,
svn, hg, etc need to be added as well.

Feel free to squash this commit with the "base/bitbake.conf: Filter
contents of PATH to only allow whitelisted tools" commit.

//Peter

The following changes since commit 1cf50b756c589d8bf8f1f32f2062b69fb769242d:

  base/bitbake.conf: Filter contents of PATH to only allow whitelisted tools (2017-03-10 18:07:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/whitelist_sftp
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/whitelist_sftp

Peter Kjellerstedt (1):
  bitbake.conf: Add 'sftp' to HOSTTOOLS_NONFATAL

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.12.0


