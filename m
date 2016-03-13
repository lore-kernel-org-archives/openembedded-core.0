Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC727316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so11566300wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bUxjGVA03s8jGIu10uP+OApLTpBh2jyHCIxjPQoufEE=;
	b=Bij2NPmzy9nqSZZVF1tcDVm/fAXmEVWHt7A+DQPfSHCySsyuASuTsvhjvoKjv8ymri
	tAwjKTrjwfYtj0q26Wzy4+X0iq3Bj/Dr37r3qrPcoUw/yvVLDDQkIajESbOfFYWXaC3/
	VRlnlAGYwnUzzWR+FgDZQ0UBEmhtvunJpJHQNM8PUMl/gXHdiyLLHNiqlriA3hcdPQ3h
	VFgcUm8bevjJkM079rUdLPkvoUEGX12FAvfPlYjAVGFIQXMFpB/h++R3bjPSTfdqspIp
	LtSQjUBExKv8bd6Olw6CINmdRoHmDYrRDmYmolYQdTCwUAaz6bZtLB8B4+jQhjsNMvHn
	Rmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bUxjGVA03s8jGIu10uP+OApLTpBh2jyHCIxjPQoufEE=;
	b=By2Cqu/pkDEViYfEvwuI8UVwFIDj4G/w/6f2pa42tldTP6DaYvZF3VZT3yy4BIprWu
	KYuYAJER/s6C4O/5SoYROvZtsw1rOQt2gnxUrSjf8F5mRn8ry98ZxgCdZBt880OZ0Lz1
	Rzv8c5Pgtskmq6us2cp+NCU/vJnfy1O8Tun61bJCIudvWMmq62O/6bWqy3j+WX3mx4ei
	RUWWgfmxjIRCqZUOsC0C+PLbXT2FgDGS/NSCFtGGxjRAhlTqON6u+wzwAQGpBsIRdhMb
	FcBqz11/BndXpC23VmRv35n+R9OHmARk/lZ+ggU40Tcz1KKR53QwiPIxC4xEUdEW9aqC
	3cwA==
X-Gm-Message-State: AD7BkJJM9xbwAbdjfKIhUPN6NdkhgAHfftg/fDWo9faaTxIACxX8qUffaFrAbj29wfkLXA==
X-Received: by 10.28.176.200 with SMTP id z191mr14065866wme.91.1457896512818; 
	Sun, 13 Mar 2016 12:15:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:11 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:27 +0100
Message-Id: <a01edc39682034077f79175b3ae3f48e5f15ad2f.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 29/42] sysstat: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:12 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index c353291..9e0e0cb 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -36,9 +36,9 @@ do_install() {
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_system_unitdir}
+	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_system_unitdir}/sysstat.service
 }
 
 pkg_postinst_${PN} () {
-- 
2.7.1


