Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6662A7316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so11590943wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ErekfvbV7BaN6lzwnF3NKykpe+fEDIgcjGW1N8uJqSk=;
	b=K5IEn8+iXlby9ZYtpentetlZrJl+4cP20oRNMI6uSarDoi7nQqoMzFwcrcAIa8EyW0
	5udiL7+reNAz0KhUBHLtV/ixHar640XfpV5qnhM3EccAS+6Q8e2QhEW33ZDLTU8TArVF
	XHVM49K18TFquO8x2/oFcmlGLDtZ4mPEoTb94BRFNcFVPTFmyQUwiZI9EXCdaeNk1P1L
	b0iGYTand3Km5E5svpsjB6es2NiUmxNkKNUs4spC9JsDSY+3EJrm1I7SCMaRLa2TLfw+
	vr3PfSQHRLwkjJu1HX5GcHLAhmVyVaNivYIn8nAm3LazxhpAjF4MerAmXnohLcoUuJmZ
	YbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ErekfvbV7BaN6lzwnF3NKykpe+fEDIgcjGW1N8uJqSk=;
	b=k5zckxUl0vrGBDhLIRfhiLRuF7Iu7k3LU0LYSnVMuTLExNtatJw+AZW580aaZEFXPV
	/3OZMYuvtN3cX2Ih3r3tVPhK8v7Fxo3W3XhhFAQLKXHN6YPX/tz0KOd6IP1l3jCfuBa4
	57KdggihWysL8TOQR82IqbZca1cxiRSxQ3Dmf8ykAmDYEbvOJychL/wKHc8cOndEXF/T
	9UkCf4qFWl7puRkCR2D2+i6PcXIAgMl/BdzALtDlnQhmg1I268bJGSJe8ZctEKOoLuCT
	ANQOKLW6xIOeBxMPjVXZi6SLFJixYYNDV0KCLyvB13l3q9p+Nke/AAm0SdEsNITo1jJL
	RJLA==
X-Gm-Message-State: AD7BkJLoLwfi4fexTsC3IePz343zBYeZPo7vC1n5foLW8r6MfJhIbFHCsoZFXwUBVv4Mxw==
X-Received: by 10.28.145.9 with SMTP id t9mr14331635wmd.54.1457896501854;
	Sun, 13 Mar 2016 12:15:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:00 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:19 +0100
Message-Id: <a728ae0ebf33f58580de485a892dfa4161f30e8a.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 21/42] volatile-binds: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:01 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index fee7275..e5fec95 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -32,7 +32,7 @@ def volatile_systemd_services(d):
 
 SYSTEMD_SERVICE_${PN} = "${@volatile_systemd_services(d)}"
 
-FILES_${PN} += "${systemd_unitdir}/system/*.service"
+FILES_${PN} += "${systemd_system_unitdir}/*.service"
 
 do_compile () {
     while read spec mountpoint; do
@@ -63,9 +63,9 @@ do_install () {
     install -d ${D}${base_sbindir}
     install -m 0755 mount-copybind ${D}${base_sbindir}/
 
-    install -d ${D}${systemd_unitdir}/system
+    install -d ${D}${systemd_system_unitdir}
     for service in ${SYSTEMD_SERVICE_volatile-binds}; do
-        install -m 0644 $service ${D}${systemd_unitdir}/system/
+        install -m 0644 $service ${D}${systemd_system_unitdir}/
     done
 }
 do_install[dirs] = "${WORKDIR}"
-- 
2.7.1


