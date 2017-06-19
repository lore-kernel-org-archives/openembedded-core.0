Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F402780BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:12:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 70so16983415wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vgqSXdrre+CeLq+ondfTTBnXmlh8EcIhsaMX42w+cT4=;
	b=vYgTqu0TuctzlGDPQh8lQ1keE1tqM8gZb0slcm5zBxMYQVRdotYVG+4AU29l6kAHFv
	sRpdWULqF6QJXLrdyYUcMKOHlDq8vCW3yUHJNRAlQr47LTqhNd3m/ZNu3QB5lPiwM09y
	9c+QQa5Y6y0q1br9i2QoT4G77DWx+ZXBKoXVVihFYxtE/wHoe1q3QQVe3GlxhJpDlySk
	x1wG+Yl5ouhQSwB7M7lShhzat+U7N5Y7BX2Km4VHNszFZ5NG6tI/lCkSyhVGDkfZc5ZC
	sNMtxaYQJRxhL9KBVRDPfWKgzmlT581yIvX3VYf4JbgtIjO+NiZS4DhgirLMZp7pz8LA
	FuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vgqSXdrre+CeLq+ondfTTBnXmlh8EcIhsaMX42w+cT4=;
	b=OMM7he/hRmOj5qiQz0Fx3/W9FQi5ZFfFJmsrkrP3Cxr3q3LmV7k71znU+D1SLUBqT2
	r7bpLbragwevLVtAPKYRCPHqtAyuQtv519gwwsMWudMA13OoTEyEzVH4rUnfFSPsBvwS
	xyC47bFhKQADvAv02zAadEBibIScGHTXguvFDv9QCqlvw95Ul/CdWT9gTjcGedRcMhsx
	irXFAK1IzBELuao+fdj2ud/hHi+RXhO9uZ1QwCSknOTgX18ntWbux7+8uGrfpjMK79z1
	vrrwYCWutFTDDUBzQKw7DEu9GO3jLTn96wUcd+pF7LC/+U/M585CFpJVcx7AjhpnW66q
	YhBQ==
X-Gm-Message-State: AKS2vOzY6cfsrsb+7HIOexK66MRG1Ix3igbhHgknLLXyGhTRpOtCUk6o
	y+4ioeVBuPeERak7yVo=
X-Received: by 10.28.137.206 with SMTP id l197mr14969044wmd.41.1497885168885; 
	Mon, 19 Jun 2017 08:12:48 -0700 (PDT)
Received: from zeelaptop.luxoft.com (h-79-136-12-196.NA.cust.bahnhof.se.
	[79.136.12.196])
	by smtp.gmail.com with ESMTPSA id c55sm7996108wrc.7.2017.06.19.08.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:12:48 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 17:12:08 +0200
Message-Id: <20170619151210.7692-3-zeenix@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170619151210.7692-1-zeenix@gmail.com>
References: <20170619151210.7692-1-zeenix@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/4] masterimage.py: rename parameter "params" in start() to "extra_bootparams"
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
X-List-Received-Date: Mon, 19 Jun 2017 15:12:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

This matches how it is called, and how it is named in qmeu target.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 4525408..bc783bd 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -143,7 +143,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
     def _deploy(self):
         pass
 
-    def start(self, params=None):
+    def start(self, extra_bootparams=None):
         bb.plain("%s - boot test image on target" % self.pn)
         self._start()
         # set the ssh object for the target/test image
-- 
2.9.4


