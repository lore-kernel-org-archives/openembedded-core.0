Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20EA96077D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 07:12:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r797C9Yv023871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 00:12:09 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 9 Aug 2013 00:12:08 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 15:12:31 +0800
Message-ID: <cover.1376031704.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/1] grub_0.97: Fix to correctly ship files under /usr/lib
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
X-List-Received-Date: Fri, 09 Aug 2013 07:12:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 70f1938e6bb4da056cbf57e6deb4f53cad8ddca1:

  Temporary workaround with qemu images (2013-08-09 10:51:40 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/grub_0.97-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/grub_0.97-fix

Chen Qi (1):
  grub_0.97: Fix to correctly ship files under /usr/lib

 .../grub-0.97/grub_fix_for_automake-1.12.patch     |   50 +++++++++++++++-----
 1 file changed, 38 insertions(+), 12 deletions(-)

-- 
1.7.9.5


