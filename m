Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3380.1623379160977488449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JGm1H7/i;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1796b783c1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B2dKgA009207
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 19:39:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk20ujx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 19:39:20 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B2dKHC009197
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 19:39:20 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk20uju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jun 2021 19:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO4/YubCP2o96sLIR5YCHHcL6r+cosu9B254BZ7TMUAAiymNaAtoDeOMAzbzVJxU2MobU15qIz+Dw3DFmi4MdQTLto/RfdasfUv2f0eeWLl2ozDeUtr0JBWDWfYXHJWvKvBe7W+Av/ljn3IqkW1/852Eo/SW2flWyt9kJr1Tq5Qo89JlepciWpPrqDshOjtqsPR4p8jyF9OC276VtJJKa9Sy4Xev9GVcZ1T3T4Nb97ab+a6+DfepigItCk44dpTExOHcAyKmSwnBGbCfBlvZMzLgl7x50yWgFw/Yq10vnp+IGvr6j/UMELPF8yYxqQSJ8AURZibUg0rklge56BAwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6nFyPINqLkrOTdiTUws60QSmgxxaV2GFGtAsE+aXDU=;
 b=QtgCHTGO4jOdjl4uUWsIxpIrYpTF2NDnGH4ESv5FidqNgEnxvS2eah0UdFU4vGF90NG9BeJY8sMSaZzFunDMy3FjfRBWjeLDPjcN7yF2yNhcRxCqBpi/h9/9aR5TBj0n7fRS9RZStXb2uUA7mG0wsidkvuVqUrfDTMZ3q0D/qBxz0bgZQbOO747BPek4YTeonumrCGvFcNEGtsFUFvk9q2Hoxu7KUuXUdDqRrG0nY3Gz6iMZXh+VsE1GLQBOzS41rucfVOhYhWQA+jA/9DIUUE7/YFh8gJoMO21u8YGWOSAOezBXYT11kIvQzKFMwltRlrNOGkscT8+d4BMeCDSGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6nFyPINqLkrOTdiTUws60QSmgxxaV2GFGtAsE+aXDU=;
 b=JGm1H7/icDSXszOP9S+B39RgUGoNbde6FFpHd0S9sZOmNCsSP27mk+Moj12bDwj7BiS5A3da7c/M7BZU1wm4dhn7P9iuWhuq3pTNhS647J0eoeXC6vNhNQ4Ci4g3sWxj4OMGcaA29EKc6vVr6YRavOyfMxN2RgM0RmdqvMkJH7A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2560.namprd11.prod.outlook.com (2603:10b6:805:55::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 02:39:17 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b%3]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 02:39:17 +0000
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20210609072939.6058-1-changqing.li@windriver.com>
 <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
 <ecdf1fb7-cc74-23ab-3c70-929492d4d178@windriver.com>
 <CAJ86T=UrOhHSKxDV-KWNyyqKTfFr89v-oQvYY2adRAYvpzOvWg@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <e9ff6238-bab2-5ba9-fd1a-66b69f6e6a91@windriver.com>
