Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5A07232E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 06:00:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB260HLc017080
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 22:00:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Dec 2014 22:00:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 14:00:37 +0800
Message-ID: <cover.1417499998.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: fix conf.patch to remove configuration that causes failure
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
X-List-Received-Date: Tue, 02 Dec 2014 06:00:21 -0000
Content-Type: text/plain

The following changes since commit 68ddb28a68ceb59cd1ed322c16143827ce1ac712:

  distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher (2014-11-28 13:59:52 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bind-configuration
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bind-configuration

Chen Qi (1):
  bind: fix conf.patch to remove configuration that causes failure

 meta/recipes-connectivity/bind/bind/conf.patch | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

-- 
1.9.1


