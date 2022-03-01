Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DA0C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:53:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7132.1646135596263365708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j8AZ/5Qp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135594; i=@fujitsu.com;
	bh=YRF7eFc6d892OqBiBAFvRyRuDiin1wbWPwK2D5G26Rw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j8AZ/5QpE4YBFlzi2Y3jccJagzblH1nKVhmdqd+CMY6DypD1pwnlKj2vJmpacRDi9
	 GYTa+M5qeL8+D3YXIRcOv7PS3Lt6r6Gzy70OQki0RNnkurZb8q7grv6BZxk6kMJrAv
	 u8B3290818wTQO6ytXQiHIPnMol9auA2Byf2sV3mKwHCBSrO2HFlUL6TqucXsvoYTb
	 CGldB5mim/8RnkS/BeeNsrUlSs2ZW54tW8OvIjvbzNuAmfVTiuv0fPwSmx6IhI+tuv
	 cv6lHCIu+ZCCaRj6BZVfabdlYEwNihowpE4ksyfwAY7AMSXHwWeUldeL+9hA/f46QY
	 W7JDMOzmgBeaQ==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 2B/99-12292-A290E126;
 Tue, 01 Mar 2022 11:53:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqKvJKZd
  kcHeRpcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFl6hW2ghbOineT37M2MDZxdDFycQgJPGaU
  eLJ0LTuEc55J4v7T60xdjJxAznFGiTtXdEFsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWMJV4te4gC4jNAhRfu/MPmM0r4CTx8ssvMFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzVD1FRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhj
  oGhqa6hroGhma6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZkSjHD9R2M
  E/t+6h1ilORgUhLlVbspmyTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnc7u1ySkGBRanpqRVpmD
  jA+YNISHDxKIrxxLEBp3uKCxNzizHSI1ClGXY7z6y7tZRZiycvPS5US5/XgACoSACnKKM2DGw
  GL1UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm3gEzhycwrgdv0CugIJqAj/gZLgRxRkoi
  QkmpgEhVbqH0zKfJmh8Ph6et99140jzi0dhrTLIO1HzYd8TlxtWOt6IOJV4W4uPwNxdUevSks
  uKtx6OfNgOWPVdjbq0ytj5zkmJ4jOktDyOHXrGm/szqYhVP+L7P5uElJqzP10HsTA5ZHE7q7E
  tdXT1hxRTiymM+N+TOnwJ1JqXdVe6ZpVk9c1T6dbfcNax2PN1cv3/YyajoXnr7yhKtB8C0nxi
  0/jvIL//n4zjByY/431fstifc7FmzSeXbC4dMO3cjnu+WsJ7/ZJ6Oc+8Lm1ssJ97tFRFM33//
  daN9qqqJqxB0+8Znqnr6bJ78f73jLvldpmntH2cv/S4uDW6KLtZcYrUo6z/2LP3f/0SW+yfHn
  ViixFGckGmoxFxUnAgBvQLT2UAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1646135593!18671!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21807 invoked from network); 1 Mar 2022 11:53:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:53:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 594011001A2
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4D043100189
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 11:53:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:52:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] at: upgrade 3.2.4 -> 3.2.5
Date: Tue, 1 Mar 2022 19:52:49 +0800
Message-ID: <1646135571-38971-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162543

Changelog:
=========
Fix: atd forgets to run a job in the queue
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1004972

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/at/{at_3.2.4.bb => at_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/at/{at_3.2.4.bb => at_3.2.5.bb} (96%)

diff --git a/meta/recipes-extended/at/at_3.2.4.bb b/meta/recipes-extended/at/at_3.2.5.bb
similarity index 96%
rename from meta/recipes-extended/at/at_3.2.4.bb
rename to meta/recipes-extended/at/at_3.2.5.bb
index 6ee9c5e011..6769eb364b 100644
--- a/meta/recipes-extended/at/at_3.2.4.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -36,7 +36,7 @@ SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[sha256sum] = "76990cbb6f4b9bfedb926637904fdcc0d4fa20b6596b9c932117a49a0624c684"
+SRC_URI[sha256sum] = "bb066b389d7c9bb9d84a35738032b85c30cba7d949f758192adc72c9477fd3b8"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
-- 
2.25.1


