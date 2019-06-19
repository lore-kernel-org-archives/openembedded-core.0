Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 600137E947
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d18so3413998wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sEinXBXFHv5/01LEQppHwa5oswCMfrh8D49hPqMjIRw=;
	b=idrE5J8fInosmY8sqzb4rmX6qSkH4kQDobp03NuDdTy3qkvkvyfe1hOT1U76nAvwu4
	qgpmfNkWqoMmWAmdzvvj7bX0zPuzwmYLT7PotOuQVn8z8aDn1JCC9o+rqdxiyJ0Vagkd
	46E9Wq3c3lFIPGBlemOISgCZuDrlKiYFuMUtGA4eRCGkDaO0ywKak8/2aux4KVEFQXkR
	lP85xjFCHPPOm77xfvg+yykmTShaP4Dq6mbVC27NFb0PDQYJ3gWOC9HC7Aw+7Id/u/sU
	0cesr2MVLnppzvKI2xcWP65r/IvRpJD5PYInP+/MNUSypDqGbb3NDfvqtIydI+NFGL38
	ixFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sEinXBXFHv5/01LEQppHwa5oswCMfrh8D49hPqMjIRw=;
	b=g2bB+gJhyuVFT6gNTYchHu7gFrfq9rNfLbQ0STX0f91VHeBoNhf+s9dmvxuYlwfW0z
	06MjP4YSUJZTqOHQN94IOdciV2qagh5XCqTI6YvtlJBU5wVQSZrHzA/GwXLDMQQdnwfe
	IfR/uy9JmYN2HqLb8guBboRQWmfvC8oEPg994iADlO3IZGQ4W0lPXuoSpI8OQ4JRwab5
	dk0aPmfnYGr+NBj8+eGFSUwaHtf5lZhknedpUqqXFTCP0zypnUg/sMx4fIyCdJVF15Ix
	n9q9n2w6G++n80jGIyl0YVQIKc+SLG9oYVJZEzeep/f7R3fBCSh1JBFSkJ6cNEq7vXDK
	6UQw==
X-Gm-Message-State: APjAAAVHM1T3JqFGrKIuVvqHuBOE56x32+U4NmjceicQp8+sXlZi2fBJ
	mXa7oWl2KsyT0FQ7T2oXIlGjQRYbkKw=
X-Google-Smtp-Source: APXvYqwVnNYuuRFst9ip+gSVwyxggzJ/2glk1cRR70Fkmmu8c2Dd3iQt2gWmuIicY7kXvSfYrezEBg==
X-Received: by 2002:adf:c506:: with SMTP id q6mr71887956wrf.219.1560950700980; 
	Wed, 19 Jun 2019 06:25:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:44 +0200
Message-Id: <20190619132450.130226-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/9] dnf: upgrade 4.2.2 -> 4.2.7
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.7.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.7.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.7.bb
index c77773332c1..f22af64125a 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "11910fcb0fc0ef13838230dba4f719be3540fbdc"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


