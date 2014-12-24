Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 28C31726F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 16:31:59 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id hq11so3130318vcb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=EgHqjp7o0AA/czU4D1J64n1XzzeQOCmjDaoo0rPCKtg=;
	b=k1e4Ha/sN+NyIFimaJWhKmmlKYeQ8PefzJ/r/FXo2S67LhIIxzMBpDKy2dRN0Zr2XV
	hdjOZy0FEtE0APIvUM5xV3otOXbHnE6ztg6/CN7XrROy+jC9iYF7GuiuIHUiH5Shi184
	/RziuICWrVgIwCiwy5MNEECPxUs4gvqYS4X2UQCINN7aRFRuXBRtD+yZzs40zzXAWEgV
	uYX/fsld7ZdB7WyseHnEhCTIv7XPHMh+0AmxXLs/RJT081itSze4KCJL9ajqlJvFbCQE
	Zri79pH6ehKkn2twMdjhOoy1WuyOPjp8+G/LFMWq2CIAymtR5hJpjoWktkfObSBeE/LZ
	/W+w==
X-Received: by 10.52.72.101 with SMTP id c5mr11581531vdv.59.1419438719713;
	Wed, 24 Dec 2014 08:31:59 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id ey1sm6065973vdb.23.2014.12.24.08.31.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Dec 2014 08:31:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Dec 2014 14:32:10 -0200
Message-Id: <1419438731-623-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419438731-623-1-git-send-email-otavio@ossystems.com.br>
References: <1419438731-623-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 24 Dec 2014 16:32:06 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 71b2ea9..02b107c 100644
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


