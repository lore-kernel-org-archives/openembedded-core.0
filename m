Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.63])
 by mx.groups.io with SMTP id smtpd.web09.131.1611702525367184572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 15:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dDvOXg7d;
 spf=pass (domain: windriver.com, ip: 40.107.93.63, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbZEkCQcVCWPwru3G0oyGgOV/nMRf5swJX4g4wHQXFGBy6DeMV7pGsgb5zij9ST+1tE9CwZ81O6TNR6YZzAgVKzdjxBjVgv4BIrdbyDQmvA6nxfI1EeFRdm6XnTjXOCOE3F9Z+/b+kGefbC4FqwK51cyEj+FiCJyUGb55skgKmhO6zSJS3zNlMMwlJ6GEOMrm4100L4oSOlQaBl8irN4XvhWVwU/ZHItgSo+kecPqCWUGEUvvdDxv67B3Ay7PGAAbPOM08gKCL5Z//KR2zrduCsPuf8WGq8LMAC8if85IbqIvkdswGVpPDR1cODCuxdJ+wkRBNqdiuJ8QNPsl7hLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GwRAXTdQvPZzKA6m7hh38GhsPqGyUC4gMUHcPLVmb0=;
 b=H+dnA2+B2reGxCjizt9lZlX9XSmVNeI5/VTqD7R/kbOr2rxlZauPxuOJiamZMekn6rLCiq4+TsIR7IRyoE/DclfCtAFM0rWcrGZzBP6drhLPTcE8rPTw/jvmYwegACE/1iaJIoe3NXHxk1L6+Ks8yH3ZTBcSaOPH4J2GQmC2t/5XnrdUtKBB6Do+GzZrCuRJHllrOBtXdxeLuz1msU05Xi3x8ADygHPrLqgpDyBUT6kDq5OK40DVe8aKaSXsl06UhGaqSFLajuSo9fIcFs2u+ht/gttORbJKaF23qzoeUXqhrankYNbSqgn7P5PdEb/D0RQXorpAgArmr+e8/SZuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GwRAXTdQvPZzKA6m7hh38GhsPqGyUC4gMUHcPLVmb0=;
 b=dDvOXg7dDgVqMc9ZT4ftTDrvCHytoQ+U29/xQUgwh7h+3aH5kIDsaBfxVs4iM6ikLEO6C599+MhwKfL1KSQO5HoPz3d0Ma9/YaAu+S0/rmsWfhDlFpM9Hp47F5mx2HDx+eykiF2ozKcgmesNK3h8xEzQz+psSeHMtRZRG5OVfhs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 23:08:44 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Tue, 26 Jan 2021
 23:08:44 +0000
Subject: Re: [oe-core][PATCH] sudo: upgrade 1.9.4p1 -> 1.9.5p1
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <165DEAC472D9CA7C.12137@lists.openembedded.org>
Message-ID: <c8d89382-6e46-8a59-7e66-6bcf14727995@windriver.com>
Date: Tue, 26 Jan 2021 18:08:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165DEAC472D9CA7C.12137@lists.openembedded.org>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BYAPR08CA0036.namprd08.prod.outlook.com (2603:10b6:a03:100::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15 via Frontend Transport; Tue, 26 Jan 2021 23:08:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039e759f-f3c9-4868-2dfb-08d8c24f53fc
X-MS-TrafficTypeDiagnostic: SA0PR11MB4703:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4703B3C4FE0EE3AE35B9A00080BC9@SA0PR11MB4703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n2RgVZ+QSspILYbi7vYnoN7mYVGM+Lc1ng7ALVcC8jSNdlXnV+BfLgMWbm4ycxtxHvCc8EqBhRh6b3DWGZadMIZa6uC9BGH/IcEZsVcpjWAMPZqEXkPJyTIHeBa07vGNGXYiuO6Og5RuzogDt6ePvHlS9pVsPhPZP3pyrw+YBYB83NmoJ7UPmfTvHGTtVOYgrObrmh87NOjkO1FOuUyEClFddNypNBV7Qf3OHzazpRXdUIiUTQTA7QGW6u0I+eNrM5uhyJuAlmpsWc2o9rBzteSHKtjW3ONJnTqQNimbs+VJ3pgMwkxghO84kDSREJk7KEzgdQT7NKv9iUE7b1Tx8kskMUbjrXXwErWDuewPuNDQM4quf9nW/xWinu1rBTBsUxnTSpENPKsyk76bQCkXfCqFWUBUL+fC1XoEymqKr6oWuNEyNEjYAQirWP/wDtqVItVjIYdxzQiBwcuwHha+p6lA4KqLf8XYZQ74TIuAX+QLVckylKQegjmPNxoap4uuJnV0nwgaqfMaqQWbHV9ywNwauzMXBRzRsrnM4LBduY9MINyF9DfUNQ1AH6393AAYsu/9XhPDuHFGlOnopL0F230mHQnPK1KM4418SvUIvbfQj05mWC2wy4oT78HNiZnsp/AcpUAG8XuDqVe7SxiZBgNdzdKHNR1xmQB/KXZdJVwcxVtxZzrY+AeOWuGhKD+m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(5660300002)(8936002)(6486002)(83380400001)(31686004)(2906002)(966005)(956004)(6916009)(316002)(31696002)(86362001)(16576012)(166002)(8676002)(26005)(33964004)(36756003)(66556008)(66946007)(16526019)(66476007)(186003)(53546011)(478600001)(2616005)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NkRQWnhaVzEvM090K1VUVmZ2eGFtNUlvN3NmM05UQUorNnk2Z1JEOFZLUlB5?=
 =?utf-8?B?UEo3bTFLR1JmT0licUlUOHhYeFJWMXN5TGtJU2kwalBtQUI3QnpseE9YMW5y?=
 =?utf-8?B?dzNzY3N0WUp1V0FYVTJBek83NTFmNG5KSVpURUlVNmF3QVNZNDhuc1B1QmVH?=
 =?utf-8?B?RldpSHhqQTVCRCtmdk11VkJOdXhZVG9iYkoyT2xHWXpFTHB4QzFXRHBQT1Fu?=
 =?utf-8?B?dm9xZG9BZ0hmOVl5ZS84U2srL05HWDBhazdVQmNjK2Z2eGZLU0RCUE1oVkpW?=
 =?utf-8?B?TW1yYTRKS1ZGd0dDcjRqZFE1V05TbHo0OEFqMzgvWHBFcTJZeHZvNTVGdTM2?=
 =?utf-8?B?SStlcnRPdzY4OEk4Tk1Jb3hPT0REcVFnUzlnNUV0TXh6bmxNaEVFQXZHai8r?=
 =?utf-8?B?bTdaL3NZY0VVMnM0K2doWVJXRU81YVh2c3l5YzY1a1dOY3dIdE5DNldkRGs1?=
 =?utf-8?B?Q1duemFmb1I1em5sTDJvcmZIU3hYcWJ3Q3BYd1FTa0MyZG5IWE5oanBwRmt3?=
 =?utf-8?B?cnFJaVllbE5ad1NIVTcvQkxrVWI0d1pXVnNMcHNqVDdHaTRiUGdUQml1eTBr?=
 =?utf-8?B?bERzSzNsbm8xT1M4UmZJckVWYW1SZkdCZ1ZhTHVEVnd2dCtFeDZsUnpFdU5P?=
 =?utf-8?B?dTF0Qis3RXVpdEgxTjJ5R0FLTWpSTGZ5d0pPT0t3S1ZrckkrcmdCRUN4bys2?=
 =?utf-8?B?MVllYVZ3RlhCY010RE1ISWRHaCtXWDIrUElkbzZBMHpmQVpGOUgwSUsvUFU5?=
 =?utf-8?B?YWhKUXFMNmplbUtOY0JXWk45MncwMmhGUFRoaVJwek80SElsNnp5Ynoxb3E0?=
 =?utf-8?B?NHJhZ05sR21lbUxkT0FMLzhtT0dJYVlCbFdiK0JvQU9rL3BNM0M4UHRUVEx4?=
 =?utf-8?B?ZkVxVkUzZGRsTWxQMm1HeUVTY1M0UjFrWk1mSUVMeCs5bWF1Ujd4QXFjUlQ3?=
 =?utf-8?B?TmQvVHpleml6M2RvTFNmSmg5akRQcFJaVkJUV3lwMzRDMks5b0U1SXMzcEJr?=
 =?utf-8?B?ZEdWMjdSZzlHTEZpZmt4UEFZR3k5bjlJVjMxd0RUNzdCZllEeEJzMktCM1FO?=
 =?utf-8?B?UjUzZERwZ1NyWWlaRWMxcHZ1NXdmWE82MEU0ZEpRMGs3UFJsVUpPYm1vWHlu?=
 =?utf-8?B?NExjOHVtdS84R0dlN2MxSENjTjdtczI5K01QcDk2MVNwdjBJbFh0WHR3c0tw?=
 =?utf-8?B?WFB4UTdzbk43RjhpaWhlWTI4TytKekMxc00rWkd6NTNkbzVZUFZzQ09zTjJX?=
 =?utf-8?B?NXhmcEJnUkFnZVl3VnN3VWZKekx1bzI3SnBKenFhT1hMZjRqVHRRbUtiV2px?=
 =?utf-8?B?OWZqWE54eDhWT2ZFcmNYQlVyTy9YY1dBQk9WQmwrQURLTS9jSVBGMVRhbU10?=
 =?utf-8?B?L2h0Qm8rT254RE5UY0s1TVJoQzNNSFBMU2thRnhDODhpS3JhMWlHejZUbnZp?=
 =?utf-8?Q?xuajxMu1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039e759f-f3c9-4868-2dfb-08d8c24f53fc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 23:08:44.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gVtn/I1TvblX2VV/KMTMGewYdfqlx1Z8LYa8OandIVYNHvvEN4HNH1B1R/tqbNyOcuHGeesdY7zArNCEQwncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
Content-Type: multipart/alternative;
 boundary="------------082201455BCEEB41515A9F67"
Content-Language: en-US

--------------082201455BCEEB41515A9F67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Disregard this one, wrong version in the commit msg

i probably need more sleep...

On 1/26/21 5:46 PM, Yi Fan Yu wrote:
> Mostly a cve fix: CVE-2021-3156
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>   meta/recipes-extended/sudo/{sudo_1.9.5p1.bb => sudo_1.9.5p2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-extended/sudo/{sudo_1.9.5p1.bb => sudo_1.9.5p2.bb} (96%)
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb b/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
> similarity index 96%
> rename from meta/recipes-extended/sudo/sudo_1.9.5p1.bb
> rename to meta/recipes-extended/sudo/sudo_1.9.5p2.bb
> index 65f5480682..ca23e94ace 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
> @@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
>   
>   PAM_SRC_URI = "file://sudo.pam"
>   
> -SRC_URI[sha256sum] = "4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882"
> +SRC_URI[sha256sum] = "539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978"
>   
>   DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
>
> 
>

--------------082201455BCEEB41515A9F67
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="+1">Disregard this one, wrong version in the commit
        msg</font></p>
    <p><font size="+1"> i probably need more sleep...</font><br>
    </p>
    <div class="moz-cite-prefix">On 1/26/21 5:46 PM, Yi Fan Yu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:165DEAC472D9CA7C.12137@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Mostly a cve fix: CVE-2021-3156

Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
---
 meta/recipes-extended/sudo/{sudo_1.9.5p1.bb =&gt; sudo_1.9.5p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.5p1.bb =&gt; sudo_1.9.5p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb b/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.5p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.5p2.bb
index 65f5480682..ca23e94ace 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
@@ -7,7 +7,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://www.sudo.ws/dist/sudo-${PV}.tar.gz\PAM_SRC_URI=">&quot;https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = &quot;</a>file://sudo.pam&quot;
 
-SRC_URI[sha256sum] = &quot;4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882&quot;
+SRC_URI[sha256sum] = &quot;539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978&quot;
 
 DEPENDS += &quot; virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}&quot;
 RDEPENDS_${PN} += &quot; ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------082201455BCEEB41515A9F67--
