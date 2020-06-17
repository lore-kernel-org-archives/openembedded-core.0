Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web12.3137.1592383027220225340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 01:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BSbQcMn7;
 spf=pass (domain: windriver.com, ip: 40.107.243.61, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC26KsY3/7Gwm17fYbT+22DotMIBjPkU3Cq1umT69CWFuBJUfz5CS0T2N2uhpzkWOgGo4AF5+HUqcRb6rfZbdYe8gfO0S6OCoPMaqyLJKGqk/aRWlbm1ENFUPgPVl8ddaK08IhxYxri6uW39XPdAh/NgeObKSKcsD2QUPChfazodE24HG1CjY2oFlUiRoD7JYioDyTNr2xxKGMQj5g1HVrWb5GOrKlJVCxeJkpdlfoQdPqgpJxMnIiR0TKHsGiE1WAaTa/3kwbcZbMoY0xCfb7FieVpjrxHd7JxSSGp+s/3B7hI3NvGsU5itbsgm1N/O9WyjmIVgrDccEkX2iqem1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swc6QpEMkwFj71v82RMo9+nqO19z6uBwTSHV9R2l4UA=;
 b=WF1jNMXlPkxxi/7E/r0xQf7OvQux9Ztndhvw8LvNlJAqtOEqSI8Jr4IwA0f+WDOycSKX8VF99w4XgLQqRAyZerMHueAsY3OCNrvtq0GOGd7usJV7GUz+efnYb3z1g9dM7j/LTynFeghqNvsnLGgvWyKQZ0dizdnEYe9ja38rI7i8flX/5UM/IEP63hQ0wMHP8WN8gn3up6XDhgKC/zkzbgtkt4rO6+YWVvEjllfj65hZ7eWWtn5byXEYerjPYVAcjxpo+fIHJmQ16lY5rADTS0ZfP1X/gO9TCVvvJCoPhXRE8I6BsbAUWY9vVHMdK9aQip9xNlQ1p+BntjaecRd0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swc6QpEMkwFj71v82RMo9+nqO19z6uBwTSHV9R2l4UA=;
 b=BSbQcMn78i/Kcqw1DDKt4rcK5YdotxIdVvkSzIjnCwO8xmO1oVaPOh7YQoPo9aIf0qalWLwWNy5CvH/n6L3+QVOLPG53VHoQCEWxWARvCAcA/Y5YSRw5NJ1DG65asvVKZgAJ4j8VmuZiDwn0qN3st/qUFGRzJmXI0aW7P/d9pzM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 08:37:05 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 08:37:05 +0000
Subject: Re: [OE-core] [PATCH] mime.bbclass: change postrm to prerm
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16194675630BCFB1.18675@lists.openembedded.org>
Message-ID: <044ec221-6fe9-62be-aa86-5304383d5438@windriver.com>
Date: Wed, 17 Jun 2020 16:36:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <16194675630BCFB1.18675@lists.openembedded.org>
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.10 via Frontend Transport; Wed, 17 Jun 2020 08:37:04 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40019280-4668-40f1-d4d5-08d812999d40
X-MS-TrafficTypeDiagnostic: SA0PR11MB4637:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB463717CA80E3536FEEAF7C6B829A0@SA0PR11MB4637.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:189;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yGl88bggydEVoxGWrK7IVJWkgTUs1uVE8XMtRxxKH+HKg76kDYRhjGWG0F6HMPE65gOmypNzOTVNguafyg3USFXUT0MpyzlebFASms9PcPIyJTfLlSPla6y6XJ5CiRwXgYvD7uPhkEELsgd/JgT2yM3dE1mNwX4b1S4WJLtzealYohiJ/QTDoGuzrJcbSVtSSlDP4+/hl1p30Dek3UwXqTsV6BRysbBmRHrTl2HqC8t9ME54RD1jjkB1xsSA2QjvdqQycon79WINpT6x1yNIdR2IJOr34xsq1HICDx3NCZaOcaaVw8Dk816FwrWXBvFteSv8lGqibKzhVCtbai1nT0WWyWf5x000E+IFrVBPK6bUZkuoLUaoC6lSoJWWx/TABdnGyXstM66seFpwVZ8wRs0esSIs2iHtoa9i7rBUT1bqag7IPW2GRbF7UasuBtpbIgTUTNxgBm9EIq4qsdjv8wP9wOU3h+DA+yClQ6WmCfsg7hiA+LapKBRdsQ3jSBQae7TR/4nGyAQ61KfI3UmxmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(346002)(366004)(39840400004)(8676002)(2906002)(31686004)(186003)(16526019)(26005)(166002)(966005)(36756003)(6916009)(956004)(44832011)(2616005)(8936002)(6706004)(6666004)(5660300002)(52116002)(478600001)(83380400001)(33964004)(31696002)(6486002)(16576012)(316002)(86362001)(66476007)(66556008)(66946007)(53546011)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	v5xTHuDW39JU2a/iqcfSIbMPwcACm7EsmIHDu7aQBxi/UlNrvQLG5A1c+r4p53FhKp4Ap8GEjb88LFbe7Ke7fS2MTag7QuBQpOmd8e4CDYd3LUY5xGMr65Eu8CW0unVTn9a1AcoMc27k8BmsOZ67KhjZUq8G5mu3oMgq4sE2JOHSATySGB65obO+SOlvqZdhJX0JUSeyGcrhdBS/rCJgdYBXnLbddSblBOgMlLYYJPm7CFIQBpIuKvUtn7lLMCqxxUWvGUEnemkENQ76YRi3zm9zoVV8+NSq6ahhwVcrtXTZm9loohEOXu93yLyK/w9ovyeiB/v5+9XCDnWbF1OxfoaxcCVCaM2Amkj6V8Uis5pMoSlBf/rEzdh6wUCr+I/kTj7nA0JesO9TtKdrwKHyPpL8iQT5ilU6SmKUCH4OUdHGfntM7f0SwBbntdat9GD/YPCPiPjlC8RzP/wscwA2nozT/vY3k2FBYUef+X9xe6c=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40019280-4668-40f1-d4d5-08d812999d40
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:37:05.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaGNBxOs9AO23fStNEApJfRMp2+Oyci3ENdswCBQ+aCrZXVKRmYoudeEAalDSoXNREpScGZyQO8WWWnUJ1ZtpzyuGDNIoL+qIKcv1kWW9ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
Content-Type: multipart/alternative;
 boundary="------------97EAE2FE1FE866CB6561C4A1"
Content-Language: en-US

--------------97EAE2FE1FE866CB6561C4A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

please ignore this patch,  I will send a V2 to fix this problem

On 6/17/20 4:07 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> fix error during post uninstall:
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
> + '[' 0 = 0 ']'
> + set -e
> + '[' x '!=' x ']'
> + echo 'Updating MIME database... this may take a while.'
> Updating MIME database... this may take a while.
> + update-mime-database /usr/share/mime
> Directory '/usr/share/mime/packages' does not exist!
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
> warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1
>
> when run post uninstall scriptlet, /usr/share/mime/packages has been
> removed during unintall, while update-mime-database need to use
> /usr/share/mime/packages/freedesktop.org.xml
>
> correct by change postrm to prerm
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/classes/mime.bbclass | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index c9072adf3b..a0943b4476 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -17,7 +17,7 @@ else
>   fi
>   }
>   
> -mime_postrm() {
> +mime_prerm() {
>   if [ "x$D" != "x" ]; then
>   	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
>   		mlprefix=${MLPREFIX} \
> @@ -42,17 +42,17 @@ python populate_packages_append () {
>                       mimes_types_found = True
>                       break
>           if mimes_types_found:
> -            bb.note("adding mime postinst and postrm scripts to %s" % pkg)
> +            bb.note("adding mime postinst and prerm scripts to %s" % pkg)
>               postinst = d.getVar('pkg_postinst_%s' % pkg)
>               if not postinst:
>                   postinst = '#!/bin/sh\n'
>               postinst += d.getVar('mime_postinst')
>               d.setVar('pkg_postinst_%s' % pkg, postinst)
> -            postrm = d.getVar('pkg_postrm_%s' % pkg)
> -            if not postrm:
> -                postrm = '#!/bin/sh\n'
> -            postrm += d.getVar('mime_postrm')
> -            d.setVar('pkg_postrm_%s' % pkg, postrm)
> +            prerm = d.getVar('pkg_prerm_%s' % pkg)
> +            if not prerm:
> +                prerm = '#!/bin/sh\n'
> +            prerm += d.getVar('mime_prerm')
> +            d.setVar('pkg_prerm_%s' % pkg, prerm)
>               if pkg != 'shared-mime-info-data':
>                   bb.note("adding shared-mime-info-data dependency to %s" % pkg)
>                   d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
>
> 

--------------97EAE2FE1FE866CB6561C4A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>please ignore this patch,&nbsp; I will send a V2 to fix this problem<br>
    </p>
    <div class="moz-cite-prefix">On 6/17/20 4:07 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16194675630BCFB1.18675@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

fix error during post uninstall:
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
&#43; '[' 0 = 0 ']'
&#43; set -e
&#43; '[' x '!=' x ']'
&#43; echo 'Updating MIME database... this may take a while.'
Updating MIME database... this may take a while.
&#43; update-mime-database /usr/share/mime
Directory '/usr/share/mime/packages' does not exist!
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1

when run post uninstall scriptlet, /usr/share/mime/packages has been
removed during unintall, while update-mime-database need to use
/usr/share/mime/packages/freedesktop.org.xml

correct by change postrm to prerm

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/classes/mime.bbclass | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-------
 1 file changed, 7 insertions(&#43;), 7 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..a0943b4476 100644
--- a/meta/classes/mime.bbclass
&#43;&#43;&#43; b/meta/classes/mime.bbclass
@@ -17,7 &#43;17,7 @@ else
 fi
 }
 
-mime_postrm() {
&#43;mime_prerm() {
 if [ &quot;x$D&quot; != &quot;x<a class="moz-txt-link-rfc2396E" href="mailto:];then$INTERCEPT_DIR/postinst_interceptupdate_mime_database${PKG}\mlprefix=${MLPREFIX}\@@-42,17&#43;42,17@@pythonpopulate_packages_append(){mimes_types_found=Truebreakifmimes_types_found:-bb.note(">&quot; ]; then
 	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
 		mlprefix=${MLPREFIX} \
@@ -42,17 &#43;42,17 @@ python populate_packages_append () {
                     mimes_types_found = True
                     break
         if mimes_types_found:
-            bb.note(&quot;</a>adding mime postinst and postrm scripts to %s&quot; % pkg)
&#43;            bb.note(&quot;adding mime postinst and prerm scripts to %s&quot; % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst &#43;= d.getVar('mime_postinst')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            postrm = d.getVar('pkg_postrm_%s' % pkg)
-            if not postrm:
-                postrm = '#!/bin/sh\n'
-            postrm &#43;= d.getVar('mime_postrm')
-            d.setVar('pkg_postrm_%s' % pkg, postrm)
&#43;            prerm = d.getVar('pkg_prerm_%s' % pkg)
&#43;            if not prerm:
&#43;                prerm = '#!/bin/sh\n'
&#43;            prerm &#43;= d.getVar('mime_prerm')
&#43;            d.setVar('pkg_prerm_%s' % pkg, prerm)
             if pkg != 'shared-mime-info-data':
                 bb.note(&quot;adding shared-mime-info-data dependency to %s&quot; % pkg)
                 d.appendVar('RDEPENDS_' &#43; pkg, &quot; &quot; &#43; d.getVar('MLPREFIX')&#43;&quot;shared-mime-info-data&quot;)
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------97EAE2FE1FE866CB6561C4A1--
