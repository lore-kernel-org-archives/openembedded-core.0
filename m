Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4E8265E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:53:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4N9rdwj021186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 02:53:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 23 May 2014 02:53:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 17:54:15 +0800
Message-ID: <cover.1400838768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [dora][PATCH 0/1] populate-extfs.sh: keep file timestamps
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
X-List-Received-Date: Fri, 23 May 2014 09:53:41 -0000
Content-Type: text/plain

The following changes since commit 4c58fe468790822fe48e0a570779979c831d0f10:

  openssl: fix CVE-2014-0198 (2014-05-21 09:32:38 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dora-populate-extfs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dora-populate-extfs

Chen Qi (1):
  populate-extfs.sh: keep file timestamps

 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
1.7.9.5


