Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9BA71951
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:25:29 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v24-v6so20628353wra.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Kzmd0KXBOAjPKxz2ny+ifUKUo2gcbuSQENwkS3W0Ffs=;
	b=OMgrQlroDUxYxpHfE/FS3cZ6ZHSknMk6K7wuzfzDNziGeIlFXn1aa35MaKbCnIT2hd
	ciS/0paKDqBvmGL6LbYeL846tNKMPBBSCaTeVwwSs+fVciWh9jtNqVsMqVJ9w0a6+fnq
	fhRff2NX1PkDr5anu2ei9es8EwjdDkvERgDGb1lx736GcHKIQqDnJ5E7cD1AKQjyjnZ6
	KUxAFIH72DZxq5pxTnkK3baeQFo9UnnOPGcgjofcRP3AP+OT4VWZRHXjt2uF8BA8W+jW
	kSdCWHec5wQNuNEumzSqBoIU9CX4050LzJ6C2OMIPL4rAFx/nUm1ttwCYK9mN7I6ASCG
	b2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kzmd0KXBOAjPKxz2ny+ifUKUo2gcbuSQENwkS3W0Ffs=;
	b=knE6voqJEHwTL7ZOTMMJdITqx+U3znErCxE2lyu2UaFZgc28jBlMKpzgo1ypH5f1kN
	x0fIJ+i/UnAmI5Dt3z64CG3sVBFVH5MKzfzUVn8U8kewJZkEwSxdNGvjth2bkrPUv6RP
	rkyo7njCq9aP5uvtKKex2kL2aR4Bvm/eNjb6Q8AAEu8vvWbvp7/QLtkPsyn5trpkzsaL
	UEtetMFfYAobqDvEfCSVG0RljpovOAjeYPp7/qE6X8/IuxMRIWUZRfkZQf7fHvvCd7Oo
	BIUKhIBEcD1xiwIfR2b45FWYorZZDm/FtyNDd3vpB8Y40bs9Vil89reshypUBTsPF3tx
	SKpw==
X-Gm-Message-State: ALQs6tDzfKrxjO9P9zngJlK+YAH9n7WatV7zZ+X7PMzLw+Z0StUXq7O4
	whlj0LHqEAXQxJ8EqLTz0Gklpg==
X-Google-Smtp-Source: AB8JxZreQoV2STC5EPB1hQ61aSJVj3rHSEcHkLNjHWMpIS6Yh231IFILoyf5ce3N0BBtkrNcNivg0A==
X-Received: by 10.28.230.148 with SMTP id e20mr1160274wmi.89.1524212730431;
	Fri, 20 Apr 2018 01:25:30 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c14sm896811wmi.28.2018.04.20.01.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Apr 2018 01:25:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 08:25:26 +0000
Message-Id: <20180420082526.24648-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] pseudo: use latest SRCREV
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
X-List-Received-Date: Fri, 20 Apr 2018 08:25:31 -0000

* the pseudo.log is significantly shorter with this revision

fddbe85 Fix symlink following errors
3a48dc4 Fix one more stray slash
691a230 Less chatty debugging
0c053e5 Change copyright default.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 09a3331d35..9103d49112 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            "
 
-SRCREV = "19f18124f16c4c85405b140a1fb8cb3b31d865bf"
+SRCREV = "fddbe854c9db058d5a05830d3bcdd4233d95ee2e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.0


