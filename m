Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D396C65CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:20:04 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id y6so34253791lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Pn6Q1CaInoG1Pa4bGfxSlEAXW6Wt2brJAhm24uVPMpw=;
	b=qqkxts9PE64hqqr43GYCOHn0JgDgnHg69nonmPmVp3c9hgeN8KYWvFYAux8IYT8key
	bjb300+jAgwfmPPbGBM4wjGIlCHmNA98Zdg6AkMugmgLY80gL5E9m6GifMqrE3dfC9UJ
	4mrjUslpLpyqZAk56PyKcBaEFjl8phGYpVaUuvocnF/XwHOMJyTUbYXIOmUDm2WSeJoa
	WCkzh7g/Sachm/SkjlYfFoVxQVxfeTsTb/tGHFrnfM0ImPRxgWppOHt1EjlXaL4T4/Tq
	Y5b5S3PcKnzW2caTMs2jpc0dVPnQlM/hasr7N0OSm4zqLBVzazfYt7nYUc0CfMUwo7H8
	+g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Pn6Q1CaInoG1Pa4bGfxSlEAXW6Wt2brJAhm24uVPMpw=;
	b=G9GWF51lUg5wqBSkpjF8ybi9nnxvMrkeIwMoSnmSL5YXIKDqkOBGAWi88ha68UAzy+
	LPz43BaM+dKF3QzWHWg2zrKzq9z8Vn+bBdV54jraS2kaRp5Np7SuQvbPUaK+pJuK7o+Z
	YeAveqmHuZwafyOKFCdhzWv5euJi6CtwY4Ya+qWMvDcXiNSgLXe3pFDSXqmxUfSWbFnZ
	Ap2SNqizzB2WnX/AxtOZgghaJm1aRIlmdAG12Yfr7L2gBt9MWnSoxZdr9iH0bWJmedRe
	KMdtWt1gqYfE04mQqymd9P02Z7HW7xXNtJXN2mMasJtJ5rRJQJ34h8DDS2zGh4njZBcH
	pDww==
X-Gm-Message-State: AE9vXwPNDVw7L90C03klMc9foBjs+N+jZhYO4iyBmvBIEqiRQWgOqRurd8ZHXCbwO/bJfg==
X-Received: by 10.46.1.79 with SMTP id 76mr14292846ljb.46.1474446005435;
	Wed, 21 Sep 2016 01:20:05 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id s2sm6494252lja.35.2016.09.21.01.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 01:20:04 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:19:58 +0200
Message-Id: <02366dc65394b95e17206ef0e244557359afdfb9.1474444047.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1474444047.git.maciej.borzecki@rndity.com>
References: <cover.1474444047.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1474444047.git.maciej.borzecki@rndity.com>
References: <cover.1474444047.git.maciej.borzecki@rndity.com>
Subject: [PATCH 1/2] systemd: fix indentation
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
X-List-Received-Date: Wed, 21 Sep 2016 08:20:05 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 6e6ef76cfa2322fc0b833e4f38a4cdf7483a8782..1276316a0cddeefecb34cf9422c94c3ed12f5381 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -211,8 +211,8 @@ do_install() {
 
 	chown root:systemd-journal ${D}/${localstatedir}/log/journal
 
-        # Delete journal README, as log can be symlinked inside volatile.
-        rm -f ${D}/${localstatedir}/log/README
+	# Delete journal README, as log can be symlinked inside volatile.
+	rm -f ${D}/${localstatedir}/log/README
 
 	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
 	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
-- 
2.5.0


