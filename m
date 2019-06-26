Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4023C7E6D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id i2so1765257plt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=KeEKJGwdWvcLXmUlXTAwvcZweZm/fP5slsxg1g00g5KbzYM4q6HfCVCInkkEJIJfk3
	dNUDZgCh7RzdytOZLzIySi4FC7YqSY73dPVR0ewxiX7qNnjpxmdihE7Sn8SwIYf2zC7/
	6CUOIDRdpeofo5lGKXKCTe8AjhnXUpt+Ik4ELgD53zZsWwzsRZZETTmLQADu74YrCSQU
	Y6TRRaE2wlF9gJWHn7yef/JcCQMrYAcvxHspypFlK/EcN/2OnH0J85qrtSzgmzTKBIfd
	cvfpmhdQbNxfiZU1EY6RgU4uynbVMnjC+Rgkc0n3M30CfB7gaCvU0h7LQwcNWDq7v8sn
	uUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=sINeJLPXO1jSK87aiA3D7oRc7ahKaiMQiPuMrCh9EvvFQbGeSL+SoiCiexrhyTf/rh
	1xYZWcQEsT/RYoDC94D9FcOBb0Hp/Qx1+/BrmfN/2dv2T7AMsCchyCKISBIZjg3Yhxmd
	rAxpDUrIah25ML1nsD0+lBkkU+gqcDEv1voWyR4gUiYE4XwITgUn514Mjf0t7Corjayw
	ktzA9QLIwBH5XVPgtTohDKhX7rpC6KKNC9fz28ujUCyJPoRC60DovlMiMsQ+vF10pyd0
	JgOS/nfjaSZSP5gIYVxhJ3lAkBE06EVsae9aJbv6VWutenOVciut/Jx/qAKLMD2U+ryK
	4Wmg==
X-Gm-Message-State: APjAAAWW8n7v47AltXrkG5xUlLNtqV/mPSFV1OSkngDoF38ekj+QoFMM
	gAAqMxVLMi8hrk+hYm/8TONqq5u8HEQ=
X-Google-Smtp-Source: APXvYqxzi1mBwKkwua+MpzaPz5v7Kfi/6PdcvGV34irGNCQbJ3D+FwPwuzlPscRkdoEgGmkHskfMgg==
X-Received: by 2002:a17:902:b093:: with SMTP id
	p19mr6355667plr.141.1561568038444; 
	Wed, 26 Jun 2019 09:53:58 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:24 -0700
Message-Id: <0497623882da714cbe098a4281982b7f9ce6030f.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 23/25] yocto-uninative: Update to 2.5 release
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:57 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes libstdc++ changes from gcc 9.X.

It also switches uninative from bz2 to xz compression.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 59ccd69..0bb8f7a 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
-UNINATIVE_CHECKSUM[aarch64] ?= "af2e2faf6cf00ff45cc1bcd5e3fb00cee7f79b3ec7c3be15917ad4ff8c154cfe"
-UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
-UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
+UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
+UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
+UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
-- 
2.7.4


