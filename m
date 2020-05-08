Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.40])
 by mx.groups.io with SMTP id smtpd.web10.5060.1588912473843327854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 21:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HoT6mx9U;
 spf=pass (domain: windriver.com, ip: 40.107.68.40, mailfrom: wenlin.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODtZlW5bPdyMU0DLhyj6EDOu9TONFL5kTO/isNnavAr+Tjvm/kXcRGGA+5aSZWd/q8EWURvTc0scYr/iVz9qaZuTpXaE4WuTb6PYl+a8qBE8pQYGMBYvwfyZ80EkSCD+QokfLF1Rb4Jm2DEyWPGhPoRwrX70WJ1/F2+SYmoBDEVmbxP2jiNhcubiT09KrT+McRtq2caYYMrVjZnjuh4FnLvSFQtX7nJWMv3BAbdkw8juyllcp114BK02GrCDkh4Y36HVQGPy/zkw6xqDY4zB8wu4MKOz5fC6Gja3sXfZvWW/Q/QlMD6mqMrk+NDjWG+28DK7SVtcgUekZZHeASCo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiroHswcfY7IIbTI7QmIVbaQHwCTBqAlNJvmhU7bYpQ=;
 b=AGrZmdrWWMrluT71Ce2FsxJN5cLwdf7BPit5iEftmlGaNXOmytMxoEgD4CK82HDa8B7YRkng8NqMd6FUO8GziyXILZVJ+/e+PVvyBjvUAmjleWTd/B2GyQg19XLpMxD+OKRY3T/PmeLBEoBifrL8ynEW/iWp/xYBuKYSHdtQitI/GCsC7gVd6FYFTZ75qCRrwh+ESDhkYw1PkdZzVHzyZKpR1kr/Qo0/ZJgelGawIRetbINpP2cTxp8jQeOznhe86i7Cwn4qnl109m1koF9j6JEWmf1t+aWbQRk+hROe1JGuGFI2YOJTPiDQofVxmcx9qWXG2U/ZYQrBo6HsYk5R2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiroHswcfY7IIbTI7QmIVbaQHwCTBqAlNJvmhU7bYpQ=;
 b=HoT6mx9UB1K8j4KCk6djMtghcE6FfYLt7WCBDb+LWekiuEN5CZg/h8FgiPzLVQsimAjfvQG5zO+XEQ1NT6XIaNbHuqIJTaHwLIyx7bYv1jBFspL96JMjNIfipbIUXsHI4d17878SYiFxpYU2fQ+w8redXMxLyi3J1GbnoabJHQU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2658.namprd11.prod.outlook.com (2603:10b6:406:ae::16)
 by BN7PR11MB2756.namprd11.prod.outlook.com (2603:10b6:406:b4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 8 May
 2020 04:34:31 +0000
Received: from BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::9811:9cc4:3eb0:c27a]) by BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::9811:9cc4:3eb0:c27a%4]) with mapi id 15.20.2979.028; Fri, 8 May 2020
 04:34:31 +0000
Subject: Re: [OE-core][zeus][PATCH] populate_sdk_base.bbclass: fix warning: name not matched
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20200506084629.120567-1-wenlin.kang@windriver.com>
 <2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com>
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
Message-ID: <d2ab7e09-e870-7382-f218-a1fdbe66840a@windriver.com>
Date: Fri, 8 May 2020 12:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To BN7PR11MB2658.namprd11.prod.outlook.com
 (2603:10b6:406:ae::16)
