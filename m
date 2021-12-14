Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E9AC433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:39:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.10])
 by mx.groups.io with SMTP id smtpd.web08.28227.1639499976576246432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=pyMBDI9n;
 spf=pass (domain: outlook.com, ip: 40.92.89.10,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj0h/jW7DoLOGpX3Wg+WU/Af1zXWO80+CNdLck4mD2JxryqOkux9Oao4qq3/vLNNGt9n8DeSveUvuT10Ivy5tI/8Rs+t2WfUXE23yqZCWTXQ28L6hu5hVAOaLtI/2lx90yI3miOUly/7huaFf26Nm/pcJC6Csx7cgToFPapQPi7iSskSEMtCkoQ5LqBYudrGiyl9bahc9OLRqgH7ZQKEgGUju9OBQCm25TH2jbz5NyKTr41KIcB38oWCoSrztFLew+v/JvKuqJNqEahC6cUHMaX4iEJlQbdFbeTe8hgg3DrDy7/h1/q0z/UvIx8/nFF+W35uRIp5DxgJ4S62IJLXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij9Izmzhh1r3t/W9tM759VvK741dP9ih7CWUzdRr8sU=;
 b=EQ0a8JjTiZoUe9UsSAxyzlxESnc44QZJPSsezdfJpEfdW3eBnlOthl8w9zZyGOauoKJ58LIizvW7t0811ElGOnCG0RXHMhiWTR63blQX7HHVB/t3KjFy5c5cV63VGzFgmupJu3tCltZJ13ltFAtyxznURPjg6J9ffFjwQ9fQ7IvAR+Vk7gT4DKlzU5eogVHpgduzOMJiyPuma7VyM9cZkI4j+1PfQCOB8R9JbN3Svwtrg3cIqIiaUESptaZVM75fPHX42Jc6yPWnpUIFKseKpor/IAmzj2vJZUIs+wxFuuf6Ilg++YplCBqxuvsnRkipjw7QJaVqBVprjmfg3PKWXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij9Izmzhh1r3t/W9tM759VvK741dP9ih7CWUzdRr8sU=;
 b=pyMBDI9n3ccnw1ASf40TacvMmm42C0e/kNzEIL1HGc2c8aCIr/LCyEEv750rHYR+Ye6wBiZs0QPmAbuRwDn5B52k3jJ6Q+LBD4Sci2wILn0BjbzWE57eqzReHsdRTARi50WebTjmMCpAD3p1m0bMMqUKJRLW+jjU9Slx5RRR8TRapNM9NfAiv2JRwgbtF5cxxxsuCuoJhsCvVjnri4+mhdStKW5GvXOt7q6PngZZ8MGcGrBDPxyYKRnS2LMJU45m95kGTeha69Gl18y7vh4GtglUlUwYutxwdW6NVPGH9KR9R3P+KB+fLGZsQgJxxbfzmoBcKLJvZXHG1VkneS4vWw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4226.eurprd09.prod.outlook.com (2603:10a6:208:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 16:39:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 16:39:34 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v2 2/2] insane: add Inactive-Upstream to
 Upstream-Status
Date: Tue, 14 Dec 2021 17:39:21 +0100
Message-ID: 
 <AM9PR09MB464262AF616372CDC4E33328A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214163921.1839963-1-kweihmann@outlook.com>
References: <20211214163921.1839963-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [6LJUwuCVbU2Zajnb22MCW9r8HfQZVyY38zKF9HTJ+Mqx1tj3MA/qA3bxeJ25yg/i]
X-ClientProxiedBy: AM3PR07CA0146.eurprd07.prod.outlook.com
 (2603:10a6:207:8::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211214163921.1839963-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 420b181d-cafa-4b66-e0df-08d9bf204f82
X-MS-Exchange-SLBlob-MailProps: 
	citmFLqyTFTRfvTOVFI/5+RqgVoP1N0558PLAdgf1C5DuLk98gvocmKCBG8jwHXDeQYMbU/va+N3vG0FucYfxi653jUWzqE4bydsRRczEmF3UwzCEeuope7z8JwQf8e066qfNJLsMjfOkPz57ple0h7B3N+fa5P+zsgmKbwZQMa3SIkvsfZknniIB5XrOc/wr7l28Eiif3/B5SFMq7sIFC5R7lPL1bmyGJhBNAxUIj7IEyQ8NIiv8XxKQY2PdtXYnauIuIMipbn9sUOhbAU7aa1vD29/6dOCgRRX3KZy6GC5JUa9eJYNRksbOfz2mg/vTREXtHROYLfZrrOPoYj139UQDtUIoBBnhmSMjw4V/YS905CwMaNkb4lKYZBx+nsODEN7aw/TTIMaWIozobXC2OH8z8et+tFvd6KTCSt3Q8m89bZXb6XmkxZN+fQIWGcdP8J3Blf9dQ1QIcddnXX5wqngsRoAWvnv/j1BxsGQJFdb7EGHN1wq9By5/nZvuL01+q8vmFibzxG/sPx7TNO7/5/aftoeeMuEZfcR43/WA1uCYhktR5K5N/0+4tG3Ihcfi8+uBo6h+AG0ZvvxU1w7DXkBTzn63bv/69O6KhCKeCqzOH7L8W63DV6g7UHZHPdolWip76wtAcXC5m0TN+ADiOpsLe2RkX+HnO+yBvFj8zdov/tcZIeLDvt4yK1086EGq9SiqXyk2YAcScNsAiuzQtf3YMl8a2gdYc/zzRta08eZfiS82AmNs/y+wEBni9lFHNKsgo+B+mT1ym9+4V43CUX+P2M7sFJfLz8NFIlW4ZA=
X-MS-TrafficTypeDiagnostic: AM0PR09MB4226:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jtPCPK56gaNZLW6+cxLlXsBXXHhGxuQKmMGnp18+MKU35zACwQeXK8T2FpH9zKMd3eIaOpChJFTrxtj6PrjuhUeIjbPHh3U8p+KTZrTIbxfgwTcT5h0Zju5qYOABOhGvqo6li8kwnjCxZ5gOteRjEDYJUe/aZNr0igwQcAIYsKZcPqObPwz0IUmd2zQ+7uCoHAsk55wjv1tubT6fgG32RJY1rK8o4A4thvQDcGOWiZXS6vwuf3NCiOc2QHvQDP6atUs30b5Q2ZdKQagw2y8mbMK+aT9w2e7yz+GmHOqAO/gdhzyxNilvmwjHltq10kvJg7mIlFl3sJKz7CnNB2ceIqRaSUz+S3V4/JKX6/VZjIkhDrO5XI7mD5Bwhakcoa/qrxyFyDqLFkHceDlgH55DRVn+HwL+6ct0G/LXBcJVlNlXTpToUSiZ11nkaKBEto6RhWxee+JKwhCnaNfn2qFuO9YLjzrwCh7OAZWpCCRlxHeQTtVr/1xSCyPesjRXsjrJYglBeVYFNvd4k7rKPRdmzWHoKui2lllmYaTckyicTElFCJ4UueNIAxKjMXizRFf3HTt7D+J7EkMf59ia6Pmd1C54WNtHwQLdnyKRlD5w9w+vdh0dU7a8e5qWOIsAb6Tq
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LkNXdMwOUqtZMtLLTFPe7iJQqcWFCREXiEC//PCnvVwT6gXJQc3eqLC7i/yj?=
 =?us-ascii?Q?kgrUuguPuNToy2DbmrHrJdRuwgzom1Kz6MeBmNBVpOb6MXQqYa/8ivc/JRjR?=
 =?us-ascii?Q?MFbu4Y/W8FPJxJSS3DW+NnP7E5yHjR4moASwJHacFhd7LCyNQCqGQbbgOfij?=
 =?us-ascii?Q?Gtly7GuSk4isAnOXt4emgoB+u+Xp40l1m8hBxpf0SuJeCyC6v9MY1csex1Uk?=
 =?us-ascii?Q?7dpbi5OTIw3Gsaa1tJO11sXRxVKYiM2Ll6JroKbPxdKrYw8koYCbs7gqeypm?=
 =?us-ascii?Q?6ut18m5Kwuoa51rXuytAUHeM+EZeE/UHhUi6o3BCOeuOHzLsFUfazUbZKqFd?=
 =?us-ascii?Q?8UWTGSwjkRdXUmcSbQKSRJaqlPKbGvcSnNBDKwdToDhlg0eonOs3BXr7xRPF?=
 =?us-ascii?Q?hwMZ1lZ49yh5VyIi6LhpIMQYVvaKtC3YeI/37O1SHd15FV/ZQ4uArqC8HGbc?=
 =?us-ascii?Q?VB2S80ZjtA04fUFBRiGn1TNKnGatQtBE5ReWR4hXdS4D5P5FOb37C5BGfj1o?=
 =?us-ascii?Q?mX6M/0qDgwi965FpfiqfzbHmbdbatP6ZezEtWt3aWv34jBGhGakGZlcaccOI?=
 =?us-ascii?Q?GkhTuK010AzauwCBVbZJXyAVweid2h4EgDWn1CwvrtbxaCqgwg4qzF498QM5?=
 =?us-ascii?Q?psW3aDdBmnah6rOeIBoB7tBu891B7lt5lvocQyYZ6t0bQAmnNxZIxf9tuF/e?=
 =?us-ascii?Q?9CANTRwC3f9/uQVBpHBtW1pdCaFgX0Cyg+ffJ5Vo5jaSQiPfCXYOYqvjZPeB?=
 =?us-ascii?Q?eXYSQKCS7UvMv7HQPKeS7HuhzvTfoCjAp076kebgcBy6H8bNnLy+V8q3S2Gl?=
 =?us-ascii?Q?IftiUn68mdobMIKGklIHVEh49ppRGPeKKxgHLSRoKwvb9+HpahopBi3zmXVK?=
 =?us-ascii?Q?HSkaJdlNqFJT6I+70kKZAVxmJfon+RerLGJF7LKXREB+uZH0mu2mWr/MG9Dc?=
 =?us-ascii?Q?/o5PyibB9jAhBLP9G7gQW1t0IoESWVdwNaAVLmqGOn1oXIpPcyGrvxHRIaLW?=
 =?us-ascii?Q?JscuTywzTfRHB3PaWe4uwhJlkA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 420b181d-cafa-4b66-e0df-08d9bf204f82
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:39:34.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159698

as defined by latest addition to the commit message guideline

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 125c339942..11532ecd08 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1170,7 +1170,7 @@ python do_qa_patch() {
=20
        content =3D open(fullpath, encoding=3D'utf-8', errors=3D'ignore').r=
ead()
        kinda_status_re =3D re.compile(r"^.*upstream.*status.*$", re.IGNORE=
CASE | re.MULTILINE)
-       strict_status_re =3D re.compile(r"^Upstream-Status: (Pending|Submit=
ted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
+       strict_status_re =3D re.compile(r"^Upstream-Status: (Pending|Submit=
ted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.M=
ULTILINE)
        match_kinda =3D kinda_status_re.search(content)
        match_strict =3D strict_status_re.search(content)
        guidelines =3D "https://www.openembedded.org/wiki/Commit_Patch_Mess=
age_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
--=20
2.25.1


