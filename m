Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDDF7F589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y135so9263559wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lBsQBPDC5Zzeba470m2Ny/Pw6K84lZkeFVaVaIy5O2g=;
	b=ZMBUYoDdEqJDT96bnUEGaalt2jYV4Cg4ObVjgQKorPjgptJk3rIc9YXsLG8mGe4gD3
	wBcw28oGT4Lv60EFiKy8FEhhFWKb+1n5os4rC2RYqzFw2bxE6optj9ip2JhpaP9bM5K8
	LVbk/Ykds8c+Ft/g/yBNPlLbXZS50HhMaJvZtcUllONkWZrVDJ+eZrYDagJU4zbRqL1q
	YutknD8pdBWCxxyFlRTjpdNtyKdsfnSJv7cqs6zWqF0eRqFa48iaCWMH0KI8sWYiMUOu
	dCMm9WQVQ+ZHk7IOOjDzaxDwZqCuTLWWMulmrKh6O6xyqq1/iWRaaJDElPLA9Z/EdIG5
	fvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lBsQBPDC5Zzeba470m2Ny/Pw6K84lZkeFVaVaIy5O2g=;
	b=HR+H14SLaVTUrOZxzpldTfTmpKd3b1eJ/Omz+5lABj6WmBhPyHPLoSP7wdVAf65Rsm
	GLDJCG8+CrhSIJtSaWflnnGHYVhxhwepVKHi/OC79A59JivjH+XGfqCRoYs8u26OX11s
	A+1XH2k5BFmXM/Un7auhTWfTnebKhBSNLexmeAxIYXQIrOdkA7DTHEctLWyijkX7tj2K
	hPzKbyrXZDxVJ2x/6b7SkX0BcEjv4StMOn5sxeTYZ4xin7wrmV5sHYQyCxi1Yt/bee8s
	vfFMI4n7t4k4tMrqB2EPz1aa9KISLAiwP3pCzI/wAvVXYS5AS2WVDsz4HiFVXEf9Asqp
	YLZQ==
X-Gm-Message-State: APjAAAX+Vi7xRqww3tj+1d4rJ+CbjBq7NL7/Z7Sho4/iF/6v1niLvePS
	P4zK7HKlMy3MGmT5/tqVuso7Ahty
X-Google-Smtp-Source: APXvYqxTfyxITDM1WYX8R6A4+B915I740V8rJqCOdztBsEGeehfT1zV4MaEDlifJqwe3Ati8xSmZaw==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr2877849wmc.108.1570794493300; 
	Fri, 11 Oct 2019 04:48:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:50 +0200
Message-Id: <20191011114754.91740-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/19] vala: upgrade 0.44.7 -> 0.46.3
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.44.7.bb => vala_0.46.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.44.7.bb => vala_0.46.3.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.44.7.bb b/meta/recipes-devtools/vala/vala_0.46.3.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.44.7.bb
rename to meta/recipes-devtools/vala/vala_0.46.3.bb
index 807ca7a2139..eda5738c066 100644
--- a/meta/recipes-devtools/vala/vala_0.44.7.bb
+++ b/meta/recipes-devtools/vala/vala_0.46.3.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "27fd30535c51af5b87b0e7ffdbd906ef"
-SRC_URI[sha256sum] = "bf1ff4f59d5de2d626e98e98ef81cb75dc1e6a27610a7de4133597c430f1bd7c"
+SRC_URI[md5sum] = "809ddac69b039ef509b61993c848613f"
+SRC_URI[sha256sum] = "e29c2b1f108dc22c91bb501975a77c938aef079ca7875e1fbf41191e22cc57e3"
-- 
2.17.1


