Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4015265C88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:28:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t251SRJU025589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 17:28:27 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 4 Mar 2015 17:28:27 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2015 09:20:05 +0800
Message-ID: <cover.1425518329.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/3] Some fixes for LSB test
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
X-List-Received-Date: Thu, 05 Mar 2015 01:28:26 -0000
Content-Type: text/plain

The following changes since commit bef8558f0e1a73107743417d8b2b772744ed9c28:

  README: expand the Where To Send Patches section (2015-03-04 17:07:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lsb-20150305
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/lsb

Kai Kang (3):
  lsb: update init-functions and remove sendmail
  msmtp: add link file in /usr/lib
  systemd: correct permission mode of /var/volatile/tmp

 .../recipes-core/systemd/systemd/00-create-volatile.conf |  2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb                     | 16 +++-------------
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb               |  5 +++++
 3 files changed, 9 insertions(+), 14 deletions(-)

-- 
1.9.1


