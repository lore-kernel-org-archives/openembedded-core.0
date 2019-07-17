Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75B477ED46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:54:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so23459106wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n0M6T7MOHt5wuMJJEKNmEiQuUqFgrS7r2ECriCOYnK0=;
	b=V6BILN0S3IGL9bwVx6Lkal287TQIR283Y6jHNHlxroEssLH1t/ZlEyGO2eNlW2fn2s
	7WlwGXoUOspu5mQgcgWb2SvUZtsMmsWsPH6nx6DgocOuHRtcVkSLgmL8+mNNDplGc9IP
	ge6LVGNQVK4tgJLfN+cxKG72ljZ2TSVU9Q7SsRghnqRdy6aCvSv+A6scXHPPqz6t3Zvq
	YrTGF0dx2ltSnTYz6coQBwkRP2I2cCwpQYKMAtb38uZv8Iosg5tblxg9KU7USkaChTZc
	9rv978NHqD4C3SHegI492oX4/y/lzwkAkxLWJZ+jH8ET/54NB126zkcjcyvN1gLYvdNB
	y7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n0M6T7MOHt5wuMJJEKNmEiQuUqFgrS7r2ECriCOYnK0=;
	b=nj3KH19ypBv7+ER+j1kO05WDFZmxpNgnQ/6+Ha89PcnD6cWGkVcDTLEm4OvPKLGkzq
	B605BCR/G+NLGLLXmUFaHz6XgtZJgV/xMNak6Ub02b0k9y1dTICf9dG/F/O76xVQCM3X
	x23eyRiw8xhu4yyFyt1ESOj2vJBzHCimPQVn+212hcfnNHdGWIOzKrjG7HMVsUzshVoz
	9G6ViSkhtxnqOMa/3kFeMYQM6zfy8u3RAfMwtIIeZzHjrrqdBBEG0abWJsqAcQx1Pd9k
	8/aGnEmheVA7bPR+rjUBk7ymATai+7tE/l6R6AbOdZFOjXz9+nK9M5VrDf+PjJsCAh6w
	97wg==
X-Gm-Message-State: APjAAAW66HUmRJcCnw4nJtWYNn3s9C9HGzgDh4yju9Zu0TORhRVS4XZt
	PwLqMaIQNY3rHqxaFdJjqpMXBnqQS5A=
X-Google-Smtp-Source: APXvYqwtvgE5OxSunfOCgxso82IHj4m31Pm+VAoji+NaVg8813UMyci7vJ2looQ3hyd+gMoPOlX18w==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr37194998wmi.16.1563396877024; 
	Wed, 17 Jul 2019 13:54:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o20sm58637610wrh.8.2019.07.17.13.54.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 13:54:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 21:54:32 +0100
Message-Id: <20190717205432.31580-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717205432.31580-1-ross.burton@intel.com>
References: <20190717205432.31580-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pkgconf: upgrade 1.6.1 -> 1.6.3
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
X-List-Received-Date: Wed, 17 Jul 2019 20:54:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pkgconf/{pkgconf_1.6.1.bb => pkgconf_1.6.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.6.1.bb => pkgconf_1.6.3.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
index c60ef74226d..94bc112b9fd 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "556bae2b9e0cc7b46e7c00083cb6d95d"
-SRC_URI[sha256sum] = "22b9ee38438901f9d60f180e5182821180854fa738fd071f593ea26a81da208c"
+SRC_URI[md5sum] = "f93fb1be95a5cb62e43c219c82b5791a"
+SRC_URI[sha256sum] = "61f0b31b0d5ea0e862b454a80c170f57bad47879c0c42bd8de89200ff62ea210"
 
 inherit autotools
 
-- 
2.20.1


