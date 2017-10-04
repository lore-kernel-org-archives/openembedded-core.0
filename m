Return-Path: <richard.rojfors@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40B466FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 19:05:20 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q132so14505079lfe.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUC4wARh2ZrX5bxUEQp3mEgDtWqJL4i46Ykq8mGMGzI=;
	b=k7sYfuxUyP6Prvgms02lAcXpEh3LhDvjvzHoQsScO78xzYCXqc2qqseJ0u1xhYD7qK
	Q6uthbPmAZhk5P6A5bjUNmjp+y5FQthzPpsQwfybr1uz0ZycGAK9nDY74GR1HzwfIflM
	VZ1icPBV6jhpa7yFrJIMwkKXDzb/1hs85/jEY4XCM1PaE5GJ8oTN0fUscqWZiWvqegS7
	PjdAKFalqAOcY1EyB1vq5obtQIt5zszd0zWoYW6jzZKpxDeEqnuGEuZUup5vHzMgG9rf
	XjlJMT300lo6SNInk4VkQfsqZR6ar4SF94VQ1+KylXHsf+ykrJNiU88XAkl3haOcvfWJ
	eJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUC4wARh2ZrX5bxUEQp3mEgDtWqJL4i46Ykq8mGMGzI=;
	b=rv4WMq0qSTzX5sWMJ9zGigxJxk+hfWVqUqCKWUcG2FH0wWDUvS08jBzSdHyGIN7oU7
	MHIxBqG3vgbdNzM3yPw65eQ7PKebtevGW9TNp3oQXbXzwr5MSUuw4a1HThYbDMAJ2wSN
	wQlD8qofAnvdmNopcd6Esij7ie0K5ilJrnJ7sr9M4uY6Vh6OI28cxJv8bAkrO2bFNVPm
	54ddEG4ul5j+wpVjye0chI+cILsBJ9AnJQFgHbnupPEUYZ28ztnA5hzpNXb77/ugjhUf
	CTD9UMxz+S0hSAXdYs1cX80uhUSW7xJq+hnyaE558foeDs2nkXm7hwmaJrK0M2Hhb3rR
	w2TA==
X-Gm-Message-State: AMCzsaUorhP5rMrD2SgkLyWxxTrKLkCUEcVxfz7IR4GYvSpI0IpiL5iz
	TGOI0GIAc2BBd/HoT8h6AIudKw==
X-Google-Smtp-Source: AOwi7QBEO3/DCKHz8JEML3heuggwfkGXCJ878XTFZBNXi3uQ4OV6xfFT738Np3JcVQ7kQmO9ymaI2Q==
X-Received: by 10.25.84.7 with SMTP id i7mr7307549lfb.24.1507143921460;
	Wed, 04 Oct 2017 12:05:21 -0700 (PDT)
Received: from localhost.localdomain (2-249-150-218-no288.tbcn.telia.com.
	[2.249.150.218])
	by smtp.gmail.com with ESMTPSA id x6sm1338161lfi.81.2017.10.04.12.05.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 12:05:20 -0700 (PDT)
From: "=?UTF-8?q?Richard=20R=C3=B6jfors?=" <richard.rojfors@gmail.com>
X-Google-Original-From: =?UTF-8?q?Richard=20R=C3=B6jfors?=
	<richard@puffinpack.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 21:05:13 +0200
Message-Id: <20171004190513.13405-1-richard@puffinpack.se>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] connman: Add connman-wait-online to systemd packages
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
X-List-Received-Date: Wed, 04 Oct 2017 19:05:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Röjfors <richard.rojfors@gmail.com>

It was missing, causing systemd to not install
the service correctly.

Signed-off-by Richard Röjfors <richard@puffinpack.se>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6c8f405a8a..09cc362a9c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -58,7 +58,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 python __anonymous () {
-    systemd_packages = "${PN}"
+    systemd_packages = "${PN} ${PN}-wait-online"
     pkgconfig = d.getVar('PACKAGECONFIG')
     if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
         systemd_packages += " ${PN}-vpn"
-- 
2.11.0


