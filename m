Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvrZv-0002BY-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:40:34 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so1464716pbb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=U4JmpQPp4WAVGIfp1KfVybnA1ADkxBXvEURM2lxTUIM=;
	b=JEoxcNHQAEU6bTDqh9YBL9njqlNYweMuLePHNj4I23haKY7pxI8CivKvO43cVMfSMW
	ZHTgCUj45PhExtPkq5hlfBTScA/rpVPUt8AzQYQ3fPD+Za+O4u/3RnLzwlijoubMUGwF
	GPwQNB2MtM4myDDz1zWDN1b/0LeQSJ7Phcrqr105sVlUYt6yAVn1oMUc7p39nnGlK4ys
	GOnbBdKJg6a2uIuLU6fU0/+L9786279eS3OHhzD0hxK1M+4CeMX8cq1W47LYfTvhjHAg
	s7hwGpoGIvFQDmeclXuWaRsjMRR6xKqxEO8inJR8oMDtLwyz2ZAvvrPeU+q5emEYISFJ
	Wdew==
X-Received: by 10.68.222.232 with SMTP id qp8mr14369503pbc.99.1358436307956;
	Thu, 17 Jan 2013 07:25:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t6sm1515237paz.11.2013.01.17.07.25.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 07:25:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:24:58 +0100
Message-Id: <1358436298-6360-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <20130117152150.GJ3067@jama>
References: <20130117152150.GJ3067@jama>
Subject: [PATCH] kernel.bbclass: don't depend on DATETIME
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
X-List-Received-Date: Thu, 17 Jan 2013 15:40:35 -0000

* http://cgit.openembedded.org/openembedded-core/commit/?id=67e77cd948c69798695d5d5f34163ef89339b35a
  moved DATETIME dependency from MODULE_TARBALL_BASE_NAME to MODULE_IMAGE_BASE_NAME
  but without copying that vardepsexclude

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 46ba55f..ce4c01a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -501,9 +501,9 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 # Don't include the DATETIME variable in the sstate package signatures
-MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-- 
1.8.1.1



