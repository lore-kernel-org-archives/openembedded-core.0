Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SugfD-00005c-Eo
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 11:16:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6R95BFK003559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 02:05:11 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 27 Jul 2012 02:05:11 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 17:03:51 +0800
Message-ID: <1343379832-13421-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <5010AE26.5010908@windriver.com>
References: <5010AE26.5010908@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] busybox: udhcpc shouldn't be a service
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
X-List-Received-Date: Fri, 27 Jul 2012 09:16:56 -0000
Content-Type: text/plain

Fixed Bug 2840 - busybox: udhcpc misbehavior when "ip=dhcp".

Jesse Zhang (1):
  busybox: udhcpc shouldn't be a service

 meta/recipes-core/busybox/busybox.inc          |    6 +---
 meta/recipes-core/busybox/busybox_1.19.4.bb    |    3 +-
 meta/recipes-core/busybox/files/busybox-udhcpc |   25 ------------------------
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100755 meta/recipes-core/busybox/files/busybox-udhcpc

-- 
1.7.7



