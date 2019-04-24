Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD767D610
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:39:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h21so17836412ljk.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=k3TLHJFcDZw968q2wCXvM2zUCSlCQtBhOGQ+Ok0zOuY=;
	b=AzAGSgQ+v9WS26Sdfd3YM/7OKq5Sgw1fpFRcMk8ly3YXiKONmbg99z/GqpTvzEYrk4
	/zg/aFoF1+a7TeDKGoFmRCdTHxPTvtEdIl35HVx1t86rOLgN8dGni5pt64oDnsKuzOh/
	X14TK4e8LInVKVluUfoM/avxMHQFB0vC7aJDirIJ8sCRlVgix9zO50jqPE7CIEkT4cxl
	XJdYt0jkNKJBAu+Xvy1pWNC8px9B/eupCW93L8chzTZ5U3P7MIAtos9W8gMDY3TxBAw6
	BKkzmQmXXpH0Sj0zmsV+hzyP6I3EREmb7D/sJ+WMcJ/ZS+KNoJFVEPuY1xIA6yoTMEXD
	MaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k3TLHJFcDZw968q2wCXvM2zUCSlCQtBhOGQ+Ok0zOuY=;
	b=YEl7vSbjvjUx84AwNmO7byfPBf9fzhfNWg/p1NY5ZrVBUqzFpGTqo3Fl+IDXV+BSwe
	m0XjsuY0mmRoiLV8EBqd4keVcCjLEvq8hsoKc7jgTBPaxGG3kAiN50FQ1wSmPS2j4LKN
	GkLGFknpGtj2ziXb/9+Wj55wvroEVYePgAgsb/G0asUvIj7PdBTRzQd4eJlFj8RzGKHk
	KJMBHZb99IP7rhWq8S8lrmO7l3Y6JcsXfJM/1E5WPbgLj34isbxsCR2nWCAMHVM7sYYb
	i1Zyh3VKuyoKK9+1D9ghdO0nVxXkppyaB4mfUeYyUJ4AcAgubSsox4hn/owul9+DSTcZ
	HbPQ==
X-Gm-Message-State: APjAAAWEa281kxpV1qurId4Dioj8u6Xxw2B2TX9/K7KT1dChc5VzSdhg
	URghrm8+XvgJHOoYPfPwXXFGMnclyGg=
X-Google-Smtp-Source: APXvYqwWHc9ulDQG3D1j5jo6a8E3fkmzn/A+1yN1sDG7J+AXuZQPlmW+iO67sjasZSN3S7ANNS32Dw==
X-Received: by 2002:a2e:7c0f:: with SMTP id x15mr4295090ljc.154.1556131190509; 
	Wed, 24 Apr 2019 11:39:50 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y17sm4986404ljd.54.2019.04.24.11.39.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:39:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:39:47 +0200
Message-Id: <20190424183947.12808-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-mako: update to 1.0.9
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
X-List-Received-Date: Wed, 24 Apr 2019 18:39:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-mako.inc                  | 4 ++--
 .../python/{python3-mako_1.0.7.bb => python3-mako_1.0.9.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.7.bb => python3-mako_1.0.9.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index e265bde85f..97c624bbc6 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
-SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
+SRC_URI[md5sum] = "d739720f3f0d6a1cb6a96ea7a4760c3e"
+SRC_URI[sha256sum] = "0728c404877cd4ca72c409c0ea372dc5f3b53fa1ad2bb434e1d216c0444ff1fd"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.7.bb b/meta/recipes-devtools/python/python3-mako_1.0.9.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.7.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.9.bb
-- 
2.17.1


