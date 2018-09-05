Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2429753D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q8-v6so8499449wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xO5/RNqNGnUD9idzP/lSeVQcRzKt8CXF8SXjpHz3vpA=;
	b=Y6RfSNn4BtFTykAJ5hEA26IrX4gsqoOunlwHCiekM3Ei3UH20L4wCCVkFMaecAA73y
	XRmoUyolanzsO5aj1v/YcL4vabsxUCZcyidI7hVwbJRnON8YcnqVBDNXAOxSEA/FyYRf
	Yoe1gWTW0PPPsK9q+AuE1Y2MzJbgLbMazZQWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xO5/RNqNGnUD9idzP/lSeVQcRzKt8CXF8SXjpHz3vpA=;
	b=KlVzA82amtpaJqtiEaE41RyW9bp5e1HaKeckR04IYunrxo6bJHIfvlL+n8zEkemtd3
	3ANDvEbqnuBIkU1woqoBgyttOBZ/VNscRvvaX//wo+m+mRH0n0mHqf+YVWK/tnSfci2g
	lPX83yo3nHc766YxagbAw1E27jT/OZe/yT/0OUXoHnxbnpVbAAKSmzyJ1pZkD4y8Kw4S
	TE430qnSr94py75l5CVTWOAsib3Ki/ZxoilyJHvaIlNbgqczjAKFWtdIyEXuEKDSBYVj
	/yANb9pKKLNZlqXI6dUGJT6Yb+f+Jc0BUldowDmB3x1UfKzL01wfAqY4uLaC7jDoWPow
	BRRA==
X-Gm-Message-State: APzg51AR9GvThBcC4qQAxyoYfQJv9Z8iFfeYMyJmm9pcV7IdfK5vdBbD
	bNPAF58b/xadNuG/8xk2DaT7Y8BgxNg=
X-Google-Smtp-Source: ANB0VdZ0zd74a6IKN4CjEbMo/qx9AetOJ4yNjgyoEtyH40npmiodRilaokhrGFHi9u1mPfqliDCv2w==
X-Received: by 2002:a1c:8682:: with SMTP id
	i124-v6mr842752wmd.77.1536166357174; 
	Wed, 05 Sep 2018 09:52:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:25 +0100
Message-Id: <20180905165227.29435-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/8] maintainers: Add entry for fribidi
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:36 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index de4f9af47f6..4ec3c20b3bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -164,6 +164,7 @@ RECIPE_MAINTAINER_pn-fontconfig = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-foomatic-filters = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-formfactor = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-freetype = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-fribidi = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-fts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gawk = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-gcc = "Khem Raj <raj.khem@gmail.com>"
-- 
2.17.1


