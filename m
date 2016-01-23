Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id B62D076FE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:22:16 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id e32so84883576qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0dsFvRxAb9sh75KS4C7ha8aVmG8gQSs1ZoRAOTXjq78=;
	b=OTp83TbxNDWMWgf5TsuLN8z9wlotFpXXDJEnMwd6fEgNkpa7lqnjccr1Sf2joMx81F
	mKrvEYXvdoKTvoOIf3vwP5cS7Tr+jVXO7D/hLDOSDrO8mORdrLprqwxGXVVWhGaZD4UU
	wASKIaDQTI1PqmaABPJ92K2JKAcWji8jpHFFx+rUjQKGMYzXafTxHSpwphb9Cv8Qwg/4
	wtYW8pUTaD3nJSjO6QFcCQoRHmXOz9NTdTUrfwUmoWLeAvbxQkSvj/ivAoERbDZsycez
	HDN8Clvh5vVXt5AGVMm6xsuIBclLhT3yzkIHNoNJPXeeKV449QLKVV+LgCCAlg43cAPi
	QhNw==
X-Gm-Message-State: AG10YOQNfaDU43zsRY8oTo5gPh+EhtZsIo6Aosf4B0Ufj5/QUbZStR6Ee2+1//xiC8aCyQ==
X-Received: by 10.140.167.86 with SMTP id n83mr13038712qhn.41.1453591336994;
	Sat, 23 Jan 2016 15:22:16 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id u14sm3792707qki.3.2016.01.23.15.22.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:22:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:22:05 -0500
Message-Id: <1453591325-8378-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: update to 1.9.9
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
X-List-Received-Date: Sat, 23 Jan 2016 23:22:17 -0000

---
 meta-webserver/recipes-httpd/nginx/{nginx_1.9.5.bb => nginx_1.9.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.5.bb => nginx_1.9.9.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
index 87c953b..06d61c7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "2562320f1535e3e31d165e337ae94f21"
-SRC_URI[sha256sum] = "48e2787a6b245277e37cb7c5a31b1549a0bbacf288aa4731baacf9eaacdb481b"
+SRC_URI[md5sum] = "50fdfa08e93ead7a111cba5a5f5735af"
+SRC_URI[sha256sum] = "de66bb2b11c82533aa5cb5ccc27cbce736ab87c9f2c761e5237cda0b00068d73"
 
 inherit update-rc.d useradd
 
-- 
1.9.1


