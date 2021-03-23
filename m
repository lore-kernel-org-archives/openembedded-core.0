Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.83])
 by mx.groups.io with SMTP id smtpd.web08.5236.1616482585917769281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 23:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=UVlTh9+U;
 spf=pass (domain: topicproducts.com, ip: 40.107.15.83, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTMUJNqgrlqNc8TvIXnTkAdDYuomj90K9PG8SMGG0rw=;
 b=UVlTh9+U7vCr0NH99CkAD0Gaz4TQXi6tCqZzgwWbgdHwbQSlCC7o0slgWMK+P/Y7GXijnx1VdrTOV71ES9WDPJzZX09x1DLp03M+pcennNupqqNLIzMue3LqfOtS9j1SGrqDtpQ6KvzW72pJV3R76gSkqnufu7oaXawX+yF7tE8=
Received: from AS8PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:20b:311::25)
 by AM6PR04MB6405.eurprd04.prod.outlook.com (2603:10a6:20b:f7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 06:56:23 +0000
Received: from HE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::57) by AS8PR05CA0020.outlook.office365.com
 (2603:10a6:20b:311::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 06:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT049.mail.protection.outlook.com (10.152.0.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 06:56:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (104.47.10.58) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 23 Mar 2021 06:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En38KjVYHAfto21F/YIxE5WRvDlt+QUIAdUQKsetiuRXQmj2fRwtPDvE1sB/tXuTl+m/oa2fk0cwgh70YwiE2LbAe7U6WH5bdfNPYUwHaRIromE6OE+ThsyDPlOq0YxKeeVSf2ijyVZu5KgMG2zbYm8dA8WcNhxpT6QDt3Qo/93zUsKWPibwE/m3rqKb5S8syZhmCNrIrSFYaexXqpqvG4AUM+Hasjscm4Le6MUCnxTBVkDn0UWJdnyChQM9/3WBFGWW7kzwQGPREatlGkH0KH50O0k79/nlO/rFAnVxtms9xnm3hsLTf0VTukl9NSUHEkZ9r2lrmiJcL2UZI0dCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y91ubRkNe64i6AUSrMWCiaTJjVWzmPN/8wC/eTP8TNU=;
 b=czUoSp5rOWUgVbVWtqHSz9Qc/3kzaKKR+h2kPtkcUAWbZscbKn2oWubrvIVDuykMn+LSJCqk0RMX55BzF1ejsxvXfJvaPciVxZ2oYK38mpiOJr0WjU3Euwe/ZzyjzqkdsaLQVkcjtglWT5DZrafUuj4gHf/hjidpR0+H97W0mFCJ+rBWiTea1jTPMMkzaXBLa4YyPul9XNYU4DNCE06vhaYzGKcN/l5p79Im2mxXwfwYZY8J5p+MWx+DvHt2IDBEyMxmYpdkW818eASqiP/btUKk+hFFr6PBMk+0a2DfdIvY/vqD5RWc7nfGTob/QRGZXcCcK9aZRa07N7r2IkNy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB5675.eurprd04.prod.outlook.com (2603:10a6:10:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 06:56:18 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 06:56:18 +0000
Subject: Re: [OE-core] [poky][PATCH] package_manager: install versioned postinst scripts
To: Anton Kachalov <gmouse@google.com>
CC: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f4dbd25e-5dbe-43cd-9759-142455aef0eb@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.31ab2b89-4cad-4ccb-bc6c-988623ea5223@emailsignatures365.codetwo.com>
 <20210322154557.1591593-1-gmouse@google.com>
 <91eb3709-1738-906c-e704-c78fc75314c8@topic.nl>
 <CADVsX89t+17uv9o9EjheXUGpYFMwZNEgciPNU5APU4FNJK9pkg@mail.gmail.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <cbdebdbb-7386-3c99-b8aa-88e871f27727@topic.nl>
Date: Tue, 23 Mar 2021 07:56:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADVsX89t+17uv9o9EjheXUGpYFMwZNEgciPNU5APU4FNJK9pkg@mail.gmail.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 06:56:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1772bdf7-9b18-4bea-bf6b-08d8edc8c502
X-MS-TrafficTypeDiagnostic: DB8PR04MB5675:|AM6PR04MB6405:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB6405B8F4C57DC6825E90EB8E96649@AM6PR04MB6405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Qymy5n2nXcI+Vp10hJD9w2LAiAqwLYwIZPGqdgp4hHGIVY7ifBWkHK+CDTzL826UaO+jcoMxl82fbRNYg1tTRuN2sao76TdAACRf1cVNYRfGc0RVA8XnXT+GazTQpGzRHVBYiZYlr1WVELMsdlxVLRPkY029hmn6eZhKctt7Ut7/c1Wdtu4e5H6cA0plTdFo0gctdvXkyQrNaNUoIIvilDLXyRlaszCbxfXcWt8aSDyGx32DVLptliu3lHb+t78GSaRWOqsl9ZoL1xXRSy+scDGleO/R3V6cDFOUALo8nu7wocEetNOQaLoFPe4OLIasqQGx0RDj25AJz6ldX365rXhTj5IYYPWMM1NqMmmKOY5syA+ZuhobxZrZ3blbjkGCRpqfVtxPNdRE5+2KGgouob3ZdVYK415rf6C9K48/mezuRMrXF56k1f+IOb4ofnxp7KODTc6/ojba9EBBODoYBl9nRikRJiuLdv+3dLRJxVsMTL/zRTNh0CJMyh9pcZtPyLA4h8x2+GCrIOZ2Gsm7hl8Ij4hRCn9BXr4IaUqwHAHOYy9Sh9anDDpzz5EbOybo3nMN15yZEHfgHwtRBYxB85Qicib3ftBdFuErleyqBaTDkx6uysuZbjacXceGlXbxNs+oLHPMA++LTAfb+AHGC98xg7tV9njayFL4aYvgXlBYZ8/2NxzDW8gMsz4CGSPcDChb2tlBUM2PYx3VWLh2rKT0MLtqAkoYee0deitzQRkZlg/L7C6t8RX7M633r3ugP3p19+NujIdbrWSaFPNdSiSm2sUCFoS/5a2PcGG7jts=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(39830400003)(346002)(31686004)(44832011)(66556008)(8936002)(38100700001)(966005)(83380400001)(478600001)(66476007)(42882007)(36756003)(53546011)(31696002)(5660300002)(26005)(16576012)(2906002)(2616005)(8676002)(316002)(16526019)(6916009)(52116002)(6486002)(83170400001)(66946007)(956004)(186003)(4326008)(36916002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?go1ERo1zFRNBJ6AVs6nkyUhp2StKDEdkZHYEGyZbU6WZvVJ7h0UGzmsCbox4?=
 =?us-ascii?Q?0I7s4aLsIi/9BJ7z5JLenipc6rUJWSWOdiaX8/QWTdsTlkSLY6tBcqFofhXL?=
 =?us-ascii?Q?9QknNfxRK/9Eaonxrvyh2KVo2Zt4LYz1RfAy6jFAcLdKpIlY4pEwBQpIfj1i?=
 =?us-ascii?Q?6fcSh3uHiXAooLNTr50y3mRU6pcfaf6reBdyhEunH8TlGhMHnUZPUxg7KS+V?=
 =?us-ascii?Q?nAmFzMaNah5ACKFmzRl8VSeWNew0baR+d095LIVuiNX8D7E1sCUE65Ae1MbW?=
 =?us-ascii?Q?dIT3WcusBZPQIVJETA2KUQtd7xBm10sO1nQzotFEqUfVBkYR14hNmWIcdiem?=
 =?us-ascii?Q?Fi6+0UA2HXAWXuYYGg05QUPHiJqzzaXId1NSdLNgHmDYdNlZdGfD5G9j12n7?=
 =?us-ascii?Q?cDBI5B0jZBjEvQqj58teliK5WZNegHF9N0oZLUqXESguP2fBGrlW5zKKYIF6?=
 =?us-ascii?Q?Yge3jZ2pc3CCU5UywHTyV1Fc0pIbHGbFYn1bTy54ggUudtdErbbDMcyI2VrL?=
 =?us-ascii?Q?V+A38c361L0y8nLuj17rEcrQq2hqmilJGGE2BCoXheqvYIz/x5Bl8Xk5oS7Z?=
 =?us-ascii?Q?rc0gg6TKyn1D7iC+0IwJJJfD/F3xivu2Gf33R3x9zH6QriVJ2MDUKBwDiMJH?=
 =?us-ascii?Q?5QV0ydZAabmTcbn0Aa4puA7Mu+RqvmpAyQn8flBUIznQlCsKpxcVZGmPjqP9?=
 =?us-ascii?Q?qg+rmyCQBvnekXDx5PRtJKh2mlEjFfbY+ruXzzPdqMHVQv51vhuLpClKhj9a?=
 =?us-ascii?Q?xUeR3mLkx2DyDXBqUYcG1Zt9qLhCjuyVZvKaUzPkFTIQcfzD4yBXR1nZiuXI?=
 =?us-ascii?Q?wh/QYM5dOxjuXGxD9L7wOiqy5BVw0PaLu+V54g4Or3LcE1iGGDq3qO5/AL3v?=
 =?us-ascii?Q?bvvafBt10KyhSbLVQdy0a8t/KmS3h9dlByVQSZQ6ybP4w7Zbt9/NM2UNRs99?=
 =?us-ascii?Q?N92iUQ2jRdRGKD1Ip1deslKl3mQcBJr6F8UDuDt0b7/293Q2MqxPCirwIXPG?=
 =?us-ascii?Q?KGrcB2qx+GAvb/ZZWUhqJk/mkNsfakmWxZf6KGAbipltBGlGjoZhZp71A4/O?=
 =?us-ascii?Q?jw5WJN2mZecrP+Xx/hdUH3/bno7XFjNXesct3OPVgg7oc690/Xfy9LzhozI2?=
 =?us-ascii?Q?+FcpZqhE6J1BfL2nS9OM1zj82ZzVMXlbaVc26sPz9Vkg17DOUHLWnP754mRJ?=
 =?us-ascii?Q?aN1cPRwgCHiXVqi6zlZF/VuI3cA/3W74uZgeXKY5yTK23d2fLwt4phCujVrt?=
 =?us-ascii?Q?gr061Asj66z3+L8i/fCrkFZ9gp9psE3ud508M1TMIdu2FcYfECwZSHRIUB28?=
 =?us-ascii?Q?YAJcl4lhssWvxCJ72J7jT2JS?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5675
X-CodeTwo-MessageID: f2576b9b-6520-4666-85f4-812055ccc2da.20210323065620@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59c06479-edf2-4fa0-eb72-08d8edc8c264
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nX81YoN7okIbkzKChP580eNCUmKBqKceekLMOiB1CMIgovALgDeFJtGqyD100xDx3TC4aZt3t5UQ2+EAvwVuNp2un3vsOagceOBRye5Tz34785xewCjWeRwj3rNCOpPtBTro1G+zaJhbR8RHNkP3a4C42YQzdi6clNafplDPohRaAeS6F92PJuE6Gbcm7LfHfr0fNgF1LW/YUdiYZd9PHUR+N2Jrvgh8VZ8qPcFz/3SaFIbyHdhDFd20OJgUZsRY5jPXa5GF90oEcnHCzpUrHCCoyo56e2PMzatZgZJH154GCz4Ym9nyYaUxWFYlV/kvnN5IcLCNmMIkGGgXvHhJFKSFh1SYTrUsBOsZIEfpmtdFAYIhgGkE1Z50Tsh2J0bR4VeS3snYomQ/lO74jowo3tBvu7rGmgS+ASiGhbWDxG5taJzGf9X1cqXcx6b3SV6M02MVnWitn9EZCNYJGV7AWeo98tPwwh42aY6HBxi8YCOhfoB/h0QXkdznGjXyAhfMyU/r+x/5beZyWAcdtXfF5mowXjulJps1iK2KL9zleWwmdKUYm9ah7RgNWBIW+IcET0Uh6ZfVjs+KJJjYqk+afDks2YlIfbK1XCgL+lINhWpmYMNv1g6aDCbr7DNew0AoMiNR3+dCYZ1ueG/cWntsYma9fiK0PsiXzt/zSXYsb/xSjDkz/DsP1x8OaJFzKPHXkaKaQ4ijAvDyNTYOvsZhuYch2gF5MZDSzeustCk60QXP6Q3CmUNYVdVPg87EOlEV9TxYXjiWo1MsHKHnZ3XyNQ==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(39830400003)(396003)(376002)(136003)(46966006)(36840700001)(36860700001)(478600001)(6916009)(6486002)(44832011)(31686004)(53546011)(47076005)(966005)(5660300002)(956004)(42882007)(336012)(316002)(16576012)(2616005)(82310400003)(70206006)(26005)(70586007)(36916002)(356005)(186003)(15974865002)(83380400001)(2906002)(8936002)(83170400001)(8676002)(4326008)(7596003)(16526019)(36756003)(7636003)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 06:56:22.6469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1772bdf7-9b18-4bea-bf6b-08d8edc8c502
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6405
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

So it's something exclusively for OpenBMC.

As for running the scripts, you cannot simply conclude that a script=20
doesn't need to run if its contents did not change. It may very well=20
call the executable from its package to do the actual work and that may=20
have changed as well.


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 22-03-2021 17:54, Anton Kachalov wrote:
> Hi, Mike.
>
> That is how OpenBMC is designed. Most of the targets are read-only=20
> rootfs (squashfs) and overlayfs for RW.
> It is not expected to overwrite binaries through overlayfs and there=20
> are plans to scope RW areas (e.g. /etc).
>
> Those files with 64-chars suffix are mostly hidden from regular users:=
=20
> the files are removed during the first startup. No one will notice them =
:)
>
> Anyway, alternatively within the openbmc update script it's possible=20
> to force clean the deleted files on overlayfs upperdir. However, it=20
> will mean that all the scripts regardless if they are updated or not,=20
> will be re-executed after rootfs update.
>
> On Mon, 22 Mar 2021 at 17:08, Mike Looijmans <mike.looijmans@topic.nl=20
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     Two remarks below...
>     On 22-03-2021 16:45, Anton Kachalov via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > From: "Anton D. Kachalov" <gmouse@google.com
>     <mailto:gmouse@google.com>>
>     >
>     > When running on read-only rootfs backed with overlayfs, the
>     processed scripts
>     > are being marked as deleted on upperdir of overlayfs. When it
>     comes to
>     > upgrade the main read-only image, it might contain new postinst
>     scripts that
>     > are different from the already processed. Introduced suffix
>     (sha256 of
>     > the content) allows to distinct updated scripts of the same packag=
e.
>
>     So your usecase is that you have a read-only rootfs with an
>     overlay on
>     top, and then just replace the rootfs. And then expect things to
>     still
>     work?
>
>     That doesn't sound valid to me - normally I'd wipe the overlay clean
>     when updating the underlying read-only part. I'd be very
>     interested in
>     what you're actually trying to accomplish here?
>
>     And further, I don't think appending 64 characters to filenames is
>     going
>     to make anyone happy.
>
>     In your case, I'd opt for a script that just resets the postinst
>     scripts
>     (and maybe more?) in the overlay. Or have 3 overlays. Whenever the
>     package manager runs, activate the second layer. The "user" stuff
>     in the
>     third layer is normally active. Then when you upgrade the system,
>     wipe
>     the second layer, to get rid of obsolete packages. Or something like
>     that. Again, tell us what you're really building...
>
>
>     >
>     > Signed-off-by: Anton D. Kachalov <gmouse@google.com
>     <mailto:gmouse@google.com>>
>     > ---
>     >=C2=A0 =C2=A0meta/lib/oe/package_manager/deb/rootfs.py=C2=A0 =C2=A0=
| 11 ++++++++++-
>     >=C2=A0 =C2=A0meta/lib/oe/package_manager/ipk/rootfs.py=C2=A0 =C2=A0=
| 11 ++++++++++-
>     >=C2=A0 =C2=A0meta/lib/oe/package_manager/rpm/__init__.py |=C2=A0 4 =
+++-
>     >=C2=A0 =C2=A03 files changed, 23 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/meta/lib/oe/package_manager/deb/rootfs.py
>     b/meta/lib/oe/package_manager/deb/rootfs.py
>     > index 8fbaca11d6..704d213626 100644
>     > --- a/meta/lib/oe/package_manager/deb/rootfs.py
>     > +++ b/meta/lib/oe/package_manager/deb/rootfs.py
>     > @@ -4,6 +4,7 @@
>     >
>     >=C2=A0 =C2=A0import re
>     >=C2=A0 =C2=A0import shutil
>     > +from hashlib import sha256
>     >=C2=A0 =C2=A0from oe.rootfs import Rootfs
>     >=C2=A0 =C2=A0from oe.manifest import Manifest
>     >=C2=A0 =C2=A0from oe.utils import execute_pre_post_process
>     > @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkd=
irhier(dst_postinst_dir)
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.e=
xists(os.path.join(src_postinst_dir, p
>     + ".postinst")):
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D =
sha256()
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open=
(src_postinst_dir, p + ".postinst",
>     "rb") as f:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 while True:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 data =3D f.read(65536)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if not data:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 csum.update(data)
>     > +
>     > =C2=A0shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
>     > - os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
>     > + os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p,
>     csum.hexdigest())))
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num +=3D 1
>     >
>     > diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py
>     b/meta/lib/oe/package_manager/ipk/rootfs.py
>     > index 26dbee6f6a..6ead6ddef3 100644
>     > --- a/meta/lib/oe/package_manager/ipk/rootfs.py
>     > +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
>     > @@ -5,6 +5,7 @@
>     >=C2=A0 =C2=A0import re
>     >=C2=A0 =C2=A0import filecmp
>     >=C2=A0 =C2=A0import shutil
>     > +from hashlib import sha256
>     >=C2=A0 =C2=A0from oe.rootfs import Rootfs
>     >=C2=A0 =C2=A0from oe.manifest import Manifest
>     >=C2=A0 =C2=A0from oe.utils import execute_pre_post_process
>     > @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkd=
irhier(dst_postinst_dir)
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.e=
xists(os.path.join(src_postinst_dir, p
>     + ".postinst")):
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D =
sha256()
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open=
(src_postinst_dir, p + ".postinst",
>     "rb") as f:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 while True:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 data =3D f.read(65536)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if not data:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 csum.update(data)
>     > +
>     > =C2=A0shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
>     > - os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
>     > + os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p,
>     csum.hexdigest())))
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num +=3D 1
>     >
>     > diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
>     b/meta/lib/oe/package_manager/rpm/__init__.py
>     > index 6df0092281..4746e96ce8 100644
>     > --- a/meta/lib/oe/package_manager/rpm/__init__.py
>     > +++ b/meta/lib/oe/package_manager/rpm/__init__.py
>     > @@ -4,6 +4,7 @@
>     >
>     >=C2=A0 =C2=A0import shutil
>     >=C2=A0 =C2=A0import subprocess
>     > +from hashlib import sha256
>     >=C2=A0 =C2=A0from oe.package_manager import *
>     >
>     >=C2=A0 =C2=A0class RpmIndexer(Indexer):
>     > @@ -359,7 +360,8 @@ class RpmPM(PackageManager):
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_path =3D oe.path.jo=
in(self.target_rootfs,
>     self.d.expand('${sysconfdir}/rpm-postinsts/'))
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(target_=
path)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num =3D self._script_num_p=
refix(target_path)
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_name =3D oe.path.join(ta=
rget_path, "%d-%s" %
>     (num, pkg))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D sha256(output.encode("utf-8"=
)).hexdigest()
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_name =3D oe.path.join(ta=
rget_path,
>     "%d-%s.%s" % (num, pkg, csum))
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open(saved_script_name, 'w=
').write(output)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmod(saved_script_name=
, 0o755)
>     >
>     >
>     >=20
>     >
>
>     --=20
>     Mike Looijmans
>

--=20
Mike Looijmans

