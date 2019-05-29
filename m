Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD2C160053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:41:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v22so1809944wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=/rO/oKmqp3fUcCOqKS5VRHd2enGgHAbFmN66Phrkws8=;
	b=IZxv4jp2MElXBBimEmZZFqtUIQW+bMy2VGCeisugaWFdVTQ+PpdFF6cReHo8q1y4/h
	5Uce8MUpv76NPTa2dQ5xqsY4pRjNQL3XjrgQAlercg7FvDcVjSo3583KP24l7TqW24kW
	RQuCfsVcp837aqVYgLMkgNeVz2bdn8/sOBOPZjf8o1ScZgAr9HMRmCL8N+dZsArn77+P
	fQnnhMw4qlHtLz2XDQbedQ6yGwLXGUiDsBo/d6eBvd8dct5Ms2BQRAQCMdgUHROWkmLd
	+g2320veTrn7Uz/PozvhyWbpwH8IYMOKQWEYepX3g4Cbo+VquleK5k7AMXEeFJFMUy3I
	F8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/rO/oKmqp3fUcCOqKS5VRHd2enGgHAbFmN66Phrkws8=;
	b=nWw2mKShgnGrKu07lIuQWY8M+OzL6xbugC7a/IjixzEZY7T7PWMJdZZEbpOG84oD86
	xbd4tA6xGqP2D0K1VD4ml4+x72sBdQDaK08yXUM8fO1Vk2PpNmNAjlb9q015xuR/Z2VG
	TS/F5A4/k7t8fGArT+p9p1DsQidU5bhljLcpUeaPfypAhVQzBUKQ7izntVTBNhuAJ+d2
	y3xHSw0NIANfL30wqe8va7Y3NAPDDGAHEehDSJSa114o/Hg6tjah9aeVHWT+zX9mW9o6
	QaHyKEPFJCHW6HK1lHQlXIPLmqkykh0Yj+jJx0y/OMMtUoKASVa0zxQydM2Yfm2a7ZSo
	oVWA==
X-Gm-Message-State: APjAAAUPWMSOZfcXe5VqB438i5J55A5mbZUjreN0dhtDCUrLGpz8uqvd
	j29cPuZXZApkG4oaIG2L4QQfh3sXAPg=
X-Google-Smtp-Source: APXvYqxfY0dYOGQsqoOj8tUot6qHxaAq40vA6GumjCC1yZ0AVUtqfPioGtCUNuRM4XVx6zHbpekxSw==
X-Received: by 2002:a1c:ab83:: with SMTP id u125mr7151646wme.131.1559140907087;
	Wed, 29 May 2019 07:41:47 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	p17sm18767934wrq.95.2019.05.29.07.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 07:41:46 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 15:41:30 +0100
Message-Id: <20190529144130.21278-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V2] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 14:41:46 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ca-certificates/ca-certificates_20190110.bb               | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index 4c0425302f..7c06573db2 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -82,6 +82,8 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN} += "openssl"
+RDEPENDS_${PN}_class-target = "openssl-bin"
+RDEPENDS_${PN}_class-native = "openssl"
+RDEPENDS_${PN}_class-nativesdk = "openssl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


