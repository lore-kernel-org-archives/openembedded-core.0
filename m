Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.53])
 by mx.groups.io with SMTP id smtpd.web10.9482.1611050806257279603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 02:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e36UP6up;
 spf=pass (domain: windriver.com, ip: 40.107.243.53, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4/FPQN9xqO43jmXgnEyRg0engwJIqH5cF0iL4Uuhr+28Z/mspOBAMUsBfLEaByO+ePB7wkwqt7V4rCZhg5szuzV0SarSuti4fbA+i6Z0fPavTizXithCbxxN28vLXQ6y8TYarFXZqoP6buNIME5k5tyq9MzjNG2ZJEuQqsoLTDovQa8YkAlDrmX9fT4lnoJUrtmNyyrFSdFivUl7nTkJRiLBDlA1/sN8SCRPn7PVQrdh4WVtp8bDWYZzFBI4veoOyJT3TDMY5QEpVFQ5IBZorM/qe4pDGPcE7z9xvE3L1+Am5oA3OeGqI2sLVoTvXWdy74aDvEccNHWkCMj4Pavkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehLiqWcE1p19OMkHe9cwJKRks7E7UW5shh4skNc3RnM=;
 b=LZPjVAF0LrDO6oEEBgAcOupUStS5dRjnJO9lYgt22Fy0lG0X433Y6EmW1S3jzsbGj6FUV/i40/cHiDdrWh7Klpqb7CBGwTS9moYbvZcq9s+sk2jIsifWMnUoAxMIcxF+SGzngBVcEh7dm/sOBi1pI75ThW/JoP0w3fRHkKns/pTUinQx/EyH9BdWSLswRXZzEV35S9y4uwxlP+OLqjkylBskpgMIn+6mql1xcHBYL+brCQYUdkgdOVC170yoXzM7+rsGeCtJ+WMh8pL+PVQGf6dmXcfSaYGT+4KFcogitxM5/RH52vQK3um0mAQHRIet+B2UQ8vfOpiVQhkL6B97Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehLiqWcE1p19OMkHe9cwJKRks7E7UW5shh4skNc3RnM=;
 b=e36UP6upt9rw9JcgsOK/Ygf4mSFLHYkHzTtqvwJg0RdbVEOdDl+8gytIVCucit8ZVLh/T23g3OqT9nMImbGKduqd1HLgSW4oQADKbXxjAFOD/jMrGnfFcmrcWVHhahQ1B+D8ueaIsLSrLJC8WLJwIZ43PM2/s/w5jVLaNUhLGYI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SA0PR11MB4685.namprd11.prod.outlook.com (20.181.63.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9; Tue, 19 Jan 2021 10:06:44 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Tue, 19 Jan 2021
 10:06:44 +0000
Subject: Re: [OE-core] [PATCH 1/3] Revert "ccache.bbclass: use ccache from host distribution"
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <cover.1611048144.git.liezhi.yang@windriver.com>
 <165B97D5B4F4A03D.23889@lists.openembedded.org>
Message-ID: <4606ddc7-28aa-63eb-929e-74c4a20e6147@windriver.com>
Date: Tue, 19 Jan 2021 18:05:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165B97D5B4F4A03D.23889@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:202::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Tue, 19 Jan 2021 10:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e70bb790-f7df-4fe3-37fe-08d8bc61eceb
X-MS-TrafficTypeDiagnostic: SA0PR11MB4685:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB468550379C25D54D31E7ED38FFA30@SA0PR11MB4685.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fMR5OOPBWCaYhJ4v/ai0COP5SONIGh9Sfze44Gis8lOBaO53mOo9NAP8J72H2Z/aXWsK6O5ZKhrTQOg3RfV7+5V2djLt605KxRhhnQLMqqJtt6RRo8A6d52SyKcQP6u+mWtYZ5IiuVs/r0spnTxzWXCFp4ca5giYzjUhPQM8Tah817oBzeza2LGZeYOqfiEBpPfw7BxBDdKQTCY1JcSw9+mlfvgdmLPrxw7+jX+rNbVNYU+LEs5JP7+zNOcSuNxtOetb3VU+KqwV6pwjeqcIla+Y7u1ll/t9NNuG9DNAIGRFg5XQidqLMsujv/vWaHhMVWhAO51wNGbhi6PY/Pg7Egckye6vOJSd1cNX1dg3PsF5fM8APBdmKEmCRxSpcIIXWuI7EFwDxIo58vrqrEa3u+fgvH2cLJ/U5b9F1lC/LCFOZ2LsBxxr3TVC07fRpi/HC7CyRCrDPOETbXwo+JzWnlb3VhUAkOuXUZQFBrkhJFfh56J7fKWwjKT8bXJXEsOg//eS7RNWnurrwF3MeAL+6oMQkZqKPa5s3QWNnvurjKCKYB8ct6hzGHHaJNdckFEsmuJ7g5pQIbpKkY7stXy7Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(2906002)(5660300002)(186003)(31686004)(36756003)(26005)(16526019)(6916009)(31696002)(6666004)(478600001)(66476007)(6706004)(83380400001)(6486002)(66946007)(66556008)(86362001)(8936002)(53546011)(8676002)(2616005)(52116002)(966005)(956004)(316002)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZS9lWWZUQnNGSUZkOWRWN3BIRjVlSmhtZmEwQjkyOTVGMjBtdmgyYjY2VGFk?=
 =?utf-8?B?YXBENW05S1A0STUwS0hoTUxSVG9Vb1hBWW9wazUraytJNUlubW5PSFNxNWl3?=
 =?utf-8?B?cUpFM0dyT2luSVhvTDVqS0FlTmpTRDJWSzlQZENnV21GdmN6bXl5N200SHFG?=
 =?utf-8?B?T1NHTTc1ck1lcGJ0QkI1Z3N2OU82RWVNenZ6S3JMVkMvWXMyNHFreVJkNlIv?=
 =?utf-8?B?b3NNbm9pdExZd2NrM0pIajlDR0o2L2ZnUFMzMTFPdVdPeUU5MGVPcHloMWEx?=
 =?utf-8?B?NVNvL2FaSmJVaFVBY0pKcWQ5ZklycjhwdHhPaXVXOGZvY0srdG1QaW1xV1ZV?=
 =?utf-8?B?NnRFb1FDZ01CeEkxd3ZEM0cvTEZOYjd6aE55akZGT1p3elRiMWYyMFZGa1lJ?=
 =?utf-8?B?NGovZ1NyZXBIUVcybXNFbEZrVzRWcGZUVFVPLy9CdlNnUzk1aWZXRE50Zzl6?=
 =?utf-8?B?WmlINytkQlNoRzc5aXdTVjRiUTlZZmtEdStDWGZyZUk0T21jWkJ3ZzZrem9i?=
 =?utf-8?B?UTRqSDd2RmZBN25HbGsxWk90MXJ2NFMzVG1CQ3RKR093TzVhOHR1UE04b3JT?=
 =?utf-8?B?L0luU0VMc1Y1QVdKRDVzN1FvVHBNQ0luY1lLWktTQTRtOEl3djB6ZXloRkpj?=
 =?utf-8?B?UFZacGF4alk5azIxcUNIRTVESDRzK3N0QWp2d1NRaTJXem9qREpmaldheVVO?=
 =?utf-8?B?MXlDakpzTDhtYkNMaFJQRFhDaUU0YlYzSFpjcktCTWY0Z0hFN0xZSlNJaUtJ?=
 =?utf-8?B?SU5uTHNhcm9WRWRWbnN5anZDTUZKUTJrMTE0QnZrakF0WHlBT1VWbW1BNlJi?=
 =?utf-8?B?dmJ0RVFodGNVTTZ4TTByVEVZR2hvVm1abkVRQ0FQN2pjb2VIYndLREZNeDBK?=
 =?utf-8?B?L3VwYS9paG4vUW1xZ0RTRGtsdE1YTDIzbWpBQnJpRkFKbzhnV05PQldKb0h3?=
 =?utf-8?B?S3ZhemQxc0QrKzA5QUhEUUZ1UE5TNkwwVmFFM0JlV0M2RXp3UTVOUXZzZk9y?=
 =?utf-8?B?OS8wK1VmMCtnNWtCNE14YnJnZ21UbmVNWjE0eFZ4V2RLTGg2c3IxVFVrejRx?=
 =?utf-8?B?YWczL1B3VDVQSWg5eTIrODBzRFdDZ0wvblpaSmYrSGZnM0FVT0t1ekFHeWds?=
 =?utf-8?B?UFRJNjFBMUJ3SkE2OVlsdFl6b3U1UVA5TWw3RCthNmd0R0FrUVZFOHdDbi93?=
 =?utf-8?B?UDNNS1VFT2VKL0h4NkY2dUFzWDJmNWZiRWY5LzNEbTBGcHM0NGg0T0Z2enhC?=
 =?utf-8?B?TERjR0FTdmwwNDlZeFByZWVZcllTbDRGMUlrTHBpdVdlRG16U0ZKdURrNm15?=
 =?utf-8?Q?6HXUNT3INAxyyEfL19t4bR23+XMBJZx6pb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70bb790-f7df-4fe3-37fe-08d8bc61eceb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:06:44.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFfNP5EtLldBWMvhlRpe3TYY/l4phQUo+UXGieO9Gf0xmMZwyfFNhKlyfhzmlXxtdsOHfV0gHcDWA3LpyHEOy7et9rifDuOvVJkLKUYcn9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/19/21 5:23 PM, Robert Yang wrote:
> This reverts commit f5b29367af4d8e5daea5771264774aa49519f9a8.
> 
> Will use ccache-native which is more reliable.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/ccache.bbclass                  | 3 +--
>   meta/conf/bitbake.conf                       | 2 +-
>   meta/lib/oeqa/selftest/cases/buildoptions.py | 8 ++++----
>   3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index f00fafc292a..fc4745609ce 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -1,7 +1,5 @@
>   #
>   # Usage:
> -# - Install ccache package on the host distribution and set up a build directory
> -#
>   # - Enable ccache
>   #   Add the following line to a conffile such as conf/local.conf:
>   #   INHERIT += "ccache"
> @@ -53,6 +51,7 @@ python() {
>       # quilt-native doesn't need ccache since no c files
>       if not (pn in ('ccache-native', 'quilt-native') or
>               bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> +        d.appendVar('DEPENDS', ' ccache-native')
>           d.setVar('CCACHE', 'ccache ')
>   }
>   
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index be94b78eb15..74976ac05c2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -498,7 +498,7 @@ HOSTTOOLS += " \
>   HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
>   
>   # Link to these if present
> -HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
> +HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"

The original patch has another side effect, once ccache is in hosttools, it
might be used when automatically, no matter set "INHERIT += ccache.bbclass" or 
not, and cause build errros such as:

ccache: error: Failed to create temporary file 
for~/.ccache/a/9/d6ei86jnu3q6gknptjb97vtr9hc329kR.tmp.kufXFz: Disk quota exceeded

So we can't add ccache to hosttools.

// Robert

>   
>   # Temporary add few more detected in bitbake world
>   HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
> index d0f64773002..e91f0bd18f6 100644
> --- a/meta/lib/oeqa/selftest/cases/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
> @@ -33,10 +33,10 @@ class ImageOptionsTests(OESelftestTestCase):
>           self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
>   
>       def test_ccache_tool(self):
> -        bb_vars = get_bb_vars(['HOSTTOOLS_DIR'], 'm4-native')
> -        p = bb_vars['HOSTTOOLS_DIR'] + "/" + "ccache"
> -        if not os.path.isfile(p):
> -            self.skipTest("No ccache binary found in %s" % bb_vars['HOSTTOOLS_DIR'])
> +        bitbake("ccache-native")
> +        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
> +        p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
> +        self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
>           self.write_config('INHERIT += "ccache"')
>           self.add_command_to_tearDown('bitbake -c clean m4-native')
>           bitbake("m4-native -c clean")
> 
> 
> 
> 
> 
