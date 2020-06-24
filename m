Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.15940.1593011891609867024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=pZbr8OQ0;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=94447ff431=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05OEtN6M007997;
	Wed, 24 Jun 2020 10:18:07 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-00010702.pphosted.com with ESMTP id 31uusm24gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2020 10:18:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSx7LU8dxIoP+xz6/D3wCbkZUpzMisveV+t+f2KOotBIj+8PMnu2vK/6R0USceB6fhK9U0J/JA28nj17OUE8X22tzsdHbnmF2nu0NX4OqCBW9M6HyBRyknr2GvVK5EEVHYsezRwe9l642EtrTlYU6IneeoL5ElZlEeU5GREOdgehycp9LBZ9TnCJjaONfF66zqjSEOWjxidUfwJAxpdetNXz04TOHL4JBefxKd4u6vljWwySGbIvXL2+6smSHiC2JvNlquVkOokzLLuWfqJdhKrXRZulM2FxxeaDpr+vvqUXE2pHmWB2v//rx5DDu6RJ3FV39l3Dzc/weTf4caEBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9n/W9MMw/ZKq5nlrtn2FAdWGffIw88mUmQIqQMWIniE=;
 b=NcYuAVKhjkPhr+5cEXNup/WxW4U4A4DVEd/N8idLEhZs/rT9hzmqiPZvAsVPeBMKzzkdOhb0QQIgSPkHQB0ZvmfU2F8Z4+EFrlMuIurg+RosZE3jeH3Tk7TPE3gIMs+TrpplOuVUda2iOxtxwOf61I9k/txX8LfoiUGnCHvEivBKvrnFlhGJrcQ/JSo8Yt2t04xWUXpbyGdSA8xPE1dtDcMWYrTAhwvhMbglOwa4GCR8z7M9h6snG4SGRvWF3DPjRyfdTCaJM5WgbQAb6YsPGXu8dy0xcn4w1A7xQG/VSEf5mr5ZIqMS1bBoPf3GR2F0vSfaZHQ3VvaLuLurZ0DDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9n/W9MMw/ZKq5nlrtn2FAdWGffIw88mUmQIqQMWIniE=;
 b=pZbr8OQ0/vM/TOrWYtcnWVenBxQo24s455oHl/YhMGgwtQgl7FgcgVaPGeK9J1/7/2ByAk5eZwfFBlxj4gPmpnrdGkacUc6tMEgnyrLSj5JMunVuYVwKhu4W6BejgRGJxxpUtNGz81R06+rbhyXEmsakXN+0raYE9ow5dVGDRcU=
Authentication-Results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM6PR04MB6346.namprd04.prod.outlook.com (2603:10b6:5:1e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 15:18:05 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::ad56:99d5:d30b:27bc]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::ad56:99d5:d30b:27bc%5]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 15:18:05 +0000
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>,
        openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com,
        Alejandro Del Castillo <alejandro.delcastillo@ni.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <541d697f-b45d-9416-fed9-d96dc65103e5@ni.com>
