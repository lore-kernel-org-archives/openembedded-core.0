Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C258788C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 22:35:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t3so15029782wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=t/0cspgbjRC4cXK3XBdV8mmBOmbxIsIPyZ5dj7q0NdM=;
	b=CeXs+G442+m5au2q04rupdpKTtoTx89btJE2qyniw/TxQmIf9JvDeWpdzNoqG5TmGq
	blBmrFgnxhx/NsTfwN3MQFacjS6H4fbmDEFnE4WgomsjDmF2peOPNKAV6ffLsrsGF1XN
	V9kun033PQYXU1FHpBWNE3hpV/6RtEvlVCYpQnYIBlcuv0vHqcPbjk7wcFfS91YwFjkb
	UEfKsMMBqIV5fjZX02DanSOYegQ5AIGHtgYZvHiBQIs4pDzLQIR7+XorPAY93OgLq9J6
	aG2K2QV17Jj8xZ36pWKOCOMvVMcZoqYHuN1zzINAi2pL250GfFni0961h9un4oKobdZf
	BGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t/0cspgbjRC4cXK3XBdV8mmBOmbxIsIPyZ5dj7q0NdM=;
	b=BnYjZAl+b/S6I4Vd3mjMLxgm4wKiFfj/JmoZ6BocSrsdg4ZbW1/Z7jnoHY4+wpunfM
	2sewRkdlV6k0AvjBCMs37D3CQe5CDiUkGRccezdJOOtjaiXd/+gV3NwN3MdJXH0LDmPw
	pjG6QpqQduPFFj77UPZimVb6EfSpipFt3S+6qGFORLt9U4jTBDgmn4C9IyQOvXmyjkXJ
	vBYdvSjp+dRukkojafHF+PLakTT/UenhkaH3ksAaRoixzkVOjlw7On7EzTYAKSToIn+K
	IzMJclBEJljHX/g14Y3ydn8C6eGKZzi+PzCQ/UvGBvxzUXxaGGpIa8SMrV46WK+yvCyn
	u7/A==
X-Gm-Message-State: APf1xPD9BTm/NoSfoGuvSpeFXt+s+w9ehC1D/L3ueP8JhFr3FkT9uISR
	LQHGa0Mn7NCGpNH7FQclyQEmM86S
X-Google-Smtp-Source: AG47ELtSfEWBaziql97lrrtiSwsynV3/8GXs1+/Pr0HBb9xn7RXStusnwzWckPl0INIUjBEogV7KEQ==
X-Received: by 10.28.48.85 with SMTP id w82mr2976786wmw.95.1519943702709;
	Thu, 01 Mar 2018 14:35:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r98sm12086061wrb.70.2018.03.01.14.35.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 14:35:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 22:34:59 +0000
Message-Id: <20180301223459.5548-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib: no need to depend on python3native
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
X-List-Received-Date: Thu, 01 Mar 2018 22:35:02 -0000

The glib build doesn't appear to use python3native, so remove it to streamline
build dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index dc24a41a6a4..7e062eeb5da 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache python3native manpages
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages
 
 S = "${WORKDIR}/glib-${PV}"
 
-- 
2.11.0


