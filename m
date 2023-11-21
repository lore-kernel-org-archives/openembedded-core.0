Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7A5C5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 08:00:28 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.31206.1700553620562668255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 00:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eMNv//y5;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c878e228b4so30246591fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 00:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553619; x=1701158419; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/TSpl0hFokMLjr+hp9zTWzl8qnZIoTqPGoIhicZG7Q=;
        b=eMNv//y5mPqMeBwRfsVLZGGhG2HP1wQelQY+NbudCF0+P9f0H6vmy7RMjpe+ciiZsr
         oWadWHZs7Kz6AbZZewwjBiwFP2JutAO3f1ewgj5tpRb7ip6bQW0m0+eQlPWtetzziXb6
         /tFpa4AbmA5b2EfbjFYfiUgy10H3uu9MAyHZiL8EQhQAHBU+v4YZ6dGvvrn7O/HoehUz
         8N7+deD6TXMf8mI8swcQm7A/u5N7+RP7F0ULptr+/JpC4IOXi9qqEPiYeP80cI7MFHJl
         qTQdSRQa0b+7G5mLf/0f5hvvINCJcHSvY+DfS+9mRyYvgqFeLTzg2DuOVIH+fGl+d2n3
         4Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553619; x=1701158419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/TSpl0hFokMLjr+hp9zTWzl8qnZIoTqPGoIhicZG7Q=;
        b=cQUjKbXGjw1LGHoa9j2o1Ji8bKOT6dEoOHdAtbyW9yoTjXM8rhs8X/8I3mjszp/gXs
         KfaiuNKvWIYU9+6Z/Tnx+bC/8PXSKoZ79r2b5uN2C8DfTbhwt5euE734Y0z3J22TjpeP
         7zswe4OaJ252IkgmeQn9qCUxKEoHWvceBxhB1vjZeVaYJNwbKWOIQ2/8upFDAQx57WVo
         pMTdzPTLByDLPeThzockUxFzwePuMoOL8t8jcDa0PyS7OJq7B5WinBeb0D0u6gF+rDHM
         nq8hKKYMQO4ETeisIiv5a4ffFbiv2qQvNziI2zbaPqp/Px6urt0bAtrSnM8V494XjKJn
         cJ1Q==
X-Gm-Message-State: AOJu0YynEnXyr0+M7U/C9xrd3l2embR+IIe1g31o69P27WGIqUQ8H4VE
	bvKo0JOlhZAxiKT+rMS8UoO3C7GYYfagscKwqwY=
X-Google-Smtp-Source: AGHT+IGg0dQN7Hx+rY+L4BaWuEHwMZp0hCHQE/ZoFnQ3KIkAwpTZOKkCwuNW6GvKWSiTMgzWM0bKQb5qovfa0Gw/cto=
X-Received: by 2002:a2e:9455:0:b0:2c5:f8e:35cf with SMTP id
 o21-20020a2e9455000000b002c50f8e35cfmr6446202ljh.20.1700553618418; Tue, 21
 Nov 2023 00:00:18 -0800 (PST)
MIME-Version: 1.0
References: <0101018bf06c726b-47a74868-453e-4133-a8f3-73401e13113b-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018bf06c726b-47a74868-453e-4133-a8f3-73401e13113b-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 09:00:07 +0100
Message-ID: <CANNYZj_k9tAPiCumFfmOTCJgPLQ8WabGUmWpwsQ=sySfSOErFg@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH] vulkan: upgrade 1.3.261.1
 -> 1.3.268.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 08:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190955

Looks like another corner case issue - a new recipe is being added,
which seems to be mistaken for changing a license in existing recipe.

Alex


On Tue, 21 Nov 2023 at 06:48, Patchtest
<patchtest@automation.yoctoproject.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/vulkan-upgrade-1.3.261.1---1.3.268.0.patch
>
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum presence (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> PASS: test license presence (test_metadata.TestMetadata.test_license_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
> PASS: test summary presence (test_metadata.TestMetadata.test_summary_presence)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190954): https://lists.openembedded.org/g/openembedded-core/message/190954
> Mute This Topic: https://lists.openembedded.org/mt/102723560/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