Return-Path: wenlin.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.167] (60.247.85.82) by BYAPR08CA0049.namprd08.prod.outlook.com (2603:10b6:a03:117::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Fri, 8 May 2020 04:34:30 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4159ae1-5e39-4251-6b94-08d7f30919fe
X-MS-TrafficTypeDiagnostic: BN7PR11MB2756:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB27569EBD52CFBD32C18ABADFE1A20@BN7PR11MB2756.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mRL2BvgY3Z3SQW2dd5h3IuBEvpj1RhLx7lNcT6E7fOHbr382+seU7HXwHjkUtGb2ZSdBbpMooCKzxXUNG5iUBEzUaq/xt3UASWBWIdaCoQ/BTvf0UR1gySPThtxRtseRTT/N9je8fRP9mLW6bjZl8tFp1ij9V7ic2mEM8T2cU2bOQC46GjR5jDfFfRibXdlRGmL2jwJ4smjysBxVRi+nr65liiXuVtik95uTKIFyDwvpeq36Rx28IoMlUawr8cNZ5B45nQE4/dFQslYvmD2PnUg/OC95KJG1YER9zP8cxF2wPNXBp0N7PJ/uOqr4Pm/04teQ1tEYfRTU9SWhYGguS91X3JrccP87AMHIXXk1afHiC9K5EQNjaMNgc0cyY4qIMHx2Wzwgj9CBAtC5J5znr2mLdhPRwA4n59sVJvw/tFlOTtuE+Tb/7sVT7MSX6G1QqK0220PDZ8x//474D7UCiDzQED1FgnkjvkMGIRxRXUuStuBTHQWUKkbnNdflDqA/y2MD8KHqyvyqqO0YaCstRMt65AJcgl9bs3H8Ay3PqDOq/RscZoZ6jkkyV7q0MMd8uJenxq/BzpMOoDg7B+WqRq+A+bvct5V57c1R4Cl0dSkfCOMPcSUT59MJ6E/I0LQvC3dBlvK6VoJLV6v/Vd3Fqip67YDOQ7M+iglENQJEGAxJNiQLLN0WgIL3C5p/APrbW4nHfXw0GIk7DgZOpkQYAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(136003)(346002)(33430700001)(478600001)(83300400001)(83290400001)(52116002)(83310400001)(83320400001)(83280400001)(16526019)(166002)(186003)(6486002)(956004)(2616005)(36756003)(966005)(5660300002)(16576012)(8676002)(6706004)(33964004)(8936002)(66476007)(66946007)(110136005)(31686004)(2906002)(316002)(86362001)(66556008)(26005)(33440700001)(31696002)(44832011)(6666004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1m+dfEGAYvaXShQD7GNVHrOwUrOdgAHJlH1TMDcewOu2JpV+IPXx6CwUrtF0pwi6RwOv4S6hjzWUgDbAzsCd5X4U6iPgi0vaY+65rjUTh9oVBreVGcgvQp+vljsRpL6bEJHzycjBeC7uCHYheo7PEYQp8FNC/zeLlq3DI7AK08Q3R64dtxG3ngdSkxb8mGzO2BCuBXhh41lksu4VGrU98Z938Mzt8zTrDE7Xu9pQ0HK4OO/yM/rnX4+8jVY1oaAUyqudWGIfzCSdUcNYyLIpWZeq9Q9UZ83d/gu0JRtppsTPrvmCaxCUbfrCUMqnqHtL6jivRrsdXdaeuRleufB4PPQ4W+fuMha12UEq/IeHBsNZ/2AXdjbV078QX38uF6wM0mPywpRlnX2mqhD4+o/Tsv7iuvyK2061zkY6MceK7oz783MeNVzcH805l8ng8qc1YqdwIfxu0QY+x3EQjuwxWbNwJLTLUSPqplZ+yeRrr/g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4159ae1-5e39-4251-6b94-08d7f30919fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 04:34:31.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/CvTmFRAMh2Alsev0gEFKrkHCPjKfnZ71xV77dxP+rHAtUfVr60VayxMZNZrI1hww6e/GokfHaFavLVVSL3ej/KUaPayelt5reV7xqwKWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2756
Content-Type: multipart/alternative;
 boundary="------------15C57027EAA071E69DE2332B"
Content-Language: en-US

--------------15C57027EAA071E69DE2332B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2020/5/8 上午11:04, Mittal, Anuj wrote:
> Hi,
>
> On Wed, 2020-05-06 at 01:46 -0700, wenlin.kang@windriver.com wrote:
>> Fix below warning:
>> zip warning: name not matched: sysroots/aarch64-wrs-
>> linux/etc/udev/rules.d/80-net-setup-link.rules
>> zip warning: name not matched: sysroots/aarch64-wrs-
>> linux/etc/tmpfiles.d/etc.conf
>> zip warning: name not matched: sysroots/aarch64-wrs-
>> linux/etc/tmpfiles.d/home.conf
>> zip warning: name not matched: sysroots/aarch64-wrs-
>> linux/etc/systemd/network/80-wired.network
>> zip warning: name not matched: sysroots/aarch64-wrs-
>> linux/etc/resolv.conf
>> zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/mtab
>> zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv-
>> conf.systemd
>> zip warning: name not matched: sysroots/aarch64-wrs-linux/var/lock
>>
> Is this specific to zeus? I don't see this change in master/dunfell.
> It'd be great if you could include more details in commit message
> explaining what is happening.


No, this issue can be seen in master too, but this patch is only to 
zeus, for master, I have sent patch too.

Steps:

1. Setup poky[zeus]project

2. In local.conf, add:
SDK_ARCHIVE_TYPE = "zip"

3. bitbake core-image-minimal -c populate_sdk

4.  check log file log.do_populate_sdk


>
> Thanks,
>
> Anuj
>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass
>> b/meta/classes/populate_sdk_base.bbclass
>> index d03465b6fc..b5c004d832 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -55,7 +55,7 @@ python () {
>>          d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
>>          # SDK_ARCHIVE_CMD used to generate archived sdk
>> ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir
>> ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
>>          # recommand to cd into input dir first to avoid archive with
>> buildpath
>> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
>> -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
>> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
>> -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
>>       else:
>>          d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
>>          d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar
>> ${SDKTAROPTS} -cf - . | xz -T 0 -9 >
>> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>> 


-- 
Thanks,
Wenlin Kang


--------------15C57027EAA071E69DE2332B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2020/5/8 上午11:04, Mittal, Anuj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On Wed, 2020-05-06 at 01:46 -0700, <a class="moz-txt-link-abbreviated" href="mailto:wenlin.kang@windriver.com">wenlin.kang@windriver.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Fix below warning:
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/udev/rules.d/80-net-setup-link.rules
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/tmpfiles.d/etc.conf
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/tmpfiles.d/home.conf
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/systemd/network/80-wired.network
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/resolv.conf
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/mtab
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv-
conf.systemd
zip warning: name not matched: sysroots/aarch64-wrs-linux/var/lock

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this specific to zeus? I don't see this change in master/dunfell.
It'd be great if you could include more details in commit message
explaining what is happening.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>No, this issue can be seen in master too, but this patch is only
      to zeus, for master, I have sent patch too.</p>
    <p>Steps:</p>
    <p style="margin: 0px; padding: 0px; color: rgb(23, 43, 77);
      font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Roboto, Oxygen, Ubuntu, &quot;Fira Sans&quot;,
      &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">1. Setup poky<span class="error">[zeus]</span><span>&nbsp;</span>project</p>
    <p style="margin: 10px 0px 0px; padding: 0px; color: rgb(23, 43,
      77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Roboto, Oxygen, Ubuntu, &quot;Fira Sans&quot;,
      &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">2. In local.conf, add:<br>
      SDK_ARCHIVE_TYPE = &quot;zip&quot;</p>
    <p style="margin: 10px 0px 0px; padding: 0px; color: rgb(23, 43,
      77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Roboto, Oxygen, Ubuntu, &quot;Fira Sans&quot;,
      &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">3. bitbake
      core-image-minimal -c populate_sdk</p>
    <p style="margin: 10px 0px 0px; padding: 0px; color: rgb(23, 43,
      77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Roboto, Oxygen, Ubuntu, &quot;Fira Sans&quot;,
      &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: left; text-indent:
      0px; text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">4.&nbsp; check log file
      log.do_populate_sdk</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,

Anuj

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Wenlin Kang <a class="moz-txt-link-rfc2396E" href="mailto:wenlin.kang@windriver.com">&lt;wenlin.kang@windriver.com&gt;</a>
---
 meta/classes/populate_sdk_base.bbclass | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass
b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..b5c004d832 100644
--- a/meta/classes/populate_sdk_base.bbclass
&#43;&#43;&#43; b/meta/classes/populate_sdk_base.bbclass
@@ -55,7 &#43;55,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk
${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir
${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with
buildpath
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
-r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
&#43;       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
-r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar
${SDKTAROPTS} -cf - . | xz -T 0 -9 &gt;
${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------15C57027EAA071E69DE2332B--
