Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9983.1793274716239437634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=selector1 header.b=fbE3NEfm;
 spf=pass (domain: gehealthcare.com, ip: 40.93.198.64, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+ytFxHLwkvvC06ke2r2xVP9ER6yjXi1tKW0rHBuf3wUI2nnW4nXy66B/2OXCWBVJekdNQj8QaN6/YGgNxxQyIcqGsthr5PDrI47tOxiAGYXBcJvx93Q8E095blM45qq/vHqw9ROBbIkfusASyrWWLzWn3vsQrcINYNxKPv6q+Kg9YZv7rpzEP+oJVeyAy5ajTJf9/C77fsAnpPSUWh2ahnzIJpD6NR3qKw6ACLKWX8PpwmSunW7Te32GoDYYioMVuAtp9rNeH9ZMOfhAw7XxPh10WddHFQrc8jS2BnqTM7BcoxT0J+IDytCsoWlkafPVvFZ37WLWq24aCbag0HP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T20H5d7zXqnI1XbkoQWN2PcgPD9b5SdZyuyJVAc4s0Y=;
 b=qodGhr7Ezl/Meyt53LBR1PlgEKzZNw9fjFMfM3JLeVcd/6m0DVr9CzGDM13nNVLXHoHZuHHEzQT91tuNRxRhekcSGNn6qAC4UmNiPU2OgfL2E+oVaHSU4z8VNGzc7SjTvDETpr72IgBAR+zZyBTH6ruAKq/nIl3x/bRkb9TlgVfsr32RmsBTJ0xe1TfA4pjyQRScxXh6XXnOWbkdOpnAFDTExwbJ3UQ1ylIVTKq6fVKxV1AZjfUUemOr0ghRXrQk8OVsNp4cCSAse49qi+ZvDkTnkSsV4XXQga+WdTqUQmIGPnEtEpWZrIm08qBAmETvK5XEOj29qJyabTyIN3EROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T20H5d7zXqnI1XbkoQWN2PcgPD9b5SdZyuyJVAc4s0Y=;
 b=fbE3NEfm6ekCB8c7nvb9DP2PsWH1eUx0NZjsPPCbnLhRZQneL7DRsQxlnFuQa71KdoqDdxyttsnchxCKpKP6UeVqyLvK0W1MO8i67gKQnYh4aVfKiqtzLnkbURI5s+yzyDGLefIo9aeBz4O8k99VWYWjp1BM6bSASyySk/1lTz4rXZlf8wVsdCQn1FQwpLl0HNCYVDW0PLXgCeaE8rW+Mwo39+IQc7mEUofdMSP7l9lEYFkuN7YyqmTnMuA++XgWVwFtf3V/kpWpmFojcEe+YJZhORfn0yYu9rIwrog0Abz+vs9ubDMJUPozLa6/9PMqtCZ/NiN2gQmEULhWpQpejw==
Received: from MW4PR04CA0289.namprd04.prod.outlook.com (2603:10b6:303:89::24)
 by IA3PR22MB5805.namprd22.prod.outlook.com (2603:10b6:208:51a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 11:51:51 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::9d) by MW4PR04CA0289.outlook.office365.com
 (2603:10b6:303:89::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 11:51:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 11:51:50 +0000
Received: from cad3020129e1 (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 7CD9826D3C;
	Thu, 29 Oct 2026 13:51:48 +0200 (EET)
Date: Thu, 29 Oct 2026 13:51:48 +0200
From: Maxin John <maxin.john@gehealthcare.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] uki.bbclass: use f-string for kernel-not-found error
 message
Message-ID: <auMzVOVVpRskKkDP@cad3020129e1>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
 <20261027081221.13-2-maxin.john@gehealthcare.com>
 <d367c259a241a33364960b8401e25e6e6ad465e8.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d367c259a241a33364960b8401e25e6e6ad465e8.camel@pbarker.dev>
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|IA3PR22MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 6150fc3d-07e8-42ea-96ca-08df35b304c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|261028144727099003|261026140227099003|11063799006|4143699003|261009223027099003|261021123027099003|261022105027099003|261022075727099003|261022115727099003|10067099003|261021121427099003|56012099006|18002099003|22082099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: xAhPEoL8zYj4TWeNdjEDuLKINSqIqWwwzgsiOtu09m2tENSwDgFxZtttTytTg+akQKcstbTucjGC3e1oUD/61L4fM8LMI9JAeR0PZG15r3nd2myum55egLoXJZb1neZYNaq5pvgbuX6FAOsPCIeVHoWU2cdSawmhegv82L0m46Dzl2+Q9am6imDPaMz/lu1aXklpB9MVECSEX0JyEmxyJXzHuPvlTTB5kMoFDIaBtUjTEiPZXoSQh94vnkNdc+ODNbN9XEOUv75COWAtUtyL9anweXQofSDEFjiQRTyKh1XtCx0gDcn/gFXNFBYdWktz3XswEq2SPbx86Yj+wrZIYr5gJswOltHiHuHG3eQDOvtaTp+c1XfsdBIv8bj99m4XGDRu5JeZ55HPanQ7qPkabME+Xe5RqWwKsXw9AfjM1P07ZjuUGi6GpFf1MXZRlFwfcc3vJ6Z06teoBjNqm5Kw3t42pQ+b4LAFi3F/kiuDnhesKSihU+5znG0oKtdya8BwI4TQaPwx3Bpax+XNBeDj4E/H6oUX7kHKwItQxajEehtcoTn1IY+w6UNXCfdofXxQwv6yUgRmYhohAWiPjCny1vJvs54bJ9Xq/Uq17Q46u01GB+9Jh7cPU5IOeJqY18E8aDK7NuzQkETy8i43dIA5EJouZ2AldzUGgM+RYtrIGzxNsIQyn/L6opRRJyCqr99T+LNBuKydxOpPlhhZFABd4g==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261028144727099003)(261026140227099003)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(261022105027099003)(261022075727099003)(261022115727099003)(10067099003)(261021121427099003)(56012099006)(18002099003)(22082099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CGTU4jBNvSJaLgd9M9wazSy5mgs7pXjprtd9zvIUoWYTE1fz714qIjvMe5MT1v4oeDf+OsqqTFZN8zriRY2iZwMQpLIfSFH8YShreWkc1xbMDVsyqe8iPljEU67xxjH7msnQFNRPpRf0wbAjQdnyfs7AsAPLobbuFs4CcGiB49k3gz/2kEMlAbf+e/9c4H2g3TyECrVOfT3NyhcFxcTBkKQNkVRn/NvzCWHYOAyVGqZ42YwXlqQnY0QAtkIIbT6pyAXNEsABjgtUGkOai2aumDCCXDs9v5tQz6bJv7vIQcN18d4ulUrctRqeMlWKhuPXNPkEXLD4HPSIi5CvC5XFzyDo0qSLlgZf3K3jvDucpaejjMDQjpnv9UCOCPhhmQunmA0mI+Zn9BrgqIXB28rthQKpF55WBkRASdaAzq6/Cyf0W4/TYM8gYciSbt7tiuan
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:51:50.3179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6150fc3d-07e8-42ea-96ca-08df35b304c4
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR22MB5805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248940

Hi Paul,

On Thu, Oct 29, 2026 at 11:30:54AM +0000, Paul Barker wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook???s ???Report??? button.
> 
> On Tue, 2026-10-27 at 10:12 +0200, Maxin John wrote:
> > The message was an f-string without placeholders combined with
> > '%'-formatting. Use a single f-string referencing the kernel variable.
> >
> > Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
> > ---
> >  meta/classes-recipe/uki.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> > index 566eab1eaa..cfb930e93d 100644
> > --- a/meta/classes-recipe/uki.bbclass
> > +++ b/meta/classes-recipe/uki.bbclass
> > @@ -138,7 +138,7 @@ python do_uki() {
> >      if kernel_filename:
> >          kernel = "%s/%s" % (deploy_dir_image, kernel_filename)
> >          if not os.path.exists(kernel):
> > -            bb.fatal(f"ERROR: cannot find %s" % (kernel))
> > +            bb.fatal(f"ERROR: cannot find {kernel}")
> 
> Could we drop the f-string prefix instead? String formatting with '%' is
> used more often here.

Sure, I will send a v2.
 
> Best regards,
> 
> --
> Paul Barker

Best Regards,
Maxin 
