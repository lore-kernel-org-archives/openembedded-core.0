X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Ferry Toth" <fntoth@gmail.com>
Subject: package_manager: support for signed DEB package feeds
Date: Sun,  3 Apr 2022 21:50:42 +0200
Message-Id: <20220403195046.7060-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Xavier Berger <xavier.berger@bio-logic.net>, Alexander Kanavin <alex@linutronix.de>

[PATCH v2 0/3] package_manager: support for signed DEB package feeds
[PATCH v2 1/3] gpg-sign: Add parameters to gpg signature function
[PATCH v2 2/3] package_manager: sign DEB package feeds
[PATCH v2 3/3] apt: add apt selftest to test signed package feeds

Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
Currently when building images this requirement is worked around by using [allow-insecure=yes] and
equivalently when performing selftest.
    
Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign deb package feeds"
enable signed deb package feeds. This patch adds a runtime test for apt derived from the test_testimage_dnf
test. It creates a signed deb package feed, runs a qemu image to install the key and performs some package
management. To be able to install the key the gnupg package is added to the testimage.
    
These patches makes deb a first class citizen as ipk and rpm.

Patches have been in use in meta-intel-edison since Gatesgarth, 
see https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-repository.html

Changes in V2:
 - Added runtime test for signed deb package feeds (Richard Purdie)

