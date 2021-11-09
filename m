Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2201C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:03:07 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.13155.1636470186458604160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D5jRgpgh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470183; i=@fujitsu.com;
	bh=lVwnBJL4+X8i6x9ocfiAEdopcFTIn1ktu7k26IpVwSQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D5jRgpgh8bAEJpFuYGS/XunIPQJttrqfbx6fUnG4J734FJZH/wP1T+f14IBgrOh98
	 v4zG9X/yHm9lnF5rbeScc5/zsyNQ9ZzPKz18D+9fi2B+VHFjMqST+JORaKLy8KVSoW
	 dVuOKdJgVizcoKXf+45zaiPdO4ZGcbDgt/9IZ1NYEsuCpL8wPkppdO24XCfuY+MCbi
	 eNGQC5bMXXcobEl1EjFk9N/mDa5pXM5ffEKhbBkGapmI84jnOh75eLTTotpSQ5lFgY
	 N7ZPuL181/GwFqDFl1yxLLMdovP0Vg4yF3+fVmhcByEsfWX8dd5aTsFTlCrCKPSeyT
	 Qhi8iD9FM/6BA==
Received: from [100.113.4.50] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 3E/4E-14220-7AD8A816;
 Tue, 09 Nov 2021 15:03:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVXd5b1e
  iwaLV3BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bxfcfYCxq4Kma0TmZvYJzE2cXIxSEkMJ1J
  omXbb0YI5zijxIFrt9i7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wEmEBa4k9N
  /Yxg9gsQPELLadZQWxeASeJvq67jCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5
  tZIOwKiVmz2pgmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuma6hhZmeolVukl
  6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMAASylk27WD8fPrD3qHGCU5mJREef91dSUK
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDdApITLEpNT61Iy8wBBjtMWoKDR0mEV6wDKM1bXJCYW
  5yZDpE6xagoJc7bXw+UEABJZJTmwbXBIuwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeDT
  1AU3gy80rgpr8CWswEtPjgl3aQxSWJCCmpBqZyb4OOWXP7t2m1bZ+SybvWM2x/TNibE1ebbh1
  MWqRz/2zkimtHyh+zhdeV75+q8tDQ/M6fxqUP9iydIcn658RzJYNlPFcSXVs6NrXv9fKrCN63
  YvH/mQUds2+rbsjn3XchaI2ggW6iv23zg6X/mpdtF97Mrhv3MqLAm990wwP32XuPJRZaH0+V8
  Y6OOtD/wpbdPu6xza7wCzt9oxklZeVbYjZoy7juFp354hLDxjcrPe4UfU4Oei59LKrsjW/y/k
  1cm+6sKLqTf1furAKnTm9FzCqm9vNrL8zIspvwqygnmDH6gFpqn/i983+vb+LaOsvkx9kfwdY
  BB++2KnZtil+wp/H2n35nrd4Fyvem/Q9RYinOSDTUYi4qTgQAdKPMVSsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-238.messagelabs.com!1636470182!538047!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9115 invoked from network); 9 Nov 2021 15:03:03 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:03:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9F2uOA010951
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:03:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:02:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 3.0.0 -> 3.1.1
Date: Tue, 9 Nov 2021 23:02:41 +0800
Message-ID: <1636470164-60899-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:03:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158051

Work around GCC cast-align error/warning on some platforms. (Behdad Esfahbod)
Documentation improvements. (Matthias Clasen)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_3.0.0.bb => harfbuzz_3.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.0.0.bb => harfbuzz_3.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb
index fef9453187..1fc83a3bc2 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9"
+SRC_URI[sha256sum] = "f3f3247bdeabf36765acc237a5f651e651e4e9706582b9cc2cf6c9b8102dfa93"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


