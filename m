Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE7E561996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:53:40 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id f2so4682952pjq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BRia6wy+5D7G89r6HcIQi0HLKjorUwUVRDkfgg0N/RU=;
	b=t5NoIlsimuy/h56IBQ8vngN9c35Bf+111e2UfWxsZGZHSLa7CvmvwFSYDZAF1ZfIxG
	WqnrKBufAf+U28+fh9j2qLTjXC6650VhhztQ3bRY232pzzOLiFQBlv1zBt1IP3cKv0hD
	sDWI/e/DqZeZaDXzVSSv2WXFXEwJ3bo5rag7wotImlpDmj+gAgAgvIHwdFO5MU0qqawm
	x0RdJVlXQ1l6PCr90x4W5hmJ1G1G+Xp1f6mpPNIp5lLh6SCYpsTX9K/gAmnnot6vPr1I
	rJTLzg+O0pvyU74DN+zyTtHxh1tecLc/8f7V2BcR2W7sz2aiEV2gelrjS0EX5tz0IbiP
	AD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BRia6wy+5D7G89r6HcIQi0HLKjorUwUVRDkfgg0N/RU=;
	b=DrLr+MEddBzSM7ZPxZiX4WC6jex6om8j0f9FToAicJzuYOLbD48oa/+cFqNxSNtwor
	SdSGpRxwBXWHb0cIl44xSBIDT2eIKIiHjtmqTnj4xhzp/jJgcpSzctnbIJOWNjtytOqH
	blGjEO0FefgxOP3D3iMxvZC0xWvECnQWwEGKB+e98lc5QfoF9WPZILC1TB7f7BHX/WNi
	1eTmmUX2r1UVkzLMwVSknGkeTJZO8kbcP3/yw0EvDOmjrbfsB7z5by/UVJC4d6+tfeTd
	mIa5epWDIVHaGKSf19TUIG+bzKnig+FGVqW2R7Ni3RWObm0TGd+1QBMbjV3TMr37ZxNQ
	nXuA==
X-Gm-Message-State: APjAAAVl9JqAw6AbusEfC4IxBu7Xgs1Vc4tFD6aMtWLJR9boGvLdP5bL
	lSjkj7frv1lYKsqh0ETlojH/QGiQ
X-Google-Smtp-Source: APXvYqzQobcXj35Gyi8C7kcFfCC3fSAOMyXFO/5SSAR67AetiY8UUY8CSjMNeEkBcVtFdk8g9Fj51Q==
X-Received: by 2002:a17:90a:cb96:: with SMTP id
	a22mr7017139pju.96.1582930421607; 
	Fri, 28 Feb 2020 14:53:41 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	136sm11578610pgh.26.2020.02.28.14.53.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:53:40 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 117792A053D; Fri, 28 Feb 2020 14:53:40 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:53:35 -0800
Message-Id: <20200228225335.28139-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228225335.28139-1-jpuhlman@mvista.com>
References: <20200228225335.28139-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] cups: make cups-config a multilib script
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
X-List-Received-Date: Fri, 28 Feb 2020 22:53:40 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

cups-config encodes the library dir in the script.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-extended/cups/cups.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 34982819b9..c5a60bde12 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -22,7 +22,7 @@ LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
 
-inherit autotools-brokensep binconfig useradd systemd pkgconfig
+inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib_script
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system lpadmin"
@@ -100,6 +100,8 @@ FILES_${PN} += "${datadir}/doc/cups/images \
                "
 CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
 
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/cups-config"
+
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
-- 
2.20.1


