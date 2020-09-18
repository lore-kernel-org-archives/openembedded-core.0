Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.60])
 by mx.groups.io with SMTP id smtpd.web11.8985.1600421169087386891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h5zyX5bP;
 spf=pass (domain: windriver.com, ip: 40.107.237.60, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwTQtdSOQYVxkX3Drc7fj1l8DINGWt7KBYeoS17DY8aUiJjcU3aPBXT4Riddfc8MoWQ3ZXL+U//jZN7qtMNL932O2crIm4KIA2B97FnoZDCZ7O8/6IEc9nhDKacNfBxSXPB1IiBB7uyCjlo3Lhf6e0sgCasKYa2K+uLm2MCQMNs11xqjNFcXUdfpV2xP19y0eXbqykVerRQ5FqnWeWyGYAYcgpQeshCSa/LTdPoYPHfN3Hvi4JJ3zB1khCxlujTQ17rzFmoMrFYiI1pwfiacUuFZRst/3VbKjcSaqhLgnJGAXZBm6NSQ0Be4vA3lbfVYXrUrlSaTfICJlxls6gB2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+GKpOUJer8yNRjoBk60ZfjgtcPSfOkn9d4IGPvohy0=;
 b=m4rVjYclHNT8WtLWw84Jw4QquCUjRSaoZakvgKbbU72UiHzdkV7nTJX9RX70tNG7CUgcZxkblGiyTU+dSOt4/MffENrXgx23yqcugwvs/XGbifMRkfX5VJ+Ye8zY7K96wLXXNaHq2zJ4xr5X+hD7v/ljAceuNFA4g642apBuNSOjLGtsHXt744gmNb0mbXnd6uvDljA4viIZnP/wj1wOB/BFG3vCFDI7xWeX6CwZ1nk3r9HhVsYl6JIGS9X1d3jNqeaVmLWR+zSE9hEh24XR9LPu35NBCB2sv4pwfiHr2BBei9P+Yxh4CD480AmOLKkjlEIG7Z2bsCGujdK0Mu3oyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+GKpOUJer8yNRjoBk60ZfjgtcPSfOkn9d4IGPvohy0=;
 b=h5zyX5bPm/T2PyAx0HOZvdQVTGdMwgsTYqhhfndTIB+MmyOxCxUkgrTyy8K/hwznGbqxjUbxNAS+lUTeYxdFicwUZ0jQ+y0R+Jd3nrSsyJWYQMV9W756lyWgFch8VpJwBbn+aBFtGaERN/rbqolCwYr4i7oZqmX6/xN7NEOJPW8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 09:26:07 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc%7]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 09:26:07 +0000
