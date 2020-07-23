Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.3])
 by mx.groups.io with SMTP id smtpd.web11.5659.1595478704135023359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 21:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=Fc4BYAcJ;
 spf=pass (domain: digi.com, ip: 67.219.250.3, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.130.41] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.us-west-2.aws.symcld.net id 86/7D-20041-EA2191F5; Thu, 23 Jul 2020 04:31:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRWlGSWpSXmKPExsWSoW+eqrtWSDL
  e4OZGHYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPF+l1MBQvYKy6s3cDYwLiWrYuRi4NRYCmz
  xNwX7UwQzjEWiQkXJkFlNjFKnPu5hBHEYRHYwSLxaO8NFojMckaJO58/sYI4QgLzmST+Pd3JB
  OHcZ5TofrCTuYuRk4NNwEBi3dypQMM4OEQEdCTefPQCCTML6En0HvzPDmILCzhI7P/yhgXEZh
  FQlVj0cRVYnFfAUaLn60qwuISAvMT17btYIXrlJZq3zmaGsCUkDr54wQyyV0JgCqPE2qZeJpC
  EkIC6xOrVT9kgBglKnJz5BGqQjsTfRY2sEDW7mCRa+vQg7HqJ23M72dEtkxCwljjcvQgqLitx
  9OwcqDm+Ems3XWeCsLUkZvcdZAH5UUJAReL2ExuIcI7Ei7ermSFsVYmnj65AtcpJnOo9B9UqI
  zFxzwWWCYy6s5C8NgvJa7OQfLCAkXkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoZGlrqGlkV5ilW
  6iXmmxbnlqcYkukFterFdcmZuck6KXl1qyiRGYSFIKGg/sYLzx+oPeIUZJDiYlUV7FxxLxQnx
  J+SmVGYnFGfFFpTmpxYcYZTg4lCR4/YGpSUiwKDU9tSItMweY1GDSEhw8SiK8lwSB0rzFBYm5
  xZnpEKlTjLocE17OXcQsxJKXn5cqJc4bBjJDAKQoozQPbgQswV5ilJUS5mVkYGAQ4ilILcrNL
  EGVf8UozsGoJMxrAjKFJzOvBG7TK6AjmICOUL4rCnJESSJCSqqBiavaf9XGnoZcrSPcKjYfbm
  8oTO18vlN0357MXTwMbGWT4toeP5g0NzS8XLhp0fSTG3i613G/jq1T08xPbtffzHLEVvrsdaF
  tkyvrf27/0CXUKumk//Da29t3nT5mJfPOrvh/KnWt64Fr8gfV7ux75OFnIfJ81cNQptL6LzE3
  Zu2MeM11KMNGQlMvVuCNRHP9p4tmHVEtB4+qVO3ZbiTmyvguwa1LOf4cR9r3qb6zd381uKc6z
  2u9KbvdjLLTNmeCBXavza/teK2mPWv5fNOlzrqiaoE9qROy67bPjDox9fv1LXoZWqdOMX2xPi
  21u+7TdYlLM1aoBIQHLZu2YM+qiYu8f5ZvdlbcZ6OeW3DxpRJLcUaioRZzUXEiAMY853UrBAA
  A
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-29.tower-334.messagelabs.com!1595478700!183126!1
X-Originating-IP: [104.47.55.101]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2640 invoked from network); 23 Jul 2020 04:31:41 -0000
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) (104.47.55.101)
  by server-29.tower-334.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2020 04:31:41 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaRt8oIL17uBodIUIiq3b+4snzCJcQJ9mDn1qoSbCPoC7nyxoLNunEMhXJB63W1jhynCVr2N4IcUjDT8H7xGP9QRP788uaM6uZM5hXdSsdE4WfHiTn/nDgto1ouGLnGlXJpflE8XniEt8XHiSegPI3IyIW9dog85Rc+u84090rVBPxbQWhGUUpCk1VcW2eYdkAvztv420d0wvbbaJDng6noisz8AW9hQdnQqS/6uGCyb6jiCx5pCLcepjeUPXyg4Kbl/Pb+TzlKOKTvgR8LDN/TlQOsS1VvqBrIKd/BhlBYBgW5zRIVTKmZOuwCM3wvmFQNadX5NBb4jFgwak/xk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SecLoS+DEaTac0ECwiEElJLviIiU9+OJiem4TnuJIhw=;
 b=jS0eUfiMHImQji5D/NyZ9SSuyISVGzs9S/lRPEMGLY8V7hg9h/3YV0a3E6lVhPrXQDs+0k8nrsfuQlj90gu+cvaSeMNAsg1HUWl5j332SzAfuzG58GsoTCf4bTel8K7TJeD1t7kjRiuax81rWVJcl7sZRwQOilBHq67Hj1MjEZZE5OJbGb9O3baJl06jF/1dIgEMqGJE8mXhiIP5akv/Upwze+pKmfiqb4+ddNkjFDe51dSa+/JTtrA2VI0ZFd4j3xg3TuWasmniIvn/9/7K5bTQFQ4Bj9MjCXfU8nYRV4rSONoskSu+kNegd9kSIx1YihKwGRfzOt4MqbIU8vFQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SecLoS+DEaTac0ECwiEElJLviIiU9+OJiem4TnuJIhw=;
 b=Fc4BYAcJ0bGNR6csHJmIIecleKUUpr0frmSyHLKtHrlHCONljvgsw1eLRquCCLMF/+e1V2NHo2JUTK0r+eYPOuoSi/gwcuaP5mNXvPnYvVcoetzRYGMo23bP2vsEgsooqYWxCLbSQ8Mne0wSOZcUkjL29mIuLhD57cqLMGcwePxv/thgGHb5ga2mODVchNxDaecCNPsKzvkJl49h50HEek3Ad0NyVABjAiA3NRu+lnqyBsj4nvRKwkZrO7t3YsA0zt6opIsofcP+FasxNVPC5YLiH9fmKMol9B/CCvAFu0s5yUGfbubUFc+6P+CMz7r1zKJqzx9avG/CTPOpgYGwMg==
