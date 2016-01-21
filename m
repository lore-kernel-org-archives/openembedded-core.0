Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18E0473212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:43 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id is5so2010411obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jfXqTeg+C3B8JZ2F/uX+T8xiPC03cGkOBZRUg+/cQFA=;
	b=NqanCS5q3GfeYrbGqEYVxyGk5ofHLTqEc5VUdlcSJKopAL2z0BDqyfzn7lAMq+XFZh
	j6/d9dXw3FxrjMmALIUREnydVjtlay88c0l09hwHgjOycGFArNgD3LRnP+3gW3YJr2r3
	6qKybRQiKrs4jHrx9/28lRfkuAk1DPf1JyAgj7b58AbxQDrlHoRG1JUTPeNK20e73qXb
	7R8Z+KkIOGJg/kR0Vmj42QZETstyr2d2d43Q6YlfSlDCeW0QN2flN8YjWC6OniKDqWkZ
	AC7NXMqPy32gfxWiDzj+jUpY3Xj4sTgWp9d6s5Dr3GslHTYBMJGCxXDmKnX+TfepK5ly
	xUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jfXqTeg+C3B8JZ2F/uX+T8xiPC03cGkOBZRUg+/cQFA=;
	b=mM+Diyi+GaEYsBU5pJEwgjX/4eoADAgSgy7/VjOso1GfEJI2lkIHSvZfL7/BgWfuj3
	LhRraqzUI+z2idGyIeNee314JfIP+jhF7eDyJEILq0xK/4rA/BzE2eceghleQggJqXDb
	5WsWNqzeLZSoi+LPWf4AYSFbgAg8W+8ZPxhinH18kbbwoOG2JoEd/4Cp4Y+5tlKk4nzm
	hBCFBpDF6dvE2Zz/Vec4TKFn22xiekvU0qZYFpI10AqRSUye3gL+gR+T/X4Rcj3AFry6
	KjY9UzM18oVz9Z2NkRMvjTYelV1fWnJ0GTEyHv8mS5saw3JyCUoiLnvZYwwv+bjmG3It
	R32Q==
X-Gm-Message-State: ALoCoQkXc0QqzzbCxGvw1UZDe4z3JKbQD3EJc1k5red4C0J0A5EHP1CXEEf0eskFeyywJ9XPFu94E+lx7b/O5R6BLgbfbt1Vvw==
X-Received: by 10.182.18.8 with SMTP id s8mr31525790obd.43.1453354664042;
	Wed, 20 Jan 2016 21:37:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:38 -0800
Message-Id: <1453354610-19218-21-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 20/32] gst-plugins-package.inc: drop perl RDEPEND for XXX-apps packages
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:43 -0000

Only one of the plugins recipes (gstreamer1.0-plugins-base) generates
a non-empty -apps package. However it contains only binaries, no perl
scripts.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 4201113..9ffbe7c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -52,5 +52,4 @@ FILES_${PN} = ""
 FILES_${PN}-apps = "${bindir}"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
 
-RDEPENDS_${PN}-apps += "perl"
 RRECOMMENDS_${PN} += "${PN}-meta"
-- 
1.9.1


