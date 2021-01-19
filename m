Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.45])
 by mx.groups.io with SMTP id smtpd.web08.9280.1611048234720859363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 01:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lWw2yOme;
 spf=pass (domain: windriver.com, ip: 40.107.94.45, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcUfPqwHcHvrukS9BXm24q4uJyW2wGEyEeGHCeDnscKJ2+iCDpPiONRu6BufPLpc0KbQ4l8I+bnzx5JIKR8Y25vObisUoGfndumWit4GXKuZ4ajk5D/4EhHfYum5nL5fzq0D9dK2jsI9ZyfkAVMCA1z7eLwbVMoSIJV2Cmq3B92hogMvo3UndHx5s2+2EO17v3sh1713YpabREo0dEChV5lhc+k/9ah0bJkL2LlljRsIHlXgcQPmsHA5nc/3VDDyu8gusz9JuheADKR9UxYX13uBWR4t1UuEQfg0q37aW9Jnm5XedJq/u6hlWSUcGtLiqUa7KfNNBsS45qT5gCtu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkL8o/AlAMGu+HhQ6GqGlGBn7b9bnyqXhu23PAfGFHc=;
 b=nu8i1R5kO9kyMvMCz+iulW1AyD/FpSTSBR9xKjTWRXFgjouSm9X1vX4gb34a8xEDHIDaeWBJvy6SQb7TWWwue2AgD0Xq6hACWsPYkSPK3VfgdqWWCvRrK2wngqavCOB0m6G1JPff22s4RuDOX5dpBbSXAOahvJuveCKBmHHBdxlclXecsrSpRSBmJxfJj+2xVZxwewbNIgm0XdwPpfsr0tlTyqyH9LbBZTXDghzYys5IP6yexQQWNYFxplu+UElbbiqiiNpLVchPYNzwRdpQWPgrqHqYzIJZGwp5VjApiO9krnSLp16APgSovj6QMvoA79e+bQG9OYVJLwwAL2ebfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkL8o/AlAMGu+HhQ6GqGlGBn7b9bnyqXhu23PAfGFHc=;
 b=lWw2yOme8ucWe+2Ed96vlYKUO3QWH5nR0e8RN+yoVX5qjHxw7DT50UTKx93FRqDH5190cUUUYYti3j5hzseRrPV1UnfjxX61MrhRVSW/1XeO+X1wcCnLfCzf8zQO9NpgX4d2HY8khu109Sg6cfvQbQoIjybsnidAowsG46+ETsY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Tue, 19 Jan
 2021 09:23:52 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Tue, 19 Jan 2021
 09:23:52 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] ccahe: ccache.bbclass: Use ccache-native and disable ccache for native recipes
