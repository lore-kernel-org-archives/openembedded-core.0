Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 97A7171985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 12:21:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l16so9450575wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DDNmEDaQIe0FgwHKbMRbVhqyfUtw5SoZN6byqcLu8IY=;
	b=py0U1VEfLHoDTyfbvPzDWpjOgvMCzldYBJgkrh/8A5BPxOjG/oFcivZ4U+z92j5msU
	C8BcHU1q/OhcR2icabPs57RWKIOeOP9lKqcCCQ6qv7/NerQm3pltLxZnwKBuB9iitti5
	CaTXrLb7JEcNRGoH7d6WMKOycJ7RIM9b6W4NUf5HN4axLLEzCR7mLEo69xGQ241Fmmjn
	WDqvBXZJqRq1TKRS9VHBceMuZtPoC+OovsjCke7DmanMOtzsMHn+w/Ka3lTwgkly/eyf
	4Kk8vji3gCvHmZATinQeAKtUL+x4gQD8m4mBJ8SoRS1rML8npqSPdmlkiQM59JpPRTwS
	5vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DDNmEDaQIe0FgwHKbMRbVhqyfUtw5SoZN6byqcLu8IY=;
	b=H7mYpi3/um4riWPri7baI3PPVlrYy9+g4l/TiE8JHYB3fHBAX7bokyGDH1vgxPYjS9
	yoVEIZ7oWGYt2OqYFdzu0qaFJHdpt1GcYOb0hkKYcV4JIs8vV3F0k/mJx3S1tzTqgqXE
	D0RTqT4ifo3Zdr1hQdCJR1wwa3AN1tatlu2JotIDvIuaBc2BsWTaAlPB7fk1ONaUgb/B
	8/RVk2gfaz4aGHEJ0hgd/SAkUWT4TlPl1wZnCLUT0DX6jtWZmEJBDvxlCKxUdVGPJEB7
	O+UpEYZ7FdLra8FEO/SmrDJnGQ1Z2sN3RAuqErlYTRL87fn/I0XoJDGW/Q28W9Bshzwm
	Xxog==
X-Gm-Message-State: AElRT7Eq0ruXY/sE/J1mWMk7VvxHRyZSXE/Mk/woDju6PEmn2/XhwnLO
	oVZJd4jl5G23XaVzP5obiCLWlQ==
X-Google-Smtp-Source: AG47ELtsLUXIL8pbP3PpZRZNkaVauRpsp7ASL/gTbxqyaUtdYXGSSYalRcQVw7t6nlPtBq7b3AHn1A==
X-Received: by 10.28.91.79 with SMTP id p76mr1722781wmb.3.1521634884734;
	Wed, 21 Mar 2018 05:21:24 -0700 (PDT)
Received: from localhost.localdomain (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	d13sm1684512wre.36.2018.03.21.05.21.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 05:21:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 13:20:48 +0100
Message-Id: <20180321122048.22277-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] externalsrc: do not call make clean for recipes with CLEANBROKEN = "1" set
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
X-List-Received-Date: Wed, 21 Mar 2018 12:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERROR: distrho-ports-0.0.0+git999-r0 do_buildclean: oe_runmake failed
ERROR: distrho-ports-0.0.0+git999-r0 do_buildclean: Function failed: do_buildclean
ERROR: Logfile of failure stored in: <...>/temp/log.do_buildclean.17285
Log data follows:
| DEBUG: Executing shell function do_buildclean
| NOTE: make clean
| make clean -C libs/drowaudio
| make[1]: Entering directory '/home/a.mueller/data/oe-core/workspace/sources/distrho-ports/libs/drowaudio'
| make clean -C build-drowaudio
| make[2]: Entering directory '/home/a.mueller/data/oe-core/workspace/sources/distrho-ports/libs/drowaudio/build-drowaudio'
| make[2]: *** No rule to make target 'clean'.  Stop.
| make[2]: Leaving directory '/home/a.mueller/data/oe-core/workspace/sources/distrho-ports/libs/drowaudio/build-drowaudio'
| make[1]: *** [Makefile:7: clean] Error 2
| make[1]: Leaving directory '/home/a.mueller/data/oe-core/workspace/sources/distrho-ports/libs/drowaudio'
| make: *** [Makefile:73: clean] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ac1b904e72..3f1d39689b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -173,7 +173,9 @@ do_buildclean[doc] = "Call 'make clean' or equivalent in ${B}"
 externalsrc_do_buildclean() {
 	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 		rm -f ${@' '.join([x.split(':')[0] for x in (d.getVar('EXTERNALSRC_SYMLINKS') or '').split()])}
-		oe_runmake clean || die "make failed"
+		if [ "${CLEANBROKEN}" != "1" ]; then
+			oe_runmake clean || die "make failed"
+		fi
 	else
 		bbnote "nothing to do - no makefile found"
 	fi
-- 
2.14.3


