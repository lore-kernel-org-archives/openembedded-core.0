Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6322.1795182825677420842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zb6TqkrX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so604689f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182824; x=1795787624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeplPX5aNlAprRLC1JbJc4n5eRCmA/J7V4Ced4PHt9A=;
        b=zb6TqkrXf75TKbDu3VKb2+KdREAG5yEnRSnjBEvNLPF3n56CqePb6kaOAl9/Jjhqzd
         YHFy3l5/TI06RXpPBdDwhNuwUp50YgioqGyDVkW0zuXWB8Lbwv9N01koM33Goddr4sCX
         XVRqSS5mEK6tsw7o9s2KxcCZeUfLQxxIxP5siS91LedxS1aHgPQ+sMnJuWHWr7MTYXKD
         Nd87fUpSHau7rtFceHvmQENMLcql4p4owid4dSeztWPTu3O4UWdiWinu3OgdRYkxivyi
         vEQsUzo0zTQ026bY2qRG/GITHTZmEsK8/3CsgqjwQQpw9SCqbZMyjdfy2jwdd/r0hR9t
         yWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182824; x=1795787624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeplPX5aNlAprRLC1JbJc4n5eRCmA/J7V4Ced4PHt9A=;
        b=uvCQgJfBlWUtWW8au6avLNQtjSTWvu5ICoFKq+5CScZVZqA5/upy1lFjeYrnVrBqVL
         ajTIJYubW0KutpodBGb5UEybfH3aDAs/Y+Zg9xDfeFWbfRBRlabOAsLlLWNlQyEB2DDb
         hbMvFB7RVhb46Th0TxwEK8U1pYhdd9T+aaiioqMMybQ848gA08RqtFzREz5ttrANY899
         gHSAiyq7VrH2kd04q89JstdXrex6CkNKzhfouwcvy3dqeboc1iK3qvWXYdCYZLz5W2E7
         ZslTcHmL1Swct/XoOxpRJswMXnCgk1GewOK1NlfO7i5qAkHdhlPit2R3MM6Napa7bW9J
         JKOA==
X-Gm-Message-State: APuU4Z/n0L+Mq86wUj0VAyPAWgi4O4OThFcTiHx1x42P+XRyIHrxGeSx
	6zLVeocQoiPvrRWVR5lY7jP5uO1d/0BLQxof8Hyz7DtFa7Qeuj5M/D0BaIkl+9Wd
X-Gm-Gg: AYBFou3smXAXhbms3d2NTucpbWk66bRqw6iSaYg8QsmYALbHZDSshKcoNXLHO0NSaWn
	lbLJTYJO7FBrBbS/4IEHiUAHhXGNQaLEbczV3jjPT2QeKFGDR2eaT6Xui7s0bU9HTA/ZKOxAmF6
	XoV/K8efIcNHY8pDI3lRPb6MJEhOfn1SC8q1a+F6qa7l9NggyNQif5yRFjiazo0IOqO7SAiipOT
	zXqhGjIYczW+KLB9JUKAXndpL5lo7v1tuXiISDFDfOJhIV8fHBEG7Cc41cFjdKld+nh7ohduKUc
	0LXM5INSMdbueKavuPla4SeBWHyW7NLR31sllT5vJXFqPsbFmdzsiLGrmvUfRJILyGHf4KLhR0N
	gdWmWFxgUR7lTNlgGUQUiOeksdqWlSRXjQiEZuIsByTQKmiQLX4B5huJdFNGS++M/eh2bbB0v6s
	Ysg/Lc4XGoBOS7MMuohUbI1yTr/URAAdx0bxOEmGbt0dGR4LED4KYd+2lNy1ULgNZSRGqR6Nokt
	PSGRgsIqzZLlsVr1+8Rh77ecU7F/vN+W8UVBesdscflXvqunsobsEg0GUVwirC6EWxFkvjbNUjj
	EOjHojJTiQ0=
X-Received: by 2002:a05:600c:6290:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb88824a5bmr72627965e9.13.1795182823671;
        Fri, 20 Nov 2026 05:53:43 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:42 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 00/10] npm: list the dependencies in SRC_URI
