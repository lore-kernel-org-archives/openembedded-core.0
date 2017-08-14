Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2A44C7846F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 21:20:32 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i19so10780300qte.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=lHvitBCmZcJPzp2xVtGIk7gSDGeThaXETjCrQqgoukg=;
	b=LN4Z1pyWu7dngK2ibB7LHwZtqvtA0ul9cykwGiEUU2TNKZDdQzawaeNwpdZznyy5X7
	J//SDMIzF7dyOCmUEH91Cz8a4aPM5tM1MRDlszUR9fTmSJ9qvN3IYtzNPD1VWxk+3vqk
	WpYPGv6VchLWzv/9vSdIhggP2UmFYFROHXAIkvV57ACKwrRi2s4sTRUqcRPEzQPYP0Dt
	prl5UA4ZKt0zMm+XVaWzNmXZlHzpimUX7laAC9953yNYfHkGUDaVWMethKHj1dpyXBMQ
	KIwT7WqtmA671NmfjBCnHfzYt8vWanTgwlBOTUMN370Hmp1ekz3ujmHMi2JerLSXrMrO
	nEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=lHvitBCmZcJPzp2xVtGIk7gSDGeThaXETjCrQqgoukg=;
	b=S8LpFY6b8HpfWpicJDVgpCebvYOVXgn9V+uhn7Iv1jvTQUhj5focqe3ldbOnuvQ/8r
	+/bCBQh+QtOIU9pX0hwmsAX85sPpi13bmEu6xwTeERlfSQfZ7pv5pw29Z5fd88epIWr+
	m1J/N5JOlGCYHqO5yYzyY5RJA4+ouqU6n/Ct6uXhIrgErZ3iK4KviNtonQD6auCJCYIQ
	oVxKKuxq7q5W0cyuUItFFldgMDd/RfR11G2If8Gv6FbISHnXmC8AHpVahTvE4pCKHG5G
	BNr7Y6XNZaV9gUG2oWqHmsPZ1LRFGc1TJpPDew1qDtGNDSuQ+5JXCRG5QnJxwJ+FKoRr
	YnEA==
X-Gm-Message-State: AHYfb5jGKEjbDLZqgwNypF2YDE7rAElH7Mb45ZFRmgL6g7o8MMJfPI27
	rsjrTWQ6brdMkarqj7w=
X-Received: by 10.200.3.171 with SMTP id t43mr34038442qtg.232.1502745632722;
	Mon, 14 Aug 2017 14:20:32 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	j19sm6047552qta.80.2017.08.14.14.20.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 14:20:31 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 18:20:04 -0300
Message-Id: <20170814212004.14019-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libarchive: Remove xz packageconfig --with-lzmadec option
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
X-List-Received-Date: Mon, 14 Aug 2017 21:20:33 -0000

--with-lzmadec option was removed in libarchive commit:
30e1b7efd472e0439bea14df6a2d19cd8b5ac15e

See Github PR: https://github.com/libarchive/libarchive/pull/806

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-extended/libarchive/libarchive_3.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 9bf40f2609..5c3895e547 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
 PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,${DEPENDS_BZIP2},"
-PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzma,xz,"
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
-- 
2.11.0


