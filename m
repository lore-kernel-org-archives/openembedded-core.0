Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C891C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:06:19 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.52779.1638803178140333323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dDtpw0I1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638803176; i=@fujitsu.com;
	bh=nyt9VWthrGXPJdCgymjk1ksYq0W5HgaEVpLjl6PCcew=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dDtpw0I1ukNAHtdA5O/DfvUoIL2hvyR4KvmrbYvhTmpTcR21g5Q/l6wawhCJK3ti1
	 dALIfO7+fDLHYQCNrZiFiCTrk85wtPw6zuLRPrS8mFeVNqnbkxwv/r731De7SMNJDH
	 EB3hv0spR4SooicedbKFeA3TewBIZCXntF6rOiQAGtl2t0x/sL0wf7ltsk/fZ3xyU+
	 g+5AlFkVMODDHRwRvovokjEhnDbu3vGTmK1PXO/Vd8tJB6AH7TCo9BbZCmZGPY8JZN
	 ua1L7I1LIIdfao6d9FMkKlrOiWPq+vKOqMIM/9njD5DzaTLH2lecj9+urlTYeQQtZr
	 +lRqHuiNPkNSw==
Received: from [100.113.1.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 7C/9E-29929-8E62EA16;
 Mon, 06 Dec 2021 15:06:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSfe52rp
  Eg5c3lS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozHyxawFRznq3j2cTNTA+Ns3i5GLg4hgceM
  EivPv2SEcM4zSey4tAHK2c0ocfl6P0sXIycHm4CuxLnHa9m7GDk4RAT0JK7+EwUJCwuYS3xYe
  JQRxGYRUJG43L2BHcTmFXCXmPJgJiuILSGgIDHl4XtmiLigxMmZT8BGMgtISBx88YIZZKSEgK
  LE7OnyEOUVEq8PX2KGsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYrRIKspMzyjJTczM0TU0MNA1NDT
  WNdQ1NdRLrNJN1Est1U1OzSspSgRK6iWWF+sVV+Ym56To5aWWbGIEhl1KIaPxDsaDrz/oHWKU
  5GBSEuX1EFuXKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd78KUE6wKDU9tSItMwcYAzBpCQ4eJ
  RHeDUpAad7igsTc4sx0iNQpRkUpcd6jqkAJAZBERmkeXBss7i4xykoJ8zIyMDAI8RSkFuVmlq
  DKv2IU52BUEua9BTKFJzOvBG76K6DFTECLY/pXgywuSURISTUwBbbsmBpup1HqtE3taPJ7gfq
  7S480pdQxid7tajp0XmqKk8uC5b/fMZlsZu7rk1mY+OTeW8s3fw1+xGa+lzCpPlr25rfrpITt
  acwBrHGmBd3/TC81nlofujKdTVlfMmy6+B6jp9tX/Zyl195jyuYl3/HiUaKweVfFvdsMCnwSs
  fuvTbHOLJVnX7Hp/auE2KLjwhcvyhn/4ap+wRaxUNj4wB6upClHbmle5GU1s5wwve1w4X/vZW
  +qb/FZn7qr/oNtZwdz73UL/fotXQ9uf7mpstqo+OzLhFVlmc059j+8NrZv1knb4DX3qXve1T+
  Z2rvub5YsTk45m6/+YWbjKx2/bS0Vmx49CqlkYstKzjykxFKckWioxVxUnAgAUbv1YTYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-228.messagelabs.com!1638803175!233637!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1993 invoked from network); 6 Dec 2021 15:06:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:06:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2193F100458
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:06:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1473D10032A
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:06:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:05:54 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] opkg: upgrade 0.4.5 -> 0.5.0
Date: Tue, 7 Dec 2021 08:05:41 +0800
Message-ID: <1638835541-3789-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:06:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159234

Remove unsupported openssl and option --disable-pathfinder

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/opkg/{opkg_0.4.5.bb => opkg_0.5.0.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.4.5.bb => opkg_0.5.0.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.4.5.bb
rename to meta/recipes-devtools/opkg/opkg_0.5.0.bb
index 1fe6ed5ecb..bc2ee9728b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
@@ -18,8 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "5dc41ad37d88803b5e0f456a9c5a0811"
-SRC_URI[sha256sum] = "a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e"
+SRC_URI[sha256sum] = "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
@@ -39,11 +38,9 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
     "
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
-EXTRA_OECONF += " --disable-pathfinder"
 EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 do_install:append () {
-- 
2.25.1


