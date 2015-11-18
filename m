Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 913626010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:29:06 +0000 (UTC)
Received: by wmww144 with SMTP id w144so65335567wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GwWY8zcDwQCAKGbcAz2FYSoBoCmUIoT9ODabdKnztFk=;
	b=lBCjGmdLWbgvbu1Kdqzkc4Lj6xb5w11Uo0Y/1l4zQd1ZFgQSFRsyZNax1P4wOWxVkf
	aSnhws6zsHKC3F2O/U4BPNgf44t7YRgiNPvFQRxOBI2fJeQ5okz8zq7A8O/3VnngUif5
	PDjWhOuqpnVpQDS5g6jGrXT1fvFJOV18BWEcztjTqqYwwIXfpOHjzEYfZ82LcG11Srky
	v75+ZpdIddO91hc97bsrcJ24ezG+fGj7u5DUuD0z0zZDzvoztNCs1kUlccOS48xqEsYm
	ukhLbjkDQl5jYqtdTkMA8THgtrv6RRCLT1knwar1AzHxJvUcQ/K4UiPvtWAL9TPBRD98
	MWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GwWY8zcDwQCAKGbcAz2FYSoBoCmUIoT9ODabdKnztFk=;
	b=f6oaPQBQlCI/guh0ZYK51nqlEExNDtXFvGAGKFtKlnWFIwVNlVmeoX7zEOZuDjEKQj
	J2UutFOGWBplGQMuRfhGKVm0DZuo25TOl1v1fCcjLush1l+0Y/lbZzEBb58x2DV9Yhqn
	a0yD8pIhBmXM1bv7hQ54x8ACDxIFlexfjLLvl3drRvh8hjIQAGlMWhZX0uyei/SSHLjz
	VGB8Gvp550mEt+NY/27uNPFlr1j7s406RFQTypCCxyv8yaOwohXYSQBS3tJRc0IWjf76
	ZcraB9CtZ8SlQ0FC4t8hmhxxhJ/eI5KLYc3/VyBTaAtbvG6JcsG4JDe5JcCFGub5Jszg
	z8hg==
X-Gm-Message-State: ALoCoQlROj55Th9oJLGlWmIRYvCadwI6GTGmz/BQchXrpIG0hq7xor7ZXuTKFXsFgJ8joDTKGZg0
X-Received: by 10.28.32.22 with SMTP id g22mr2923152wmg.43.1447842546555;
	Wed, 18 Nov 2015 02:29:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	bh5sm2096095wjb.42.2015.11.18.02.29.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Nov 2015 02:29:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 10:20:38 +0000
Message-Id: <1447842038-15346-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pango: add RPROVIDES for removed packages
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
X-List-Received-Date: Wed, 18 Nov 2015 10:29:07 -0000

Now that Pango has merged the external modules and engines the packages don't
exist.  For convenience have the Pango library RPROVIDE these names.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index c0109b2..04143bd 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -51,3 +51,6 @@ FILES_${PN}-ptest += "${libexecdir}/installed-tests/* \
 FILES_${PN}-dbg += "${libexecdir}/installed-tests/.debug"
 
 RDEPENDS_${PN}-ptest += "gnome-desktop-testing liberation-fonts"
+
+RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
+                    pango-module-basic-fc pango-module-arabic-lang"
-- 
2.1.4