Date: Fri, 20 Nov 2026 14:53:31 +0100
Message-ID: <20261120135342.2628228-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250793
Content-Type: text/plain; charset="utf-8"

Hi,

This series lets an npm recipe list its dependencies in SRC_URI. Each
package gets one entry with its checksum. We agreed on this in the RFC
thread [1]. npmsw:// still works, but recipetool no longer uses it.

Today, a recipe that recipetool creates builds without its
dependencies. recipetool writes an npmsw:// entry without destsuffix.
Since bitbake commit 84f102954, npmsw unpacks into UNPACKDIR and not
into ${S}. So npm.bbclass does not find npm-shrinkwrap.json, packs no
dependencies, and gives no error. The package has no node_modules.

1. Patches 1 to 5 make "recipetool create" for npm work again on
   master. It failed on the missing checksum, on license values given
   as lists, and on the "@" of scoped names. The selftest expected an
   old value of S.
2. lib/oe/npm gives the SRC_URI entries for the dependencies of a
   shrinkwrap file, with unit tests.
3. The new class npm-update-dependencies writes these entries to
   ${BPN}-npm-deps.inc, like the cargo and Go update classes.
4. npm.bbclass checks that SRC_URI matches the shrinkwrap file, as
   Richard asked. It fails with a hint to run the update task.
5. recipetool runs do_clean after the tasks that it runs for the new
   recipe. Else devtool leaves stale stamps of do_unpack behind.
6. recipetool creates the recipe with the explicit list.

This series needs the two patches of the bitbake series "fetch/npm: no
npm executable, and an event log fix" [2]. Without "fetch/npm: Build
the tarball URL without the npm executable", the npm fetcher still
calls the npm executable of the host. Without "cooker: Write variables
that are not JSON types to the event log", the recipetool selftest
fails.

Two points for review:

- The check also applies to a recipe without npmsw:// that has
  node_modules in its source tree. I do not know of such a recipe.
  If there is one, an opt-out variable is simple to add.
- This series does not deprecate npmsw://. That can follow if you
  want it.

Tests on master with the two bitbake patches: oe-selftest -r oelib.npm
recipetool.RecipetoolCreateTests.test_recipetool_create_npm
devtool.DevtoolAddTests.test_devtool_add_npm pass. A build of
node-server-example with the explicit list installs all 72
dependencies. With one entry removed, do_configure fails and names it.

[1] https://lore.kernel.org/openembedded-core/20261111115845.1940227-1-stondo@gmail.com/T/
[2] https://lore.kernel.org/bitbake-devel/20261120135323.2627478-1-stondo@gmail.com/

Stefano Tondo (10):
  recipetool: create_npm: Give the fallback licenses as a string
  recipetool: create: Get the checksum of npm packages from the registry
  recipetool: create_npm: Give the package fallback licenses as strings
  recipetool: create_npm: Remove the "@" of a scope from generated names
  oeqa/selftest: recipetool: Expect the npm source in UNPACKDIR
  lib/oe/npm: Add SRC_URI entries for the dependencies of a shrinkwrap
    file
  npm-update-dependencies: Add a class to list the npm dependencies
  npm: Check that SRC_URI lists all dependencies of the shrinkwrap file
  recipetool: create: Clean the recipe after its tasks
  recipetool: create_npm: List the npm dependencies in SRC_URI

 .../npm-update-dependencies.bbclass           |  48 +++++++
 meta/classes-recipe/npm.bbclass               |  24 ++++
 meta/lib/oe/npm.py                            |  99 ++++++++++++++
 meta/lib/oeqa/selftest/cases/oelib/npm.py     | 121 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/recipetool.py    |  22 +++-
 scripts/lib/recipetool/create.py              |  31 +++++
 scripts/lib/recipetool/create_npm.py          |  62 ++++++---
 7 files changed, 384 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes-recipe/npm-update-dependencies.bbclass
 create mode 100644 meta/lib/oe/npm.py
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/npm.py

-- 
2.56.1

