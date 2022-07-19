Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D496C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 00:04:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.34887.1658189042918749299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 17:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xrfk7U8P;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658189041; i=@fujitsu.com;
	bh=3O43W78HXnYj1VAY9vYwBcQORrjlzT0RWZGphX0GCEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xrfk7U8P8dwoVtBE3jdSXdzsRdUmJMNVBE2h7FNWkR6nZbb3Y6SsOSbZlL14g1zJb
	 b7sunLWfADsJesmG5m6CZc7zdqQZLnaN5jkFpqo01/NDS9fk3V4U3rXmuOaW/wqxoR
	 dVMOhDvfF/1sTnOfL5EFgpZOyvEZf42bMOZ8WiRnON01+1zVhMOSnXBFmhH6DyMq0u
	 wYtNcjU1oxrAn3o9BauA+SpyMtyS+ZFXxTOkUkRN2Bh02yZdkH1Me+QgUEo/nFEUhz
	 uLR5MBmqXulBDWZbbrjOlJUYN54NL9baadmMi7qj3AY+YlRBsDTRVZG21I+bLrLq42
	 UQzUjaBJwQroQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSffDl6t
  JBkcvqFnc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBkXZ59gK5gsWDGrbT5jA2MHfxcjF4eQwGNG
  ibXPVzNCONeYJA5f+8YK4exhlNiz7RtzFyMnB5uAmsT0WzeAEhwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUF3CSOHl4HVs4ioCrxc/FOFhCbV8BB4uvR7WC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5uh6iskZszYxgZhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKprbKRraGGpl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJYpxQp7
  dzBeXvlT7xCjJAeTkijv6qdXk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8NZ8BsoJFqWmp1akZ
  eYAYwQmLcHBoyTCKwOS5i0uSMwtzkyHSJ1iVJQS570PkhAASWSU5sG1weLyEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3tBPQFN4MvNK4Ka/AlrMBLR4ktMVkMUliQgpqQYm26g98YYdXQe
  usdd8MPefte1/8u77U412dbRHr/25dUFK313Z2f93be48cYf9nWDnB+7PS14ckhOKer5MybtV
  77zGq9hNNTyb94fvva98VWlr/j/vQwcX3Ij8Wewmsrpn4lazC3PaNLk5m5k3NU361dr/2frgz
  wyfOMn3JtsOce336Mtffz5hgrXsQ1ufnKTHh3986pzRvbg2juv4JJkt05PtN525c3aNslDTST
  O7jCIxG7NZy0RWME5k5H24OmzXuhiWoxdcxBV0clLPLjm7Z1+XpGn3lIXmAWxP09ezLFpWI9q
  4UbT/5I5nNasjPxo6BiyZsaf8m0XrhuCNC/4Es56XOmaQkK/WZH5l5/eEViWW4oxEQy3mouJE
  AHJhGJFGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1658189040!215329!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24050 invoked from network); 19 Jul 2022 00:04:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 00:04:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 563FA1000C1
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 01:04:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 498A7100077
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 01:04:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 01:03:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-docutils: upgrade 0.18.1 -> 0.19
Date: Tue, 19 Jul 2022 08:03:46 +0800
Message-ID: <1658189026-652-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 00:04:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168264

License-Update:
 year updated to 2022
 url of some reposity and license changed
 file lists changed

Changelog:
===========
- Drop support for Python 2.7, 3.5, and 3.6.

- Output changes:
  HTML5:
     Wrap groups of footnotes in an <aside> for easier styling.
     The CSS rule .footnote-list { display: contents; } can be used to restore
     the behaviour of custom CSS styles.
- After package installation, the CLI commands python -m docutils and docutils
  start the generic command line front end tool.
- Support parsing "Markdown" input with 3rd party parsers myst, pycmark, or recommonmark.
- The default values for the "pep-references", "rfc-base-url", and "python-home"
  configuration settings now use the "https:" scheme. The PEP-writer template's
  header is updated to fix links and resemble the header of official PEPs.
- Various bugfixes and improvements (see HISTORY).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.19.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-docutils_0.18.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.19.bb
index e4ddd01978..7ae93ab557 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.19.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=41001b296a89bb2780bbe306e947ecee"
 
-SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
+SRC_URI[sha256sum] = "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


