Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B991BC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:30:36 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10584.1785414628184550771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=IwdVD2wf;
 spf=pass (domain: einfochips.com, ip: 40.93.201.11, mailfrom: bhavesh.maheshwari@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1dYP8lnWVThmgJTnwXWekyKv6OKxRRldgRNBFU77xSJTzr45ogqfCxws/dV9WeyigfaxAn0wyzPAI13X4VQbHyb3VkoXIRSqo1nZJ7Og13A9YG2JX0XkezhOcADIXcd/zV1efX4jBfc8shywVlmKqL5CEhbA0DF6llecooeID1l5AYZQwLG0l8zxdg4u9Ji2Tfg6rZzb3rVpW2D3lpnihzjCs9ScS/FIiWHYaFdfXctfhPy667u2khBkKPF7tr+A5ZpDbT3s2gp3LkzbneOYI65DQ1mtwnXR6rnWGhsffZL+7jfV1fD9lc+EY+o5YR/A4R0e6PSz6aR84UqGsDRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laj45akiKmmDz/5yGS+ElIri6fPgTleMor0GF+AoGnI=;
 b=CxugPRaNIywXPUPbMGJLADboUg/6lrOYCtV2ueb5axBLBdY8KQ4OLPUu3lKDzcxwITiTgsoGsLAcp7SsQFHxSyPNEmKBISjMlHINoeF2Snwrm/kSpeaIjAggGHzjLBKt56vhkzavNlYU7IZiSzXTninGIfXDn8BHi0n75LSP22EgoPM4UdKa6oxF/EzqSYN+Dt0MuZIrdS4orfvc3V5NkrD0lbXjkzWwBnoBDAxPx6NnG2cRKLvrHKyFHHukRKiNTl56nahjTaOqR/NmrfuWvmW39rH5Tfq2sSm5WlBmZTNnhvAicNmk+LL9fFiRFJfKyQF4qIAZ4zx0gfdA9eWbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laj45akiKmmDz/5yGS+ElIri6fPgTleMor0GF+AoGnI=;
 b=IwdVD2wfRkaa9cersVfEooI2xLt5oDHXXrw6IBHUXbTdV7WER7IdDsj9ZUyicdel7ZzJL6UDNjuSSGdKHEsYxdemfZgyOlPUlSRiWyPf63ya3Pq4KzrK/egLHwg81LkowO+gQRv2njjOt0aYIkD8GyMagg8tPx+og4yeabiwW64=
Received: from SN4PR04MB8398.namprd04.prod.outlook.com (2603:10b6:806:201::22)
 by IA3PR04MB9207.namprd04.prod.outlook.com (2603:10b6:208:527::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 12:30:23 +0000
Received: from SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d]) by SN4PR04MB8398.namprd04.prod.outlook.com
 ([fe80::4939:9b85:fbf:521d%2]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 12:30:21 +0000
From: Bhavesh Rajesh Maheshwari <Bhavesh.Maheshwari@einfochips.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Bhavesh Rajesh Maheshwari
	<Bhavesh.Maheshwari@einfochips.com>
Subject: Re: [External] [OE-Core][wrynose][PATCH] vim: Fix for CVE-2026-57455
Thread-Topic: [External] [OE-Core][wrynose][PATCH] vim: Fix for CVE-2026-57455
Thread-Index: AQHdHz4F0emxzabsnEWrfHFCML8idraF/zYp
Date: Thu, 30 Jul 2026 12:30:21 +0000
Message-ID: 
 <SN4PR04MB83980BE7E5312DDACA9E9680E5C92@SN4PR04MB8398.namprd04.prod.outlook.com>
References: <18C6B92D6186BC32.1692300@lists.openembedded.org>
In-Reply-To: <18C6B92D6186BC32.1692300@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-07-30T12:30:20.611Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR04MB8398:EE_|IA3PR04MB9207:EE_
x-ms-office365-filtering-correlation-id: ee2b9fc4-441e-4ca6-052e-08deee36528a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|6049299003|366016|376014|23010399003|39142699007|31052699007|1800799024|38070700021|13003099007|4053099003|4013099003|56012099006|11063799006|10067099003|8096899003|3023799007|4133799003|55112099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 6ODE/kvYxwMbJZ3V+0m8mgPUfWJVi1klQZy3PzIPyA/JPUezez1f6BhBfrFGPzJbHvDEkG1AU97c3JDwKorqZnFscuSfoiJpFmKSMZbl9w3iyzYYI+YGfup1nsnvCvLmPeHZexKaH9whgpxIyDMj95ENEcVFjdQeHXYR5dDmHeckxox024Lj3xGOlGAdvWb2UI1s7mBz05Lc9Ck7c30arDb38h8SX8++vsu4AwqHNGLAoy+xYtmmKhObOh2CYZr2k1ZK94F/3X/xu+5uaarMbvUPMV3+N/h8RkTkgfwilEEW1dUrhS833iKHo5IYHeYk/TMf9nEP8lRbHpUFZT1WWEjBubbr9GNRPNMgSFGVWaICg2x1y5WELHu1/6hqWJsRE1+Qa9+/OD8vFGQ1QLtxVBIQm2FLZBhRsK0iNeXG4tWi49RhQ6PgefWTwVITuEusn3qufjCjTSndUEHuZI+JzQVqhMIfzN4zlHOexGuBWbYLfoygNKGjDambgWm3jDTa05MfRb1rSW5PdjJXkzymxuPPHRJitmmeCF5Kw99dZvqr6zxrAUckhheaHwsEru6Hbm5GVK1mgB3FHIeE145hYSqjgZcpZieJm9FLtU3e6FQfnJUAoNH/VrkLawanrSZDNkClpLY4k2CgDt8dVP+QUGa4Syb0qzGw2io1VeBsAuw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8398.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(366016)(376014)(23010399003)(39142699007)(31052699007)(1800799024)(38070700021)(13003099007)(4053099003)(4013099003)(56012099006)(11063799006)(10067099003)(8096899003)(3023799007)(4133799003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BbNKaaxhpXls8MzKcPaWdjDE9nkznvR+9+T1ItSL3YDAwTw627gJ8HL0w2X/?=
 =?us-ascii?Q?pGloce9FkdA2DMsRlkURPZcJxN9gQJyIKlMYC7nctbvAjzDpXLjjyORNWTYZ?=
 =?us-ascii?Q?Wkv+L97/qK5AFnuV9fpKk3IUmpDE+V9T8Mf1la3PzRJbGC47May9s1djNqpP?=
 =?us-ascii?Q?Tobd/63zmGQ+WOwIpnAK+EqGPjNSacAFUzaGqfk3JYxk2MsTG7WXNX2i888r?=
 =?us-ascii?Q?G2dutf0PrCbFr1b9x0uemnLiIPsq9MOaSGhzG8D55bJLRa++SNUU9OjkDHcv?=
 =?us-ascii?Q?HA1cBeUo7TW04mLq2hvU5suy76+9e8fAEtUP7nTJIJ7xhb/Y5VN/DMT+CBtk?=
 =?us-ascii?Q?am4oxeFem37Pso3u790gOCrdUnBZS0f4uK55Q/OQEytpsvU79ZqVlT+ffAtc?=
 =?us-ascii?Q?FC3yfH8ZAzC93nQqQjXLGnXGJIa9G+S5nu9hjBVUrffmtHjTZGb+H6OUj8kY?=
 =?us-ascii?Q?Ox41z7LjD5rEkzOJR4q5PrFuY7H5Ih6UCUc2d1pn9fIk74iyfZfXgF/PqIS0?=
 =?us-ascii?Q?Zi2K9EKBuGIYILwKRDHSwrFQQejXzRg/Ux9y1y2EZsRx7G3wh/R+E2OI2dfS?=
 =?us-ascii?Q?k9q9U8CFbkmbAs2GHhh9KPzjmK1ZTvvYtpmuAPK/vWIYfqIYJKGI44oh+SZH?=
 =?us-ascii?Q?VWdoKczheM5CFS7hsib0n/8gmPnLAJRRXJggx9CIbNvB3YvCoGhTgnCfMHlq?=
 =?us-ascii?Q?LMOLE9YRgRe8cdkI0OZYAmcKI3XK/m4zA4xwTKYNO+4/yBc37Z2GWdSykQT3?=
 =?us-ascii?Q?5c7VuVFYZuzow/5lfqGFhQkLfpBhp85/ZvOLACfZu5zhCm54uzIDXKc4WfK/?=
 =?us-ascii?Q?KI4YTnZQRbf85PeD+/RIk+BFMJOdSEDHvcDa1Pe07hPsjv4DBe2z9O+4kEd9?=
 =?us-ascii?Q?cAfBBoY0VfyXrzKqqWhdY9p6kv8PjHsvZ2NjuAHqeHEkP9rUBd8vXrCqJRue?=
 =?us-ascii?Q?T8GckfSDvPxnNiauBh+rHPEjmZHAG5+E6QiX0OUij+V0gUFB8apmAAk0GIUt?=
 =?us-ascii?Q?e6JWdryc2/8kotXCo/hNr0jLrAtWtCHs6D5aNfUuhLivE68//gKOTa1bOcXh?=
 =?us-ascii?Q?Ki62BA/4/n2K6zLsPHt3TmuoUmgMyH1ws4HLGo+/sWEfW0hO5/wCCZSV/s+n?=
 =?us-ascii?Q?VSnXJgxPgMULz+5X5HDTP58aDxKDcX2+OSkt9wf/AzfPHOjlkgux2ZRQXd1A?=
 =?us-ascii?Q?Dw1srJwWLt+Uw7+LvQ04loeWLwnVbpXNrvxTjxuYBJQCYsAJfWGxYntm/PKJ?=
 =?us-ascii?Q?UelaA9G+gt1Tf+RPe2ukK4kqSdQ4wDpYkU9c64U7haVvEbpsqV4NbzUOQzAO?=
 =?us-ascii?Q?tRJ6K4oc16vJ1OzGskvclPdkHDva9XDhHiphJQsbsaNknYgCmv0qg9HPRxUk?=
 =?us-ascii?Q?UXRPzb7Zg6ysr1wJGSJicO1HHBrkuqNLMVrWljcMssLB3n/aFmB/m/MdghtD?=
 =?us-ascii?Q?oa+5GaNLwfQeMZOthwlEaON8D2yqP2RcPnsrDXP4qYIGsUBk+uMyNc55EdLC?=
 =?us-ascii?Q?kGs0fxW8EXRQjxbZ6pNGtkuTJ52LlY3HZMn6rhbJp3xAXPhfDAPhPJJF8Kgq?=
 =?us-ascii?Q?h7DU7itxRxBy1UpWVr2qmbyEbvKmmWoXc4xxcvIqenix9PtlZoIoM6emZ2kM?=
 =?us-ascii?Q?aS+bwGhmco327oCTIK7Auz/CpS82NILcWsYKdt7/pwudvc6HgawNpiI5RDpC?=
 =?us-ascii?Q?VNdnT7zjkfd0f7e9GA6Qt7FqTJPCIeDHjvIzLdWLE+tVFGuiLo8MwHj+Sbhc?=
 =?us-ascii?Q?VpzcNsD3fs6h1iqLRQ2fxCE4tQeNLI0=3D?=
Content-Type: multipart/related;
	boundary="_004_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8398.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2b9fc4-441e-4ca6-052e-08deee36528a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 12:30:21.3562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1N2UkboM2t3Q6WdX+TwgFfMnJL1xuj5/UlYtn0MMCuC6qyDy05vrWB/eFyzdsAJa44Adm/tfnOPKJQUfbScaqDi2O1yN6jnrU2l9YLOBTU0cs0S/H/q8PKRjjnG1piN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR04MB9207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242346

--_004_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_
Content-Type: multipart/alternative;
	boundary="_000_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_"

--_000_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

On investigation, i found that there are more CVEs reported for vim.
So, please ignore this submission. I'll send an updated patch series soon.


Thanks

Bhavesh Maheshwari
Engineer
+91 8827543501
Bhavesh.Maheshwari@einfochips.com<mailto:Bhavesh.Maheshwari@einfochips.com>
[cid:ab6810f4-c718-41d2-94de-f08096037123]<https://www.einfochips.com/>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of bhavesh.maheshwari via lists.openembedded.org <=
bhavesh.maheshwari=3Deinfochips.com@lists.openembedded.org>
Sent: 29 July 2026 15:08
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [External] [OE-Core][wrynose][PATCH] vim: Fix for CVE-2026-57455

[You don't often get email from bhavesh.maheshwari=3Deinfochips.com@lists.o=
penembedded.org. Learn why this is important at https://aka.ms/LearnAboutSe=
nderIdentification ]

CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.


From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fvim%2Fvim%2Fcommit%2F497f931f85339d175d7f69588dd249e8ccfed41b&dat=
a=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7060a87550a04aeea2fb08d=
eed55257d%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639209147128824325%7=
CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJX=
aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D08qbWILIyYbGD=
pKWhYXESvo4X91nLR9CnJfoOobOD20%3D&reserved=3D0<https://github.com/vim/vim/c=
ommit/497f931f85339d175d7f69588dd249e8ccfed41b>
[2] https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd=
.nist.gov%2Fvuln%2Fdetail%2FCVE-2026-57455&data=3D05%7C02%7Cbhavesh.maheshw=
ari%40einfochips.com%7C7060a87550a04aeea2fb08deed55257d%7C0beb0c359cbb4feb9=
9e5589e415c7944%7C1%7C0%7C639209147128901047%7CUnknown%7CTWFpbGZsb3d8eyJFbX=
B0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUI=
joyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DP%2FBAtor%2BaS7EsBLR%2FDWpYLjJaUC1lreEMhJI=
5%2Bf%2FiD4%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2026-57455=
>

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57455.patch            | 77 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/rec=
ipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 0000000000..c87b069173
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,77 @@
+From b4ed0eb9ed412eb769a13d50932978593b062623 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:20:03 +0000
+Subject: [PATCH] patch 9.2.0698: [security]: Out-of-bounds write with
+ soundfold()
+
+Problem:  [security]: Out-of-bounds write with soundfold()
+          (cipher-creator)
+Solution: Add an abort condition to the for loop to validate the buffer
+          size.
+
+Github Security Advisory:
+https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fvim%2Fvim%2Fsecurity%2Fadvisories%2FGHSA-q8mh-6qm3-25g4&data=3D05%7C=
02%7Cbhavesh.maheshwari%40einfochips.com%7C7060a87550a04aeea2fb08deed55257d=
%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639209147128984009%7CUnknown%=
7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI=
kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DEG3V0LgvUWWlS1SjN0DL78=
P%2BYKZaGvyGtbhd0kopT30%3D&reserved=3D0
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-57455
+Upstream-Status: Backport [https://nam04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Fvim%2Fvim%2Fcommit%2F497f931f85339d175d7f=
69588dd249e8ccfed41b&data=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7=
C7060a87550a04aeea2fb08deed55257d%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C=
0%7C639209147129056201%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&sdata=3DDWbNMW0O2TZ%2F3wpGFd1FgUlZfvoTfmAKczYJmDqlIwU%3D&reserved=3D0<ht=
tps://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b>]
+
+Backport Changes:
+- Discarded the changes from src/version.c file as it includes patch
+number
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 01eb57e3a..060a2251a 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3270,7 +3270,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword,=
 char_u *res)
+     else
+     {
+       // The sl_sal_first[] table contains the translation.
+-      for (s =3D inword; (c =3D *s) !=3D NUL; ++s)
++      for (s =3D inword; (c =3D *s) !=3D NUL && ri < MAXWLEN - 1; ++s)
+       {
+           if (VIM_ISWHITE(c))
+               c =3D ' ';
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.v=
im
+index 8f3ef4907..b0b152b8c 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1197,4 +1197,25 @@ func Test_mkspell_no_buffer_overflow()
+ endfunc
+
+
++" A word longer than MAXWLEN must not overflow the soundfold result buffe=
r in
++" the single-byte SOFO branch of spell_soundfold_sofo().
++func Test_soundfold_overflow()
++  let _enc=3D&enc
++  set enc=3Dlatin1
++  call writefile(['SOFOFROM ab', 'SOFOTO xy'], 'Xtest.aff', 'D')
++  call writefile(['1', 'foo'], 'Xtest.dic', 'D')
++  mkspell! Xtest Xtest
++  defer delete('Xtest.latin1.spl')
++  defer delete('Xtest.latin1.sug')
++  setl spelllang=3DXtest.latin1.spl spell
++
++  " Before the fix the copy loop wrote one byte per input byte into a
++  " MAXWLEN (254) stack buffer with no upper bound, smashing the stack.
++  let sound =3D soundfold(repeat('ab', 300))
++  call assert_true(strlen(sound) < 254, 'soundfold result exceeds MAXWLEN=
')
++
++  set spell& spelllang&
++  let &enc =3D _enc
++endfunc
++
+ " vim: shiftwidth=3D2 sts=3D2 expandtab
+--
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index e34cc17fe5..402e39acff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster=
;protocol=3Dhttps;tag=3Dv${PV}
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-57455.patch \
            "

 PV .=3D ".0340"
--
2.43.0


--_000_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
On investigation, i found that there are more CVEs reported for vim.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So, please ignore this submission. I'll send an updated patch series soon.<=
/div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<p style=3D"margin: 0in; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: gray;">Thanks</span></p>
<table style=3D"text-align: left; background-color: rgb(255, 255, 255); col=
or: rgb(33, 37, 41); box-sizing: border-box; border-collapse: collapse; bor=
der-spacing: 0px;">
<tbody>
<tr>
<td colspan=3D"2" style=3D"text-align: left; color: rgb(0, 75, 118); box-si=
zing: border-box;">
<div style=3D"text-align: left;" class=3D"elementToProof"><span style=3D"fo=
nt-family: Calibri, sans-serif; font-size: 15px; color: rgb(0, 0, 0);"><b>B=
havesh Maheshwari</b></span><span style=3D"font-family: Calibri, sans-serif=
; font-size: 14px;"><br>
</span><span style=3D"font-family: Calibri; font-size: 15px; color: rgb(85,=
 85, 85);">Engineer</span><span style=3D"font-family: Calibri, sans-serif; =
font-size: 14px;"><br>
</span><span style=3D"font-family: Calibri; font-size: 15px; color: rgb(85,=
 85, 85);">+91 8827543501</span></div>
<div style=3D"text-align: left; margin: 0px; padding-bottom: 10px; font-fam=
ily: Calibri; font-size: 15px;" class=3D"elementToProof">
<a href=3D"mailto:Bhavesh.Maheshwari@einfochips.com" id=3D"OWAaba081e8-e65f=
-b6c0-dd9b-68297c1ade0d" class=3D"OWAAutoLink"><u>Bhavesh.Maheshwari@einfoc=
hips.com</u></a></div>
</td>
</tr>
</tbody>
</table>
<div style=3D"margin: 0in; font-family: Calibri, sans-serif; font-size: 11p=
t; color: rgb(0, 0, 0);" class=3D"elementToProof">
<a href=3D"https://www.einfochips.com/" id=3D"OWAf8d6743b-840b-94fa-7b68-84=
7d5130cefe" class=3D"OWAAutoLink" title=3D"https://www.einfochips.com/" sty=
le=3D"text-decoration: none;"><img id=3D"x_image_0" style=3D"max-width: 780=
px;" size=3D"9472" data-outlook-trace=3D"F:1|T:1" src=3D"cid:ab6810f4-c718-=
41d2-94de-f08096037123"></a></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of bhavesh.maheshwari via lists.openembedded.org
 &lt;bhavesh.maheshwari=3Deinfochips.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 29 July 2026 15:08<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [External] [OE-Core][wrynose][PATCH] vim: Fix for CVE-2026-=
57455</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from bhavesh.maheshwari=
=3Deinfochips.com@lists.openembedded.org. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.<br>
<br>
<br>
From: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.com&gt;<br>
<br>
Pick patch from [1] also mentioned at NVD report in [2]<br>
<br>
[1] <a href=3D"https://github.com/vim/vim/commit/497f931f85339d175d7f69588d=
d249e8ccfed41b">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fvim%2Fvim%2Fcommit%2F497f931f85339d175d7f69588dd249e8ccfed41b&amp;dat=
a=3D05%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7060a87550a04aeea2fb08d=
eed55257d%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639209147128824325%7=
CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJX=
aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D08qbWILIy=
YbGDpKWhYXESvo4X91nLR9CnJfoOobOD20%3D&amp;reserved=3D0</a><br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-57455">https://nam=
04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%2Fvul=
n%2Fdetail%2FCVE-2026-57455&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40einfo=
chips.com%7C7060a87550a04aeea2fb08deed55257d%7C0beb0c359cbb4feb99e5589e415c=
7944%7C1%7C0%7C639209147128901047%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO=
nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D=
%7C0%7C%7C%7C&amp;sdata=3DP%2FBAtor%2BaS7EsBLR%2FDWpYLjJaUC1lreEMhJI5%2Bf%2=
FiD4%3D&amp;reserved=3D0</a><br>
<br>
Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.com&g=
t;<br>
---<br>
&nbsp;.../vim/files/CVE-2026-57455.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 77 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/vim/vim.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 78 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patc=
h<br>
<br>
diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/rec=
ipes-support/vim/files/CVE-2026-57455.patch<br>
new file mode 100644<br>
index 0000000000..c87b069173<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch<br>
@@ -0,0 +1,77 @@<br>
+From b4ed0eb9ed412eb769a13d50932978593b062623 Mon Sep 17 00:00:00 2001<br>
+From: Christian Brabandt &lt;cb@256bit.org&gt;<br>
+Date: Sun, 21 Jun 2026 19:20:03 +0000<br>
+Subject: [PATCH] patch 9.2.0698: [security]: Out-of-bounds write with<br>
+ soundfold()<br>
+<br>
+Problem:&nbsp; [security]: Out-of-bounds write with soundfold()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cipher-creator)<br=
>
+Solution: Add an abort condition to the for loop to validate the buffer<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size.<br>
+<br>
+Github Security Advisory:<br>
+https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fvim%2Fvim%2Fsecurity%2Fadvisories%2FGHSA-q8mh-6qm3-25g4&amp;data=3D0=
5%7C02%7Cbhavesh.maheshwari%40einfochips.com%7C7060a87550a04aeea2fb08deed55=
257d%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639209147128984009%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DEG3V0LgvUWWlS1=
SjN0DL78P%2BYKZaGvyGtbhd0kopT30%3D&amp;reserved=3D0<br>
+<br>
+Supported by AI<br>
+<br>
+Signed-off-by: Christian Brabandt &lt;cb@256bit.org&gt;<br>
+<br>
+CVE: CVE-2026-57455<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/commit/49=
7f931f85339d175d7f69588dd249e8ccfed41b">https://nam04.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fvim%2Fvim%2Fcommit%2F497f931f=
85339d175d7f69588dd249e8ccfed41b&amp;data=3D05%7C02%7Cbhavesh.maheshwari%40=
einfochips.com%7C7060a87550a04aeea2fb08deed55257d%7C0beb0c359cbb4feb99e5589=
e415c7944%7C1%7C0%7C639209147129056201%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&amp;sdata=3DDWbNMW0O2TZ%2F3wpGFd1FgUlZfvoTfmAKczYJmDqlIw=
U%3D&amp;reserved=3D0</a>]<br>
+<br>
+Backport Changes:<br>
+- Discarded the changes from src/version.c file as it includes patch<br>
+number<br>
+<br>
+Signed-off-by: Bhavesh R Maheshwari &lt;bhavesh.maheshwari@einfochips.com&=
gt;<br>
+---<br>
+ src/spell.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++<br>
+ 2 files changed, 22 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/spell.c b/src/spell.c<br>
+index 01eb57e3a..060a2251a 100644<br>
+--- a/src/spell.c<br>
++++ b/src/spell.c<br>
+@@ -3270,7 +3270,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword,=
 char_u *res)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // The sl_sal_first[] table contains =
