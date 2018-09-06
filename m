Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA16D7961D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:46 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k14-v6so8467721edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OH2UixwvYxMYuJIQUyA/Xpf0MvycWh7HC45RFjmwKoA=;
	b=MC8tao+dBBThSRYqH6OmkxOf9s+ewcBbuTrGpDUtNth5d/tJB62OvDltK+b9XW1VGH
	NGgKjvNSt89xEWaIZB/PJmbtHfA0Qb441rVHAWAiD+lRrcUjS2p5a+Pd7x3p1tQpRYfR
	/fsy4cNypvDZwoy735ntmwkbiwrNZ3cUcJBFH7nhrfwxVv2Vvkan73ahVpJyzLx2z9ZR
	G/k+1V8MOhOCeOjTZWsr9uMOPuZQx4k6ogQGgLQX6keu3s00kU9Z9catDY/Z/dtEq0qn
	S6CUG5Ms9mc0Tx77MPc2TwS38Oq3/ycNnihZvES097l4dYLzPqjdkV5FXRW9uEHuE6k7
	hmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OH2UixwvYxMYuJIQUyA/Xpf0MvycWh7HC45RFjmwKoA=;
	b=aofq9VhGA9DpBHL1fsaE+/qF2u+pGS433S3tme3NYLP4pEl5Gab6esLXC/8wAmcSY5
	fS5XCrFphYdXyolNJD+olapKtjWG6IZrvgsN8GAhv3R6gYUQmgjGAfRbGfsEavAkn9mn
	nWmwat5ejwc/VVIRFay+NeQ5K3rLJpXd+VsQSCGgaG9vX3NgBT4jMLihDhQjy9ObeAaA
	aHLC8d8/8XDdqVWaqtYazWdD1DYPR6wCwX2+PQTfLQAGz2Cxn/WHWO2IgjYR1B3e6zps
	BISv526GSTcav1N0kz1G4MRHJxS1MAPYf45+4ptHUCT8KNE9bwQewcz209gPF/0YW7iq
	1bnw==
X-Gm-Message-State: APzg51DkXlCy0Tpd3K4i/ZTnfssUSiBYLFsxCkZEXNp2DRh+CLM42Dem
	jPqvB663x739L3YdY2Hm9uSgVq9s11k=
X-Google-Smtp-Source: ANB0VdZHbCeyUXxkbluXOVy4XTxgUlquNw/HYyq960LdCQcrfQijppGlyYCzHtvr9B4NbOJCns7y6g==
X-Received: by 2002:a50:ae62:: with SMTP id
	c89-v6mr2724562edd.128.1536230447016; 
	Thu, 06 Sep 2018 03:40:47 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:23 +0200
Message-Id: <1536230436-30342-8-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 08/21] babetrace: update to 1.5.6
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/lttng/{babeltrace_1.5.5.bb => babeltrace_1.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.5.bb => babeltrace_1.5.6.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
index b247fb0..f5c31c4 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
-SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
+SRCREV = "4f10a4adabee5ca61c27ba399b3438505e0cd6de"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


