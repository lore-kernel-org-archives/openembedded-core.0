Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA89DC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:38:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.48255.1681713483774969156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fl805+Vf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681713482; i=@fujitsu.com;
	bh=RlXcjtUoiNvLiw3WfXLiIdlPFO6l9dGm9YNTJvg3SK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fl805+Vfwvnwxt8phHAJoe2rfvnBN+GTYkJatoabFjOPo3wxU6Y2EAtLrcpScpOlC
	 owGorVvJS5XgeM5FKWgAAjVspn76qTH3j/SGYiwEIrcREyAImUewg/wanF8t7z/Lf8
	 CI8GMJQQ8f492UNDCTwRfm80vA9huCqulPEONolGaZnvk6ZT/xnzCDUZzcGziqlhzu
	 hADKWzEuGLWdhlUETkAy/bNNO1bNf8RmUdn/93PdnCqNYqm0K9d/m2IH4t2CxCDD6n
	 eZDcW/fGIJnBjmPDE307UKL2hJbmse609Aes41/y1JtvBr/uJ/GisnytaIBzRoKyYK
	 R9UORAPUzio8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqOv50ib
  F4PI2BYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPm5YWMBV0cFSvmnGNrYFzJ3sXIxSEk8JhR
  Yu/WZhYI5zqTxKRD+1m7GDmBnL2MEnOnMILYbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87SFhYwEHiyFUBkDCLgKrE219LwDp5BZwkdj69CWZLCChITHn4nhnE5hRwllixZzELxCYniW
  NtD9kg6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFukamuslFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSrHykR2MO/r+6h1ilORgUhLlfZFqnSLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  jfguU2KkGBRanpqRVpmDjCKYNISHDxKIrzGz4DSvMUFibnFmekQqVOMilLivEIgCQGQREZpHl
  wbLHIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmzX0MNIUnM68EbvoroMVMQIvllMAWlyQ
  ipKQamGIY0gszF20sLI54lVJqxe9y/O9p6cuVzqu2TL8sIl6d2NtUlRbD+OX5qalrJ1/O+2te
  Zb7WOvkwQ2Drrv0lV60mJhZ2PeFj/Lz23eeJaUUX11X26uY5vMi965P8K/+H/GHVH7OvJc0Tf
  8LsEG0euNKyd1dMH/vKRIt4ky/uSiu3drEzX1Cyf8ZWUC35SM7p56zYteV7D6tw2pSwFWw5vP
  t2pIzMrk+tC+cvyOVZJCDRaOIYEjg5ys6AWVBXLPZBrYq4mGOMdtO6J1+O5PJqnnohsDiRY/+
  8Q7Pibadvr3ReeuyzbuOUE1fdL4XYVZRXX/Z6djpfiM/7zzPtU4FPOT2tOUIWBP1PUBAMmcqn
  xFKckWioxVxUnAgAKbIlV1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1681713481!428780!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25860 invoked from network); 17 Apr 2023 06:38:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:38:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3C8BE1001A9
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:01 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2FECE100194
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:37:59 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mctp: upgrade 1.0 -> 1.1
Date: Mon, 17 Apr 2023 14:37:37 +0800
Message-ID: <1681713459-18443-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
References: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180123

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/mctp/{mctp_git.bb => mctp_1.1.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_git.bb => mctp_1.1.bb} (94%)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_1.1.bb
similarity index 94%
rename from meta-networking/recipes-support/mctp/mctp_git.bb
rename to meta-networking/recipes-support/mctp/mctp_1.1.bb
index edc614d34..bf3961be4 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_1.1.bb
@@ -5,9 +5,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "ae3a9162d6c5df0fa50abc34fc951dfd0e3d23c5"
+SRCREV = "a591ad885aa28f113cb45870b2fd5bce48378d6f"
 
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
 
-- 
2.34.1


