Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.6492.1593548581511360256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 13:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=S/RFYM1z;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=0450fd510a=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05UKEDpO006774;
	Tue, 30 Jun 2020 15:22:57 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0b-00010702.pphosted.com with ESMTP id 31x3310uec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2020 15:22:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCn0VNB0YOQgrruwHEOoeLQQahr05C4xdYThdOy/9Nj/1Q/wALl/+RWvkWTwPlNPwaVCHyR+EmdYqtq3ideTjcpB2NkicdZeEVr3kOEPEifXOKeiTcFn2YVKKKCVNV4Y10hqn4O9oIjtotTFAcTe6A8rfYW0SO8xb+YUPKSzbBDyppkTpzdfIpxHKKUG4JGag/bU8ipVBnAy1ernFiebfYZBAHvItJZlnKhrsec1pPtLjza5meGNgfIf4vfwWm83XU8+cFt7Op7egbY+fvjdeV/tzsvXEF+yoXR26LP6H5WYHH0XoDpdd9CORQooMbqLY64mYiX/lofNAE+VGb2vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJH0EZWFakuoPpgZAt6hsyLoobudBE1rkr0recgHUkU=;
 b=FnDVO2Hisu3zlU5nPTeweKnst2SreqfRCv8Fcn2d1YgsZ5p3snYSUn+lvenUxJfkPtw+0KCUkixOaBktQRQzTucixzEXkIyjA5uPvNdF975SPIUn24+xkz2T1DiBHIiXhK0qW+BopQMWyaUwkmxYCLxUG3qXuKj8axTdn9vLA0BewZ4Rsg7oXMmfLzNPgA3P4vdXmzfgfv2e9c2SPbLDvR34T7zhMsVxQzcz9BsyDCLEH+frG9rvl3DuBUgjWShhwf3SFscF36i3vR/t/oLwRT5AK6n2ImbWkjUEU3ZSlkf7GeN6eO5mwYKkTDsHdd+mQQy4OKX2gFQVksrr1RuEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJH0EZWFakuoPpgZAt6hsyLoobudBE1rkr0recgHUkU=;
 b=S/RFYM1z76kwWE//ZJBXsJizZSdnL6bZZ42sJjAv/pGcm53ocYMMWepId2dxUrqCjy3b2VqPqUVotN6WU0+ddO90XxgwB+NX8hV/UgYhExRj51fjoUJIsujitH5eRs4Sf++9i2iSDvIoPIW2AF5Eaf77kCcB5pQf0p2lMmWDb1g=
Authentication-Results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM5PR04MB0587.namprd04.prod.outlook.com (2603:10b6:3:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 20:22:50 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::ad56:99d5:d30b:27bc]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::ad56:99d5:d30b:27bc%5]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 20:22:50 +0000
To: Fredrik Gustafsson <Fredrik.Gustafsson@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>,
        Alejandro Del Castillo <alejandro.delcastillo@ni.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
 <541d697f-b45d-9416-fed9-d96dc65103e5@ni.com> <1593542294400.41926@axis.com>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <654bc096-042f-2564-73c5-8813b141b054@ni.com>
