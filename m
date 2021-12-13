Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609FEC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:30:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.10914.1639402233378958916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eVGiMJ1D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639402231; i=@fujitsu.com;
	bh=yREe3AXuxPofhOcQ+OTKTaxVQZm4s5W95M/e0NXa3Iw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eVGiMJ1DX0ffRChGFwyLenWoIgsHhaTg55SgAcJC1mapUNPyU9XcnGIB4khzaOC7W
	 MTE9xe+VzSdsjMI9/pUfQi/ePszwum83EogvK8k9blknc+5h6PC6y2T58Y1G/3Uixp
	 dZjWcgBn4dhaovF6bpB6x6Viv0BHMrkiZjlNmw2znwYlbtHBEj1tC0DYs0lWQOHqV8
	 XSMETTMYEEsdcGXNYt9RPawJKAuJ6spxgBSCG3A4e+AbvoP37CyNkl3gK4hkRsYXV+
	 PnH4xDKi+Abmk/5ZizGbynd/drzfZT23tAPybdZkqmFRVUgDClbAyiirh1S8m3FbxA
	 dS8mHl1isa5Kw==
Received: from [100.115.34.181] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 49/A2-23453-7FA47B16;
 Mon, 13 Dec 2021 13:30:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqPvda3u
  iwaq9whZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPFbdYCzYIV5w49J+lgfGBQBcjF4eQwGNG
  iecv/7JBOOeZJFZ1LWWFcPYwShzc9YWli5GTg01AV+Lc47XsXYwcHCICehJX/4mChIUFrCX+7
  N/KDGKzCKhK7Lp9mxXE5hVwl1g2bRZYXEJAQWLKw/fMEHFBiZMzn4CNZBaQkDj44gUzyEgJAU
  WJ2dPlIcorJF4fvgTVqiZx9dwm5gmMfLOQdM9C0r2AkWkVo3VSUWZ6RkluYmaOrqGBga6hoam
  usbGuobmlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYPClFCtu3sE4ceVP
  vUOMkhxMSqK8wazbE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8P42B8oJFqWmp1akZeYAIwEmL
  cHBoyTC6+4JlOYtLkjMLc5Mh0idYtTl2Hl68SJmIZa8/LxUKXHeFyBFAiBFGaV5cCNgUXmJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvsiPQFJ7MvBK4Ta+AjmACOoKxcjPIESWJCCmpBib
  G8mPepX3sKvcemkh2MX2WDd8eOVP05JrQnfP3/WLSKz/lasW5l7s9WbKl04a/bMVTLbNQHQEu
  nXkW189rCl3Icb4e+TTN3ll7z1Sfgsx7MtPTLU+/OXxzTeGS/VOlE/xzFrpefeDZOVXpycVPm
  /avXsseVqT/ICbL+HddzQePfSqGfS1MLi8kei7mXF9xIfsoy9MdK8v7lv/a+UnmpsqWvfIOxr
  6PNmbc4lsRwWynmf9QeM2KBU7VxxImTV1bffBeRGFcqE7VW+5t7azPd7FX8Ox5ytbMHpDvXVn
  VqTf3zJf7k/52LBAs2SyfcWi5wSSB/Osv229ec53XW7Hw0EbnCa0sgjzTaqQ37JzEc0eJpTgj
  0VCLuag4EQB6hJnPRQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1639402231!16418!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3487 invoked from network); 13 Dec 2021 13:30:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:30:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E14B91009F1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D444310023E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:30:19 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] [OE-core] [PATCH] less: upgrade 590 -> 598
Date: Tue, 14 Dec 2021 06:30:14 +0800
Message-ID: <1639434614-2679-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:30:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159632

Changelog between version 590 and version 598:
=============================================
Add the --header option.
Add the --no-number-headers option.
Add the --status-line option.
Add the --redraw-on-quit option.
Add the --search-options option.
Add 'H' color type to set color of header lines.
Add #version conditional to lesskey.
Add += syntax to variable section in lesskey files.
Allow option name in -- command to end with '=' in addition to '\n'.
Add $HOME/.config to possible locations of lesskey file.
Add $XDG_STATE_HOME and $HOME/.local/state to possible locations of history file.
Don't read or write history file in secure mode.
Fix display of multibyte and double-width chars in prompt.
Fix ESC-BACKSPACE command when BACKSPACE key does not send 0x08.
Add more \k codes to lesskey format.
Fix bug when empty file is modified while viewing it.
Fix bug when parsing a malformed lesskey file.
Fix bug scrolling history when --incsearch is set.
Fix buffer overflow when invoking lessecho with more than 63 -m/-n options.
Fix display bugs with --header.
Fix bug restoring color at end of highlighted text.
Fix bug in parsing lesskey file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-extended/less/{less_590.bb => less_598.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_590.bb => less_598.bb} (87%)

diff --git a/meta/recipes-extended/less/less_590.bb b/meta/recipes-extended/less/less_598.bb
similarity index 87%
rename from meta/recipes-extended/less/less_590.bb
rename to meta/recipes-extended/less/less_598.bb
index 5d0d0a5afe..574efff365 100644
--- a/meta/recipes-extended/less/less_590.bb
+++ b/meta/recipes-extended/less/less_598.bb
@@ -20,7 +20,7 @@ SECTION = "console/utils"
 #
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
                     "
 DEPENDS = "ncurses"
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
+SRC_URI[sha256sum] = "64e0eb24534ac70d15ff3a36c8853f7a48196aa230d2a104707fc4ff1a45e982"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1


