Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1472.1795801793496653328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=o5TkJwC4;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so28398165e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801792; x=1796406592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pbex/aYZl9g48OtFuqe8K6egIvHBAEQI54IUxwFoi/0=;
        b=o5TkJwC4TrEWKdRSO7D8RH+HadL3r98drtvxuuDi6wCQQMYNVNrIvuoT+8n0QybhT6
         /uXw8xdvGsz5fWeG1s1Vq7lv+yTIcTj5GSaY/4ReGBhjB7BGj3V7eyyxrUdVygolpzRS
         R4AwAuuUxgsm9VmXIGLvhpW4FPWVkRi1TmQASH97PJrDYJr0taCh1T4k8m41RlXSUOR3
         1Oo+kwxuNgH+yWryz5pSIJNBT9yu8uux5CAkZCNaayVTSzlqFKAXetpKms7MwM1QanGK
         gDTy6iq7HkXYXhnsXBv+U00o+ACnCG9OYd8hgzz1dLq9/D4OveeekQSp7pAVonMr95vN
         yGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801792; x=1796406592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pbex/aYZl9g48OtFuqe8K6egIvHBAEQI54IUxwFoi/0=;
        b=qn2c5AFCLd/vVtoQnMueaD61EPy/WCJmnmXjX6tscHL75dDAregr3u1ZNLQ7jtAGiS
         FkCSXO2wdkAeRi/7K5mgPdF21b1H4f1r6VTJkcEVI9x0lWR1/171OdmyyU/Vlg8I2J5v
         F52soQTRo+auWVBRZCgW4vBGxgUd4TrKXrQVFwujXFhyXC60g3YbF7pTNlgBd6jZOKf8
         28hKOu+R2fDMozbKS6vCdMRSCXh1xmPrz2jcCw3+E975qZVn6CSfz8tyQ3aFpMT3qTe4
         IVEuy2cpNiW9KwuprchZt0CxIFOYkQMvx3bXeNjPJgZPLHpNBbQqpYq5KwisuNokJsdm
         5yMQ==
X-Gm-Message-State: APuU4Z+hpBTAh72Gn1M8Ad/9QU/G8C7RvrioMOZWNeAwrjd32OfLTwiK
	yq7BcOuj1NE5GnIDyNEBBX4lwaw1nM1QMrq6OPB/sE391EIy2Bm6fNXluMURMo39YRIf5hI47YX
	iiJwk00E=
X-Gm-Gg: AZFdTZcLKwdzXtUW1Jdi0Gn92WeO3fKTxKyh6n0sQS8vS71FFqGuO3/vTv64ltpOkg2
	L1bpe7A/dbSwGXDM/KakADXoh+d6z9WvQNNcGDBe2tdNtwa+aTXru7GQopELO7b0iAoyMFBh0F/
	tistI0LdFoeP8b5sqAo69zeT9YoBu/lW3Xram8VL7PAlVno61TUWRRkSVkMAeaBtRDlMDqzC+wI
	k+8AgXvv0bkI9qSkCSVBg5khx2VDu4rsTXztgs2LKtTZxEWHtGkUTkGwLc8WdiBRCaSdLm/7Xmp
	o3EuCRli2mbhZcnRRPtiHZHY1QcZMgUosAqe8qjqYZsE3Lc6awvVbF7q3mLmUpBMinlU/3ejJFO
	BM/xDjG3/Rk5pGVzncspAQtdWNKp2SEnKQ5hN3qiKOAU8SDwra1U2P5RweLVziM2LQTpRdGe2f2
	YM0uvVoDNmzIgdc+UtLobNzTZk+050n02/2lTwaY1K/QmziZMjyLm2npRScD/kl0YzqrYn7tCUF
	A1Du7EBeoHZpyZWTlF0usNQj8siJ+AEbHvVtfgEkxAM6MynYlf61oGUG1Wn2EKtyIbQMYOP29lA
	tDCkS8ddDpOS7keDqSRXtOscBcnGFyniexUiiSTvMLdSvKF8pPLl3ivBuu7CQGNn3NA5Dg7MH0V
	u2RTSRNVU7nXLGWAWWlvpaBn+Vktt
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr479849285e9.13.1795801791740;
        Fri, 27 Nov 2026 09:49:51 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/37] python3-certifi: correct license to MPL-2.0
Date: Fri, 27 Nov 2026 18:49:14 +0100
Message-ID: <bac9f65fe6156a2540a2468a42a2cd2cd4964148.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251437
Content-Type: text/plain; charset="utf-8"

From: Anders Heimer <anders.heimer@est.tech>

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b270958cab94f1fa117b5eee36157cf5b14d3cf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 749894f56ac..b80044b399f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, for example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
 HOMEPAGE = "http://certifi.io/"
 
-LICENSE = "ISC"
+LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
 SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
