Return-Path: <prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.219])
	by mail.openembedded.org (Postfix) with ESMTP id 4DEA871CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1508934885;
	s=domk; d=rsi-elektrotechnik.de; h=Date:Subject:Cc:To:From;
	bh=0gC8uY+eWBrtz6MYVobAW5urU25I8b2EFyHDUVm/1e4=;
	b=yfhx7yqWj46KFMIzePWD3sEh+x/RJAca3NfCgIREwpRslPNmHVhrEVxKW6blP+VQgM
	izonRa6glPWR8hNMvJD6AIqtnh0mgvS7nzr8QMiDEutnncov7huIWGX6DKP4rHaM2qO1
	JFGaCTdP9b7LkAeXQcliuobGJt71DE6u4sgZo=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9mHNc01sePA6ZpTLlbQjW24Oop5Qo4fhADQi1rSTLfuAPP4FE=
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2cf1:e1f:af6c:cbea])
	by smtp.strato.de (RZmta 42.8 AUTH) with ESMTPSA id 40b7eet9PCYjQt1
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 14:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1508934874; x=1509539674;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=From:To:Cc:
	Subject:Date:Message-Id; bh=0gC8uY+eWBrtz6MYVobAW5urU25I8b2EFyHD
	UVm/1e4=; b=WjZxeU5pDLhmASvkwLZKq5vhqATJ2RPtKHvH3+tb3EowxOJEohZM
	mRXycS7NYqzTjhJJPeMWFoSjoztDKGjQsl8W8/fCLNh2jN1CJKoZYuOUgGjL6mEm
	sjo3d1UjntwjjZ9D/0tjEGJdsRLEoCjubVfgknoaOzLUacxG7rAvxGI=
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 25 Oct 2017 14:34:33 +0200
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS shortcircuit=no
	autolearn=disabled version=3.4.1
X-Spam-Report: * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28)
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.5.0) with ESMTPSA id
	md50000014557.msg; Wed, 25 Oct 2017 14:34:33 +0200
X-MDRemoteIP: 62.168.35.124
X-MDHelo: localhost.localdomain
X-MDArrival-Date: Wed, 25 Oct 2017 14:34:33 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 12:34:09 +0000
Message-Id: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] version bump bc to 1.07.1
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
X-List-Received-Date: Wed, 25 Oct 2017 12:34:45 -0000

This series bumps bc to version 1.07.1.

The changes include the needed:
- change of license to GPLv3 & LGPLv3 & GPLv2+
- removal of patch which has been upstreamed
- add native class to ed as it is now a build time dependency

Josef Holzmayr (2):
  ed: add native class
  bc: bump version to 1.07.1

 meta/recipes-extended/bc/bc_1.06.bb                | 26 --------------------
 meta/recipes-extended/bc/bc_1.07.1.bb              | 25 +++++++++++++++++++
 .../bc/files/fix-segment-fault.patch               | 28 ----------------------
 meta/recipes-extended/ed/ed_1.14.2.bb              |  3 +++
 4 files changed, 28 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
 create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb
 delete mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

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


