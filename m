Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4DA27E95A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u8so1857787wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uaD+KJ3flatl4s8bsqcLw1gq6VpLojCLO92FQiCaNxo=;
	b=JVdE2Z7pipFAIbjzrONvm7JnqSpUQIOMHabhURl02EUr/NgB+JN+s4US1bw2YL4HOE
	oAQ9N+URiIbBFWNa68qucUW2RR6D7MAaVW8R7fzddEPaE9zW81s/IKDo/1YVStMmH3/Y
	rxK3cAmqKtRJ3OwlLSlMD7+MVmSi2DywTPgQHvnuiIh40jfC5QsfF/USiqA72xJ82hEG
	qtFB/THs+kebnoXbavx1afKrK+yaygc4CojqJ3q54geV2gyzsLUyX4M1JTXYFFEnAkZ3
	Hh0q+uv2nzHUeRzUP/4Y8vi6/V6g3bsS+EgcBBn9Yk8zTBK4BKq80GcgP3JUTQ0+31Sy
	EQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uaD+KJ3flatl4s8bsqcLw1gq6VpLojCLO92FQiCaNxo=;
	b=eFz6iCP1UK0OZVdBDi0OIwhxKbn6nfX02Nz57m5/FyVR5hE4CG34MD39mITzeTcJkq
	H34UrLX6bWUW3fxUsQ3arnkyzi1Vs9Dke4PTLotGO0HoKPaPjrFx3Kjm2pxeyOkh42ja
	18XUjsTO5OiOpXWDy9ODHOKdOHcODCaZYjqrb4bPwQsmD6wKhUnIGl2IIdOti5tJ55Uz
	dA0y9rbbKSMhZuYGe4xa7XUn2k59MHBQi+qvLgvq2qoJk4Wik2nw/vuFJDnN39xdd9xO
	PnXkUMdvexz+OlbHKQOtMMvcFHxE8VjkCxpdvgZzEDQj8RtwlijIHYjRBPAIOyy9yTOp
	HfcA==
X-Gm-Message-State: APjAAAWj/rki01jVPTGKSL5A6pNJGKuEWLh3EbdfA3jzJM1REk3/8jhI
	rVkr2DEFWRAp1ee0I6J3nHrU5qoxCD8=
X-Google-Smtp-Source: APXvYqxdmPSGa0ECFwUnBEW5+uWMl5sNglgF+1rCrW90G2o60d/YnM6JGpycRiCeI4iMTR4JONdBGQ==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr9067117wme.51.1560950703069; 
	Wed, 19 Jun 2019 06:25:03 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:46 +0200
Message-Id: <20190619132450.130226-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/9] vala: upgrade 0.44.3 -> 0.44.5
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:03 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.44.3.bb => vala_0.44.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.44.3.bb => vala_0.44.5.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.44.3.bb b/meta/recipes-devtools/vala/vala_0.44.5.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.44.3.bb
rename to meta/recipes-devtools/vala/vala_0.44.5.bb
index fe6a5fcdcbd..518c9ebdae8 100644
--- a/meta/recipes-devtools/vala/vala_0.44.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.44.5.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "25f97c1b46ae0b60b5cc49cbc044eca2"
-SRC_URI[sha256sum] = "8553b422484af88be1685d8b47f7b0df36ae4477c3e77e89ab22276ffed1eae9"
+SRC_URI[md5sum] = "1e8b8595168446c529b11236cf75e328"
+SRC_URI[sha256sum] = "bb8f8185b805411511786733c4b769c3ee6af8bc879609bffb6c46b8999bc27f"
-- 
2.17.1


