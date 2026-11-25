Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48719.1795631778195441657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qva81wUb;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so3224434f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631776; x=1796236576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJPUV7Ykm3IQ81+K72WvimzRZdZnUtCABFKNIuGI3VI=;
        b=qva81wUb/F4X2c1oFv8kqlf4ZXJCCZo6wSEF+x6dYqYXMEofN4YR0xnRUm8rWtjtt7
         SExS3ofYVaG84zr38QgvsUdHADw0LXdVPnoq6mg2sHPTd+4eAvkMqXkC6ceX/32M1ZKu
         istZ4vvMo4FfKN8/tQTRdyAHTcYRV3KEAAqSbOwd6UU4ZY9Bvv+U4JFnY1WWhf2KglGi
         SNK3zb4pe7vtpkjHLdsRzAOTXTZVNORd3ltjvDfcFNuyLZXPdlFD5kOZOP/VwySF6SGK
         sr/EWyS6Mk08JlSyzn6WLPU9W9XgYt9IS7kG+nu5LAzEDhlPMwzNnLqkNKBMz/NrqKgh
         N5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631776; x=1796236576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJPUV7Ykm3IQ81+K72WvimzRZdZnUtCABFKNIuGI3VI=;
        b=lzLup6SJ2BX1h/rxao90YOW+Y+GQO/ViQP42XYCET1Jbr9DwdfxwoqfXkD5AN6HTvY
         7h4ustzlzXdZAhI86biu4JWBjacrEBQHsLpiW8GocKJ2fPPhndTjPGWI6Jsl24vAvuZ/
         gTXW1XwAv6+9bW72OkfAtb7enqkGPAmq9wu23NhYCQXZDW2WNXnSjEK3ohDSg2ay0rNS
         QMSmCeoHYzvYwQxiVWn7PstqAwrYxB53Bk6EV4EtPKA28WCcx1jEA+D/T5k25S9HBWvg
         OIq8FvPrhGYN3OC9ti9ccAPaZKLuRhBh9/lst4nWgxqYtTqjoHtgHIkZmAlnDk/oAHxn
         DvLA==
X-Gm-Message-State: APuU4Z+s6huTrLkfs8GWKKm6TzAx/eK7nA/yea3F0TcbPF+j3a2PXdaG
	GiYKedhsOkdOdgmSKg491yLCS5tQ3aO1dwf5pKSbTlMye4xoBm4XUYXGb+75uYgx
X-Gm-Gg: AZFdTZf4aseaAyxi+8T2YHQQz5fWflvicOvuQ/Tp51TqbQ8ryXFnslGRmh5XQcnAbX/
	Ue0JVuCyalxJovIkSDXX7K+UHqUaLb07jW0uAGwfWYPp4DgsyWOsiEE2Q/EmkdRDwPo7gWDG1QM
	8Zz8m6wEKRZ4OtVAxPlGIYk2ENmVsZ7aAwMr1SLrC+cTWt2fDVJPOEHsGhZqBXWOMTU97pITGhP
	Zt3JKJVN62jirRKBnPTwxPsUuORWJBECjLAEAZdrp3IUVx1QW6WS3TAYepkMOOwQPixocd1RZ9z
	8rbDWp6EWm+Gm238FIgSFiNgSVFzEsoxTXqVQOVViFnPh8UYsKPQKqceSDAYtoAGoIrwhT7+tXG
	6To+SSK42xn5cdBhrbUbZ4LnuBQuwx8Sq0Dcy3oolRebFehnke9m2gcdmqR22g/xy9Fcqz9FqQW
	KAXYI13IQ03ZA3JF9dBCW7dZGB84jjDv4TDuPw354qSNtSTfGJceDZqak7vphrKVe9y0V+NCmBE
	3LU6txoJrG6Nk+DBAkLVNG3eHQ7tYYzaHKlsUorjB9GGNnuTmrcqiJ/fmtKFyQSRbV+vWKnhE9I
	ieRe5+aU574=
X-Received: by 2002:a05:6000:2997:10b0:4a8:12d3:c0b2 with SMTP id ffacd0b85a97d-4abb47b2244mr27393035f8f.23.1795631776100;
        Wed, 25 Nov 2026 10:36:16 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm36941016f8f.2.2026.11.25.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:36:15 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4 0/4] spdx30: identity and purls of dependency downloads
Date: Wed, 25 Nov 2026 19:36:09 +0100
Message-ID: <20261125183613.1335718-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251236
Content-Type: text/plain; charset="utf-8"

Hi,

