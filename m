Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38616.1792425965667112049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 09:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=pLsTJITc;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=HvLpGmp+;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP9HV081208;
	Mon, 19 Oct 2026 11:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9rXla/1mmYqqT1g1mhjmGARdgpEdNJGvWs64ZPDmo
	Xk=; b=pLsTJITcHt/Mu6/Gx5jgAqvz+WFbfAfiOB8Gd57wZX02QN8bx5THQXPZG
	u8qWr8U8HD5xIQKJOovn1iUP1MYD9hvGD433JyRRocJOPixjL6rz/+Pp3jvlv0+W
	xL7j0mSTDJQCiLx+4ZW8rwUhimQmY+BVNJdz55c2CsnzDkx+a6RKz7+R7sfI7ZDe
	7iIfWy3oB57jcPBvUQHN9+U+/46TYEMQvS3AXLUg17KVCeEWMRebLzyMlfhWs3aF
	3jKSlBNI/AdaYQqsC7B0oSze6m2yPSpfnmjkPOWBgRmz5xczvtqJEPGOkri2Gby6
	YMu0n/PbW7dgBSYoMDMuYp5X+oUyw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hdjbksrmc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 11:06:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOS7QKG9Ue9nJSFhAKGH3HQL87MgQzXB/Suv4cq/yD7tKJkoknDjMqKlC6Gtf7s9WmkUfPv4Pvdiz2eFM6PduJDLQco4FJJZFb6GuWZpkXlfL8RmNgJbsN02AyAMXGT881IfGFFgUqSmkK/hlLkgY7MFMswarsqqEMwR0PwAHERXPykr9jLxl1hNEt5FtWAf7+9utr7tIp67zVEGtaFTC4+G/Ou1eemitbjwGmN9U38LVwLwcugZCcZp+IW44xyYGedGE5OJWRuo99pGNeY5bT6AGq0jsOlVzD8D4wK2Iy8IAcpp80En0k7SXFM0KKiTHJ032odlegKBWAS69rKT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rXla/1mmYqqT1g1mhjmGARdgpEdNJGvWs64ZPDmoXk=;
 b=oIogwvjOPxPDNGCn4YacwvgfAj+Xng8R022qHcnC1it3qw6cqSKPTE2Ib96w45O8xijRmjIZqY/fLyWM4D1CM5vasjDeWYbJnQCDzj9+rZzOrUCS7QlTxEECVip83RIIZtLoduXYfoHY7I0HIe4AA1++u6k/ZIHecH9PscMp0XTJo5MzGH4Xx2QHwxdkWdB21NkCDNMTzNSq/Nw7My9ZuZ23xl/YnraPR1oHY5Zx52hKkT8npHRfZmCukfoH0HBMjjSmwy0TeOAzgk/8U/PrVw0sxf8UNe919pDl6m3u8tdDjm+AhcRSEOxy5ZoOLD4iiGQU/WYG/4FzUciG3sAHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rXla/1mmYqqT1g1mhjmGARdgpEdNJGvWs64ZPDmoXk=;
 b=HvLpGmp+1Y19inUoDyYBWEZlU+8wfSDjSYpi/k9QnxCwiTzwID49C7ZikQI/R2ZaWbRe8FClCpE1unxAXBysTtJYVcNaQWljj18nlW+u6sB6pb0DpcN9toT0ZuTHPN2Z/hifSezWSVTG+7dyukitiJGJj2h/vCppl6G8ljldrPU=
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by PH8PR10MB998089.namprd10.prod.outlook.com (2603:10b6:510:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 16:05:58 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::56) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 19
 Oct 2026 16:05:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:05:58 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 11:05:47 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 11:05:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 11:05:47 -0500
