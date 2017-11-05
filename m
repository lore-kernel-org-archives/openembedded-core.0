Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E824260621
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 00:26:58 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l24so5436165pgu.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Nov 2017 17:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Z8UMol/S7FCucYAgVwAWuYYGRwJ4llKcg3RiPAfr/Ms=;
	b=XkMZTxSsXPNWjelMeWrgCGXxI5uho4yYBynBLgVeP4ciy9diPbwE0I6XVfN4LRQEtf
	QbPJ8ndpynjZvOKbh1KerFEOKzmS2SVBRrdRu9zDVhiMXs+EEXiyb4fRTiUVUCZoKeU7
	vAhh2rfFIDq9N6hKYzAUOr/I/YOa30K6JrtybIV97hvPMR+EY7Hw5mFTSj0IbNkpHoFk
	hLMv3RXDBPuGWRD+hfyfzufTHOm9sgj/4Q5h6C7LShitklVA1A4YAZLJ3n4/7yOtRDlW
	rf2Hcb+jMfkeXXp+mKMYXkmWXUsdasPPqNQ7Mf0tfDqfP1N5cddeQ89Bx7Z1TBl5HGHm
	Wt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z8UMol/S7FCucYAgVwAWuYYGRwJ4llKcg3RiPAfr/Ms=;
	b=fHV1p+5bVGWnVwzqbLpFvRYmZuJAJO+mUYMRkp7LyiKo1t+aYzF+vsgE+vqI3SCDCf
	IGHpwVrlsH9JFPxHU0Aj1YVRNL2g5xSQmPtgaqX5f0XTQX9FD/ddh0tuFVpoDdQYDzWx
	2Rhs/xYk6oyTZldnVY8j0dIrmODaYqXchaO0aM6Xr3xI6+92/LTBCxK2hkKPG6xaCYFi
	hKEW7cZ5PCPx8L/1NKr7RIuVBIEUtt2ZtCqai603MqDAbP7ssFOqZHHJDY4AFZcyTRVw
	E9svJnd6GKV5jLJZlK/4Ph6u1SGrD7pVvyvRLhyLceVocCloVpBTBQaabBKl2Aj9mXtv
	JDiQ==
X-Gm-Message-State: AMCzsaWytPdniymLiDsjbmcuAeRbrWYxrZ/Fl082mdFDxc4ZZ/1QWFNU
	WB4N2Yw4/DutIRyeXYNYi1jJJcHCBkw=
X-Google-Smtp-Source: ABhQp+QJmkhy0yg6uHzFJojHj/nOHeIyjeajxd8xvAwtG6iYQ3cJn5Cr6z8fBnQdz1khlYqhoUdusg==
X-Received: by 10.84.129.4 with SMTP id 4mr10634783plb.320.1509841619408;
	Sat, 04 Nov 2017 17:26:59 -0700 (PDT)
Received: from localhost (207-114-172-147.static.twtelecom.net.
	[207.114.172.147]) by smtp.gmail.com with ESMTPSA id
	p14sm14230282pgr.51.2017.11.04.17.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Nov 2017 17:26:58 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Nov 2017 17:25:59 -0700
Message-Id: <20171105002559.4822-1-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.14.2
Cc: mdf@kernel.org
Subject: [PATCH] python-mako: Add back the python2 version.
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
X-List-Received-Date: Sun, 05 Nov 2017 00:26:59 -0000

Add back the recipe for the python2 version.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---

Is it possible to get that backported into rocko? I somehow didn't see
the patch that removed it go out on the list.


Cheers,

Moritz

---
 meta/recipes-devtools/python/python-mako_1.0.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-mako_1.0.7.bb

diff --git a/meta/recipes-devtools/python/python-mako_1.0.7.bb b/meta/recipes-devtools/python/python-mako_1.0.7.bb
new file mode 100644
index 0000000000..767c7c3696
--- /dev/null
+++ b/meta/recipes-devtools/python/python-mako_1.0.7.bb
@@ -0,0 +1,11 @@
+require python-mako.inc
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python-threading \
+                  python-netclient \
+                  python-html \
+"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.2


