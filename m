Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6150F71B15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:45 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 12so6863748uas.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=W9a+jKQqkPeLOqOJWqrx9Nb1+aRXUBSQVVKTMwlRv2M=;
	b=1LNF8yWVMeUP7notX9+tXuj7jwoBvZI1OYJGoERxiwC4H7qb3YyC/8MyWSV8bXi87+
	o7SsqB0jBnCrt+fe/p93Sfc/mpztAhjv7zThYQPYjEQ79j+6EI4wUM7dManvXvzCO1zS
	JxanvKFczFixE5mTncBAG9VnkymDAXsA1korxnDXxvH4iQUyheVuPHkkWU2YIpGd05u0
	QSDGISK8cb2cgD69cmyk5h4btuVLnTHnn8ineBBKY+pXHRHHvPYztNF3Mb7zI8eh9MFS
	ZVM/1VY8nU/JHSa8sk8KKxmgoFLk84rH0RWficOykskfRv6JaYbxDq7MnQRKZNgnGBWN
	RMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=W9a+jKQqkPeLOqOJWqrx9Nb1+aRXUBSQVVKTMwlRv2M=;
	b=AAnJVFNeY+tt024Jw3LHZZ0rn2GH/EJx8QTaM8IY0GCY8pIRPmdJhPxU9Ycy9/aTIB
	iMKmK1+C+8auTfnNAKmxnYqlWQcgiHXcURSerOi6lBCPXZG+YNdfhYYrQv/zbUO63cHo
	W5khKAxkWsFjvNGVaIhVAHwuuGXQtKwyF23KozyMwqRZvswxRS3yVXyIjaCibuBdZOnO
	ac8ip1oERf78dptHvBEQUuXEGnzcJ82kz/7QhKVWAXmuuyLJv0m0GSXMOz0vTIV2+txM
	7P1vyYDem55G9bErDCIWOWY6ynaHb6OLy2YzGQ+hIgBumrAGMZQhGzNXpQqDXA2pMgfe
	tY8w==
X-Gm-Message-State: ABUngvcIQYanYyz3uH+n5GZfPs73RxR0D4sdFiyNTTWDmLpLjkiYZEndU+xfk4iw+dMwZA==
X-Received: by 10.159.38.52 with SMTP id 49mr26809060uag.14.1478030086894;
	Tue, 01 Nov 2016 12:54:46 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:45 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:57 -0200
Message-Id: <1478030040-20670-5-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 5/8] libsamplerate0: Update to version 0.1.9
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:45 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../{libsamplerate0_0.1.8.bb => libsamplerate0_0.1.9.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.8.bb => libsamplerate0_0.1.9.bb} (65%)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
similarity index 65%
rename from meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
rename to meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 1c37681..6ea7971 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -2,15 +2,15 @@ SUMMARY = "Audio Sample Rate Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/SRC/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/samplerate.c;beginline=1;endline=17;md5=d0807c35fc906466d24a50463534815a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
+                    file://src/samplerate.c;beginline=1;endline=17;md5=c45e8e3c7371009f0a4a569f2f22e25c"
 DEPENDS = "flac libsndfile1"
 PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1c7fb25191b4e6e3628d198a66a84f47"
-SRC_URI[sha256sum] = "93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
+SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
+SRC_URI[sha256sum] = "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
 
 UPSTREAM_CHECK_URI = "http://www.mega-nerd.com/SRC/download.html"
 
-- 
2.1.4


