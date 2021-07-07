Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.22893.1625672689516312821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rIJGLBQz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672687; i=@fujitsu.com;
	bh=YyXmVTKpHvR4WHPqcES8bBBsHHgdkcQyISdHGDR6ixI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rIJGLBQzemg0fvk+SqYc+4Z1QJk1ITWfnXG/7c8lNock7g7XWEjzjDQJGpRyBl1q8
	 wlovoLcEt8TqJtJUTM2Xd6llvrNWr7JVKuFe8tzyZmjCpLF8nt1VOboN3Wg0KDdcjf
	 nhjwqP7BDuxzO08gS4I8hiHwfaXmVagODnkMHAbhsFJqxWUYaSKEZbMGrQsjkKFXD4
	 /7Y8+SyQf06ax/pP+ZjrT7cTseSno2cgAJKMfUPEzfKL0WLHszFfzfTxEcbg3VdTPV
	 Dq2WGjPZyaVfa5a1SOmCeuUUE7OtddX76rsulQ3H/TiOBI3Kbqyyt0NLPEa0Yqs2Aw
	 k1UqDuDdBLgeQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 1B/F9-27654-FEBC5E06; Wed, 07 Jul 2021 15:44:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRovv+9NM
  Egxt3OS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxdF3czFkziqnh74xJLA+Nazi5GTg4hgZlM
  Eiv+pHYxcgHZxxkl5u9/wQiSYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhAS+JK
  SdPMYHYLEDxC52vweK8Ao4SpxZ1s4DYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqFCVmX2
  6Gqq+QeH34EvMERt5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSUtfIyFwvsUo
  3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzC4UgqOP97BuOLNB71DjJIcTEqivDNXPE0Q
  4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrdgooJ1iUmp5akZaZAwx0mLQEB4+SCO9skDRvcUFib
  nFmOkTqFKOilDhvOEhCACSRUZoH1waLrkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlTQK
  bwZOaVwE1/BbSYCWgxw2GwxSWJCCmpBqbdC1V//lj6r2zLpkczBCwkkhaWy82VYRQ4zRh8f6G
  A5vvEhiz5a3Pi7sTHJpUx33foNbAPN9u2L/nSQ7kry5Sj82Wlt3k3373y/9fqjfXJcXEmP+wj
  bvKf5iw8pOn7y+xv9ApuLxblZpU1rXnlZoxqtq4rrrb9WFGn09o0b1WJZGKjcUr6YRv2adnFi
  7+59GT9u1+wcH9Mw49tn5SlQoKzC9X2nr7w98rEo2WZry6/Dg089yfRrZv5gJJPfIbnzoZrhX
  e73hofDOyO0italfFE5vD77nOrhU0Kr4bNvNHxdk22j81Kk8eh9y0m+6tZvi4JO+Vu9XTRyWU
  i1vUxX3OyvSNtth/VOpG3b/VBUSWW4oxEQy3mouJEAEfoRxIpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-287.messagelabs.com!1625672686!50756!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16338 invoked from network); 7 Jul 2021 15:44:47 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:44:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fifmw024237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:44:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:44:39 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 -> 2021.1
Date: Wed, 7 Jul 2021 23:44:26 +0800
Message-ID: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-testing_2018.1.bb => gnome-desktop-testing_2021.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_2018.1.bb => gnome-desktop-testing_2021.1.bb} (94%)

diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
similarity index 94%
rename from meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
rename to meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index e5c69c0c46..b82eb8af2e 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http"
-SRCREV = "4decade67b29ad170fcf3de148e41695fc459f48"
+SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
 
 DEPENDS = "glib-2.0"
 
-- 
2.25.1

