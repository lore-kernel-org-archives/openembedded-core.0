Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 68F26770D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:46 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 6so115248217qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EsW0D8dFw0T1PEBAsjKc4tb2RVgkt9xOxb9GprQj7SU=;
	b=QWzaAM/Cf7xwUUbFyvIfh2Ebp+/I5ZA0JXsSlbQYDbVpjSe8Jkyn9NOlL3Mm++SXki
	pKEv37U9MRvI7Utuy7PrVq39ccQu6bjOmy3e9OAs5aWkRjZTExARGhDmdRwWqxsA61lL
	+aE2qPYrq3laPVasayzthQbdJz8BzNt/yCni8eyhIux1lPN2njcea4JjtmfKraTDEW5+
	Pf1CYNk0ImQeHWbyllDDIyDeEmXSd0lycCc/qGKeOaXoEnc3BuC9Xd+Q/VNOyCn2vAkg
	OWb/AChpQrvQpzabr9kQUL4Nv+YMqNhCQ7I1RnNS0myuROgYqYh8BAYsAcVpKjF7UEsH
	iJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EsW0D8dFw0T1PEBAsjKc4tb2RVgkt9xOxb9GprQj7SU=;
	b=hunYJW2yXd7Mc2qHM7PJZl0LNYcAFPUNUHG4ALa5Hzrg4poZdZM6MirLbc9eZvJSoW
	ARtWGUU53DrMcGUQaLkebi5qh3ixLXqz7ANy673WXlLHHayZC47OtXUxn97pLnBtZ5Qq
	qSSkg7GtNWVufdBSP/nRFsC/jYY/BrvM7ON9LFx48D84Ip+nEE5lxoldjACng+VilSld
	SMFjPndcOVMezpLhl0u/hqk8bce6PvVgD2YcjqcaQrgU55ekVKLGEFoKG4/YLgA8T/2u
	zH5v0DT4lVHLleersY4GkC6lHaLdW3j4gY/NpbMmOVMDs95HShkV4Wx6E1xQp9Mm1qQW
	oZgw==
X-Gm-Message-State: AG10YOR2Iug+iG1HKa+FlD+OiGK5z90hVFTSaWBDX1oOzc1x+vqkSNoeuNAPu6uppTHIZw==
X-Received: by 10.140.92.35 with SMTP id a32mr22797718qge.92.1453746767741;
	Mon, 25 Jan 2016 10:32:47 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:26 +0000
Message-Id: <904ce5e6f8a1a235c544f6c2c1dc0b0395283d21.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 10/11] musl: Upgrade to tip of tree
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:48 -0000

Add explicit runtime dep on bsd-headers-dev
so we dont miss them in dev images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8970307..c731a8f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "3abb094d19ca4c7c4adcf373d971fb5aa05c5252"
+SRCREV = "369b22f9c4aebba2b8fe905db8469b2667572ee1"
 
 PV = "1.1.12+git${SRCPV}"
 
@@ -53,7 +53,7 @@ do_install() {
 	ln -s ../../${libdir}/libc.so ${D}${bindir}/ldd
 }
 
-RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.7.0


