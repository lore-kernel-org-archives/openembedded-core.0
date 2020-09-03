Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.53])
 by mx.groups.io with SMTP id smtpd.web12.10158.1599125595743490114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 02:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ILjIRW95;
 spf=pass (domain: windriver.com, ip: 40.107.237.53, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTzWEteLPbAZ5XeFLzMcLSfACernRHT1bAhR9w+cZcbH7cOHK2Hd5LLituwqBBU1B11tkQ+yE7b5eXf7XwCLhvB4MFkVMcuzFo61npGE+txO6b6FW+BQQoU2etGIY3Bnv4aa/H4nGyoECuWVg5Qe/zWH1HbBjl57VEwkBjSr0+63tOgL/yiWFnc7jpOEaQyn8Vo6HpU279a3S5JE877wta7mTzipsq63jeXvHif6qVclGwVUuxYxZQHxEBZ2SlRPmHEz6/xyLnb02gUEjDMmtuG60l+z/kbr5ZHn3PWoyVJz4Yr18k4ItOPyUR+HaqRHLutO79FJbKibFKezqKCXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgSKPBah+HZWVszghAUkWXFvuBSBbN5Ooff7XaYaLS0=;
 b=aC/qI1dSL1u6eOLbuv4mrK3rNMnDOpojXqApvrPOyO5x1SlzcRdgfDsCdE/kjtrsJHwjOrgNs/2O92TEBzyjNgR4jUbfibMfCAH3ytwz6EfORo2O0D7fHTo3sscNxQzcC+zmPkww5ZyJOcec/BkOygXLF4xEQYY9CF9EtofSckKFho7Lpbwl17uiG0KergPF76QQLuwg5rdVAr/cKhZQwRVZRm1cDCzf3Xvav5Zais6+vsDnW/j61tMJnVdtyqwG/CPlZM2srT1h89n/wUS6PRqAtrVuhuFGZPg5+3RrdrceVEjrkWfG3JHhpOqLifByHcPcmHFBNl7qb9iEM0saXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgSKPBah+HZWVszghAUkWXFvuBSBbN5Ooff7XaYaLS0=;
 b=ILjIRW95jXNQaIXGC5uMN+Ar9IrqxHdOw3YPGY6+ciftjTRfRAPlIVB4fX1LDxAqfVNgsXPgSoQ+IV8QdaGycvlGkkCKLpxHsA6hGN4OESO4AiHuHgcWOyF3lYYHUFvWah1NnPhzNdTIxBOgAZ6BnF+Q+HHrcybDdNsVZ83dJ58=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 09:33:13 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3%5]) with mapi id 15.20.3348.015; Thu, 3 Sep 2020
 09:33:13 +0000
Subject: Re: [OE-core][PATCH] rpm: fix nativesdk's default var location
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>,
 "Richard Purdie (richard.purdie@linuxfoundation.org)"
 <richard.purdie@linuxfoundation.org>
References: <20200716065632.33861-1-Qi.Chen@windriver.com>
 <a3f71396a0fa4f298cecd67fb3240e09@G08CNEXMBPEKD05.g08.fujitsu.local>
 <1ce32dba-e532-1049-387d-58d7e1bbbe7f@windriver.com>
 <fbcc3a839b0642d59c5752aab274e5eb@G08CNEXMBPEKD05.g08.fujitsu.local>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <5a7e4b30-b2e6-3ab5-8dcd-077a619e9913@windriver.com>
