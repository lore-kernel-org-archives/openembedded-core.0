Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5188C72325
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 21:08:12 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id i50so1104140qgf.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 13:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=1DJzmt2QwmMIfYYCLC1+OngxSZJ3pZdG+NcgI91Ui3c=;
	b=FTkrb0Tjk545URXL019yfTvWGgIeQ17k26xpKmAmMmPBMy2hDQr4fYsA4IkgqkASKn
	vT3eAG+Xpw3k8pX2e+6tb5+eNxXJKV2Y4d89hT3FSBjOA2EA8yVn0fcReGBScI1Ru78l
	C25GGUJEn258N0mcsnnHhMb5cwykPFDu20JGaCf5kybooiCqeIQDU55E/H3UpHybd2/U
	+b5EdX2t477jeVzGcK6eCBC8u20QX20BynYvEM5PA7mRuCkF8KVB42Hi6FtWzUwgL9Y7
	WlI2qPsGfpTUUYHwUCXgeZKFnkXshIEUDYFYnuyKFRUdEKPHjsllwX2qDit2tnuqo7kb
	DcMA==
X-Received: by 10.224.37.5 with SMTP id v5mr946839qad.25.1418159292684;
	Tue, 09 Dec 2014 13:08:12 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id d7sm2187042qar.27.2014.12.09.13.08.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Dec 2014 13:08:11 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Dec 2014 19:07:56 -0200
Message-Id: <1418159277-3620-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
References: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] image_types.bbclass: Rework code to map types for 'ext3'
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
X-List-Received-Date: Tue, 09 Dec 2014 21:08:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 24e4bbb..811fe33 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type == "vmdk" or type == "live" or type == "iso" or type == "hddimg":
+        if type in ["vmdk", "live", "iso", "hddimg"]:
             type = "ext3"
         basetype = type
         for ctype in ctypes:
-- 
2.1.3


