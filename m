Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web11.2383.1588753290578858885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mhF64LXc;
 spf=pass (domain: windriver.com, ip: 40.107.220.87, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+MzY4l/A5wMXsYk4pT03iRN3rIk1qSZ22ZLjcHyIquveW/N8c+zugpirm73lW7FuIgGfg0Q+OzrkGmZmxuea6VLrHR9S/GkkSbiCAhtyVxC43wLTYir3PMjXuiPZggH+qoEhjgGiXw9jM0tdnJF4WKbH8LunFXCUwgVk3GrJyIAL9fJmYnf1uFp+SeDZk6B0oXC4U7Ihm3r3X25dX+dW11r5CxqipsvhhBesA2lHeB8iM9VzxX+CiCl0klxU6RYSH8DKBZ28r6A6hr30mPzWPonmc5qqs9SUGVS4778n2zK5HasLCtEhbzQtHtLvWQlDXHwpWJgqSbtNl/dNbDfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REx20Zdi2LC25P4uhTlj5zqeXJPqt9PKwlkl/NHUdFs=;
 b=fcnx1epT8pIim92RAb2GzV4YNzp9R/oUxx2CyyznydF+WGIj+eEMuliSXFvOSsrWq7+U+SAepmrJKla+c1F6hc8G78AjnaWTbFzNkvob/ATRq/3snU5qMHLj3vTglsE7Tkqn7dRN0318knkIF//zFSrwIghcU4PCTkQh3hfll8RLfgyDe2/0Pa4tswe4aJ7n8wqKJQkur2G07/3r81BSbwtdMq1F0anVVXxLKBxqf4mXmNvnO1Qz+gaIge6nBJNyA9E3/WBLAiLjh5FelbB6nrRFGIMzVtimuCt8hYTxqvpNJmzLLrg4ODKko98IJdTVGVSwjIMHnJ/WO/Rfhu1l5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REx20Zdi2LC25P4uhTlj5zqeXJPqt9PKwlkl/NHUdFs=;
 b=mhF64LXcLAEXJeirBvEhovBbzrDJNcJG7DAUgyKTT2vUFtDQjb4n0/38tCybOBhvyeerSQbbVudzgnP+ehDxM4lMyPkj2bbdhdkX75ibQIqOKwofLuMxd05NPOD78xMnr6/eA+atzLTsIaLasjrn1qJCToGwQhMb6h+qlzugSpw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3472.namprd11.prod.outlook.com (2603:10b6:805:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Wed, 6 May
 2020 08:21:28 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 08:21:27 +0000
Subject: Re: [OE-core] [PATCH] lib/oe/package_manager: update default rpm config %_prefer_color
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <160A7D8AF7F6BE8C.17748@lists.openembedded.org>
 <c3e5a4dc-c4a7-d398-4821-085777710c74@windriver.com>
 <CANNYZj8KHOLPO6XeDrUJQMQ3+PmtFX2qteV-9z3z5S4ye-e3Tg@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <15e807f1-a739-4c51-c69e-7bc412f127a0@windriver.com>
Date: Wed, 6 May 2020 16:21:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <CANNYZj8KHOLPO6XeDrUJQMQ3+PmtFX2qteV-9z3z5S4ye-e3Tg@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 08:21:26 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67fcdf01-a8f7-4019-f2cc-08d7f1967915
X-MS-TrafficTypeDiagnostic: SN6PR11MB3472:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB347278CEBD2C02871F1C043482A40@SN6PR11MB3472.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	COHZENUOvA9x1+tX/So87Tfb/YdruavX8SU5i6Wn58hxl4ydz6lBsa7IHAOP5KZZv6+BHr07RTIfpWRC2eYOU7hMAH7/jhBFYB/smBrWHBHIkh7nvVi3sOREvQyH3R4paMgfgShtHv6cUrmW7FrfUTw0mmJpaPjbZwZBqoRSklmGf0Ck2d56D6rhKEyxEKLrlla4NNPemLhoW6Rhha684svo5fcU9ZFzvLF4GG5cBD6oBJXeoGyjDEjjN53KSCu8UIgoddYbZ+pJwwGvZiEfwrXUL5vPnf5sKuX6bAr2QI7vSEYcFmRgTJZBkmfuxiwccM/N4G+eB5AKpdjwg7PaFNOuINq3eagKXB+uo1dkdvd5ZITQ8rypBd0+1wrz1DimSEAcTY3JU+cWOtD12zXbVLXZFGXCk7VDdrUvRn53FEEZGiqKZpZPqn6lV+25guvZgo9pefvQ6k+RuBLHbskVHLKo0/f7tVqbW15rLHqK6muVCwjQW28p5h6WRLQkmv/5nhDw85ZOD8HlPK0+bjfZxaC43Z4/gbjJc45I1bjHozUxe0PkE+WT9tzP7sUI9lst0M/5+K797oUiAjAvBri9v72UtPiGf97rX83YaV5tvlNv2mQg07QaK0AeE5+YupEDtQk2nkZi4EwwJkJHEAap9uaOG0YeKRkltwu09Kz9HIGjkQMgvDyWpFeHSA3bYRw3MFOHcv9yWQk0u0pToJzB0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(33430700001)(16526019)(498600001)(31686004)(86362001)(4326008)(33964004)(6486002)(166002)(8676002)(6706004)(8936002)(53546011)(33440700001)(36756003)(186003)(5660300002)(26005)(52116002)(6916009)(66476007)(966005)(16576012)(15650500001)(6666004)(31696002)(66946007)(44832011)(66556008)(2616005)(956004)(2906002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HiXEjoErjOhXfmSoGcCzMBt+heTJGmbGp/0AoF7Bpfs+OMEYksmAt0tCi7G65gNQGNV+2opPXe5aypFR+9524MSBrUcC2aLUSGFBNj5fDSboxR1KL8kHBpw/46T+0JEj+bz5ULJ262tc4R9rkObT5P94vck9he9XOle6zWZ1hlYend2PBtnKlaoTU9gBG5ee3XPPU9ll94cdPRelRWJhB+eiQ8hI8DIY4sVYWjg/GgbIzGQhw2rIfM9sg2Fd6aXnNbvodLlc28DFcdef4+FSImjtURrDsEXBLzuaEnVIf2prgP+XS11HOlOwCD/LKXoGYk2/E5p8hRtewENA2Vf3wyh06tPt6TsprlTnd6tvXsP9wW1Pyih73HamB/JmASp7KbDybJkFnutXWfQ/hsGTvSHLMY8wbGOZ6Tq1Cz4awU9MUZN1bH4KTk4Y7S7g5mz2o4vD9N8b1GTEoKzvNyof+mJBoD7r5Jupex+MSaKVfr/aS0SQOdLlJXTu56crcfLFNRySTEh4gp8J5yr6uyd0gLq0kH/2zUlyqdFocQFxfhOgArLpHKyCU+ciQBj+RT4WuK6pQLa9XOklkIfvFMZlI2boZliAJNdhw8eGsHiHW60+c/tr7ibFk1VPX5OBjCnjFXaJwki8nVEk9+u4MQfdGLpt16jCUHKUJpTCN8dgd9QXHL11JqO9pup8eVtcAIZS4Q0aMbn4oOs/k1hCP8P6Zmc/k45HN9nGJPU53Csf80GohExGJhOifGh7YiHJ1VCaro8DtfLoIzMEXRPzwSPA15/IyC4epSII24E6LyhsHjY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fcdf01-a8f7-4019-f2cc-08d7f1967915
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 08:21:27.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULyGkNWvlARUXPPIj3+D8cEtL742gsY4mfPfGtcGNX7mq5TmsQ9E0hWkZQ9lHrzK/SICN+fOqR7ADMuFooRiUnczJe9vIFG77Uv9zC9vH8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3472
Content-Type: multipart/alternative;
 boundary="------------E9070C21E673A5C7EB313FDB"
Content-Language: en-US

--------------E9070C21E673A5C7EB313FDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alex

Thanks. I will check this failure.

Changqing

On 5/6/20 4:09 PM, Alexander Kanavin wrote:
> There was a response from RP:
>
> This causes a failure on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1867
>
> Alex
>
> On Wed, 6 May 2020 at 04:39, Changqing Li <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     ping
>
>     On 4/30/20 12:10 PM, Changqing Li wrote:
>>     From: Changqing Li<changqing.li@windriver.com>  <mailto:changqing.li@windriver.com>
>>
>>     * %_prefer_color is used by rpm to determine which color's ELF file
>>     is preferred to be installed.
>>
>>     Here are file colors:
>>     0 is unknown or other
>>     1 is Elf32
>>     2 is Elf64
>>     3 is (contains) both
>>
>>     if default value set to 7, both 32 and 64 bits's ELF will be installed,
>>     in this condition, when we have 64bits python3 installed first,
>>     then install lib32-python3 later, 64bits python3 will be overwrited,
>>
>>     file /usr/bin/python3 will be 32bits ELF
>>     and sys.path will point to /usr/lib, not /usr/lib64, this may cause
>>     some python3 modules not work. so fixed by remove setting of default
>>     value 7, and use default value 2 of rpm.
>>
>>     * other distro like fedora also use the default %_prefer_color 2
>>
>>     Signed-off-by: Changqing Li<changqing.li@windriver.com>  <mailto:changqing.li@windriver.com>
>>     ---
>>       meta/lib/oe/package_manager.py | 2 --
>>       1 file changed, 2 deletions(-)
>>
>>     diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>>     index b066041..c055d2b 100644
>>     --- a/meta/lib/oe/package_manager.py
>>     +++ b/meta/lib/oe/package_manager.py
>>     @@ -805,8 +805,6 @@ class RpmPM(PackageManager):
>>               open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
>>               if self.d.getVar('RPM_PREFER_ELF_ARCH'):
>>                   open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
>>     -        else:
>>     -            open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
>>       
>>               if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
>>                   signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
>>
>     
>

--------------E9070C21E673A5C7EB313FDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, Alex</p>
    <p>Thanks. I will check this failure.</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/6/20 4:09 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8KHOLPO6XeDrUJQMQ3&#43;PmtFX2qteV-9z3z5S4ye-e3Tg@mail.gmail.com">
      
      <div dir="ltr">
        <div>There was a response from RP:</div>
        <div><br>
        </div>
        <div>This causes a failure on the autobuilder:<br>
          <br>
          <a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1867" rel="noreferrer" target="_blank" moz-do-not-send="true">https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1867</a></div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, 6 May 2020 at 04:39,
          Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor="#FFFFFF">
            <p>ping<br>
            </p>
            <div>On 4/30/20 12:10 PM, Changqing Li wrote:<br>
            </div>
            <blockquote type="cite">
              <pre>From: Changqing Li <a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

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

Signed-off-by: Changqing Li <a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
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
              <fieldset></fieldset>
            </blockquote>
          </div>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------E9070C21E673A5C7EB313FDB--
