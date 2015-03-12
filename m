Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 245ED7399F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 00:27:49 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so4366047iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 17:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XXgd2IhaZn0ATJzf0l5H4dHIAgNeWqeDyxj+QQ+hJGA=;
	b=KIQEz6FPmHm4f28TR3wHjES56nGRg7DYKV3Awu7ldlcLVE9UC80/o31DW+HFQskM4C
	EryxW7dcq3odeMm9ZjvKM4REdlCRryNuJTSQxusYfPsxywosmvqJ4fACyQaofc3wf9Cl
	PgQ4CYEQG86TcMoc6GQ6BvknsmHeyO9gwJ+9p/+1jQ0pLulaCUom3KGFiMpkGRFYP06R
	TqQAnllV5guHUXeGMoI7KxPsx+1ev2vmZHZqqheEVe98d5kteT6ehdky71w1oe252CIm
	V8hq44NKUuGwP/6h0Ff9z9zJkxFaXDK+IwZB5xR7kWr2pWLyZIvkzCSpU87+V+VMMKIr
	CaDA==
X-Received: by 10.50.79.229 with SMTP id m5mr95492494igx.23.1426120068312;
	Wed, 11 Mar 2015 17:27:48 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id g74sm3425171ioi.42.2015.03.11.17.27.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Mar 2015 17:27:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 17:27:38 -0700
Message-Id: <1426120058-1776-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: remove samba from PACKAGECONFIG[smb] DEPENDS
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
X-List-Received-Date: Thu, 12 Mar 2015 00:27:50 -0000

Enabling support for the smb protocol does not create
a build time dependency on samba.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
index d4b4ee3..4cde9c6 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,samba"
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
 
 EXTRA_OECONF = "--without-libidn \
                 --enable-crypto-auth \
-- 
1.9.1


