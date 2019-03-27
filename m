Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8EDB7D156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v14so921425wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CXfk3Dm49D9QmgpM3qme0Z1FILGsDLRTLaz1CkiC8kE=;
	b=ZPNVwGRMoAVar1SUyIlcmgFhYzHBLsfSrTt9sbEO+lFfNnwV9LTTQnHkJmhYs3cxjw
	YrwxVIZURw65YSRbc+pyj2Hhrq7oURF2wJcX0EbOhp6iMEhlQDP0vuN+R2LDBJ8i+aFN
	mqZupdXS/LkYlqVUeZF3kokXGBzBZkyMDlCqKX8M24028owhClOh9/+S3vj8dgbrhTsm
	lncroCtMunsdTdG3XloNcOOUy/PX0jZ3w7KZ2pYjqkDwibCuUsQddO4NX9NwOk69c/pO
	9JWLi2178p/1koqvWF1M2ITUbrFzFa0I//Lkd7emtbanC78wY32CdWfEqx8dQukQIjTK
	uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CXfk3Dm49D9QmgpM3qme0Z1FILGsDLRTLaz1CkiC8kE=;
	b=Hn/sKcjTsZ6wTksNvm2ld0AmYWMmxerhorA0YicFdZB1UdD6Sr0EcouAURkAYM2JpA
	gCIPltk35TSAPcP8Ldofh2oCDgUYzfh2+Rv32tt6svgrk22PKZ7wm/x6wtd9adl7LWPC
	60T1SEU9gIS1JQteYivkposmMCE+TJW2mGA77f7I/R1ZOz1DP8JG2CvG+cL1BQ5qHoFU
	iGFrwb15OBLBYNKjC5aCkXEHsquI6U2MipeqdX2ZfP6matrBaXQ84ORjTc6E/5rkp591
	iF9s9lhiAy+1qVEqmB85L5U3wp3D5UEO8K2EgXYQ1/244jlwpb9LU0ujrMbVZ/zlUss7
	8MKg==
X-Gm-Message-State: APjAAAWIUtu3hyZdvKKSEVFQrEz8nqr+C0noCcJ7VlQndQLeYFsrOvw7
	MZOdj4Cr8v1LW7ngBylkCXw5JQTTRsQ=
X-Google-Smtp-Source: APXvYqwqQeDDmhppRWIltsKsaA/dp14i2oeNgAhjr38iZF9F3sxnuC/pAyL3MEap0RQuflqFll6S5Q==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr12545357wma.100.1553707004077;
	Wed, 27 Mar 2019 10:16:44 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:29 +0100
Message-Id: <20190327171633.34697-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] qemu: add a gtk+ frontend to target builds
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:43 -0000

sdl frontend remains enabled and available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 8113fc24e8b..669638a6592 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -14,7 +14,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-- 
2.17.1


