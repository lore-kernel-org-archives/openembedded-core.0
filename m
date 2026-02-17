Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2CFE6815C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:59:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8943.1771322363170288517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K4/tiiqx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D6E54E40A1B
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:59:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EE87606D1
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47E7510368067;
	Tue, 17 Feb 2026 10:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771322360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oXVEyh3uz15dwc33V3tmAaTk3qCaPfd7IS2wNZAnzUY=;
	b=K4/tiiqxd7mlOzOBetWdWtxB8CKjsuNAP7fDVb9oLxk5m38qNlxc7eBFXwXNhHOA/WWqiY
	bm3H0lBstKc3sGmtTNuv6OiGeaiTjfjgYn7bv+rgwRutvQGlkfHZWIGXWAobks8pV6jfX6
	9DkyDSzPwbIk8xvAcODpYp1IaZGVIeq8fXg9Y2zWtbx8W97Lzu0C7Cm6/W7qCXQX7ZqnmU
	sI9p4vPTwDhnr+/R7ZPiFuqUzJzv23Z6N3FWl4A8xAntwy26ZjNodh18mUPA/FZ4QW9vLL
	GcXr1wxisZHCv7DCclcqKSaVGbwX6OYjdhcPVYhqH8RRg8XX9qhayKkN0UnnkQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Feb 2026 10:59:16 +0100
Subject: [PATCH] python3-sphinx: backport patch to fix singlehtml URIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-fix-sphinx-singlehtml-uris-v1-1-763a999c54db@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqEMAyF4VeRrCfQFi/gq8gsvEQb0SqNDgPiu
 xt1dfjg8B8gFJkEyuSASD8WXoLCfhJofR0GQu7U4IzLjbMF9vxHWT0HHQ7DRH6bJ9wjC6Zpbkz
 TZb3NatDAGknfT7z6vpa9Gand7iKc5wWQA+wmfgAAAA==
X-Change-ID: 20260217-fix-sphinx-singlehtml-uris-44600bd5f15a
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4992;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lL3PgZ/984vQ85SAWpqawZ4F5cmHFVwn9iheoWVKVI4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBplDv3i/rt0l8vsUXWf2wcXkbyjWeeGrBrUQ3DJ
 vIjqez2iZ+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZQ79wAKCRDRgEFAKaOo
 NrE7D/9kp7+Ri6eHwhA67guMk+Ra93tBSfp7pvGgML9xNQW7ge7hPWdkktEVf7FAkrWuQoIrp78
 jDYYbOEH0JHUroXaHXg6bemc3pGGjQ5rYhOd9hUCRQ+cHUnFKGKGWbdgEE9rzcZGpVvRW9SyKjK
 JA8BOsNbKGxORpEDiTFasIj6nASBSdk4pMlwbTyqVYn+kCrovQv8PbmabRlhDxAW7h6mIgIcn9B
 X8QyyTNJFPvHlzv5O5361YmGQrLsd/mezsuFdYYgq0PSXovadTtbImI2UOQX7lBbPW9GEY7zhGk
 HNuDDD29uCX6EPPyn509kC/aIv8kUBQSdhZrsmXV5ad4wY9VlpBOEtAzNzYYrkF3mBKzMvVvhWC
 9JmqAKw3wobAFFfxJfvxbRjMbXoJRDeC4tGVMqBgUkkKDJ6WsM+BZYeJhKwcN6zpnZpiN5QvVVW
 smSP+lQGTckNV2oFcR6UghkYeThe+DmGNu6h3fg/JMFmJMXzU8pwJqxDb+L7n3MZLwLR05Z9nat
 ALXB0Ma+kIBu3UkKeaUrb1ChuHgWdUPjSeDG7dQcfDh03Y31KiX3XHYqxLa2J3SAG5qPPBthcyC
 KxGQRwqKe3DnJhzCUwcfTU492SyUACMbOvJPhmY1KC4r0b0rGyazPGDPYo9FHMpvXvquVyjoVg6
 BhcNVuEAK7ku+Bw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231235

The singlehtml builder creates broken links, as reported on the
yocto-docs list[1].

