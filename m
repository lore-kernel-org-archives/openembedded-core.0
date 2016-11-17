Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 959706E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 11:33:52 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f82so139753328wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 03:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=onqHugehHVEl/isuI+FXD8VXvG1aKKFrkYTu2XoiD9w=;
	b=R0XFaXwXeVjlNkk5syu1BNCSQvJsEtA4gT8HCkE03t8q5Mv7NfwXDWkZB8svYoJjYS
	ZnsHAJ+uYbXpeBX5AaI4FZQWumPlReCq7JOPEEt1Xl7DlXliL5HloMkfd0bE93J9i2cp
	2RYVjysNhV8Fafl3Sf3k83CuJv9ZISpHW2kNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=onqHugehHVEl/isuI+FXD8VXvG1aKKFrkYTu2XoiD9w=;
	b=cf+Fud0wwtBsR5tibHsQ727U8bDgePg6a5fUMgb7+P2Zc0k1i5UFTLUFFIfPEEK4kL
	44YfsG8uX5BXnRxl23v7AEXQyljep+4cLbvXuUfBU1MyTBRNyh4QSIOZitM/BBG+id9j
	J4IdrDheBRAqn4BtQGwyMs0kRvu2TcWD8zxkaAVbbgZreTxtP718rvenXSygOoc7iyG2
	NCiRIbmcHRzq2b7tQTVxlYfDQnppTxaspID7HCP0iW4zJcag8A/tpCzg87GSEvmKeS3U
	Ca/bzgE+luI/+We9gXQ5puAo6Ll38AHcTAgakAZgiyVOPfvsz/MjEyL1ZeGQK3gnYqX7
	/f2Q==
X-Gm-Message-State: ABUngvfElxxBVW/PUvxIG1+PbHfuRKf/9mHqykSdEqAl/hb9irM9kzEkcVrVCu3YVH1m+Ycc
X-Received: by 10.28.86.131 with SMTP id k125mr3782899wmb.89.1479382433100;
	Thu, 17 Nov 2016 03:33:53 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id x5sm2758503wje.36.2016.11.17.03.33.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 03:33:52 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 11:33:45 +0000
Message-Id: <1479382425-3578-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: [morty][PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Thu, 17 Nov 2016 11:33:55 -0000

From: Koen Kooi <koen.kooi@linaro.org>

Android-tools depends on it and to build the native versions of fastboot, adb, mkbootimg and others libbsd needs to support native builds.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b02cef58ee35dd277fff48538ce2803df1cbc4d5)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-support/libbsd/libbsd_0.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.3.bb b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
index 92121ef..6f734ab 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
@@ -41,3 +41,5 @@ SRC_URI[md5sum] = "e935c1bb6cc98a4a43cb1da22795493a"
 SRC_URI[sha256sum] = "934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8"
 
 inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.0


