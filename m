Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E15B719A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 05:53:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a136so6911672pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 22:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1p166KAW542LCOdsOrdgbGlXcNRy7ys8cFF9h+qmbzM=;
	b=bYlunk+T8Q4kMp568q/7/+CVNp2RuzkH5Fqn0DfBdoQYo2ZEdxu//dfw83+orWoRc3
	z826+xoGUnwm/aPB6y8F63deozOnNPCYyQmbhVqFrS6Nnuxcp9AzP5UqH7rwmrtMf8dS
	ExnZSrRzXxNX6FUDD3jJ+9kJta0gVAxF1dEjDDB4EObaq4jl/OeY4r71hvLpSCIxz6z0
	XNkFxjgbXjiAWYfaNTrZ/nUEQd/xKWrFI3cKM2mxXX0OjG5Df3DzR1wgT9n++k7aCNZa
	sQBy9C79f6mCdvkA0nFZfwTDWP4wUwraBc1agq/r5ElxJzLmvtYxmT/GfxZ6Id9rSS64
	jQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1p166KAW542LCOdsOrdgbGlXcNRy7ys8cFF9h+qmbzM=;
	b=Gf8iDDSDILYibCHAqdNsULRpZogxupbOKQsaDMBr6xuOXDJLh6xIkPrA1yGqRfGGkM
	Mk+4/guInxYN/hrpW679NgsVSXo4gy3pDEnNpWOXMhjwgKFmYL1IAdDAk6R7uywAQ7f9
	EsX0jPN6/Spdg0+PXVyO/Z6TBh5XzTlkufdaqhWYta1h5Q8J6d0pqy/giapJTrUPWynT
	7KI51WNKLe4T06D5jITuNOWpbgz7SBT0JqebMEO3Jr7aM5EW/LXt8Na66WYFIjleqTEv
	A5hor/HffPBOiT6pPtCCozuMYVBC7pTAj1cjxnBQ6pvT6ijqeMuNh7dZsNSRkPfG1733
	/mpA==
X-Gm-Message-State: ABUngvdn+uPQdm3UWqGNWFzcKU3TOjlAw6xi4pMog3OtcC5MKJ2MfPZ1ENJ0LIEdx2+CwA==
X-Received: by 10.99.148.26 with SMTP id m26mr19377356pge.8.1478238810351;
	Thu, 03 Nov 2016 22:53:30 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:3d81:a694:3206:326e])
	by smtp.gmail.com with ESMTPSA id
	o185sm16857784pfb.24.2016.11.03.22.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 22:53:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 22:53:27 -0700
Message-Id: <1478238808-28688-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
References: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] tzcode: update to 2016i
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
X-List-Received-Date: Fri, 04 Nov 2016 05:53:29 -0000

Changes to code

  The code should now be buildable on AmigaOS merely by setting the
  appropriate Makefile variables.  (From a patch by Carsten Larsen.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016h.bb b/meta/recipes-extended/tzcode/tzcode-native_2016i.bb
similarity index 69%
rename from meta/recipes-extended/tzcode/tzcode-native_2016h.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016i.bb
index de7d88d..9d3d5a1 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016h.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016i.bb
@@ -9,10 +9,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "00c20689d996dea4cf5b45504724ce8f"
-SRC_URI[tzcode.sha256sum] = "30e62f0b86a78fb020d378b950930da023ca31b1a58f08d8fb2066627c4d6566"
-SRC_URI[tzdata.md5sum] = "878f0ec3fd9e4026ea11dd1b649a315a"
-SRC_URI[tzdata.sha256sum] = "da1b74fc2dec2ce8b64948dafb0bfc2f923c830d421a7ae4d016226135697a64"
+SRC_URI[tzcode.md5sum] = "8fae14cba9396462955b7859cf04ba48"
+SRC_URI[tzcode.sha256sum] = "411e8adcb6288b17d6c2624fde65e7d82654ca69b813ae121504ff66f0cfba7b"
+SRC_URI[tzdata.md5sum] = "73912ecfa6a9a8048ddf2e719d9bc39d"
+SRC_URI[tzdata.sha256sum] = "b6966ec982ef64fe48cebec437096b4f57f4287519ed32dde59c86d3a1853845"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


