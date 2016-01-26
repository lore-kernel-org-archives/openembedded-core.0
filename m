Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97F9576803
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 09:37:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0Q9bu3M020202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 01:37:56 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jan 2016 01:37:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jan 2016 01:37:55 -0800
Message-ID: <cover.1453801040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] image.bbclass: chek circular dependency when IMAGE_FSTYPES append hddimg
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
X-List-Received-Date: Tue, 26 Jan 2016 09:38:00 -0000
Content-Type: text/plain

The following changes since commit fc4209baa098caebf9c4cb75f9a6f2e85f43333c:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 10:08:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/img
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/img

Robert Yang (1):
  image.bbclass: chek circular dependency when IMAGE_FSTYPES append
    hddimg

 meta/classes/image-live.bbclass |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
1.7.9.5


