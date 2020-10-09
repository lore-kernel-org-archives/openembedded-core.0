Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.77])
 by mx.groups.io with SMTP id smtpd.web11.382.1602280593045608171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b5hQyg5E;
 spf=pass (domain: windriver.com, ip: 40.107.223.77, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsjiqoL78m1ekJj05KhwCEQp6eXf+wtdQCb/ETwR/VpPDr8JF//W7l0pojYJwUWbjm3+FqW/UPmp7ncvDQ7XAjlXYOGNWk1aNd+nADrz+295MZKQKCntsv8WfRWSMNvN+5fEm7NKgR1glT++/UDs/6SZEZjejXl74DuHyz/VZ2bmlE+BXWqBfsrBxIW0NrdAyU9nbiDqk8UIwidpxV9nf6i+6E1HWtyYVL2I5S1znefbzXBvja7nex6sENfVs6EI6FD4l9KiXbSGFDL9gIj98UTU0Oatmysfhjj4Ryxbt/AP1TDGYSHNNyaab3ar/7CsqKW2qdntudGP4/aPyp71jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhMqKAydQkmv68O1R+arr+i5i9TWM1GZbbD+e9AP6l8=;
 b=eEBHYwVLl7gpusP2v4K7KfVd7NQmEKSkurrofgMX49CPSj2Ue7FQ8tMh+nCY4spoK1CpJCjVcuJeRcZs4KTWItGcYgyepV3FyXpFXlxqegdqi/5vsTfVu7KxdCAjjwlkISE/12FzSAkH2Ri8u5ftHsRdDoacrW1ISJPyemozGX4aGS4dnPHiddkTRxjceVLRYE1aLOKMkfO6OVwstWfmhgFefKU0pmyKemKTje5+eiLi75Mv8PEQ5o4Rr0ynrVd0uWqKJrtrfhHQA8UW7njGXMHW1XvoFZg3xy6vjUmZIXInL5djzL3wQNw9Zuw2YTxXGVMOE6lHkPAxbi8DqqQYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhMqKAydQkmv68O1R+arr+i5i9TWM1GZbbD+e9AP6l8=;
 b=b5hQyg5EAyVdFao+nqyf6kaCkVJKBZDuFDckjFezmxKDqDRpOtDn05flu4Pb6/xoG2O9cgaHLsvOe0zTh6XVMt0JL2J3eWdz5I6YQInEV9+TU78eqB8wHM6ZYtN/fDcUnGlelm34PvNxw0psDEg3PAFx1rI0OkkeSxWY6LQ06so=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2703.namprd11.prod.outlook.com (2603:10b6:805:59::18)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 9 Oct
 2020 21:56:31 +0000
Received: from SN6PR11MB2703.namprd11.prod.outlook.com
 ([fe80::cc77:c9c8:8d2b:bb35]) by SN6PR11MB2703.namprd11.prod.outlook.com
 ([fe80::cc77:c9c8:8d2b:bb35%6]) with mapi id 15.20.3433.046; Fri, 9 Oct 2020
 21:56:31 +0000
Subject: Re: [OE-core] [PATCH] openssh: Upgrade 8.3p1 -> 8.4p1
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20201009205237.682068-1-stacy.gaikovaia@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <1ebc2318-8a87-c9bc-07b8-6397fd717472@windriver.com>
Date: Fri, 9 Oct 2020 17:56:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201009205237.682068-1-stacy.gaikovaia@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To SN6PR11MB2703.namprd11.prod.outlook.com
 (2603:10b6:805:59::18)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:c0::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend Transport; Fri, 9 Oct 2020 21:56:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a7e24c9-b8c0-4f89-7c2c-08d86c9e2e57
X-MS-TrafficTypeDiagnostic: SA2PR11MB4922:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB49220787BCDA027A82E4933CF8080@SA2PR11MB4922.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EwgmiaJcYqxSiNIWA3jTsa9ZnoKZWcbkEzMpqSE5BSKE6Duk+EWtpg5pFZAaoRtd6RuifvuAEHx3vBUF4Ge8DqXUN9fx4FSJ39getpv5TU40krRfd9lpkpT6POVGrntNu2TPVV+N6aZtk87AC9m2L5BWtLyf8nJsV9VRDPXlLlTHsHum7kAIquG1I/Des3AC8hBiXlY0TwTaMTbjNKiCVdA8iWkD4WTotzkoTd1/wbHQRODB1qFlr7sN4ONgWEHj+id078jnyuXcEUyeXMmnGOKLwPwqqXu3O0HxfcAVQjXMYrD2Wli9/Mlc96c6Vt6+OYsxSNeR+4A/qRiP7cSgi/D0C0V9bwASUeL3V9XlsY6fI6JWbaDpblALS4uQfyB8ajv6CsMPb/ER/rnRwaOPEJEr8H4JfGbGfkXBQ2ThsCUcCqA9lZZa9r6ZM/DmcNbIdbnkFFNb0V8pX/X5Oq8zlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(66946007)(66556008)(66476007)(52116002)(26005)(316002)(86362001)(8676002)(83080400001)(5660300002)(16576012)(31696002)(2906002)(36756003)(956004)(966005)(6486002)(2616005)(478600001)(53546011)(31686004)(8936002)(186003)(83380400001)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ri40msuzowx8WuQOSLnCxz5DId0zKStYaUn1MDv+MAcurQ2bfrOdpSggB7JjdjAw6ivopj/bOrtiRr06axyqCRcBBPmmrfTePMqmDk2f17k/bxnvXSaG2wD38h26yE1Lz3/oDJ8jByrq064NJMDlbY5/IWhwIn/mnVrpMlFhRbqQEW1oQpv55a/B7qPtJZGD/WsFCUSiAkfkvqdjACfWXkADdWFGlleit/Yc/zSpAkJPLITuM3ceu/oafWLHdKM/l+NTN8wc3AMBsrlQwa/8naL4JMGN56wcqmhx/fogLthSzwaAvh3Pn5Je9ouhnrfbM67h1qcqTJJri+HwGk/mCkXhSItHWqoShwD8qEkvMcBZx76xrkltO8+Hx9LUKilZgF4FA+En9hAhg7Zn5pNBHLpd+EZV/eRiSt679dzjTrh75pbT5LOnlyiAmElA9mpF13THUXVYCl159TA1Q+r9qV8ZK+0Lthpym55nLHWa1POGbkGBLgtGalrKZc7T8GVZRvWRCdyIpGiP/s10XHOpVNK+I9HV6vZczC0hgt+b6Rf8pUnrkEMp+s25n1YoLzYR0/6LLy9DsueA/6MPV76m6i6uoPzqGugu8EBu8WyE6pxG6NQRNyZ+90dCQ62VP/RqxV4CCdrtUXui8vQ+sLsNgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7e24c9-b8c0-4f89-7c2c-08d86c9e2e57
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 21:56:31.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGb7kQa0qUyUg1JmxlJZQL+y44mlLUPJVHbVbhH7PMWP7chufKcwcjZE0v4aSGTw/z8x1nbV0Rc3dJLB1Kn69M1RlVmpHQfTOBhB5ZzMrpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-10-09 4:52 p.m., Stacy Gaikovaia wrote:
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> 
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> ---
>   .../openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb}              | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-connectivity/openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb} (98%)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssh/openssh_8.3p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> index e007328704..720b238e71 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> @@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>              file://sshd_check_keys \
>              file://add-test-support-for-busybox.patch \
>              "
> -SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
> +SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"

Hi Stacy,

Can you reply with ptest results from before and after the update?

There are two patches with Upstream status:

$ rgrep -i upstream-status meta/recipes-connectivity/openssh
meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch:Upstream-Status: 
Pending
meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch:Upstream-Status: 
Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]

I think the second has been rejected and if so, please change the
status or do whatever makes sense with the patch. Investigate the
first patch and confirm that it hasn't been integrated upstream.
It's a good idea to summarize the patch status in your commit log.

Oh and FYI and to be clear to Richard,
This uprev will likely go into 3.3, not 3.2 since we're in
feature freeze.

Thanks!

../Randy

>   
>   PAM_SRC_URI = "file://sshd"
>   
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
