Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 163F26B389
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:50:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0MAo1ZT008093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:50:01 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 22 Jan 2014 02:50:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 18:50:19 +0800
Message-ID: <cover.1390387731.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check that TMPDIR is not located on nfs
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
X-List-Received-Date: Wed, 22 Jan 2014 10:50:00 -0000
Content-Type: text/plain

The following changes since commit fbf6ea2201a4e7042980a82b6c342280df2fbbc8:

  sanity.bbclass: check required perl modules (2014-01-22 18:44:18 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/nfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/nfs

Robert Yang (1):
  sanity.bbclass: check that TMPDIR is not located on nfs

 meta/classes/sanity.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
1.8.3.1


