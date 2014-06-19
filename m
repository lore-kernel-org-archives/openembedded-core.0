Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B70A6FD3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:10:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5J2AFOJ019735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 19:10:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 18 Jun 2014 19:10:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 10:11:31 +0800
Message-ID: <cover.1403143738.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [dora][PATCH 0/2] populate-extfs.sh: two fixes
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
X-List-Received-Date: Thu, 19 Jun 2014 02:10:17 -0000
Content-Type: text/plain

The following changes since commit b7371b49b4b83c2e864126480b65363fe9f2cfd2:

  x264: Update SRCREV to match commit in upstream git repo (2014-06-17 17:59:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dora-populate-extfs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dora-populate-extfs

Chen Qi (2):
  populate-extfs.sh: fix to handle /var/lib/opkg/alternatives/[[
    correctly
  populate-extfs.sh: error out if debugfs encounters some error

 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
1.7.9.5