Date: Thu, 3 Sep 2020 17:38:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <fbcc3a839b0642d59c5752aab274e5eb@G08CNEXMBPEKD05.g08.fujitsu.local>
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 09:33:11 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e54d72b-83c3-4e0d-b200-08d84fec60e5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4401AA9C133E6E0FA3BA7531ED2C0@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zACyHt/sr9SJ3U7BbOqDd4dPy2Z1mpIN6UlV8OCfOhmhKjEbC50lsogJ4AY+WeCRk72rJ83IuDGRsjhqlhP2XgmQ3hr452udP7ot5vHzS1W4/8Y7PVUBBSo62xifGw2HXszxXO3aN6vgS3Ixz4a7/ABxB/DqKzjrnbi6sUOL+rQRJWyuROluhBS0Tw4yamHE9YbduKwshr0cPTdU94O02iR0eo83WBkg79zloWfr8Uywzm6yTZezm9fSKwmubny0sa7zjlFnF9jtCNONxQv8lkVtLYzpziHvj6t9iuP4i5EoTnUd/YaInof+rys4j/gfVPdwTrzdut8tkfcuMBKYGovsE7Ewnrtj71LftpBAGi+rH1jgRvHyqjQiATfeSaA+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(30864003)(8676002)(66946007)(6486002)(478600001)(186003)(52116002)(83380400001)(33964004)(26005)(66476007)(956004)(4326008)(31686004)(66556008)(2906002)(6666004)(31696002)(16576012)(53546011)(110136005)(316002)(5660300002)(36756003)(8936002)(2616005)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BjaTd1TOfgADvsfP2irmRa5eKqxzn4HXYmLg/fxRXPSitO1SG1w5HalpI6LfQ+WqGlJBjdDQcfC916qzcQYvvIirnWi7cCfZgAlPDbHZUVmp1y/bA71wrYmnxkZdlb6pJyY5+miNardbFUewAPu/qUKWEPYABtuj/Of4MH+RhVZ5MxorhoJao6qgmjG2leHIVvROnGLC1KrE6d3A07PU9DLuKOPkwMsFwWHb5WJX7fTIXzL1B1SqEJn3PzqP9WYpJlT0leQ4mbEgVkBUZXbC/KyakorhxibqergVV4KvySSakqlQGEpbllZc/9dIbNZa1tiDa+JK/5/8FpXx3A/BNszJ0N82ML3ZWWpqL9Mg1zXsl403ZLRn7hu3FbzTP2ydVRWQRQUNoyKkfbiF+UoDaF9hg5VjaBHFIHlINoSTIeVC/7OpJH6IINjN/7J/uToSKpN1TXv31CT5EqDnBj7BG7xizGluB5xL8TuVHUyBdyU62Ibwh3auG3njVOsYnoU4kVdTWy/kHPjMO6ZjlCNLh9Nfp/1UVYewnMERjX/uCU3y2a0U7gkIcrixpBi/wbNxEbmPSjy6gLGLZlzQGo+M0pDDXpbu54CAb8sBF32/lur4xDngrMme/5IEzgZaIxathvpiexLEjHBo4iNBk4zorg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e54d72b-83c3-4e0d-b200-08d84fec60e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 09:33:13.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBDGUPk+8rq9dxXUVNyZZ8lCUjNHA7Qfqz2V6RHPx4+qPtkCyGmQwgUCIj/ns/ypWShdR+5jOcczw8XpNulGLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
Content-Type: multipart/alternative;
 boundary="------------2AE6ACEF872E63CC5601588C"

--------------2AE6ACEF872E63CC5601588C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/03/2020 04:53 PM, Lei, Maohui wrote:
>
> Hi, Chen
>
> > Besides, checking the macros file, it has already set %_usr, 
> %_prefix, %_libdir to point to locations under SDK. I think that also 
> implies that it's not supposed to be used with '--root'. And that's we 
> should do the same for %_var.
>
> “it has already set %_usr, %_prefix, %_libdir to point to locations 
> under SDK” is just because %_usr and %_libdir are not necessary for rpm,
>

Hmm... I really doubt this. If they are unnecessary, why rpm gives user 
choice to configure them?
I suspect they should have effect on at least rpmbuild.