Date: Tue, 19 Jan 2021 01:23:42 -0800
Message-Id: <cover.1611048144.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 09:23:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b8bd773-e258-44d9-4f28-08d8bc5befb6
X-MS-TrafficTypeDiagnostic: SA0PR11MB4541:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45410EC44C5B474D6D03F832FFA30@SA0PR11MB4541.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	np79guqPkOz49TGLAIY8fRJFLpLDRdGAr+2gY+PH+42rr9EQCCjwwVOY5IOD55bu2/dNGeAAJGimsZ9QwVRAw7u0Be0XUfIyVBTa+7eH7YWDRJVRGD3kAgPXtPvm10MKIDGi0a6RFtAH7Wi37zno5g+nag3iCaKY6lSUuWMNV7JcBAxBKbnpH7GXps3jfIoAiChJTYFD0CQpjlKy7gEFpq6/bLnY5F8snUUpJM9LaIbHX3+t2etYIUOzatf28xwYE4/qeFopL01sjIL3G4+Z16FwtGzR9LeVQLmZzMk2vZuvcnXeKUXYesQzNy8Y0HKUos8MzzMcqiN7b5H7cPL+Mq8sqgTfDBnGUyE+W0wO0WG50SbqnyB9u1hsSlHy4V5X57NDJ54rXsZK9hG+hmc1y5Zo95iu7zjD0okLKli6HC+KAtK7nXKF/0jtARHvm/fAyqjXzr+uP+RC0ExugSBdow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(6916009)(6666004)(86362001)(66946007)(66476007)(4744005)(2616005)(956004)(6486002)(6506007)(66556008)(83380400001)(26005)(52116002)(186003)(5660300002)(478600001)(316002)(16526019)(8676002)(966005)(2906002)(36756003)(8936002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?UIneR2lEm2tAzSHq64Bq0MX+UTK9lBEgtHtpbIfVF1LSJ8yhRRqULA+5/aIB?=
 =?us-ascii?Q?VS/OJgiygSrzfiWCMZn/NG6T4nVqrU7XDT+Px5CUMGcd2i0hzYfPG9Gjdx8l?=
 =?us-ascii?Q?TiEaDvBQcQlqqMfiuSo+A4PxyWXJLS5rmLrH+Jp47ixCXgrrdrwvQ38iv6YJ?=
 =?us-ascii?Q?vslDguOE5neI6wuUEdrYu9akkXflhJ/jRfDGMBVe1m4jqFRynFeoLaoAubNx?=
 =?us-ascii?Q?YQ7gQLPBuKNDbAL9UoGz43kenbv6jpfnH5z6XGvR6l0L9eyNrBX+O6TPKhEe?=
 =?us-ascii?Q?wDidi+aw8y4G4E7HqafbozpMcj47e11/JbYELrELdqFzchzVCp+5u804EHIe?=
 =?us-ascii?Q?IVZ73489lQQfqtGL3BDvv2kjYV/8Da63HOkUnGB7T487uSjKiBD9HPjIi8jC?=
 =?us-ascii?Q?9sbO43kePF6wJnharUIU6E7r20/lhF5aJBOwc6p9yWlZJACJBSN8zZfRXsaO?=
 =?us-ascii?Q?ltEUGO4+8Si6NdRbZ1ByNECaNVQRlThiBSKxFGQYanNdQ0oYbmIlRTLycQRh?=
 =?us-ascii?Q?oLnKjpBE4d66aJIP1SGdbUPxW1D3ZDz99qeDao9vh67O1yALqWkgat6ZNu5+?=
 =?us-ascii?Q?RXN2uqpSiETXA6Pxlag0txHtnhcXf+vyXIoA5nTLL1ypVDkKegD4aNBwYrJX?=
 =?us-ascii?Q?zbGY6Kt8GQrVLYOyxbKVv1COvO1P0k7JlpaSlyF+Gn0gJJ6C8gigJvC5ModG?=
 =?us-ascii?Q?bBCgEYiHWeiUR6hjaQrYWfAKP6iIPm77/gXWSL4CxmHHROQvHYClItmvMAKV?=
 =?us-ascii?Q?JRnUPoN6DEy0glHLE2dTztX+vvN6SQxnINL6I+Wrv1UxYo9CdEMDl27NeV9T?=
 =?us-ascii?Q?4SNiHI5Y+q60U6O8QiR1C2zuxIGus1QCnH0uKaRSP6Y+0WlEfssWvDUOo3zh?=
 =?us-ascii?Q?VNIWUiXaxIceLLVK4STGcv7o1H+z+BbYIrwKYqSZc8tIsoo+dVHyx6xvgax2?=
 =?us-ascii?Q?3YDgSq+ZuOQxUcqWPePwycHkj4aVidGtZNPpL4rz6ecw5JAIZF8egSIXZKF9?=
 =?us-ascii?Q?KcLL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8bd773-e258-44d9-4f28-08d8bc5befb6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:23:52.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns3DWd3GLjQK4IXua+qpRDWxaMRAw7fKb4tBtmYpgV/94TAKZDfp3lP9NzfIjoIlKjrAKQeUSDkXc6fmMYS2yrjQLjo7lsGY1Y6+aFmlIYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
Content-Type: text/plain

The following changes since commit 5f3cace37496fe1dc4fd045f688f7d441505c437:

  boost: drop arm-intrinsics.patch (2021-01-17 11:27:59 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ccache
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache

Robert Yang (3):
  Revert "ccache.bbclass: use ccache from host distribution"
  ccache.bbclass: Use ccache-native and disable ccache for native
    recipes
  apt: Fix do_compile error when enable ccache

 meta/classes/ccache.bbclass                  |  5 ++---
 meta/conf/bitbake.conf                       |  2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py | 19 ++++++++++---------
 meta/recipes-devtools/apt/apt_1.8.2.1.bb     |  6 +++++-
 4 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.17.1

