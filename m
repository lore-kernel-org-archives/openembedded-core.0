Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5376373219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:04 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so9711596pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EKBesTDHUX5HOJtWy9X0kmcrnuveThQ0Ehj1sgpZGmY=;
	b=c87VqqaHTkOZRzqp3RE17PeZAxs2s7oHFRfzPoHVDWqEHFIq/ZZELRmWjM1bEBA3g8
	mC7y0GIX/l6PqOEJ2VCvfI4jaALAy9XxN4XELp/4uqquc6yg1DsPF6PYygtdkBkjZrn7
	d2sYYHI5xBa70Gx4h1zKCV+TBoHzwM4NzyRcC4wT8m9ctWzDfXI75nNpBLhFS4PfGftO
	HfxMILKCt1Gl1MXvGf3INizcjX+gcTnioAJl6ORdlNx3oXFoQVPRktu7e4iIsTRC8zKG
	4tgBY4CRC0m9KNabij7dHVNkB+0a1ZzdIayYTKRleY0ug+t4w2uuT2FJDVhG1DE7JD2z
	wtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EKBesTDHUX5HOJtWy9X0kmcrnuveThQ0Ehj1sgpZGmY=;
	b=VZ6SlFlGSAqMnM3LOAQ8f3mDJIGOQ1fLWGgpkfz9LoYgQB4IJlfKrJZz8cFcrcXn1x
	gCutHq05C6EfuEoT2WgWHIj/M3GIXYIQTnyVM2cqw9xRbn2FJrADXWTquoqg9V4211Le
	MqgGTJZkG43Sg6Bdxvma5Y3Y/3sAlebpMKaNzzvXMcBGPMolv+ewG5jO620vQscqGXyv
	V7+v1cJw1E36AqAEvP4EVUiLZxmCtws5r4SJsmeOm9axQrzm9f/3QmCq7T48OTgpq33/
	B/hKPjsItdJAvrbVKW+5Vl5hfpEkoHH0ZehOFUTFAIpSBA3AHh8rSVNZc313l3IiBPtb
	7u/A==
X-Gm-Message-State: AOPr4FVPZY7yeo+ZxAAOuNDmLrYkvRpl9ZKjigk9+6sD1Jv6O4lvjivuemHsdDscJb9KYA==
X-Received: by 10.98.41.70 with SMTP id p67mr24582307pfp.93.1463158025276;
	Fri, 13 May 2016 09:47:05 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:52 -0700
Message-Id: <2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Fri, 13 May 2016 16:47:06 -0000

gcc 6.1, glibc 2.24, gdb 7.11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c412420..d3a4351 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,11 +22,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "5.3%"
+GCCVERSION ?= "6.1%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.26%"
-GDBVERSION ?= "7.10%"
-GLIBCVERSION ?= "2.23"
+GDBVERSION ?= "7.11%"
+GLIBCVERSION ?= "2.24"
 UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.4"
 
-- 
2.8.2


