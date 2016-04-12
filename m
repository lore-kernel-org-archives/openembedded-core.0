Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 434E8606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:30:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3C6Unle002412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Apr 2016 23:30:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Apr 2016 23:30:48 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 14:24:02 +0800
Message-ID: <cover.1460442074.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: gary@mlbassoc.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Remove flock option '-w'
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
X-List-Received-Date: Tue, 12 Apr 2016 06:30:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 5602f64ab8c3654737273c0e7ac1c966fa8afb6a:

  archiver: Fix ASSUME_PROVIDED issues (2016-04-11 09:03:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/flock-not-wait
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/flock-not-wait

Kai Kang (1):
  useradd_base.bbclass: remove flock option '-w'

 meta/classes/useradd_base.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.6.1


