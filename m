Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SyZn1-0007c1-Vy
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 04:45:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q772XCeK019217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 19:33:12 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 6 Aug 2012 19:33:12 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2012 10:31:56 +0800
Message-ID: <1344306717-6352-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Subject: [PATCH] fix mklibs error for 64bit targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 02:45:00 -0000
Content-Type: text/plain

mklibs should be passed a --libdir option, in order for it to work with 64bit
targets.

Jesse Zhang (1):
  image-mklibs: pass correct libdir to mklibs

 meta/classes/image-mklibs.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.7.6



