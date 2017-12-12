Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E45676612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 01:48:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBC1mAPc018677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:48:10 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Dec 2017 17:48:09 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dengke.du@windriver.com>
Date: Tue, 12 Dec 2017 09:46:22 +0800
Message-ID: <1513043183-22417-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH V2] avahi: upgrade to 0.7
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
X-List-Received-Date: Tue, 12 Dec 2017 01:48:10 -0000
Content-Type: text/plain

Change from V1:

Remove PACKAGECONFIG for pygtk to fix QA warning:
QA Issue: avahi: configure was passed unrecognised options: --disable-pygtk [unknown-configure-option]

Dengke Du (1):
  avahi: upgrade to 0.7

 .../avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb}  |  6 ++---
 meta/recipes-connectivity/avahi/avahi.inc          | 14 +++-------
 .../avahi/{avahi_0.6.32.bb => avahi_0.7.bb}        |  6 ++---
 ...c-install-GtkBuilder-interface-files-for-.patch | 29 ---------------------
 .../files/avahi-fix-resource-unavaiable.patch      | 30 ----------------------
 5 files changed, 8 insertions(+), 77 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb} (89%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.32.bb => avahi_0.7.bb} (78%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch

-- 
2.7.4


