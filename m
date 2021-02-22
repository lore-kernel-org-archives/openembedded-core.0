Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.31730.1613974143025142024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.6.236] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 87/3F-08502-C7A43306; Mon, 22 Feb 2021 06:09:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqlvjZZx
  gsG6PlMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH8xy+2goWcFXPfn2JtYNzP0cXIxSEksJlJ
  Yt3+86wQzglGiWMdO1i6GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQtYibCAjcSSU
  z1MIDaLgKrElF1NjCA2r4CrxPxbH8FqJAQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  wMVV8lsaZjGtsERt5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11TX0NRYL7FKN0k
  vtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERhgKYWsM3cwfnr9Qe8QoyQHk5Io7+XXRglC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHhlPY0ThASLUtNTK9Iyc4DBDpOW4OBREuHN9ABK8xYXJ
  OYWZ6ZDpE4xKkqJ8zqC9AmAJDJK8+DaYBF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwbz
  3IFJ7MvBK46a+AFjMBLVbKMAJZXJKIkJJqYOJ4ksiySU3rkMT9lEgbZr4npQK9+4P5DiyyPfu
  jynNPT1Ue9z6Wo4e3ujozXmm5t075gVlWldStG4UOOgdmnGpbvapl3W8LYU/LvA6HGD+ZWZEv
  t9TOu3vPxfmxyxSlvymVX7Q2yN99EtWtvc+OM1eLnWMrv65WY7/exUlyi9cnFN+cyuztcT5zp
  3liRGTR6/a5Jws+fp+QW6gyX2RZYfPe89fjPQ4n3UzjtHc4yWLLarhfUF1aVj5bJWp7UN+xqp
  RrRw8kcu3+HcL4TuXDoWPh8/NN3aLS1JZfmv7S+9pj8af/bimVatyfu4gtWzjb5drDG8mfzj6
  q4gx6VM3xjK8rpjrfa364otLpbQ/9lFiKMxINtZiLihMBbiN8GysDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-245.messagelabs.com!1613974139!188770!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26290 invoked from network); 22 Feb 2021 06:09:00 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Feb 2021 06:09:00 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11M68rEs021700
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 06:08:59 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 06:08:52 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.12.1 -> 0.12.2
Date: Mon, 22 Feb 2021 14:08:42 +0800
Message-ID: <1613974122-13457-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../liburcu/{liburcu_0.12.1.bb => liburcu_0.12.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.12.1.bb => liburcu_0.12.2.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.12.1.bb b/meta/recipes-support/liburcu/liburcu_0.12.2.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.12.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.12.2.bb
index 3a5ecbcc2d..44544b109c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.12.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.12.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "5e419d7b30d0d98bffe0014c704ae936"
-SRC_URI[sha256sum] = "bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e"
+SRC_URI[md5sum] = "d94347df78e3f1aa744745eb85787df5"
+SRC_URI[sha256sum] = "4eefc11e4f6c212fc7d84d871e1cc139da0669a46ff3fda557a6fdd4d74ca67b"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.25.1