This series implements the parts of the RFC "spdx30: name, version
and purl for dependency downloads" [1] that we agreed on. It needs
package_identity() from the bitbake series "fetch: package identity
of crate, gomod and npm URLs" [2], which is in bitbake master now.

1. The SPDX of a crate, gomod or npm download gets the name, the
   version and the purl from the fetcher.
2. A class can give the downloads of a recipe a lifecycle scope with
   a function in the new variable SPDX_DEPENDENCY_SCOPE_FUNCS. The
   build links to each download with a runtime, build or test scope.
   A download that is not used on the target gets an annotation. For
   Cargo recipes, a new do_cargo_metadata task writes the crate
   dependency graph for the target with all features, and
   oe.rust.cargo_dependency_scopes() reads it.
3. Each output package gets the purls of its source downloads as
   external identifiers, as Joshua proposed: a statically linked
   dependency is part of the binary. A purl is left out only when a
   scope function shows that the download is not in the target. The
   software_packageUrl of the package does not change.
4. Selftests with python3-bcrypt.

For python3-bcrypt, the output package gets the purls of 25 of its
42 crates. The other 17 crates are not built into the target.

Three points for review:

- The cargo graph has all features, so a crate of a feature that the
  recipe does not enable counts as used on the target. rpm-sequoia
  selects one crypto backend, but its package gets the purls of the
  crates of the other backends too. A follow-up can make this more
  precise, for example with the crates that cargo really compiled.
- All output packages of a recipe get the purls, also -dbg and -src.
  I have no proof per package, so I followed the rule "keep the purl
  unless there is proof".
- Go recipes have no scope function yet. go version -m can give the
  proof per binary, and a follow-up can add it to
  SPDX_DEPENDENCY_SCOPE_FUNCS.

Changes in v4:

- Patch 2/4: the SPDX code does not read the cargo graph anymore, as
  Joshua asked [5]. create_spdx calls the functions in
  SPDX_DEPENDENCY_SCOPE_FUNCS. cargo.bbclass adds
  oe.rust.cargo_dependency_scopes(), and the walk over the cargo
  graph moves to oe/rust.py.
- Patch 2/4: do_cargo_metadata writes the graph with all features.
  v3 used the default features. rpm-sequoia builds with the feature
  crypto-openssl, so v3 annotated openssl-sys as not built and left
  its purl out of the package.
- Patch 2/4: do_cargo_metadata does not fail when cargo cannot give
  the graph. In v3 it failed for mozjs-140 in meta-oe, which
  configures the crate sources in its own way.
- Patch 3/4: uses the result of the scope functions, so it is not
  specific to Cargo anymore.
- Patch 4/4: add a test with rpm-sequoia.
- Patch 1/4: add the Reviewed-by of Joshua.
- Rebased on master.

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

Tests: oe-selftest -r oelib.cargo_scopes spdx.SPDX30Check passes on
master (24 tests). The new rpm-sequoia test fails without the
feature fix. do_cargo_metadata succeeds for the 29 recipes in oe-core
and meta-oe that inherit cargo: 27 get a graph, mozjs-140 gets none,
and python3-setuptools-rust is not a Cargo project.

[1] https://lore.kernel.org/openembedded-core/20261105122145.543282-1-stondo@gmail.com/
[2] https://lore.kernel.org/bitbake-devel/20261119204856.2930668-1-stondo@gmail.com/
[3] https://lore.kernel.org/openembedded-core/DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com/
[4] https://lore.kernel.org/bitbake-devel/DMZ3ERL47CEB.3KE9TOG6YIZPD@pbarker.dev/
[5] https://lore.kernel.org/openembedded-core/CAJdd5GaVPXT8Af3qNPWRArPLRMupC875nHSw_jdqBs_563hjkw@mail.gmail.com/

Stefano Tondo (4):
  spdx30: Take name, version and PURL of downloads from the fetcher
  spdx30: Record the lifecycle scope of dependencies
  spdx30: Add the PURLs of the source downloads to the output packages
  oeqa/selftest: spdx: Test crate identity, scope and output PURLs

 meta/classes-recipe/cargo.bbclass             |  27 ++++
 meta/classes/create-spdx-3.0.bbclass          |  12 ++
 meta/lib/oe/rust.py                           |  74 +++++++++
 meta/lib/oe/spdx30_tasks.py                   |  83 +++++++++-
 .../oeqa/selftest/cases/oelib/cargo_scopes.py |  96 +++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py          | 151 ++++++++++++++++++
 6 files changed, 442 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py

-- 
2.56.1

