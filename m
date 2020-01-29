Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id F12A06028E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:32:35 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f129so4487412wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7pej/efZKBj4aYQBEy8rNRTrdyIElREYFlVCp28coGc=;
	b=OPOLE7zhTINYwLMMJhvolIULZHpmKVcshnzeT9iwYNdgByTF+fsqoxajOky0ajMfIs
	exoO8NiE+R21cvh/0QXQ2lNfEBzX5lA9COi06vW4qj9rm+tzlZo1UsPN5oZaTwqlVIhn
	sOQ/fj2ar9NFD3DPaAYqORkeUX+4TgEqYBE+z5zaMQrAUG1sTfHfV6xFMVV8a3TK8AuS
	AEL+OVQ3Y6d76cDw7KLJAeJkJfsdEA6/H3J2MoZbNuZ41GETes0MZ9VIXQBD6+IF9Lq2
	BDNQ3Gp6gAHMZvkqlj+2AietDXTJ3JRmgK2cf2TRwkYeIlsUvY6WS6ZRDB05aEHrA+zi
	JJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7pej/efZKBj4aYQBEy8rNRTrdyIElREYFlVCp28coGc=;
	b=TeeNHPdh7oclJg3NFofJiaSGp1q7F+0B5Hl8FWOyrP0xs2D6Z1QgpH25hqbTrgAu74
	IXdV1D8QvHKsPbP5h47BwO+JVcGszRxJuIFKt/n2kNl1sBGOwA6Kq8/o7Ohw/2cHs0jy
	rb7+WbmxcqvwyG2NtfcqL8Gw4JDyXJ4U9S6SnNHqWiPOD0KuSkUAYibw9ffCXfzenGLt
	v08Dsq1fFLoXKW+oSXX6tybdfZRj92Zo02k7CIWLKLoBBOkCM46m2kX9Vp5w4Mxb2yYf
	yGTfR7kUqneBZqCnIOfUPp8FhSsdQ7+edgRjQo7s02P4z/xScaTU+KVzBv6pj6qmNMWY
	B3JA==
X-Gm-Message-State: APjAAAVeewt3Gd8TgzPuQw5nXsp6eE+mqlrqPmwPZYbi1I4N178fmKou
	madIpHNh5oIvoDAzr34FkXznV9HU
X-Google-Smtp-Source: APXvYqzS8GamxqiRNDPDubm2H+gaQOOJ4ZxK1EG8+4VP4yrl11DM/RRky7Kj1nNipNDD+wKcRSIRLQ==
X-Received: by 2002:a05:600c:2150:: with SMTP id
	v16mr10069360wml.156.1580288892496; 
	Wed, 29 Jan 2020 01:08:12 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:22 +0100
Message-Id: <20200129090738.1398-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/24] socat: upgrade 1.7.3.3 -> 1.7.3.4
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
X-List-Received-Date: Thu, 30 Jan 2020 14:32:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../socat/{socat_1.7.3.3.bb => socat_1.7.3.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.3.bb => socat_1.7.3.4.bb} (92%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb b/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
similarity index 92%
rename from meta/recipes-connectivity/socat/socat_1.7.3.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.3.4.bb
index ee01578c1aa..9b0d4071acd 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "b2a032a47b8b89a18485697fa975154f"
-SRC_URI[sha256sum] = "0dd63ffe498168a4aac41d307594c5076ff307aa0ac04b141f8f1cec6594d04a"
+SRC_URI[md5sum] = "3cca4f8cd9d2d1caabd9cc099451bac9"
+SRC_URI[sha256sum] = "972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc"
 
 inherit autotools
 
-- 
2.25.0


