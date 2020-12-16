Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.2211.1608148895499926665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 12:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=YSdcXsrb;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=5619220c10=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BGJwC93032530;
	Wed, 16 Dec 2020 14:01:34 -0600
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0b-00010702.pphosted.com with ESMTP id 35cvjaq89x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Dec 2020 14:01:34 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKWua2zwpEvUn22Pfa3NNfvCHXFqJ2FEdvJ1bXkcAsj6H0MaFzEcDjs31e1QvMKeW5U9LAletetjuhMGVZmd0y1mCWX5PTe4nB7xG4F6TlercgySVM4GXq1LK83/G3zpEZ3TJXQvNp2SXnPjCRpgCh7N9+0othHaxbY122CESgVqnGAwaF3StJf56vZty4ydzBt60YpHfKpdCvuxEyiYemtWeBjVqbElKsOAZuqxTVqG+8T4lSAW4Swh04WPsEPh9gPezM/uW1DgtcYh37gymiw5mVmEAd3tDnN6a2m0CZSYBZuhTIC/nVCU2+LkGC5niqc+BbIC7Fw/VhNyjYSbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ZYa2viv2rA6JbeLPmKO3ldiwBPYFDnQTDK27ZYThg=;
 b=A0PVb+R974bVlB8cSmNBVCAvJSOi4w2p/z2uh05XdxSxtdfPzjmFU433Q/CGwC03C4xBGwYh9z5hQWJ0hkm47f8jAqsmLbl0idgqOVlwUq0yaW0zL7JoUrT0EuB0FrDMpCkaDtCfonccWfWL3zb3Djy+e5ROOgTN7nhscMNe8QxiBmoLs0+Zf3Ic5uI6oWsgKlRsyQDAcCS6157gc1G1iLPx3A/SClUpygRP2N1SFDM3CgxNEmxPqPiEsrh9PZgwRYOPAKn4dDBdvFauPx8WDMJiO7bbKAkYYFZ7RH99fOdDhBz0JQaY0oyst4EZy8RNg0f/tOImlu9FmFST81ufEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ZYa2viv2rA6JbeLPmKO3ldiwBPYFDnQTDK27ZYThg=;
 b=YSdcXsrbsYImg4wxg9jBOhnmSreuRJ+wKhVEZK3Odjzav4LQMG8VRrUay0u1lfuAxOO9TkDw5TkR5MN7odexHM1406cROjUbTN8AD83RlVujvJy6aA/PwTEgwRHmItCgmNN+DAYJMUSSyW+bkbseZ6v8gdm5QEMlBSMoNho6uUo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM6PR04MB6954.namprd04.prod.outlook.com (2603:10b6:5:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 20:01:32 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db%6]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 20:01:32 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: alejandro.delcastillo@ni.com, alex.kanavin@gmail.com,
        Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH v2 0/1] opkg: upgrade to 0.4.4
