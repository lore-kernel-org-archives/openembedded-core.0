Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B3EC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:06:39 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.20414.1646057198098099381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RPPFpWbm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057196; i=@fujitsu.com;
	bh=Y2Mm3/jfO1VRW5VNOlyB51G3b+Yo/jR07Z7P8yEcu5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RPPFpWbm5B1BIcy3XNZqENAAD4KQkyiZPJSfyB+6BzoIWAefxMA+oXqh3rgJEbVbX
	 9XSxU9pLPzIvwIhEoejcyTw3X6YsYUsP6iDydAC5SisOKbPLFBWoZAYNiigXzRr8ZI
	 q2lA4mPNCdRBAizga0svGVQDMqVEuCSBHaJBiQpGn8zT6gYn8E9RCruwpwRAopUtov
	 iXS0ycGb5uyKe2S4mdpfPfuifASm8jxVF2WUe9TJPpdTHrOYAi0MOSyexbVpEiKHKG
	 KTZ1wchKhjqYypte3MrRVGjeXStE9gRFr5bsAZD7RnScwIKOUDU8lU8coDmPH7zLyX
	 FXLh5i0aDZEQQ==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 34/AD-13301-CE6DC126; Mon, 28 Feb 2022 14:06:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqHv4mky
  SwbodYhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aOt4dZC+4KVHzd0sfewHifr4uRi0NI4DGj
  RPv7TUxdjJxAznkmiV9nZCASJxglrqw4yQySYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhARuJP5/XMoGUsAioSpxdHgQS5hVwkrg/dysbiC0hoCAx5eF7sImcAs4SZ9f/YoRY6y
  TR+KqTFaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjXVJRZnpGSW5iZo6uoYGBrqGhqa45kDIz00us0k3USy3VTU7NKylKBErrJZYX66UW
  F+sVV+Ym56To5aWWbGIEBnJKsduyHYz7+n7qHWKU5GBSEuXl7JJMEuJLyk+pzEgszogvKs1JL
  T7EKMPBoSTB23lMJklIsCg1PbUiLTMHGFUwaQkOHiUR3qeXgdK8xQWJucWZ6RCpU4yKUuK8ll
  eBEgIgiYzSPLg2WCRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexFkCk9mXgnc9FdAi5m
  AFv8NlgJZXJKIkJJqYHLd9ltN5fR+18VdDjULnReZLe47s1A0YJ7sy/bPVzXeT7OWyfI+mXBo
  45+WRrEHPM9c32Rf1VlpzSydWNNU6LTItWa12e0zf7/xRPSbpNrmX5+b7cFxLiTa45+WSvqcD
  5+//VLNXcdglJPK//nZrFNJOe3hNrveLT/7tuOOYVpvzLMTq1smrswtfL3qsFXAFgGliT/VDd
  lczsQqX9GbP6t8UUbdJ+kJrjE/kuoismaXr636vef+8duH+zbffXsswXxWbm6PbZXr65ippmm
  LK4yLeR3O79XI3FlvVjzT4Y+4ZZD0+WWpjPuT53W1XeyeeMRSqMJRdnPqr79q8nfZVgSJL9om
  YuA0WXZvovjT7UosxRmJhlrMRcWJANuJ/hlfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-545.messagelabs.com!1646057155!11767!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19610 invoked from network); 28 Feb 2022 14:05:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:05:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C6A3B100186
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:05:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B9CC8100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:05:54 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:05:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.46.0 -> 1.47.0
Date: Mon, 28 Feb 2022 22:05:12 +0800
Message-ID: <1646057112-35964-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057112-35964-1-git-send-email-wangmy@fujitsu.com>
References: <1646057112-35964-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162499

Changelog:
=========
lib: Fix decoder table size update (GH-1667)
lib: chore: fix -Wunreachable-code-return (GH-1625)
build: Make Docker speak HTTP/3 (GH-1657)
build: Remove SPDY option for CMake (GH-1665)
build: cmake: Disable libbpf build by default
doc: Fix typos (GH-1668)
doc: Update nghttp2.pyx (GH-1666)
h2load: Handle EAGAIN/EWOULDBLOCK from sendmsg
h2load: allow setting max frame size for h2load (GH-1640)
nghttpx: Add --require-http-scheme option
nghttpx: Add support QUIC BBR2
nghttpx: Bump libbpf to v0.7.0 and turn on all strict features
nghttpx: Change qlog file extension to .sqlog
nghttpx: Fix bug that h3 stream ends prematurely
nghttpx: Fix the issue that forwarded h3 GET request always has chunked TE
nghttpx: Handle EAGAIN/EWOULDBLOCK from sendmsg
nghttpx: Send and receive ECN in QUIC packets
nghttpx: Set IP_PMTUDISC_DO explicitly
nghttpx: Support h3 trailer fields
nghttpx: fix quotes in --altsvc example (GH-1643)
nghttpx: shrpx: make nghttpx -v show ngtcp2 and nghttp3 version as well (GH-1636)
third-party: Bump llhttp to v6.0.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.46.0.bb => nghttp2_1.47.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.46.0.bb => nghttp2_1.47.0.bb} (93%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
similarity index 93%
rename from meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 0ad45ed2c7..58ce08084d 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "1a68cc4a5732afb735baf50aaac3cb3a6771e49f744bd5db6c49ab5042f12a43"
+SRC_URI[sha256sum] = "68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.25.1


