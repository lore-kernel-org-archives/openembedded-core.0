Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7200C60D67
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 19:38:08 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id a41so3111218yho.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 May 2014 12:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=7kHdOT/r+dlGTe7gQWTSL55Oswb5fAf8fX37B9+rC64=;
	b=JQzwijmzWaUPZxiE9i6MK7zlVC4zYnKrHM3gNWYvJOChO8h5f8MjLKcz47hoTZ7OsT
	DnBZoR0iX/qJ7a32Q6zWbJDOiI+9t37CR5W6kkXUZYJRbqSdr91bWHrqAWsQ3HyY3Kyv
	9hoE48m4XXiIWHPAh4rQrsA+nT3z6pSoVUrPcL4+PDaBnPpI8AI3wBQIQdbIGkhq2gDE
	x2BrY8bpOUPNlWTLSwEhjgckiHUmTirmOGWVGYPIyWUB2ba8/QrM5nIRuiQQ0UM5EnoS
	xxKH3fdpZ4p6+7YVtcENW/xGsDkWkvpMpAeXFheoa5LvOt1jK846P6hxbOhd+7EnIluf
	D1yw==
X-Received: by 10.236.166.169 with SMTP id g29mr17300634yhl.135.1398973089715; 
	Thu, 01 May 2014 12:38:09 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	x37sm13686258yhn.39.2014.05.01.12.38.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 May 2014 12:38:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 7B7A51A923039; Thu,  1 May 2014 16:38:05 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  1 May 2014 16:38:04 -0300
Message-Id: <1398973084-16849-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] sanity: Bump BitBake minimal version to 1.23.0
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
X-List-Received-Date: Thu, 01 May 2014 19:38:09 -0000

The metadata started using the bb.utils.contains_any which has been
add in the BitBake 1.23.0 release, set this as the minimal version to
ensure parsing compatibility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 940db33..b028026 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.21.1"
+BB_MIN_VERSION = "1.23.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.0.0.rc0


