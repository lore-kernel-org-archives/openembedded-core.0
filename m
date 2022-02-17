X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 00/14] Patch review
Date: Thu, 17 Feb 2022 22:18:09 +0800
Message-Id: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Next set of changes for hardknott. Please review.

No problems seen while testing on autobuilder except for an intermittent
failure for qemuppc-alt.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3229

Thanks,

Anuj

The following changes since commit a32cee6c9e1ff53e424b8386c36555e6cf3bf3af:

  expat: add missing Upstream-status, CVE tag and sign-off to CVE-2021-46143.patch (2022-02-07 11:01:23 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Anuj Mittal (1):
  runtime_test: skip virgl test on fedora 34

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.96
  linux-yocto/5.10: update to v5.10.99
  linux-yocto/5.4: update to v5.4.173
  linux-yocto/5.4: update to v5.4.176
  linux-yocto/5.4: update to v5.4.178

Christian Eggers (1):
  sdk: fix search for dynamic loader

Daniel Müller (1):
  scripts/runqemu-ifdown: Don't treat the last iptables command as
    special

Pgowda (1):
  glibc: upgrade glibc-2.33 to latest version

Richard Purdie (1):
  default-distrovars.inc: Switch connectivity check to a
    yoctoproject.org page

Ross Burton (2):
  vim: update to include latest CVE fixes
  vim: upgrade to patch 4269

Saul Wold (1):
  recipetool: Fix circular reference in SRC_URI

Stefan Herbrechtsmeier (1):
  cve-check: create directory of CVE_CHECK_MANIFEST before copy

 meta/classes/cve-check.bbclass                |  1 +
 meta/classes/sanity.bbclass                   |  2 +-
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/files/toolchain-shar-relocate.sh         |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  3 +++
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 meta/recipes-support/vim/vim.inc              |  4 ++--
 scripts/lib/recipetool/create.py              |  2 +-
 scripts/runqemu-ifdown                        |  1 +
 15 files changed, 49 insertions(+), 44 deletions(-)

-- 
2.35.1

