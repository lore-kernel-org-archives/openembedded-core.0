Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id F367D6CD79
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:14 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2308339eek.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=vSvUdRyUwDF8P7lR/cL6YXTKvfi/5nsa+MRgF2cEc40=;
	b=Ilb5b90zwwW+r3NR7SJ9mzf7bgUH761a9S8VyZbzgQtPSvDZ3f6HCMohfuFCO5FKbj
	6ECTgnnsPpJz73eAHbowjkKH3v6n6ODPUiBPsni9q/EmZ2uEe2qWeicK46p+xX3sAelQ
	gpfQruryE3Fauy0VxKXtYzshub7UdZlzvRieKy5zfTSMnkAfQ+FWanU5StHuYD0l/HIP
	exOeN6S8FGf5pCsp16GcVkTO0HekTCy1s+VEg3rVfwrxPAS4Zt+GIiPkjnVQtJpH22Id
	GYf9Rw9rbzIvqC46PtdJ49KwKA1t3CNdiMKTnli1yP7iNR4h0ZNyo4pYC7Q8tzdKIf5B
	Mhng==
X-Received: by 10.15.100.198 with SMTP id bn46mr29952149eeb.11.1380975796575; 
	Sat, 05 Oct 2013 05:23:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm39213534eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:07 +0200
Message-Id: <fc0073c253dba77bb4725f49b815966850fd511b.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 10/14] x11vnc: Add PACKAGECONFIG for xinerama
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 24c42d1..7b3501d 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -20,3 +20,4 @@ inherit autotools
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
+PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
-- 
1.8.3.2


