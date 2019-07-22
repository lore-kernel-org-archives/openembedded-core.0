Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 218767EF31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:26:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so11014620pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=osUPoXVFGpzIPIAmGeky0cYTWkVnXAv9wnZ3jCiiAVM=;
	b=Ae1Re427pkQaPTpB9WldR/PpeJqk4YiTmzs/3s4RXpZrg6y9tn7BaS50Bid4H2iVd7
	53tfaCZ7sCNkYlnbU7N+o834hbcgPYMZZpAcdIrQjLFBxe6KwLCSNoUYU8tbS7c3tUPk
	XJ5u28bQsLISWujnjt2NPQwWpIFF+6OOil5mHjOVgF3Xxd1tWthEiohvJk4M3xkS4ES7
	IwL1FEsw+AoNkRLMTTIITAjjoIlzUTjppsBnR67bOBh7fEBo+XCQ3F0pvZ9sC7/oBniW
	gbCQP9aJw6rrgIN8fmY7U833bEUI7HVLJ/J65b4hR8Y716WqF3oAWCD/Z5jHFTu9jN7b
	zWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=osUPoXVFGpzIPIAmGeky0cYTWkVnXAv9wnZ3jCiiAVM=;
	b=U94oZbSooU6FyzAc/E08Fesynu6xZHqTnLYyCEekRECNOK4ZwMNUtezdIIjzVtrfJZ
	tJYSp3ACpMVw4cH7i5XOChBa/lM+K4Yp8jj4Ckd7VJI72ZC6DrXT8WUP+N4G3b/YTTLx
	8QwJejzPy+QY9JPIm32zlyxKap6tP5f1ZsHHjcyjn0EyYWJj3aP5F5OR+WqESyvUSGxj
	VS82SJLmtuSI04y5wn0h6k9V7qY3DdvXRNlXPMoyC7Y7QX9pYAx/EJCS0Ro/7PZ44d4C
	HPXuJAj1ERFTr4zlhk1p3WhlAJPh/s0uUnfgJD1r6wQeMu9r7J/KHRklPCVM2LNhPz/a
	KAzA==
X-Gm-Message-State: APjAAAXlmb8WCHg1sJDKIQYyJ/++r2m13SnqnsSh192xhESc5zbAfbGK
	7nhhdf8bqpIgZyj6DXTeziiX5pmY/Fg=
X-Google-Smtp-Source: APXvYqwv2N2Bm/cRiFzS9NIDxW1IwT+QKYjU3VqjpixJJ1nVlY3dID5TCOAM4toay5cTSGzfPeuwcQ==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr52775421pgb.441.1563780382541; 
	Mon, 22 Jul 2019 00:26:22 -0700 (PDT)
Received: from apollo (c-73-71-176-3.hsd1.ca.comcast.net. [73.71.176.3])
	by smtp.gmail.com with ESMTPSA id
	b37sm61095461pjc.15.2019.07.22.00.26.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 00:26:22 -0700 (PDT)
Date: Mon, 22 Jul 2019 00:26:14 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190722072614.dxfemqovf2bkitul@apollo>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Subject: [PATCH 1/3] musl: Upgrade to 1.1.23+
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
X-List-Received-Date: Mon, 22 Jul 2019 07:26:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

License-Update: Added contributor list and copyright years
https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=7a6c8a0df1b685d788fd4d3763681bb3018806d7
https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=d6dcd4185bddff34724d6d539f834e9daf7dcf3d

- include release 1.1.23
- Add riscv support
- Add syscall numbers upto 5.1 kernel

Detailed log
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=ac304227bb3ea1787d581f17d76a5f5f3abff51f..0ce49d0a301b4142741b32773492af90f66ed3ca

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 8408c5da62..0683bf85ed 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8a4bb28f771c817fe57d3a7c4240e3aa"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d0fe2be17bc45ff4a42ade1c13ed6340"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a7fae4a656..039932a3bc 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "ac304227bb3ea1787d581f17d76a5f5f3abff51f"
+SRCREV = "0ce49d0a301b4142741b32773492af90f66ed3ca"
 
-BASEVER = "1.1.22"
+BASEVER = "1.1.23"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.22.0


