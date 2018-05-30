Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0330174DEB;
	Wed, 30 May 2018 13:00:44 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id k17-v6so1255098ita.0;
	Wed, 30 May 2018 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iC5H9AphNSAT/HaPh3z493uo4z+P2DNuvn1Uw9DfR5w=;
	b=WuXaa4S45K/4xsnLjWtZUok0oV6fH5lJBGf2yxd/YVGxCXk1ZRDzxAJkJpe9qLzymx
	vVeBgQDDJlZIysLMI/Gs8/9MG8VZ/Q4diKSC2Zdj3g1WCBn1ZtoWeKhUX8lLMGWRlq1o
	y9u3b6Lv1OyPr47LMfz9PBDPirlF3H9jiA4s2lW20KgVMNCdBapf66pGgMKOkaw6rHrq
	ij5XqNTZFWUaBZycsaDD6TbVaHOAD6TzCBJxZ+psARudnPtZpKvfXIT2EIx+J12zo+62
	efqtabse0ucnfZTEUJFC+halPmPInvZpWaff9QhcQj1sF8MTD1Rh3+Yj2FwqdnaCHptr
	YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iC5H9AphNSAT/HaPh3z493uo4z+P2DNuvn1Uw9DfR5w=;
	b=Fbjy/FC2cA/zo2Ov/oBC7q0lEFXzV3UhBnKg+yBddHUVPUuntFppbEVOUfNtapM5j2
	EgQ+30cHquIeM6T4NZmFhWF85OXQNB8DrnT57Olxnach2svi4xKxz56e0YPqomW+8ufB
	gBqKomdJYtjuJ2Ci/zZNUKK8PFJzBnH0GJXQfbYdKMpUCBheKgrMmP9pY6IJhEaLj6T7
	9BHqqfZkjQj7usmhkxCe5ntkEijVDnu5pGPHPo8Wf42nlKAYr1pkigXevY5uvyeZyeya
	nlTC0UZzUwkVeDlvoV9+jT+Oriq2rSRkez7CnzMN3LAEPEUA6GQ5xB70USkNzyQXkw1X
	9k1A==
X-Gm-Message-State: APt69E3jdjFeL3lJUv0aFbe30T6msf7CRsslufFQibAuyPbleAijEFSw
	p2tHNytO/n4ULD3av8nYipu3zDg=
X-Google-Smtp-Source: ADUXVKJqh9lD9tJdHh3JxQ52MSJ21K4o+UWos4Rq2GlJWSug7fvyNuCY+t/lteP5QmWM/YfRNLIodA==
X-Received: by 2002:a24:ca43:: with SMTP id
	k64-v6mr1639392itg.44.1527685245301; 
	Wed, 30 May 2018 06:00:45 -0700 (PDT)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	f12-v6sm8760868itc.41.2018.05.30.06.00.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 May 2018 06:00:44 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 08:00:16 -0500
Message-Id: <20180530130016.18864-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][rocko][PATCH] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:00:45 -0000

The 3.4.x branch was removed upstream but the commit referenced in
SRCREV is the 3.4.1 release and is still available:
https://github.com/google/protobuf/releases/tag/v3.4.1

Drop branch=3.4.x from SRC_URI and just rely on SRCREV.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index fae7c18a1..fe28f475a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
 PV = "3.4.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
+SRC_URI = "git://github.com/google/protobuf.git"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-- 
2.11.0


