Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A96D73175
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so11564854wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=E1qvj8ik9FauvyyB06Z2j7HAXhN9om3votc4nRQskjU=;
	b=RM9pml/pmeBeIpelV/1fci7v26yQ2ljdljIM6UqGXv28GkGno5gvk6K6ZbxpVY5jBk
	D3/hOXrofll/YXbjI5+I9QX9jAlP8OMFz9SQObuEizgxYnDlN2Vvh8vWQRHcEj5ubAyn
	TGWLZc0PntoYQpq4loyCFx9rp5IzuCviaYyX0t8mXZvrMwUWGRKtXCdasegtyvIRlAVf
	mj7vTOE/1BdI9sHtlRKwvAsZ8M34fF4925fErs7mHHIczSSs5RFcp1QtwdilojfY6FN4
	EjoeNaLp/ZDCVewAOnpQefvbRD+Dd5+wBj9XlU7/ffzVXiVx0vjnVuq1vRK9KkrUlxH9
	2kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=E1qvj8ik9FauvyyB06Z2j7HAXhN9om3votc4nRQskjU=;
	b=XnNDIS7jNH5J+zgcBEAdQpmlV4V+yHa4Ccuq834LO35GfLGzR3JZGIRl9dtGilbxzS
	ISy40j3JCXS1rZIMuQxSzzqFGyXBOFB2RGpEUeh7gcE3t2GGsz8NwoZQB+uG4vQcklE/
	oO/oc3yXjIVYdQArxXp41IMWVSyuWOC7W2VLOdzQSuVbwoIdn1itLhRux9j9hBmJgEPd
	EtcUcHv8rcOkgnuZiQt+ejRLyxPCi/jAOH+crNoUm45Um4Rihnn8n7Nu8pXesf3ln8hC
	HRT9GlqqMdpMD6p+A0nKdgRZO/WVK+j2c16/q+b6oHI1cK0kUMmT8IZps6v8K46e5XWL
	U3Pw==
X-Gm-Message-State: AD7BkJIXMRB3peKYEBJJ/KkuPtHRSOk4bDfbuKTCcMAl6ziXGsS79GE8zE/XwUF43MtRDQ==
X-Received: by 10.28.125.195 with SMTP id y186mr13135165wmc.79.1457896491069; 
	Sun, 13 Mar 2016 12:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:50 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:11 +0100
Message-Id: <392eb96647d523fb8ede1e5dc237daaa8263cc87.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 13/42] wpa-supplicant: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:52 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index 935c8af..16ad53b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -91,8 +91,8 @@ do_install () {
 	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -d ${D}/${systemd_unitdir}/system
-		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
+		install -d ${D}/${systemd_system_unitdir}
+		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_system_unitdir}
 	fi
 
 	install -d ${D}/etc/default/volatiles
-- 
2.7.1


