Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.1428.1590772523344356374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 10:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=IhmuzNao;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=94187357b5=rich.tollerton@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04THEwAA031003
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 12:15:23 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-00010702.pphosted.com with ESMTP id 316yv2hxw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 12:15:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCJfHLJZVBcRbYbnsjGFDZb/4JIs13xV98v8vHi0LmU/JDQBRF418kH1JA49gIYrNhenTxEf9d/ls+fyNtVhMwUnj26U+TroQPtvjwOK6tw57UUzNY3g/JHbNeQbHa4ptuj65SyOfm8cjcnNlvh82U1Vo3w796tLfUzzp0dig6qVm2ipcGiSy8o43WYOXjawXfn7Ud4KOFmtoWKxNGA4bx9McP3AhAR3G+R6Wf8Vmu9pV31Vem6V3Rg5NfrAm9hYxCrrPGbWBqpo86NlUicVsCcXnS7672XH5rPdiWBD4YYEQ+SI+jdXnDFPgY8P3YQXXB49rtAs+qCMzegILnBFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixw6Y/j3VmCrc17YpChx8goZykqPZMe1kXIUzXZ+azA=;
 b=UVPOZi3189ouksCtDSvoFatNWnmJneGMgtICSJdw21MZTnZEQW4tO92/XgWn0uf4HNmUQzzhH8Fdvvtt/l3FYHjocFl4Kv3kCP5pjFz1gKepEA9WMw7+Haf2w+XYR1NGQG9wxEGx6HqIHm8cQOgN3tPG2A7w8FRS5YFqE4NnWxYfjsybkh+Qy6BZAoaYYMbXt8DWqMKq2BScgc8ng51A78BiOE0oPIssRVE2kVRxaBVb5vTcjtq3mL6fH8EKkIn3GTxJfo9aVbUxEg/ihxOb+ZChxRuex0pGPnNeTNHCtBnZrx3H4aJtutJiCYGXQGZDJJAaOQaMD3rtSdyQhqtEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixw6Y/j3VmCrc17YpChx8goZykqPZMe1kXIUzXZ+azA=;
 b=IhmuzNao3MYLVcS6DzN6BgdY3yf1UU9yltuZ+drH+/KGA/6XeY2OgTcn6ZcFme/TtwVxB6a4kiUUE4+43/OMiUSq0NYxaxZd2yABQp4IZvxO2WnFN0vzMKYNxs/vXNA+eVCjJtDHFa3SiUB68qdVq2t+NOAXrKYa5Nv2lKPDVJA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from DM6PR04MB7049.namprd04.prod.outlook.com (2603:10b6:5:24e::18)
 by DM6PR04MB3867.namprd04.prod.outlook.com (2603:10b6:5:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Fri, 29 May
 2020 17:15:21 +0000
Received: from DM6PR04MB7049.namprd04.prod.outlook.com
 ([fe80::ccdd:648f:b03:9f1b]) by DM6PR04MB7049.namprd04.prod.outlook.com
 ([fe80::ccdd:648f:b03:9f1b%4]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 17:15:21 +0000
From: rich.tollerton@ni.com
To: openembedded-core@lists.openembedded.org
Subject: External sysroots?
Date: Fri, 29 May 2020 12:15:19 -0500
Message-ID: <wxiro4zh9q64t4.fsf@reflektor.ni.corp.natinst.com>
X-ClientProxiedBy: SA9PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:806:20::31) To DM6PR04MB7049.namprd04.prod.outlook.com
 (2603:10b6:5:24e::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from reflektor.ni.corp.natinst.com (130.164.62.60) by SA9PR03CA0026.namprd03.prod.outlook.com (2603:10b6:806:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Fri, 29 May 2020 17:15:21 +0000
X-Originating-IP: [130.164.62.60]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e6c2e3-48f0-4f37-d372-08d803f3de3a
X-MS-TrafficTypeDiagnostic: DM6PR04MB3867:
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB3867AA380B877AF13AAFC547F58F0@DM6PR04MB3867.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nMkTUeMLR4lJhuGBooHkUGdMmEq/Ze/rBxXXQLuS4IYXdT+328hTbNQUKGOUTrqm6PbKlu1CQ+QBrTu+T7opTOUV48voS4y1eZZif+RulY8cn2OmKMxiTTOeldkpBHtE6VW5vYvfmVLcXXg2nfjvTlclpa1Cn8vkyvq8nHbxgb/x6Anh+PJwmfXkuc9HR+DLioYNN9TopDSbIevkFd3r94mcUn8KCVMz6Sqn8paY4M/Vsy36uqS1ABPg7CrQSi78j+PIDG93i0Lg909K4NzYFPxlUJHoAwMzSmyFVJCl3fuvYH60X2BWFQNb+JBAq1bJU58JaDFuHe41FCJShZkKjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB7049.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(66476007)(66946007)(66556008)(3480700007)(4744005)(5660300002)(16526019)(186003)(26005)(478600001)(2906002)(7696005)(316002)(52116002)(8936002)(55016002)(6916009)(8676002)(956004)(9686003)(7116003)(6506007)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	/YDnkUPDMLff2LMvZZDAiBUQfL0yHBRyIDS6NnXa0hRL6DqTha3PFLVh3s/gi1zQ8+tXNa/DZ0j6dJAppehsjPgPmZthGUZiZkq2hbiUSju6tqo88vK5d/PkeFIiU6BQ4z4ZvrF84XvFhckBa4h0GGudzH3JF9zgkb5qXdeacRKZ3kgRdmOAe8JWVwaOAgr75khahWFqgn3Jz8M/R4+jqHto/EdNqRDYDnBqP/P5QDLRoNFFaG26bnC72PAV8qieIMroPr1SEKhgaETih/cw3eeNtCiyj+GUF3gS6/LUSjhiFpIGiKUF3Ei498P7wQAmmy295owe8CwsndC0A//o84U48fqS0VxAXRGHfF5LaFFiaRp6RV7hWXe7CfnQP1n25Q5w9lfpot+87qjN9EU4rWXXVDOJPgjES5+QHG/Y7ULohVkXntz2mXUo5DdD5GInm1hQLX1xU6hGh5SLi9dyg7AiXHBnku4e04VXiPqivMQ=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e6c2e3-48f0-4f37-d372-08d803f3de3a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 17:15:21.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcxAYakSnMO4+ru9VXTtjXtx58m/8/6pyBfhkzH3LQxeJKxw486zjnFP8XW6njWhgo52ME8lpSXgQu8H8p9ePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-05-29_09:2020-05-28,2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy score=30
 cotscore=-2147483648 clxscore=1015 suspectscore=3 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=485
 impostorscore=0 mlxscore=0 priorityscore=1501 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290131
Content-Type: text/plain

Suppose that I want to cut a meta-toolchain build against a sysroot
sourced from a different Linux distribution. (Obviously I would be
responsible for ensuring that all required package dependencies exist in
the sysroot.) In other words... like an external toolchain, but
inverted. The purpose being to apply OE's toolchain infrastructure to
other distros.

In principle, could this be effected by e.g. liberal use of
ASSUME_PROVIDED and by populating the target sysroot by hand? Or is
there another way to do this in principle? Has anybody ever tried
something like this before?
