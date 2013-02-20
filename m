Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <farrah.rashid@windriver.com>) id 1U8HAv-0006cw-NI
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 22:26:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1KL9nIr013717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 13:09:50 -0800 (PST)
Received: from yow-blade1.wrs.com (128.224.137.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 20 Feb 2013 13:09:49 -0800
From: farrah rashid <farrah.rashid@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 16:09:46 -0500
Message-ID: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: Fix tcp-wrappers for sshd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 21:26:09 -0000
Content-Type: text/plain

farrah rashid (2):
  tcp-wrappers: remove size_t.patch
  tcp-wrappers: add socklen_t.patch

 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 ---------------
 .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59 ++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
 3 files changed, 61 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch

-- 
1.7.4.1



