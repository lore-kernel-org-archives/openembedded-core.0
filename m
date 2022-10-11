Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C1C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:40:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.4884.1665477599374149011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WJbVGyJm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665477597; i=@fujitsu.com;
	bh=LlMTLW/rB/gIvFBuBMjJbftY32vL3ddRpYSeUaZFICE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WJbVGyJmMQgwvvuDCfm0MUuld6fGuTPqIeVfOHG8cOeRAoh2eZjOdbeeHkFkjnYg4
	 YyYlvWspk80TfBXC4AfU0gNVdWHcMTFZm98t81dDVYkxwBslRaZ/EzN8ZoOZgL9S3K
	 cdkJ7vUnrFBJNLpO+N7/phWlUT+Wdqj8yQ8y3XjmZFi6gjjymPCDpaY6PjQk6nrv84
	 be2o36zP77WnwxKh5nFHN6giQUA2BUR1WRrMwQqsVLbyjsd8N5rjhi2gTTAsh73xvP
	 nhBuazHLZZjXyQKtKoBbbQWjkg1C1a/Xv+6kV+QyJGCe1pA+tqx5ivl6MjOGnISbry
	 9kvLGZ0FzLFgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSfeutmu
  ywdQT8hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aNKSdYCm5zVCxq/cjWwPiMvYuRk0NI4DGj
  RGdLOIR9jUni4CepLkYuIHsPo8TT3ttgRWwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPW
  ImwgJVE69FfzCA2i4CqxM1lEHFeASeJPXPfsILYEgIKElMevmcGGcMp4CxxcH8txFonibWTOl
  ggygUlTs58wgIxXkLi4IsXzBCtihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMVonFWWmZ5TkJmbm6BoaGOgaGprqGpvoGhla6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfm
  Juek6OWllmxiBAZwSrHSrR2MG1b91DvEKMnBpCTK26XumizEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgtdbCygnWJSanlqRlpkDjCaYtAQHj5II71IVoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5LYCxKSQAUpRRmgc3AhbZlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80aATOHJzCu
  B2/QK6AgmoCNOXnUCOaIkESEl1cBkc4wlzp7HNcXqY92sFZt3R7BfvN66hbFsseqMQHHtFxJh
  KjFG4RuyrUWb1xyOZv6e+PLO8m11Bp8yl2+4vfjlweyAWdt8F5i8+cAlJZC17+Ht7b7BTzQa2
  OP67fp5iz5qbrr5ZxsfY1rv+mSh2lYjHofZf3rjhG6wVTmHr8ybYubyNbNIMMCe47PuGstXyv
  +XB3TZZ3+deELqnVPIvHMPX20Qeaa7a3bp9+Xq2hOzv8Yq1+b+1ne1PvjnbPy+J32r41fuZ3q
  WWiDJWqhQyfZgiWO1//mCgIie+Qv2MLLWvKrMZ9q9v7SiMjJuiVb+HMNpU8QvqLafObdFz9uG
  v41vwdy8q6nc35/EP3N6LavEUpyRaKjFXFScCADeRM/NZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1665477597!187265!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13577 invoked from network); 11 Oct 2022 08:39:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:39:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 394681000EE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2C3CC1000CE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:39:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libksba: upgrade 1.6.0 -> 1.6.2
Date: Tue, 11 Oct 2022 16:39:22 +0800
Message-ID: <1665477563-16679-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
References: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171614

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.0.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.0.bb
rename to meta/recipes-support/libksba/libksba_1.6.2.bb
index f9e83681dd..f6ecb9aec4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b"
+SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1


