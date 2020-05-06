Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.81])
 by mx.groups.io with SMTP id smtpd.web10.2453.1588732748804981074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 19:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SUTaBRwL;
 spf=pass (domain: windriver.com, ip: 40.107.244.81, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIBc8SQK+lfOSn3eYBOF2hxnuqz7T9MgvwAR7vU+TuxoIGdE3/8jtu25+fPKgBCMeu04lLJJ/iYf3gX5tjoHDWnMK/43JNe01F8NX6rGq7kOeyY0AEuRnIevz+1XoYCvxiEzN//4WXGG6xsXGVIUI1CqU3detNYmSLHlzELEPmvSNVol6rBkBG0P4NXLqlKskj0fzjP0j8k1A1/35lAm83FII4oI41kYOee6k5rypKeRSID3uxfyNJw7Tl5YVS5p0ou8RDrXNhPRJVCduK46ZgcNiCF8NvokCbS3cwjqAU19U+LCJwinE7AusztBFYyLVxRIeLDjv3R4b4Hnx3fixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND1izVrIpheOXeObYQ07uprx/NS39Is2S6phIEkN2xQ=;
 b=mBwnC2sCeeitK7PNPALAsXUKlb5OvoVat1mTjKhjR91a5S8P5cCm+uio0G7mPtyU2VEo5JpXNbVrCoavOGo5s80FgQhp4cDW5JMaB0gi1eMKiDA0TS2JV9IYBhPNOBUK4TEtKFjwD9WG9kwexZky2f3jtqO8/rU5O7/4lk4prH8gQXWuqrDteyTG/ruzfZKvt3nUAKABvnqac05zlMrxXEx5jkujzW+bGuk9TPLXhMgj09QldBOFzCRdTHvXjTVvOmzMw6hRbhbIfgQBLIolgw3DtaAGbLXeBBK8Tlbj+gE05FQCUxKi/mNOJytggfZGNixIg1usfLXTlLOFQUhs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND1izVrIpheOXeObYQ07uprx/NS39Is2S6phIEkN2xQ=;
 b=SUTaBRwLRdnwKN0gkEfE7p+WzdftDT4T/SoJ6UrCmId8AhF7rk4esF23sMuTDKPOy1PCgxciiubsgZ8unpEkKbyuNQHBg3v6LpsfkGhhFmVE/ormmJ9qlrXq2WCKunoI/nbq7iEJJ8FK217bDFGTj05zU0Trz8mVdArM28I8ElA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3167.namprd11.prod.outlook.com (2603:10b6:805:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Wed, 6 May
 2020 02:39:07 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 02:39:07 +0000
Subject: Re: [OE-core] [PATCH] lib/oe/package_manager: update default rpm config %_prefer_color
To: openembedded-core@lists.openembedded.org
References: <160A7D8AF7F6BE8C.17748@lists.openembedded.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <c3e5a4dc-c4a7-d398-4821-085777710c74@windriver.com>
Date: Wed, 6 May 2020 10:39:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <160A7D8AF7F6BE8C.17748@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:202:16::15) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR02CA0131.apcprd02.prod.outlook.com (2603:1096:202:16::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 02:39:06 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9f72e85-2001-4884-6ba2-08d7f166a5de
X-MS-TrafficTypeDiagnostic: SN6PR11MB3167:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB31676ADCAAC21E593E578EFC82A40@SN6PR11MB3167.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oec5UFuTplm2vxwmaiT1/QK0cYHgsudrYZl/gtzpkPmo4bDRldbKYjmAZ2YtvpY29l6EkJ+gtu8oVzKYVa+X0DLe6LAiINQsjE5jeaute5I6hJ6XiDkDOZQjZuQTlpwbCTw+VS+ddbt8LP03N4Ykw20Op7UIcq6yDLm45cFAComSQpmqzcXE/ja+3TSsAavjt0zNsLxgBaqoxDfN29odF+gBYshNeS5bizMKOzgfz4Sc3qQTrgjLIVLlLnRYnq5Qjle6+LE5DqnZ6nzNam3KhVHeLfZnMhtR0jTstEuALDrN0B8L9krCnXa+YDu5dmZLCvUzengM3lSr8G/Qe4wpmFtTX3rwKbCf5uUYtBgU7ij9KCQ3HZ3YrrujJSTRxJUwv3T456eSxtFEG60hQdw4jKixbs1lckDQyTB6Zpqr+a8U6B8AWJRx3h79lrty95vVPiAI+1wSy9ifdu1yB1H/qXWk8ep1gTl2ZNgnoqK/MhCIybMVQITwmFTUAYeChMIkJfTThGIWmQiNeYl3DWSh89hXOjENzvlbit1lRGXh1TsuFjwnDJqgTKyNZQ1Lqyd7DFehxHv5UkVOgzvZrcDGPKaZW86Zbe4bJNBcy6TLQ1o9O0KSuUvCzhPZn+YfSbC32Xmj7zw/JlkGTrGjEZN3lF9EEfkRHC1jaO+0MicxSKBieI2h+AVjDROy6Y6rSNCJ+CtOwr9iTWvmpZJX5UAZ+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(376002)(346002)(366004)(33430700001)(66946007)(66476007)(6486002)(166002)(6916009)(316002)(6706004)(44832011)(956004)(8936002)(2616005)(8676002)(52116002)(86362001)(478600001)(26005)(36756003)(966005)(16526019)(66556008)(31686004)(16576012)(33964004)(186003)(53546011)(15650500001)(2906002)(31696002)(5660300002)(6666004)(33440700001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	C8pZOcHRx02B1ZJqbYd0yPPhpwq9KvC2P06GUR+sj6FpX7nP7mftQERzz+MAbHc1PTpTSaJ3pAhIDg7d9qPIuKdfRSyl21Xep3+tsC7Hhmz1dRb//py4aKWVEN0z9lBKd+TNEdZIfP20BrdN6r14X3jE5DrMGpFCA/S8zVA3v6shboZ/pHe9EAxL0q3WKGMNfXAGvq3y0CKrHEOnYtAjiZMDvakUXDDZB499domTjhlXlfsLcUWRO0+uAT03ExQwWGIa72ToLCKANVQZnhm4KCfTh0k1dUg7yhQoxfe0suXS7/zBTCXR2+NqorIvC2TCAj4UJCCAR4LZsK4u/P/BfwUvW3L7gTgz7nIJPhB4BIwZ7db2/3dMLTVtyffn6xPkLmNdQh3i+IE0IUfV+S+LtbmxmO8rURRb7SKkh6FXPo3cTSyUOGU7lv59vtexDupw0KM/qafnzdzJmz1gX3bFUmP41q+FyR3HW8VT3ecpnOdNWL+lv3lOtZfAmNugzIlB93RfKwMrnW9jt7pm9HT0x+SdTN9uedN7ECBy2s/+2oJfZPBpSrHmXkI2hjHlnvmRzN+kNs5MHaf7mnpjoDvAPUhMcWIZlZx1v1/cROlHyxCGHYvI+R3DV2nkKPaZSo8JIuHe5nfffqrmoz/iCRvaXKYBzr35J8y+2npi91pfiHI57NY4UImo9Ef5ahN8YWVfvWqRGUqkbnNUVY9o6LqaJoCBzFshO2sx2SwKEZFZ/ybrpWgDI6AUgpg23BPwt2RfbW1cyVJxVS/NYnbI77HG6eOB4pjXZzk6gbqqjNlUbNw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f72e85-2001-4884-6ba2-08d7f166a5de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 02:39:06.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSB5BW2vB/JOgVFoNHLh+FlFIlAj7KecYmCu1dmORCPzEGoQ8x7HXKNtltI9QNNqMnLJD9xZ+Txu+QLJpewQ1M8mIuPVY03tv0VWZO3+okw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3167
Content-Type: multipart/alternative;
 boundary="------------F1D4D037C88A8884DD6B59ED"
Content-Language: en-US

--------------F1D4D037C88A8884DD6B59ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 4/30/20 12:10 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> * %_prefer_color is used by rpm to determine which color's ELF file
> is preferred to be installed.
>
> Here are file colors:
> 0 is unknown or other
> 1 is Elf32
> 2 is Elf64
> 3 is (contains) both
>
> if default value set to 7, both 32 and 64 bits's ELF will be installed,
> in this condition, when we have 64bits python3 installed first,
> then install lib32-python3 later, 64bits python3 will be overwrited,
>
> file /usr/bin/python3 will be 32bits ELF
> and sys.path will point to /usr/lib, not /usr/lib64, this may cause
> some python3 modules not work. so fixed by remove setting of default
> value 7, and use default value 2 of rpm.
>
> * other distro like fedora also use the default %_prefer_color 2
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/lib/oe/package_manager.py | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index b066041..c055d2b 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -805,8 +805,6 @@ class RpmPM(PackageManager):
>           open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
>           if self.d.getVar('RPM_PREFER_ELF_ARCH'):
>               open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
> -        else:
> -            open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
>   
>           if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
>               signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
>
> 

--------------F1D4D037C88A8884DD6B59ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 4/30/20 12:10 PM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:160A7D8AF7F6BE8C.17748@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

* %_prefer_color is used by rpm to determine which color's ELF file
is preferred to be installed.

Here are file colors:
0 is unknown or other
1 is Elf32
2 is Elf64
3 is (contains) both

if default value set to 7, both 32 and 64 bits's ELF will be installed,
in this condition, when we have 64bits python3 installed first,
then install lib32-python3 later, 64bits python3 will be overwrited,

file /usr/bin/python3 will be 32bits ELF
and sys.path will point to /usr/lib, not /usr/lib64, this may cause
some python3 modules not work. so fixed by remove setting of default
value 7, and use default value 2 of rpm.

* other distro like fedora also use the default %_prefer_color 2

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/lib/oe/package_manager.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b066041..c055d2b 100644
--- a/meta/lib/oe/package_manager.py
&#43;&#43;&#43; b/meta/lib/oe/package_manager.py
@@ -805,8 &#43;805,6 @@ class RpmPM(PackageManager):
         open(platformconfdir &#43; &quot;macros&quot;, 'w').write(&quot;%_transaction_color 7\n&quot;)
         if self.d.getVar('RPM_PREFER_ELF_ARCH'):
             open(platformconfdir &#43; &quot;macros&quot;, 'a').write(&quot;%%_prefer_color %s&quot; % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
-        else:
-            open(platformconfdir &#43; &quot;macros&quot;, 'a').write(&quot;%_prefer_color 7&quot;)
 
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
             signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F1D4D037C88A8884DD6B59ED--
