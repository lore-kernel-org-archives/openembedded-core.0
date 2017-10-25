Return-Path: <prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.217])
	by mail.openembedded.org (Postfix) with ESMTP id B77286006E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1508934883;
	s=domk; d=rsi-elektrotechnik.de;
	h=References:In-Reply-To:Date:Subject:Cc:To:From;
	bh=iVRBaqqewDbUP4rCn1QFZDfzAKm2ElrDyqmpTsk/whA=;
	b=pbMNcetMxt+hlPzj2+tGlA3ACadK6rkIip0l/5oispDEaiMmuFiGWS5Wr6qsrPJgQl
	WwgUGKCPZRLR4jakNPsX0H6652YJMfsOJVGuIPv751gHmdWMNlw7e6aXewPS6bYvlJEe
	WvIYIgSniGgh8ccGwakALZ9gXB3oqxScuSQI0=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9mHNc01sePA6ZpTLlbQjW24Oop5Qo4fhADQi1rSTLfuAPP4FE=
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2cf1:e1f:af6c:cbea])
	by smtp.strato.de (RZmta 42.8 AUTH) with ESMTPSA id 40b7eet9PCYfQsv
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 14:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1508934879; x=1509539679;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=From:To:Cc:
	Subject:Date:Message-Id:In-Reply-To:References; bh=iVRBaqqewDbUP
	4rCn1QFZDfzAKm2ElrDyqmpTsk/whA=; b=dtxx9xoUdR0D+rWOso/0xqbNYTwjL
	vuvHJCrsoQh1Ugi8jLAVER2eKt9rYyFHxUKXdofhjeyt/5fnhPQ6GuIyJmE+fAdd
	XbLaTLAs9SG2CRNSDBT2qqpljYTfLs+55ueJa8aMjJcZ7ZB+xQvDrVQNVSwxOyTS
	xFfvsSr3FfSe2U=
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 25 Oct 2017 14:34:39 +0200
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS shortcircuit=no
	autolearn=disabled version=3.4.1
X-Spam-Report: * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28)
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.5.0) with ESMTPSA id
	md50000014558.msg; Wed, 25 Oct 2017 14:34:38 +0200
X-MDRemoteIP: 62.168.35.124
X-MDHelo: localhost.localdomain
X-MDArrival-Date: Wed, 25 Oct 2017 14:34:38 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 12:34:10 +0000
Message-Id: <1508934851-3067-2-git-send-email-holzmayr@rsi-elektrotechnik.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
References: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
Subject: [PATCH 1/2] ed: add native class
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
X-List-Received-Date: Wed, 25 Oct 2017 12:34:43 -0000

Signed-off-by: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
---
 meta/recipes-extended/ed/ed_1.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.14.2.bb b/meta/recipes-extended/ed/ed_1.14.2.bb
index 87d03b1..06d7cd1 100644
--- a/meta/recipes-extended/ed/ed_1.14.2.bb
+++ b/meta/recipes-extended/ed/ed_1.14.2.bb
@@ -33,3 +33,6 @@ do_install() {
 		rm -f ${D}${infodir}/dir
 	fi
 }
+
+BBCLASSEXTEND = "native"
+
-- 
2.7.4


-- 
_____________________________________________________________
R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
Fon: +49 8444 9204-0
Fax: +49 8444 9204-50
www.rsi-elektrotechnik.de

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


