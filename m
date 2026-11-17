Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4575.1794953132756815271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=l7lnwbzx;
 spf=pass (domain: siemens.com, ip: 52.101.84.22, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0UOVpucC1kxBScHmAp0AOSnu0GITBJ/qI5eW9dpi59OXClN5KIQj7Fyq6hfmxAFyKaSeIyyKfBxxiIgVwnzVM2Ns14vYEkDwHJUq9SRs7AdRg1rwtDM4PkXSQzlVN8Rn+ey1UtORLkkmxWR5ZKq/OPs+DQF7QkjBv+mb7RSc8vFgKlcmRBkxmED4U5iJbAIvrGaKvINa5vA+ULuJmNK3/RjPednKJtXBAO26fBbNOxkYZUKGQIJcCsrEaYgF0cC8nPur0t6nEnbBAAyqbK+sPA63oP+daRQ4IfDyxIsxr3VIv+37euW5M86OfZjLsZqIEkA3YnxrEP2l0InhgDn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EjGVdseD8KZd3vgJnZc9X9zYk8wmRFGz4zwWepRsIw=;
 b=fpOTrJK96MMATIqwuN9xoYu59dclLVV3+Hs+xb5tGOp/VzE2XPt2Fulje3EjLLiaJ/GKkyI/RJyCrRcMmAsvs4/usF6DNt1QegUMFBlmQV3FWlLrXNY6ZcUmQnuMYHOFvnEOjGyFjOkhCAzWmw/QKpnmuSbY5VJAUiV6UZItibFZtIpmcy6oCLewVKo2poL+wX7keqdSPPLm2g8uOxbNzUnwRxYrETsQm+iowfzsYOdoZmdAm7nluSXesBvKDRqfXvx6All+3KPN1tpm51noe9kTDFTsq0+KDsn8W9Xo6O7qtdf4Ym2tmfiGjX72upZCHT6x8tClXPPYyrRfLRmg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EjGVdseD8KZd3vgJnZc9X9zYk8wmRFGz4zwWepRsIw=;
 b=l7lnwbzxgSIWd8/zn/QjVBYRWBVp3DgAI5bZnnmS5eN7c3t2yfh568jWzd9bKLueOIO01vyb5+/HNqsl0SgiKGuQw5mZjqZJv/auGXTdwnjp3nPcaZ3q2s/c6q9Suj6JezeeYSLiKmZAkEksJ+m175nbkwDd+FuxkUfMUaKaeItnBWBdU7nDKGrGSPoo0oGu0NOVILydOyxbt2oweEtCdFta0IurFQHJj4UlsLGcE0+bkwzkNlX3n41t9Vz3hGzLJc7tZOvNnCTg//vk45F9FgaZqNSQoamQ+TQF8E8l5RUtTBzWUcfkRhyUts1186aTJDdV60tkjADktJVKL2XY4g==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI1PR10MB3504.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Tue, 17 Nov
 2026 22:05:28 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0639.006; Tue, 17 Nov 2026
 22:05:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [PATCH v2 2/2] grub: upgrade 2.14 -> 2.16
Thread-Topic: Patchtest results for [PATCH v2 2/2] grub: upgrade 2.14 -> 2.16
Thread-Index: AQHddtr2zCtkg2MQZEOfIp5rvkvfK7cyzHoAgAAFJuA=
Date: Tue, 17 Nov 2026 22:05:28 +0000
Message-ID: <AS8PR10MB50731D92F4B9EB46F42104F0FD7B2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261117213048.842034-2-peter.marko@siemens.com>
 <010101a1eb79bd9d-5570bb0b-ab1e-4163-be5d-d6e3dae7ec2c-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a1eb79bd9d-5570bb0b-ab1e-4163-be5d-d6e3dae7ec2c-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cf0d7d5c-2955-4776-a605-1761aecf03b6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-17T22:04:50Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI1PR10MB3504:EE_
x-ms-office365-filtering-correlation-id: 17f25933-60dd-4a2c-cb3e-08df44f6e3d3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|55112099003|3023799007|11063799006|56012099006|4143699003|261026121527099003|261028144727099003|10067099003|261026140227099003|261022105027099003|38070700021|261022075727099003;
x-microsoft-antispam-message-info: FsQK1RWCiw75DqejVjkNRgYPhKMv2gBrM+iCobgz67fcUj1SFwUbxEijE+Va4FlPZJHx+rn+Q3oyz2MhWl+3bs9102LmNxQ7KkHRVTObMBdE4FXGmwGk5o6gGx4Xc5D6KpiL1c1oWVsB687bIy1iBShhyL0mo6bn+BpHvWNpI/8G/7nfjgbyD75VKOjzQqXBetWpROSNLEje3wlI+5imk6+btY3dnMdsOuP+tfyP/gIFbd2QtQnGvAZatvCdxpwWOLYfjBC/QhHCvty/zSqs5hVUkmc9JNWp1ITjDepgTScOq7DzyNx3IW9F35RcvOSGgjOymfX8kLWmO8XX5bGqL1m9PnE+w2iN9/3oQSUAU9HmgWb1zj4Vro6t4V3zINgRa+FRX5RQY6uclpRM7vxj7h5e7XDAh96l4BpRl3Y4SsKwbpJS4JoaurMGbzRFesYjQbBi5DUwzqS8KxyuiQvmk7+A/E8dpj359NZI1LlOB6DpVG6Fnc+0wSyEdqF91iCcOfE8AsvJrGKRBtc4kO6VXbUEdfGiLDjnU1GTyiWOUxNvr3ztz8u8mB+kL5hpPDkQjZfEzErb24Kzp9FMgOxefkhL8tkbHZIZPBHI6f4rJ5LES8ND7K3kq7DO8LI9aXJR1kstIw9PRiEbE6y/I6uGsk5P+QiJl9B5jIX6gmTJWmc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(55112099003)(3023799007)(11063799006)(56012099006)(4143699003)(261026121527099003)(261028144727099003)(10067099003)(261026140227099003)(261022105027099003)(38070700021)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/UGWfQorZMF+xY6AF/3nq0wRxYLLfoAQAFnKHkdoSQrlCV+o9WxzA3CP01Yw?=
 =?us-ascii?Q?Nf3mZTQHFxnDT/Mo/ZNiYxSNAcMTHWLXUqxcfs1zpJozBPqJH0OHuYXgEyB1?=
 =?us-ascii?Q?Z4onqPqbh7O4Reiz1s6wv4QZbTqvDOvCRuiFapt2scFMOL1aTExJuYgc69K+?=
 =?us-ascii?Q?6/TaZBvULRU9YxgIl6y/u57bbPapCBW00PunOwiAsdsGhjS3OGg32l1RhDU+?=
 =?us-ascii?Q?LmwEznvZHNST9gfzGb5AoQvdklr5GcmjxLLybcLbinIkcy9j8ykKVnUQk2VR?=
 =?us-ascii?Q?ETpha04n0vDQBCUl2sNPRncs3L7MNdnO3E9OvCrvUvqLHhUf8PGyYKOhLRph?=
 =?us-ascii?Q?7UDojnPmBJ8cKl9kIaRK8xWshWYZgQSZTp3KTjaC6SCdV7Mr1NnBHIhNRQ3f?=
 =?us-ascii?Q?Avc6KYiHYsrtY6vhMci55nlQ+VDyFJ/iheY7VJhwgAhAsbVjqIspKCbrc7RG?=
 =?us-ascii?Q?5+gI7W1g4UaC4uWiXPpwjM+M/edrydN7N0axbsb7RxO4K9HjWdefQwfc7d7t?=
 =?us-ascii?Q?Sx36LkgxjmmELE3ib3Q1ozQqND5p8sTYz8E69tw7MuWM7BiBFcjngw/D7vck?=
 =?us-ascii?Q?AKDUVJK+SVjF5CR+/gaH6843wQRFbd8YuqrvHg0r+agxhAvbWcrk0hB4ZyTj?=
 =?us-ascii?Q?sijD6urXCVILfQ8RMDQSNWBbmlpbOBe0Ei1ece8inKI2im/R1ciSBh92VFg4?=
 =?us-ascii?Q?pSvnAPVCIapRB0gWwiF5AMjR8Ud3klQfAdFbSmLSobMQPyRIzwDYayKoPXUG?=
 =?us-ascii?Q?MY9ZnWxBzc52NWMwdpETJZ+FE6lHdKL7Nh+92CJbCD1ddX3e7EalEfiil7L9?=
 =?us-ascii?Q?YJ+dPLRYKBqveXmyRYfda385vC9PhsBfOyanSYCROMT8H3GNhERUaIZU0NBM?=
 =?us-ascii?Q?wC9SNpek6TlT29Zf32EflVYuVqPm1ywjU/yGcnKzOBlOOCBZLfcezGcjikzZ?=
 =?us-ascii?Q?O4GZlvvafwpNeqIH6pTFAHjn8ppc7JlBOlIHbtrkTBnz5cupiF9QcpihdhaV?=
 =?us-ascii?Q?ySle9j4qNhfwzNBzLK6Tzf/H0VYJXCmGVzVaNnWMxzKVDPsSRwMoyHe5CKEk?=
 =?us-ascii?Q?u9n/J94hPopn/i9qhbANiPm4yD1LjSFg2ixTW5gDLLXG/FGardEVIc4JtxIw?=
 =?us-ascii?Q?V2W3AEIU4qc40Sv3QLuLT1HzJfmktt95Z10D+00rjwq7HbUOIti97Iv5vxHj?=
 =?us-ascii?Q?N5a1LmlHTlnKntNuoEw5xvPjdKM06kCe3t59+SIaARMzDvYb+BMVV78S6tiG?=
 =?us-ascii?Q?AewGg3W5m/CZRtMNUkfOUsFXVdxVKk+HcV7KcwY0QqOl3vbSd3lozDUXSzbc?=
 =?us-ascii?Q?pzH1IBmhY9ODGQB5274x/7XY8iz0tWDnpzm7qQBi2JIIgAozYLdTDMr9/gOV?=
 =?us-ascii?Q?1+FDr1fVl40CIJpIAL86xOz540ccM/jJ57v6J5FGVzK+chLlWqK/DqmhDoiC?=
 =?us-ascii?Q?pVGuuYy7IsR4K2mABrfyUhBwbDrkfKQRX29u215hVlw68R7uRFbc/vd9zhhy?=
 =?us-ascii?Q?h5SxdOASEbT3e2BhsHQ/cssuhXDtDFjSoMSY36hy008Gx5ZEPCPP9NFX31ah?=
 =?us-ascii?Q?igRXu5ik4u5U/0tkv5NhtS1JCTCzGzJBFF7dvFdMppVWYrpDKMLYM5m+xM0r?=
 =?us-ascii?Q?sXb87vtx/W5/wLP32oNAlKaPvohdNRiOZ6chqf7+g48HhfyKsxg6NF6T0Azh?=
 =?us-ascii?Q?cOSJSs2JGRuAq+RrpKNLd9Wr63AUA8VjE3YVTjkckNR0Olkx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f25933-60dd-4a2c-cb3e-08df44f6e3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 22:05:28.4522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PzOegP9j3KT4P0IvIVjeC5OVa9pLAXOng0nT7tTCv1PD3sIfGnGzVNw76tzUub7UCZsXf4cN4NVGUIglxDQRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 22:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250497

This is false positive, upgrade does not add CVE patch.

> -----Original Message-----
> From: patchtest@automation.yoctoproject.org
> <patchtest@automation.yoctoproject.org>
> Sent: Tuesday, November 17, 2026 10:46 PM
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [PATCH v2 2/2] grub: upgrade 2.14 -> 2.16
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/v2-2-2-grub-upgrade-2.14---2.1=
6.patch
>=20
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file.
> Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-X=
XXX"
> (test_patch.TestPatch.test_cve_tag_format)
>=20
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ig=
nore)
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence
> (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence
> (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test auh changelog truncation notice
> (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags
> (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_leng=
th)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: Patch cannot be merged
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
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
> SKIP: test src uri left files: Patch cannot be merged
> (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
>=20
> ---
>=20
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
