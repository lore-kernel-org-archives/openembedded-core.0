Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id E2E0F7D256
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:29:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h4so2847877wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UoxSFwcfGXbbOOOOW1uWu0i+PdksxDvxDp2WQf6v3LQ=;
	b=nf6ClSfDHTzYUhC7xaR0FznRos53GBmWA0u1M7TnCUaOOT6NB6DefXchmJnllRs6sE
	GcqwAG5PK32sfIOyhJ3pI7DrUTI+cwYNNxFNxuT2wO1TLTSJVI95HudLEbLAUxet0sQV
	zCFb9M5aAxqqKFQLpaS/8fvldoqTqUkH1tdM2vCm9kj2UFWldj0LNH9DwoD1AhW2XAil
	I7xFxDB5e60uhZQ6PZ2wPUJDnyf8VOTdDr/IdPPfd85a4cNuVX4JSaZH3RIkOKk1HXhb
	auepVN7HKUENZprWD8kPLLtBGjGgncFioEXsQmwQPEJl3S7dL4brIIG/Lxk4dRarBeZ7
	SThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UoxSFwcfGXbbOOOOW1uWu0i+PdksxDvxDp2WQf6v3LQ=;
	b=B/fCrxgL4Z0akn6R/GJfDULdSlkqIVnbMvBFrITGinn8qGMBamO1BFS4w5gegUq2aT
	COSCPC0fkNRLF7KHqlIXvfoFxfXVS9Q/ZrL88Ys/MYZ97EVes7CAASumkMays4O5zwbA
	2CW8YdtMazudwyqVJaYXWTbNrxVXxBX6QymOp/KlfX4gCcLoRVrBq5Er/aEfUP53CH0B
	voOnGRzadt1A9uapYD6nvBysWHn7SeacZixCuOXDtsXZs7tS3/GI9ZbFojL+Y3xnT+58
	9NMMTAK1vuYC5MrwL/R5Y/GDvqfwXjCjqvcnaE8XV7wLnUrSdHgC69B/SqUJeNcZLH2B
	Rj6g==
X-Gm-Message-State: APjAAAWPYkng3Ih13JQ1hcGZg7hGIXFanSijsSMnJCFyDJyQB+gjauBl
	wBjQOVb7KcVBzRei3kOxU1xrIwKrAyc=
X-Google-Smtp-Source: APXvYqx28/kXeMJOHl5J0ovUeILh3+7jLlTg6YG3CQ7XX9wy5ji4xoNFiyZyDU+Ld70O6cAfgEaoDg==
X-Received: by 2002:a05:6000:14a:: with SMTP id
	r10mr5222049wrx.107.1553869751443; 
	Fri, 29 Mar 2019 07:29:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e193sm4358537wmg.18.2019.03.29.07.29.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 07:29:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2019 14:29:05 +0000
Message-Id: <20190329142905.20123-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190329142905.20123-1-ross.burton@intel.com>
References: <20190329142905.20123-1-ross.burton@intel.com>
Subject: [PATCH 3/3] gtk-icon-cache: clean up DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 14:29:11 -0000

Instead of using DEPENDS += use _append to ensure that these additions can't get
overwritten.

Also use gtk+3-native instead gtk-icon-utils-native as that recipe no longer
exists and is provided by gtk+3-native for compatibility.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index d87167aec09..3572f62ebb6 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,8 +1,8 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-icon-utils-native"
+DEPENDS_append = " ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+3-native"
 
-PACKAGE_WRITE_DEPS += "gtk-icon-utils-native gdk-pixbuf-native"
+PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-- 
2.11.0


