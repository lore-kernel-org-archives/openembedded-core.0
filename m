Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07C4A7ED65
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id az7so17872209plb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=URiXsTbR3PfUQINB2JrHFP9JyIzIYDlnHnHVrVv7fPEF9ZUcn5JZqnSuB3k8bL45Bj
	5AnKoH0i464m6O3B0DHble+bBloF0LQDOd4laA6VhBeklNO/ZeHJikjEooE0RQ11g4WV
	QiyAtLwDaB9MJp3vCwiGpmCRpX/ogBfboK1cZfo3LioQcMefNchiJAC7dQ7e4YixhozB
	1d/pMHOEYfEfe55umvxnUQxB3Ugs8M1PI08GRTWXNcYbL2v7FrmrAU9ZHSCKiW1cG28b
	cpwqz58VxehfnRz8DeVKK46R0fSjTfXqMCbOWcBCD+80sL8iUAfILjhRBM/4Oo42/45q
	/ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=qcsW3CECmxE9RFDtrfPVOVZjr3WSneFoX3gXQi+Ppa2TBKVYxJZO3HrX5HOkYlQA30
	KDXYiVn9PlHVXprSInqIEL7XCaEkorYc0j+gwGCtn7W3iybLJZJihGBm993IChI9DxfY
	JEHYThs0+YV+G44/TeQ3yQu++SHKtacGyg46p+BVwaaBWRhJYfeN0WqPAJHZrMyjLxGl
	4b9JGJo9xf8Tz8AIDjGamc8meXjKocsCSjT7DalT2V4JhJcu0ckqQ7+wln3II8MYNbcc
	uojxNv1YelFwq1Y0wBaqJy6Ma4jiPYn2SPEkIP1xVt2MdIY8/hbv+1HflzZa1eacomun
	PW5g==
X-Gm-Message-State: APjAAAU37Gvn46PqsSG8tiBOLiZkwJwzjE1kE7JweA4Jttq+/pdoP9yZ
	wFH5Pf3+9icgZ1dq+NCrWYuyj7v9
X-Google-Smtp-Source: APXvYqwh9JVElZ2llulPI7/UMUUSrthGAKe62ksoypKfTlaZTv9AhSuMNefvsmkfgQF16oUCQ0K37A==
X-Received: by 2002:a17:902:2a26:: with SMTP id
	i35mr69400165plb.315.1563719148150; 
	Sun, 21 Jul 2019 07:25:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:14 -0700
Message-Id: <352ab80333096df92ef0f4cd331baea98e71aa21.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 25/30] uninative: Update to 2.6 release
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:47 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The 2.6 release contains both libcrypt.so.1 and libcrypt.so.2 which fixes
compatibility with recent fedora/suse releases.

The difference is one is built with obsolete APIs enabled and one disabled.
We now ship both in uninative for compatibility regardless of which distro
a binary is built on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 0bb8f7a..df24346 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
-UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
-UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
+UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
+UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
+UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
-- 
2.7.4


