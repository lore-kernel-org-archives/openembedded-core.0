Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.51])
 by mx.groups.io with SMTP id smtpd.web12.2850.1615770602952454943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 18:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PjDvQcVW;
 spf=pass (domain: windriver.com, ip: 40.107.101.51, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpJyL8oDUW3dYQ+iPhocpwKLnAZHFMMu1ZGdDzKztqcdBaRpV7PomkcjYLFIDkVIWTe8tHpIidKanNYT9rhl4blYS4q6rYOLLzLXh6rVkWW9Taziup9w/TsR+opIU/RgpaxbzrHiiCvUzVWHZ07DS8gWk1cbITuiQC5GPr7WY2w5apNqwNkRlkKMWZXflQY8mmPS+3S084gqfpj4fv89Nirq/JitTyD79rsdjcm25UzG09VshA6X6ksDv0uhm8x1uNjyzzcQy3dF7KjqkEDfo+5RTIP1jXVreVs74oluxAjGNVG9Grpld/LobN6k2SFPxQcH8ZpI3nenoyMC+smohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G65CYT4L8XISzOI+1ljUI04dffuRY0T/5ihCLxLmJg4=;
 b=Tmeu6loGbkLCAHdoNW3aEwVbg7IgCcItlVtcgZ9KP6QiYXe+z9EUjKe7hMQj5FDZNwCDtm8+jSgSWh0Far25e0Q/naS9LDRsKxhMXN2n+KNqGumUgFoCpXsWD2bk1Ttnwe89Wzc6Nghfz3RdKIhpgDa160/mMCjnCHxCe2qPNAnwR+U/Ile0MD6sbe+mL9E+aYYcgimu2gukcqu6NBd98bolT21lIUzHOD3f65Ax++OCxIKb+26VsfLfuPf0jaVD07h+gZcRSExEyyxuPRDJU87KhRdCwVyLG40LwKEM1FwrEsrgvdEApA6MmYcTymCfOUeMbOWPOgouybEdxGrt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G65CYT4L8XISzOI+1ljUI04dffuRY0T/5ihCLxLmJg4=;
 b=PjDvQcVW2BpYkFnMhBkTnyPTWQiewrVAqJ496JnG5PQFSh4GMS0PtEMPq8ffwKyZtl6dTI/FNUHptA+IHmlWIMHWLsV0zdu88ld35PZ0qvXBfo1JhD2OHhCUU9J7kgjzS3HPy2hErNdb5n6FwasAeQB6vpVjKUxYl54NjOMSMT4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2263.namprd11.prod.outlook.com (2603:10b6:910:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 01:10:01 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 01:10:01 +0000
Subject: Re: [OE-core] [dunfell][PATCH] cups: use /run instead /var/run in systemd's unit file
To: openembedded-core@lists.openembedded.org
References: <166ADC759641893A.19014@lists.openembedded.org>
Reply-To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <adcf7d11-13c4-f2ce-4616-eb4d961fe296@windriver.com>
Date: Mon, 15 Mar 2021 09:09:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <166ADC759641893A.19014@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BL0PR0102CA0053.prod.exchangelabs.com
 (2603:10b6:208:25::30) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by BL0PR0102CA0053.prod.exchangelabs.com (2603:10b6:208:25::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 01:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee2057e3-aacf-4b12-a5dc-08d8e74f0efb
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2263CE0F70C15042E020F58A956C9@CY4PR1101MB2263.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VlILl8E2ijdNv9uIlS0UFgNyo7Ht71sLp46wkiuJ3eWsfQD4LjBWZv66XVt+JYwP260ZMYsxFGW6WCNd1prkZgiGzVwGrxXA5qBHzJhA6SiwTkeGzYI4a5/+nvVA+JXIEyHoEvwMiJb6mOIqawO3Pz/m6f7mXvUfwDvYXFTbq8qzk8YyLv8ujGkcfdYXH7jEydmvhDD2m/VKDquY3knQMQxoAeVmxXVuoKNQrKuBSZsCk8JLC8yNzi3+jG2XMFBEfFsFXoxoQyniTL4EsgOPbI8uuldDJKTHcsCVoxpICTavuDaJ0tSHW4V+yW7ZvPrK8jOPayhO2UA2zaXA6BABMjnZ+UsRp4WmY7piYiaREEa0RXL+fAGyyyAkDhxLY68d41/YAzf35QpvTp5wAP5DXmJv5/B0X4Sc14ni9Z0tAU/LSzoNH49Mruz5tVQR0X3tDovyxrMPAcZ3FnZagPqjsCInLCJls+g5QyY6OxKoJdf+D+7yHsrnzmWCVCz8/ki8U7f6IrNIi7BQjSbduwLic7yL1WX/mDllNhRt5b50rA2AmzvYAzVMKVzGn9jBB49H8ti0aVAx/5NxA1y4aYeHFHCCULrlOlDucWdB6KIgpbTZQni8sGswkO1MEfRX8A7RihjjFwQo1YVtkDpkxzBhFAgQUPFm2pMAqx2cg6qONA19eZA4A+VROl0/X/4yO1KaY1nNysdH5Ou/B8seW+MKyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39830400003)(396003)(136003)(2616005)(186003)(2906002)(26005)(36756003)(53546011)(8676002)(6706004)(6916009)(8936002)(31686004)(16526019)(956004)(86362001)(33964004)(6486002)(52116002)(31696002)(478600001)(316002)(83380400001)(66476007)(966005)(66556008)(16576012)(5660300002)(6666004)(166002)(66946007)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M2IzdjNEa0R6WVU3cDRyM3RBRkFZVlRFM3ZQR0RpTGNJQlozNko0SGhWbEhW?=
 =?utf-8?B?MnYybURkd05IeWpKMkJ3UmE4a0lMOE9veVE2b2xOSTlZdDhOVHE5UmJGbXpl?=
 =?utf-8?B?K2QzMi9YZDJtYTNOeDB0RWlTNnVoNTg1K2twdTFDQkNxYjRkall6UkY3NkFi?=
 =?utf-8?B?U0Y4dkNlR1NKcklBNXB4SnNnRWZQNE9qUWZsNS9jSTQ4a05jdUlyOEg1UWdH?=
 =?utf-8?B?ZTFNWHhkVkdIaEw4U1UrVzVKZ2xMTVpYd3NMQ2xUMEpmanB4T0ZPdGExb245?=
 =?utf-8?B?Tk9sL3ZFVUZISnBGY1VlY1dDazNWMkdBTjZ6Q2dvZXEvUURsQ3JHWFg5dVU3?=
 =?utf-8?B?c0hUTjk3cEhTQzlwc3hZTDNLbVdnU1Joc2ZqM3ZSc2Fram0yN1czazVoa051?=
 =?utf-8?B?OEEzdFRMVmpZMFFUMTl0S09WS2swZzh6ZWVEQiszR3lEMUVSc3RweUt6ZW5i?=
 =?utf-8?B?ZFBFekpZN1pqYmtKd2I0TkRUNnZ6cFM4N0ppYjgyeG9rS3psZ0xwWGNMNW05?=
 =?utf-8?B?cVJlWCtjbWk2c1Ayd2Vsb3FDZmJIVmFKOEFLb2s3T2Q1ZlV4aThLdnNsak1V?=
 =?utf-8?B?cFpPZlI4RE9WVHd6cUR6ZDRaa01nV29CZHZid0dxYjZVdlFiQkh3SmRYLzU2?=
 =?utf-8?B?cUVjc00zZG1hZmJVRkRBVllCQnU1VTFsSjNXbHB3Vk4rbTVXUVR4WVBqTHRC?=
 =?utf-8?B?Rnl5SVNjMVB0WmZQaktKc2NHVDlCR0xoMGhsWk1YK24yTy9rVkREdTVpakJj?=
 =?utf-8?B?bEJqbkw5ZnJTdmMzNHdJTG1hK0diR1BydjI0T2cyMXJjQkV3emRoZDBmVUtF?=
 =?utf-8?B?MFU4N05SbGQxT3JIZXFsRHJSL09IZTJkRGx2QU5mRlcwSnJHaGZMeEtKdXo1?=
 =?utf-8?B?bGZlVW5CZURmTVdRYW55WGp1dERzMmNuSDQ3dWh5S2oxaGVFSGw0OEtsMzRX?=
 =?utf-8?B?cysrTFhvanZjUzV5T29GOFBNNlQxK2p6cElJVW95WWdVZWtYVGpqY2haak4y?=
 =?utf-8?B?VmtKdHVnRTcxTnVwcVNSUFBFMzlKRFViNzJlYkxmcnVHcU5wdUV0UHpHTFlr?=
 =?utf-8?B?MzlhT3BONUhFSUM5c1RNTFVHL3VyZlppSklBSXNlTU9QNXZNTGszeGVVaTV6?=
 =?utf-8?B?aU5reFl4OHpvYVFHTVV6dWg4TEU5WDNiY2EwUDlTM2tUb0Y4UGhDYkVsYjF0?=
 =?utf-8?B?OGxBN1kwc1pweXJ2TC9Qd1dWWGR6SDdzdm5OeHIxRjhPdHJsWk9UUWJIUWla?=
 =?utf-8?B?dGNVRDc1MitwSS9RcVZqZTV6U25Gb1VtaFZpL2JWQWZOWnpscnFYNWtXdFQ0?=
 =?utf-8?B?VFBKVjA3dS92S3oxRGZybDcvUzByN2lqQUhlcXc3Y0wzYm5Jck4ra3p4VTZQ?=
 =?utf-8?B?eUgvemptaUhub3dEMDl4Zm5CSittZjhYQ3puS1hydEtwTTBZM3NmVzlkRDAr?=
 =?utf-8?B?OTM1b0Y4VnRnTUx1TkI2enQrdWdQWlE2UnJJeGZOMnE5ZEtIaER0OVV5cFlS?=
 =?utf-8?B?NEZDaFpvRTVmUkI0N2ZSVm9rTVVkZHNVTXFYVVVXRDQ5ZUo3UEZ6WVFScE12?=
 =?utf-8?B?Q01qL0hES1BndGxQSG9RMFpRdUM3TndVUmozalFDZDNnUTVsVmdrMzF1c0hI?=
 =?utf-8?B?UThLOWdtSXBCTDdOdzdzR0lVa0RsYTlQZ2RFZ3VWY1hnWFJQV3pSYjJhVkJL?=
 =?utf-8?B?aTh3b2c0aTZLNU9YUXhXUG9FWkRkcDRMZ1VKMGR4cDNCaHRVNW8rSDNQYUFv?=
 =?utf-8?Q?YUxh7y9ntA5qIC97ae1SRj8xsM1qq9S6LFimYR1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2057e3-aacf-4b12-a5dc-08d8e74f0efb
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 01:10:01.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCTlnQRw9BDmSJLFJ7GE6h7tljVxrFYXBZjlbSyk2SXY2tVWaKctMK4HeIbX3EUCXpS/wfs1ydgVf8FHX1vpCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2263
Content-Type: multipart/alternative;
 boundary="------------54FC36A8E2B0D4C223416578"
Content-Language: en-US

--------------54FC36A8E2B0D4C223416578
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/21 11:09 AM, kai wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> /var/run has been deprecated by systemd, so use /run instead,
> as suggested by systemd.

Ping.

Kai

>
> [Yocto #14152]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/cups/cups.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index 12780cf702..acad3c98c1 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -54,6 +54,7 @@ EXTRA_OECONF = " \
>                  --enable-libusb \
>                  --with-system-groups=lpadmin \
>                  --with-cups-group=lp \
> +               --with-domainsocket=/run/cups/cups.sock \
>                  DSOFLAGS='${LDFLAGS}' \
>                  "
>   
>
> 
>

-- 
Kai Kang
Wind River Linux


--------------54FC36A8E2B0D4C223416578
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/10/21 11:09 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:166ADC759641893A.19014@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.</pre>
    </blockquote>
    <p>Ping.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:166ADC759641893A.19014@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

[Yocto #14152]

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
(cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 12780cf702..acad3c98c1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -54,6 +54,7 @@ EXTRA_OECONF = &quot; \
                --enable-libusb \
                --with-system-groups=lpadmin \
                --with-cups-group=lp \
+               --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
                &quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------54FC36A8E2B0D4C223416578--
