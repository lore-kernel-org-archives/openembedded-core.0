Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30988.1794845353638068662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yFfCxPQ3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 799071A169C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ECE06023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEA1111BC0317;
	Mon, 16 Nov 2026 17:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YDWbr3KDh+yHuSndoouNjN4qv4eSM0wHV/LwDVFIWvI=;
	b=yFfCxPQ3arghyzg/hQEA+B1wQKG48mhPWyEKMBUHHLzCM94LNHuBPV+Wni53GsWJz5SV47
	oSEwJmIVTwjs6+95D/drI9bYmt90CFhyjlkYcqT4SQEERtQPuPbYNl0A8tUBmaH4008gTj
	72+yerfeMZKID/bXZb0f8gOR236cAi3rVrtuDOST/4nPNKkd8OEUzJ9vV2ijTihtZRbYeW
	kj7a7zCfHz68IVNVyzF28ENVv5bd4s4EvV7Muw0kHGApGm5dosLZBR9cAWROmh0YkdHAIu
	SfPDF8eanSsAj8dy9jZl2xjDFkhtikG8wWIj7dk3T6D7ksfH8Ws1JS20gT+1AQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/13] Improve or add oe.* library docstrings
Date: Mon, 16 Nov 2026 17:08:58 +0100
Message-Id: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0wxhTsVYoLk4x2SklKJoog3
 t1Ul2/x/w5CiUngWe2QaGXhGApUXYF7j2EmZF8MbdM+lGo0RsIvW/TRSU4cZkFtDI2973RvDZT
 ul2ji7Xq+htuy2A+5/B/BcZzo+tfmdQAAAA==
X-Change-ID: 20261103-oe-lib-docstrings-355ea9d439b5
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SAoUrp9ydRt17PIPFrGT9FXeh9jx/7kdzfm2Zc1leWk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqdJybh3O+tPQCJr7CSrswhYTHCuNsVFpfat
 S2VvgV8mIWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnQAKCRDRgEFAKaOo
 NigJD/935MQP5NFc2YH2zf2sAsRvxhRqVKV2Ki21D3z23Hio1Ev0q8GApmQbzonIn2gdJyED2GN
 j7jnbknscNSRoIXdBnZ1iL0EFeNdfkLEghSqZEw/IHUgyl9GcgODWZc3muln6vOC49yGrB3LdX+
 3vvE4cVgPJ5gUWH/F3C4xUGWEctuhvWqAAYfWR5IXBGtD2lc+KafOcsEMWq889GQZbC62PhjoMq
 dVYmM7ln35ygpB/KmevnKBbx4ovcALQC5+FfFPu3QvtcxGkBkq6iPB43y64kfo7qwfJe8HN/4eF
 iem9oM+R+eObA1KeFiV7LUrU+dtjaKAKwf2dHFOCHaQDz9PFxFMwx/t41ES1dPQlCexs1QyTNuE
 PKggTb3t/kQ9kw8rdakjP1U0gnvv5DhtJsMNmGtQ5JMN9Rrf5BS4QKk0CT+/WBEkLEk4xRQeiHJ
 fsAV4U4LdZ46OuKb022WhwFx5aaJnpi5kLsycUdUiid5HTMdAdBDh5MpuxUix3icdlXP4AWkYpI
 hVEciwk/YJoS0K9vylvblW57VuVJeXgOHjzUJIfl14NYHUZ4slZG2LqujeLESVP45zPR3X8imJf
 W3pGxjOXVscNisq2MAMY2BBrfPe1S9H5IhFmY8LM7QaNgeZwZ4OcnrokIgrXjCxjAnxT2UK49nt
 JzT72w67BefnoIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250350

Improve the docstrings of useful oe library modules and format them for
inclusion with the sphinx.ext.autodoc extension. This allows presenting
the documentation like in [1].

The series is divided in two parts:

- Patch 01 to 05 are code fixups, they do not contains documentation
  changes, but are relevant to provide a meaningful and consistent
  documentation.

  Some are breaking changes and scould be debated, but I believe for
  most it does make sense to make the change, especially for
  understanding how the function works in documentation.

- Patch 06 to the last patch are only docstrings changes, one patch per
  oe module to make reviewing easier.

This work will be integrated to the yocto-docs documentation in separate
series, sent after this one.

Note: compared to [1], I deliberately stopped following the
"Parameters:" and "Returns ..." pattern as it sometimes proved to be
challenging to describe the function's behavior in a natural way.
Instead, I took inspiration from how the Python library documents its
own modules, using imperative tense and simple paragraphs (most of the
time).

Note 2: for now, only certain modules are covered, especially those that I
think are useful for end-users. Some functions in those modules are not
documented and were left as-is because I also felt it wasn't useful to
document them.

[1]: https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-library-functions.html

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (13):
      lib/oe/path: rename "metadata" parameter to "d"
      oe/path: simplify replace_absolute_symlinks() signature
      lib/oe/utils: simplify str_filter*() signatures
      lib/oe/utils: drop all_multilib_tune_list
      lib/oe: move oe.types.{is_x86,qemu_use_kvm} to oe.qemu
      lib/oe/data: improve docstring for typed_value
      lib/oe/go: detail map_arch() parameter
      lib/oe/kernel: convert comments to docstrings and improve
      lib/oe/lsb: improve docstrings
      lib/oe/path: improve docstrings
      lib/oe/purl: improve docstrings
      lib/oe/utils: improve docstrings
      lib/oe/types: improve docstrings

 meta/classes-recipe/testimage.bbclass            |   2 +-
 meta/classes/relative_symlinks.bbclass           |   2 +-
 meta/lib/oe/data.py                              |  28 ++-
 meta/lib/oe/go.py                                |   7 +-
 meta/lib/oe/kernel.py                            |  22 +-
 meta/lib/oe/lsb.py                               |  18 +-
 meta/lib/oe/path.py                              | 154 ++++++++++----
 meta/lib/oe/purl.py                              |   9 +-
 meta/lib/oe/qemu.py                              |  24 +++
 meta/lib/oe/types.py                             | 166 +++++++++++----
 meta/lib/oe/utils.py                             | 254 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/efibootpartition.py |   2 +-
 meta/lib/oeqa/selftest/cases/runqemu.py          |   2 +-
 meta/lib/oeqa/selftest/cases/uki.py              |   2 +-
 meta/lib/oeqa/targetcontrol.py                   |   2 +-
 15 files changed, 529 insertions(+), 165 deletions(-)
---
base-commit: f32bced7b431f39a956c3e0d42e3c756ab784c49
change-id: 20261103-oe-lib-docstrings-355ea9d439b5

