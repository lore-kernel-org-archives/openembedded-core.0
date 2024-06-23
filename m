Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458C3C2BA18
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 18:43:36 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.123691.1719168211786140302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 11:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=Rzsn8CMt;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 03671240027
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 20:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1719168209; bh=Y8TbXzbleuF1LlMFdLcSiXgokMPk554/zhTp49LODYg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=Rzsn8CMtgt2NnuniUnu40tLBR/iQ4ZOC2gxI0hpY5kt551LuWu/zVSJrxxwTPkbjn
	 q+ktFXhMTHqsmz0xfP0CPYGVUZZJfTVMyM1VCM+f2zgCQwQjlJqPObCXB7IuAJA1gU
	 SkHx3Uza8o3JJpH3cDqqkkGBdUIZTIlvLbjHEftmL78oSzzs9HGdlukNoX0d1POdYJ
	 U0pXnqjS0dYMok1rg/ghR7tKD5++YQ+WCGMo2WCmpwlQfarIrbEUjSEij6qk/m4IJs
	 mNkWUW7l0sRHmVjjQPN8IlPV58q6fh606q7u8FUfX6pHwDTssz2Hv8A0CnVcXdQCoj
	 3XJZACQ02bJtg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4W6g336NBcz6txy;
	Sun, 23 Jun 2024 20:43:27 +0200 (CEST)
Message-ID: <5eb87ad3787027419943ef7ead4c1146a41d4b76.camel@posteo.net>
Subject: Re: Patchtest results for [PATCH] go: upgrade 1.22.3 -> 1.22.4
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: patchtest@automation.yoctoproject.org, simone.p.weiss@posteo.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2024 18:43:27 +0000
In-Reply-To: <0101019045c960ce-675f3fd5-638d-4e44-b087-f56bd049e3f6-000000@us-west-2.amazonses.com>
References: <20240623153658.1085605-1-simone.p.weiss@posteo.com>
	 <0101019045c960ce-675f3fd5-638d-4e44-b087-f56bd049e3f6-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 18:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201056

This is a false positive right?
On Sun, 2024-06-23 at 15:49 +0000, patchtest@automation.yoctoproject.org
wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/go-upgrade-1.22.3---
> 1.22.4.patch
>=20
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it
> manually or with "git commit --amend -s"
> (test_mbox.TestMbox.test_signed_off_by_presence)
>=20
> PASS: pretest src uri left files
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore
> (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum modified not mentioned
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned
> )
> PASS: test max line length
> (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files
> (test_metadata.TestMetadata.test_src_uri_left_files)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced
> (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced
> (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced
> (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other
> mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>=20
> ---
>=20
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/=C2=A0(use the 'Patchtest' categ=
ory
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


