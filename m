Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9D86610D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 02:45:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBK2jsF8028241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 18:45:54 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.208) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 19 Dec 2013 18:45:54 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Dec 2013 10:45:51 +0800
Message-ID: <cover.1387507371.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V3 0/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Fri, 20 Dec 2013 02:45:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes since V2:
1. Fix the commit message.

The following changes since commit 9daa1de753e58b7f678e68cf307f6028c0c79a6a:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2013-12-16 12:13:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-default-target
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-default-target

Chen Qi (1):
  image.bbclass: add ability to set systemd default target

 meta/classes/image.bbclass |   10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.7.9.5


