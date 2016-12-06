Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D211771A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:07:26 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id r94so8113880ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hlWuU63IZISQwFmMD8zOmoqv0vYAIjMKrxz5hvKFIM0=;
	b=ReY3OSSI0/BpDSXU9GquyAG/zxNaorLEfCMRGyWljuD6Y6VQMTWayMbVpo6szp8lmI
	lmRz3QKc8Bn/gJX1vSfkBDUSYHPLm4990G6xHeSnUTLFng4qI8IaXnX5b7rvpCiAq4Et
	JVbuwNDhaM6MerqGrDIXcruib1SeMm6ZSD4dKaeJepsw8Kxl1Q+GKPb3EDk/FCFB5xOu
	KzNofUo9fdCrsdBOsZ33cNvPhceXGSLz6X/ZnP0Ra4W1G1jNPbokZUC8qwiN72jdFPeY
	MTPmHsVhiYu12Lm9jsVaBsA5Ey59aNSQ214CPXzimo75hQ6esU6tftFxmRenboL93aBY
	IQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hlWuU63IZISQwFmMD8zOmoqv0vYAIjMKrxz5hvKFIM0=;
	b=eqKBelr9RdgC2AWWkdPZba5QzDZn0BAwvRPVa1YqVnFPiD+OWauMNZc0kh265ecYAS
	MwGTAVUzmgUlvAZJsOjnNQRPMawjaQ7kyXcmoT27cLQe32KhXPyJyADy4SLjIk8O5N3f
	zEYSIB08JpXaZy/cRoqiESscd+Typr7dk2+x7M0pFGb8olDvWc2ej1Rw6tY7NplYSlIB
	IkO1Elevxh4ANyVklkjfXX3yxgVR47Gg4+F7nC3HnnyQ+MTridengKlRU3cs8cQrlpBl
	plQtk6ElfqOUYo/sP4ZUOAhz/c7fPU8kzPyZz3zLKPWa5RJuZWmKyGON4n0YHguW/wtR
	zn4g==
X-Gm-Message-State: AKaTC02/kmuf9sXtSeWWWH+GkmbI5FMz5CaAmK3CK+7XZNRGfdKxTi4fz5D0UnhqY2QObg==
X-Received: by 10.107.154.206 with SMTP id c197mr57040400ioe.97.1481047647850; 
	Tue, 06 Dec 2016 10:07:27 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id v74sm9454116ioi.2.2016.12.06.10.07.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:07:26 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:07:09 -0600
Message-Id: <e5818f1c19681484cb80f7a94c90824701c15b16.1481043778.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1481043778.git.george.mccollister@gmail.com>
References: <cover.1481043778.git.george.mccollister@gmail.com>
Subject: [morty][PATCH 1/2] python-3.5-manifest: Add imp to importlib
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
X-List-Received-Date: Tue, 06 Dec 2016 18:07:27 -0000

The imp python module is the forerunner of importlib. Include imp in
the importlib subpackage instead of the misc subpackage so that it can
be depended on without bringing in a bunch of unrelated, unused modules.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 3046114..6c690db 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -115,7 +115,7 @@ FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* $
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib "
+FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/imp.* "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-- 
2.9.3


