Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99563C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:02 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.580.1700498335648120440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W58p7xAm;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b0683ff3c8so145822739f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498334; x=1701103134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoGzo/SJWA9OPRYF+AqCGCunEjJdDZyvAeirG45JBV0=;
        b=W58p7xAmoJhVe486KuK1bjexNewcEBT2JyHvxdBXnIVBSf2qo/36sTwyHx6stIw+sG
         M3b4fQjO43U5iGOa4H/WwqlrPgcp9s9ggQRmtV0UjvHebS9cHGvAsBN0PrSQjPvhG++S
         aNjM6xTl/By2i3H47vYKrMDTsHXBzyh5F7c25Cvm4HRj+I1L7dmQYE2J91+762iWJeaB
         WAa6vVl1ISsIFN5Ua3qP0wsks38x0kwxlDd9uw9ke2SvMqbIO9Ti6pDMgw9Qdpbss33p
         burotKDDrGYt9mwZ2+ZI2JmWDc1/UFZr0Ge9VdFJ8tObViKk7S5ZJMmFyFGZQfKiI4Jq
         0yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498334; x=1701103134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoGzo/SJWA9OPRYF+AqCGCunEjJdDZyvAeirG45JBV0=;
        b=KftFL79NiVv1GGK1MMuurRZhAI4UU8Rnp4JeN/WVsiPAWkFuQxl6eAn5rH6JHWG7eB
         lT4+/V9Z3ATLD4hV5xtYcu9m+LmnkWHg89gW7v9TlFQSo+BdqJPTKwikC1eQmVA1gnVZ
         j2i4lzqvPjB9Zihg5rW4vGZA+2KL4dQp1LLRoJdTeiZn9q2ZSsThjCOJRj3EosjYJdpV
         De7HgFzntcc9sk+6s4zjfgnnPAoqacDO1chN5s/YGfB6fb3AT9X7J9htolszPO8Ongih
         tM1cR2eRFo4Snh38qYD3jXjVezc6yCLxBnrDmfMabVXp1HN+xiTNpFBVxfQtmxxD2FI7
         y+JA==
X-Gm-Message-State: AOJu0Yye+vmweLjXU98xAprI15rTEKjXTUtkO4Lvl7c455SPKrqjS1Ei
	4dGy3Oj7g6SUfI8I5kxoSvL1Sx77yHqzNmcYFrMJOQ==
X-Google-Smtp-Source: AGHT+IEkkFB8OADXcA4GldJHMrEg5VtwT0bzVxxf+6CZPTlYmjhUZYq/vS8ZpmoEmsbP9YuUpaMRtg==
X-Received: by 2002:a05:6e02:b4d:b0:34f:2756:8fd with SMTP id f13-20020a056e020b4d00b0034f275608fdmr10287609ilu.9.1700498333894;
        Mon, 20 Nov 2023 08:38:53 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.38.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:38:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/33] Patch review
Date: Mon, 20 Nov 2023 06:38:14 -1000
Message-Id: <cover.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190889

Please review this set of changes for nanbield and have comments back by
end of day Wednesday, November 22

Mostly passed a-full:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6216

with the exception of known autobbuilder intermittent issues:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15005
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15166
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15286

These intermittent issues are making life painful for your Yocto maintainers,
any help in resolving them would bring smiles back to their faces :-)


