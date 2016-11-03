Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD07A71B1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:42:58 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 20so2384787uak.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=3H7hST7ZdkObUlbm7oYPNg1Z9QWwmVzeZwveiDPjxRs=;
	b=NKD5RNM/EftHA6SLKkmWJouyxO8pR/crMREXMBeI0zh41QjcCd9QoLWXStGlWrcwm/
	XG2VfEX0NSFtDqdacPV7kxw1c/SMMS1gKV6ckxzsAycMlnPMpI2+FRmLmzjMgvu9ExDR
	OcdLv4ovkPNO7rnZlaxmE1PYIZNyey505GW3IGGJAlCi3T2mMwYGL74XHEzOLTICR6bp
	/WuJEQeSuGbm9SBVMKCJZG/G38dnVswyG4H++EAowuFEXdhdrVjPNqDm9Ir0UuiLlv9o
	z0qkWkHgcXJp7YemjUmo983s1lvGVRR5r2hUNw2G0CCaDixpR5nNHEHJYzSMAuR9JDID
	x51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=3H7hST7ZdkObUlbm7oYPNg1Z9QWwmVzeZwveiDPjxRs=;
	b=bacUjF0ISx0htT+pQKhFOqnoLjgmE4wiU54JfbrdQkt312DXBTI7sbXNlKqlnvYRfD
	nstpIMuvptGe9mAK0eRieNzgKt++K7Ej4H+pvLyaJaA3SUV0UGI/zN49naPHighnn+Vx
	oxYwVVU3xuyDRyDAmGp0lPPV1TSdUf45V7Z/4dVribzZRi+yeWStlsyAXGaJQqBsqmJo
	mghuaQC1ge7xGBeD3Gte9bJkV/qmGD/lnrXqrlhkxJADwOz9yEUECOUydcVqi6TUksF9
	/4biRn2FnQ4wtUoCZWKlv/5p7KytSImDNf5NIJrgwh3BENlH/6M72+Teo5EfpByJsKrb
	x7nw==
X-Gm-Message-State: ABUngve8SKjAogEyEGPhIQN5Amm0HDgGBy/eDTN4tEEWJMZTeoo3NHM+1Fjw280/zjgE3w==
X-Received: by 10.176.0.82 with SMTP id 76mr8801495uai.46.1478205778942;
	Thu, 03 Nov 2016 13:42:58 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 42sm2151339uah.2.2016.11.03.13.42.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 13:42:57 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 18:41:57 -0200
Message-Id: <1478205719-28589-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] 1/3] grep: Update to version 2.26
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
X-List-Received-Date: Thu, 03 Nov 2016 20:42:59 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-extended/grep/{grep_2.25.bb => grep_2.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.25.bb => grep_2.26.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.25.bb b/meta/recipes-extended/grep/grep_2.26.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.25.bb
rename to meta/recipes-extended/grep/grep_2.26.bb
index 9720d9f..9e6f05e 100644
--- a/meta/recipes-extended/grep/grep_2.25.bb
+++ b/meta/recipes-extended/grep/grep_2.26.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "04e96b0e6f0fe6a180ae62c88fcd0af6"
-SRC_URI[sha256sum] = "e21e83bac50450e0d0d61a42c154ee0dceaacdbf4f604ef6e79071cb8e596830"
+SRC_URI[md5sum] = "afdd61c7221434722671baf002ac9267"
+SRC_URI[sha256sum] = "246a8fb37e82aa33d495b07c22fdab994c039ab0f818538eac81b01e78636870"
 
 inherit autotools gettext texinfo
 
-- 
2.1.4


