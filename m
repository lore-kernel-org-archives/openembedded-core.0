Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 52A57786E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 17:18:08 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v105so11473689wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 09:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CB6WYvq4loAOabWHofasYjWTWc/I15WFo77jtuO4RLE=;
	b=LTLir020+GbSRmc7KhwPUezEhthLQRFymaMB6A888TXOH87FBmGloO/nac5n4IjFFF
	rQ+bf/zsg6avl5Zp4Ae5qZDOWcUPUiGbPUy9EQ2xITvWOgw7bX5Qv3/VLF8KYgJ3SBEg
	FmUJDgiQKlIHm8sEPbtdY9zGfSv5uzfKy6iuqK6CKllWQtX1gnt1jZ6AS47WXVC0r/ki
	d9v+/e6/DHO6cIzptZHlDEEch06tvqeKbEFkRihaH2PQIRNM+nPsVjc8pkvxlepIoRtt
	hznRdd+57RF47YcpCbBgq9N4sIETc1O1YgnuMZX73Th/J9G8cIbGqmyWJCnas/awijOZ
	Z42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CB6WYvq4loAOabWHofasYjWTWc/I15WFo77jtuO4RLE=;
	b=fewNTCApaFMNofB89be3m4yj35mwa9kgMtWYZiHi9eQpWaqPge8A7Rkq5YMdwoWr8/
	7NMQjiLLDymowOoCwYDAmJPGoXyz+ELk+dXe8jz0czwXsx7E+MaKXmGSqZz15HOInA4t
	VQaM+jC434oO7EeCwtpxHusePwv6coqpsFUj/Em59i2w+TbyYhUe+PHukHWAuihlmDbD
	YWRSxCgClrqmqeNOvBjxeL9FoXO8SpK3w3h3ij8JP1ek/4/W1ZZXcwMohC2u/1SjZbG7
	sNugOfuoDB9iuymcq7s/hMBjHx+N3Olr87dLmdCEqS2rKWeBf7wz+OXfeqpOY9fe6bBO
	AUDw==
X-Gm-Message-State: AJaThX5cX5cmYzdKS1I1b72OvNfffN8n7nld2aY/6hLOq8I0GPOQ2i2K
	5V3lI3jDT94WQgmsQELFfs0Q2lO4
X-Google-Smtp-Source: AGs4zMYxFLILE+DL2pI0tWHHGL5tlkfgDOjkOTxPylirPFEW9jVh+DQPq0mChk9pT42mA2SDs53y/w==
X-Received: by 10.223.179.209 with SMTP id x17mr28190513wrd.145.1512753489185; 
	Fri, 08 Dec 2017 09:18:09 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y84sm2019945wmg.39.2017.12.08.09.18.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Dec 2017 09:18:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 17:18:03 +0000
Message-Id: <20171208171803.26848-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171208171803.26848-1-ross.burton@intel.com>
References: <20171208171803.26848-1-ross.burton@intel.com>
Subject: [PATCH 2/2] minicom: recommend lrzsz
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
X-List-Received-Date: Fri, 08 Dec 2017 17:18:09 -0000

minicom calls out to lrzsz to peform X/Y/ZMODEM transfers, so add a recommends.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 1a31a872d6b..e6afe2b6555 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -27,3 +27,4 @@ do_install() {
 	for d in doc extras man lib src; do make -C $d DESTDIR=${D} install; done
 }
 
+RRECOMMENDS_${PN} += "lrzsz"
-- 
2.11.0