> so they are not set in EXTRA_OECONF_append_class-nativesdk and 
> EXTRA_OECONF_append_class-native. After all, nobody likes to do 
> unnecessary works. And the same as native-rpm, nativesdk-rpm only sets 
> %s_etc and %_var, just because they are necessary config.
>
> Besides, with nativesdk-rpm –help, you can get “--root” option, but 
> users can’t use it. I think it doesn't make sense.
>

 From your description, I guess the problem you met is that you want to 
use nativesdk-rpm to do package management or generate a rootfs.
You can add in ROOTFS/etc/rpm/macros "%_var /var", so that the default 
value of nativesdk-rpm is overridden.

Regards,
Chen Qi

> Best regards
>
> Lei
>
> *From:*openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Chen Qi
> *Sent:* Thursday, September 3, 2020 2:52 PM
> *To:* Lei, Maohui <leimaohui@cn.fujitsu.com>; Richard Purdie 
> (richard.purdie@linuxfoundation.org) <richard.purdie@linuxfoundation.org>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH] rpm: fix nativesdk's default var location
>
> Hi Lei,
>
> The rpm in SDK uses a wrapper, and looking at the settings I don't 
> think it's supposed to be used with '--root'.
>
> export RPM_CONFIGDIR=`dirname $realpath`/../lib/rpm 
> RPM_ETCCONFIGDIR=${RPM_ETCCONFIGDIR-`dirname $realpath`/../../etc/..} 
> MAGIC=`dirname $realpath`/../share/misc/magic.mgc 
> RPM_NO_CHROOT_FOR_SCRIPTS=1
> exec -a "$0" $realdir/rpm.real "$@"
>
> Besides, checking the macros file, it has already set %_usr, %_prefix, 
> %_libdir to point to locations under SDK. I think that also implies 
> that it's not supposed to be used with '--root'. And that's we should 
> do the same for %_var.
>
> Regards,
> Chen Qi
>
> On 09/03/2020 01:40 PM, leimaohui wrote:
>
>     Hi,
>
>     I'm sorry but I don't understand this patch.
>
>             error: cannot open Packages index using db5 - Permission denied (13)
>
>             error: cannot open Packages database in /var/lib/rpm
>
>     I think these two error messages is just because invoking nativesdk-rpm without "--root=":
>
>     -------------------------------------------------
>
>     $ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm
>
>     error: cannot open Packages index using db5 - Permission denied (13)
>
>     error: cannot open Packages database in /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/var/lib/rpm
>
>     drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
>
>     -rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
>
>     ...
>
>     Same as nativesdk-gcc adding "--sysroot=", nativesdk-rpm should be invoked with "--root=":
>
>     --------------------------------------------------
>
>     $ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm --root=/home/leimh/test-rootfs/
>
>     drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
>
>     -rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
>
>     ......
>
>     But now with this patch, "--root=" doesn't work for nativesdk-rpm. Even I use nativesdk-rpm with "--root=", the database of nativesdk-rpm still is written to ${SDK_INTALL_DIR}/var/lib/rpm/,  not the directory that I set by "--root=".
>
>     Best regards
>
>     Lei
>
>         -----Original Message-----
>
>         From:openembedded-core@lists.openembedded.org
>         <mailto:openembedded-core@lists.openembedded.org>  <openembedded-
>
>         core@lists.openembedded.org <mailto:core@lists.openembedded.org>> On Behalf Of Chen Qi
>
>         Sent: Thursday, July 16, 2020 2:57 PM
>
>         To:openembedded-core@lists.openembedded.org
>         <mailto:openembedded-core@lists.openembedded.org>
>
>         Subject: [OE-core][PATCH] rpm: fix nativesdk's default var location
>
>         For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is '/var'. This is
>
>         causing error when running `rpm -qplv A.rpm'.
>
>             error: cannot open Packages index using db5 - Permission denied (13)
>
>             error: cannot open Packages database in /var/lib/rpm
>
>         The rpm in SDK should be using its own database. So we should remove this
>
>         configure option, letting the SDK's native sysroot prefix to be there in %_var. In
>
>         fact, '%_usr' in macros has already got the prefix.
>
>         After this change, we have in the macros file lines like below.
>
>         """
>
>         %_usr                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
>
>         linux/usr
>
>         %_usrsrc                %{_usr}/src
>
>         %_var                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
>
>         linux/var
>
>         """
>
>         Signed-off-by: Chen Qi<Qi.Chen@windriver.com> <mailto:Qi.Chen@windriver.com>
>
>         ---
>
>           meta/recipes-devtools/rpm/rpm_4.15.1.bb | 2 +-
>
>           1 file changed, 1 insertion(+), 1 deletion(-)
>
>         diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-
>
>         devtools/rpm/rpm_4.15.1.bb
>
>         index cbe1acffe2..b5a0ac9382 100644
>
>         --- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
>
>         +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
>
>         @@ -67,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls --
>
>         disable-openmp"
>
>           # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via
>
>         session dbus even when plugins support is enabled.
>
>           # Also disable plugins by default for native.
>
>           EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --
>
>         localstatedir=/var --disable-plugins"
>
>         -EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --
>
>         localstatedir=/var --disable-plugins"
>
>         +EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --disable-
>
>         plugins"
>
>           BBCLASSEXTEND = "native nativesdk"
>
>         --
>
>         2.17.1
>
>
>
>


--------------2AE6ACEF872E63CC5601588C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/03/2020 04:53 PM, Lei, Maohui
      wrote:<br>
    </div>
    <blockquote cite="mid:fbcc3a839b0642d59c5752aab274e5eb@G08CNEXMBPEKD05.g08.fujitsu.local" type="cite">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:等线;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@等线";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML 预设格式 字符";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
span.HTML
	{mso-style-name:"HTML 预设格式 字符";
	mso-style-priority:99;
	mso-style-link:"HTML 预设格式";
	font-family:Consolas;
	color:black;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:等线;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1782068602;
	mso-list-type:hybrid;
	mso-list-template-ids:-541952960 -625542180 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:等线;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi, Chen<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">&gt; Besides, checking the macros file, it
          has already set %_usr, %_prefix, %_libdir to point to
          locations under SDK. I think that also implies that it's not
          supposed to be used with '--root'. And that's we should do the
          same for %_var.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">“it has already set %_usr, %_prefix,
          %_libdir to point to locations under SDK” is just because
          %_usr and %_libdir are not necessary for rpm,</p>
      </div>
    </blockquote>
    <br>
    Hmm... I really doubt this. If they are unnecessary, why rpm gives
    user choice to configure them?<br>
    I suspect they should have effect on at least rpmbuild.<br>
    <br>
    <blockquote cite="mid:fbcc3a839b0642d59c5752aab274e5eb@G08CNEXMBPEKD05.g08.fujitsu.local" type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"> so they are not set in
          EXTRA_OECONF_append_class-nativesdk and
          EXTRA_OECONF_append_class-native. After all, nobody likes to
          do unnecessary&nbsp;works. And the same as native-rpm,
          nativesdk-rpm only sets %s_etc and %_var, just because they
          are necessary config.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Besides, with nativesdk-rpm –help, you can
          get “--root” option, but users can’t use it. I think it
          doesn't make sense.
          <br>
          <br>
        </p>
      </div>
    </blockquote>
    <br>
    From your description, I guess the problem you met is that you want
    to use nativesdk-rpm to do package management or generate a rootfs.<br>
    You can add in ROOTFS/etc/rpm/macros &quot;%_var /var&quot;, so that the
    default value of nativesdk-rpm is overridden.<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:fbcc3a839b0642d59c5752aab274e5eb@G08CNEXMBPEKD05.g08.fujitsu.local" type="cite">
      <div class="WordSection1">
        <p class="MsoNormal">
          <o:p></o:p></p>
        <p class="MsoNormal">Best regards<o:p></o:p></p>
        <p class="MsoNormal">Lei<o:p></o:p></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;font-family:等线;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;font-family:等线;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm
          0cm 0cm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:windowtext">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:windowtext">
                  <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
                  <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
                  <b>On Behalf Of </b>Chen Qi<br>
                  <b>Sent:</b> Thursday, September 3, 2020 2:52 PM<br>
                  <b>To:</b> Lei, Maohui
                  <a class="moz-txt-link-rfc2396E" href="mailto:leimaohui@cn.fujitsu.com">&lt;leimaohui@cn.fujitsu.com&gt;</a>; Richard Purdie
                  (<a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>)
                  <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
                  <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
                  <b>Subject:</b> Re: [OE-core][PATCH] rpm: fix
                  nativesdk's default var location<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <div>
            <p class="MsoNormal">Hi Lei,<br>
              <br>
              The rpm in SDK uses a wrapper, and looking at the settings
              I don't think it's supposed to be used with '--root'.<br>
              <br>
              export RPM_CONFIGDIR=`dirname $realpath`/../lib/rpm
              RPM_ETCCONFIGDIR=${RPM_ETCCONFIGDIR-`dirname
              $realpath`/../../etc/..} MAGIC=`dirname
              $realpath`/../share/misc/magic.mgc
              RPM_NO_CHROOT_FOR_SCRIPTS=1<br>
              exec -a &quot;$0&quot; $realdir/rpm.real &quot;$@&quot;<br>
              <br>
              Besides, checking the macros file, it has already set
              %_usr, %_prefix, %_libdir to point to locations under SDK.
              I think that also implies that it's not supposed to be
              used with '--root'. And that's we should do the same for
              %_var.<br>
              <br>
              Regards,<br>
              Chen Qi<br>
              <br>
              On 09/03/2020 01:40 PM, leimaohui wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Hi,<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>I'm sorry but I don't understand this patch. <o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>&nbsp;&nbsp; error: cannot open Packages index using db5 - Permission denied (13)<o:p></o:p></pre>
              <pre>&nbsp;&nbsp; error: cannot open Packages database in /var/lib/rpm<o:p></o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>I think these two error messages is just because invoking nativesdk-rpm without &quot;--root=&quot;:<o:p></o:p></pre>
            <pre>-------------------------------------------------<o:p></o:p></pre>
            <pre>$ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm<o:p></o:p></pre>
            <pre>error: cannot open Packages index using db5 - Permission denied (13)<o:p></o:p></pre>
            <pre>error: cannot open Packages database in /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/var/lib/rpm<o:p></o:p></pre>
            <pre>drwxr-xr-x&nbsp;&nbsp;&nbsp; 2 root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 Jun 19&nbsp; 2018 /etc<o:p></o:p></pre>
            <pre>-rw-r--r--&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 642 Jun 19&nbsp; 2018 /etc/xattr.conf<o:p></o:p></pre>
            <pre>...<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Same as nativesdk-gcc adding &quot;--sysroot=&quot;, nativesdk-rpm should be invoked with &quot;--root=&quot;:<o:p></o:p></pre>
            <pre>--------------------------------------------------<o:p></o:p></pre>
            <pre>$ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm --root=/home/leimh/test-rootfs/<o:p></o:p></pre>
            <pre>drwxr-xr-x&nbsp;&nbsp;&nbsp; 2 root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 Jun 19&nbsp; 2018 /etc<o:p></o:p></pre>
            <pre>-rw-r--r--&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 642 Jun 19&nbsp; 2018 /etc/xattr.conf<o:p></o:p></pre>
            <pre>......<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>But now with this patch, &quot;--root=&quot; doesn't work for nativesdk-rpm. Even I use nativesdk-rpm with &quot;--root=&quot;, the database of nativesdk-rpm still is written to ${SDK_INTALL_DIR}/var/lib/rpm/,&nbsp; not the directory that I set by &quot;--root=&quot;.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Best regards<o:p></o:p></pre>
            <pre>Lei<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>-----Original Message-----<o:p></o:p></pre>
              <pre>From: <a moz-do-not-send="true" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> &lt;openembedded-<o:p></o:p></pre>
              <pre><a moz-do-not-send="true" href="mailto:core@lists.openembedded.org">core@lists.openembedded.org</a>&gt; On Behalf Of Chen Qi<o:p></o:p></pre>
              <pre>Sent: Thursday, July 16, 2020 2:57 PM<o:p></o:p></pre>
              <pre>To: <a moz-do-not-send="true" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><o:p></o:p></pre>
              <pre>Subject: [OE-core][PATCH] rpm: fix nativesdk's default var location<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is '/var'. This is<o:p></o:p></pre>
              <pre>causing error when running `rpm -qplv A.rpm'.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>&nbsp;&nbsp; error: cannot open Packages index using db5 - Permission denied (13)<o:p></o:p></pre>
              <pre>&nbsp;&nbsp; error: cannot open Packages database in /var/lib/rpm<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>The rpm in SDK should be using its own database. So we should remove this<o:p></o:p></pre>
              <pre>configure option, letting the SDK's native sysroot prefix to be there in %_var. In<o:p></o:p></pre>
              <pre>fact, '%_usr' in macros has already got the prefix.<o:p></o:p></pre>
              <pre>After this change, we have in the macros file lines like below.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>&quot;&quot;&quot;<o:p></o:p></pre>
              <pre>%_usr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-<o:p></o:p></pre>
              <pre>linux/usr<o:p></o:p></pre>
              <pre>%_usrsrc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %{_usr}/src<o:p></o:p></pre>
              <pre>%_var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-<o:p></o:p></pre>
              <pre>linux/var<o:p></o:p></pre>
              <pre>&quot;&quot;&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Signed-off-by: Chen Qi <a moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a><o:p></o:p></pre>
              <pre>---<o:p></o:p></pre>
              <pre> meta/recipes-devtools/rpm/rpm_4.15.1.bb | 2 +-<o:p></o:p></pre>
              <pre> 1 file changed, 1 insertion(+), 1 deletion(-)<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-<o:p></o:p></pre>
              <pre>devtools/rpm/rpm_4.15.1.bb<o:p></o:p></pre>
              <pre>index cbe1acffe2..b5a0ac9382 100644<o:p></o:p></pre>
              <pre>--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb<o:p></o:p></pre>
              <pre>+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb<o:p></o:p></pre>
              <pre>@@ -67,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = &quot; --disable-nls --<o:p></o:p></pre>
              <pre>disable-openmp&quot;<o:p></o:p></pre>
              <pre> # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via<o:p></o:p></pre>
              <pre>session dbus even when plugins support is enabled.<o:p></o:p></pre>
              <pre> # Also disable plugins by default for native.<o:p></o:p></pre>
              <pre> EXTRA_OECONF_append_class-native = &quot; --sysconfdir=/etc --<o:p></o:p></pre>
              <pre>localstatedir=/var --disable-plugins&quot;<o:p></o:p></pre>
              <pre>-EXTRA_OECONF_append_class-nativesdk = &quot; --sysconfdir=/etc --<o:p></o:p></pre>
              <pre>localstatedir=/var --disable-plugins&quot;<o:p></o:p></pre>
              <pre>+EXTRA_OECONF_append_class-nativesdk = &quot; --sysconfdir=/etc --disable-<o:p></o:p></pre>
              <pre>plugins&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre> BBCLASSEXTEND = &quot;native nativesdk&quot;<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>--<o:p></o:p></pre>
              <pre>2.17.1<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <p class="MsoNormal"><br>
              <br>
              <br>
              <o:p></o:p></p>
            <pre><o:p>&nbsp;</o:p></pre>
          </blockquote>
          <p><o:p>&nbsp;</o:p></p>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------2AE6ACEF872E63CC5601588C--
