Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9F12F7FD05
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a5so154925wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aqqocdLzhXsK4mnBuyxzC9+LJkI8lCWmY57O9RhXshM=;
	b=u7a48YFIEKuiBmjWtNSCUArDrXJAI0n+PTMHauvycKA1t0NuHi7Jmjn4b4bXNeJ+hA
	puDN/1KVA3nAIhmk0fTDfnEALK+3F9Cmuees1Ba83FaDPEzsGmfMAR4ayrgVZFwr8MNi
	ofehl5BvzMX74iP4kPNLyhvLl9M742Hdu/Z5DrrSWqdczr52BZVgrj2MhTvdpf582hfp
	r8JhKDLb/Tzkr0ms+pH7Ik89UB2mP+YGTx+eUUFCNMx3Qi2T+ULe8dXM2fAzBOjpo6rS
	I/mFy0s+GZgvQhb1Q6CloMtTdoporQ6exECiTE/2QAWtYs74hN981xt3fbCNbxxNLX4U
	jFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aqqocdLzhXsK4mnBuyxzC9+LJkI8lCWmY57O9RhXshM=;
	b=W9rq97erByRNe7IjN+3sxqeqwDS8PnUjf1aR/rZBG4hvqahqm8/JNo4fyFXDPiFLAD
	uG7adg88sBrQU6dJM6FQEdCUDmBJSqWAaj8xqxh/2uGd6GZvv7H3zRFUbSobyYrDw89S
	xIn21CkaeMVKrNRJAAiByOMWbsCtTDGUpMIVEO4IQ8154qOcny9Abs7fsCwO0gWsuE4P
	NSwr/02kNfqPIxiHY2jphsXgFRRO96fpqHF1I4dA6kb0PAH6qhIGQ71Hvqt5MzdVryCJ
	j2+AeTX3RZWAVcBstBO/k63qGOOhAFO+w2R/+FGcBR54SpLj2T/ddKzK3C09tko2GMGL
	soxQ==
X-Gm-Message-State: APjAAAXs6lKnc8lqLbeTh5YWNY74BEcQ5SRqf3G1eb9zY53KPtgvUoAc
	tFL9aEN+52rPwF+J4rjS25HVrmjT
X-Google-Smtp-Source: APXvYqzefDM09PZ3a60HMPlb0p76rzjmCVnj8UGkOe3YkA6/72rP3WbC41njzu+dSyK8D9H2QPqeeA==
X-Received: by 2002:a05:600c:2318:: with SMTP id 24mr4442wmo.48.1579541143995; 
	Mon, 20 Jan 2020 09:25:43 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:08 +0100
Message-Id: <20200120172510.22648-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/24] createrepo-c: upgrade 0.15.4 -> 0.15.5
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.4.bb => createrepo-c_0.15.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.4.bb => createrepo-c_0.15.5.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb
index 75762b7fa52..9b6c89c3485 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8ac472e1267b2ca11d11418099ab923d319fa2dc"
+SRCREV = "db3a2da68842efd8a8f69c40a222dfb15bb1f4fe"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


