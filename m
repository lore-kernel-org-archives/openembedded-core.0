Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA707D10D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z24so788613wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u0KKo65Boh40/g16HeyZboNGj9OjxUvO05taACFtupo=;
	b=Jm0KNxrDOkMQfYpnW699K7+mvIeqblUtBMPUt5N/gtlZ+qMDkxfCQD/QzraNHEN+Td
	WZudALNa/OE5i1pckYjTNOtc20EB6gBvkgwpRv8MU4/ECj6LK3cy8lRKPKYd/D2WhBu5
	lSh5QniwOiCvKLaHCS51jnGOO4Tlny7ItOEFEN8abIuHLiUzH6OxqG7NqDtKiC7LxmeQ
	uNCgoaaWaeFfmRCT1DnechPyxSDDN10uTlsZyFEmJFfashlEv45q3x8mg6iBgMoZY2pr
	zZl+yB+qVVr8Q4ZGQKtXVak41ztgup81BrsOhhjI36CCWOanWJNF/QCwEFfxQmwTFe1M
	ejDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u0KKo65Boh40/g16HeyZboNGj9OjxUvO05taACFtupo=;
	b=f6BzHliowXf4S2aCXXPssmG/UoFUs/y/gqLGJDVQqeP7Nu4BLMs7TCp7KGDUcR4rGi
	gq2jA1GCtOCwy1KDBj163LKEl59+VXRCjqDZw31KHj1BQ/QbqY3N+u9Q9TzjlmuQSKEe
	VsT58VC7wLOBa2zvPN7AOcXX0gYbmQGZyJSvIi5F0gRBNdXvMqezrR3k/+JldaxhX1z+
	KCJd7QS4lyRVOqVHL/1nFtpPEatMmvbasL/8TYun22P5pyXv7Te/J9L71jK1GcuDcXAr
	25U8g80BBfTcksiO70cZKig0QvvzNIb5XUbwEyF8QTrLjyv688cBevOyfPksFTAfLu/j
	YNZw==
X-Gm-Message-State: APjAAAX43PEiGIyD1CDgk0al1FQujCoaobRdZXPjAhTJmp0RtFnkP474
	l0w3PGQdwSBeWXuV92DbJXvKC0lUkYA=
X-Google-Smtp-Source: APXvYqx/nxrFOl5/LMixJusoQA5ajUwWKv0oM3uTLFwN14992wa8CAluwV1+kxMgEFpdVSw3Ci7Yuw==
X-Received: by 2002:a1c:e0c6:: with SMTP id x189mr2865922wmg.4.1556036370962; 
	Tue, 23 Apr 2019 09:19:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:14 +0200
Message-Id: <20190423161916.25572-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/9] python3-pbr: update to 5.1.3
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pbr_5.1.2.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.1.3.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.3.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.2.bb b/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
deleted file mode 100644
index 7ba1d035352..00000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "bea55678345bd77b4ff5b2ebb729fd6d"
-SRC_URI[sha256sum] = "d717573351cfe09f49df61906cd272abaa759b3e91744396b804965ff7bff38b"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
new file mode 100644
index 00000000000..d9b6ce74a34
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
+SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
+
-- 
2.17.1