Subject: Re: [OE-core] [PATCH] kea: create /var/lib/kea and /var/run/kea folder
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1635D653F943269C.24495@lists.openembedded.org>
Message-ID: <6ad76c69-1e27-7255-2be0-ea25fff4cdea@windriver.com>
Date: Fri, 18 Sep 2020 17:22:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1635D653F943269C.24495@lists.openembedded.org>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 09:26:06 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a59093-c6e9-4dfd-d516-08d85bb4df51
X-MS-TrafficTypeDiagnostic: BYAPR11MB3670:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB367087C99E555A71FD6EFF99F13F0@BYAPR11MB3670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q7kiDAeKxvRThnR1l2YjwFjugsjpdI3RHW/6+GYo7QLsxWib+OkC+2Hku405ZbxUQKG/EJz/bkOdtvPQxWeySkRlSqp4xtr7MtVeGmRC9TIz/cZuYk4vmvIPzzUlnY4JNQk1T2hwSKej0fQZQeeFB7/6pos52iInwdMMtsJFJlSIAy7AOGreuxdyblArAQYrcG40mlTefo3J9m3fTm9dmX1R/NHRJJ7XvBXaVBXvr/r8SdlSvlY6OvdTD3gTgyACmaGFfP5WJEOfdZa37SvWUoeU+E4pCt2l9arrwnx7pVJlBMnipQCfJ3Kyju0/NPqD3aHmbcudJ1UVjMDAAWY3r1g9RC73uhebQNOn8y24GGc514qaiYhDsqoZC7aDv9QjVv0s/L+z35mm+2vhlBrE3yZPSrY7b+pQXT8nak2sR3NR+wn9gfpMyCqYHsYbM+0Lr1t2U7111k8gs1GARcttvqkgrzb1/9JwCg/45QwaPTiUvbF1TzuKX5/+GoScyRMz2rM38jIK4y0sqPK6LkVyVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39850400004)(396003)(376002)(2616005)(956004)(26005)(966005)(66556008)(66946007)(66476007)(6666004)(8936002)(52116002)(8676002)(83380400001)(186003)(53546011)(86362001)(6486002)(36756003)(31696002)(16526019)(2906002)(478600001)(5660300002)(16576012)(31686004)(6706004)(6916009)(316002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cTuMxmkM1wOoXUm8ClCZOsa76wuuezf3bYSwf/Mq/sVdzqK1BcA2c1i2ENpuyDst/pNP+YZt6uuM0A1MHR1IZ/DWRW0R1zpWn1/7lS5t6+0oTfj65fffh9SyYWGHu17Ub0NehRGOAVgdL0PoeiyseV5pHM8tDUmtm/a1dIG/F4/j50sJOqsMZfWAJOR+gdLC+eUZ0Gi+K2MqqrnaJga6rYZIQRkW0nX3d6hi1WVPps2enT/oayXiIIGRstsTJdAN3zn0Ug3Cdk7XBg49Ym2R9sh2UgsrvDRPxmZpflgZGbnsacQhklZJGpmPVhmRQcvCQjQSvJvekmGKJ5pyWj59UkZt9RRXEkatdy54HV2VzmAT3mw1ZIJGsP6Jxr75pmg5bDz2IL5IIB04ZFN6XTiBE0ZgjOA5fgzVYpXr9I+dr+ccLAhqOBAdoRe6bWjGTBVfv4I8hiMKkb5Ugo3rxm7VgZotiVQyKbPN1FVxWe3m9Ybx79AwGHAqD2zPm6OR87Q78eVTrcKJe7mkJqoFIsXc1CXAYRxZgn1vKtZ0Upj+YXprMK4r0vfzI+eEPTIHue0QjFEccETMwtR5IiqSVtRqraeFeUPpDvh5RmYO30OwMyHvk3ya9Bp2nUgqaI+uOZDfRqJZfhjGpyK0QpNvcvK02Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a59093-c6e9-4dfd-d516-08d85bb4df51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 09:26:07.4536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+L1q1FSLbPXDuhiSd7D/htxgbVaNxz2OAOwGHyBPCO0H5XZh1NtJM9k5L7d5ScGe75XCYLmu5lU20CIqbOASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

A typo in the commit message, please ignore this patch and check the V2.

Thanks,

On 9/18/20 5:21 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Create /var/lib/kea and /var/run/kea folder if they doesn't
> exist to fix below error:
>   # keactrl start
>   INFO/keactrl: Starting /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
>   INFO/keactrl: Starting /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf
>   INFO/keactrl: Starting /usr/sbin/kea-ctrl-agent -c /etc/kea/kea-ctrl-agent.conf
>   Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile
>   Service failed: Launch failed: Unable to open PID file '/var/run/kea/kea-ctrl-agent.kea-ctrl-agent.pid' for write
>   [snip]
>   ERROR [kea-dhcp4.dhcp4/615.140641792751488] DHCP4_CONFIG_LOAD_FAIL configuration error using file: /etc/kea/kea-dhcp4.conf, reason: Unable to open database: unable to open '/var/lib/kea/kea-leases4.csv'
>   [snip]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...e-var-lib-kea-and-var-run-kea-folder.patch | 39 +++++++++++++++++++
>   meta/recipes-connectivity/kea/kea_1.7.10.bb   |  3 +-
>   2 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
> 
> diff --git a/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch b/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
> new file mode 100644
> index 0000000000..ab3fd83946
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
> @@ -0,0 +1,39 @@
> +From 639dc25cdabc9d1846000a542c8cc19158b69994 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 18 Sep 2020 08:18:08 +0000
> +Subject: [PATCH] keactrl.in: create /var/lib/kea and /var/run/kea folder
> +
> +Create /var/lib/kea and /var/run/kea folder to fix below error:
> + # keactrl start
> + INFO/keactrl: Starting /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
> + INFO/keactrl: Starting /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf
> + INFO/keactrl: Starting /usr/sbin/kea-ctrl-agent -c /etc/kea/kea-ctrl-agent.conf
> + Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile
> + Service failed: Launch failed: Unable to open PID file '/var/run/kea/kea-ctrl-agent.kea-ctrl-agent.pid' for write
> + [snip]
> + ERROR [kea-dhcp4.dhcp4/615.140641792751488] DHCP4_CONFIG_LOAD_FAIL configuration error using file: /etc/kea/kea-dhcp4.conf, reason: Unable to open database: unable to open '/var/lib/kea/kea-leases4.csv'
> + [snip]
> +
> +Upstream-Status: Inappropriate [config specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/bin/keactrl/keactrl.in | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
> +index 12b2b3f..47cf6f9 100644
> +--- a/src/bin/keactrl/keactrl.in
> ++++ b/src/bin/keactrl/keactrl.in
> +@@ -482,6 +482,8 @@ case ${command} in
> +         # The variables (dhcp4_srv, dhcp6_serv, dhcp_ddns_srv etc) are set in the
> +         # keactrl.conf file that shellcheck is unable to read.
> +         # shellcheck disable=SC2154
> ++        [ -d @LOCALSTATEDIR@/run/kea ] || mkdir -p @LOCALSTATEDIR@/run/kea
> ++        [ -d @LOCALSTATEDIR@/lib/kea ] || mkdir -p @LOCALSTATEDIR@/lib/kea
> +         run_conditional "dhcp4" "start_server ${dhcp4_srv} -c ${kea_dhcp4_config_file} ${args}" 1
> +         run_conditional "dhcp6" "start_server ${dhcp6_srv} -c ${kea_dhcp6_config_file} ${args}" 1
> +         # shellcheck disable=SC2154
> +--
> +2.26.2
> +
> diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> index e2560b2399..d3c8834b46 100644
> --- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> +++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> @@ -9,6 +9,7 @@ DEPENDS = "boost log4cplus openssl"
>   
>   SRC_URI = "\
>       http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
> +    file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
>       file://kea-dhcp4.service \
>       file://kea-dhcp6.service \
>       file://kea-dhcp-ddns.service \
> @@ -46,7 +47,7 @@ do_install_append() {
>       install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
>       sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
>              -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -           ${D}${systemd_system_unitdir}/kea-dhcp*service
> +           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
>   }
>   
>   do_install_append() {
> 
> 
> 
> 
> 
