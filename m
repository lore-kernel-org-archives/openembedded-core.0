Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web09.5808.1631702904203999524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=ONVXlC4t;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.47, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmVyu9P73OAFby8uh4W+uMkJ3QOC4GESUanULrFXbu1/3kG8isKibYVKtSGnLe40uiNtRnCbKJe9dQiZ2C1jTpi7pFePRU/3OUBRVdswpT7f00Q0asIzEhYl+TPC7ivNLpL+O7j24xIPWcF1BxsdnJDcr1Uhau/095BKksAbJDfyMH7KsSHbQaP4KNwD4yB12hFsO8OQIcdgU+QKtgZhLESlxzctMvkagM3bK61LttlHYg6XbCV6/95OP8yZo1JLgSwkZIkTQgIFKZUlrAUOUtZoR3vd2aHw/b2Bjv/QUGvpge3nsZjDiZoEMx4Cnh08RAZjlksrmCUJOdww09lxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7USC/4TdTaVlvpC2NowGYcNGifIai4qzmhCqYzlkX2Q=;
 b=LGHWBKqq6crEzSSUQHFkReouOIwIwN8mdCj7UUEYlsLbrw9oTyyOxI44XAXiskz2qwPAbyuw5ecqQBfc0ZgmnFCLdZFFFkYlYnfBChyrWsR6NC5WIlJ1tcTGm8ktPiTP1OYYNDcxJsSMdRBGtvP+ZSiVTevp9NwEiHHQBL3SFaGOxsWI1oIbtzySYb0T0q5p/j1Rrb6UEr+HVpFNMXGMgxPXE/IvF0O25K5BaZJutRUZCTJusDoclL7F30aKHriCkCGIvNHh6Ct7MreAlXjn457jeCJGTkBQnDB0H6Pl/7Z+y5lyFBXfflNaBDKo7LlUax15IurGRNb546P8/DeqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7USC/4TdTaVlvpC2NowGYcNGifIai4qzmhCqYzlkX2Q=;
 b=ONVXlC4tqE5evkHicSHBewavu48fnUYRFGJJxNaIMimA2VMUyQuOjvOrd7jtKO86f0L/Q874uFKou1JBTY1q+mzLzBgKlZZTcaaaKonvpAV+kh3fmkN1mVCBzHgxsGAeekgpqYp3g7gOfJUSfrFEhDYpUgHRsTcSw21krV+84Ns=
