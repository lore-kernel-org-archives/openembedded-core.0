Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C143DC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 05:35:47 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.16709.1709789743132036623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 21:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=rY/dh1c9;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C179C240101
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 06:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1709789740; bh=e7fD4YxRWWVERG1t82SCyO5vDPqbWT+fh8xGm6J9VZg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=rY/dh1c90WVtI2n6v5K8VhNntwyOs6ue9ZgQCC7l8IYVtDSZWVWZdS8dxNwKK52Oq
	 EukVvzT//n60BBZh1MQYn8iGxgUmS/XCtc0rKqamkqXqZ0wJ0PqqfTKvXjizCkAGKt
	 NM9tbyvXzTSLQxXLmF6f+Zi2lzY4HuNQynqm11XLXEg+JmFU+WtRqd3XIq4cyrv61W
	 /B5z2o28uSxYEzDQdD++Or+F17b0w0N8fvYdliP6/FVOOKwdNavdtAWafVpyqx1bfM
	 C9DdqYsq34jvGnyt5qnBcLF9cRlRvxawAih4TW/6oTDdnT+OuVnFgzt0fV6tjuelZ6
	 Htxj149RoTSBw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tqygv52jrz6tvs;
	Thu,  7 Mar 2024 06:35:39 +0100 (CET)
Message-ID: <f7c686154f1cf8119a7eb0fb66521f8a51ef3c75.camel@posteo.net>
Subject: Re: Patchtest results for [OE-core][PATCH 2/2] systemd: remove
 systemd-bus-proxy settings
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Qi.Chen@windriver.com, "patchtest@automation.yoctoproject.org"
	 <patchtest@automation.yoctoproject.org>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Mar 2024 05:35:39 +0000
In-Reply-To: <CO6PR11MB56024BD76AC17EDD3D7A9B6CED202@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240307022708.2061916-2-Qi.Chen@windriver.com>
	 <0101018e16c415d0-38b988bc-f84e-401f-9bc0-4bdf1d92817b-000000@us-west-2.amazonses.com>
	 <CO6PR11MB56024BD76AC17EDD3D7A9B6CED202@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 05:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196767

On Wed, 2024-03-06 at 19:19 -0800, Chen Qi via lists.openembedded.org
wrote:
> Is this a patchtest bug? I can see the 'Signed-off-by:' is there.
>=20
> Regards,
> Qi
>=20
Yes, see also 15341 in Bugzilla

Cheers,
Simone
> -----Original Message-----
> From:
> patchtest@automation.yoctoproject.org=C2=A0<patchtest@automation.yoctopro=
ject.org
> >
> Sent: Thursday, March 7, 2024 10:36 AM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][PATCH 2/2] systemd: remove
> systemd-bus-proxy settings
>=20
> Thank you for your submission. Patchtest identified one or more issues
> with the patch. Please see the log below for more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/2-2-systemd-remove-systemd-
> bus-proxy-settings.patch
>=20
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it
> manually or with "git commit --amend -s"
> (test_mbox.TestMbox.test_signed_off_by_presence)
>=20
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length
> (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch,
> skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced
> (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced
> (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced
> (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes,
> skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned
> )
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest
> (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other
> mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>=20
> ---
>=20
> Please address the issues identified and submit a new revision of the
> patch, or alternatively, reply to this email with an explanation of why
> the patch should be accepted. If you believe these results are due to an
> error in patchtest, please submit a bug at
> https://bugzilla.yoctoproject.org/=C2=A0(use the 'Patchtest' category und=
er
> 'Yocto Project Subprojects'). For more information on specific failures,
> see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank you!
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196764):
> https://lists.openembedded.org/g/openembedded-core/message/196764
> Mute This Topic: https://lists.openembedded.org/mt/104780624/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


