Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCF461C22
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id f15so6883561pjq.2
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rGOy/7VSiSMIGRakIg2ftKrzw91wGmTGfCtlbkNVVzI=;
	b=A8BXsoKWZw8FBWmaX5Kxh4YlS72sJPyFbslqegZWJ4xwUZqAD4sDwYnXu0/R0b8O/t
	E7okv0hLsqXWTL+z/JISZ5TwE4g5EbTzsEqixKcOzNcD6leXdvy6iW7OZhjJnBzHe9bW
	cS/GroGIGhVTxPAMCxsmUz2noPuTTSvWb6Sp5aranYs8xeyYiIGwEuVpbf7JEjGf1Kae
	1vY0z85bjZq4X9CnqwHlYng5sF9NCdV/qWvLKk53DxtPfzL2fF1M5tu+u6guDQV737Cl
	EK2YR1lthW4Ktfddcpnp3xdK541Vy0fmwQkSpN5ACgcn9Ond+DXXtj/xSB7akYnhgohO
	W3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rGOy/7VSiSMIGRakIg2ftKrzw91wGmTGfCtlbkNVVzI=;
	b=CQZJindfkKXX9P1Ds5szQyIgljXGVEdXzbZebFz26/tV+nCQhrv0ivG9+cUJ+vgzYp
	AY+mEXvXSoZxeANF16rko5hAuZsOmQBIxLbYTlOz6/ubl3wwKhOvRTfAE9RD/einZFuy
	n3Q0do3QFQmhqHMK0pQ2/MENoEz3mEC5Dyvij3hI2KKMDcijN9xm4izKlMiLD1C/FFpA
	8Rzkgo4EQvVbHR13p/IdEFy6RH/HOuJkN3hZP8hvORW0hDGQQrkfLKUg/m/d1IGCIQsH
	xoG+D1oC6BkQ9lIZSCeWhh/tnToW0+8JSsnTERXnEnVphxMJOQJnjxcuHcoHl2eTVwj4
	qcQQ==
X-Gm-Message-State: ANhLgQ3Or0X/6ilphIYYVqqaK9FoEnW68tHc5R+BGp385fg8IL1G9Psj
	13EsNHCViOw7e0NrN+GCcwtF2UXZ
X-Google-Smtp-Source: ADFU+vsS5HITKlIU4OqlWTaJz3fdDp4PF0FZwEey6E3DGS+QXSwceQ4o/iZ0qX4k/GLSDPN4mBZBOg==
X-Received: by 2002:a17:90b:3613:: with SMTP id
	ml19mr20499576pjb.71.1584295933415; 
	Sun, 15 Mar 2020 11:12:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.12
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:55 -0700
Message-Id: <1f903d76e50cb613e5cfe4f3eb00529b2443eb62.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 13/16] maintainers: Add entry for buildtools-extended-tarball
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:12 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61d4d3d5a9f27e0fbf1d7ed6db818a779643b8f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ab0c6c5541..7494873190 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -82,6 +82,7 @@ RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-- 
2.17.1


