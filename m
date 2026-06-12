Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3F4CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 20:35:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79268.1781296519128728577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 13:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2896E40C8E;
	Fri, 12 Jun 2026 20:35:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9xXhIpUm0zv; Fri, 12 Jun 2026 20:35:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F147940BA8;
	Fri, 12 Jun 2026 20:35:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE00B176DAB; Fri, 12 Jun 2026 16:35:15 -0400 (EDT)
Date: Fri, 12 Jun 2026 16:35:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [PATCH] wayland-protocols: upgrade 1.48
 -> 1.49
Message-ID: <20260612203515.GS23325@denix.org>
References: <20260611175420.3234064-1-denis@denix.org>
 <0101019eb80efbbe-2d83070a-4d4f-49e7-8117-cb0203c3bbea-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101019eb80efbbe-2d83070a-4d4f-49e7-8117-cb0203c3bbea-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 20:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238647

On Thu, Jun 11, 2026 at 07:00:50PM +0000, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/wayland-protocols-upgrade-1.48---1.49.patch
> 
> FAIL: test commit message user tags: Mbox includes one or more GitHub-style 
> username tags. Ensure that any "@" symbols are stripped out of usernames 
> (test_mbox.TestMbox.test_commit_message_user_tags)

FWIW, this is a false positive.


> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

