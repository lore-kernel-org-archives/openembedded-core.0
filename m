Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1360.1628641350967961191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 17:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NWh0fGZ4;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857057f33=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B0KV8c012219
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 17:22:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=7bNGfllHZ7/BcsC+BczQNKkNbTA/vT0bc19mNafPCTg=;
 b=NWh0fGZ44Ci6YqetUbo3hQ1w34yN70s1/zsdKjyaG2lNALttszSZrcZD97MK1lVHNiry
 ZtLVgd7iQ9iN28ZTh1bAU6gwH1NQMbzTlmc0k8wdPDc7AqEG2yFeOyVl3DBdvEc0z7B/
 srJVFyi1S8Y1W0lHPwH3LNS33r6oVpakRvPWWgqPrXl4in4DpZWsLqUQwnMFBbfZe7Fk
 j0tZbNQMXjWA/99tSavmvH5JsUtTBa+C/KvIC1q0rxA9yvf+zyDkmDWAQWysFEMX+oey
 gKHgZLRkS3Xw/57pGGVUiLM3rwLbS9/QyaqBHSYn/3fddeRR4jFGbOIdtCPOofNzy6eh tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ac2xf810d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 17:22:30 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17B0MTM0017517
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 17:22:29 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ac2xf810c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Aug 2021 17:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elUoyzW52ZMnPOTuoUzjjVXSvTQL+BtuGzOHBOWscYdmGuproifa0x7AJYmN0g4W3DuXNUME1UeIDbAAllLNvSOd5TsDMHfBttGD528IKJfMQrtkj5hBXMILgmuzoe5fy982QqJhC4mkQA6fcR5AYwqZ948DoK56FGFwWTjS0uF/GRrMYQlL6Ax46NfjffHA3pSDzbUD3D8KlIEyj2kTljdZWykRUSubgb6WUASCowlb/oFkipn5J08Z4F4yHveMcISO01Xs4P3mRu0EDab2LVbeKzhPLxodLYWUtmpjr46caBBT1To9Aiv9fSVHktXXNxZ5kIfANl43eAJnoAyaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bNGfllHZ7/BcsC+BczQNKkNbTA/vT0bc19mNafPCTg=;
 b=hWBsWjn8oY6xYU8MVSrow5eJBZwSekjGrI6UEQU2EKBfBTX4An1C9IM8GdLgD7L5LvLMmvOPsDWXZnNxtt+DZ8z+WHYZyj9E5yKJc0N7IsUalds/KPDgcViGSqpw+dsVbtmyv+Ze8F51LxSiUEmhONE12HlzostZxq3/TcQp1sFZrwaRfJVYrtVYd7k6ULNIl1ZQDl2emocAVlDBVGXIimK4V6HzSy1Px1OEQnl74hNUZ3hz5VTkdu2KLQoBgIU+LdyAiAI8t+r6zn6HOXTuYLfwlUybJSalGbTWdU5y9TS7/i3EU00Z4BKbPiAKd4dqxuQ9Z/YfRLtL8fXfsHAJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1483.namprd11.prod.outlook.com (2603:10b6:4:e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17; Wed, 11 Aug 2021 00:22:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 00:22:27 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, steven@stevenwalter.org,
        johan.anderholm@gmail.com, derek@asterius.io,
        Paul Barker <pbarker@konsulko.com>, cardoe@cardoe.com, dev@codyps.com,
        tylerwhall@gmail.com, Khem Raj <raj.khem@gmail.com>,
        Vinay Kumar <vinay.kumar@blackfigtech.com>,
        "Wold, Saul" <saul.wold@windriver.com>,
        Martin Jansa <martin.jansa@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Subject: [v3] [RFC] Merge meta-rust to oe-core
Message-ID: <38fa346a-0a95-2d6a-e842-c7b0e9fd8ff4@windriver.com>
Date: Tue, 10 Aug 2021 20:22:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY3PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:217::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 00:22:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f00930c-7f61-4f85-c003-08d95c5e198e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1483EED8E1F20AC6DA1C1CD5F8F89@DM5PR11MB1483.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aLaWKOq7/xSb3KS7FONWj+Fo6mWDvzvOjPyutEJJaPgZpSc5zYtEtZiwskWpFguLMD506ljxqrrDK6162TFRv/dH9xInkG5OLpu10UOCtUNnodyUEisLTZtDMPzjHHNTR+nZi/kTqHwWsjMlu91WF/zzXncBWntTDJp7b5yPBPFd7BEcD4mg4umRh+aNJHQKj8ubZOfLxph961VYGKrAPnYC15iLQWB9xaKtJm5S0h4DeDzXlgv+eBv2+VjcpCSC02Mpt2sZmDVVbq69vT/wATDlMOhCyxlKIU1kjDkpiz4Ze38h2UzZUuyqOnKxzsXO/FYBfTW3BFBaWMkXjhmroEZedT58j+0U0QjeeitQmlO1ihxXarwa0tnWW7qus9kJrEeNwYPE6AEe7IpYXwASFd0euUeO0i4coUxe6fzBSHGrrDPll/lU3FLdw1Dwu76UpyxgZz4gflVYtlEPIALIbZCI3npiJJzKYbvoJRubb9dZVtoqCGvVFQUl+MtrGSWr6LyRatVg5OZFIckFsLx4Ox/25TufehWGuKYgDuly0iGJSM6m7hgvem6+Tk9FYw/2iTwejcqvfcc5oFqUkpbaC9wzRGmq2Z8hwprz28mtdpE1sm3Gio6msx8TYFjT489nPOeimXozQ0LeEfDqEOLg7X1iSD0hKYxiUf2PRm38oQH5DybsZYfc4uCBGAVaRoLboaDupxzcScfGEoe7uzJEkDyF+QL45mo97qGuW34UH7Yh1FRrXxuqeSiezI3ArGGsTjlDSs3D94zDFSaIsYobre0uSTXQo/Nz6u6mOqIVQv1nZiqXEyRorVyXwDBRk8lZ0MasKhbnPeivcNLBEBwAJyIuDpfw0PBxHlKyVk2PmZ1EtmrjZ39DJEoYwaTGt+ILEaVPRaGYiYGAZTh32HCalA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(66476007)(8936002)(66946007)(83380400001)(8676002)(6666004)(66556008)(6916009)(7416002)(2616005)(316002)(16576012)(2906002)(31686004)(52116002)(36756003)(956004)(4326008)(478600001)(186003)(38100700002)(38350700002)(6486002)(86362001)(26005)(5660300002)(31696002)(966005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkRIMjNrS29DUkFiaXJPN3dBbUROM1QvMW5lZnhuSm03RlZGd25MdWpuSllq?=
 =?utf-8?B?UDZZd1hGMnlheThkOE1XUzJlU0dWOG5oWENmaE1IKzRyeEE2d25xVjVmbDBJ?=
 =?utf-8?B?YzgwZ0VEMGxibnQrQ3FWNXVHM1Y3NTV5YjAxQXdkY2Ztb0dVUkZ6TG52aVcr?=
 =?utf-8?B?TXdSWnMwK2lCTnNMTG5KeFc3ekxxVGpsUTZHTGVybUpQVnJMQWE0cncxK1My?=
 =?utf-8?B?YjlLZFZ4cXFRVmNNeUt1R0trWE5UM0tnMTlUV1hoYVNyOGc3SW05b1FKNG9X?=
 =?utf-8?B?Z0p1aHhaNkNLL1VZYVBwZXU2TjF4SjJtb1F5MktwL3BuV1RWNnpqSm92eUo1?=
 =?utf-8?B?RnJ6RHY0UkhhdC9sOVhPanpSa3Z3ajZYN3IxbERJY3BoQUdsR0hxL2NpdXNL?=
 =?utf-8?B?MlJlM0RINW5qYS92enBocGVhNGtqVWtBdksrbEpNUStobDVBRUs0Mm9Ucng3?=
 =?utf-8?B?dHVwYnBtRDdrZ0NPSzlabmVhMVZjZU5FbmovL05Nb0xoUm1tM1B4RGxhZnB5?=
 =?utf-8?B?Z0F3TGhEdU5WL2U5U0VTMVlLVjZXTWFTNUhoNnFyNFBmMXdsYysrdGt4Wkk2?=
 =?utf-8?B?UlkrUGxxa1RPeVhrQmFHS1dyaHRWK3psOEI1ZytPNjRQczVKK2pQS2xMMWJq?=
 =?utf-8?B?VXZCQzZJc1VabDBPckhnUjFoR1hZTXJHWldTNFRVWk5MRk9nOXF4SW5aaXhl?=
 =?utf-8?B?NHUraFJEaHNaenk2NXpKL2YyOFBWRWczc3BhNjNoOUl3SVJteTJwdWlXdFFC?=
 =?utf-8?B?VmhaMXM0cmZpWVc3U21BVWc1N1FOMFAwQ0JybVIrL3ByLy9vTW1QZnRFcU9H?=
 =?utf-8?B?bm03TldEUzh6VUZaZUNXYU8yVmJ0M20yOGxyZzdVS0hlcEZMKzlhUkEva2h3?=
 =?utf-8?B?aGlBT0JteXljcHdZdXQ1ajUyTnpHK0EyRTRoazRLNjByZTQxZkorcmdvWDZk?=
 =?utf-8?B?SDdNd1ZhZzZOVHVLU05yb2MzMDZWVWh2bnJWL3ZOT2d6c1BuSUQ4NTV6SWVI?=
 =?utf-8?B?ZkJUVDQwWXZIVU1yS2NYSG9SSGtUUFlkMEhPVkp3VlphemQvYlI3dlEvMnA4?=
 =?utf-8?B?SXpOTWV5bGl1a3Rmc2lOT2dEOVk1MWQ0SDJCT0YrblY0akRLd2lhem1EbHpM?=
 =?utf-8?B?TnBjOFE1OSs5TXFGdWpxWEF1dHljN2VWdWVwQkVQYTZlZXhkenFIdldwMG4y?=
 =?utf-8?B?TGV1UzRHdG9pbkphbTR5eXl0eUZ6QXF0TE9XekZlSkhHWC9yMyt5bno0T3Nw?=
 =?utf-8?B?Y0RQa0JiTzdnMVhZdFNFT0RObjNZYVVPVVFVeEpPQldGSEZnSlpZRis0Ujkv?=
 =?utf-8?B?eDU5RFUxaGl2WisraktTRHF6ejVYbVRCc1VjNlRnT1lxTFBQTDNvZHd3RjJu?=
 =?utf-8?B?NWlDYjFBNWU2YVllOW8wRnlLQjMwVHBHZXc5ZmJMTXFMcVFuYUxsZTY4NFNZ?=
 =?utf-8?B?Qk9Vajl2Z0diL3BnN2JyVEtCbHVKZTlSOTJkT0tBWW5wSG0yaHFFZDE5VCtI?=
 =?utf-8?B?YmduRXJRQUQvQVVXOHEvQkZ5QWNFUndYZXFEKzV3OHFEb1ZTeXJrSWpxb3RU?=
 =?utf-8?B?bk9Tbk1XS1hjZUt0c2Ywb2Y5TVBVaERXVzlBWWtES0FGSy9hWUMwZ2dMVkRm?=
 =?utf-8?B?WlhCellZWnJ6Q1ZaemxvNVBDdGFlTHVpL1QyYmU5bDBLUHNBZGo4dzU0aWp4?=
 =?utf-8?B?Q1MxTG56NTVNQlpMVUFHYnFNYkV0WkVzeXpjY1ZiMzJBR1E3WGs2azRGOG5i?=
 =?utf-8?Q?XhveIsHE3l9hxJJkj/VVjOHdAxrcR13WREvDrky?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f00930c-7f61-4f85-c003-08d95c5e198e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 00:22:27.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zKVFqvuHhbFQOHkIcBYBHvXz4505BD8q/hjX5tmIGsPI7uEp7LkqIrvkS+sxCkLE6oz+2G+uGEkhDXWAlbYiVkGIssV5pqBjCXpsSNFzVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1483
X-Proofpoint-ORIG-GUID: MfZcQeu9_wW1PRp_No_iFi0C7bx2u6Dc
X-Proofpoint-GUID: V8ARadXF8dI315QbbU2pYsjUsqT5Q90p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-10_08,2021-08-10_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA


I started working on the merge of meta-rust to oe-core again.

CCing widely at the beginning this time.
Please reply to me privately if you want to be dropped.

I really need other people to sign up as [co-]maintainers!

I pushed what I did today to:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-10-2021-a

$ git log --stat below.

I've only started but so far, what I see is that, as expected, 
rust-hello-world works for
qemux86-64, qemuarm and likely other targets. I'm doing a buildall-qemu 
overnight.

The oe-selftests that we had problems with before are still a problem:

oe-selftest still has at least three tests failing:

1.
oe-selftest -r distrodata.Distrodata.test_maintainers
   This is due having two versions of cargo and rust.

   --> I'll remove 1.51 unless people object.

2.
oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs

I've just started to look at these test failures.
$ bitbake-dump-sigs shows a diff like:

  List of dependencies for variable BASEDEPENDS is set()
  List of dependencies for variable BUILD_AR is {'BUILD_PREFIX'}
-List of dependencies for variable BUILD_AS is {'BUILD_PREFIX', 'BUILD_AS_ARCH'}
+List of dependencies for variable BUILD_AS is {'BUILD_AS_ARCH', 'BUILD_PREFIX'}
  List of dependencies for variable BUILD_AS_ARCH is set()
-List of dependencies for variable BUILD_CC is {'BUILD_PREFIX', 'BUILD_CC_ARCH'}
-List of dependencies for variable BUILD_CCLD is {'BUILD_PREFIX', 'BUILD_CC_ARCH'}
+List of dependencies for variable BUILD_CC is {'BUILD_CC_ARCH', 'BUILD_PREFIX'}
+List of dependencies for variable BUILD_CCLD is {'BUILD_CC_ARCH', 'BUILD_PREFIX'}
  List of dependencies for variable BUILD_CC_ARCH is set()

Tips welcome!
  

Btw, I know that the rust community is working on reproducibility:
    https://github.com/rust-lang/rust/labels/A-reproducibility
This diffsigs problem may be related but I haven't looked at the issue long enough yet to tell.


4.
I'll run a test on the autobuilder to see if the debian build from Feb is still a problem:
   rust-native doesn't build on debian8:
https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/steps/13/logs/stdio


I'll run buildall-qemu rust-hello-world overnight.

Thanks,

../Randy


$ git log --stat origin/master..HEAD
commit 725c11999a38244cc28e1d1fe17a7e05c5bdb7a3
Author: Randy MacLeod <randy.macleod@windriver.com>
Date:   Wed Feb 24 20:48:23 2021

     maintainers: Add myself as maintainer for rust pkgs
     
     I'm willing to do the rust package maintenance but
     if anyone else wants to sign up, that would be welcome.
     
     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

  meta/conf/distro/include/maintainers.inc | 10 ++++++++++
  1 file changed, 10 insertions(+)

commit a658c5c7fac6160f7720bbf30ae35ccc143fcb57
Author: Randy MacLeod <randy.macleod@windriver.com>
Date:   Wed Feb 24 20:48:22 2021

     cargo/rust/rustfmt: exclude from world
     
     cargo, rust, and rustfmt can't be built for the targets yet
     so exclude them from world builds.
     
     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

  meta/recipes-devtools/cargo/cargo.inc         | 1 +
  meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 2 +-
  2 files changed, 2 insertions(+), 1 deletion(-)

commit 8860562733d7cce3cede27fc611f984a2d9351d6
Author: Randy MacLeod <randy.macleod@windriver.com>
Date:   Wed Feb 24 20:48:20 2021

     rust: update the README to conform to being in oe-core
     
     Provide the full link to the meta-rust issue since
     the README is no longer part of meta-rust.
     
     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

  meta/recipes-devtools/rust/README-rust.md | 25 +++++++------------------
  1 file changed, 7 insertions(+), 18 deletions(-)

commit 7398219dcfffe746038d36bbbaacbd52265a3fc7
Author: Randy MacLeod <randy.macleod@windriver.com>
Date:   Wed Feb 24 20:48:18 2021

     rust: mv README.md to recipes-devtools/rust/README-rust.md
     
     Import the meta-rust/README.md but relocate and rename it.
     
     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

  meta/recipes-devtools/rust/README-rust.md | 69 +++++++++++++++++++++++++++++++
  1 file changed, 69 insertions(+)

commit 80586a849e1c725310f58ed9705febf97bc00bda
Author: Randy MacLeod <Randy.MacLeod@windriver.com>
Date:   Tue Aug 10 13:52:19 2021

     rust: initial merge of most of meta-rust
     
     In the meta-rust repo at commit:
        448047c Upgrade to 1.54.0 (#359)
     
     Make the required directories:
       mkdir ../oe-core/meta/recipes-devtools/rust
       mkdir ../oe-core/meta/recipes-devtools/cargo
       mkdir ../oe-core/meta/recipes-example
     and then:
       cp recipes-devtools/rust/* ../oe-core/meta/recipes-devtools/rust
       cp recipes-devtools/cargo/* ../oe-core/meta/recipes-devtools/cargo
       cp lib/crate.py ../oe-core/meta/lib
       cp recipes-example/* ../oe-core/meta/recipes-example
       cp conf/distro/include/rust_* ../oe-core/meta/conf/distro/include/
       cp classes/* ../oe-core/meta/classes/
       cp recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb ../oe-core/meta/recipes-core/packagegroups
     
     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

  meta/classes/cargo.bbclass                         |  89 ++
  meta/classes/cargo_common.bbclass                  | 129 +++
  meta/classes/crate-fetch.bbclass                   |  13 +
  meta/classes/rust-bin.bbclass                      | 149 ++++
  meta/classes/rust-common.bbclass                   | 174 ++++
  meta/classes/rust.bbclass                          |  45 +
  meta/conf/distro/include/rust_security_flags.inc   |   7 +
  meta/conf/distro/include/rust_versions.inc         |  13 +
  meta/lib/crate.py                                  | 149 ++++
  .../packagegroup-rust-cross-canadian.bb            |  18 +
  .../cargo/cargo-1.51.0/0001-Disable-http2.patch    |  28 +
  .../cargo/cargo-1.51.0/riscv-march.patch           |  73 ++
  .../cargo/cargo-1.51.0/rv64gc.patch                |  37 +
  .../cargo/cargo-cross-canadian.inc                 |  74 ++
  .../cargo/cargo-cross-canadian_1.51.0.bb           |   6 +
  .../cargo/cargo-cross-canadian_1.54.0.bb           |   6 +
  meta/recipes-devtools/cargo/cargo.inc              |  50 ++
  meta/recipes-devtools/cargo/cargo_1.51.0.bb        |   8 +
  meta/recipes-devtools/cargo/cargo_1.54.0.bb        |   4 +
  meta/recipes-devtools/rust/files/riscv-march.patch |  73 ++
  meta/recipes-devtools/rust/files/rv64gc.patch      |  37 +
  ...001-Add-base-definitions-for-riscv64-musl.patch | 904 ++++++++++++++++++++
  ...-linux-musl-mod.rs-add-riscv64-to-b64-set.patch |  29 +
  ...3-FIXUP-Correct-definitions-to-match-musl.patch | 740 +++++++++++++++++
  ...pdate-1.51.0-checksums-for-modified-files.patch |  21 +
  .../0004-Update-checksums-for-modified-files.patch |  21 +
  ...-definitions-for-riscv64-musl-libc-0.2.93.patch | 905 +++++++++++++++++++++
  ...-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch |  31 +
  ...ect-definitions-to-match-musl-libc-0.2.93.patch | 741 +++++++++++++++++
  ...ksums-for-modified-files-for-rust-1.54.0-.patch |  23 +
  meta/recipes-devtools/rust/libstd-rs.inc           |  40 +
  meta/recipes-devtools/rust/libstd-rs_1.51.0.bb     |  12 +
  meta/recipes-devtools/rust/libstd-rs_1.54.0.bb     |  11 +
  meta/recipes-devtools/rust/rust-common.inc         | 346 ++++++++
  .../rust/rust-cross-canadian-common.inc            |  53 ++
  meta/recipes-devtools/rust/rust-cross-canadian.inc |  78 ++
  .../rust/rust-cross-canadian_1.51.0.bb             |   6 +
  .../rust/rust-cross-canadian_1.54.0.bb             |   6 +
  meta/recipes-devtools/rust/rust-cross.inc          |  71 ++
  meta/recipes-devtools/rust/rust-cross_1.51.0.bb    |   2 +
  meta/recipes-devtools/rust/rust-cross_1.54.0.bb    |   2 +
  meta/recipes-devtools/rust/rust-llvm.inc           |  63 ++
  .../rust-llvm/0001-nfc-Fix-missing-include.patch   |  26 +
  .../0002-llvm-allow-env-override-of-exe-path.patch |  32 +
  meta/recipes-devtools/rust/rust-llvm_1.51.0.bb     |   7 +
  meta/recipes-devtools/rust/rust-llvm_1.54.0.bb     |   5 +
  .../recipes-devtools/rust/rust-snapshot-1.51.0.inc |  18 +
  .../recipes-devtools/rust/rust-snapshot-1.54.0.inc |  18 +
  meta/recipes-devtools/rust/rust-snapshot.inc       |   9 +
  meta/recipes-devtools/rust/rust-source-1.51.0.inc  |   3 +
  meta/recipes-devtools/rust/rust-source-1.54.0.inc  |   3 +
  meta/recipes-devtools/rust/rust-source.inc         |   3 +
  meta/recipes-devtools/rust/rust-target.inc         |  10 +
  .../rust/rust-tools-cross-canadian.inc             |  38 +
  .../rust/rust-tools-cross-canadian_1.51.0.bb       |   6 +
  .../rust/rust-tools-cross-canadian_1.54.0.bb       |   6 +
  meta/recipes-devtools/rust/rust.inc                | 193 +++++
  ...t-Fix-dash-vs-underscore-mismatches-in-op.patch |  75 ++
  meta/recipes-devtools/rust/rust_1.51.0.bb          |  16 +
  meta/recipes-devtools/rust/rust_1.54.0.bb          |  11 +
  .../rust-hello-world/0001-enable-LTO.patch         |  23 +
  .../rust-hello-world/rust-hello-world_git.bb       |  17 +
  meta/recipes-example/rustfmt/rustfmt_1.4.2.bb      | 171 ++++
  63 files changed, 5977 insertions(+)



-- 
# Randy MacLeod
# Wind River Linux

