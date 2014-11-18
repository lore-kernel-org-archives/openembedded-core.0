Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0420772154
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:19:10 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id hz1so13550721pad.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QsazCgemL9xMWs5oaI7YPO93ELm5w5fG5KGyEXOlDJs=;
	b=oqvowLs4FdJyQYPwY5vt6BUX7EkMl8RiN8PdGH/eiqp0QsngsyNzNb0Bj993Fvx45U
	LAxoDwASF1cVmiGrxeU3YvWYOpjXUdY16337KOqEjg20gvqQvGyRJ8dXEPEthGiqthpp
	noMhWi1OXtZUB7053U8WixY5VhWx+tmw9tpq0ymst6jFRBEXqHpOBUn+D4AYE7p7/Sry
	uIQG7DyM4AIfXHLGA6xi2GAq6pOrX3YWwPifUa/cxV0ZU+/dKyRhtmRnq9WYqgbaA3vj
	I5Y388SgG5IE57qpb30alxjuL0Og+mIkG242zLsiyYteSmSJPT3qOAYSJaanr2ySA9ga
	ZwcQ==
X-Received: by 10.66.184.111 with SMTP id et15mr37458667pac.58.1416327551482; 
	Tue, 18 Nov 2014 08:19:11 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.19.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:19:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:30 -0800
Message-Id: <c8aa0e24a8effe759f5537040998f4c7ad630624.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
Subject: [PATCH 5/6] tzcode: update to 2014j
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
X-List-Received-Date: Tue, 18 Nov 2014 16:19:11 -0000

(From OE-Core rev: 2f8940e8b2a0537f131a6d5410e85bba07a8c116)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014j.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
new file mode 100644
index 0000000..b76aa33
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014j.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "970119e9765bc5a9320368851c91ecb6"
+SRC_URI[tzcode.sha256sum] = "7fd46125464856309fc81fe85a67a61de862b8ab884ce8ca82051f5fa308ede2"
+SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
+SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
+require tzcode-native.inc
-- 
1.9.1


