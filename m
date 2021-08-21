Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.10366.1629549737486209601
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TDNkxKX5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629549735; i=@fujitsu.com;
	bh=uLtoyBINawCoQ4xjVXiK78tya2MPQsyunxgHZCfa1xw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TDNkxKX5h97f6CeU0fgOMWx3eN29lG5Xg2zIC8t9VKho6EFGlzbvI4OceFpqGi0U/
	 1vmTMtyaVDh6vRNuyoQUhciaTUzSpBrNyMcPR1gOOgQaoeRcfcZAxLIVfG87pLhtv2
	 UMndAdT6QWkufr9dGPPonfnplvcrWUgDJ2Ndq+Q3sGhO+rNdR6lH+9RX7UAwcqGZoO
	 P+ruVB/2w/NovhtbOIhu8fi29dOgT86RWDV+14iACQQ9tOwvsZEvBNgWNZAhKtf1eZ
	 1TpwREWLnqbF/ghbTvpXUsJ2wWZAMjv4xp865l0Cj7KJ3XSu27r/AhtUMisIvdu6cR
	 UHvbQ0MIXU6/A==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 0D/86-05324-6A4F0216; Sat, 21 Aug 2021 12:42:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRorvsi0K
  iwe1fihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aro3PZCvZwVOy8+Ju9gfE2excjF4eQwCwm
  ibdv9rJCOHsZJfZ/PsvWxcjJwSagIbF76mXmLkYODhEBPYmr/0RBwswCahJHX/4ECwsLuEvMn
  VAOEmYRUJVYeGUWO4jNK+AqMW3aUhYQW0JAQWLKw/fMIDangJvE+ZmPWEFsIaCaC59Ws0DUC0
  qcnPmEBWK8hMTBFy+YIXqVJN5e2sMIYVdIzJrVxjSBkX8WkpZZSFoWMDKtYrRIKspMzyjJTcz
  M0TU0MNA1NDTSNbQ01TUyNNVLrNJN1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzGlILD
  13cw3nr9Qe8QoyQHk5Iob7yTQqIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6c90A5waLU9NSKt
  MwcYGTApCU4eJREeI0+AKV5iwsSc4sz0yFSpxgVpcR5sz8DJQRAEhmleXBtsGi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYd+8noCk8mXklcNNfAS1mAlospCoLsrgkESEl1cBU4NH/RdT
  JP7/Az+D/DCeHhYlvXO5LqPTpyypFbHh6uOabtS0Xp+L0aXULs2TamEusC5mTTi6eLO+XJvs4
  IcdTaeecsxu6p1ifUU4+Jqw8/XdRpg9D7Ubn9VZP0gNC7D1m3lmyMltkfn8It4vydOdDpVEvk
  h9H3/i3r7TeOWy/wbeICfd4YoSfTK2vzQw8cn3rE/vnlQ+e/NPI89T8cpDlQZK0utGZN9J/Xa
  dfvbDvcE0Lf2GXbkqdgkz925Mpp35zd3/9oiCVsqk8ISh1mzH/Eenlpof7Bb2ak8UXBnxbbCW
  iyDhh+70VnS90WabEFc4KWN+lU864e2XJ43N858xWLNzwLe1Ke+XheKaac0osxRmJhlrMRcWJ
  AIQ3L6xBAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-10.tower-267.messagelabs.com!1629549734!232490!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10842 invoked from network); 21 Aug 2021 12:42:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Aug 2021 12:42:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17LCg8iE027504
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 13:42:14 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Sat, 21 Aug 2021 13:42:10 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 2/2] Fix conflict error when enable multilib.
Date: Sun, 22 Aug 2021 05:41:53 +0800
Message-ID: <1629582113-29292-3-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629582113-29292-1-git-send-email-leimaohui@fujitsu.com>
References: <1629582113-29292-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

file /usr/include/bits/pthread_stack_min.h conflicts between attempted installs of libc6-dev-2.34-r0.aarch64 and lib32-libc6-dev-2.34-r0.armv7ahf_neon

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 56fbf8b08c..e25561d9b9 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -160,7 +160,7 @@ do_install_armmultilib () {
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 	oe_multilib_header bits/procfs-id.h bits/procfs.h bits/shmlba.h
-	oe_multilib_header bits/struct_stat.h
+	oe_multilib_header bits/struct_stat.h bits/pthread_stack_min.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
-- 
2.25.1

