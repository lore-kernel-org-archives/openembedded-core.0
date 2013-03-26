Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOB-00078A-WE
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:25 +0100
Received: by mail-we0-f178.google.com with SMTP id z53so1796068wey.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=6yDRBlgDgHft0CiX4Ou1zVy9+M5EsDZ5MuwRuwfo8eI=;
	b=Kizgu/D/FZL/p19fhHDSMZAHCPqkvu0IN1V8d5/c6HLIGF+brg9uQRUwchqZKyxlHO
	iqZg3Jybo/NIKitYNFX1A5HWx7SLvPms+8ZjgEfr6FQixW0D4hJAWtXm5If4kALCNcxx
	foJdvCPdM/0vx/wqeRQAp4o8V5H4giWXiuxFapWwC7asvjfui6Rx7T8RiNZy1PF9tgFF
	3hcy0k0lTp7nO0wUMeYHRGIW1hXm5Ua9/5ezM1wmxG/JBHTWkc0JbpP+RCmzk3GCcHXP
	CyG49eIfWafm7azzAypEFQZr/kQrGMGyrJ/yVNIgjVeXFTBUZSzZSsqLmV96JOMJ9ccY
	beVQ==
X-Received: by 10.194.242.163 with SMTP id wr3mr25971609wjc.35.1364316804329; 
	Tue, 26 Mar 2013 09:53:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:14 +0000
Message-Id: <8b45abe76131daec504aefa4d11d600ba9c9250a.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnaiSQE6Brhhm79QWetxGO16mhtbMU2dPS58OFsqaWSL2EI5TwObseKDubuTeKBMt+Nc4Qd
Subject: [PATCH 16/24] bitbake.conf: explicitly backfill sysvinit, not DISTRO_FEATURES_INITMAN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:35 -0000

Reflect reality by backfilling sysvinit support, instead of whatever value was
in DISTRO_FEATURES_INITMAN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01ebad4..cd5d61e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -730,7 +730,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "\
-- 
1.7.10.4



