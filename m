Return-Path: <nick83ola@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F54E7E456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 14:42:07 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id j4so2183464vke.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u4fCzVTVKqynctQxnymfLMH0kPV/vCZ/0Z45g/O+BvA=;
	b=MreJFnjAoyD2IdQESJauyTvK/RKb8EWw+UYWt6bp7I6A97Ml/OhOsKGSAA9L5fPVWA
	OrdQQdt7O58fDSKnjdI9DzAyEQjpKf3ZMQ0XEhvV48R8RND7ZxYn+YQvcos9SR/FoCuy
	D7ezlqCoC6d1FWBUZf8Y0OtaEAqXunDkBAenX290ogtMpGEdmzKpK82O507uMnarezyE
	VE9XSMC4QWYAH7fZq0zALgFh9aZ5iDQ6iYngtTL844RasHm+B+hvwe+XpEB9aq+5ZCDh
	OQmkRza2sJKRfUwTO64ImUFz+YgitpDNnMfSJ3QmgWGEB0fdCZkKQPCm5VyC9xOWU29u
	x8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u4fCzVTVKqynctQxnymfLMH0kPV/vCZ/0Z45g/O+BvA=;
	b=sdZCeyjW1GMuOGJg1U+Bpb+ntYe1+BfSqIU1wYk6iKdszLQR1MYEBnLVhsmPCjdePB
	1NWvWTL8yOC/M7zWQI40wnUo3BvmNp09mX7TjLb3pzorQxeFhuqizISMkBAwEGcHMnVm
	REgqtuOmqQrB0p0yCeJcJsT9iR7hnzpeE0YYL1A+0jMmYEWtp/jGlzhCtfMvt/ADkPrT
	7nuQ5zkQZJkMhyum0sniJfglqvbPUaEmIEm5mQ2ETGgSgHCTdBl0e6aUv4TE8SLRFthD
	/AByWrQAO3he/Xzdsasi/zsK27+41Y+dK74zrd3fhdOM7stNRoNr+dVk3rNQ1WJj1GdN
	Mb3Q==
X-Gm-Message-State: APjAAAUvHd+NCr4zgwNVA9+dJIq2HqssxQPDhVShckJ/Om0agGfI9VYt
	LOEgBFUlFZ7NfcFsELx7zu2PW1+3Zpo=
X-Google-Smtp-Source: APXvYqxA+n/cuWJ+ODLMPdCT9Yp5ZOaNnnSoEM4TIKuemj7xgnX1puyZLpt49UvOYBs+0ZWpzAnDGg==
X-Received: by 2002:a1f:8146:: with SMTP id c67mr5535581vkd.30.1558708927916; 
	Fri, 24 May 2019 07:42:07 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 69sm2682190uas.0.2019.05.24.07.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:42:06 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 15:41:40 +0100
Message-Id: <20190524144139.23893-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [oe][meta-webserver][PATCH] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Fri, 24 May 2019 14:42:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index c6fc0495f..9a6ca9651 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
 ExecStartPre=@SBINDIR@/nginx -t
 ExecStart=@SBINDIR@/nginx
 ExecReload=@SBINDIR@/nginx -s reload
-ExecStop=@BINDIR@/kill -s QUIT $MAINPID
+ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
 PrivateTmp=true
 
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 29e7efc14..c4c776e37 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -134,7 +134,7 @@ do_install () {
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
-            -e 's,@BINDIR@,${bindir},g' \
+            -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
 }
-- 
2.20.1


