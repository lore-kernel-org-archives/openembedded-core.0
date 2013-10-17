Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id BF18C6CFE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:07 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so1880130lbi.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2wtyVNc3zm1DY7eN61OEnOiGHFH/NiUd55VjPbvZABE=;
	b=EQRWANkapRDJjhKiW3O46YGGI+RL3SZW0b9xuY9RpGrtnE4CMAcMMK/VJVwQi1jS0W
	7iS2sTFfKN/9J8+KyvjN5guhXI+whMny1DHvSKiSj+iaMYkDiVNZtjkdAyAoxPDELZdW
	MwQ4QuI0fB9RVg4r3slHSBdBCCbXoVSCDnLc110XudBCq4jtKkPPAL9p3aQ1U5eH2iWW
	4FUSHNCzwcmwT+XGq3M08g0gczYkwY6QxphZsGr24keF9vIbSYvkhnRTWuU3oEp66Ls1
	ALW6i0LFqSDHSQMsPOKO4nE5FMhN8Tv3XSASbo4EpfaWVCMMZZkRRs3jrpXPEo/BGeTC
	zwMQ==
X-Received: by 10.112.0.242 with SMTP id 18mr7348881lbh.18.1382018408832;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id ny3sm9367738lbb.12.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 20D9B400F8E; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:44 +0200
Message-Id: <1382018386-25389-10-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] file: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/file/file_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.15.bb b/meta/recipes-devtools/file/file_5.15.bb
index 5589efa..aecbbe5 100644
--- a/meta/recipes-devtools/file/file_5.15.bb
+++ b/meta/recipes-devtools/file/file_5.15.bb
@@ -33,4 +33,4 @@ do_install_append_class-native() {
 }
 
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


