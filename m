Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B653C703EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1pQxw025024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:51:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 18:51:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 18:51:24 -0700
Message-ID: <5395ca078ee29369d9337f7e5d061870d9b95f96.1405043280.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405043280.git.liezhi.yang@windriver.com>
References: <cover.1405043280.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] file: remove dump and filesystems
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
X-List-Received-Date: Fri, 11 Jul 2014 01:51:28 -0000
Content-Type: text/plain

I can't find the reason from the log why we need them, and they are out
of date, so remove them, then file would use the one from its package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/file/file/dump        |   81 ---
 meta/recipes-devtools/file/file/filesystems |  812 ---------------------------
 meta/recipes-devtools/file/file_5.18.bb     |    8 -
 3 files changed, 901 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/dump
 delete mode 100644 meta/recipes-devtools/file/file/filesystems

