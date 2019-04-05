Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C44CC7D536
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w15so5875809wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K7GU2JCwQJUhB+owgpnc1rbL/6btrupNFJT8yBLpXq4=;
	b=N4cYx1mKRwUYOzp4FbOAkmwYMFhJ+SarP1EWtSHpVt0tEC0ayHLMm4uUEROqrc4BYP
	AoZIZxRSdCPAqF+7fC9JjAC2sx4jWQsy9tJY884aAO0k3el/aDwJuYVdOeM1qi+6XXe2
	mBQEJL3zDf4dR5uOJtVWoSuYR9Xkoj5oBg+8axCTj/noWyMIEH3cmh3F/j0VdEbo2cY7
	S8ppduAXB4uxqTcvchJj4dLnk/oq2JdjGp7nPKPMpRF4YRUl3PFqOjkx/YFcaBY+/BpO
	MX7/FyhvemMSmQSJfL3YGj4pNW9D3QoPsLNoeGTcRKUN3PqbmER/nJpbJ+20YF64iy/0
	zQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K7GU2JCwQJUhB+owgpnc1rbL/6btrupNFJT8yBLpXq4=;
	b=A9DobHQaf0nAYQbD/OpunZL8CVa+5AGR6NYB6gcFG+2Wclu0zJscd1hxfRLuYu8wkh
	wvcTxe75TfNQ7Ko8oRlPK2P5Ax06/RehAfBGEE10YrH1CsW4ddjc3GYWVdjSGxO9o+Or
	XefhndcPFkWIr/dt3InftMpsfSnwbmjm5pn5c2Vdr5Gl0alyyzDKqbYku9EDQU+VNzRa
	pdAEqBn0/rBmJVzZKLFarcWCK2JVSIDABJRUs9UBrnULZeubdpBpEjHUcnKFcLwjCNj0
	5JCKt89MK08Ml+Dj58NvWk6ygQF4yBnqHYC8345Ucs/xavqAX73K9L/NjFa3imAmtalC
	KZNQ==
X-Gm-Message-State: APjAAAWs6FPG6Vdv4UyIjoI3cilVp9vyT/pVheBbXmdWLmg3vOXQ6Hv2
	JmcZhqCmz7J7+0FvuW45Ompj1QQ3
X-Google-Smtp-Source: APXvYqwvldkn+3f51Hy5ZxL2a2bQiNcn/VrbWXiQOxZ6ZTtyqusSHlZnAeanTD69RM9P3W8YyMbnhg==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr6917480wme.62.1554446278420; 
	Thu, 04 Apr 2019 23:37:58 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:34 +0200
Message-Id: <20190405063736.29750-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] libsoup-2.4: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index ae7c1a6863..b095397ec2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -29,14 +29,6 @@ EXTRA_OEMESON_append = " -Dvapi=false"
 GTKDOC_ENABLE_FLAG = "-Ddoc=true"
 GTKDOC_DISABLE_FLAG = "-Ddoc=false"
 
-GI_ENABLE_FLAG = "-Dintrospection=true"
-GI_DISABLE_FLAG = "-Dintrospection=false"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
 
-- 
2.20.1


