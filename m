Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C99F37CB0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l5so28775828wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WIqxtOFzUIxXFhpz1tLTC4+/kA1VeTwTC+cmtVkMj0E=;
	b=Q+l+GmNz5yPuiF/f1TxLPfYswdAr4ucSf3K2Q6ULuEUaqiGFC8sTlQycgO3INnvpea
	FG4ryWdv+TxoePKDxU+p/YPenKIfwCIDMXLZTei5sYlnEm2NfoHicH3wvmRIZ9pc8iO8
	EKT0wzLunF4CYWfEp2dJoqc9NCKRwoh5gks/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WIqxtOFzUIxXFhpz1tLTC4+/kA1VeTwTC+cmtVkMj0E=;
	b=Weg5xwJLqYRObUCf7uFPMrehNB3BDERvEfHSvDp8itwGNkMP1kizKonbrmrlJ73R8P
	OtuhgYRs3L/H5xhZSRcvlwD4foKrR/jr3+81kT6c+TRbrpzx95VBJuK4P0FGPYJ87VIf
	pnZ08wf5cvvkRFWvoSAuAiblZHS+WhOrT3ekKIKY0QGFs8nlezeJCeOlUm1az6QzaY7E
	s771HKT2EqlMlhvfkPOeOD9za1lwORqNU9B1Q2UoPpstZQpFckg/qOgzBTLY0NElMr9s
	HieucQma9i+UuoZH7jLKb65Xti2LAY5PxTHnbxbi3PmiTHCF+ULQqCRZdhxA7wRm9MQ9
	oxDg==
X-Gm-Message-State: AHQUAuaf5qQhnV7OLUi3/WRK67pnbNRn0vNzt8N8gAJy6Z2XUaTtyns6
	ZFBfoTX5zPh9EorREf5BinXR2Br3jjo=
X-Google-Smtp-Source: AHgI3IbiFtKsbG3n/z3qdmtzp1L7GRqQS2+MJsPwFPPIn84PB7OiqvvXizsUb4yI07jNZ6tNgCJ6Fg==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr30960844wrm.284.1550752893298;
	Thu, 21 Feb 2019 04:41:33 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:18 +0000
Message-Id: <20190221124130.25733-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 02/14] curl: upgrade 7.63.0 -> 7.64.0
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:33 -0000
Content-Transfer-Encoding: 8bit

The license checksum changed as the copyright years changed.

Fixes:
 - CVE-2018-16890: NTLM type-2 out-of-bounds buffer read
 - CVE-2019-3822: NTLMv2 type-3 header stack buffer overflow
 - CVE-2019-3823: SMTP end-of-response out-of-bounds read

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/curl/{curl_7.63.0.bb => curl_7.64.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_7.63.0.bb => curl_7.64.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.63.0.bb b/meta/recipes-support/curl/curl_7.64.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.63.0.bb
rename to meta/recipes-support/curl/curl_7.64.0.bb
index f7557a2f46d..a1b5e7d5797 100644
--- a/meta/recipes-support/curl/curl_7.63.0.bb
+++ b/meta/recipes-support/curl/curl_7.64.0.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ef889a37a5a874490ac7ce116396f29a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be5d9e1419c4363f4b32037a2d3b7ffa"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "0a6c1e993bd5102bc52fc89900542644"
-SRC_URI[sha256sum] = "9bab7ed4ecff77020a312d84cc5fb7eb02d58419d218f267477a724a17fd8dd8"
+SRC_URI[md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
+SRC_URI[sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.20.1


