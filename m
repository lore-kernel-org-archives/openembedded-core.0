Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9486A8C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:41:53 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z11so353395wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=QHtTsHuLj5jMG2lzGNozkVon2x460/LpDiNfPvNP/W0=;
	b=gXtppnoeMMYyIk87G4ZCviH/4o+4iq13Dj+1sCtAbI0hZt+qTBCtwt4XU9Crn8GVzT
	H/PWb7/YLjfYYhf56I9m16ebqpx0M79GKqVrmwyZiS/y2ttNUbYxqAQFUtYtVAYLG4Jc
	kvPd+ACuyeisKaVwmsFctVcUvfZLt2xk7Mtw5n1StTqmpNLI8iJ6luSGHRDafe+0xl5g
	pQZZlOopqNaBb9FgTw3v5dS1ygcvzh55X5d50vtJuMdpK9TxbwqTBFEL8UyZcZxKj5Id
	A2ki8oRJFiKYb/C+RGXRKzZOOvfAHJYc52cnWdrRgfSbhgbOLeuWApYsJVBAAluDSAKs
	Ppow==
X-Received: by 10.194.170.168 with SMTP id an8mr6337715wjc.72.1371746514136;
	Thu, 20 Jun 2013 09:41:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm17302497wic.8.2013.06.20.09.41.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:41:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:38:23 +0100
Message-Id: <1371746304-16785-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371746304-16785-1-git-send-email-ross.burton@intel.com>
References: <1371746304-16785-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmYUwalLypASNUVI1b6IovLMFoDIepUUA/3ONdXA8sNsDCplzqfARNx/FVau2UfCC05zJIj
Subject: [PATCH 1/2] libpam: fix whitespace in shell function
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
X-List-Received-Date: Thu, 20 Jun 2013 16:41:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 94101d4..96133c3 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -96,6 +96,6 @@ do_install() {
 	install -d ${D}${sysconfdir}/pam.d/     
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
 
-    # The lsb requires unix_chkpwd has setuid permission
-    chmod 4755 ${D}${sbindir}/unix_chkpwd
+	# The lsb requires unix_chkpwd has setuid permission
+	chmod 4755 ${D}${sbindir}/unix_chkpwd
 }
-- 
1.7.10.4