Received: from [10.249.33.254] ([10.249.33.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JG5lCg4054718;
	Mon, 19 Oct 2026 11:05:47 -0500
Message-ID: <7ffa26a2-a53d-4680-9e0d-1f465b913557@ti.com>
Date: Mon, 19 Oct 2026 11:05:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pseudo: Pull in various fixes and logging
 improvements
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
 <750ba0a1-c139-4cb5-8d5a-49d7b68efdc8@ti.com>
 <b9729972d5637869372b96d3ac94989f80a4230b.camel@linuxfoundation.org>
 <18DFF79CB2A2B502.3823096@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18DFF79CB2A2B502.3823096@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|PH8PR10MB998089:EE_
X-MS-Office365-Filtering-Correlation-Id: 180060fa-b9e1-43d1-fc1e-08df2dfadd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|4022899009|82310400026|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: fibFl2wNHj+qYH80OS71zAuCqx/nhVz+BfhK12/VEk8pZVLHXW10BI6qUdNp5ijXmFKzfE/PpGu30fgRXtOrZnpyyNlPdR7cDkfBXp0GmelVSll/yY54zNSktZAC/P8FOpIq696h0ybeYKz+b5OhT2rA9ICPKxeo3H6/NSuxZtRB/Bj8PaZM+3kpf4N1x2Gx5bUQBte9dh8o5DAEsXc1s4P/w+AM89/edWLT120zFi/odcOYlsu929G250v++zZa+HoqZjXMYvccgSdi4S4ujzd0h7SBFbzNt+vNqCDrYARif/MWlhYtqalIAhCXmHEVfg1PLHMp7WFekkrB/+YjhHkbfC4WmDT4k1890ulioGrV4GQNx6NUZDEWCPBeh1DllCgI0QyHoR8cK8hVrHK05Ag1+D/3U4qDIECsZotwHGSxa49U+Zo/GA7WQwK0lqwmXvNBlXm4hoRhmApi7GIU7fkrRtAmCu6l1DFLvZgOHYBi7yT8si3oh168lDZtNBcPEyXKanAWeT6RFlTduDNATA4qQxJKpCaqjAZ9kwR6nBQyCjzQOueWt6OXID7mYsTU+NqrG3rHEwEOHqw0bBWmhZlnOXm16s5EXuA39czhmtwQq4Vv3Ac80xKjfu4Ny2FCQ1vVbOWrPuHFC6GmElisV7XdZHoCp+13gK1nj/tDtvc=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(4022899009)(82310400026)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: buU2+0PUoqe9nm/G0AY8r4bbcYyKe0MyrSbH+ku2QpZLeE6A34vQ9mI4c4swOnL5ASIR/iW6U6e2A7rRtU62H0fidI5S9xeNs0DMs+pg0vlaUV0HaR3wWPMVIxzpBPtCleXAq3VHmSO8KcJEbJmnJwNG85ScAzIsnReUBy2zEWrGhguIJ6qixCCy/PutvaSGlhYuSUpa68NHlGo2yvhyWS5KH7mgSL9LdtXlyJiXxfge912EVFBiPS/zcxRKoNIrjkFaM7aq76MMxX7BrNTvC9S0sqwmsx6MQyayRmQUByJwPFe/IDA0HLkEObn74PJRHmUJjLOrisuFNSWjO7YeyfrBIENHhoddg+1PIA6qVM9IySq7CNOOH/FV11HimSfrlUL5L9qhqF/pLOzXsYGxcy+Uc/cXWTeVxu43xhXzXSLw1pnkXnV0/2ggLep72GqN
X-Exchange-RoutingPolicyChecked: ioAgYwPH1K3yISGswa+Z/gU7S2muHWtf/j4FZ07i/tuItmkUSiOmxgzofvEFQBJqJPHuJzdRcIuQJMNmQfAEdtqPnMAHgTZ21pJog9dwkQ97AezI6DZYXmQl2C3yf4C9ZqFHMbtswWFqyIfUZDZUr43/9na8uI3gqjFKaU3fszQSYw8/iJXD6G/qJppJSkEvckcnhFCFvlLuTssCfHDvro/EgSfIxSXzU2a3trFqW3XfrC3Q1KT4j26cK4tFGAcDIirpe+UP4Be4ZDx30PH956SZj2XCcZSk5E+qLbqB673WoH0pCCkWrX20Y9d1995uJ8WA4O2XjuguhPIzq2PtAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:05:58.2235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180060fa-b9e1-43d1-fc1e-08df2dfadd09
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998089
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX+p/AkW4u5yKO
 KBIo0YINQO0dt5D3kPBhQe2O0HV1eq7zxqn85xVFnHanVPNCVi/a+X92VdBGkccx2QWi3Tcxv+5
 gH8YGfudCTLzlrRbQ7WLCdC8I93qUPuJ3ZbBjb5fVrQXNkMyIXcr9/SuIWHZAd/2jcac34rnM3p
 TE/ymmHWJgV0RcU9x2lIjJsQXUx8Bu9VSJsaDWgjj6BuPrHImUV7lEyUrJEAIX4EKI6O4c+Rxh2
 tiEUfEvAaQzmIt2fbJKvjMJr7FR5lPaWJaYCWFSXcP1A/kJTN/Ws08s0f6qxcXwharaYMurU4Bs
 QdtVq10YwQRzzcwAixUTTj3hgqIk8R4FGQrjPKhV7z9G1aaSYBHfeBVBCqSupi4wxE0ywuNbqK/
 n85iOFaKa0ZKvQcJNP7BX2sSMLYGr4gD/NU4jvmXm7V1MGYfG9zs2M/ZWlcW9p4WCXT0ybws22y
 J2BRn4v9PZfC+luw0PA==
X-Proofpoint-ORIG-GUID: CQ4mr79n9__7xiXWsQwxQ8Llbwo2k9ED
X-Proofpoint-GUID: CQ4mr79n9__7xiXWsQwxQ8Llbwo2k9ED
X-Authority-Analysis: v=2.4 cv=Vsa2kO2n c=1 sm=1 tr=0 ts=6ad63feb cx=c_pps
 a=oUdh5d0wO9iyjQqwpg+wBw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=bsrEzE0CxQhTzZ7I2vQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfXxpS5VKa1Wjuy
 QEI3xaUMZPnZhV5Cif9+r2prmnUA7/omI0f+5QDZeaMht5u1Aua6gviSI48luFRowZOIcajvLmC
 4JOQh7IdbD6OQFNpiqg+77EWjubAfaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 69JFP9HV081208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 16:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248195



On 10/19/2026 10:22 AM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
>=20
> On 10/19/2026 10:00 AM, Richard Purdie wrote:
>> On Mon, 2026-10-19 at 09:54 -0500, Ryan Eatmon wrote:
>>>
>>> I'm getting build errors with this:
>>>
>>> pseudo_wrapfuncs.c:12012:14: error: conflicting types for
>>> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned int,
>>> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned
>>> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>>> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path=
,
>>> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>> In file included from pseudo_wrappers.c:45:
>>> pseudo_wrapfuncs.h:535:14: note: previous declaration of
>>> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=
=C2=A0 const char *, unsigned
>>> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*=
)(int,=C2=A0 const char *,
>>> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>>> 535 | static int (*real_open_tree_attr)(int dirfd, const char *path,
>>> unsigned int flags, struct mount_attr *attr, size_t size);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>>
>>>
>>> pseudo_wrapfuncs.c:12012:14: error: conflicting types for
>>> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned int,
>>> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned
>>> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>>> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path=
,
>>> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>> In file included from pseudo_wrappers.c:45:
>>> pseudo_wrapfuncs.h:535:14: note: previous declaration of
>>> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=
=C2=A0 const char *, unsigned
>>> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*=
)(int,=C2=A0 const char *,
>>> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>>> =C2=A0=C2=A0=C2=A0=C2=A0 535 | static int (*real_open_tree_attr)(int =
dirfd, const char=20
>>> *path,
>>> unsigned int flags, struct mount_attr *attr, size_t size);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>> In file included from pseudo_wrappers.c:295:
>>> pseudo_wrapfuncs.c:12017:72: warning: =E2=80=98struct mount_attr=E2=80=
=99 declared
>>> inside parameter list will not be visible outside of this definition =
or
>>> declaration
>>> 12017 | open_tree_attr(int dirfd, const char *path, unsigned int flag=
s,
>>> struct mount_attr *attr, size_t size) {
>>> 2026-10-17 13:57:58 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>>
>>>
>>>
>>> Anyone else seeing this?
>>
>> Which host distro is that with? It will be something to do with the
>> system headers not having the declaration we need...
>>
>> Not sure why we didn't see it in testing...
>=20
> Ubuntu 22.04

On my 24.04 machine:

/usr/include/x86_64-linux-gnu/sys/mount.h has a section that includes=20
linux/mount.h.

But that missing on the 22.04 container that I'm running.  It could all=20
be the missing definition of mount_attr.  Let me try something...

yeah, if I add #include <linux/mount.h> to psuedo_wrappers.c it compiles=20
fine.

Do we want a patch for pseudo to add that?

>=20
>=20
>> Cheers,
>>
>> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248192): https://lists.openembedded.org/g/openembed=
ded-core/message/248192
> Mute This Topic: https://lists.openembedded.org/mt/121786007/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS
