Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 80B4778350
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:58 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x7so2948370pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=M4giMXtjwvWbjWM3Q1x/BjrIuOOaYgr6XGAOAyhMn70=;
	b=GY9hslccERYlAor7D14ST/4u5eaf3I0FVdwnjWNtb06oyDivSZGOqBhxRygTt941M4
	Sew8aJ/1R/FdJ1HpmCLRBFRS9IUcvE2AEV9EzOdvrYlDC5Qq0VMHo59H8E2JoHbWZKCv
	q6/9lXmVnj/rH6do5sDbYRz8EiYeZaX1i1l5ZJgDJ3tq3o+T7L6ZTIM0G/TmmlVRSbz1
	hf0zWifaxKqLlUWLePsAEpF/EGah5XMfFkCc62imspPiENzT4OBNF9vg7aju6z2PoTI+
	DYwJegbODEQcU38Kpk5bvQ7iUwgSWcBzv0TuoFp2u7bnoxfIbKmrf0T7jOp+hXzclHgg
	paAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=M4giMXtjwvWbjWM3Q1x/BjrIuOOaYgr6XGAOAyhMn70=;
	b=KVXEjNnlC1BlPtFDGuDlnZSPKxkGJlTeB8gHqhI6p7gBRXn7n9bldR+RsufUEE2MEY
	/YRFrDerFRbF1+Wfi444dHuB/GAFDEcKrLfA1yxb1dNlF6z1BncXcxOi3ar7wYkNx+tD
	Tiv31ratlzoQK/IYCVpiau68v3S5vDhwwg5nGP9LpvqPBVIS8nsKFBEmmxbmweO9qKKa
	0NlnpDTMBnd63EX7w8jx0ECw9k1Kf0qqavuuPYs43C92aQGGGre9+dLZaZUIvQQfAaza
	++OBYSK6wo61WQPOLYt0D4wPtYyDSrUnc/sfueD2J+lbrSWQrkGXKcW7Hz0FM8qXOHci
	ZTpg==
X-Gm-Message-State: AMCzsaVk74DQUcO70wTzx+7/EVnkuNVI/HWnbROtK/b3f2rZspN9dbM2
	Se8Pn+9u+tYfbIYkPiUbu0Q=
X-Google-Smtp-Source: ABhQp+R5IjqZcGPogqNn21CdQgORQFPeUZLngLGtvNyYHk/PSZxq6UdiugCER2J70BBOSnZ5Z6nlRA==
X-Received: by 10.101.73.79 with SMTP id q15mr8486619pgs.236.1509738899772;
	Fri, 03 Nov 2017 12:54:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:41 -0700
Message-Id: <1596d49bfd51e6b9582cb6944b826aceed34614e.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 07/15] libxfont: update to 1.5.3
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:58 -0000

Check for end of string in PatternMatch (CVE-2017-13720)
pcfGetProperties: Check string boundaries (CVE-2017-13722)

https://lists.x.org/archives/xorg-announce/2017-October/002816.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxfont_1.5.2.bb => libxfont_1.5.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.2.bb => libxfont_1.5.3.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
index b11dda5..5b15a4e 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
@@ -18,8 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "254ee42bd178d18ebc7a73aacfde7f79"
-SRC_URI[sha256sum] = "02945ea68da447102f3e6c2b896c1d2061fd115de99404facc2aca3ad7010d71"
+SRC_URI[md5sum] = "9ba75bf38ba62a6ad52550ab716da9b3"
+SRC_URI[sha256sum] = "ab85c10fd2683481dfef672a77fe60e6a2039558cbc0e9bf56b5e1df471c93d0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


