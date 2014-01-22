Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9264460E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:39:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2dfTv002621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:39:41 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 18:39:41 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 10:39:47 +0800
Message-ID: <f4bf8e5e58ec486c703a3a28d1feaf71478b877f.1390358320.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390358320.git.Qi.Chen@windriver.com>
References: <cover.1390358320.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] meta-skeleton: rename busybox's bbappend file
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
X-List-Received-Date: Wed, 22 Jan 2014 02:39:40 -0000
Content-Type: text/plain

As busybox has been upgraded, rename this bbappend file to make it
match the current version of busybox.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...{busybox_1.21.1.bbappend => busybox_%.bbappend} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-skeleton/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend} (100%)

diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
similarity index 100%
rename from meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
rename to meta-skeleton/recipes-core/busybox/busybox_%.bbappend
-- 
1.7.9.5


