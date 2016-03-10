Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AEEC76E680
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:49:31 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n186so38962776wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JCKsiIl6vRmYv3blbD3t3UTOtommV/+bLatn7EpHnig=;
	b=P9MtFnkfaQgaat19Z08UVbguRTlOEsNNZEZYG/IgXboRtn3Sn5KOycqDdF/gmwEYvm
	iGU4VgIqTqJivtOrjNm7k3McX3bGbDVF+bL+too7TQGuFM5+ONoR6ReyhWB6feQpr+4k
	FJvAzhH2dLXXTaHg+S+hDRpYIbTL8YDtkkymxVnEoV6FzL38zEHrXTNmOOm2CpcPcyV/
	u8odpPkvvfCj7MxGFhDpRi3tK8QSgikWMylqSzq2kGgm1yNPwUig6LoqjgLsUfUuI6xe
	AVglK2L/yqRLdGDAlDo+Na2OyGoaJiIGM3mW/aELiF6scOtGdMxkcWCWtf3LQs0ue27g
	VlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JCKsiIl6vRmYv3blbD3t3UTOtommV/+bLatn7EpHnig=;
	b=Zgeq3hPeG+et1mUzIYZ5C+03lPqv+/Fb2ABnZP5M+H3Eta7Q3mZBWF/050lGw4dL1t
	MHzuUnmoMWTcjv0Gv/Gi8eQwJ1cKMf6DC4YZPJvcNw76rcZT1aueQ3HCRbH9e9JhbbSt
	QwrlWXQe48pA4MG3hRR3CvIStCkGPli6EcRYPaRaP19ZCuqNncOWG3iOSGTKziORYyz2
	b671DBM/9mtWp4osuue4iX/4Wid7JyQUGoC8PcQ1vkLBGkck0IeLmgCRFdzRmXlQ95VB
	c3xpr6IvbwwxkOiLJFkijM9fkFtz6p3e0jY7+j6D+5lKZzO3f89lZ8wxH8tLPWMn1sjw
	WBLw==
X-Gm-Message-State: AD7BkJLSFKanKu9RZXgDQIhBWljBzEGcDPqKZWWAomUWZun2aeM9pLkRMrFq7UXSo27HYxKu
X-Received: by 10.28.55.139 with SMTP id e133mr5157554wma.98.1457628571899;
	Thu, 10 Mar 2016 08:49:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m6sm4357616wje.21.2016.03.10.08.49.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Mar 2016 08:49:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 16:49:29 +0000
Message-Id: <1457628569-23047-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] systemd: add comment stating that resolved needs gcrypt
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
X-List-Received-Date: Thu, 10 Mar 2016 16:49:31 -0000

The resolved support requires that gcrypt is enabled.  PACKAGECONFIG doesn't
support dependencies, so add a comment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index cd48360..ae88c89 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -101,6 +101,7 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
+# resolved needs gcrypt
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
-- 
2.7.0


