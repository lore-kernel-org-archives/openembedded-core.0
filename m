Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.51])
 by mx.groups.io with SMTP id smtpd.web10.6579.1615284063560873461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 02:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=PeFjVoxv;
 spf=pass (domain: kpit.com, ip: 40.107.139.51, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=av4sP3I0I+fGwY19DcmsksXdRuNm+QNaQ8r5ubAXsJrwGbGjlcFEjcVaL39dFZjc664iGhpDtXA5Ym/jyw8IukU9Zmy9PtwByHmagdlRa2Wl1df/SBXnMHOEzPmJ/9NrTEygazr+tG96t0biVCthm8XM0oOLc/idWE18XFep/sBq9b1ai0rxKGw7OV4lBv4LsIexb31EtJIXoAUYIhP7eKRhqvGnGK7apkiVWHwfIJxrSHIcyKp3pjSa91nT2M21WkUmHESBm+jtc34vXydlAwjP+jZApdQun4E9CHoR7XaDdtkQRPSs1q5ydPx9iZBlp8HsDHWgEeyaAyqFrSOMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dngZnIzGMOHg7AzjnVPGAWRnVttVhdRxyeCXUvI9k0M=;
 b=UbU2TsMnXT79fj+XFE92s0UrYyb/J+Fd0k3pByFdFDf/troY2x5l5XZv2fZ3sG6tEPPDn2NrYXS1lvyKvT5a7AERIiAojfL2k/2aGrpsT+EWArLu5uQGhfOtDCqgIbkOXV5AgAUVN9raye8YC8wJM7RuFyBVh4HGlViAS5YyjHYLVpTuwNU7QWZ80c0D7InZIus7XxfnYxZuVJKmY+9KJd6+EodJJC5F824qtj4dEvB4yk/KVpGcacw46JUMP8wF6zQCwDNvm6+8C1ntiMwLtr1dHmf5cl5AQetiikoLgSGVYaYs1T/Jbu+lwb5g6wkro3+3TZaniln6hSq7NVc7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dngZnIzGMOHg7AzjnVPGAWRnVttVhdRxyeCXUvI9k0M=;
 b=PeFjVoxvtUc4Yt7g/2MlRZsF7nHyLqgfPkXv2peuTOYN2/1oTKMVLoeWoizjjv7hkAeTjwm74xiWFU2q5IfdkcoLMHf+cE7XpzKmgkAOgE3OMXDjwSCQcp54z21uRgTFwtnqw0cBRPP2rLm76CN26Y9oYiPRjKEVFiXCGL1wOOk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR0101MB1570.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Tue, 9 Mar
 2021 10:00:57 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5120:b913:587f:c87%3]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 10:00:56 +0000
