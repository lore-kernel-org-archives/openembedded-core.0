Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4745.1795121353127061942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sK1e/H/z;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so135540f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795121351; x=1795726151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VeZANmx8bkRT3bPeSFjMHQ79lbuEAU4a28bWqVvQl0=;
        b=sK1e/H/z9CvnmOMqRaTe9rGXqea0uK0V5DDOGn2XrpRGGgjHfzLTdFgVuh0KI+qXIQ
         q472sWBaV8MsszQ735axIYObGS25h4OyWkuSQ7Y2koENxh+j9H9jCTJm48GHGlVmrAgi
         TPFWj4eNLdOAe9wdrUyi9xoxsFeooz3VYirpMavIZykyKWQb34sbidMGVd5zOZVWcWu5
         72YBB+7K1vvANb9uyvXnt0OtCgddatDERf6i82zjeOiUR3NYkAn3u3Y4XvilydqZvYQm
         FkTFrcgNeWD6ZgCBBXeLA5TZ1iChcSDkixD8FxUy3NPKZhqzMo+8Ou7WGaopJij4VQ1d
         GcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121351; x=1795726151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VeZANmx8bkRT3bPeSFjMHQ79lbuEAU4a28bWqVvQl0=;
        b=PMfP8IVY9ffhUbwOTXpCW2IJMwVDOJZVzcI6DGiEiOF17aLKzMr8l67BBo++YCOgY0
         p4MudpfIOsRKngFpRKwoXPsjLdl9LenwUKGF+jmE12y+yOAKxlOfV2wUnvdqU2rZnIs6
         35aJnEHw7kYh0SOiRfDU1u4GLdiRFHhkplAvBd2csack/hUefplXcnMGGiCLMU2OoGyC
         k/2Qoiq/gu21gvDXbxHmh1zjOo0sRZsLmF43/e4VsiGgQamXEFkacVWGQF0pr0m/OvS4
         wNZW4wNF3B9FUy/VOTWk0GojEmeA4d5R4wj2dc6qnVGEBYBGckLJfIzZ/3D5wujSFEoK
         JZsA==
X-Gm-Message-State: APuU4Z9+97RCDoYn7a3r90wuZDi8e3WMxPIrgI0eZIBKmA/9f2bGB6Xe
	3Xk4CWAJuvgsgMQqv5SaxIGGW5tFyLyTNeO3l/TCrq6m8x1Yqax2FKCl1au4Q2lc
X-Gm-Gg: AZFdTZc1lSOaWcWAEX0lkLG/eM1XhpIbjrKSkyZiUbuSjIbVucWr1KGSkwADWR8lw1Z
	XjQr8nk2Q+caHxQxfxgxmu4Lskp3nqiqB8syUKlvTdKvR7SdSfMiLg5c50owRI5JBo46Bg5TmO6
	LORSMIP7wsmMZntHgY70UBCKnT6eat+62YDGSdtNEKugRI7EjLa8Y4GhV1kvR8UftHNOYyNOBNn
	hlPA4v/LFGbIxUTq8npSGuIPrZX2DljPJNyfRcRxDs5yWaXuzjdn9RXaZBEBVt6vGOEo0N7eN7a
	hrPWrjxGzYJV1lFjRsIlnKB2jtcsPCTsrFmCCNofBT9dPsRweBaaJJcQjuaVro7aFQL3nW93UDi
	I/Z3PnSFGmxUm2AeCp69PDFqdJfvK+keb4wbQtC+hYiQQ49Gsf+a+Uz0T9u+Q0KEqyVB1t5THbC
	l91o3+Yrpmo+ZUTNhTQwPzLB3zde95Opx7wyiiHr6vVUm1f1XP2S43BQnYQz5XPQKWDllEWTpHo
	FwVuGkPNnWzVYsrxPzPYQN6clFzgntmQkpr77XrWQLiiSDRZtAwpumzDTNuZlREb8W171y6t5mr
	2QpPZ1oXxRDhA94wKsq/UVKzBFa1hw9S
X-Received: by 2002:a05:6000:299c:20b0:4a7:9630:7b4c with SMTP id ffacd0b85a97d-4abb9459073mr787208f8f.47.1795121351172;
        Thu, 19 Nov 2026 12:49:11 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm1606171f8f.57.2026.11.19.12.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:49:10 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 0/4] spdx30: identity and purls of dependency downloads
Date: Thu, 19 Nov 2026 21:49:05 +0100
Message-ID: <20261119204909.2931233-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250717
Content-Type: text/plain; charset="utf-8"

Hi,

This series implements the parts of the RFC "spdx30: name, version
and purl for dependency downloads" [1] that we agreed on. It needs
v2 of the bitbake series "fetch: package identity of crate, gomod
and npm URLs" [2].

1. The SPDX of a crate, gomod or npm download gets the name, the
   version and the purl from the fetcher.
2. For Cargo recipes, a new do_cargo_metadata task writes the crate
   dependency graph for the target. The build links to each crate
   download with a runtime, build or test scope. A crate that is not
   used on the target gets an annotation.
3. Each output package gets the purls of its source downloads as
   external identifiers, as Joshua proposed: a statically linked
   dependency is part of the binary. A purl is left out only when the
   cargo graph proves that the crate is not in the target. The
   software_packageUrl of the package does not change.
4. Selftests with python3-bcrypt.

For python3-bcrypt, the output package gets the purls of 25 of its
42 crates. The other 17 crates are not built into the target.

Two points for review:

- All output packages of a recipe get the purls, also -dbg and -src.
  I have no proof per package, so I followed the rule "keep the purl
  unless there is proof".
- Go recipes have no filter yet. go version -m can give the proof per
  binary, and I can add it in a follow-up.

Changes in v3:

- Patch 1/4: read the PackageIdentity dataclass that
  package_identity() returns in v2 of the bitbake series [2], as Paul
  proposed [4].
- Rebased on master, which has python3-uv-build 0.13.8.

Changes in v2:

- Patch 2/4: the walk over the cargo graph expands each workspace
  member only once. In v1 it did not end for python3-uv-build, where
  the member uv-preview is a dev dependency of itself. do_create_spdx
  used memory until the OOM killer stopped it. Thanks to Mathieu for
  the report [3].
- Patch 2/4: add unit tests for the scopes, with member cycles.
- Rebased on master.

Tests: with v2 of the bitbake series, oe-selftest -r
oelib.cargo_scopes spdx.SPDX30Check passes on master (22 tests).
do_create_spdx of python3-uv-build and python3-uv-build-native
(0.13.8) takes less than 1 second and about 90 MB.

[1] https://lore.kernel.org/openembedded-core/20261105122145.543282-1-stondo@gmail.com/
[2] https://lore.kernel.org/bitbake-devel/20261119204856.2930668-1-stondo@gmail.com/
[3] https://lore.kernel.org/openembedded-core/DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com/
[4] https://lore.kernel.org/bitbake-devel/DMZ3ERL47CEB.3KE9TOG6YIZPD@pbarker.dev/

Stefano Tondo (4):
  spdx30: Take name, version and PURL of downloads from the fetcher
  spdx30: Record the lifecycle scope of crate dependencies
  spdx30: Add the PURLs of the source downloads to the output packages
  oeqa/selftest: spdx: Test crate identity, scope and output PURLs

 meta/classes-recipe/cargo.bbclass             |  17 +++
 meta/lib/oe/spdx30_tasks.py                   | 128 +++++++++++++++++-
 .../oeqa/selftest/cases/oelib/cargo_scopes.py |  73 ++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py          | 122 +++++++++++++++++
 4 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py

-- 
2.56.1

