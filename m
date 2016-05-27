Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2304B6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:28:39 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so12306848qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=/pGgldz7KYeZqp2sbi02ybFP65vyRVMCIuSNaJIbHQU=;
	b=fLubQO1WjNJM2ZPm7qWxjzqrf2AktwKX1KPT1VTRL8zilMJYg4Gcy78k0sGnG8OZNv
	Qp6kTW7EXM6DS+efJ3wsla9+gy6SclrNRXARo1yd7Y7154dv5L1Rx8bPyNZLg3RUSlK5
	zScSirdx2inx9douOA92tplurfgU4Jzp6ORp+1ypu7pKTdA4sQ4wE72H4eLiGDlUhgC9
	ZTYG//Ca/LN+b2kwtPsNbDJElxitj5oVHUgkGz7DOy8U5Lx66xzHYtnc2iMC6HjDIFQK
	GrGFcOiQrCjOBbxw0Gx8+92WMEZce4yZjBOZhpAhGeknWvW9VDmdCrtqQmGrf9/BtwI0
	CKEw==
X-Gm-Message-State: ALyK8tJItBI/Qus+fr9RNdV3R/EAHQRiRBKg9AVlI2xgestxQMStL/DPjyFXoSd1pIf5sg==
X-Received: by 10.55.123.130 with SMTP id w124mr13464511qkc.164.1464344920519; 
	Fri, 27 May 2016 03:28:40 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	s106sm2414486qge.3.2016.05.27.03.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 03:28:39 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 27 May 2016 07:28:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2016 07:28:31 -0300
Message-Id: <20160527102831.24166-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] ca-certificates: Add openssl as a runtime dependency
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
X-List-Received-Date: Fri, 27 May 2016 10:28:40 -0000

The update-ca-certificates script uses the c_rehash utility which is
installed by openssl. Add openssl as a runtime dependency to fulfill
the utility requirement.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
index 871bc2e..faefc78 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -76,4 +76,6 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
+RDEPENDS_${PN} += "openssl"
+
 BBCLASSEXTEND += "native nativesdk"
-- 
2.8.3


