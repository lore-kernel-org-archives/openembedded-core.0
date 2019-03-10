Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 24C307CEC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i20so1973546pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=skqduByu+4mnIomzqhJc1S2hGmwip/8KGA+TPFgat5U=;
	b=ilQQzHQUZo9BwAEDo7Lt43lbmFkr6EpcgRRn0YCMBK72C6eiARj8AAkdbV7vZIgraq
	vKquDu09lhVjC5SXp+jiYeH4ddR6GcvXsUyOK/OySY5r5eg5Kn3l8zz/xRkaEnIWkJBC
	GLSM0gScsnoHtMpjOBBd1mg675hdjI1eI3qpyg8yVfASeQg1/u+JMTDyuz1ywpXLwehF
	6ywmYO5kKBAgG7KqUwqGFWIE8mf66C6bw0cAJ4TrGTK5qtAhvSJYQ4v1OvWKAwqoRdpP
	MnnY1xjL/oNct28Xc5kobtZ2Wabu1iEEBId7lAvFMoT47cJfA9AIj2CcaNStFikVn3pT
	10Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=skqduByu+4mnIomzqhJc1S2hGmwip/8KGA+TPFgat5U=;
	b=JIONmQNEhALpQ2s1fS+CQqMmLFeQF3OqYG/Jh4AitSeShbUURETPBmJ3fN7mTYPQ0k
	3T0hZHIjKHJ1ji5O02Wmg/xkkpdOEGjvHeuudSZ8OQ8c2eevjW/9Vwe+GRy8Ewa7o3JZ
	OWEK19bOQkeSdqFoleJZYZ7KbrGBGeejKoYUlhhE/+e6diwJKEx0WDK1Av1LzP8SAfRh
	TsZOC/N8ToD7Ru9k32EKsSLL0TSzKJKI96OZ/jtMO/nyjMyoLFP2WdIHqS/CsYnhdSyO
	mIEnw0Uz3DzAShegyDJU5Atyg96PRfgBI6Sbaajsq6LIuoe0TMLjJSuFu4ejJKkFwVvK
	xuTA==
X-Gm-Message-State: APjAAAUtVpSHD+u9+QHfi51j2/mUL7gbutzazyzsoypXjZ/mimVxqoAL
	96ormmRZ1bM9eZyRE6Nevoq/mAu4
X-Google-Smtp-Source: APXvYqzsG+K2R4FB/K3zvHxfH/uFd1j+qBtVeeSOfCi1BzZCTjljGIekFeN+FONywvSfaRMXYt0QZQ==
X-Received: by 2002:aa7:8249:: with SMTP id e9mr28889111pfn.6.1552241274179;
	Sun, 10 Mar 2019 11:07:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:43 -0700
Message-Id: <1552241263-26116-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 12/12] xprop: update to 1.2.4
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:53 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xprop_1.2.3.bb => xprop_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.3.bb => xprop_1.2.4.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
index ca58d47..3280813 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[md5sum] = "4becb3ddc4674d741487189e4ce3d0b6"
-SRC_URI[sha256sum] = "d22afb28c86d85fff10a50156a7d0fa930c80ae865d70b26d805fd28a17a521b"
+SRC_URI[md5sum] = "cc369c28383a5d7144e7197ee7d30bfa"
+SRC_URI[sha256sum] = "8c77fb096e46c60032b7e2bde9492c3ffcc18734f50b395085a5f10bfd3cf753"
-- 
2.7.4


