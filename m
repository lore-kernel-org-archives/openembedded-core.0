Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7100.1795734457209304266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sQeBriQI;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso74296285e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734455; x=1796339255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Rm3RaX7FIFaRjW1WI2LSBhxhkXNaS7RnIUJqUTYUaI=;
        b=sQeBriQI7mBua+HMtqbB8soZ2MDtujAK5g+VtcHSGV7/t2jhDXMoE9gaZQuD6H5Opc
         ixU/7O2wyitfPj2ur34TRkivNKdnLYdpWNeYEIHxNGhVXW8p5+tx37mYrYHzQRm+yzQY
         ni5nEamVZfNg9LuozUCxdP3hhqEtTWzoyKUJAWwvlwM5GtG5qyxnPnv3ZDVNhh9n1zp5
         ZkhnC1etY5F1c7yfvNLnhQ188AiwPOHCBTNS9NRdqLT0S6MohbFDHPrB1fmKsxRLppcV
         +jnapmhP3IWvL8o/qEvfDSSQtn87Dhusbs5OZAmiIzPI7aGus43dmTJps/5nPZEcL8BU
         rPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734455; x=1796339255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Rm3RaX7FIFaRjW1WI2LSBhxhkXNaS7RnIUJqUTYUaI=;
        b=rZgniGwiUXclI9jIfo8w3Hee3lVsJIpuXJA5ULSfdJvOZ0Bt5hRpyDqhhfojCVsLSH
         CZbODiroKUR49XrVlk7uNAaoyJkP1IlOqb1h5xOSkSGUZS2F7ls/e3itdqnRw5oMQoQ0
         oRGO0sYsGERCPFoS/Stt/3Xp87ki1Jyf7AAN3AkqsbR+bGVhmDQmvxLaPfqa+XBY/uHG
         0IfI5p6fOv+oJCopRRyStKOsXKXn6sq97gMgmhWYSlkFUMhpICFYVtA7KG4mkcDB0wL2
         7j5erzVbjHO3vLASyTctIaGNOgNwDWYrWOn9flzb8HrN0iMqSPcScIv6/VWPZ5iU8R9W
         duuw==
X-Gm-Message-State: APuU4Z++Zm0DQKa7F/EE5gninPdUZIVxCKfieBVQU/P9WzCLLjj9bJ8x
	78uGm8bOtYtpJFG8+MZLIeyG3dTPrB5Nnvq+DxuxWgGVXW6H2sBjFQ3tluPNrCjw
X-Gm-Gg: AZFdTZe7rFCbxk3IYY8uVVyD/6wTYkpQWlVVrlpBY3caTl4MBtcmFOFFFjVV+PHDjCk
	yr373rRVrAmjlP26dmF5DFQFesV38QHyR3bCW7IUpMuV9VnICJSOY0gQubm4WhqomaSzlgmSukI
	16haW9TQbqMl0W5QC0Y6gvPFBf0mBwdUPWLRzFd8c/pyabYAH4XGGIVVqHzWRXapLGWfXoBfM9v
	vfIxfn02DWzhCaTEO05VKMVaKljsWc8eQb9YerRo00MHKfLd56MtUeJRSuL83eS1omjvTkFbNTi
	eDi8l4btvnVGNsX8xQzqip7/NvoFR6cginBZ9d2L6R+OfBiM9wwiMRUSuzFSHcOladb36FXlMPn
	I0a6KC0Gf4mOsknlbhhiiCQI9Muc4RV4lrq09IoliEc5njsxl8BkVf+tA+XBK1dpm52lF+2IOGS
	1ApRsvCdIKoUXbAwOEX1RxaorOzqhuPtJJ4OjcZMRR1Otkpk8QqVzQlg3nAMBYxTvEC045fAl9L
	E8Trb9KDp2FMYK+ZMTi6CSpPYLMVV2JmOzT6M5gP+chCph2cujhTWe/ydGAJ+OodYRv2FbIQ6la
	XmCO5+KbyXVL1oa7Tzt34T4Y9DpXSzm0
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr259840625e9.2.1795734455249;
        Thu, 26 Nov 2026 15:07:35 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm748625525e9.11.2026.11.26.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	alex.kanavin@gmail.com,
	stefan.herbrechtsmeier@weidmueller.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	peter.marko@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v5 0/3] spdx30: identity and purls of dependency downloads
