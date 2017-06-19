Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD6678280
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 01:22:29 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id p189so47077688lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jun 2017 18:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3cy8kXchLVq7eMvYhDD6u0ikstFdXkB+OVbmoO2hwGw=;
	b=hDc9s6VQ30bF/Muazyl24gKFNYrwJvqoRb0bnPMkfB8gWARYo085rP1jPSB0jbelm6
	MwFd+2J1JOyH+3+Xsy4Sw5vhCxyBFPwgm6Zxg2ETdmqhWTXrJZARZa2U/FyJbQbLeI2U
	oYVTfT+Xm/AX646MWuzaiHHHGpAIeqpFkEi301DcokTEGB/aiUjoJTg1/UoFcUqloHio
	1Up2e6lh5n8sZ+WGZKmm2xeFHDZM6pgljw0W0m5+KkFWhovJXEM8MuZwGCEkQWvTBjrP
	yV/2g9rgCe83ViLrhy7P8TWwb+NEwtW4l/Y0ZDPYC6xoILMjTtlPI3NOj9YiGbkc7YpO
	6QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3cy8kXchLVq7eMvYhDD6u0ikstFdXkB+OVbmoO2hwGw=;
	b=Uz87qzzdXXraA5h1dItsMZc3PvIZ4T92WcZ5m+R1WtiQ97m4eCvC7lGRNrtHJMlDbI
	LyEFEaB/oWjYxkwwrNaYf/2sVuDmDwanVBtjLnddCbRF220x0wihA9PQXJ4DZSlR0jxE
	VRlY4w9j3kRDlTKXiYw7N0g7dWTk6/eu2TAU+8e8El60qQSO29VdBpyMI5m7DmycVHMk
	kquK/NZtm9wBx1bpil65Pd7JxwttRI56xZrH3HtVE7e3VRynSJDPqdekCoHoIvylVRHW
	EILWCJ/9GTaF346Pbqt7zBIzmJVG3jmNaefltUAeLZRMNTCr88DHW4ogvs6n4lB1FnzE
	CIig==
X-Gm-Message-State: AKS2vOxHQqbIg/6I6o/NQIC9nr+edBx1oMO0EjXVU6TAhcSuxipspMZF
	0uKW9diCy9sC7uF/akc=
X-Received: by 10.25.67.21 with SMTP id q21mr5813422lfa.125.1497835350130;
	Sun, 18 Jun 2017 18:22:30 -0700 (PDT)
Received: from localhost.localdomain (c-5eea3540-74736162.cust.telenor.se.
	[94.234.53.64]) by smtp.gmail.com with ESMTPSA id
	n79sm2014383lje.12.2017.06.18.18.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Jun 2017 18:22:29 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 03:20:05 +0200
Message-Id: <1497835205-23741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][PATCH] curl: update to 7.54.1
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
X-List-Received-Date: Mon, 19 Jun 2017 01:22:34 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.54.0.bb => curl_7.54.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.0.bb => curl_7.54.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.54.0.bb b/meta/recipes-support/curl/curl_7.54.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.54.0.bb
rename to meta/recipes-support/curl/curl_7.54.1.bb
index ce5ca37..f42582a 100644
--- a/meta/recipes-support/curl/curl_7.54.0.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "89bb7ba87384dfbf4f1a3f953da42458"
-SRC_URI[sha256sum] = "f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a302ff06"
+SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
+SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


