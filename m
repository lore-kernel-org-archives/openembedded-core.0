Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 278566BF35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:03:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so6482289wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uzO6GB5e96t4ICK5qkeIfCMTziN/gN3gWeG9lzCvO6E=;
	b=FsLJWuA1nsy1BRCZTa/ACH/B4z8FOxQOhzHmG54UIIQlgtM0SSWLkHlrF0ICakbdzk
	if7mYJinsAO7OfbKwqxdOm0gA5ud/Ot63mae480BQXN8z92I5sKz0qzCfpWWPYQpppLs
	uCYbXcShG/+g8x6YfW1Z9bYD1oSc07ElVCUJxuvSl5gUeyt6nX83Cs0OvY3jyOPUuxoD
	UrBQDcV3Dfl8rmcVptG6T0PDcuT+lo4nyT1+BKhT3DsJaKBQQefHNz2EjT4hxxBwDe9N
	o4ZIbDq1z0FdYsIjNmab0ToSfR2nuttbdkXpJ5O1gVU6ZuRsU5P8aDsfXBptx9815tQb
	nwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uzO6GB5e96t4ICK5qkeIfCMTziN/gN3gWeG9lzCvO6E=;
	b=aOeiaWO0lJ73QqP0Y8jpyUEX/DcqUdgLQIhPrsd9CW77Gf2L8P93SvVpYfaYAtuX15
	iKZlM1CW1+7up3jBpSK1c0pMvh+tMxH0Pgy0MuXAkLRDXjjT80g9FIY8pdE6kszF8a5H
	q+ijloBm5pJc04+IaQES+Jx4HZluz+U/T1/vsm0IiuuAcI6cALTvQVXCTA8qBBcUshID
	tV3oMMpozUzsamO8VPNP2NAvFqpxzmVzRWNYTd7q3o5J1CH7QeAnZlwYPCAUpcOCvWS2
	yyKwMTuxiDgHXDZagvoMjt46l4+zxwwK7wqaWwu2X+JBl+uu1c2hVydIoMKsvOt0QbBL
	LcNw==
X-Gm-Message-State: AA+aEWZelGbHsn+f4zTkuzC1IREV4oPlNW7dGowq1vTqgZpPwwsoY50s
	ezR+NkmrLpTyCHLuyvcHpFMIQAS0
X-Google-Smtp-Source: AFSGD/WFAYHRKxQ5YgV0ZujFjmPzZPpXE4Yq8YVl3ki1SQagK/wz/NjAokUFl1mUgIrXH/ClalBcNg==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr6386276wrw.323.1542819788593; 
	Wed, 21 Nov 2018 09:03:08 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x12sm24076122wrt.20.2018.11.21.09.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:03:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 18:02:58 +0100
Message-Id: <20181121170259.10557-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121170259.10557-1-alex.kanavin@gmail.com>
References: <20181121170259.10557-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/4] libdazzle: add recipe
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:08 -0000

This is a new requirement of epiphany web browser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-gnome/libdazzle/libdazzle_3.30.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
new file mode 100644
index 00000000000..029adddb9ee
--- /dev/null
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The libdazzle library is a companion library to GObject and Gtk+."
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase upstream-version-is-even vala gobject-introspection
+
+DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
+
+SRC_URI[archive.md5sum] = "24e2e1b914a34f5b8868a9507d1f3c4c"
+SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf72933119e36dbd90b36d5"
+
+GI_ENABLE_FLAG = "-Dwith_introspection=true"
+GI_DISABLE_FLAG = "-Dwith_introspection=false"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
-- 
2.17.1