Date: Fri, 27 Nov 2026 00:07:29 +0100
Message-ID: <20261126230732.2708012-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251334
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Hi,

This series implements the parts of the RFC "spdx30: name, version
and purl for dependency downloads" [1] that we agreed on. It needs
package_identity() from the bitbake series "fetch: package identity
of crate, gomod and npm URLs" [2], which is in bitbake master.

1. The SPDX of a crate, gomod or npm download gets the name, the
   version and the purl from the fetcher.
2. Each output package gets the purls of its source downloads as
   external identifiers, as Joshua proposed [3]: a statically linked
   dependency is part of the binary. The software_packageUrl of the
   package does not change.
3. Selftests with hello-rs from meta-selftest.

The output packages get the purls of all source downloads, also of
the ones that are not built into the binary. For python3-bcrypt, the
package gets the purls of all 42 crates, and 17 of them are not built
into the target. v4 left these out with a lifecycle scope for each
dependency. Paul asked for a proposal on the openembedded-architecture
list first [4], so v5 drops that part. I will send the proposal
separately.

Changes in v5:

- Drop v4 patch 2/4 "spdx30: Record the lifecycle scope of
  dependencies", as Paul asked [4].
- Patch 2/3: add the purls of all source downloads, with no filter.
  Joshua called the filter optional [3].
- Patch 2/3: a download purl does not become the software_packageUrl
  of a package when SPDX_PACKAGE_URLS is empty. In v4 it did.
- Patch 3/3: test with hello-rs from meta-selftest. It has a fixed
  SRCREV and one crate. v4 used python3-bcrypt and rpm-sequoia from
  oe-core, and as Paul noted, their crates can change on upgrades [5].
- Rebased on master.

Changes in v4:

- Patch 2/4: the SPDX code does not read the cargo graph anymore, as
  Joshua asked [6]. create_spdx calls the functions in
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
  proposed [7].
- Rebased on master, which has python3-uv-build 0.13.8.

Changes in v2:

- Patch 2/4: the walk over the cargo graph expands each workspace
  member only once. In v1 it did not end for python3-uv-build, where
  the member uv-preview is a dev dependency of itself. do_create_spdx
  used memory until the OOM killer stopped it. Thanks to Mathieu for
  the report [8].
- Patch 2/4: add unit tests for the scopes, with member cycles.
- Rebased on master.

Tests: 18 of the 20 tests of oe-selftest -r spdx.SPDX30Check pass on
master. I did not run test_core_image_minimal_sdk and test_world_sbom.
The two new tests of the output package fail without patch 2/3. The
test with an empty SPDX_PACKAGE_URLS also fails with the v4 code.

[1] https://lore.kernel.org/openembedded-core/20261105122145.543282-1-stondo@gmail.com/
[2] https://lore.kernel.org/bitbake-devel/20261119204856.2930668-1-stondo@gmail.com/
[3] https://lore.kernel.org/openembedded-core/CAJdd5GZTCwr9VE8OmOw7RAki+Xu+kokCgtOHG+9ghE3frWPbqg@mail.gmail.com/
[4] https://lore.kernel.org/openembedded-core/DN56BR66WII7.34FC67CIINIBB@pbarker.dev/
[5] https://lore.kernel.org/openembedded-core/DN56EKP8RI3N.UY4F4DI6PFGI@pbarker.dev/
[6] https://lore.kernel.org/openembedded-core/CAJdd5GaVPXT8Af3qNPWRArPLRMupC875nHSw_jdqBs_563hjkw@mail.gmail.com/
[7] https://lore.kernel.org/bitbake-devel/DMZ3ERL47CEB.3KE9TOG6YIZPD@pbarker.dev/
[8] https://lore.kernel.org/openembedded-core/DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com/


Stefano Tondo (3):
  spdx30: Take name, version and PURL of downloads from the fetcher
  spdx30: Add the PURLs of the source downloads to the output packages
  oeqa/selftest: spdx: Test crate identity and output PURLs

 meta/lib/oe/spdx30_tasks.py          | 28 ++++++++++++--
 meta/lib/oeqa/selftest/cases/spdx.py | 55 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.56.1

