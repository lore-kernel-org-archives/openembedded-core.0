Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D63C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 15:25:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2169.1701444339448699123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 07:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GscRcKxd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HE9EctF8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c25fc4309-193d5f29-9314-4d21-af26-3d689cf9e0bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701444338; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=AwiVIUpu97uWnKhflC/iQ7MF2LmuuQt42+FwYES08ZY=;
	b=GscRcKxdbJiXecKsYunPmPkZj8Ipib2IekiOJdb4q2+ewBCuGEB9jzh0mZO0XI9h
	wsGZ75ycBVzGSLMvwLC2xmVo7ggX3cgrRqMhctkP6xuiLEkS5W5CXUw4cbZbtBtsoii
	/LDw6MV9u1ah3JCkH0SOYtf0P7WUwxqFXDVlAbOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701444338;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=AwiVIUpu97uWnKhflC/iQ7MF2LmuuQt42+FwYES08ZY=;
	b=HE9EctF8nooC0Om5Y5OMVXtoYNP/BOlmatFC0XZ7ugnRg86rwvPRP2BL2ztayMkG
	jMkmGHe0B7gbj09XI/01fnd5BvKb34vhJaQOsYHe+hRQ0bijurzTRJV5mswLK6OpP+z
	iRxjFQCQJJ96gxtC2nVerJd9QiS+R2+5ibSHKoOk=
From: patchtest@automation.yoctoproject.org
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line to
 set systemd readiness notification support
In-Reply-To: 20231201140947.792594-1-xiangyu.chen@eng.windriver.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c25fc4309-193d5f29-9314-4d21-af26-3d689cf9e0bc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 15:25:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 15:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191672

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/openssh-shrinking-to-a-new-PACKAGECONFIG-line-to-set-systemd-readiness-notification-support.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 100 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--NextPart


--NextPart--