Date: Wed, 16 Dec 2020 14:00:55 -0600
Message-Id: <20201216200056.2897070-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [130.164.62.147]
X-ClientProxiedBy: DM3PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:0:52::23) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (130.164.62.147) by DM3PR08CA0013.namprd08.prod.outlook.com (2603:10b6:0:52::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 20:01:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9601b311-06e5-439e-4bed-08d8a1fd62b6
X-MS-TrafficTypeDiagnostic: DM6PR04MB6954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB695404F189239D0FA8D01EE3FEC50@DM6PR04MB6954.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nK+XfYor2Wr9+mYWrfR34zJFGYkXTueppn4sHkplKxuRZzQLfrd741y+g372LCwSAv8zhS5vz36MiWWL0e849286smCS5/chb0Hq9s6sTGcEGV52XVjIvYjnTbjimeF2OHtWh+ii0ZLd8tsb50TESdRoB2ITcOmMUXr1oREJNsrdOjKn3zuoDEGH9gIi0eZxHQnW4/yWl0tEoWyXSDGCpv3wO4oTeKB4neJWH4QVd3V6J4ZtaXDAcIeVCMmgqlbxg/pSI82rVEpHSoop6n8T0b6oFRshQsf8nG323vYg/yJPAi7a9k3XpxGUv+OuW2VobEudLYr2ekbP28Egk+ka9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(376002)(366004)(346002)(4744005)(6512007)(6486002)(44832011)(8676002)(36756003)(2906002)(86362001)(186003)(5660300002)(6506007)(66946007)(83380400001)(52116002)(16526019)(66556008)(2616005)(1076003)(956004)(6666004)(26005)(4326008)(8936002)(6916009)(66476007)(316002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2Xv+vu/GNmJDM1njY0M0S0LPMY7c1n94F920tlbeYb4jujnSxVwW3Qif3kqY?=
 =?us-ascii?Q?RbnfO+4ScWBTEa/t2GulmDUVEPMoK9DYDYHbY41ae+IeA0wq0DEIdltNzsr/?=
 =?us-ascii?Q?QOfT3l+PmwBmIOk6XxLaSTksEfVu1rYLCWVjTMvaSwFlzJ2u3rDRSvKweNmI?=
 =?us-ascii?Q?iIi1dQCMFQlUyrhjpOv243JocWF1MoIsHTmQM0fefnZLY18UX0sKkpwvYZY+?=
 =?us-ascii?Q?tsey6JFyYZxNfXdwOKWBU5AFFolCMwHqXyK5YvHiDLE89ot+bHSWZHkyyrWp?=
 =?us-ascii?Q?u7RwAokkbzcOGX4p8Rwjj3HVPJdUPekwRyguxQDWoN8No8sVjFyXthtGzW2t?=
 =?us-ascii?Q?0Rjemqs0VHzgkbqxACVk1hLZ3Wcq16wie+qG/MURDfRIN6GN0kY5u2Wp6WJK?=
 =?us-ascii?Q?XWUYvlIkrBvDyAd4v2Mvb4VlxzMXnrlt5vAK6Opa6YLl0FdP3sZUJDWowcD9?=
 =?us-ascii?Q?Aj2gyi97Gv8Md8fGPPq8ogdKsWDWVZpz2V4Bm8jwiZEOVIuxVR04V1PHu+90?=
 =?us-ascii?Q?vAyrsYtYMblHSuMmJSwMcZg4oOcAlzQEMYXF7w2tYnRiTEiRw6NOGVB0YOXX?=
 =?us-ascii?Q?A5HGAL3NGMZf3k3rw3c1/fFmzRHGPuIQhZJUnC0FuLVQ8X+twKsAHvl5lS9W?=
 =?us-ascii?Q?mDF67SiV45QUfcjnEukTXikCok7KJ9aP1T/tT2lzS4OLKm45YWD2yXQ/9CAa?=
 =?us-ascii?Q?d2o/VD4iEuB4gWx+LbNVy9bQPvGCcvAM97JJ6ErC+IspkHGfLBx3OCJ9vmdf?=
 =?us-ascii?Q?D4eNpNtbL7ZCj4VoSIMc1Zy6L05vtRZX8VBK+hwD44kc5FRq3pYmVrMEcuYR?=
 =?us-ascii?Q?OSfZE/xXBP+p2TF7I/6+CvdPnn2ZZHSkJ3BOYGTGH7NC5Qn2+sAJPFZuS+ld?=
 =?us-ascii?Q?WNASRKQrd9jZSj0Y41P1X7K3chSOOIBXSWmOC4O5+8fPEdHwrWP80Kqocp9S?=
 =?us-ascii?Q?/veBcNj5PvWU2udDgIxu6bEzYcD9+sWFASBY6CCqR5WLzwoTVxVEXYy46N8c?=
 =?us-ascii?Q?uAqY?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 20:01:32.6827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-Network-Message-Id: 9601b311-06e5-439e-4bed-08d8a1fd62b6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vHFN1poeyXZAD0eVYnbj6Nk5MiypgUtLLtYq8iUhwFjdLas9u3woouTtVQwWNCmVA6r+MPgMOXBC95vb+lDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6954
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-16_08:2020-12-15,2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=826 adultscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160123
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adopting Alejandro del Castillo's original upgrade patch.

Patch V2:
* Added a .patch from the 0.4.4 upstream which should resolve the ptest
  framework error which Alex Kanavin observed in his OE-core tests. I've
  verified this change on a local build of the OE-core minimal QEMU image.

Alex Stewart (1):
  opkg: upgrade to version 0.4.4

 ...e-OS-negotiate-relative-package-dirs.patch | 43 +++++++++++++++++++
 .../opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb}     |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} (92%)

-- 
2.29.1

