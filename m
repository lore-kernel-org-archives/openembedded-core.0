Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.18079.1627901075587810959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 03:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=qyHoscDa;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.19, mailfrom: paul@pbarker.dev)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D997C320010B;
	Mon,  2 Aug 2021 06:44:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 02 Aug 2021 06:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=EwST3FVBKFW5Ih/LJZAIub70Nd
	ph5WL5d8K0uaFH6bQ=; b=qyHoscDapcTOBvpXK7sB5GYkz/jAn9d2ONt/t9zu2n
	hKKBWF9IxUYYsrmB/XtFbrQaCDtdBgwehN0oqaiQ/9ShcKDZ9K6WMkhiF9SDMAyA
	PpNt7slFUPIhBciml8B2NqNIP+YG9ZMtAhR0BLzMmGoDJU4HJpHzVZhi5fHa571i
	qRjEZJkKUk+9/0Y9DZJGi0x2C0GZ0EMTQGukYpD6wA4b4wJle+O3dYeWXCDXDLo7
	q8vDGETjjOj8ZnQf+E1WeAxKuit/uYKIsDnl2LxDJtlkDpbMrFtjOtHbHK+ECxQR
	9N/EqCQfzgyoMKkde9E6xGmm7IVHmkHX1G115RcreIvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EwST3FVBKFW5Ih/LJ
	ZAIub70Ndph5WL5d8K0uaFH6bQ=; b=HIRQCqMygH2OQdEAASLBA7oDN6g//WdL4
	R7CmZrUiOwFhfBCjJaQW7dWm1kwy1EFVAJKjER1vzoP7YZRQSQn28q7VMt0Csz8T
	44qdN7ft7t843ad28rG/HZ74zZRCIb0RxQqiF7PUvj4BMZe3xi4cDCJLCvhG8X0d
	nHtSJxIkcKDZ6iu9M2y5XYmnygss5FfvN14Cv8jSk5fbioeWOnkp6ImS+2qfO/A9
	t/adQ20S6pO76CJWeikgLM3rU9DTn/pv7ekEjhSywL7m05i7mW1vKoiYzjvgoGdG
	PEJxiabQWY8bIuQ4a+3jrPFtD37w5ugla/2blF9oC1akM8yu9hAfQ==
X-ME-Sender: <xms:kcwHYaSbHHsFe-3vCqeQnqI2bKzTs36raxCkm0ZbsP5xucK-ORvBag>
    <xme:kcwHYfy4KRq7-zW1lgeu1W18VG0gap0FQsjWcNRzM0_xljFXmxUQUwys8zE_ny4k6
    mLdqynZvWi17rDeH2Y>
X-ME-Received: <xmr:kcwHYX2DpqdohK7B_kGQkfYeY45Lihirg4VdTCuqgR4pS7AnW7utYKoCkokzpY90hVXIN6R_EuAb6P697427XuY-gUJ4q_HF89-fyfDQRiUcyyxLXhBSPAooCa0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddriedvgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepte
    efleelheeugeejudegiedttddvffdvleefgfdvudegkeduleegudeihfeijedunecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsg
    grrhhkvghrrdguvghv
X-ME-Proxy: <xmx:kcwHYWC2J95mLLDNHkRxKPWhkAy1lmO5jWOtyJSSTgi1Mdn1O7b-MA>
    <xmx:kcwHYTirhuF5uJQj9SxC2f7bEFCgmg2pSZyqEJDJqr4Ok15FhS0pPA>
    <xmx:kcwHYSrTsexNqg2dhQLvpnDzlCOryZ41U8zBjNKVE45m_RV3JgaPfg>
    <xmx:kswHYbYtm2TgVBE_Jd0LFbz6U12beb-nOx6Lfd6FPdZ6MHT4yUI0kg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Aug 2021 06:44:33 -0400 (EDT)
From: "Paul Barker" <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH] kernel-yocto: Simplify no git repo case in do_kernel_checkout
Date: Mon,  2 Aug 2021 11:44:30 +0100
Message-Id: <20210802104430.32402-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the kernel sources are not fetched via git, a local git repository is
created in do_kernel_checkout. In this case we know that there will be
no remote branches and we will already be on the correct branch (since
only one branch will exist). So we can simplify things by skipping these
steps.

This also removes the assumption that the default git branch name will
be "master". Prior to this change, the final git checkout command in
do_kernel_checkout could fail if a local git repo was created and the
user had changed init.defaultBranch in their gitconfig.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes/kernel-yocto.bbclass | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0df61cdef0..18b77e2b9f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -358,6 +358,21 @@ do_kernel_checkout() {
 			fi
 		fi
 		cd ${S}
+
+		# convert any remote branches to local tracking ones
+		for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
+			b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+			git show-ref --quiet --verify -- "refs/heads/$b"
+			if [ $? -ne 0 ]; then
+				git branch $b $i > /dev/null
+			fi
+		done
+
+		# Create a working tree copy of the kernel by checking out a branch
+		machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+
+		# checkout and clobber any unimportant files
+		git checkout -f ${machine_branch}
 	else
 		# case: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
@@ -379,21 +394,6 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
-
-	# convert any remote branches to local tracking ones
-	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
-		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
-		fi
-	done
-
-	# Create a working tree copy of the kernel by checking out a branch
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-
-	# checkout and clobber any unimportant files
-	git checkout -f ${machine_branch}
 }
 do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
 
-- 
2.31.1

