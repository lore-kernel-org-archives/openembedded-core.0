Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF2F7DE38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 16:17:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so2637716wro.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2PuQ/3dWE3Z7YKbWhdrbBi7FfvkEls5tpalkhSbDddc=;
	b=iQwAl8ErtEwRKzfoXTHUiE424Hs6AxpLlICLjfdSdjhS1ebw8NHhp8fHDcAJdVFFqD
	w+66pXd3vx793OJggWcGCjGR2s21FH3k0COyVT8TGuGmsxgWsuRGhLp7BYWLG5cec0+h
	1zAs0ta7neMm4sKaATynYHFFPYsM0lXYtbB61+3W32Z0oCGY6H9Ra5X/8npMGl7zzmpM
	z9oIbFMtdQOMfDIbRXYUZ3OK1hofasyOGrX/cQDc1gFVwIjwj7refdZjPnRT+Ke42Apq
	3sdZbZMMXVbTffg9d/nxCXB8LsTAV238gMlLEKfEFW4iwLrbGUC7ELwlPTzQxtkuxSl1
	pR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2PuQ/3dWE3Z7YKbWhdrbBi7FfvkEls5tpalkhSbDddc=;
	b=eb0IXfsf1tJa/z/1mIBxags2Yfik5Qdhh0PM1vTN+Nx+G/HwP9LfmFMHZSGTILBI0s
	w2joAcfSVDAvf2AhUNeHXzLe1fDofaedH+zvTdQrdqLEULZNiaY/kvpYP8/1rVIXYkjj
	hgMSCRfw7MiAtDdWIBnEGvRFwsXfXwcohvC92ipNaarMu0Y+HHTg4jSwDOjfcqloL5a2
	WghJ1yN7eC/Kd/c/ymutL4iKXabWHuPClh1699dmhRYwDh7e2rmuI/W3kd9c1K1jH+U4
	G45cYVr813psmal7R/23Z/XB6kXAgLnwaHa0OrJ6RXWbkRc3CUdX3/RMwnISTgAFwLBY
	aIiw==
X-Gm-Message-State: APjAAAWKI+Jwq/F+2awV0/j/kaToFTSNVZ0xY7luWKjTPu8XfQ2w/GBy
	GT8BcaEy0kucMXFTMDoepaB/MUK9Wj4=
X-Google-Smtp-Source: APXvYqxLdblTUY9k1+dro4451nYhnb5zLGCSg1YhHdpSEoYvzhQIEsFDmkOw9wH+cciTO4l6yeqNIg==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr3242141wrv.248.1569341872418; 
	Tue, 24 Sep 2019 09:17:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y19sm627355wmi.13.2019.09.24.09.17.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 09:17:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 17:17:48 +0100
Message-Id: <20190924161748.2004-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] opkg: remove redundant systemd inherit
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
X-List-Received-Date: Tue, 24 Sep 2019 16:17:52 -0000
Content-Transfer-Encoding: 8bit

The service file was removed in oe-core 23dcf7ea but the inherit was not.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 62708628994..1fda6e3bdac 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75890fdd31
 # PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 PACKAGES =+ "libopkg"
 
-inherit autotools pkgconfig systemd ptest
+inherit autotools pkgconfig ptest
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
-- 
2.20.1


