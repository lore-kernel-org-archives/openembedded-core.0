Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 58F6176639
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:18:05 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id q63so110045546pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DJSEgIn7Vmp0Tejq2XnBCsb+KLElwkF4S2PNWis5utg=;
	b=ZbqmEPayCVSLgT60n8AaOYDHq9guFT4MJTmJ4TTuLgOQ9R8UxqlZBWhHzH9IkCQsZe
	t+rUaC2JSWzyX7hObbBnpNWvoMDF3H7gpTCprt3ULf1WlmVdBT0u6orvOcaxaFMXWMgw
	heQDFOdEiizgeJXfTgx2eT10I6UMuDmTc8ePvzm1nTwd8jtdqF4hsMDFRN6Rsb3hb7yK
	nS8JSSh/TtEgz6Fptn8PXeaSE1TcbngnK00uLPhI8xpgaxBA+2QEgh7fHcSo/MMzAVah
	BoPy9oTK5BEXHONAFjkPxeiqxjuDyTcNl0lvGutYA94moLDV0Y5M6Xc3+pdh2oQOeP8O
	W+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DJSEgIn7Vmp0Tejq2XnBCsb+KLElwkF4S2PNWis5utg=;
	b=HQBva8GAf4nhv5JtyEWzplozP9sDn6td8paGRwFkSP2e1cZz0tgSbJeC1VrOAkwLIc
	ie4QyWucx9STtvWcSXnavxJMU+32RpAu/Z+7MrLKjsQLGxuxInounJeQpAq+ThHR7jL6
	MGuKC/h2H/lWf36bIuRZeNnB6jxbSRGcul4MI/E6dmMvjQLYIsU+6wM1qCuvIe100yJ1
	35wObQzoM2rVZiMU9etfu+TQLZkAHTmQy2+j8ObxC50EIMV205rUfpbBN3tAyaKuPbfJ
	ZzOx5Q2hlNI5127HurakwAX/YFgwbzMulJpxS2omk+WRcy0iyKHQBAO3zvsMCJjlC0tU
	5RAQ==
X-Gm-Message-State: AG10YOSrk1SscZkQTEUTVI2sS/3KU1B/LIh88xJ6MKqqASr3e0ZhMrsMp8KEgJphCyCbwQ==
X-Received: by 10.98.14.209 with SMTP id 78mr37804815pfo.157.1453853886628;
	Tue, 26 Jan 2016 16:18:06 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	v26sm4291437pfi.56.2016.01.26.16.18.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 16:18:05 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:17:58 -0800
Message-Id: <1453853878-8421-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libsoup-2.4: add glib-2.0-native dependency
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
X-List-Received-Date: Wed, 27 Jan 2016 00:18:06 -0000

Building libsoup requires glib-mkenums.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
index 5e66197..9d95d0e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 sqlite3 intltool-native"
+DEPENDS = "glib-2.0 glib-2.0-native gnutls libxml2 sqlite3 intltool-native"
 
 EXTRA_OECONF = "--disable-vala"
 
-- 
1.9.1


