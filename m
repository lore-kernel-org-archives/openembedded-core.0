Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id CE6006110D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 16:34:16 +0000 (UTC)
Received: by mail-bk0-f50.google.com with SMTP id mz11so1314451bkb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7G+oNDxpbU4QXcJzP7GJXV2dPVZS3pEOX6JE9nP+TBY=;
	b=OMlHeDfLt9eYgwtenlJGik2nO1b7ekiW9l1QKacHWvImYYYlLimKnMC74yKtBDlzkg
	52sK4qxGMqJ2y/F/z6nUbVk5tmCCy9CMROidtgNBZ8Ku9GVX7VkcnNobe9AoInQBGljg
	gbUO9naI3hFZrSAd9M2V1zpjB7QCBRBPA5vQnjzjnm9wri/3SxaJKwV2Tg/E80EQK39f
	odrf08OTdR/+H+yUC9sS+YYV3fnGJNC/ZW28b3w9tBDM2ubzLAPfYPAzKARmPFDLbB8L
	M7R2Mx6iEUJV24bZHoWAerIR9BqA9scFmhZ0vJ3z7RJBv5p0CCBHq5eIWZSpRDTfrVtD
	qWyg==
X-Received: by 10.205.78.5 with SMTP id zk5mr18672101bkb.25.1379954057995;
	Mon, 23 Sep 2013 09:34:17 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id zl3sm9055248bkb.4.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 09:34:15 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 83CAF400370; Mon, 23 Sep 2013 18:34:05 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 18:34:01 +0200
Message-Id: <1379954041-5575-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2] libpam: Avoid host contamination issue w. libprelude
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
X-List-Received-Date: Mon, 23 Sep 2013 16:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since we dont use prelude in OE, we just disable autodetection of
prelude in the libpam configuration.

Seems like an old bug: 
http://lists.openembedded.org/pipermail/openembedded-devel/2012-March/083804.html

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index f7493c5..c9bdcb0 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -37,7 +37,8 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
                 --libdir=${base_libdir} \
                 --disable-nis \
-                --disable-regenerate-docu"
+                --disable-regenerate-docu \
+		--disable-prelude"
 
 CFLAGS_append = " -fPIC "
 
-- 
1.8.3.2


