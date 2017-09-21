Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7036877F38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:58 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a137so8742553wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fkBNsxTD/kbSCXGL9VERy/DMlJjArPJg3Lo6xh6RMhA=;
	b=gsnknnqOYvfybAB+J+AdAu1lMXQOmExHGiUSlrmgZH14Rmg0YtVEyuM1o9Wn57m6iE
	gD2m9H03Icp/GXBVl8xJwUSq2SLhGTa/CZsW2gfzNSrMVqChNkwm/+Cb8VfnL7ULXPNw
	xZFG3C6tLlqyt0HBLgqWwo8OK2eIMqf/LpKcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fkBNsxTD/kbSCXGL9VERy/DMlJjArPJg3Lo6xh6RMhA=;
	b=P5j7x0MSURdUjJ54ettrBvC68vti7noLqE1LIxLchP5W/MGu/hgBiTWZdhaAjC9FV1
	5/bGXDzQe8txCt4yGnXs5sZOBHwEMzs2Bt33GbIPWCi03lE603nC7hvEZZDRa13iLHeg
	L7cFFhbYn3J35dkiHQV80VOHF7V9iyhn4Y06X/XPQcdZDNUffjpr8I+P5F00H1LumwHc
	yHDTNNzu2hnjQfwEp3NBkhrgL8u0Dv9oH/FykPn47Pvt/NfWBzPDtFqzK/oD2WC3bIqi
	kprBfZ0I3FgA1hGdX8BItrGQmR+25YXJGbKLDVtQ1sK8shy3u4NL2KxWQgLNjV3BaefD
	EGKw==
X-Gm-Message-State: AHPjjUiROkZIbNUVysW4MLcgM1vkXBgJsJlT+72Ho2NIcnrAEFJXOZkE
	htdIwU5rPFYJfzMR1OdVatC4dc9tz2I=
X-Google-Smtp-Source: AOwi7QDvueBc2Sgfy2RfBeYh1sKBXj6LogsvYQ+2PEgaCDx1qsifvvZYC82vQBbZrpzc54gkJA9sUA==
X-Received: by 10.28.234.196 with SMTP id g65mr368629wmi.73.1505985719274;
	Thu, 21 Sep 2017 02:21:59 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:58 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:30 +0200
Message-Id: <20170921092131.25537-10-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 09/10] gstreamer1.0-vaapi: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:58 -0000

Bugfixes only release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb | 5 -----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
deleted file mode 100644
index fbd9f8675f..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "bea015f33696a15ad9575fb71af862ed"
-SRC_URI[sha256sum] = "23c714e0474b3c7ae6ff8884aebf8503a1bc3ded335fa2d2b2ac31788466163a"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
new file mode 100644
index 0000000000..7a82cdd91d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "aa9ea10623f34680a39b32e243add26d"
+SRC_URI[sha256sum] = "f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.11.0