Received: from CY4PR10MB1944.namprd10.prod.outlook.com (2603:10b6:903:124::10)
 by CY4PR10MB1559.namprd10.prod.outlook.com (2603:10b6:903:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 23 Jul
 2020 04:31:37 +0000
Received: from CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45]) by CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45%7]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 04:31:37 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH] stress-ng: create a symlink for /usr/bin/stress
Date: Thu, 23 Jul 2020 14:31:27 +1000
Message-Id: <20200723043127.2821063-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.25.4
X-ClientProxiedBy: SYBPR01CA0142.ausprd01.prod.outlook.com
 (2603:10c6:10:5::34) To CY4PR10MB1944.namprd10.prod.outlook.com
 (2603:10b6:903:124::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SYBPR01CA0142.ausprd01.prod.outlook.com (2603:10c6:10:5::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Thu, 23 Jul 2020 04:31:36 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 1AB054219D45; Thu, 23 Jul 2020 14:31:29 +1000 (AEST)
X-Mailer: git-send-email 2.25.4
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bf43b32-f3da-47ff-4fcf-08d82ec14992
X-MS-TrafficTypeDiagnostic: CY4PR10MB1559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB155968B1815961AA58CCE6BF90760@CY4PR10MB1559.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4MPoNzeocBGPgrygI7bpryyDmFFetMY6KyK6YDu+TNEg0o21uER9OHbNUBNtcIAvpe7pTAQOkUyYl/jtzj9htqKmDVMuHWluTUmAiQN77XySBglFZH0oS03U9BZcH5nsaybk/DVgE7sq9+3AMIlQ0C+Gmp9+kxjBdZavHHquEbgzXegXkQP4xZ7Jqxw+RdYVMSGqlGG14kbNghySU885u6YUHAPR93PCk37MkjmHEANipUgi7NwEoZbHh9UI1YruXoMKUpnpVH5m2IHQP592Srd7Pi+XbLZkJZ4sigvRas3NAP7+IVtViZZw++ifvaFY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR10MB1944.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39840400004)(396003)(366004)(376002)(136003)(346002)(66476007)(66556008)(66946007)(426003)(4744005)(52116002)(6916009)(2906002)(8676002)(478600001)(2616005)(4326008)(107886003)(8936002)(44832011)(186003)(83170400001)(36756003)(316002)(6266002)(42882007)(1076003)(42186006)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	hQn/Z2vosJP1wzjkWdoycT0SSl/h27X7O2uLjFDG1GpwBVl0X6DMiOA3UrHzddPAVoVzkglyJ19Ili9sFj+DMAQonKO/930wkdLAj2cwYX8y8gu1NKHncnsvo08B68aly2EaaLUzG5DI5ZDQ8lw6mYUjpNNn1YK6ZY3m8IIqPOFC40M2Xq436B42sHRtuZ9QYA/SaRn4lCdoAhBS36h3oU50dtBcTaYgXMwUTvud97GWPkvK1oRxxXnO8lRjI4ADSRxnELQgcsZMWXFmY3CpL5iOfSpqH1RH8/JXeaeXetLSRC8FJTApHTpBp2S0wYc8BVahJGQmTTSsBBZaXBUl/yBTaY3sdMSmNUvq4U0FPAJ35pK+eor2n7qj40q17uI1+o1TjyOSV3lcAZW/v4kePKuANWERYlHfOt1a4lXnr4PpfK/zeQW+Dw/YzGTuHb73pIs6vw+EXmIBodzbdOaWapweIt2Uv8XIQ0qf4R/MwIwH6CDKnTBI2hF4XN3roYFQPeoTs+epY5UMHLZTSa0JeFtdWpHBvyWEBzxu5AnuW7Q8/VchvCFih/WLQGROXvTZ
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf43b32-f3da-47ff-4fcf-08d82ec14992
X-MS-Exchange-CrossTenant-AuthSource: CY4PR10MB1944.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 04:31:37.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZTOtcuCf7Iushp39L2Yen+nMO029coIkAP6GLbKsJNxMx3j0bqSkhvHBB6cSb/HmrbBXlIl4FGIZa7PLiTWHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1559
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In commit 72641004, stress-ng was made to provide the stress package,
because it's backwards compatible with the old stress command. But it
doesn't actually provide /usr/bin/stress which is what other recipes
depending on stress will expect.

Symlink /usr/bin/stress to stress-ng so that it actually becomes
a drop-in replacement for stress.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
index 8ea0476db5..dcded1120d 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
@@ -22,5 +22,6 @@ inherit bash-completion
 
 do_install() {
     oe_runmake DESTDIR=${D} install
+    ln -s stress-ng ${D}/usr/bin/stress
 }
 
-- 
2.25.4

