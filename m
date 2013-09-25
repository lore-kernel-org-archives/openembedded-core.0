Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 26D976CA93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 11:52:37 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gx14so4820492lab.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EsYbUdVcYVgNFydUHAHjoOAAceDcRpYl1tPB4mT+9V8=;
	b=jvSBf8s6DKM1mb6MdnG4JrXK0eJ6HpMDQjkUKiYiw5jYibFI/tE8cLjscJy4fRpVH0
	5q09CoZvpUd9L/XB860SWOimQ6naJaogSYXwME0SaGFtn4An8wErq4Oz2P6KbgA7tFGg
	qFTG08iiL2prQQ2RwOt8lsTd5jFUKuaUvgMbtiQ/IgYH44geuY2l6v4lhm4ejReKTxDu
	1TOlXRoxHypMbd7q8DfR+33FFP5YtZrMacF8QGtOiR/6KVxlreJnwpJJymxiwnFPUhD4
	A7RIY1igu1AcF6/4SzgNBCx2Ex8PpKV/uJRiZpyXa4ydAOK+eaZ5E5mWOzrJhJBMu0hh
	Hm2Q==
X-Received: by 10.112.210.136 with SMTP id mu8mr15352093lbc.25.1380109959150; 
	Wed, 25 Sep 2013 04:52:39 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id vx8sm18700103lbb.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 25 Sep 2013 04:52:34 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 294184003E6; Wed, 25 Sep 2013 13:52:30 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 13:52:23 +0200
Message-Id: <1380109943-11869-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1380109943-11869-1-git-send-email-david.nystrom@enea.com>
References: <1380109943-11869-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nativesdk-packagegroup-sdk-host: Add nativesdk-shadow
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
X-List-Received-Date: Wed, 25 Sep 2013 11:52:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add useradd, groupadd et.c. since all target packages
which inherits useradd will have a postinstall hook
dependecy against the yocto specific groupadd.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 84fb95d..95f98c8 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -20,6 +20,7 @@ RDEPENDS_${PN} = "\
     nativesdk-libtool \
     nativesdk-autoconf \
     nativesdk-automake \
+    nativesdk-shadow \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.8.3.2


