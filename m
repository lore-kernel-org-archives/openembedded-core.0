Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 045AC7204D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 20:15:56 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so5635323wiw.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eyIfyfnn8OQDGJtVSOPjd7ZJ5gDcfn8NPn7qOxkitG0=;
	b=lkHqK9X+b80vPOLuanBFDHbtE1q1SnyMgbbcakiSkWOY0rtJJp2//95fnQyQZuBcti
	KFD/HLN+uB35i+KBT0jRjIopVTV50sqd6D6Hcry78IsBDa3OzIjLYu6WJ6zGdhU/ZYXf
	MUQkXhbUPbXQU6+BoS/f0qLQFKIIRR7L4QRxsExfWmKTztq6YT4wGxoGvsI2Fx6KFWNx
	Fv2Wbdz4I1X9HjxiT9L9bz5/qvolLN0u7BArvTqe9YixUOPEQXFlGFr9yNufPZK2dgjb
	8wt4amvRU/AhTkyZHx+vKv6jJns7vMg+YQNWxCI4qBJVNCr88XAAkVdZjF9qPx9IIsfm
	HA8A==
X-Received: by 10.180.85.6 with SMTP id d6mr18843587wiz.82.1416082556815;
	Sat, 15 Nov 2014 12:15:56 -0800 (PST)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id s2sm8266290wia.3.2014.11.15.12.15.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Nov 2014 12:15:56 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 20:15:43 +0000
Message-Id: <1416082543-7559-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
References: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 3/3] opkg-utils: Update SRCREV
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
X-List-Received-Date: Sat, 15 Nov 2014 20:15:58 -0000

A bug in the opkg-show-deps script is fixed.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 72dc98e..6fa54d6 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "762d9dadce548108d4204c2113461a7dd6f57e60"
+SRCREV = "127b371319974b0c585969c234f85b2d5c860e34"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
2.1.3