Authentication-Results: klausen.dk; dkim=none (message not signed)
 header.d=none;klausen.dk; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7908.eurprd04.prod.outlook.com
 (2603:10a6:20b:24c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 10:48:21 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 10:48:21 +0000
Date: Wed, 15 Sep 2021 12:48:18 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: kristian@klausen.dk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
Message-ID: <20210915104818.43wown7ss2pcfnky@fedora>
References: <20210915102308.1892-1-kristian@klausen.dk>
In-Reply-To: <20210915102308.1892-1-kristian@klausen.dk>
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 10:48:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258a7cd4-387e-4f87-5aa4-08d9783655a5
X-MS-TrafficTypeDiagnostic: AM8PR04MB7908:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7908DCAF152B3DE6C629C93FC2DB9@AM8PR04MB7908.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	opKOT9aiAhB2Um1WO2U+kyPsRM9uCpcknYBtykp+LC6XbFxIdOKsQXhqac04nh1GYDMHDv2xHMcQ85db87Z3hlUIxGWKH534VB76IBPI6VaNJlFsvbsRSHAqTOjmq/wITdluS9TQp4KaphBMFG0/dVCdMYfh4s8TiWarcxY7sYBWogUsub71cUmTzOSzPiquLwJK+hkpfHmknzmf2saxZ5adBjOoaNqcOCftwyl82q1FfiqMYoqsOYNX5CY+9aSRqAyyvrlrcHLIalxIrgbuF3LQSHwTK6kWnC1WXmJ6hEtkSkKZd0ZamVgUF/TH03KDiM9/VMfSAHP+c4++IHMV39mahuf2MjsqBP9+LNxzaL+XY1OkwXPzxRMcZsEkg/fzN4AEbzKooEXVBdjCrIwPifoKkwqLY7xfOhENZlcJ2V7aFw5MAaOLMcxR/varT7YeDiYgKrnD6dgB2IEaMcBIyX5dg24mrvLbd/Yq+Wkpzi2PxOegI4b6vR/kUitqw/hNXLqIFno1C6HqsFls7WJr2jWt+oc1EXbLLog4htdLz08Oe6lFql2EO00jljGnPUFIjOtlLI5S4xHFKQqP2cqCbh13h6oigXJcVEdU7JGZlnd5cFXY6+eQA3PFiUUrLAmXICwfe1IgtrGGvCfZNJPiw3CTP70j6YIpZvyFtNcZq3DlOPzKL/KNuYQetzrfIfwG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(956004)(9686003)(86362001)(1076003)(38350700002)(83380400001)(44832011)(33716001)(38100700002)(8936002)(52116002)(2906002)(6496006)(6916009)(8676002)(4326008)(9576002)(26005)(186003)(55016002)(5660300002)(316002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qv1gdvfSaBWcl+Y7xVtpxIPAj0jeT3h8TcBDD6GJJ7YnRhfI69hL205XahV1?=
 =?us-ascii?Q?019nsBkR+zBpNSEXRrP4qSjBWS8FxNm4ywn16QJWbxt0NSIJzlvMO1XWTiCY?=
 =?us-ascii?Q?cttZTDJnYzgCgHR0VZZOHIWTEoESOd0sMfQuLlXvRS9vLmQZ4SYmH8Qib6jz?=
 =?us-ascii?Q?zCgtxuk2gSbhsUiopFC4ICmH1Qy7wP6AiJhBcGRkuvc9ttovHgFW1EyFGRn5?=
 =?us-ascii?Q?93teABqN+5Lr9JgGECr3IXC6FA+dgS0V/ZJWZ/IQsCYCL8GV1yAxi0XyR4+e?=
 =?us-ascii?Q?unJGlLlL7R/WlEANmI0286hqUR1HMPYR9rUYeDfgMxTTmzPyvW9ys4crcVbS?=
 =?us-ascii?Q?tLciYMPJNe+INe2fqNUBgSG9vHKms1H/neti8YJnfawMQDRbiQyqTofbcj54?=
 =?us-ascii?Q?2N/VQ4T/FiBVUftER9urolPJgTD6UYlO6wySyeCBpCm4UFeyyFJQvzrnGkED?=
 =?us-ascii?Q?1Ed1KqftBRrd+Pts3UFOj/Xks7pTL2k6bydiUzVGsJtDIbO/+aoxqyUQCWFZ?=
 =?us-ascii?Q?iAGErsU1F8S1eyeRM64DpAp7JuEWNrthu8Y5zpoZh1rfKex2JDq1yMcjXXS/?=
 =?us-ascii?Q?FDXEDJ1cG5Ij1M2LzWXDdZydkJ1+hklU1UKgDM4NzDICqJH2ecm3qFMtKi7I?=
 =?us-ascii?Q?2r0uzqZtoPZ3zFHxLDMlJ+Nc7bwXMiSdgIgVn2JDCfSeRe72L/DeDdNUSqeM?=
 =?us-ascii?Q?/CF8QsaJiki/RmxuVKbrJ7t1d7oh6iuJAhw1CoYltone7uAwRgg0BZxtQE5i?=
 =?us-ascii?Q?f+/086S32v8bLkOSQMTvc0kXYMar3etaHAcBFgFF+QdnGuroY/kQyW7nw7jv?=
 =?us-ascii?Q?fWFGyZkLjfYfHnBdQudI9WyHf+pvzK5daYm0SiZES3N9ZtmVVeYleZuODIR2?=
 =?us-ascii?Q?AL/fhBerijyskvblsLp9f5RCVdHnVIvnpHLhWKHEOsosR6qVoNw2THrPTfCs?=
 =?us-ascii?Q?GqvUiDoFcaGUGtgPDUXf4n7VfycKKNY4Tc4yIYkfU+ZUE3QljikhoV0Tss/f?=
 =?us-ascii?Q?83PUaolER2B2YSMtJF5FxqjrRYjJZ3ufQHp9OhGnrb7U+4yzn2KtB58cAUuq?=
 =?us-ascii?Q?m45cBkHK+Dy/H2ySkpdGQK8T1BR79mfHJyMSn7U+TSSFzS5WE+mh21CdBpXy?=
 =?us-ascii?Q?uwVeeSQSTtOvuKRL87J6C/zyvupS1U7jjs6tnPJguofPhItWhxZB67PbOR8X?=
 =?us-ascii?Q?OTuv+v0xqnEMlKa+GhwcBJ8qgLcOPHF5z/pY9YDJX+GO843IBK3VHNsWq770?=
 =?us-ascii?Q?JN6HO8wg3VOqHhjGmPnQ3nn/Wu4ybZgIZcf3tDYtGitY59Y0gmmmQIUsCoyW?=
 =?us-ascii?Q?8GpR13fs2EsfqHu+dbnq10RQ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258a7cd4-387e-4f87-5aa4-08d9783655a5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:48:21.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fyh6UxuDyD25j2CgUnkUSB4dEZsELOperRBlNykIKl0oK5DPoeQ+r30hDOZAQF0t3O+u5EC00dH7s76bnetSR9foZBLzmFseKvU7IMXVXoLA1K9Pnm5AVDh14xOww75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kristian,

On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
> The TPM2 support is used, among other things, for unlocking encrypted
> volumes.
> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
>  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
> index c027b88fd6..f8c85dabf0 100644
> --- a/meta/recipes-core/systemd/systemd_249.3.bb
> +++ b/meta/recipes-core/systemd/systemd_249.3.bb
> @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
>  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
>  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
>  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
> +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"

Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
automatically by Bitbake since I assume the libs they contained are used
by the linker for systemd?

Also looking at the tpm2-tss recipe, I'm not sure there's a package
named libtss2-tcti-device?

I would assume that

PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss"

would be enough except if there's dynamic loading of libraries or
binaries from tpm2-tss that are required at runtime?

Cheers,
Quentin
