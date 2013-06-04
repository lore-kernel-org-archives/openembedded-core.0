Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 91B6C6A54E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 19:31:48 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so575231wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AUIKThYFDFX2Tm+v0+G6A8tilWPjf7C+hGYENRwr2R8=;
	b=KVffJhjYCGBOUqOsezKeU+N8w9MSdEjPj689dHh1241vr5xb6+3/QIY7av9eHs0cef
	dbpc7s8g1vopbOmdGWCH7wpOw+vKHTWo+ysP4zKcV6mxIaxrBw79w2we0+2ib/CXI+CK
	5o7ype/xIVHT99bdvmDI0KcxI47aXZdRe111PqSN/lMjglExMQwlN2BoDLLtAqSdahuQ
	+8zormT6zGewMpDwSJPVidUuvMaXpVD9+gqHcj3DaRlmg4FmmppASWfbxoy2uMYgDfg8
	OYcGWWSy6fs/D3m/KpROujAgdI59PbCbmOs1KSDSdmOMkKDNr7gUhxnkKIE9BEElLRVo
	xMTA==
X-Received: by 10.194.157.165 with SMTP id wn5mr25512798wjb.15.1370374307392; 
	Tue, 04 Jun 2013 12:31:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id d5sm4901879wic.1.2013.06.04.12.31.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 12:31:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2013 21:32:01 +0200
Message-Id: <1370374321-13624-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] site: add alignment values for at-spi2-core
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
X-List-Received-Date: Tue, 04 Jun 2013 19:31:50 -0000

* x86 and x86_64 values were added in
  8c46ec2edc0197b32d32e0f27d5b60271338b600

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/site/arm-common | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index cad8027..b1cf05d 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -185,3 +185,13 @@ jm_cv_func_working_readdir=yes
 
 # evolution-data-server
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
+# dbind, in at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
-- 
1.8.2.1


