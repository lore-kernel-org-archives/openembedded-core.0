Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 53A5B7FA3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y5so15006771wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=kOafiESkJE9P+dDHOA4jRLcVg1ytLr661J2idGHt2XYxlTqT2if00qFp4Uj6TYJOvi
	8yoLQaZ2b86ByfH9oYf1apUy8siaZKn0HVYjP1oF0q32SYtHdmw6RXoJoZUxOVaBWZJR
	D57n+5dECelDkjdM0NW9WmjXt2JX+pZx8SX1PyRvCMM5GYtHyIR6u4OrhP+QVw2hbGUD
	vvSlTwi+sngKIFfWQAdn+sHEV+6AS5+Vl1IDSJhYgfPAnaBWxAt0nrkNfkDaVvA8/xKi
	YQ2yIncWfYdTaoBbOfmURPX5RCZRWAbkWissZCQPkOI6ogvDHLUH7FbOsppluV8NZSSR
	S+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=L60kRD+gDfaPo4q7PEjayrvJ/OSgeIpT7c7IFqjIddhCL4IHidIcDEsbxpf8qXFc3e
	PsWjE7IMDYECU5JzmOYKHgEm/nKFe1TUimMrbUZi6oMHDLN6fEsjpzfIVALtSxPQvpxW
	odjd8pmG6khA68XAW/4hFGz0d3wozsuYDVwdhmQFqKarS3uk11xoe7tkdwwbCMJ9yp5x
	6cN0dU4t0z4ql2OnuFhRwParaGvfYJvoYHpoMGl0JveHQjJPkCgVGRzemtQ3FiUhQ9VP
	bITvulxm9nuI1I4WLsOnuET+/upEU3m4fef3qSzA/gYxY+1vy9AC4sgOgPhl7pbFkTKC
	uhsA==
X-Gm-Message-State: APjAAAXmPBU46HbQOGa2DipFU8kZ4FcI/aKiuI2VAF5K6cEBxdsDKUWH
	ukzctQ/QipT7Nxh9+oU1WidGX3CZ
X-Google-Smtp-Source: APXvYqzv8UEuZEL8nn0JwcA03OyQN9Au/W0vvaAPSiJS+vbT7ILxHiRDUYdFcUwbuHu6/nw3Y/1g3Q==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr15335647wmj.39.1575033124496; 
	Fri, 29 Nov 2019 05:12:04 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:40 +0100
Message-Id: <20191129131152.128311-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/15] dnf: upgrade 4.2.2 -> 4.2.16
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.16.bb
index f38167f1ad0..1373bccee23 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "4c74fe24c4232ce6bbde4b252f9715cdb29923f0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


