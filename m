Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.30])
 by mx.groups.io with SMTP id smtpd.web11.8665.1631784677738848725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=HBnG0Al6;
 spf=pass (domain: outlook.com, ip: 40.92.90.30, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gi1OYBp4vij6QJ1T6AfSXmtSvdMzwsTTwHvh4dthkHcN8ePvauxkuDMXC5pNsinu97N+eRKMqlqeqHky1rpgV2qXjcLFCruuc6q09BaXzKJ7k9LWMXa4JEkdXWzoLDHyOBIyBN5BYNPfTT+M1eKPXoD0iYpKjHXnmJNLGHrW0pHMcOQu+Oj8yoY9I/QbmcVzokwwUunPgQk8+mWBgsBlDN8jnF3FlUsit6iUpvFadB0D5CPLn5DErT+J5kebxRH5gAY4QVIk+OSc7E054b68QRHgxPhbXPGVCDeGyx3YVoHRZza7N7eweYmH4V+ximQgn8f8gK3oYBgKs+m+asoSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=j4/vyBvDr3t67tstJW3xBUz2sm30W10l8t5TYlPpIFg=;
 b=cJjX2kbrRxIBp4nN5hcnlKTIKhas58vBkrESHbFCLCJcOOg+HQcX3G7Zq05r/TAT3wqOKeUuNzVin0V5tEmTJV1HNTqtFdkHkuu+NTzc7HjVoiyMjtxKGvv3Bjnpa05qQMCHpu8sDF6vWS+ZOKxk8jFGYwIBG9K+IQXka9r9fcYs1C/4SbPoqoTfb6gAbA5iKgMSI2rvi/xKa5VteROGUh1LMlBihlQAjifJt/0gSc0zxGsSAZdu8eCwr9PXWpzdn8Uf3BPcOomtqKfr/rB72hDndgHPs3b7pLjD/oF/XfknVhDHlpr1fNe4Lvzt9QymQm5Swv1PtbrOcihxzRxJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4/vyBvDr3t67tstJW3xBUz2sm30W10l8t5TYlPpIFg=;
 b=HBnG0Al6LAir8nERBo7gPm6DtkEaSZ92zLVNSscDY9t30NoN6V6toqKyCbcVpIDAYXMIl4DXvEe6K5Yf3jweUaSeP6WlI4K9hxaKosa4C80pw1y78dw/TbmI59CrDKxhu6eHlNJOOgKx2mFJUBn+jUzYbBFd96R8+XzuWNcRBBZ7Da4oG7sFbX62fhyJVTca5NMGC34m0bo1Jry/pXGjDYtIc6bObRbdz2Hdhe1MzoiNLmK7sTW81ufqXpnHtxxB/3FnC+RxPJnLiMcVuucxLt6kZVyyaB3gID0zTlgz+MIkp8RvvFC1LsuCQuDMc09jkwaJok9C3ER2y1uciiXk5w==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4195.eurprd09.prod.outlook.com (2603:10a6:208:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 09:31:15 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 09:31:15 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: Undeterministic expat fetching failure
Message-ID: 
 <AM9PR09MB464214DEFF6D34CE649495DAA8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 16 Sep 2021 11:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
X-TMN: 
 [fpxeA8H7MYzCo3YQMjSfX1hXs4xekNXMsX21LmLUyqpQyAkGdiJR+L5VWgJYPCUUWp/gyO6INco=]
X-ClientProxiedBy: AM9P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::8) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <f55bc620-c2f8-be95-637a-158cfcf92037@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:11df:cd87:699f:18eb] (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by AM9P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 09:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cbf282d-e2f9-46ea-513c-08d978f4bad3
X-MS-TrafficTypeDiagnostic: AM0PR09MB4195:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2cVtIj/n347IskQ0T5xEdaqxNNd7Xhy4GR8coPMsTbsvzhOSYU3xF5GXC8fQk2lHsGC6p0AAjMk8PZlIFyH53Hs4LF004V6r1G/JkIFvgaOA+agmgnl1y1AM0ZTCaKR09g5UD6bPaFyiaFkvv0LUR98+YAc0WmrypjS8ZeYHMsWP1f03fyZl5iYNjHQlLw/FVlN/RLHmseb7BrcIRhUpr0ttpDrV7xnE3BZwpZDS+3Ys2Tg6xz+abgzR4xv1rNh8+k93J3C0+VKDLGIzZrR3TajZquX8TKHA2F/jLOY2mgJ0yjWUOkmjzPUmd/koIj+dtdj45SCpmojvdf5SJOo+l0425CWskM1KUdeXE0ekHlap5c1Q/yqABVJzz/W6Ggcj7l0Lt2FiLpqeYJ6UyxmvF2on3jXftwsi2RaTO5Oz0Kw3UwbWapup7JnvkGZ2wV5lHSTs6pHhsuOoainqsb6WJbBYaxWH2wMCwAK8AY1G+TQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Pu3l6uNfTqW6JV5vpHbGcHacP7OxKg5ebGpZ7W5Jgdybn6AQaJSQXr5Ii/1GcL5YPrHWOTxXJFqnwE46d7GPqNcmAivUISvTSPNJarL35ZQsq+/mQK335F3mepdoKXZbMblZKrxnGIkrF25Oc9njgTfxHWTewvSyVh/VOkcRVx1pQT14LorbVTOsLSSo+9LRgPw5TqVY4YZexd2oiELucQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbf282d-e2f9-46ea-513c-08d978f4bad3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 09:31:15.6059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4195
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

ERROR: expat-2.2.10-r0 do_fetch: Fetcher failure: Fetch command export 
PSEUDO_DISABLED=1; export 
PATH="/opt/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/opt/build/sources/poky/scripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin/x86_64-scatest-linux:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot/usr/bin/crossscripts:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/usr/bin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/sbin:/opt/build/build/tmp/work/core2-64-scatest-linux/expat/2.2.10-r0/recipe-sysroot-native/bin:/opt/build/sources/poky/bitbake/bin:/opt/build/build/tmp/hosttools"; 
export HOME="/github/home"; /usr/bin/env wget -t 2 -T 30 --passive-ftp 
--no-check-certificate -P 
/opt/build/build/tmp/work/core2-64-scatest-linux/expat/downloads 
'https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2' 
--progress=dot -v failed with exit code 8, output:
--2021-09-16 09:13:26-- 
https://downloads.sourceforge.net/expat/expat-2.2.10.tar.bz2
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 
204.68.111.105
Connecting to downloads.sourceforge.net 
(downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-09-16 09:13:26 ERROR 404: Not Found.

that one happens like every 100th attempt - and this seems to be an 
issue of sourceforge. (I got a hunch that actually not all mirrors of SF 
do still have the yanked version 2.2.10).

Also the projects moved to github a while ago - are there any reasons 
why the recipe still pulls it from sourceforge?

If not I could spin up a patch to fetch form GH with git

Regards
Konrad
