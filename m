Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id AF4567ED41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:03:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g67so17582283wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0RMilA8oF5ShBSTmnwpVay4Nagnr7bmcmMV+YrT+NrE=;
	b=UFws+9WNPIVi9q1linFDk7VvUmMM/z8eFXloWR0OVTCf7YIChDyohFA+RpNpCTJq0L
	Sy9Sk4+oM/vfAHQTWHfezumbpnCee9VqRq2CP+RuzB/cvvA1aY8KJPAuIx/yiJtTnQV7
	bnquB+wlYZrzkguYxsVltN8kKmy5py9nyr1FKwIk+pIQ5wwvUxjR7pBuV7bkZ5e8yrX0
	v/bDwE4L8LnSClaYko3SrsYwnkWcCAgp3HnanuvVXqKXygCAY60lCyBWjvu0d0UwxFsl
	6fQneyjtWL9PoJgF0PIW5CBQimk81ei++1mCtTrrl7PXi6jdSRajtZc6DdOynbrs6or2
	w2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0RMilA8oF5ShBSTmnwpVay4Nagnr7bmcmMV+YrT+NrE=;
	b=aDveCG1COgltSwjaaEpISolXD1S8TPp6w2XKn1maN6kj4lz2V11CQZKF4wdGMPPWy1
	WNxUPWto28R5RkXVhz0MD0kflZZPmVy7Ppz57PWBQ/EV+DYTTopZwzp3KXFjTSgVIZVi
	eIzFr846vcqVWoCveBP0NeORd1N8hdOfzcV5AaNNXqye5Aq6tKo2xa85cG3NmflkmJaE
	c9TzsI8W+JZkT4Th2PWloDxonZeLiPX3fMwqoKzL2ghaaW2+F528MQwaPRl9JywxTnNP
	dovHbZuITf/w0PUcObmdYsVzqdG1lDF2r6hAjs4EEeW57ZibRuZO7RxVxj6YJM0rx0vt
	L11A==
X-Gm-Message-State: APjAAAW1pAeBjhEtndg2Cv5HA0qCkJmluRo3EvN7qegCJaCiik4lCgRl
	Lr0xkaEV04WnqiqWnjfAbSeLCUHPDbI=
X-Google-Smtp-Source: APXvYqypvtmHnKug6cJGePy6dvZtJA+wYzVDnNOx37X9tTpoCfIafWrhCM/ECgALB85n2HjOb2KidQ==
X-Received: by 2002:a05:600c:230c:: with SMTP id
	12mr35089249wmo.166.1563361410060; 
	Wed, 17 Jul 2019 04:03:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g8sm24584326wme.20.2019.07.17.04.03.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:03:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:03:24 +0100
Message-Id: <20190717110324.24433-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717110324.24433-1-ross.burton@intel.com>
References: <20190717110324.24433-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ed: set CVE vendor to avoid false positives
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
X-List-Received-Date: Wed, 17 Jul 2019 11:03:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/ed/ed_1.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.15.bb
index c79310325f5..886c3ddcab6 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
 
 SECTION = "base"
 
+CVE_PRODUCT = "gnu:ed"
+
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-- 
2.20.1