The following changes since commit 28e6fde4627ffd053dde8a8d44441a40dafd545c:

  layer.conf: Switch layer to nanbield series only (2023-11-09 17:09:43 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Alejandro Hernandez Samaniego (1):
  baremetal-helloworld: Pull in fix for race condition on x86-64

Alex Stewart (1):
  libsndfile1: fix CVE-2022-33065

Joshua Watt (1):
  goarch: Move Go architecture mapping to a library

Julien Stephan (1):
  oeqa/selftest/devtool: abort if a local workspace already exist

Khem Raj (2):
  llvm: Upgrade to 17.0.3
  kernel.bbclass: Use strip utility used for kernel build in do_package

Max Krummenacher (1):
  Revert "bin_package.bbclass: Inhibit the default dependencies"

Peter Kjellerstedt (1):
  bb-matrix-plot.sh: Show underscores correctly in labels

Peter Marko (1):
  openssl: Upgrade 3.1.3 -> 3.1.4

Richard Purdie (1):
  base: Ensure recipes using mercurial-native have certificates

Ross Burton (1):
  patchtest: remove unused imports

Rouven Czerwinski (1):
  glib-2.0: Remove unnecessary assignement

Trevor Gamblin (16):
  patchtest: test regardless of mergeability
  patchtest: skip merge test if not targeting master
  patchtest: fix lic_files_chksum test regex
  patchtest-send-results: improve subject line
  patchtest: disable merge test
  patchtest-send-results: check max line length, simplify responses
  patchtest/selftest: add XSKIP, update test files
  patchtest: simplify test directory structure
  patchtest: reduce checksum test output length
  patchtest: shorten test result outputs
  patchtest-send-results: send results to submitter
  patchtest-send-results: add In-Reply-To
  patchtest: make pylint tests compatible with 3.x
  patchtest: remove test for CVE tag in mbox
  patchtest-send-results: fix sender parsing
  patchtest: rework license checksum tests

Wang Mingyu (2):
  ell: upgrade 0.58 -> 0.59
  libsdl2: upgrade 2.28.3 -> 2.28.4

William Lyu (1):
  perl: fix intermittent test failure

Xiangyu Chen (1):
  linux-yocto: make sure the pahole-native available before
    do_kernel_configme

luca fancellu (1):
  oeqa/ssh: Handle SSHCall timeout error code

 meta/classes-global/base.bbclass              |   2 +-
 meta/classes-recipe/bin_package.bbclass       |   3 -
 meta/classes-recipe/goarch.bbclass            |  29 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/lib/oe/__init__.py                       |   2 +-
 meta/lib/oe/go.py                             |  34 +
 meta/lib/oeqa/core/target/ssh.py              |  17 +-
 meta/lib/oeqa/runtime/cases/ssh.py            |   3 +
 meta/lib/oeqa/selftest/cases/devtool.py       |   3 +
 meta/lib/patchtest/data.py                    |   1 -
 meta/lib/patchtest/repo.py                    |   1 -
 ...E.test_cve_presence_in_commit_message.fail |  72 --
 ...E.test_cve_presence_in_commit_message.pass |  74 --
 ...fail => TestMbox.test_author_valid.1.fail} |   0
 ...pass => TestMbox.test_author_valid.1.pass} |   0
 ...fail => TestMbox.test_author_valid.2.fail} |   0
 ...pass => TestMbox.test_author_valid.2.pass} |   0
 ... TestMbox.test_bugzilla_entry_format.fail} |   0
 ... TestMbox.test_bugzilla_entry_format.pass} |   0
 ...estMbox.test_commit_message_presence.fail} |   0
 ...estMbox.test_commit_message_presence.pass} |   0
 ....fail => TestMbox.test_mbox_format.1.fail} |   0
 ....fail => TestMbox.test_mbox_format.2.fail} |   0
 ...at.pass => TestMbox.test_mbox_format.pass} |   0
 ...TestMbox.test_series_merge_on_head.1.skip} |   0
 ...TestMbox.test_series_merge_on_head.2.skip} |   0
 ...ail => TestMbox.test_shortlog_format.fail} |   0
 ...ass => TestMbox.test_shortlog_format.pass} |   0
 ...ail => TestMbox.test_shortlog_length.fail} |   2 +-
 ...ass => TestMbox.test_shortlog_length.pass} |   0
 ...stMbox.test_signed_off_by_presence.1.fail} |   0
 ...stMbox.test_signed_off_by_presence.2.fail} |   0
 ...TestMbox.test_signed_off_by_presence.pass} |   0
 ..._files_chksum_modified_not_mentioned.fail} |   0
 ..._files_chksum_modified_not_mentioned.pass} |   0
 ...adata.test_lic_files_chksum_presence.fail} |   0
 ...adata.test_lic_files_chksum_presence.pass} |   0
 ...TestMetadata.test_src_uri_left_files.fail} |   0
 ...TestMetadata.test_src_uri_left_files.pass} |   0
 ...> TestMetadata.test_summary_presence.fail} |   0
 ...> TestMetadata.test_summary_presence.pass} |   0
 ...ail => TestPatch.test_cve_tag_format.fail} |   0
 ...ass => TestPatch.test_cve_tag_format.pass} |   0
 ...estPatch.test_signed_off_by_presence.fail} |   0
 ...estPatch.test_signed_off_by_presence.pass} |   0
 meta/lib/patchtest/selftest/selftest          |  11 +-
 ...{test_mbox_mailinglist.py => test_mbox.py} | 114 ++-
 meta/lib/patchtest/tests/test_mbox_author.py  |  29 -
 .../lib/patchtest/tests/test_mbox_bugzilla.py |  20 -
 meta/lib/patchtest/tests/test_mbox_cve.py     |  39 -
 .../patchtest/tests/test_mbox_description.py  |  15 -
 meta/lib/patchtest/tests/test_mbox_format.py  |  14 -
 meta/lib/patchtest/tests/test_mbox_merge.py   |  24 -
 .../lib/patchtest/tests/test_mbox_shortlog.py |  39 -
 .../tests/test_mbox_signed_off_by.py          |  27 -
 meta/lib/patchtest/tests/test_metadata.py     | 180 +++++
 .../tests/test_metadata_lic_files_chksum.py   |  80 --
 .../patchtest/tests/test_metadata_license.py  |  55 --
 .../tests/test_metadata_max_length.py         |  25 -
 .../patchtest/tests/test_metadata_src_uri.py  |  74 --
 .../patchtest/tests/test_metadata_summary.py  |  31 -
 ...patch_upstream_status.py => test_patch.py} |  56 +-
 meta/lib/patchtest/tests/test_patch_cve.py    |  38 -
 .../tests/test_patch_signed_off_by.py         |  41 -
 .../lib/patchtest/tests/test_python_pylint.py |  19 +-
 meta/lib/patchtest/utils.py                   |   1 -
 .../{openssl_3.1.3.bb => openssl_3.1.4.bb}    |   2 +-
 .../ell/{ell_0.58.bb => ell_0.59.bb}          |   2 +-
 meta/recipes-core/glib-2.0/glib.inc           |   5 -
 meta/recipes-devtools/llvm/llvm_git.bb        |   4 +-
 ...ent-failure-of-test-t-op-sigsystem.t.patch |  77 ++
 meta/recipes-devtools/perl/perl_5.38.0.bb     |   1 +
 .../baremetal-helloworld_git.bb               |   2 +-
 .../{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb}  |   2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   5 +-
 .../libsndfile1/cve-2022-33065.patch          | 739 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 scripts/contrib/bb-perf/bb-matrix-plot.sh     |   4 +-
 scripts/patchtest                             |   1 -
 scripts/patchtest-get-branch                  |   1 -
 scripts/patchtest-send-results                |  70 +-
 81 files changed, 1290 insertions(+), 803 deletions(-)
 create mode 100644 meta/lib/oe/go.py
 delete mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.fail
 delete mode 100644 meta/lib/patchtest/selftest/files/CVE.test_cve_presence_in_commit_message.pass
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.1.fail => TestMbox.test_author_valid.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.1.pass => TestMbox.test_author_valid.1.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.2.fail => TestMbox.test_author_valid.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Author.test_author_valid.2.pass => TestMbox.test_author_valid.2.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Bugzilla.test_bugzilla_entry_format.fail => TestMbox.test_bugzilla_entry_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Bugzilla.test_bugzilla_entry_format.pass => TestMbox.test_bugzilla_entry_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{CommitMessage.test_commit_message_presence.fail => TestMbox.test_commit_message_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{CommitMessage.test_commit_message_presence.pass => TestMbox.test_commit_message_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.1.fail => TestMbox.test_mbox_format.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.2.fail => TestMbox.test_mbox_format.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{MboxFormat.test_mbox_format.pass => TestMbox.test_mbox_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.pass => TestMbox.test_series_merge_on_head.1.skip} (100%)
 rename meta/lib/patchtest/selftest/files/{Merge.test_series_merge_on_head.fail => TestMbox.test_series_merge_on_head.2.skip} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_format.fail => TestMbox.test_shortlog_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_tag_format.pass => TestMbox.test_shortlog_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_length.fail => TestMbox.test_shortlog_length.fail} (97%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_format.pass => TestMbox.test_shortlog_length.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.1.fail => TestMbox.test_signed_off_by_presence.1.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.2.fail => TestMbox.test_signed_off_by_presence.2.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{PatchSignedOffBy.test_signed_off_by_presence.pass => TestMbox.test_signed_off_by_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.fail => TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned.pass => TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_presence.fail => TestMetadata.test_lic_files_chksum_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{LicFilesChkSum.test_lic_files_chksum_presence.pass => TestMetadata.test_lic_files_chksum_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{SrcUri.test_src_uri_left_files.fail => TestMetadata.test_src_uri_left_files.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SrcUri.test_src_uri_left_files.pass => TestMetadata.test_src_uri_left_files.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{Summary.test_summary_presence.fail => TestMetadata.test_summary_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Summary.test_summary_presence.pass => TestMetadata.test_summary_presence.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{CVE.test_cve_tag_format.fail => TestPatch.test_cve_tag_format.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{Shortlog.test_shortlog_length.pass => TestPatch.test_cve_tag_format.pass} (100%)
 rename meta/lib/patchtest/selftest/files/{PatchSignedOffBy.test_signed_off_by_presence.fail => TestPatch.test_signed_off_by_presence.fail} (100%)
 rename meta/lib/patchtest/selftest/files/{SignedOffBy.test_signed_off_by_presence.pass => TestPatch.test_signed_off_by_presence.pass} (100%)
 rename meta/lib/patchtest/tests/{test_mbox_mailinglist.py => test_mbox.py} (40%)
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_author.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_bugzilla.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_cve.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_description.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_format.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_merge.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_shortlog.py
 delete mode 100644 meta/lib/patchtest/tests/test_mbox_signed_off_by.py
 create mode 100644 meta/lib/patchtest/tests/test_metadata.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_license.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_max_length.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_src_uri.py
 delete mode 100644 meta/lib/patchtest/tests/test_metadata_summary.py
 rename meta/lib/patchtest/tests/{test_patch_upstream_status.py => test_patch.py} (55%)
 delete mode 100644 meta/lib/patchtest/tests/test_patch_cve.py
 delete mode 100644 meta/lib/patchtest/tests/test_patch_signed_off_by.py
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)
 rename meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} (89%)
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb} (97%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/cve-2022-33065.patch

-- 
2.34.1


