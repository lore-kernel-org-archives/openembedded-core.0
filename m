Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2BE79493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:07:48 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id s13-v6so4022803pfi.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M9Xhuc2RccoebFc3ON5mavDdg94SuMVKW3HNBsp/vh8=;
	b=Yr1G7jRME+7HVeCRvddyiNAKwadi63dJLsJWOPv7GeRCVG+9mYQbG4iDIdYXzeSoL+
	gsiqvmnnzVjDaUUwwSRRzbFkcz/w4SH+WNYai/CmAhuMOmedqrtxS9h13EC3t83ievP5
	9yFnqfcqugvrpu5CXHFPR87zvjsHwe4uOWSFjBFpdVzOYB/ALVfRra+dSLTWLmXEab+T
	wBZzo+FbXwmjS/Rxth2AhWA0YqSoSc2wgYb579RxIoTzFMpc0h5zw6YNO72NqVwRqsOM
	XDfdjWGwoDoqCVlhJwrqS0dIRXTXKwpeujUjEgp6lddSVMMmq6zcCJa12ZSYObwWatex
	nbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M9Xhuc2RccoebFc3ON5mavDdg94SuMVKW3HNBsp/vh8=;
	b=l+S7Xg3H9j/JN8ymdFdina8T28etX6mmmunwZCEwiPTPaqvx4d/IeYfyaBjFRCMJHP
	TuIP81rZPMbz2Gj/WsPu8ycH/+tIYjy8lx3/ec/lWLLKhfrkG9hKiiEfzynHGStcmmEP
	sKIxE/4TbHybkUxneKYD3EfFbv4/51lBsOjLD+SgAZUb/VX6fQK28O+ybfXr6pNQTo9q
	xrg9LhZ2u3OeshnX8STaHO6sYhnL7Kl5pyeomKBWHsUNK1Y58JJGI9FGqouupuM72b5q
	cRm5OB72cfl4dgCVZh6ub0Ea7ZSlTBBX5eSUtgpcENYDcUS7ArtDXqkngzjWs0c0/bZD
	1a9g==
X-Gm-Message-State: APzg51DEi/lvOAvLBPLQlSBvOtLvzLfziRy/u3yFUc0mMZ9ZbyIWjVwS
	8Y+cQiFHJUE7hb/mUnNvLJjnltOV
X-Google-Smtp-Source: ANB0VdZzaYvaFBwYkMxAhKfIre1rtY1I3IbZuWDYZc/hjsdK1tSpqXr6YOY/LckP2DkdTPcswBs70Q==
X-Received: by 2002:a63:7e1c:: with SMTP id
	z28-v6mr644272pgc.246.1535098069173; 
	Fri, 24 Aug 2018 01:07:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	m15-v6sm13890790pfk.149.2018.08.24.01.07.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 01:07:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 01:07:38 -0700
Message-Id: <20180824080738.6061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] Revert "cpan.bbclass: adopt to recent EU::MM"
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
X-List-Received-Date: Fri, 24 Aug 2018 08:07:48 -0000

This reverts commit 2e61533e7c1b1cfd49dc771e907207f11a15c44f.
---
 meta/classes/cpan.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 926c6358a6..8e079e0d55 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -16,7 +16,8 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 
 cpan_do_configure () {
-	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ${EXTRA_CPANFLAGS}
+	export PERL5LIB="${PERL_ARCHLIB}"
+	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor ${EXTRA_CPANFLAGS}
 
 	# Makefile.PLs can exit with success without generating a
 	# Makefile, e.g. in cases of missing configure time
-- 
2.18.0


