Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.65])
 by mx.groups.io with SMTP id smtpd.web12.3030.1605582966297078983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 19:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lr/ePsbh;
 spf=pass (domain: windriver.com, ip: 40.107.244.65, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhRt377aQe4c8qL9KqVhS2SUPawssQRx1O3EnMfBhk4wlLgku2RaykT1dGxtiapRDueAdVBemtA8MOdsYUTSr+9wkpmclIgqq8wKduFySqoB08WH22invb1R/Tke3xaECHH/zfL3Y+CNEuCVrmgEfkaOpLfkmPRdfloSaPHz8r6xAHoNLhgYVlonDNb6DtCwL63p78gFXejBN8YDVf/MPC0OvdKzg4aF4Y2sRK8B1oCez2T+brGTs+5M39RuqSNyRGkOxTANdmY+Zhx3+k8GFFg1qZVv0bp0yicQ1fCAW5pk+y2eujiPNHRwAOhUDku7rGOqFdeul9nL2hU51eCxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHCH5Agwi4iictsKST8kF8qvjqvrKRwTuWWNkcxZa7M=;
 b=MvFYfXEYrEFNWUqf+Y2Vz39aynsLsibwFakaoJhfzInQYX3wEFvSbWXkNiY52AOgapk5XvttBApARNX2cNdDhXFsYMRzPSsxhh1iD6ZiwpsRg+lcAaVTDxmskwaR0Afke1JMzluL7hyb+FEcyKyi6k3tYG0niA5pKjXFzv0MfRrJhq9TGVstKXy/1n7xxfHuVGJb4qbSammZsxSXKo9Z/sDT8f0IKwzARmXRXbPNRiNw2o9FnbpsGa4Qr0imVorgjrPfFnmSHSuHChHN8TQBcsD/VgJtjww5eDWO6RrvHJflDNjCFgrttU9ueVpEluHVsEYXCHitvv6HJYsMGeyneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHCH5Agwi4iictsKST8kF8qvjqvrKRwTuWWNkcxZa7M=;
 b=lr/ePsbhRRckx1HqYRuWI9oW7PKeTRe5Ou83zoEKiUMAHhhu1d5vamlKYgEPZBYQMnJbz2okWuHqYrVm1HFMFdg8MkDbhxibc46ibJnz0z4rd75L9+ha0ByPWmsuUg38fDH0F7hXBGFpnxohbWAbceQ0+1XKoDDPpvjrDeEpjuo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 03:16:02 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 03:16:02 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: ross@burtonini.com
Subject: [PATCH 0/1] Fix multilib conflict of sudo
Date: Tue, 17 Nov 2020 11:13:39 +0800
Message-Id: <20201117031340.29809-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.12 via Frontend Transport; Tue, 17 Nov 2020 03:16:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cca4f35-ff4d-4a2a-71f9-08d88aa71cf0
X-MS-TrafficTypeDiagnostic: SA2PR11MB5019:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB501947297515FE9AF66720A695E20@SA2PR11MB5019.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2HgCxO1xoea0VYlgFGh2gJKAYY4mKSlxyxr0+aVSdOW4M+hqmowPeQfLKCX/hB+4mFdEj8AuXu0W99HaUYb17Idpv8+8DrLzGeRuz4ohFeUys/5G1z5631nMDGwSdlJ4TInVjuqbjRv5dfiP6IKv7BGkYnwF8LgvlV2OBXS8/QXJbX6li0o/HT4W6l8WSnIxyj5Y2vq68ShMm2RMVLMJyIpgRtc5mPLWyXufvVlWWumAec0kkHlbLU4CYqDjUKL+PW6veFQqZaBQT4bGk7I599nvgB+ycHcPI0lgaSUYel//O5exHuS9OkACx1OQWko2C0t2HT+bHaNurOK/JH8Lng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(2906002)(66556008)(16526019)(83380400001)(66946007)(86362001)(66476007)(26005)(186003)(6512007)(6486002)(52116002)(6506007)(9686003)(316002)(478600001)(2616005)(4744005)(956004)(6666004)(36756003)(6916009)(4326008)(5660300002)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/ITOz02AFbyOGkQn7hAzactTSYvW0+hhoMoqj/2vzBiuQ4Mnn/RypzhoG5GkSfWBRkotcplOK7yovBqSx3qN5BeeVqihE7KY99+4SXtEPMItELvXvmdGQKWReWtf1yb2Kk+DsNKFk6caOnOEdYq5LdeVeUq+beMl2lnBHbb/T4w51/fA7oTbT6b+bC60ZeZoEyaoDZju9/LSq+rFXosRZlW1+GPtq9nEJ30Ob2LAdRVmZRdRkwyTvf3gajVVWyGPj5kl5EsIdqwk5QWZKkxxyuYvnjOdSY0XIwtHNfoSwO06IkzrtmpsT0EYB09nNI+76AQqkcH7la1xXUz/KBVhoA98aU+c+Q36/zfbVmGGBid7SApKjBMoZGARrvU8Dry93W1fvxxh/oVKHtseDo2I7OVKM/iLq1bR8FqLnL92GYg/JOFsr54DIrQUEngKcpggMKD8JduN+fGvmYJExLH3CfMhBPILxGNFE+AU6Jv+OW1pK2CKO7E8HqwOzjebLoOSIZfh9bD9IQUUKi4G3STM68FlCtpxUPB1kl/zCD3QbQ+flsGBGpLck9wXNMPq36W9akks052YwUQ68sCei/ERKgkXgR1LAuTG9JgF76sIMsnc7Qhy0T26fkMhDGNf6Vw7dSj7hYUX+JGoFp3TZtfAqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cca4f35-ff4d-4a2a-71f9-08d88aa71cf0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 03:16:02.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi41GDI774Buc0Pr++eFr2exo54uTT5TN7uMrajwK0wQw9VHvfkvdNoHR8E85MIlP1vHlt6brjmru+DT8YlcEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Install plugin libraries to ${libdir} rather than ${libexecdir} to fix
multilib conflict.

Test with user foo. Run sudo successfully after add foo to sudoers.

Kai Kang (1):
  sudo: fix multilib conflict

 ...o.conf.in-fix-conflict-with-multilib.patch | 50 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.3p1.bb    |  6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch

-- 
2.17.1

