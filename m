Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 130AB6D034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:06 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so1900083lbh.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Lv2mDO2wyS3dDzNxnru6n70E0iA2CioMocjsp2dhbNM=;
	b=AtH9xIoYipKmY4saoTiJvMoUQ/G5QGXCU/0coJrNrmJlOcoTpN1/INRChkv3PrRo9h
	Rry7QpQG0am4tdpz809vuOHVY74umEnkPRQatY7BHXYg8lHkKlXOkhdOPTpwWVtkJeyc
	Mbq+eCEHR1jvKkCElqUcPQjyBCd2CwfjgT9aQCsvhAYOVBi2rTnapYRZ1eAyHBFZxHVM
	uRhSafW4Wg89K0DZhKy7yNWCKdRPbV4SmG3Een05vpjmoykeKf2EUGsLbRcX431X/nRw
	86I53HG37YZolJk+5esaT+scguMF+phmEDHwWzjtYe/rUUWca8Rg0V8+lDYImIHXyPK2
	/jlg==
X-Received: by 10.152.203.233 with SMTP id kt9mr7386688lac.29.1382018408321;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id 8sm4371546laq.5.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 1310F400F79; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:41 +0200
Message-Id: <1382018386-25389-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] rpmresolve: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
index 48c52c0..04a55fd 100644
--- a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
+++ b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
@@ -26,4 +26,4 @@ do_install_append_class-native() {
 			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