Date: Wed, 24 Jun 2020 10:18:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623111328.5838-1-fredrigu@axis.com>
X-ClientProxiedBy: SN4PR0801CA0022.namprd08.prod.outlook.com
 (2603:10b6:803:29::32) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SN4PR0801CA0022.namprd08.prod.outlook.com (2603:10b6:803:29::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 15:18:04 +0000
X-Originating-IP: [65.36.69.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c09fea8a-bdd8-4d51-4402-08d81851caf1
X-MS-TrafficTypeDiagnostic: DM6PR04MB6346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB6346B453B03D4CB313C76A00FE950@DM6PR04MB6346.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iJY5gOIb2Y6RtJC8jHzl6mWzslMWTK4vHS8Vi+BO2qE8470G4ewI6wOQnKCybd6N4sgsI9YJo4hntshMzmxxjXMPHQYJ/1PIAy1oXLKAtTwE9W4H6x1uoGbn0q5bFKrxARlmK+uhxHGSUi9060y/iXlFu/4qHkzaVAghlQ5iAYZqkCzmIHxKdBWJSwKIfSApAHCo1wyZWBwqzcJxAf+pcwJ+8wmJDt1IkBJGFyM1NJnhybSMn7iyTbU2+/pVt5TEqD5aIM2rcAvXKdmYQy+HpM1Etm+ausPiCreLNpb6ZmP4ZV4eW2NUGwwqOvMuUA2BmNCYVpiJCkBM9OqdfCuNopMll7+q0lzaZHMoUqw0dQ+GBSfwstOHXwZcD+iBKP2/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(66946007)(2906002)(52116002)(36916002)(16526019)(8676002)(956004)(186003)(8936002)(26005)(53546011)(2616005)(44832011)(31686004)(86362001)(6486002)(5660300002)(31696002)(36756003)(66476007)(66556008)(316002)(16576012)(478600001)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	frFtGlCaZ6Dgewf6mNNqFkTvSDm4tA6e/RV7TyvDutDm1BepGooOWpHd1QwEH8Yg03CjpLCxr8BYpkUXtqehsh1coUAmYj9KBKWgxhfuciQOH8Ro8bUdy9Ea5VRvPi/XxKO17vgoh/QjXKDN+Ou0mmice8zVMq7ZzhfWn584Vq1OVoeFZFmCsC2sVpVaBCq7LPTdsrhV+pAHXFuTkM37k82BeYAWqzOt+2NSY1A2hodaJMU2xYv/q0PPxYMiw6ac4tGi6/uzyZIBRhflsuofSVY7LtFQLZtxKrqiqFfhN8/mYCeqGbpMrHJUxljh+54QooxCtS22lDn2X55XboteCn3/G97DgNlLznEoo+4soLV+jTubQwg+yJfCDH8R5uJbtaZdsVJHWoAhh9e863G7ZAZCpdRkz2NMD5vd/25Mh9/uGmiI9UH/XSbeBfeAhejl7ezqfokOVwxiZ2Otqe5a8NzUcw/wF/1rfOxmvSjLUvQ=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09fea8a-bdd8-4d51-4402-08d81851caf1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 15:18:05.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owDiNXMnpHM75dNcoxEhJ6JoOrhs+wDxfnwutek3ybsQeR1+K+zGG6W+2ePSE8hdvX7bd3DlsZBcHHoma37POg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6346
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-24_08:2020-06-24,2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0
 cotscore=-2147483648 spamscore=0 impostorscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240107
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-00010702.pphosted.com id 05OEtN6M007997
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/23/20 6:13 AM, Fredrik Gustafsson wrote:
> When building and having a good cache hit, a significant amount of time=
 is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm.
I was interested enough in your comment here to collect a small sampling=20
of comparative do_rootfs runs on one of my dev machines.

I used a virgin poky clone and tried to replicate the steps you provided=20
in your OP, timing only the execution of `bitbake -c do_rootfs=20
core-image-minimal`. I used the debian `time` package for timing. Here's=20
what I got:

# Summary
PM=C2=A0=C2=A0=C2=A0=C2=A0 Avg do_rootfs time (s)
--=C2=A0=C2=A0=C2=A0=C2=A0 ----------------------
deb=C2=A0=C2=A0=C2=A0 33.89
ipk=C2=A0=C2=A0=C2=A0 33.35
rpm=C2=A0=C2=A0=C2=A0 31.85

# Raw Data
deb=C2=A0=C2=A0=C2=A0 00:33.54
deb=C2=A0=C2=A0=C2=A0 00:34.66
deb=C2=A0=C2=A0=C2=A0 00:33.55
deb=C2=A0=C2=A0=C2=A0 00:33.23
deb=C2=A0=C2=A0=C2=A0 00:34.46
ipk=C2=A0=C2=A0=C2=A0 00:33.96
ipk=C2=A0=C2=A0=C2=A0 00:34.43
ipk=C2=A0=C2=A0=C2=A0 00:33.99
ipk=C2=A0=C2=A0=C2=A0 00:32.17
ipk=C2=A0=C2=A0=C2=A0 00:32.22
rpm=C2=A0=C2=A0=C2=A0 00:29.92
rpm=C2=A0=C2=A0=C2=A0 00:32.31
rpm=C2=A0=C2=A0=C2=A0 00:31.90
rpm=C2=A0=C2=A0=C2=A0 00:33.31
rpm=C2=A0=C2=A0=C2=A0 00:31.80

Based on those results, it seems like all the current PMs are similar in=20
terms of execution time. Are there major differences between my test=20
setup and yours? And do you already have a layer with APK available that=20
I could compare against on my hardware?

This is the crude script I used to automate the test runs:

```
#!/bin/bash
set -euxo pipefail

TIME=3D/usr/bin/time

recipe=3Dcore-image-minimal

# Options are:
#=C2=A0 - 'package_deb' for debian style deb files
#=C2=A0 - 'package_ipk' for ipk files are used by opkg (a debian style=20
embedded package manager)
#=C2=A0 - 'package_rpm' for rpm style packages
function set_pkg_man() {
 =C2=A0=C2=A0=C2=A0 pkg_man=3D${1}
 =C2=A0=C2=A0=C2=A0 sed -i "s/\(^PACKAGE_CLASSES ?=3D \)\"\(.*\)\"/\1\"$p=
kg_man\"/"=20
conf/local.conf
}

function rebuild_recipe() {
 =C2=A0=C2=A0=C2=A0 bitbake -c cleanall $recipe
 =C2=A0=C2=A0=C2=A0 bitbake $recipe
}

function test_recipe() {
 =C2=A0=C2=A0=C2=A0 local name=3D${1}
 =C2=A0=C2=A0=C2=A0 bitbake -c cleansstate $recipe
 =C2=A0=C2=A0=C2=A0 bitbake -c clean $recipe
 =C2=A0=C2=A0=C2=A0 $TIME bitbake -c do_rootfs -f $recipe 2>&1 | tee outs=
/out.$name
}

# rpm
set_pkg_man package_rpm
rebuild_recipe

test_recipe rpm.1
test_recipe rpm.2
test_recipe rpm.3
test_recipe rpm.4
test_recipe rpm.5


# ipk
set_pkg_man package_ipk
rebuild_recipe

test_recipe ipk.1
test_recipe ipk.2
test_recipe ipk.3
test_recipe ipk.4
test_recipe ipk.5

# deb
set_pkg_man package_deb
rebuild_recipe

test_recipe deb.1
test_recipe deb.2
test_recipe deb.3
test_recipe deb.4
test_recipe deb.5
```

Thanks,

--=20
Alex Stewart
Software Engineer - LabVIEW Real-Time OS
National Instruments

alex.stewart@ni.com
office: +1(512)683-8522

