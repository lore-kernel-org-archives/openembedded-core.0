Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5385C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:09:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7718.1661832584239182712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uDbtk76e;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832582; i=@fujitsu.com;
	bh=yJsv7aMGCC0b8jIlUq0atirKNme0nXPnIbhWu7tqX3I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uDbtk76ewhEfQvihlHhKvt5/LZcLxTsOFugDskZq8XMwfnsnJ4tkVTgNLnKwcK7k3
	 TRgTlypofsJzlKeLfGIFnW2USKp3H6VfVU2rzqRbs2lzl7WtrlSGU23s1UDDkYrp8r
	 aZHHY7O6deTLG6mxGAQlSd5rSLc0qqRQMUBpjGai5ptWUfrM/uNT2ld5VRcG7PFW3l
	 LCIAU1z6lsNM1iYT1W/RCdNtgHsIoXU3SJxg4f6dVzZsE7I28QIoRQUdLLOU5qlflh
	 VeCjy/Ax8ml1+MQH5YxIXG8vvODNjT1kB8sVD63AZ7JlNxCdx7B/mJ+gjKqhzlhc4Y
	 Ax1PEo+DcFF0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSbe1lzf
  ZYOU/aYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPf6nvsBUu4Kq6+2sHawNjB2cXIxSEk8JhR
  YvfjLhYI5zqTRN+lr4wQzl5GiRlfrrN2MXJysAmoSUy/dQPI5uAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgIzFtwiFGkBIWAVWJ1VuYQUxeASeJZzdSQCokBBQkpjx8zwxicwo4S6y++ooJxBYCKt
  n0YgULiM0rIChxcuYTFojpEhIHX7xghuhVlJh9uZkFwq6U2DOrnwnCVpO4em4T8wRGwVlI2mc
  haV/AyLSK0SapKDM9oyQ3MTNH19DAQNfQ0FTX0hJIWeolVukm6qWW6ublF5Vk6BrqJZYX66UW
  F+sVV+Ym56To5aWWbGIEBnFKcXL5Dsbt+37pHWKU5GBSEuVd2MqbLMSXlJ9SmZFYnBFfVJqTW
  nyIUYaDQ0mC93I3UE6wKDU9tSItMwcYUTBpCQ4eJRFe7y6gNG9xQWJucWY6ROoUo6KUOO+EHq
  CEAEgiozQPrg0WxZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNuAJnCk5lXAjf9FdBiJqD
  FD5dwgywuSURISTUwMepvfW9Sdsm5YJZ7TprfA5dSfc7dzq5Fvye94Lze96H83/bW/ElHfeML
  C2TtxCuSN1tlPPAovbLLNIKp2/eMzarj0ct1BTUqotyk6iZq5r7V6zBYwS2tJ+fyV6WoyyW+9
  sbHhHVKxzhst2wrU5/rcvvfjCSNtypXvY/fsY1hU3WUS/uwLi/yWb+TJf/j/4zCP/hUfmu/Nj
  ssL9V2hfOsteKS5RnXbYzyVryZobgi8MLzWZV/nv3aWcovMb3ofOipgH3S4be27/j+7ckO+4a
  ll633ye182VnaFyyicfH5/AdHNv862fx7V/G7yImTS68bLDj3l79Q69etw06XllfHrnzQJ6LE
  7X8+jyvy9czJSizFGYmGWsxFxYkAn7EIZF0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1661832581!208508!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4983 invoked from network); 30 Aug 2022 04:09:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:09:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C8F321000CC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:40 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCDF1100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:09:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librsvg: upgrade 2.54.4 -> 2.54.5
Date: Tue, 30 Aug 2022 12:09:18 +0800
Message-ID: <1661832561-12506-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
References: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:09:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170048

Changelog:
- #880 - Accept patterns with userSpaceOnUse units for the stroke of
  axis-aligned lines.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librsvg/{librsvg_2.54.4.bb => librsvg_2.54.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.4.bb => librsvg_2.54.5.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index 82b1bf9bce..fc52ae61c5 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "ea152a243f6a43c0e036a28c70de3fcbcdea5664c6811c78592bc229ecc24833"
+SRC_URI[archive.sha256sum] = "4f03190f45324d1fa1f52a79dfcded1f64eaf49b3ae2f88eedab0c07617cae6e"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.25.1


