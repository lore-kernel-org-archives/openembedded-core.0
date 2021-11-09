Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AF7C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:03:06 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.13247.1636470186122086167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ivMB9tRb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470183; i=@fujitsu.com;
	bh=RfzmTeu30ejuoR939OjoEPAuOvdcptuyCYZH8zdN1Ks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ivMB9tRbJOmeQ8U85KErL8rhnCMZGYJPaxkwpny2nYpVF/llkFw+cPOXntgubcdCT
	 +O9asEd11XRpamkJgolgNIGe0PjA7eVPtav8nq9Z2hxqtEWvoU9C23TLnsxd5Q9//8
	 8fre0uLcmxY1M9Us0ZR8kgY1YFogVGJr+t73nevcKgG87SIYKGpwTHYGn4ez7lQbaI
	 owIqWK1GcoBC3t0AjF/VsJyl+YCxD7BOrtWgUB/VBAOXhrQB6hvvBfp8WXkvqCsdor
	 d/gEo/4NRokr6fhWRPf7RtA8dapYi7kjTQLxzGmpcjgmKiHuOYzPD97TLe4SNx+Hgi
	 bX4T1ehWFqKdg==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 85/9E-02128-7AD8A816;
 Tue, 09 Nov 2021 15:03:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVXd5b1e
  iwZe/nBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8axlR3sBTc4Kn4c8m9gfMLexcjFISQwnUmi
  s/U1C4RznFFiWsd0ti5GTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhawleiZt
  o0JpIQFKH5mRzRImFfASeJ/60qwEgkBBYkpD98zg9icAs4S5/vegdlCQDWn9t1ihqgXlDg58w
  kLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGNIGRfxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQ
  w0DU0NNI1tDTVNTQ11Eus0k3USy3VLU8tLtEFcsuL9Yorc5NzUvTyUks2MQJDMaXg8PQdjP1v
  PugdYpTkYFIS5f3X1ZUoxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3C0hOsCg1PbUiLTMHGBcwa
  QkOHiURXrEOoDRvcUFibnFmOkTqFKOilDhvfz1QQgAkkVGaB9cGi8VLjLJSwryMDAwMQjwFqU
  W5mSWo8q8YxTkYlYR5N/QATeHJzCuBm/4KaDET0OKDX9pBFpckIqSkGpgYn8/Re2d6X8d5153
  Vd+t44+d7BtofnNc/1fz+bZmEY3/5S3cwLy+otK0Wet66LCR3yW6xYu4g6W2PwuRY8ideK1bo
  vHczjd3DWG/5k+W1+nVPE0PP/e0t55rUd4aXO3GR9dTcFt7nUoWTHr6cFHhGTGtx4PSJxvWNy
  UkXhb/+63+7OPt6yzd26y33VpbM22puv2HHTo7zv9IdjQoWl98KUM2Z/8XFWTw/K9+J/9neGN
  kJzLP2nVJfXHHrt4/U1iM7rXYceFBqvkOiefEvQbZbOe3/7bYs2bFR8MrfOcu/3u1MqVlgf12
  3aOf0Y81H8xPqH4n8WLsiiv/GxptVlvwe6QdW+4hPXtDw9tDjZTuPKrEUZyQaajEXFScCAI4D
  JPFAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-271.messagelabs.com!1636470182!112851!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1002 invoked from network); 9 Nov 2021 15:03:03 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:03:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9F2uOB010951
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:03:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:02:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.14.0 -> 5.15.0
Date: Tue, 9 Nov 2021 23:02:42 +0800
Message-ID: <1636470164-60899-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
References: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:03:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158049

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_5.14.0.bb => iproute2_5.15.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.14.0.bb => iproute2_5.15.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
index 27fb5c8866..99a743391a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
+SRC_URI[sha256sum] = "38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1


