Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.80])
 by mx.groups.io with SMTP id smtpd.web08.1480.1606875629590593141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 18:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B7/1TbHJ;
 spf=pass (domain: windriver.com, ip: 40.107.220.80, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGilh9otRnT5xKZNaF3frxUqNmQk4BhpK94kT0vxF5NrbmgYZdsboAjTuX0ZXXpZbwKUcf0JZNBdrn1v9onlSZM3E835bS63ot5JaIW6bdXbIyF1u1TzOKcZzdEev7MtzNTMqfMPHSSoXmRuOymId9gg4a3C5ttFXXZX9ya1s3Oj+GWGCbI55TdV/GGyahe9Ecby7diPLiZNzvm1/GfuXuDeoWd9d10iyJZ26KVHv0oxvR7KHdsohE1CFAR2JmBpjE7TA4m6KmU33ffAqwgHiApUg0oui5wQgGlacJ6g4gcqes1RhGTqPd6DYxeCJ88EMCef9KUyCzVmWGDi85h/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPPJaAEoadmf/S9apMO/TPclBh3cL9UnFzhWCokmxtE=;
 b=B5dedEpK3ANOwUzjqAbPvRzof+rWcnH9irMMkLg9/9zJJVrWBBlU5MIkp5gKI3DH69x2c0jEcOVdNRyPqveB6XYc7l7liiLKyl06bV3/cGoL/IuwshZXqpdWpr8I1Mp60Noda/UJ1W7HyWclP7jI4cdK3ubTQOVkQ4UJS/qUA8iC4J5M7gr/jHWi8aASbKkleJMjjlQCmbS/PpZkKjmv37reYowUKqT3lUdfae+gwm0GMsH10UbMjV2egdndMhr/7u+/cyr07Z/YReztT7o07nXQSLphPeoEsBwxeAABbNKa8ZiI+YqRftp175RIKgzC7itt+zpEvQBanWcW/96nSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPPJaAEoadmf/S9apMO/TPclBh3cL9UnFzhWCokmxtE=;
 b=B7/1TbHJB7q6xRl2CTKyPeqhU/d43NSfIAj1vGvOk/mnqdDHus71NVgucRP8apPKjhLSze33GO0YvDG5AUa4ZG3Tn3rLDouo6euugdD3aMn7018o4hEs/WbT+h8PotTtbBKu3JkYnHOHvHFZDbm8RBNrHXUKxo0geczaG2s4Tzc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1981.namprd11.prod.outlook.com (2603:10b6:300:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 02:20:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3611.022; Wed, 2 Dec 2020
 02:20:27 +0000
Subject: Re: [OE-core] [PATCH 2/2] connman: set service to conflict with systemd-networkd
To: Jack Mitchell <ml@embed.me.uk>, openembedded-core@lists.openembedded.org
References: <20201102092012.15968-1-yi.zhao@windriver.com>
 <20201102092012.15968-2-yi.zhao@windriver.com>
 <f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <bdfe3b74-d0ff-6d53-4a8a-2195b9b49497@windriver.com>
Date: Wed, 2 Dec 2020 10:20:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0080.apcprd04.prod.outlook.com
 (2603:1096:202:15::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR04CA0080.apcprd04.prod.outlook.com (2603:1096:202:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:20:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307ed1cc-2039-46ea-a09d-08d89668d54d
X-MS-TrafficTypeDiagnostic: MWHPR11MB1981:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB198103AC768F99507C46732CF9F30@MWHPR11MB1981.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hYKQa8sIZiE9ccWzKGZsNFwsJZXn7IonvoTsOAo2eoVxni8AYSeR00xYpTkpt6Y4+JGu8q2s1EX456moEqCQMUtKDLBsQkgDb4gLKY/Gru6DmpN77OAbvkCZJO57deS384dTEVyEqs9AYvYfvYC2j7pbe73BryQNbUlAiVyPMJAEJupxn74+EcmA8S6Pg+MW7WGzbQVTyaYXCdFFZkBzphQCq2jORv6dDbXfqAD4vSh2nMsVuAHMe9RL/XbI3Mhj7CGmkDnQJUeNyaOcbi7OpwoBX2chhOfmKvcnHUYekAIgpPTheQio6VAU3fwiGk+h3FsUCmGeLcmqPOrnfK/9QC2zdF/TD0+xBn7p1vobbIxvx9gDq1CM05VZBU3zb+3+YCemla37/fRh/xmmhfGUgoSrPteR8kTUUDXaKNGpE2/MgXX8U8N1Xr2pPhXlx6IKm+G8DFxfmPmUdClSKGkhRe0G0nY7jh787zLyS9VItV9+OxqScfc7NjnLST3bT+A1BSut+S/uWUK156LgluMRIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(186003)(53546011)(6706004)(6486002)(16576012)(31686004)(36756003)(6666004)(316002)(166002)(478600001)(966005)(31696002)(2616005)(33964004)(44832011)(2906002)(956004)(5660300002)(8936002)(86362001)(16526019)(8676002)(66946007)(26005)(66476007)(66556008)(83380400001)(52116002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cktaN2drRXpJbHI4ajlTZDZIUWs2WUJwbVVUVTdpOEdQRHBxdHBKbE9nTW12?=
 =?utf-8?B?LzYreHhsM0ZQWEJUSzh6Q3JUb1NLQmlsZmpoQkYwcUl1cjh0QVQrcy9pTHZH?=
 =?utf-8?B?N3FrMXh1YTV0WHluTXhOYzZpOCtLTFBNaVBxWDh2VC9HeEFWUTBLWFk0RUp6?=
 =?utf-8?B?NjhScmRIeTFmUWo0czBTVnlnM2o1VEZqZTZkV0pRalRFMG0xaG9OdGx0RndW?=
 =?utf-8?B?RHArU3hnWG11cVhZUWFKdEU0aDZYbk5tbVNzbWRGR0piVExoZXhLUHZIaEVa?=
 =?utf-8?B?SDNZNFNPSW9wQ2g1TVNwcTNjZ0JBUm9zUW1URy9WbFhQUUxncC9Ma1BHSUcz?=
 =?utf-8?B?SkxWMGhRZTBXRTBYRTczWldsdENTSlY4MTZ4Nzc5RDZnSXM4TWIwOGp1Vi9x?=
 =?utf-8?B?MHA3eEZmZG5uSnJCUFdDN0srSnJPNWdMK2Z6eEFsNWJHMWRZaHVsOGgxMDVS?=
 =?utf-8?B?SWtaaHpQWkhVTURSVk1PY2dHTk1vNFZweGpsTmd3dzIxQkZPV3R2VWU1Rkdk?=
 =?utf-8?B?YnAzWWpuRTJMdHh0YkJVaW1CbGwvQmNrZlJ5QkFINXhJTDUycllFeHYrK0wz?=
 =?utf-8?B?MC9Mam9BeGxja3JJTzNnRXB2WVNySDJya0cxQmJhK0VPTkU3ZnpIZ2grU081?=
 =?utf-8?B?MVpPQVZ4Tmo0bURZZ3g3dE9WQVh3eVpNMG10Q1QyVXdmNEhyQi9BQW5QZHE1?=
 =?utf-8?B?T1crQkRvZUN0eVU3WExoZG5iSFdlbU5peGxnVm1QVGxXelNEdnp5ZlhPL1cw?=
 =?utf-8?B?ZHlROHBRK29Uc3pLckorRmhUTkJqUndWNS9ZZFI4bDR1WXQ2Q0FJUFJDdzg4?=
 =?utf-8?B?d2M0dGlFS2I4MnZmS3Z2aExhcWhINEJUYklGQnltKzgySWN4TEpDVXMyNUlR?=
 =?utf-8?B?d2pjM0V6OWJFQjljNEduam9KWU1MV0RLN0RrakVPSndocmt0NGtzemFtQlRX?=
 =?utf-8?B?TjBDK3VyQ1ZrV2RmdmhFZ1B1R0hpNndVNUNUbHNXdnJNMGt4WHVsNCtnSXVG?=
 =?utf-8?B?ZkdFRjBUdmY0b0Y1QzgzV0hjMUdySTRxRDNPMnlOZVBpZTRxS1FBeGQxeFNx?=
 =?utf-8?B?MUIxR01NNDA1dWJzc0NSMmVBNnhIdFI1eFhMSi9raExUUWNVTmdIU0czRUNu?=
 =?utf-8?B?N0JHeC9FNVlPTk1IeTQ3Q3U2MjhZU0M5bSsyblVhL2l5MC9wdEZEdUJEN1ll?=
 =?utf-8?B?akhUeHQvNFNzaUpSOEl1MzRZakZsOTNpNWVSQXZsa0ZQV2xMZkxXUVlLczNu?=
 =?utf-8?B?dGRCMkx3eWtBVlN4ei9YL21FMmlSb1dkNFg5ZDRNUlZ4eUNLcVhkS0pWd0Ex?=
 =?utf-8?Q?cBAE0ificRXj59D1KFMUmvn7Y1wuQzopdE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307ed1cc-2039-46ea-a09d-08d89668d54d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:20:27.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ag2V6iNc4IfHVMh26pCxmhzd0ifwEHzbA+FtBIGDV06dFTn83d1wm2rcglF67AdBtw3+SCMhCasVX8Q8Zxb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1981
Content-Type: multipart/alternative;
 boundary="------------F1A6F8D7CD59B718A77C408A"
Content-Language: en-US

--------------F1A6F8D7CD59B718A77C408A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/1/20 5:02 AM, Jack Mitchell wrote:
> On 02/11/2020 09:20, Yi Zhao wrote:
>> Do not run systemd-networkd and connman simultaneously. These two
>> network managers may conflict with each other.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...stop-systemd-networkd-when-using-con.patch | 29 +++++++++++++++++++
>>   .../connman/connman_1.38.bb                   |  1 +
>>   2 files changed, 30 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
>>
>> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
>> new file mode 100644
>> index 0000000000..dd012750a4
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
>> @@ -0,0 +1,29 @@
>> +From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Fri, 30 Oct 2020 13:48:45 +0800
>> +Subject: [PATCH] connman.service: stop systemd-networkd when using connman
>> +
>> +Stop systemd-networkd service when we use connman as network manager.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + src/connman.service.in | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/connman.service.in b/src/connman.service.in
>> +index 79e75d6..014eafe 100644
>> +--- a/src/connman.service.in
>> ++++ b/src/connman.service.in
>> +@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
>> + After=dbus.service network-pre.target systemd-sysusers.service
>> + Before=network.target multi-user.target shutdown.target
>> + Wants=network.target
>> ++Conflicts=systemd-networkd.service systemd-networkd.socket
>> + Conflicts=systemd-resolved.service
>> +
>> + [Service]
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.38.bb
>> index 027c41e9af..45c2934dec 100644
>> --- a/meta/recipes-connectivity/connman/connman_1.38.bb
>> +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
>> @@ -3,6 +3,7 @@ require connman.inc
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>>              file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>>              file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
>> +           file://0001-connman.service-stop-systemd-networkd-when-using-con.patch \
>>              file://connman \
>>              file://no-version-scripts.patch \
>>              "
>>
> Hi Yi,
>
> This breaks our usecase where we have been using connman and
> systemd-networkd in tandem for a long time. IMO this should be reverted
> as if the two applications are conflicting then the correct fix is that
> they should be configured so that they don't both try to configure the
> same interfaces. As systemd-networkd doesn't ship with any rules by
> default it shouldn't be doing anything to interfere?


Currently, A systemd-networkd configuration file 80-wired.network from 
systemd-conf package is also installed by default on HW BSPs. Comman is 
the default network-manager in Yocto. It will manage the wired interface 
automatically. But with this configuration file, the systemd-networkd 
will also try to manage the wired interface as connman does. They may 
conflict with each other.In addition to revert this patch, I think we 
should consider whether to install this configuration file by default. 
Maybe it’s better to install it as an example and users can enable it as 
needed.

Thanks,
Yi


>
> With this patch I can no-longer run both services as it's a hard
> conflict with no option to either revert locally, or bbappend this patch
> out.
>
> Regards,
> Jack.
>
> 
>

--------------F1A6F8D7CD59B718A77C408A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/1/20 5:02 AM, Jack Mitchell
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk">
      <pre class="moz-quote-pre" wrap="">On 02/11/2020 09:20, Yi Zhao wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Do not run systemd-networkd and connman simultaneously. These two
network managers may conflict with each other.

Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 ...stop-systemd-networkd-when-using-con.patch | 29 +++++++++++++++++++
 .../connman/connman_1.38.bb                   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
new file mode 100644
index 0000000000..dd012750a4
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
@@ -0,0 +1,29 @@
+From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
+Date: Fri, 30 Oct 2020 13:48:45 +0800
+Subject: [PATCH] connman.service: stop systemd-networkd when using connman
+
+Stop systemd-networkd service when we use connman as network manager.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
+---
+ src/connman.service.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/connman.service.in b/src/connman.service.in
+index 79e75d6..014eafe 100644
+--- a/src/connman.service.in
++++ b/src/connman.service.in
+@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
+ After=dbus.service network-pre.target systemd-sysusers.service
+ Before=network.target multi-user.target shutdown.target
+ Wants=network.target
++Conflicts=systemd-networkd.service systemd-networkd.socket
+ Conflicts=systemd-resolved.service
+ 
+ [Service]
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.38.bb
index 027c41e9af..45c2934dec 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.38.bb
@@ -3,6 +3,7 @@ require connman.inc
 SRC_URI = &quot;${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch">file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch">file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-connman.service-stop-systemd-networkd-when-using-con.patch">file://0001-connman.service-stop-systemd-networkd-when-using-con.patch</a> \
            <a class="moz-txt-link-freetext" href="file://connman">file://connman</a> \
            <a class="moz-txt-link-freetext" href="file://no-version-scripts.patch">file://no-version-scripts.patch</a> \
            &quot;

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Yi,

This breaks our usecase where we have been using connman and
systemd-networkd in tandem for a long time. IMO this should be reverted
as if the two applications are conflicting then the correct fix is that
they should be configured so that they don't both try to configure the
same interfaces. As systemd-networkd doesn't ship with any rules by
default it shouldn't be doing anything to interfere?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Currently, A systemd-networkd configuration file 80-wired.network
      from systemd-conf package is also installed by default on HW BSPs.
      Comman is the default network-manager in Yocto. It will manage the
      wired interface automatically. But with this configuration file,
      the systemd-networkd will also try to manage the wired interface
      as connman does. They may conflict with each other.In addition to
      revert this patch, I think we should consider whether to install
      this configuration file by default. Maybe it’s better to install
      it as an example and users can enable it as needed.<br>
      <br>
    </p>
    <p>Thanks,<br>
      Yi</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk">
      <pre class="moz-quote-pre" wrap="">

With this patch I can no-longer run both services as it's a hard
conflict with no option to either revert locally, or bbappend this patch
out.

Regards,
Jack.
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F1A6F8D7CD59B718A77C408A--
