Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id AB2E77D3D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so9218230wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sL6cMEfgrpsGxEat61D3vOZQf/dnKU7lz4SXULQ2o0Q=;
	b=wFUSOcxtd8cFuTbLc8nUi3L143S4tkTTsS6Zl0AOzLpMBKm/chrD+4I1MPj/CaGiLA
	3998Q750jWU6X7+r1KBsmqgzaw386VuH0b++xhC6N8JcA5XlFPFYCeW6AHy+beuJFAgk
	WI6V9CIPV4bMSK7c8j7wgE5Sy9G2ArjRJM+OIYI0aMCW3fMJKPtRWacFqp8D7ZBfmvfm
	V23cUctemfRhSIOty6Yx2SiLzt47WcScD9tov9doMASWRR++VrBcqeuM0NJ8rWzTgFne
	jYCycLQwqo2/BhsccQAoFxsiwbolLviv8btv3WkRXBypfjz+ZjaRrqiFhCM2S1mfthRh
	iRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sL6cMEfgrpsGxEat61D3vOZQf/dnKU7lz4SXULQ2o0Q=;
	b=VIa2Lm+QPYDesSsw1mcF6/KZ7uayJ4zH3X4Lqg9FrWyX+gkQBn+pgi9ALOzaPdBrKh
	VnC/mVPyXJ9Y84dmd0auECJVVBKTbJGcd9yxXPgmHYvOB59ycZXAFTiusTZEyvInSKdd
	Im/IIGX1kNAfJDTtkur93eTblaO3nmPS+WAtteLSnSVkqyg1x/s2RNTmd5yNXBrWrGbu
	eJIbwas+9UV96f5L8UMGvMtGNY1tYNRku73rufBV/wWUz09j4ic+7DsuDTmuV5ciLrvX
	Fht+YZHavS5SOMltZOu5DHKx1MWZaYlF6XFx+hQmNQhY9BJpAz51Gu/QCyAb/r4MzBtm
	8HMQ==
X-Gm-Message-State: APjAAAVwZnKz/CaGW2XHrP/P9Ki2TowuwVy+UrJnGiBhlgKySC5Qo/qn
	GjbWO/ff68RT5F39f1CBVvkjahekXLs=
X-Google-Smtp-Source: APXvYqyN3jLMpu2KePIimtQAKDj+21bJCJiqOuxY1OsugUTFDiRXmtNaiiGw7qjlVwjpGm9JV4AnZw==
X-Received: by 2002:a1c:9dc8:: with SMTP id g191mr739726wme.132.1554311065257; 
	Wed, 03 Apr 2019 10:04:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:12 +0100
Message-Id: <20190403170412.23568-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 9/9] gtk+: update for new catalog path
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:25 -0000

The XML catalogue is now at the canonical path, ${sysconfdir}/xml/catalog.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 14ed8d812ca..d6d14a79d5a 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -26,7 +26,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
 PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
-PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog, --disable-man, libxslt-native xmlto-native"
 
 inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection manpages
 
-- 
2.11.0


