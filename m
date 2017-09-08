Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65F9A78237
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:16 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id v82so1902714pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MAFHri7Z3Gi85f3qAe5IQEpq10Jywg41+LdDIE4ianA=;
	b=QLlY+pQ5XX/JLPvTVP38Uu9FDzHtEYk+zOJe8kXRbMrWXHIEr4YuxRdHjMW+NWZY7V
	fSkHQSc8JuYeCKf1FwrdIYTjwhzu28fXNVyoJxvzJnL0+vYPdmc+J/+49fiRfunSZka3
	weBU7DoyGPJytB493XXoeA+Z3xipS8fWtvyxdScsfXRDTlmPTr3XmZxmbQTFr/5Qp4y7
	UOkPYe8d849xaEHUUGNYmJfpGaytzlM1WRsh6oqeUjg184pFN7ln4KQcU3/1TjndaLU1
	NEu9/Ub6AYVG8g9CueHK2/VHjW6XjAE3JHYeURghkLiSVz5S73yK36TBarN7pEFQwj3I
	o5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MAFHri7Z3Gi85f3qAe5IQEpq10Jywg41+LdDIE4ianA=;
	b=WUQI6MEmTk0BhvbNduHc2z6x5h1tLMa5QvKz55QncMV++2aY2JGz6trr8rJoNBetb/
	EPVVYI7duXYK0n6Auaf5a7sXfyIx/I3l7zuBXfq2MFCsUSlX8sgkLYrYXHCpy69Cbbmv
	5TdNFzRa7I78uqBr/YoYh55UYpkMvIaN7bXRUUZJ4nXuhOenru03lELz4U8UI5WJFHUA
	EEyq5vRqhciXhaFwHtOWVJjttbS3/IWRNCQ1jPPX+nCr0XNQSxXHWdnbqJ8iFx8v5+Ec
	PqAJsswqNGDzxyH5pejTBK5FYw1gBxN8qSzgk5aCci+RJR12Et5SiBwL+CMOifF/cOhx
	DUWA==
X-Gm-Message-State: AHPjjUg2X7xuap0nAV2LKo5C1o1k0yqsiHS7IbHeY7a0Qc61cWwC37ij
	cJkfZZfMC58GbY6r
X-Google-Smtp-Source: ADKCNb6Pzz6ws3sAfFGblcCWza/bG/omO3wx2efMJMXripoxaTROGSG37Wv9WubvyRYZrvq50SixfA==
X-Received: by 10.84.215.9 with SMTP id k9mr5178950pli.25.1504912937698;
	Fri, 08 Sep 2017 16:22:17 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:41 -0700
Message-Id: <1504912911-23120-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 05/15] mailx: fix SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:16 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The old one is not available any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 3569d434e754a62ec998fbf48380d653d1524dc4)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/mailx/mailx_12.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index cc0b6bf..77e2607 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 DEPENDS = "openssl"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5.orig.tar.gz;name=archive \
+           https://launchpad.net/ubuntu/+archive/primary/+files/heirloom-mailx_12.5-1.diff.gz;name=patch \
            file://explicitly.disable.krb5.support.patch \
           "
 
-- 
1.9.1