the translation.<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (s =3D inword; (c =3D *s) !=3D NUL; ++=
s)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (s =3D inword; (c =3D *s) !=3D NUL &am=
p;&amp; ri &lt; MAXWLEN - 1; ++s)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (VIM_ISWHI=
TE(c))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; c =3D ' ';<br>
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.v=
im<br>
+index 8f3ef4907..b0b152b8c 100644<br>
+--- a/src/testdir/test_spellfile.vim<br>
++++ b/src/testdir/test_spellfile.vim<br>
+@@ -1197,4 +1197,25 @@ func Test_mkspell_no_buffer_overflow()<br>
+ endfunc<br>
+<br>
+<br>
++&quot; A word longer than MAXWLEN must not overflow the soundfold result =
buffer in<br>
++&quot; the single-byte SOFO branch of spell_soundfold_sofo().<br>
++func Test_soundfold_overflow()<br>
++&nbsp; let _enc=3D&amp;enc<br>
++&nbsp; set enc=3Dlatin1<br>
++&nbsp; call writefile(['SOFOFROM ab', 'SOFOTO xy'], 'Xtest.aff', 'D')<br>
++&nbsp; call writefile(['1', 'foo'], 'Xtest.dic', 'D')<br>
++&nbsp; mkspell! Xtest Xtest<br>
++&nbsp; defer delete('Xtest.latin1.spl')<br>
++&nbsp; defer delete('Xtest.latin1.sug')<br>
++&nbsp; setl spelllang=3DXtest.latin1.spl spell<br>
++<br>
++&nbsp; &quot; Before the fix the copy loop wrote one byte per input byte =
into a<br>
++&nbsp; &quot; MAXWLEN (254) stack buffer with no upper bound, smashing th=
e stack.<br>
++&nbsp; let sound =3D soundfold(repeat('ab', 300))<br>
++&nbsp; call assert_true(strlen(sound) &lt; 254, 'soundfold result exceeds=
 MAXWLEN')<br>
++<br>
++&nbsp; set spell&amp; spelllang&amp;<br>
++&nbsp; let &amp;enc =3D _enc<br>
++endfunc<br>
++<br>
+ &quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
+--<br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index e34cc17fe5..402e39acff 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -23,6 +23,7 @@ SRC_URI =3D &quot;git://github.com/vim/vim.git;branch=3Dm=
aster;protocol=3Dhttps;tag=3Dv${PV}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-52858.patch">file://CVE-2026-52858.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-52859.patch">file://CVE-2026-52859.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-52860.patch">file://CVE-2026-52860.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-57455.patch">file://CVE-2026-57455.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
<br>
&nbsp;PV .=3D &quot;.0340&quot;<br>
--<br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_--

--_004_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=9472;
	creation-date="Thu, 30 Jul 2026 12:27:56 GMT";
	modification-date="Thu, 30 Jul 2026 12:27:56 GMT"
Content-ID: <ab6810f4-c718-41d2-94de-f08096037123>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAaIAAABaCAYAAAD6vVKvAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDkuMS1jMDAyIDc5LmE2
YTYzOTY4YSwgMjAyNC8wMy8wNi0xMTo1MjowNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRm
PSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNj
cmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6
c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHht
cDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDI1LjkgKFdpbmRvd3MpIiB4bXBNTTpJbnN0
YW5jZUlEPSJ4bXAuaWlkOkIwQjkyNkM5Mzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIiB4bXBNTTpE
b2N1bWVudElEPSJ4bXAuZGlkOkIwQjkyNkNBMzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIj4gPHht
cE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QjBCOTI2QzczODQxMTFF
RjlDQjVBNjU2ODcxQjk5QUEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QjBCOTI2QzgzODQx
MTFFRjlDQjVBNjU2ODcxQjk5QUEiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94
OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6C+n3FAAAhcElEQVR42uxdMYwsSXmuQ08yweGb
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
AABJRU5ErkJggg==

--_004_SN4PR04MB83980BE7E5312DDACA9E9680E5C92SN4PR04MB8398namp_--