From: Neetika.Singh@kpit.com
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][sumo][PATCH] opencv: Security fixes
Date: Tue,  9 Mar 2021 15:30:47 +0530
Message-Id: <1615284047-16706-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [183.83.47.23]
X-ClientProxiedBy: BMXPR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::15) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (183.83.47.23) by BMXPR01CA0005.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 10:00:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f31e8ed8-244f-4c44-f920-08d8e2e23b9b
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1570:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB1570174D9942DF0D3AE089749F929@BM1PR0101MB1570.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:181;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zYJppH+WU/FQ5Il37UbpkE7+QJLvGgAQx22SBtCeGPpvRwv5RfZh5G8l/U0bXoSula25Jzj/hpRD/uum63UZfOL8aDjfn1LN1GPWWMbqwgXticzQRxsGazQr0lB77tNljPyTAwQko7DhtDwUzwZWMBNiLBlQC+3DoltIsK5RcfUsRbqTMNtgx8tscQxc204uF3kbgZUB990WCXKTpfPQVjbuYaR6uqxQVxKRZfAg28C9gui633T1xAGPYEop4mJ1Ri+d7LW+Kj5XuCwmQw1aT97W8CYT8I9M/oubf16BoG+WAAkSKd82UGLEFg7W2oVMaYHwIimwkAci1/BcbowmJwxeKfjeoL6p32oZxiOr80jMGemZ05y5jjVH1NkKEenSloYh9FH0BpjiGj8LauMak4SEJpbTOx4XGF6rXFmDbYzCwrF6a86SuqApZEQgWmseWBrA6rCtwaSbysiaj363rIbCU1Y0bMV5cHyuVU1tA9ZDTwGy/LQKFCm/3u7Q0rAywQFI8EMpaeZxv6xIfH8Q8SateP/EdioS/y8h7DXiTccgeoyuYG0MOz3bAN2C/R3f1tndlGWA+dsMzpay9Izy7N3hru8UzYbmpBtBUDc1QP47T+Knv34EpqIuYBBZAOJ7p1+vUPxzX1leavbCzCwhtR3H31gRdvKw2roKodR6IoA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39850400004)(376002)(4326008)(6486002)(8936002)(69590400012)(86362001)(316002)(36756003)(66556008)(107886003)(966005)(66574015)(66946007)(66476007)(186003)(6512007)(6666004)(16526019)(478600001)(83380400001)(26005)(6506007)(15650500001)(5660300002)(8676002)(956004)(52116002)(30864003)(2616005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LKU+0eE9w7tIkb3hqmP9vB7rk/5FeSS3z7HJk2mBouJPEv/ZouZijsFr21ZX?=
 =?us-ascii?Q?37ATVDSiKKSxaxsoUH2OnJN5HPIm2xSxVtN2GNSfZiZZrTpOkmb+vd+lQ2Vb?=
 =?us-ascii?Q?b0K5WfzNkO7yAsxCEviQtmPjErkbwYEiQ+11mAcVoxerepeIj8MzFLMQNzFx?=
 =?us-ascii?Q?WmWh6eMldBnGeB2sGlg9qkNhGj4Z0P5HIYt6mbWayddHOg2XAKcJWr1XumgZ?=
 =?us-ascii?Q?WQobxp92T4Y+pCoBs7vm9gIWT8t+d5kSC3VR9UbRFK5H82fyGm3mKo0B79kd?=
 =?us-ascii?Q?UzZOALe7CVVHLbFVDw4irG7av8aJ3CiY0CQAIMNReh0MxI0ztJ76hqcomvmW?=
 =?us-ascii?Q?jx3c3gZygnDCihaS475JTJAC/KKEXt33aRkRF0zf57WiGJuucYZyR8Tw7P9G?=
 =?us-ascii?Q?KvK3MYK+QR6AAtCUH/Vp6BCFLqQlTntjNwORIH6EEJbEFWi6wZCzaknsYfqU?=
 =?us-ascii?Q?U3UxKm5BCs4QLKaKnyjhRO8K2erYhP2YjC+R5jIgTA68TRr/CvLpuTLAxrgt?=
 =?us-ascii?Q?NIj/1q5HtD3z+I+8FTN/mWcYyAJbznhLcSHwPSDMeb8WN2jXwcqQIvaFJrIC?=
 =?us-ascii?Q?I480I+OCPPS1It8p1RyMJCV7M+vZ6vmjm7VhqaZqpQLsZntVs+8FSFU5Y3hY?=
 =?us-ascii?Q?HLhJg3bjqq/EjAnUYMPuAF8DgA0ggp6NDMsVN/3w4LcWRWqVKTp2+MySLVfi?=
 =?us-ascii?Q?jIpzN/gffLALXTqMBKOaqGz6cBcm7hLclEg6Gl7k/c2yatJrPSnDDImInHhm?=
 =?us-ascii?Q?dfNJJSYmkFZRpW0mA1NrQhKGXrJrGwDMv3FMH7D4VbiNRklA8rIKhTDhmjxv?=
 =?us-ascii?Q?tbYl4dR2dsG0Dsa7q8SC+jfM6N3vFht7y50zJ34IzNstkf8E6gD0Wqo0LeRf?=
 =?us-ascii?Q?l/7oFlhVY1vQLECq6dI1r0rxWP0VN3kIodmMHgP/mviofy+KoPCNJtGxqbqE?=
 =?us-ascii?Q?U0zkCLQdncASoK2QUMiI/eL2Mz/+POLH+aUCU0KjRodav7XiGa7kJ+bMeym9?=
 =?us-ascii?Q?mJ2ZcYqdo00gWogc9hvBeMwsa7nTYjIUMqQzoa4/ue7Ru+pzj1qz+axRFnGt?=
 =?us-ascii?Q?0KOizdgCcSUnoy6vJt1NrGoOWFkmZ1yaIQAcA8EcScBnr3zHlvEad9Pyy2W1?=
 =?us-ascii?Q?X3voKZPrpTSCGzaOO9l9F0l0n0wUw4QkHbGpVnsYE2HAKnn6DuBFzhCzfz33?=
 =?us-ascii?Q?3TSnSddFfwm9bFAPIFMQC+6UKXcGBVS2b43JaSXEjfmsh8Liu/EAtaL5onvF?=
 =?us-ascii?Q?L/PTaB8LkGABErCEtRdRw+JtL8Z/5MHMZgW1MaGSlsiWBmM5/GDWnIGPuZC9?=
 =?us-ascii?Q?R75wqjYUvDGQtn19HkXokODY?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31e8ed8-244f-4c44-f920-08d8e2e23b9b
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:00:56.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndyHPDsthPMgr9aCAi/kvmozr20CfHOiJ9PHhZSH8aceKzavJGapklZ1xFsNmvqJwijkBT3ySZGmtyOr6rBJGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1570
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Neetika Singh <Neetika.Singh@kpit.com>

Added patches to fix below CVE's:

1. CVE-2019-14491, CVE-2019-14492
Link: https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918=
d8d57c067ed

2. CVE-2019-14493
Link: https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2=
dceb3a59023

3. CVE-2019-15939
Link: https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1=
c76c0e47d29

4. CVE-2019-19624
Link: https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f63=
8d1572d3418

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 .../opencv/opencv/CVE-2019-14491.patch             | 148 +++++++++++++
 .../opencv/opencv/CVE-2019-14493.patch             | 237 +++++++++++++++++=
++++
 .../opencv/opencv/CVE-2019-15939.patch             |  73 +++++++
 .../opencv/opencv/CVE-2019-19624.patch             | 157 ++++++++++++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |   4 +
 5 files changed, 619 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.pa=
tch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.pa=
tch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
new file mode 100644
index 0000000..b82bea5
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
@@ -0,0 +1,148 @@
+From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 25 Jul 2019 17:15:59 +0300
+Subject: [PATCH] objdetect: validate feature rectangle on reading
+
+CVE: CVE-2019-14491
+CVE: CVE-2019-14492
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/ac425f6=
7e4c1d0da9afb9203f0918d8d57c067ed.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----
+ modules/objdetect/src/cascadedetect.hpp |  6 ++--
+ 2 files changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/s=
rc/cascadedetect.cpp
+index 4b2078306fe..bd62cd21a1b 100644
+--- a/modules/objdetect/src/cascadedetect.cpp
++++ b/modules/objdetect/src/cascadedetect.cpp
+@@ -47,6 +47,10 @@
+ #include "opencv2/objdetect/objdetect_c.h"
+ #include "opencl_kernels_objdetect.hpp"
+
++#if defined(_MSC_VER)
++#  pragma warning(disable:4458)  // declaration of 'origWinSize' hides cl=
ass member
++#endif
++
+ namespace cv
+ {
+
+@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, co=
nst std::vector<float>& _s
+
+ //----------------------------------------------  HaarEvaluator ---------=
------------------------------
+
+-bool HaarEvaluator::Feature :: read( const FileNode& node )
++bool HaarEvaluator::Feature::read(const FileNode& node, const Size& origW=
inSize)
+ {
+     FileNode rnode =3D node[CC_RECTS];
+     FileNodeIterator it =3D rnode.begin(), it_end =3D rnode.end();
+@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode&=
 node )
+         rect[ri].weight =3D 0.f;
+     }
+
++    const int W =3D origWinSize.width;
++    const int H =3D origWinSize.height;
++
+     for(ri =3D 0; it !=3D it_end; ++it, ri++)
+     {
+         FileNodeIterator it2 =3D (*it).begin();
+-        it2 >> rect[ri].r.x >> rect[ri].r.y >>
+-            rect[ri].r.width >> rect[ri].r.height >> rect[ri].weight;
++        Feature::RectWeigth& rw =3D rect[ri];
++        it2 >> rw.r.x >> rw.r.y >> rw.r.width >> rw.r.height >> rw.weight=
;
++        // input validation
++        {
++            CV_CheckGE(rw.r.x, 0, "Invalid HAAR feature");
++            CV_CheckGE(rw.r.y, 0, "Invalid HAAR feature");
++            CV_CheckLT(rw.r.x, W, "Invalid HAAR feature");  // necessary =
for overflow checks
++            CV_CheckLT(rw.r.y, H, "Invalid HAAR feature");  // necessary =
for overflow checks
++            CV_CheckLE(rw.r.x + rw.r.width, W, "Invalid HAAR feature");
++            CV_CheckLE(rw.r.y + rw.r.height, H, "Invalid HAAR feature");
++        }
+     }
+
+     tilted =3D (int)node[CC_TILTED] !=3D 0;
+@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode& node, Size _o=
rigWinSize)
+
+     for(i =3D 0; i < n; i++, ++it)
+     {
+-        if(!ff[i].read(*it))
++        if(!ff[i].read(*it, _origWinSize))
+             return false;
+         if( ff[i].tilted )
+             hasTiltedFeatures =3D true;
+@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const
+ }
+
+ //----------------------------------------------  LBPEvaluator ----------=
---------------------------
+-bool LBPEvaluator::Feature :: read(const FileNode& node )
++bool LBPEvaluator::Feature::read(const FileNode& node, const Size& origWi=
nSize)
+ {
+     FileNode rnode =3D node[CC_RECT];
+     FileNodeIterator it =3D rnode.begin();
+     it >> rect.x >> rect.y >> rect.width >> rect.height;
++
++    const int W =3D origWinSize.width;
++    const int H =3D origWinSize.height;
++    // input validation
++    {
++        CV_CheckGE(rect.x, 0, "Invalid LBP feature");
++        CV_CheckGE(rect.y, 0, "Invalid LBP feature");
++        CV_CheckLT(rect.x, W, "Invalid LBP feature");
++        CV_CheckLT(rect.y, H, "Invalid LBP feature");
++        CV_CheckLE(rect.x + rect.width, W, "Invalid LBP feature");
++        CV_CheckLE(rect.y + rect.height, H, "Invalid LBP feature");
++    }
++
+     return true;
+ }
+
+@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode& node, Size _o=
rigWinSize )
+     std::vector<Feature>& ff =3D *features;
+     for(int i =3D 0; it !=3D it_end; ++it, i++)
+     {
+-        if(!ff[i].read(*it))
++        if(!ff[i].read(*it, _origWinSize))
+             return false;
+     }
+     nchannels =3D 1;
+@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNod=
e &root)
+     origWinSize.width =3D (int)root[CC_WIDTH];
+     origWinSize.height =3D (int)root[CC_HEIGHT];
+     CV_Assert( origWinSize.height > 0 && origWinSize.width > 0 );
++    CV_CheckLE(origWinSize.width, 1000000, "Invalid window size (too larg=
e)");
++    CV_CheckLE(origWinSize.height, 1000000, "Invalid window size (too lar=
ge)");
+
+     // load feature params
+     FileNode fn =3D root[CC_FEATURE_PARAMS];
+diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/s=
rc/cascadedetect.hpp
+index f9910530b94..d9a288fcdda 100644
+--- a/modules/objdetect/src/cascadedetect.hpp
++++ b/modules/objdetect/src/cascadedetect.hpp
+@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvaluat=
or
+     struct Feature
+     {
+         Feature();
+-        bool read( const FileNode& node );
++        bool read(const FileNode& node, const Size& origWinSize);
+
+         bool tilted;
+
+         enum { RECT_NUM =3D 3 };
+-        struct
++        struct RectWeigth
+         {
+             Rect r;
+             float weight;
+@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator
+         Feature( int x, int y, int _block_w, int _block_h  ) :
+                  rect(x, y, _block_w, _block_h) {}
+
+-        bool read(const FileNode& node );
++        bool read(const FileNode& node, const Size& origWinSize);
+
+         Rect rect; // weight and height for block
+     };
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
new file mode 100644
index 0000000..88d6a7f
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
@@ -0,0 +1,237 @@
+From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 25 Jul 2019 15:14:22 +0300
+Subject: [PATCH] core(persistence): added null ptr checks
+
+CVE: CVE-2019-14493
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5691d99=
8ead1d9b0542bcfced36c2dceb3a59023.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/core/src/persistence_json.cpp | 12 ++++++++++++
+ modules/core/src/persistence_xml.cpp  | 21 +++++++++++++++++++++
+ modules/core/src/persistence_yml.cpp  | 21 +++++++++++++++++++++
+ 3 files changed, 54 insertions(+)
+
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/pers=
istence_json.cpp
+index ae678e1b8b1..89914e6534f 100644
+--- a/modules/core/src/persistence_json.cpp
++++ b/modules/core/src/persistence_json.cpp
+@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser
+
+         while ( is_eof =3D=3D false && is_completed =3D=3D false )
+         {
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+             switch ( *ptr )
+             {
+                 /* comment */
+@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser
+         if ( is_eof || !is_completed )
+         {
+             ptr =3D fs->bufferStart();
++            CV_Assert(ptr);
+             *ptr =3D '\0';
+             fs->setEof();
+             if( !is_completed )
+@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser
+
+     char* parseKey( char* ptr, FileNode& collection, FileNode& value_plac=
eholder )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         if( *ptr !=3D '"' )
+             CV_PARSE_ERROR_CPP( "Key must start with \'\"\'" );
+
+@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid value input");
++
+         ptr =3D skipSpaces( ptr );
+         if( !ptr || !*ptr )
+             CV_PARSE_ERROR_CPP( "Unexpected End-Of-File" );
+@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser
+
+     bool parse( char* ptr )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         ptr =3D skipSpaces( ptr );
+         if ( !ptr || !*ptr )
+             return false;
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persi=
stence_xml.cpp
+index fb30d90896e..89876dd3da8 100644
+--- a/modules/core/src/persistence_xml.cpp
++++ b/modules/core/src/persistence_xml.cpp
+@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser
+
+     char* skipSpaces( char* ptr, int mode )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         int level =3D 0;
+
+         for(;;)
+@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         FileNode new_elem;
+         bool have_space =3D true;
+         int value_type =3D node.type();
+@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser
+                 (c =3D=3D '<' && ptr[1] =3D=3D '!' && ptr[2] =3D=3D '-') =
)
+             {
+                 ptr =3D skipSpaces( ptr, 0 );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 have_space =3D true;
+                 c =3D *ptr;
+             }
+@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser
+                 {
+                     ptr =3D fs->parseBase64( ptr, 0, new_elem);
+                     ptr =3D skipSpaces( ptr, 0 );
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid input");
+                 }
+
+                 ptr =3D parseTag( ptr, key2, type_name, tag_type );
+@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser
+     char* parseTag( char* ptr, std::string& tag_name,
+                     std::string& type_name, int& tag_type )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid tag input");
++
+         if( *ptr =3D=3D '\0' )
+             CV_PARSE_ERROR_CPP( "Unexpected end of the stream" );
+
+@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser
+                 if( *ptr !=3D '=3D' )
+                 {
+                     ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid attribute");
+                     if( *ptr !=3D '=3D' )
+                         CV_PARSE_ERROR_CPP( "Attribute name should be fol=
lowed by \'=3D\'" );
+                 }
+@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser
+             if( c !=3D '>' )
+             {
+                 ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 c =3D *ptr;
+             }
+
+@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser
+
+         // CV_XML_INSIDE_TAG is used to prohibit leading comments
+         ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
+
+         if( memcmp( ptr, "<?xml", 5 ) !=3D 0 )  // FIXIT ptr[1..] - out o=
f bounds read without check
+             CV_PARSE_ERROR_CPP( "Valid XML should start with \'<?xml ...?=
>\'" );
+@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser
+         while( ptr && *ptr !=3D '\0' )
+         {
+             ptr =3D skipSpaces( ptr, 0 );
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+
+             if( *ptr !=3D '\0' )
+             {
+diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/persi=
stence_yml.cpp
+index 4129ca1dc57..7742e827701 100644
+--- a/modules/core/src/persistence_yml.cpp
++++ b/modules/core/src/persistence_yml.cpp
+@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser
+
+     char* skipSpaces( char* ptr, int min_indent, int max_comment_indent )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         for(;;)
+         {
+             while( *ptr =3D=3D ' ' )
+@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser
+
+     bool getBase64Row(char* ptr, int indent, char* &beg, char* &end)
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         beg =3D end =3D ptr =3D skipSpaces(ptr, 0, INT_MAX);
+         if (!ptr || !*ptr)
+             return false; // end of file
+@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser
+
+     char* parseKey( char* ptr, FileNode& map_node, FileNode& value_placeh=
older )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         char c;
+         char *endptr =3D ptr - 1, *saveptr;
+
+@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser
+
+     char* parseValue( char* ptr, FileNode& node, int min_indent, bool is_=
parent_flow )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         char* endptr =3D 0;
+         char c =3D ptr[0], d =3D ptr[1];
+         int value_type =3D FileNode::NONE;
+@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser
+
+             *endptr =3D d;
+             ptr =3D skipSpaces( endptr, min_indent, INT_MAX );
++            if (!ptr)
++                CV_PARSE_ERROR_CPP("Invalid input");
+
+             c =3D *ptr;
+
+@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser
+                 FileNode elem;
+
+                 ptr =3D skipSpaces( ptr, new_min_indent, INT_MAX );
++                if (!ptr)
++                    CV_PARSE_ERROR_CPP("Invalid input");
+                 if( *ptr =3D=3D '}' || *ptr =3D=3D ']' )
+                 {
+                     if( *ptr !=3D d )
+@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser
+                     if( *ptr !=3D ',' )
+                         CV_PARSE_ERROR_CPP( "Missing , between the elemen=
ts" );
+                     ptr =3D skipSpaces( ptr + 1, new_min_indent, INT_MAX =
);
++                    if (!ptr)
++                        CV_PARSE_ERROR_CPP("Invalid input");
+                 }
+
+                 if( struct_type =3D=3D FileNode::MAP )
+@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser
+
+     bool parse( char* ptr )
+     {
++        if (!ptr)
++            CV_PARSE_ERROR_CPP("Invalid input");
++
+         bool first =3D true;
+         bool ok =3D true;
+         FileNode root_collection(fs->getFS(), 0, 0);
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
new file mode 100644
index 0000000..35d62cf
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
@@ -0,0 +1,73 @@
+From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Fri, 23 Aug 2019 16:14:53 +0300
+Subject: [PATCH] objdetect: add input check in HOG detector
+
+CVE: CVE-2019-15939
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5a49707=
7f109d543ab86dfdf8add1c76c0e47d29.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
+index 9524851eebb..378bab30876 100644
+--- a/modules/objdetect/src/hog.cpp
++++ b/modules/objdetect/src/hog.cpp
+@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
+
+ static int numPartsWithin(int size, int part_size, int stride)
+ {
++    CV_Assert(stride !=3D 0);
+     return (size - part_size + stride) / stride;
+ }
+
+@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size par=
t_size,
+
+ static size_t getBlockHistogramSize(Size block_size, Size cell_size, int =
nbins)
+ {
++    CV_Assert(!cell_size.empty());
+     Size cells_per_block =3D Size(block_size.width / cell_size.width,
+-        block_size.height / cell_size.height);
++                                block_size.height / cell_size.height);
+     return (size_t)(nbins * cells_per_block.area());
+ }
+
+ size_t HOGDescriptor::getDescriptorSize() const
+ {
++    CV_Assert(!cellSize.empty());
++    CV_Assert(!blockStride.empty());
++
+     CV_Assert(blockSize.width % cellSize.width =3D=3D 0 &&
+         blockSize.height % cellSize.height =3D=3D 0);
+     CV_Assert((winSize.width - blockSize.width) % blockStride.width =3D=
=3D 0 &&
+@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
+     if( !obj.isMap() )
+         return false;
+     FileNodeIterator it =3D obj["winSize"].begin();
+-    it >> winSize.width >> winSize.height;
++    it >> winSize.width >> winSize.height; CV_Assert(!winSize.empty());
+     it =3D obj["blockSize"].begin();
+-    it >> blockSize.width >> blockSize.height;
++    it >> blockSize.width >> blockSize.height; CV_Assert(!blockSize.empty=
());
+     it =3D obj["blockStride"].begin();
+-    it >> blockStride.width >> blockStride.height;
++    it >> blockStride.width >> blockStride.height; CV_Assert(!blockStride=
.empty());
+     it =3D obj["cellSize"].begin();
+-    it >> cellSize.width >> cellSize.height;
+-    obj["nbins"] >> nbins;
++    it >> cellSize.width >> cellSize.height; CV_Assert(!cellSize.empty())=
;
++    obj["nbins"] >> nbins; CV_Assert(nbins > 0);
+     obj["derivAperture"] >> derivAperture;
+     obj["winSigma"] >> winSigma;
+     obj["histogramNormType"] >> histogramNormType;
+     obj["L2HysThreshold"] >> L2HysThreshold;
+     obj["gammaCorrection"] >> gammaCorrection;
+-    obj["nlevels"] >> nlevels;
++    obj["nlevels"] >> nlevels; CV_Assert(nlevels > 0);
+     if (obj["signedGradient"].empty())
+         signedGradient =3D false;
+     else
+
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/m=
eta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
new file mode 100644
index 0000000..923ca2a
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
@@ -0,0 +1,157 @@
+From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001
+From: Thang Tran <TranKimThang279@gmail.com>
+Date: Mon, 27 May 2019 08:18:26 +0200
+Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img
+
+CVE: CVE-2019-19624
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/d1615ba=
11a93062b1429fce9f0f638d1572d3418.patch]
+Comment: No changes in any hunk
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ modules/video/src/dis_flow.cpp          | 67 ++++++++++++++++++++++++-
+ modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++
+ 2 files changed, 93 insertions(+), 2 deletions(-)
+
+diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.c=
pp
+index a453d8b2b51..806d6f1ddaf 100644
+--- a/modules/video/src/dis_flow.cpp
++++ b/modules/video/src/dis_flow.cpp
+@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOpticalF=
low
+     void prepareBuffers(Mat &I0, Mat &I1, Mat &flow, bool use_flow);
+     void precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy, Mat &dst=
_I0xy, Mat &dst_I0x, Mat &dst_I0y, Mat &I0x,
+                                    Mat &I0y);
++    int autoSelectCoarsestScale(int img_width);
++    void autoSelectPatchSizeAndScales(int img_width);
+
+     struct PatchInverseSearch_ParBody : public ParallelLoopBody
+     {
+@@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(Ma=
t &dst_I0xx, Mat &dst_I0yy,
+     }
+ }
+
++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)
++{
++    const int fratio =3D 5;
++    return std::max(0, (int)std::floor(log2((2.0f*(float)img_width) / ((f=
loat)fratio * (float)patch_size))));
++}
++
++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)
++{
++    switch (finest_scale)
++    {
++    case 1:
++        patch_size =3D 8;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-2, 0);
++        break;
++
++    case 3:
++        patch_size =3D 12;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-4, 0);
++        break;
++
++    case 4:
++        patch_size =3D 12;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-5, 0);
++        break;
++
++    // default case, fall-through.
++    case 2:
++    default:
++        patch_size =3D 8;
++        coarsest_scale =3D autoSelectCoarsestScale(img_width);
++        finest_scale =3D std::max(coarsest_scale-2, 0);
++        break;
++    }
++}
++
+ DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBod=
y(DISOpticalFlowImpl &_dis, int _nstripes,
+                                                                          =
  int _hs, Mat &dst_Sx, Mat &dst_Sy,
+                                                                          =
  Mat &src_Ux, Mat &src_Uy, Mat &_I0, Mat &_I1,
+@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, In=
putArray I1, InputOutputArray
+     else
+         flow.create(I1Mat.size(), CV_32FC2);
+     UMat &u_flowMat =3D flow.getUMatRef();
+-    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal moveme=
nt of width/4 */
++    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code search for maximal moveme=
nt of width/4 */
+                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_si=
ze) / log(2.0)));              /* Deepest pyramid level greater or equal th=
an patch*/
+
++    if (coarsest_scale<0)
++        CV_Error(cv::Error::StsBadSize, "The input image must have either=
 width or height >=3D 12");
++
++    if (coarsest_scale<finest_scale)
++    {
++        // choose the finest level based on coarsest level.
++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d=
3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
++        int original_img_width =3D I0.size().width;
++        autoSelectPatchSizeAndScales(original_img_width);
++    }
++
+     ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input_flow);
+     u_Ux[coarsest_scale].setTo(0.0f);
+     u_Uy[coarsest_scale].setTo(0.0f);
+@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputA=
rray I1, InputOutputArray flo
+     else
+         flow.create(I1Mat.size(), CV_32FC2);
+     Mat flowMat =3D flow.getMat();
+-    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal moveme=
nt of width/4 */
++    coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *=
 patch_size)) / log(2.0) + 0.5), /* Original code search for maximal moveme=
nt of width/4 */
+                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_si=
ze) / log(2.0)));              /* Deepest pyramid level greater or equal th=
an patch*/
++
++    if (coarsest_scale<0)
++        CV_Error(cv::Error::StsBadSize, "The input image must have either=
 width or height >=3D 12");
++
++    if (coarsest_scale<finest_scale)
++    {
++        // choose the finest level based on coarsest level.
++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d=
3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
++        int original_img_width =3D I0.size().width;
++        autoSelectPatchSizeAndScales(original_img_width);
++    }
++
+     int num_stripes =3D getNumThreads();
+
+     prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow);
+diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test/=
test_OF_accuracy.cpp
+index affbab65866..b99ffce2a8b 100644
+--- a/modules/video/test/test_OF_accuracy.cpp
++++ b/modules/video/test/test_OF_accuracy.cpp
+@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)
+     }
+ }
+
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)
++{
++    cv::Ptr<cv::DISOpticalFlow> of =3D cv::DISOpticalFlow::create();
++    const int mat_size =3D 10;
++
++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat flow;
++
++    ASSERT_THROW(of->calc(x, y, flow), cv::Exception);
++}
++
++// make sure that autoSelectPatchSizeAndScales() works properly.
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanFinestLeve=
l)
++{
++    cv::Ptr<cv::DISOpticalFlow> of =3D cv::DISOpticalFlow::create();
++    const int mat_size =3D 80;
++
++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
++    cv::Mat flow;
++
++    of->calc(x, y, flow);
++
++    ASSERT_EQ(flow.rows, mat_size);
++    ASSERT_EQ(flow.cols, mat_size);
++}
++
+ TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)
+ {
+     Mat frame1, frame2, GT;
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recip=
es-support/opencv/opencv_4.1.0.bb
index d781da6..de708fd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -50,6 +50,10 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Do=
pencv \
            file://0001-Dont-use-isystem.patch \
            file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-=
g.patch \
            file://download.patch \
+           file://CVE-2019-14491.patch \
+           file://CVE-2019-14493.patch \
+           file://CVE-2019-15939.patch \
+           file://CVE-2019-19624.patch \
            "
 PV =3D "4.1.0"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