Date: Tue, 30 Jun 2020 15:22:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593542294400.41926@axis.com>
X-ClientProxiedBy: DM6PR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:5:54::24) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by DM6PR06CA0047.namprd06.prod.outlook.com (2603:10b6:5:54::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Tue, 30 Jun 2020 20:22:50 +0000
X-Originating-IP: [65.36.69.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03f49a51-ff96-43aa-3986-08d81d335c59
X-MS-TrafficTypeDiagnostic: DM5PR04MB0587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR04MB058753129849911E6A29B889FE6F0@DM5PR04MB0587.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KcDNZ5FOTrVvr4b7zs1Ss3GfxZTVEb0dWxbIEaIyI9p+ipJZafXwAGBz4ykrIpiILc4olpMrQeTnbduoZf9yztxNNtIP+z1DcUt+68kM/Yr2RoiiaGYAgK8bjHyz6Q2C9UmsqPLRWMA5Fx1cUpQcNvALt2bRC+vYpyG6ggwqxLKpegrcKMzafHQ6acsJon5nhKIiG2V/atXwREGJEIvv88vAQdp1rmGbPfvIxuElfZGVph5JsBw2MplebdvhCUfasOzFz+crIfKjU8zJm/dQcrN8Z+Iux0xE3uckAhWz5CuXbEPi7ntSWqeIc5+eCtvGM8vJttpCl4nFsE9++IEAOLiecI+SdrbYlDADiKk9bG/VyXZZXFrSaYjaxT8eotm+Lf5L17sjFLXMu2xPi9ioaOc7cNgJ9ZXWoiMuXuoIv3uCJ2P5CrK/ANkEKBrm1dH1EM4pIzZWqq2KT/N153kqKw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(110136005)(8936002)(54906003)(53546011)(2906002)(186003)(44832011)(36756003)(956004)(8676002)(16576012)(2616005)(6486002)(966005)(66556008)(66476007)(66946007)(5660300002)(26005)(86362001)(52116002)(316002)(4326008)(36916002)(83380400001)(31696002)(31686004)(16526019)(478600001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	TEnbUPoOW8WKB+hNddIOiVkD9gxcNPrYLC7XQ0BcZXejb2RxtVpPSps0qX9SZEZssrEp6z1C7s6Xl+cNXvNmCSOOAbTq/HgGOb+tCubsDXN6Jm2Gy5niFBEUsMfKZmb1jR+6HmKEsAZ9D9US1JaIm3tvkvaoO5DV8Ia/ZKqKelwIqprEXAEUezrjlHWHeBQa/J7t8ja/Q6TXJECKTFd1yieB+9PwGjWN0JIn7qfG/Re0lUHslskUanWPYr52tnbUZD2NhIkJxuSVNOLbE7LHNw1eJyflr471G8u8935cmDEjp+b0tkT4XYCZiUOE8J3NZpK82rDuvrn1yapwwNLtV+2PHA4skIXlnWqVC0ceZwnenajDxnMxo4Y1Ijud/vViA7Z+LtPpZwDcgg0w1Wz3BCw2+KHyEVcvw/eCc98ACA0Q2eV+MeP/iAC7ygeEuN0CsVNWjKHg8dJLc/LYvzOBKsVIVNwM0fS1uA15HjVFcD8=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f49a51-ff96-43aa-3986-08d81d335c59
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 20:22:50.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gO9Q+sW6xRyVhBA9h2XB//Xd1qftSVHlPVtqpkBlHVv1tdn1mgYh8+1zrc7kpfX8wiZ/wGEhCj0WGOoLpwv7Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0587
Subject: Re: [OE-core] Add package managers as a plugin
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-06-30_06:2020-06-30,2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 impostorscore=0 malwarescore=0 mlxlogscore=916 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 cotscore=-2147483648 clxscore=1015
 classifier=spam adjust=30 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300138
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Fredrik,

On 6/30/20 1:38 PM, Fredrik Gustafsson wrote:
> I added apk to your script and then ran
> <snip>
>
> That is not supportive of my statement of ipk being the slowest package manager.
> That statement come from timing tests done with our proprietary version of poky
> that is somewhat extended when it comes to the do_rootfs task. We're generating
> a bit more artifacts than poky.
Ah; good to know. Thanks for checking again! Sounds like it could be 
related to extant opkg bugs which degrade performance when you have many 
(read: thousands) of packages in the feed.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13593

> So I tried your script with core-image-sato-sdk-ptest instead that is a bigger image.
> The results where more mixed. There is a huge difference between different package
> managers:
> <snip>
>
> But yeah, I should probably rephrase my cover letter. You'll find a layer for APK that will
> apply on top of my patch serie attached to this email.
Thanks for sending that; I'm interested to take a look at it. Those new 
performance numbers look impressive.

Good luck with the patchset.

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time OS
National Instruments

alex.stewart@ni.com
office: +1(512)683-8522

