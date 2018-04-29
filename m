Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D06D1745C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f189so5129570pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9j1gxdZD9kdGLhTEa2htQCbYO69/4Mz88479tDh3cig=;
	b=mtrdIfy8Gbq4iYN6fRFnQA0bEJOWipOQy1sX1UmPQznqxsMHFUVenh4v00kIuXPNp8
	ex5RN0D+tO/POLmIjRfD9mzoKpLX9H/uTZn3aHF3tgY6pmvjqScoCwz8E0lbqdSrLRdt
	eraj/KZuvbsuKXnKnQ8eWpzG0OykW55ymKIQchQFi08DggNjBoXh/7hjKD6382FrRP8y
	eRGu7AgI67EyIRm27RItlCasEndbxlrWX06ZXDXGHFL1aQ59KJ/iEBY43z6t9kFzzoK/
	/a6e4dyuW9zL/wFgS5WfVpL1agfLWjfBHhDfhriGeRdnMpcTpq61VrdkZngc9o9kO59f
	vgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9j1gxdZD9kdGLhTEa2htQCbYO69/4Mz88479tDh3cig=;
	b=Obj8stbV/1+yrppaithzYZ49MmwkvuC+chXMHT95OubE47pES0GKi9WvJv8q7J72At
	ooEmVKqqCGiauzNLPn/7gRUFRkxzO4oJOR9VNZsI0KEvOS7Qp3Mg/yDq/OOghEDJ0kKH
	LVIj6rtF647lH028ofSN9AKeOr3uVRmnhTIOA5HFqcbvS/kQr8nCF3jkLOXnpQ4DV1D0
	JWyPWX+V5p5jgE6sUFsk3Gr87wS8egPaxH6wOYZB1UQEBHlOzKXzY6vkBnNK9jVPvxxx
	Gk7NaCql4KiQzl92I9SsanTFzrigcW1/xghyFM3RCJ5IJAgSMdaHF+iQOkOtyGW1bSho
	YpUQ==
X-Gm-Message-State: ALQs6tCHOTskGmOMwZUZss+peSZ7NO9DA0l0IDsYv09+CR1SSO1Tggq+
	hR/wTAUGcwoMTDOXq2unJ9v2Bg==
X-Google-Smtp-Source: AB8JxZoC3JhfbBzNxryoZVVZ8UEjTEirn06DAdcelDLCyjgV6N+0XigEUz9ZkgWSMcoFNBWuwNPIdw==
X-Received: by 2002:a65:414d:: with SMTP id
	x13-v6mr8342980pgp.223.1525030600808; 
	Sun, 29 Apr 2018 12:36:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:07 -0700
Message-Id: <81555add56b72904f75cd34538206fd82f5ffc07.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 20/24] perl: Account for libnsl being dropped from glibc
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:40 -0000

-lnsl needs to be removed even on glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 53a426289a..6b16689386 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -145,7 +145,6 @@ do_configure() {
                        -e "s,\(i_fcntl=\)'undef',\1'define',g" \
                        -e "s,\(h_fcntl=\)'false',\1'true',g" \
                        -e "s,-fstack-protector,-fno-stack-protector,g" \
-                       -e "s,-lnsl,,g" \
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
@@ -158,6 +157,7 @@ do_configure() {
                -e "s,@BASELIBDIR@,${base_libdir},g" \
                -e "s,@EXECPREFIX@,${exec_prefix},g" \
                -e 's,@USRBIN@,${bindir},g' \
+               -e "s,-lnsl,,g" \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in
-- 
2.17.0


