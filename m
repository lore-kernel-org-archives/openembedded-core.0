Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f50.google.com (unknown [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 878B460196
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:19:56 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x12so7786888wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kLfHPmNxSlEMpJ8odqupyt8IxLyqt67/5rxXiD0Ht2c=;
	b=byuyx1RduG5efQURMmeoGK36juU/nv4AwI/1uFdmoLwxtJIpoEB3nC46m03LaNibBL
	4zLBnZd6LD3PXUlKDPdaLNAqUf8B6k6lnqyaR6PZYqeJYHsYJlHzvLr82MeOzQjJ5a0H
	9HNMJsk+ZKl8ou1WSXc0DGejZiUpe6SZ7iUJtJVwZ5Tks93wEQVZfQjbBB6u9J/96eNJ
	/sPG6j7v3JuuGRMaFwQ+yUCLJZAvOHU69vXjPvehL8QGyZpr8+bdpYmboDL8G2SKrV4V
	3P4HF8QToIgKakZBwnQtThGNP34oH/cdz5OJQtmhT9YCIvBt1cskYjV4v3gY5CPpzG5j
	3CCQ==
X-Gm-Message-State: ALoCoQnKdcB1c3YjZ1a3LFHSYglv1+bAQktR1wsotjNhTU571Ujq5u5KFv0LB/lIeI2YWM/Sgm4P
X-Received: by 10.195.13.76 with SMTP id ew12mr57876wjd.80.1399965597319;
	Tue, 13 May 2014 00:19:57 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id v17sm557902wib.1.2014.05.13.00.19.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 00:19:56 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 09:19:51 +0200
Message-Id: <1399965591-10258-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] curl: make PACKAGES match with FILES/RRECOMMENDS
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
X-List-Received-Date: Tue, 13 May 2014 07:20:02 -0000

Mostly cosmetic, but entries in PACKAGES should be specified the exact same way as FILES/RRECOMMENDS entries to avoid problems.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/curl/curl_7.36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
index bd7191d..f3401fa 100644
--- a/meta/recipes-support/curl/curl_7.36.0.bb
+++ b/meta/recipes-support/curl/curl_7.36.0.bb
@@ -47,7 +47,7 @@ do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
 
-PACKAGES =+ "libcurl libcurl-dev libcurl-staticdev libcurl-doc"
+PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-doc"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${BPN} += "ca-certificates"
-- 
1.9.0


