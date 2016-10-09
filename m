Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFB45719E6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 09:23:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u999NURt003231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Oct 2016 02:23:30 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 9 Oct 2016 02:23:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Oct 2016 17:23:47 +0800
Message-ID: <cover.1476004977.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: avoid boot failures for mips64
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
X-List-Received-Date: Sun, 09 Oct 2016 09:23:32 -0000
Content-Type: text/plain

The following changes since commit 747f59f5103995654f2b10a52d1dfd2dd4ad1a0e:

  linux-yocto/4.8: Enable R8169 driver since its needed by supported platforms (2016-10-08 07:45:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bug10250
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bug10250

Chen Qi (1):
  systemd: avoid boot failures for mips64

 meta/recipes-core/systemd/systemd.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