Date: Fri, 11 Jun 2021 10:39:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJ86T=UrOhHSKxDV-KWNyyqKTfFr89v-oQvYY2adRAYvpzOvWg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 02:39:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d14dc4c-3a24-4c86-37a8-08d92c821b89
X-MS-TrafficTypeDiagnostic: SN6PR11MB2560:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2560C73B174961290BF8E55A82349@SN6PR11MB2560.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZXFa2AE0W/Ly5bYUc9INg3WqgTY40Bc3RrKApf3fzkt7Qd6Gdh1UnA6DGbvoI9gvM0Sxj6qRmCbLFDpsdYbgERU7SX7b+Z3qDtfDYH5Fs6vfBiK7yXq3mRBvO0pLDTRHusnK69/stfp/xiQiqWvfymGTB6BYonQVIieIGQ3YEzh1NfZaqqvk3YbRcaBwsM75MMeXmx8RrOocDxS6bVXbW4jbAzH3aEAUs70N/A1bY9hhO9jT2begdfpFgqH+4WHc45LuRL+rnL1sJ48lsLmi/TJuesG5xil5WX8eRglHMhF18+2RBowXaPtGaco6kT1IaynpQ9grh2+aTrhoD2cBf33W8DE1aYD4u7OxmdxNel+SR48VugruVU0iA4HsiUaXUXZwlQ5xSnuoWcRJu2IvoAB7PrVZ+PI450znIzrtGjF7iyDmVal/KIS+laVHLNXiaAP+K19Sk3s+eoysJPlH95UidHVo4NxTL/IVv8bTh6yU/Z2p9bwfha2xJZYxYfEbw0ZWrr/tuskiI9JeS4TeG8zXxDurH80+nEDty+fE1JDI4fuvL1xpGGb7xpadC/otR7xp/TMl3ENKVJJne+Gx1tFni4uPHxQk5Saxk/lMI2C9G6cSiRiFsLfYCe6W6CCzcpWvRYdiRszVuW4w65AD8jeQm05RPNVoECZix4cPYZ7L+QDLJDTKTlnwfSYTNV/L5yrDpCXs6oiYObmR0RyKXtyOs8qlALDWhQqTLIbSSmq2x6Ftlz+GQRvjZio/Mx6gO9AhdxUJn9QXF2FMsvrWhmKmXsSQIngyKvr2quCVLPYfJMl/zHj5LzDyF2oQFILMBscmoUHtV24Krd3Isq9qehWuTl4+p7xaqVdxNn80tq2Dl++DXP84v5OspmrBDw1v592cPEgJDtBzuhPamoxkkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(956004)(36756003)(2616005)(186003)(6486002)(26005)(44832011)(66476007)(4326008)(2906002)(316002)(66946007)(66556008)(8936002)(16576012)(16526019)(52116002)(53546011)(8676002)(478600001)(6666004)(83380400001)(966005)(6916009)(31686004)(86362001)(5660300002)(38100700002)(6706004)(31696002)(38350700002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHZmUzBIM3dCWDBxd2Fzb0RHdDVpbTkzYmJHTU91aUZRc1hRRGpEb3FONDFS?=
 =?utf-8?B?K0NUUmxsTDRtU2llL0NqM3VvTG5Sdkp4cTB1d25VUDRWOFJYeTUrU0NOVlln?=
 =?utf-8?B?OVhtMXN2SzZBZDVRN2t2NHFzYUtUVUZFalNtbmNteXpOVVl4TEJmZFFQbkxB?=
 =?utf-8?B?SzZNSjNSNU40WVZKZy95Q3dvNi80amZEQ2xqdG9YVjI5TTJOc2RlNElYNGNP?=
 =?utf-8?B?SUhhL1FpYXNHbzlMWEVOODk3bTFPK0xQV3F2eXZFa09KdDRJS050dlhlM1ZP?=
 =?utf-8?B?aWZudFE0NHNGcnI2SzB2Y2NUb01qTlhWeWNoeGZUT0UvTFU4SEkvVEVGUi9z?=
 =?utf-8?B?TE4zekdmbFQxQS9La1FDZGhsYTcvYWtGeHp6Rk5lQmc4ZGF2Z3drM3NzbEZR?=
 =?utf-8?B?dDkxYWJNdlZVaXVqQW5ieGVMczFmenNvRnRHWkswUmMvWlNBRWl5M3RzNWQz?=
 =?utf-8?B?UjlrS0k4T1pWUTNkZnJ5RHczWVA0MFBxYzhMTHpFSFgrdWxDVThsemtFbzVL?=
 =?utf-8?B?WmRwVmNjdW5uNEFrUDZjUGZLM21FY2FSOVMzSk1Dbjl1SVEwOHZmdGJuTnpq?=
 =?utf-8?B?aGRJa3BPM1cvaW83b1BqVHlZM3BmZW9pQlJqSWlDbFNDSFlxb09HQU1SWTcy?=
 =?utf-8?B?WjhPbER3dWwwbnpyUGhQUWV2cGozK1kzcjh1eElwcy9KSllTbGd0Tkx5ZXRj?=
 =?utf-8?B?Z2M3cFpEang1QXhhVm0zRGpWOEhhMHBVQ2VKOEJLNitoMTdBZmNoV3czR0Rh?=
 =?utf-8?B?eU9QcjlaMno1TWY2a2c2elRFdFlXUkhvL3dWN0kzZ1l2RkJtUjZsUDdvRG9t?=
 =?utf-8?B?NGV4Y1NkMUFpNTlVWVNscWNuRlg1TlJGeXBtSDZ5YVY0ZXAzM2RKSktvY2ho?=
 =?utf-8?B?YUtIa1lFTXM4UmZoQXQ5d0NnT0NnZGFRQitRVDhqTjB1aCtVRWpMSDR4V0xC?=
 =?utf-8?B?KzFJMzBnNjVSTUt5cFAxOE94Qm02bHdwUVBBU1d1aXFVRHNVN3p6K3hldGtS?=
 =?utf-8?B?TWEwRlh6YzVMR0pmZ0d1c3JudnZCMnRaLzFqMTRJaHg5dWRTUWJUWUowakda?=
 =?utf-8?B?NEVqT3lGSDZ6WGoxaDBpZkQrTytBTDdEU1owMk9MdmdwdlFxWk5iemJWUDdM?=
 =?utf-8?B?OTVGTERqeWhGWU03bU40WEdadm4wb2Q1NmtGbnprVkZLVkxid25VcXhzOFlR?=
 =?utf-8?B?ejBzRjd1Mm5ZSDJtZkRrUlptWjl3cy94NmIzV05BQVJsZHg4d2swM2NnTTY0?=
 =?utf-8?B?c2l0d1crMHBGYUE1R0w0U2pCdTFQajg3MXBqUWs2NmdvRlVDWlVzaTJIRkNH?=
 =?utf-8?B?T29CRGlDWFlhcExoNThRM0NUM1EwazFmT1N0ejdKbEtTaUEvS2dvNDlQM3c5?=
 =?utf-8?B?Y29EeFRhOEJZb2R6cGVCYlVxSFR1TzQ5Sm1zWkRoaWxsbld4amh5SzZVNzNT?=
 =?utf-8?B?a0RRSkY2MS9ydDZORWFSc0hrc29KMFVNTVJaS3B6eDhZNTk0bmJ3N3oyYWNI?=
 =?utf-8?B?eE9CUG9wU2VZZGdSOWtqWm9GY1BOeEVKUEdENGZZK3poSnNMTmpIeXQ2ME5o?=
 =?utf-8?B?aDkwWTcrbDh2aDBrUVRNRXJXenVDSnNaWDNKendwd3hNQWlQckRVRmlrT1B1?=
 =?utf-8?B?Z24xM1BrRXJRTk5KZFdHVVFnbm5kak5uQ3FmaFQvZlBnMWxObEgxaUp4NXFs?=
 =?utf-8?B?TUJJcEhZbkZqMXZhdDZsU3hFMm9Cd1NzNjVhUzRKblBodXNtS1VHRHJxdWJI?=
 =?utf-8?Q?Jtyc7i5Q6+Rn3zBsi85W/HX75FmP5+bXhFffNm1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d14dc4c-3a24-4c86-37a8-08d92c821b89
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 02:39:17.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzDMOQaJXbYQjMdvoXKVDEkflfkWp/NRbac1/MRKF3BlcSpKEYRjkUYGY5TFeS/XHpXw6Uh2OGN8wgTimGMBg9KGwr4R2M3UkLOHix+JM9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2560
X-Proofpoint-ORIG-GUID: BYQMIRCZrWZT0vMQx0Lu0odXT8bM69fB
X-Proofpoint-GUID: T-s0L0g1KGDS_b0eOS4scMfFsO1olMYY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-10_14:2021-06-10,2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110014
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/11/21 12:59 AM, Andre McCurdy wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, Jun 10, 2021 at 2:42 AM Changqing Li <changqing.li@windriver.com> wrote:
>> On 6/10/21 1:29 AM, Andre McCurdy wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com> wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> fix below error:
>>>> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>>>> 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>>>>
>>>> Neon is not supported by armv5, disable the simd extension build.
>>> Drop this comment. Neon may be missing from other ISA levels too (i.e.
>>> this fix is not specific to armv5).
>> Get it. Thanks.
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>    meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>>>> index 7f91cc02ac..da21971113 100644
>>>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>>>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>>>> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
>>>>    # Work around missing non-floating point ABI support in MIPS
>>>>    EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
>>>>
>>>> +EXTRA_OECMAKE_append_class-target = " ${@ ('') if (d.getVar('TUNE_CCARGS_MFPU') != '') else '-DWITH_SIMD=False'}"
>>> Shouldn't this be checking for neon in TUNE_FEATURES rather than
>>> TUNE_CCARGS_MFPU?
>> Refer feature-arm-vfp.inc:
>>
>> TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES',
>> 'callconvention-hard', 'hard', 'softfp', d) if
>> (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
>>
>> TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if
>> (d.getVar('TUNE_CCARGS_MFLOAT') != '')     else ''}"
>>
>>
>> There are condition that neon is not in TUNE_FEATURES, but vfp is in it.
>> so TUNE_CCARGS may append -mfloat-abi=softfp,  then
>>
>> simd module here can be compiled  sucessfully.
> The SIMD code can only be used on targets which support neon. There
> may be other cases where the code can be compiled but if it can never
> be used at run time it's not very useful.
OK, thanks. I will send V3 patch.
>
>>> It should also probably be conditional on the _arm
>>> over-ride since neon will be missing from
>>> TUNE_CCARGS_MFPU/TUNE_FEATURES for other architectures.Since big
>>> endian ARM doesn't use the _arm over-ride you will also need a
>>> duplicate line with the same logic with the _armeb override too. See
>>> the lines below which do the equivalent for _powerpc / _powerpc64 as a
>>> reference.
>> ok. thanks.
>>
>>>>    # Provide a workaround if Altivec unit is not present in PPC
>>>>    EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>>>>    EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> 
>>>>
