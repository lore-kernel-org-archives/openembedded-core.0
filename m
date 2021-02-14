Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.37])
 by mx.groups.io with SMTP id smtpd.web10.20790.1613328201631803501
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 10:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Wq1FePdd;
 spf=pass (domain: outlook.com, ip: 40.92.91.37, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXXv1O37lRSK/P9wYy0zqqUu6BROqsvo4xjPxqqA4qzflV6c0ldRL/B+qraajc1iy1DgHWws9jTOq6dzV9zjhopTZDT6KEH3QcnkRaBstS1utiRrTjLUuz1vhA87hz4vOH/idGPstV2jQttq+5lc4bnggUYP25k0zWVjeTCbXupVorn/TxQAWAWeKpT0wy1sTDsYsLyH6r5H3sQPG7rYfKSm2q8bcD94jrs/lIjAcXpyRSOPFeglI9sbPVxysKzmCDlxpdE3nsOuBFtAR6cwRsNgReyi4/p9vI9c3igrYrOOWCbEIG5Omd/gJJ45Yu5Wx6gTCPlNQpDHd1Kg6Wpaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAlXe2g2+6PuTNx8kppE9mxp+/mn5RQbUZV6MvF4d5E=;
 b=lijPx0TyKkQIvnVvXZhO3ePfjWyHhZHBn7ihx7Nm1lxfg2IB9D7jlenYTJrsNPOL62304nv7A7z8VusTPTARFY6mf0aLihyA+aMsvd5+WO4zCB+YwJJoAawZkmkcSxNADJ0WuWSzKXXQiedZYGmtOFxvnBl8g6LJUf5TNKhEeXF/4g9x9Bxj3yvj9X/2oqSF/v0WXVEbwYloxg2Kuz91Q3cCCu/olT7WbpzDaKtWvMp8yeuA12DrVJKAkcIE3xFRDopE8cYFBfWDeBF/0sBPZ1qyAIPJXAXCkQyMqZlqEnJbNwQY+Q/wCptADEuXYrErv1Lo5zEBIkpnFghtN0cpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAlXe2g2+6PuTNx8kppE9mxp+/mn5RQbUZV6MvF4d5E=;
 b=Wq1FePddonb2ArpNNwqoI8/9WVOICEdDgwFWsecD9NA3CjfgZIcLdH4Ep5fp5IEWQg6k7NEuk1gZ69g2MzuUnfAYibzrmU3dajhxAVUEBL9rSj6Zc11Q2g+k8XBCKrrvVhc6cBsigVzMe9yCpc6Y/UnmLTSvEVAfqiNSNEJ5YffC5V4W0lQ23Z3x6GOYFhO5+0A/7Cq/hW5Z3Lr3BFTkquMaJ+5HB2Uofc1+fHv/8FXfbT4XwhbGqFl0WDvCbTit6Tlcq3rO9UfPRuyH6GZG2ckljH6XG0rWMtK3SoEDfUgluy8YEwYJTPcGFfAFtOMSLJOQ5plY9Fe/Om85L8u65A==
Received: from DB8EUR05FT051.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::4f) by
 DB8EUR05HT023.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::117)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Sun, 14 Feb
 2021 18:43:19 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc0f::4d) by DB8EUR05FT051.mail.protection.outlook.com
 (2a01:111:e400:fc0f::397) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Sun, 14 Feb 2021 18:43:19 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:61E1B06AF39F4E1AE25A6FE8F77C67F0469E72A96E7B882C19F93D8B91FAA6B7;UpperCasedChecksum:7EFACB0923065D77AE359833A413093663987D91FBC253FBA31A4D874ECB7684;SizeAsReceived:8674;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.039; Sun, 14 Feb 2021
 18:43:19 +0000
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: add ${PN}/cve.log
To: openembedded-core@lists.openembedded.org,
 akuster808 <akuster808@gmail.com>
References: <20210214175942.1981711-1-akuster808@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46422BBD6C5317F01D038450A8899@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sun, 14 Feb 2021 19:43:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210214175942.1981711-1-akuster808@gmail.com>
X-TMN: [7ZUuZYO6qBM5VMW606GcnVYao12JyJhw]
X-ClientProxiedBy: AS8PR04CA0224.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f2::19) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <a37ff04a-1f24-690f-61ab-2fe1146a53d0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.11.254) by AS8PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:20b:2f2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Sun, 14 Feb 2021 18:43:18 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b6f16ca7-5ada-4ec0-3595-08d8d11865a6
X-MS-TrafficTypeDiagnostic: DB8EUR05HT023:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tdzu75zsnZR/vlBW08dSayXAsO4v5P6tN/cu+lWTC+YyXmKzwOzvSszBJlaUGgrJFRkSxGgRjosRm5qS/aiibPLZCmgWMQbsGNNJ1tgy8tEhxrrwgflAUedupZ3uHGb1T6yK0seB68BtARnMwitE3Fqpx2jU31P+VJMOEQnj6Jzn8ZnnEF1/DxQUiybIc8TPpB7gimTPCAujHGyIJHWMlB+Nt+I0LIksULfIQrJZ+VUAnLeK8ZkMrRoefAfA/L5csovvm4Nw3e70a/kgmglQI9CgLUnra/C42ZUHh2GanC4LyCJk1SsJAYOoSM0h5xlIWEUi7ouiEtdWujAI0UXiU+mmb0Drc0xX3LOVw0N7nDswb6XXBaYCD3yQXyAjRvSJnVpZTSBv+HT/tIYMV7rLyP8kySDJtbSRFaH+n0mW3CU=
X-MS-Exchange-AntiSpam-MessageData: 
	8sPsKWWZgFRnnKEQ3TTqALik9uUXhveQr2ql7m3w38hy5layYEjx2BtrVGRj2OZQoQe9zZ1FY1qUaAU2TkXmVszp1Qbv5EFNGTGPu4B4ZcGajA8Pw0ZyJm4lkvh0P1BhPEbPdg6l/JoQpmPBi1O5jg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f16ca7-5ada-4ec0-3595-08d8d11865a6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2021 18:43:19.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT051.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT023
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 14.02.21 18:59, akuster wrote:
> Let archive package cve.logs too
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/classes/buildhistory.bbclass | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 8ed420174e9..a119981d9b7 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -1067,3 +1067,27 @@ def write_latest_ptest_result(d, histdir):
>                       bb.error('Failed to run %s!' % cmd)
>           finally:
>               bb.utils.unlockfile(lock)
> +
> +do_cve_check[postfuncs] += "write_cve_result"
> +do_cve_check[vardepsexclude] += "write_cve_result"
> +
> +python write_cve_result() {
> +    write_latest_cve_result(d, d.getVar('BUILDHISTORY_DIR'))
> +}
> +
> +def write_latest_cve_result(d, histdir):
> +    import shutil
> +
> +    input_file = d.getVar("CVE_CHECK_LOG")
> +    pkg = d.getVar("PN")
> +
> +    output_cve = os.path.join(histdir, 'cve', pkg)
> +    if os.path.isfile(input_file):
> +        try:
> +            # Lock it avoid race issue
> +            lock = bb.utils.lockfile(histdir + "/cve.lock")
> +            bb.utils.mkdirhier(output_cve)
> +            shutil.copyfile(input_file, output_cve+"/cve.log")
> +
> +        finally:
> +            bb.utils.unlockfile(lock)

just theoretically if bb.utils.lockfile raises an exception `lock` would 
be undefined at this line

> 
> 
> 
> 
> 