This issue was also reported upstream[2], and the temporary fix is to
revert commit c93723b80396 ("singlehtml: deprecate the 'fix_refuris'
helper function (#13037)") in sphinx.

Backport the revert commit as a patch in OE-Core.

[1]: https://lore.kernel.org/r/d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch
[2]: https://github.com/sphinx-doc/sphinx/issues/14221

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 ...lehtml-deprecate-the-fix_refuris-helper-f.patch | 72 ++++++++++++++++++++++
 .../python/python3-sphinx_9.1.0.bb                 |  2 +
 2 files changed, 74 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
new file mode 100644
index 00000000000..1adf82d7ef3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
@@ -0,0 +1,72 @@
+From 323350c9c4df6be0935e7237ce20add8ccd1bb13 Mon Sep 17 00:00:00 2001
+From: James Addison <jay@jp-hosting.net>
+Date: Sun, 4 Jan 2026 20:51:55 +0000
+Subject: [PATCH] Revert "singlehtml: deprecate the 'fix_refuris' helper
+ function (#13037)"
+
+This reverts commit c93723b80396959e19442f7058ad3412eaf11468.
+
+Conflicts:
+	CHANGES.rst
+	doc/extdev/deprecated.rst
+	sphinx/builders/singlehtml.py
+
+Upstream-Status: Submitted [https://github.com/sphinx-doc/sphinx/pull/14241/changes/d5db93897a038c84afaad28e17c051182dbbffc7]
+
+Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
+---
+ sphinx/builders/singlehtml.py | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/sphinx/builders/singlehtml.py b/sphinx/builders/singlehtml.py
+index 1888f6679..f895077df 100644
+--- a/sphinx/builders/singlehtml.py
++++ b/sphinx/builders/singlehtml.py
+@@ -9,7 +9,6 @@
+ 
+ from sphinx._cli.util.colour import darkgreen
+ from sphinx.builders.html import StandaloneHTMLBuilder
+-from sphinx.deprecation import RemovedInSphinx10Warning
+ from sphinx.environment.adapters.toctree import global_toctree_for_doc
+ from sphinx.locale import __
+ from sphinx.util import logging
+@@ -52,14 +51,6 @@ def get_relative_uri(self, from_: str, to: str, typ: str | None = None) -> str:
+         return self.get_target_uri(to, typ)
+ 
+     def fix_refuris(self, tree: Node) -> None:
+-        deprecation_msg = (
+-            "The 'SingleFileHTMLBuilder.fix_refuris' method is no longer used "
+-            'within the builder and is planned for removal in Sphinx 10. '
+-            'Please report malformed URIs generated by the Sphinx singlehtml '
+-            'builder as bugreports.'
+-        )
+-        warnings.warn(deprecation_msg, RemovedInSphinx10Warning, stacklevel=2)
+-
+         # fix refuris with double anchor
+         for refnode in tree.findall(nodes.reference):
+             if 'refuri' not in refnode:
+@@ -86,6 +77,8 @@ def _get_local_toctree(
+         toctree = global_toctree_for_doc(
+             self.env, docname, self, tags=self.tags, collapse=collapse, **kwargs
+         )
++        if toctree is not None:
++            self.fix_refuris(toctree)
+         return self.render_partial(toctree)['fragment']
+ 
+     def assemble_doctree(self) -> nodes.document:
+@@ -95,6 +88,7 @@ def assemble_doctree(self) -> nodes.document:
+         tree = inline_all_toctrees(self, set(), master, tree, darkgreen, [master])
+         tree['docname'] = master
+         self.env.resolve_references(tree, master, self)
++        self.fix_refuris(tree)
+         return tree
+ 
+     def assemble_toc_secnumbers(self) -> dict[str, dict[str, tuple[int, ...]]]:
+@@ -145,6 +139,7 @@ def get_doc_context(self, docname: str, body: str, metatags: str) -> dict[str, A
+         )
+         # if there is no toctree, toc is None
+         if toctree:
++            self.fix_refuris(toctree)
+             toc = self.render_partial(toctree)['fragment']
+             display_toc = True
+         else:
diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index 24e95da10d1..76f904d708f 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
 SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
 
+SRC_URI += "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
+
 inherit python_flit_core pypi
 
 do_install:append () {

---
base-commit: d9ec9e20eebc062d084dd76b59d665994e0cb51b
change-id: 20260217-fix-sphinx-singlehtml-uris-44600bd5f15a


