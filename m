Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49E6760667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so11589225wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fYpn7GbZQ4BX+Nd4nkjGYkRy5282v43Yzg4fXAUagsk=;
	b=T9Bwk7l7/8itVU/F28ipxlnjMMgSA5u54R2TQavimNAiqhno9rayat604jycTVh5e2
	5z1VpyXjRD3rRr8GwDUpNExTNMRRToMGkiL59ma7jrWjdUkbUJ8A1ErxYPN1rUQwubdG
	h4Hh5Ds7XBUES8f9qSk5O+TLduQgC7p7fuFX6nWPGJzVId6pXO5zpGkYQTWIuV/UWOdK
	1Sb/Ea+CL8a1x42vKJ6pFfPwcaJyvqqmlEdEna2fjfKDjVVBqK4rW7nDCUxuhhluekkF
	PCy/MrTgMDF6OhlCefvvmftVGIGMGnAALt1Mu0SihTPPxXybOeLbky4Je+sjW+eSLCyC
	6fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fYpn7GbZQ4BX+Nd4nkjGYkRy5282v43Yzg4fXAUagsk=;
	b=BhAW/VfHd3K0Ushd3qsKNfBbaricleFnXQ+2f5+Pp/Pw49oievBYxS8mcORaIObWTY
	Yt/ID0DYUuD8/mJIdJ9g6jc2460RMQ1CcaPAepSfqy/B2eas32AWEti/IaO/E2p4CIps
	YqjcIOE04CJlZpGzIFEvozb9ngZhu1weZOZ3N2Gx2WoVcsxUVyjH9xcEkmFaxANofvYX
	YsTHgv4jBmf33jTwvnRxThg2c0iJ+cJOvZtCPAWX/ovWH8hD93L3ekj1gE7ehwUt/B/c
	jg+3xWuOSXJfCG2Ftg0fHdyPq2hoFhQzvQ+GC7Uv4fTgx3+Pnzg8cbdqcD4ZBojrtJDk
	iLYw==
X-Gm-Message-State: AD7BkJJl5EybE6lZ6Lhgt5IHY3xnM5Ewdgs9fGmnfHBHUhbV5hrxECjSzn08S12ho8m37Q==
X-Received: by 10.194.90.100 with SMTP id bv4mr20354689wjb.4.1457896476249;
	Sun, 13 Mar 2016 12:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:35 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:00 +0100
Message-Id: <908773c70d90c6b80b120e3773704134d1f32ff1.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 02/42] acpid: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:36 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-bsp/acpid/acpid.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 12ec19b..181f448 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -24,7 +24,7 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/acpi
 	install -d ${D}${sysconfdir}/acpi/events
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/acpid.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/acpid.service
 }
-- 
2.7.1


