Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4151.1795045471018095579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JLxe6M6s;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1474103f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045469; x=1795650269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=osdvNKeU33W2G5T1BSIous7WG58bi7Y95WwZr7JrdV4=;
        b=JLxe6M6s/fLwSYHlgwxbHr4FrSSAgJCdnejCwrypGFy8kZRAwP1xeQossxsK0y6ZyM
         YqGrsmOZImFwfn50MzuIiHux8f5PhGHoFe5cM61PeMHSsv+W0uWQ6xLL7gOacGl6ojdm
         02ZjzOETZe2LoYr2ORwUgScvMi4iWvLnru1KDp4zOtrN8cBR/W21uOeRRtnrGfAtH0Fu
         kYvlEfdKwmgST6mPpbnR8g1njbbSlnw1fksw72DrduDkKhYLwMK3qJDlkUY8PYPx4LOp
         lwFaag4QhOfu5R77lDdO/W6T43JvDsd5gY8SIroigVcdeY9i9ilGrS9LcxDSY/tc4kSF
         3sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045469; x=1795650269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osdvNKeU33W2G5T1BSIous7WG58bi7Y95WwZr7JrdV4=;
        b=x3/MuP7jqRaPIiWpr7tZp3ESmpSxLbrr1XlUmkLRRLGwpm/XgAs+ifnQCghogI8pMB
         YOZmaPr3CrA7Affk74a8YgTqLw2FCnV9g4Mbvli/+ljKKaeHyYAuCmg1lFpMmw2XxCq2
         1WnMLG5eo+vVb5XzBhc0dMlXRVx6g1xNmce9BsBgNxnmPck/FOy8os7LcZ/MYeO70CXR
         9nmEyuLuahj+ZdDCQe9VKErmJkbrgODpmkUvKALgRHgBnQ/LLZK38S08MxFQ+VMtFbVa
         rBtGMtp8BimwxRdcg/+y2qCJlPbG2psR0iSuqmLPmj9ALctMNlthUvPY25hJk4GCUdtb
         Dxag==
X-Gm-Message-State: APuU4Z8C3nPeyCj6nS+ikTSvcqOE8JvOpY3CyrAlpL1c9hNVJRyQNLUu
	q+U0Sss676AhUwSSnY8THEAxJC+Uc7z7OQgSr43JqPr1BlQx0T8Iz+IpKVY0YQ==
X-Gm-Gg: AZFdTZei/NOiJfZsA3qwA2xWJn0R3cMvDYBvhXqWMnNBCknWM7e/huybzAqNQmk81mC
	BrFV+FftSuqzPcQlHEC8MvpSXGmuy0s74QyJM2JxzR7RV6/XVq2jpnu1sAii/d8KmHeWseazw4x
	kxwm5pizYO7YtEXciAmyf6cgGmFE/gux2S4AMvHcDB1ni16AnW7jZbetKkRkEZq/soxX7zKQOeR
	YQWhCPQeCgPsgi9f6j09UbWMsG3JpuqBaq5+0EqLePqI1tBQvb3+suDaC13v8Xgt1m/+HUlAkmB
	6VwoZgedbwSZsSWzf9MkU/rZgUGfT4QQ+RIf7LVFh7xAshugGJ2z0XtF/8tdpDhNK6XwTcBSXqS
	b5KBH9ulspJunp0G30LIqvomLDy77Xs84xtlvGz0mTSMjEe5aR7ymCzQqbKMOLQPrZljlMMXQcf
	O1RHB1I23oIoyCsVrslkG7DMX+tghnV+oObl0XlQVqkRbKSZzFgGMLIwayG9VHVT49WDbGuG/SQ
	y2tAuyQikIkBIT3ZMwVXhhVXu+sfOUB8BM99mFi5UZhH+K2sNUbQFgDdLnKovR9Doq9+FlsSLj+
	hvvHkZdO7W5g
X-Received: by 2002:a05:6000:d8a:b0:4a3:a0f:ecf0 with SMTP id ffacd0b85a97d-4a63bdb0aabmr6947715f8f.55.1795045469139;
        Wed, 18 Nov 2026 15:44:29 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6730718f8f.19.2026.11.18.15.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:26 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2 0/4] spdx30: identity and purls of dependency downloads
Date: Thu, 19 Nov 2026 00:44:21 +0100
Message-ID: <20261118234425.3681880-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250600
Content-Type: text/plain; charset="utf-8"

Hi,

This series implements the parts of the RFC "spdx30: name, version
and purl for dependency downloads" [1] that we agreed on. It needs
the bitbake series "fetch: package identity of crate, gomod and npm
URLs" [2].

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

Changes in v2:

- Patch 2/4: the walk over the cargo graph expands each workspace
  member only once. In v1 it did not end for python3-uv-build, where
  the member uv-preview is a dev dependency of itself. do_create_spdx
  used memory until the OOM killer stopped it. Thanks to Mathieu for
  the report [3].
- Patch 2/4: add unit tests for the scopes, with member cycles.
- Rebased on master.

Tests: oe-selftest -r oelib.cargo_scopes spdx.SPDX30Check passes on
master (22 tests) and on master-next (22 tests). With v2,
do_create_spdx of python3-uv-build and python3-uv-build-native takes
less than 2 seconds and about 100 MB, with uv-build 0.13.7 and
0.13.8. For the other cargo recipes in OE-Core, the scopes are the
same as in v1.

[1] https://lore.kernel.org/openembedded-core/20261105122145.543282-1-stondo@gmail.com/
[2] https://lore.kernel.org/bitbake-devel/20261118092831.201831-1-stondo@gmail.com/
[3] https://lore.kernel.org/openembedded-core/DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com/

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

