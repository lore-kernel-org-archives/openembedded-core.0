Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.40242.1629211954913272553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hn1NRhqV;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863861f65=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17HCvJZf024559
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 14:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=eWM9i5tqf0U8aKdtMu+7cBy+3uZIn0F2CffrhEiD64k=;
 b=Hn1NRhqVzfnwQ4csfrz1PBf7O91mzPh8oP6e2Qvl1WMr6cR7oVHyr1ypWfkGjLWxsVZh
 Wa6O99g1X904OQEsy5dvADHt7wio6Gj81A//lzf11CUF91M8+Zoo/3F/1CPMS5yOy0dy
 HvmX3MNOG0YvpWcG3reKcrg6/tipOTDs9933DwbfYSU+UwxZtMTKr1qv4hXy7eNKUY+Q
 s+ecmE/O//Dv246km4ZqFY2z/0gi10Pnrv+WBw3GWTkPh9QUGnJSDACWpEtJamb7PhBO
 ntdU5b6sNJW7k+dnYx4fh0aySMoBgNxHH6XN4xjeTKefJZqCXHYy8TW0cD2pG2hxi+tx gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwpu8m80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 14:52:33 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17HEqW4W031130
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 14:52:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwpu8m7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Aug 2021 14:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxqBQQApZZeLxLSNJQQGAP7c460ZzpMh96o2eMHZro93sk7UabpYue+fQ+m8n9DrFN9z9qQpv1yH03bKMJA1Ug0DD6wCEVDHxUa1DtDlMJiyk9E+E37J+I/uVk11WZwqq6AbYxmU2I8hGqKzyTItnxzTl6kp6DC179QAtD19w3igb8T5ab28jX6ZX++OMqmSkA+jV0NXuUVUGo9Rml3Auo9/5bjVjH/KPLxVkIGqeTgmAODr/Ov02VVFNUB8DjB+ZfpY7QruUISLrFfgs+SmIO28W9QcDFz0SLczaF83IwvZ0SE1tMSSJ+SquQbxEyFAe/5IWz+TIKk1dgyNgYYPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWM9i5tqf0U8aKdtMu+7cBy+3uZIn0F2CffrhEiD64k=;
 b=EAn75PQm4eyuVovO1bieVCb5K709NzIrt9zfdVsEpdTrgwp2uFip9ljvMciTuU1Vn1gTOBCJbLP2EuFaJwmag859ihx3MyY1VtTQgJbbvBfzt97ARmzl2ExkjGzCruDSY252xFb3cAbbvT0wHWJxQZk9GGU+edOxlHTV7rZJoKijvUlYEHmMdiLn2H9sJv9Ueaa+poYo+t9SEaLFKUiAtCGfqzucZbRqN/rlbyz4krdmFz+UeKFAZpub2je2NwFHJT6Ej9bIa3aJbxU7KNawcXPWwwevtzwzl9+DfXPncmJ4NsEURAKhIL3oIBeemtCh5h7ssR/p2XzwJZgDuR5NMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: pbarker.dev; dkim=none (message not signed)
 header.d=none;pbarker.dev; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3068.namprd11.prod.outlook.com (2603:10b6:5:6b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 14:52:31 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:52:31 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <1759d5f0-f40a-3a82-16ed-b5c788337c5d@windriver.com>
Date: Tue, 17 Aug 2021 10:52:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by BY5PR17CA0002.namprd17.prod.outlook.com (2603:10b6:a03:1b8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 14:52:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa54e794-9472-4de9-431f-08d9618ea3b8
X-MS-TrafficTypeDiagnostic: DM6PR11MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB30689065AED675B5D3BA7A4BF8FE9@DM6PR11MB3068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jUmbzwlv8w4lRLqYmef3tNkwPp38VnZgTPSvkfhN+Nq0Yd1gIYKfOV5LZD/W1kJ4hXLejxzoAoctPxzuK/Bg32qBJGpKLryhUlQhVoqbMnUv1xyQ0VOf/t48RMA4vqPR4W0YMM2ewHHqHaQY4PgvgAiswqw5pjpjhd7tRuu/SdohIQABKlxeaikTpKw66ZjF7nJnzPlPwzCPdJ++tlHkfLGxy1TNxK+8QMoNtuXsLI3MxMcgD1QaRFTrATpJgsucAfrRdjfQtRtJgssq3ESUbkvhI30kad7Ea7O1WdmG/Opk73D9KLzWkbUyaf5vlFdk71U67Wg+eN4ig/0QOCOrgtk8aCbM7WwmBwHAa3ORajqzm5pc+tgIdTaOxTuuXZW1OyX00mRX62/tcT0t3LAZTH+NJe6fa8xsQes5Jbqj9Ju492SFWRROC+16el1oNWfhpPFn3Vbv7G6NMMy8BL46k2uC64vDpGsu8V8JEbiGKl29swJHkeCnhXujlSTehBrNLxYIXl3EZBaRaKSp9GIxAvxbqbGWx2a8Uj9YFm+ljn4OahgJ3Ctmp73xM7Y125EbkMBTkteoAtrirfqYgeBi96WgcX2nQIuekRmj7eBOgHScGBDFnJ8nZREd9Li00vfNrbAbSQtdjliA2cSRT99xHPOZweGfZIQwcvfE5M4mSXTf8FnhgpHS+8WbVyB8YGhnKWau4ExwTWN7vM1dXwdKR9nYnjzorY7haH9S1RcC01WtyvPPbLb7lmL3tih+26f0ft2O7Lx2ajEwiGCLwAmoQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(6916009)(5660300002)(478600001)(4326008)(16576012)(66476007)(54906003)(956004)(2616005)(186003)(316002)(26005)(53546011)(66946007)(6486002)(66556008)(31696002)(52116002)(31686004)(36756003)(83380400001)(8936002)(7416002)(2906002)(86362001)(38100700002)(38350700002)(8676002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yfUgMGq359qT/SEenQaD5okKE2A/pi4tXpzRwykJm3Ch8JWxYa/WsLdSYjxyJLWAIc5PjGBBDySvWKAwFEzsGq76bFb0p/K7tOeUHCtbYqDFV0OND56bOvru+3RaoaAHjYhGeriEpOue5QgSx0vnhZ3gNuJ+yfcfp7UH7gim6oijLQIKiCMu13BEnzkDMOTzz/02lbqWPsr8OrdSVIMsyafOYhZhzdg1w4cTfzFBMNpU+k3kQzc6DOxGHgeko7aJ8Bk2UnM+/SFctlykdd1ckSFT9cySaL2+mJl5JhDTun9YVuZImejzf+Bp+lmlfmjB8gsQHdcbixfYFD1qZIL25SBiHRhbfszKnxXhmFfxeh4+2UGcwCE0swOz8t7PFLiBsZ8T6wgp5sG8jLTzR6DlmC7rBMPuh8muCOWe2I+XTIUtURjVmNAgY+mEt+r7en/6YNJ5ZQ4SizxcQD3TNjclETThFmbMkOvhYpSIv8hTbGL3Gi60q8/NBZjPizWvFWFSfezRssA58xYgO6K4ujtCbCIiQHXSB5AycxNagWE+jsSgEpL8huTGMijrpofd4wYRIr3lYJRCrDzg3Y4TCkjsNMZIO4bXVTNzcudzyIO0rVGGsHClN5gGUJ7DivdR8fA3DtZRFwlrtx9lTowP0UmtCjGlqte0KJhzNovblc1O44YYFfIvPDwM0DQHDJwMjaTxXyb8/nT4GolSLCuQaBEGwRrgDw2zRNlrsyXvQopxt/APWfthuskRvAHAI4ftLMmq
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa54e794-9472-4de9-431f-08d9618ea3b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:52:31.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HagOwO+RyAcM4YjPRlLNWptxfHkb+/f9L26ZiviX04lZXulFIZtVnmq3PBtP76V/HIkFOPliMK0T/RzYhUvXFkJsEik50Ix+NFUWjt1UtZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3068
X-Proofpoint-ORIG-GUID: zYOV5DOwxoqdi5BgIR3TBbcr_qyZ0yP2
X-Proofpoint-GUID: kMhmUSpMJ2A-Wj8SQqp7PGHvQCGQuKHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_05,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170090
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-08-13 11:22 a.m., Vinay Kumar wrote:
> Hi Randy,
> 
>>> Vinay or I will look into glibc/qemuppc64
>>> if no one else is working on that.
> 
> The failure is due to the below error in libstd-rs package build.
> "error: unrecognized arch "powerpc64le" in target specification"
> 
> The reason for this is "arch": "powerpc64le" from the below target
> specific file.
> 
> cat $b2/tmp/work/ppc64p9le-poky-linux/libstd-rs/1.54.0-r0/recipe-sysroot-native/usr/lib/rustlib/powerpc64le-poky-linux.json
> {
>      "llvm-target": "powerpc64le-unknown-linux-gnu",
>      "data-layout": "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512",
>      "max-atomic-width": 64,
>      "target-pointer-width": "64",
>      "target-c-int-width": "64",
>      "target-endian": "little",
>      "arch": "powerpc64le",
>      "os": "linux",
>      "env": "gnu",
>      "vendor": "unknown",
>      "target-family": "unix",
>      "linker": "powerpc64le-poky-linux-gcc",
>      "ar": "powerpc64le-poky-linux-ar",
>      "cpu": "generic",
>      "dynamic-linking": true,
>      "executables": true,
>      "linker-is-gnu": true,
>      "linker-flavor": "gcc",
>      "has-rpath": true,
>      "has-elf-tls": true,
>      "position-independent-executables": true,
>      "panic-strategy": "unwind"
> }
> 
> So the "arch" should be "powerpc64" in case of "powerpc64le" fixes the
> librstd-rs build failure.
> 
> With the above fix,
> 
> $cat  rust-hello-world-buildall.log
> BUILDALL-QEMU LOG FOR rust-hello-world
> START TIME: 2021-08-13_03:11:23
> HOSTNAME: ala-lpggp3
> HOST OS: Ubuntu 18.04.3 LTS
> HOST KERNEL: 5.4.0-80-generic
> ===============
> BUILD RESULTS:
> [glibc]
> PASS: qemuriscv32
> PASS: qemuarmv5
> PASS: qemumips
> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> PASS: qemuarm
> PASS: qemuppc
> PASS: qemuriscv64
> PASS: qemuppc64
> PASS: qemux86
> [musl]
> FAIL: qemuriscv32
> FAIL: qemuarmv5
> FAIL: qemumips
> FAIL: qemux86-64
> FAIL: qemuarm64
> FAIL: qemumips64
> FAIL: qemuarm
> FAIL: qemuppc
> FAIL: qemuriscv64
> FAIL: qemuppc64
> FAIL: qemux86
> ===============
> PASSED: 11
> FAILED: 11
> 
> Regards,
> Vinay

Thanks Vinay, applied.

I'll push a new branch to poky-contrib later today.

../Randy
> 
> On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> rust-common.inc: Fix build failure with qemuppc64.
>>
>> The glibc build of "rust-hello-world" throws error in libstd-rs package.
>> error: unrecognized arch "powerpc64le" in target specification
>>
>> The same got fixed by changing the arch to "powerpc64".
>>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>   meta/recipes-devtools/rust/rust-common.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
>> index 350517c723..f574152815 100644
>> --- a/meta/recipes-devtools/rust/rust-common.inc
>> +++ b/meta/recipes-devtools/rust/rust-common.inc
>> @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
>>           return "mips64"
>>       elif arch == "armv7":
>>           return "arm"
>> +    elif arch == "powerpc64le":
>> +        return "powerpc64"
>>       else:
>>           return arch
>>
>> --
>> 2.31.1
>>


-- 
# Randy MacLeod
# Wind River Linux
