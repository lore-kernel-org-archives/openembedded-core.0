Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B36C765C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:40 +0000 (UTC)
Received: by wgxm20 with SMTP id m20so10925967wgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y0H0ji9cB9Fgqkv0m1rqoUxrNZuSzS5PUPNVN/I3Xw4=;
	b=PcZ3mUuJGMNkzcRSQJxBey8rRTDGtBfHYBpdAjMNHfQemMM4cRKXEbSS9oQ/1zC0w7
	gW9Q+0Q1UvDt9jQrWSwbSIjTKXJAP+uzBFvjrgaOTlRmnOFP4dMBsbUyy8mGploUMAsw
	neE956itWJ9sHtV47AY9tXiCWvTDqUvC6hUfWEhO78bs4hBJHiK4OPhydmijm0JkC8Mb
	1CfVQTjlkC9vl1pxBB7cZ2QL21t5A4NL2GANNebzSG99QzHstVOaRHXwp8VbytTf79FN
	AttMv9sXR+ifqOGDMHpZNu9o+fWqJZIcDzrAZBkMdh2zbM/MlZ2se5uQll0DSJe9138I
	Qn2g==
X-Gm-Message-State: ALoCoQmf2a7E34zL8XOqxdLDn2S0tlyfgYzIrAav0Q97Nkqga8YC8q54/lS7Ff0q3V1xfwYElIsp
X-Received: by 10.194.122.132 with SMTP id ls4mr74185971wjb.130.1436885800111; 
	Tue, 14 Jul 2015 07:56:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:50:57 +0100
Message-Id: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/7] systemd-compat-units: set S correctly
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:42 -0000

This recipe doesn't unpack any source, so set S to ${WORKDIR}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 6419bc2..0b8ff09 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -7,6 +7,8 @@ PR = "r29"
 
 DEPENDS = "systemd-systemctl-native"
 
+S = "${WORKDIR}"
+
 inherit allarch
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.1.4


