Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4370F7E962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:56:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s15so1966509wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O5FS4tDlkZEjot8TYcdwbC2JACZlRa8TiY6/0/xjxQo=;
	b=g+mBy3/zCaYIvQezARU0kHY0Y4IapuxhfEpq3k0gOSr9EbtVPOJzjviTh6WnA9Q9FZ
	0EnejaqH/75dG3q5MLhQKNoGIyxK7kX0tVCf052c04TmCjtvNYtwoVj/zwpBpAUtOd3O
	zto2jegrJxL0++tUPvRuN8n/CrbgMIfs95Y/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O5FS4tDlkZEjot8TYcdwbC2JACZlRa8TiY6/0/xjxQo=;
	b=Nvqf/c+CVLSkFMgpbHUtjl0XCOcO2Opr6XKD3sklil8w28zmTfddPXGSXYHMZ/oYV+
	1aEDC1Df/bESfKACel0FTZDJTsJbTgqBwzK8z7/3dn8APz/HBhlq179kYy2eAfWjG0Gz
	kKl47+m2fii81BeyPomEDx6oJiFdXqVpipLMBI7wu3HZdkBdyJUh8gbpUmAZcVB1ifAi
	K5S0qKX/YKAAHjkDRjBjabydq4Gn+1E3sCHO9P/Vlua26n20S69MdjbkmpvQ8cT+Tkyv
	h9ve3OQLXiN/hnc5Hni+5HZ342ajdh1KnAJsa4q/N9v8YspCir9CueHJhIbslIbaONpg
	2FMw==
X-Gm-Message-State: APjAAAXO1SuMclEnISRlaxy9spGKT79v+uESXTjYnFZo5nvLqk/JAPLT
	+7XaRzPP6CDgbbHYuWEp88evArwvVEk=
X-Google-Smtp-Source: APXvYqwIYvW2pqiN1yugEx++8FP6okO6uzdlbcamG4EeexPUVXlQYTozWHdkEQc42nnlYqzttuQ0ag==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr8442637wmb.77.1560952606715; 
	Wed, 19 Jun 2019 06:56:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k125sm2090642wmf.41.2019.06.19.06.56.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 06:56:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 14:56:42 +0100
Message-Id: <20190619135643.23332-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
References: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] libxcrypt-compat: Add recipe to build the obsolete APIs
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
X-List-Received-Date: Wed, 19 Jun 2019 13:56:46 -0000
Content-Transfer-Encoding: 8bit

Add a recipe which is able to build the obsolete APIs. This is mainly
to support uninative which needs to have both the new and obsolete APIs
available to support the different host combinations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxcrypt/libxcrypt-compat_4.4.6.bb          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb
new file mode 100644
index 00000000000..810c707e881
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb
@@ -0,0 +1,16 @@
+#
+# This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
+#
+
+require libxcrypt_${PV}.bb
+
+PROVIDES = ""
+
+API = "--enable-obsolete-api"
+
+do_install_append () {
+	rm -rf ${D}${includedir}
+	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${datadir}
+}
+
-- 
2.20.1


