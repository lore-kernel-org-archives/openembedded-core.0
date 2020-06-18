Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.79])
 by mx.groups.io with SMTP id smtpd.web11.475.1592443426810104127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 18:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SaY9cdjs;
 spf=pass (domain: windriver.com, ip: 40.107.77.79, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWlUX/b+Tdd2iW7TuRaSYvDTrMawKxH2b1ZTRFIY9YYRe8+ZJSymqxDVOS06isTd3p1PFpZysrMPVhvwSLv3PjWVaZwBAiDGSrKAgyiNI9BMbGaXKMCa2g0XPZWVQLGjVf/sVKGZooodOBpUb7PeVWZHZZbpNwqQIVmMP0S33f2iqkEuTFNBB32ZPsuKJRxdvXtlCPJI7rULbekjSOzQh2CdhT8dqQh9Sygb1jkE7aQHorriSmdLU66oE51+bo+6dGQQAceSY9CMbTPRx2/hBryALAzXNDU6Q77SWMNZ5NhDw15YOhQuOlkjOLaTgSZHlVqBG8vhyUb0dZpiKwk2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4GwVKanrpe22EOUDZKMgkdGCx34AzoClzu2doCsny0=;
 b=L/VPf3k+z6XuAeFkH5uKltdhbIiLX6u+Wi/y70vhRh5f2gWjiXxajvKFmFYeu8h6g7S4OEgCz8v/keVBcS2Pw1x5qegwGAoUQGVFFz48JsxGLKzGvUPg19hvCX4zt7BgT66tb6j8qqGMt/jVubIihk6ExEymoieI/oClZmXxQ3rp9rB08FfuMGyiCQldAnWa98MjvtLzZw5UB6rU6azom7JED2GL0degGag+av7sOxjep7f3wC43oH1anpizTOwGhn7GBGvdd/p6c1y+HRB3RctcFbwhKOrKaVunxA/1wJka66W6Yel8pksRGMk3CeGPsaG+euEwlukALUaaxIE9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4GwVKanrpe22EOUDZKMgkdGCx34AzoClzu2doCsny0=;
 b=SaY9cdjsgM5O13sZ5vIJ5S6lX6amWCyXYSmmvxA8jzqAlGDZGuMnd90o1NzIQJ2aMOLpp8NLsTrItstx8KF4p5tLqBtUxDyZULH1oFjg8vLDDzx9a8n4dvbucASn2JGkSzbzt8OMvryjm8gTsQ3thD4UiYMCIAmsFdEmJYHqd58=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 01:23:45 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 01:23:45 +0000
Subject: Re: [OE-core] [PATCH] xinit: add xterm to RDEPENDS
To: Randy MacLeod <randy.macleod@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200617040731.1195528-1-changqing.li@windriver.com>
 <c3582a8864dbda0acefd9128f6d6d5cdddf33a85.camel@linuxfoundation.org>
 <65e89c4e-22b4-493d-e214-78753d5ba0ba@windriver.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <5f972bb4-5022-6d1a-2b87-fed44e51db1b@windriver.com>
Date: Thu, 18 Jun 2020 09:23:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <65e89c4e-22b4-493d-e214-78753d5ba0ba@windriver.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 01:23:44 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30c7ed8d-cb12-4802-f92c-08d813263ed1
X-MS-TrafficTypeDiagnostic: SA0PR11MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB459245892BCAB80ECB373ACF829B0@SA0PR11MB4592.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wzOZiuIW4NA5t/IgeRx6ho0Tu9Bg+X6XOxz6Q9MxL0pNcPZSKrma6BoHH9PylORz0PU5lQsMfLeXbXehmBRUNVBj8ksxBocQe/L//W6McBVM6uNzhSyaxjtNvgGm5niM/eaIiO0rXZsEK5B3xX0w7Xda5m8E2s53E2LaOmHcBCJIIedEgT67qH8H88ZGQkNIYWeIu9zVfIl/O1VLOCxz6QZeo+1xPYtxIJXRVIAfxbayHSVZk/RIv4FS3onq6RNFz7/i6YXP7puKjbFIe876yyt3Q6cwPnXBMTNMcwEgV/ePgvoSTA2irRQkAAWrAdV6K/G9e5E66OWEcOXUS9xHlhifKjbaS7PHYyKolX5c6s7TmQaR3k0ZKe6CMb1i/C4Bx8Y8dZUlBiA6tBe+w0GYamUhNjlBPPngRmiTqxjv6S81FXWbgbNjjNsYFTpca3oFmSzmbuPfI+m/BC4xnbi/kCXXkG+rGFKqmARJXw7M8ezPdwJeWvl+tjtM5QE6uWpM8Bgr/lBol+BKN8HHeFYOTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(396003)(376002)(39850400004)(8676002)(6486002)(36756003)(5660300002)(2906002)(478600001)(8936002)(6666004)(966005)(4326008)(6706004)(6636002)(6862004)(37006003)(44832011)(83380400001)(316002)(16576012)(2616005)(956004)(66946007)(66476007)(66556008)(26005)(186003)(16526019)(52116002)(53546011)(31686004)(31696002)(86362001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2Sj0CKjfr2i1xsGS7ZKYcs05GLYaKeYSbQMaFWKYjaNKAc6pvh2z6XlLru7CXE/S6LYbrVr1O2oTLpUu45+CFxo+P2kESucM9w3dzde6OZN+ei7W/21/5zcTtfBwdE1KdIDD1gne28U0w60UDK4GgxNJMBWuPhxYhl5gEzFcRLSDY2tAaTv4F3/B4gpDjaXirHFf3BGYo/T2c1+8UKqN68qyKut23dbmBZMf2PHKI8fEHAQ2tn1McCFXpi2rYDHYxMtU5U58BstYIXnCRUt6esiVEXvRqdzt7gdxfFZ46yBMUOrYfJa9LZzGVWO8cPVuq9tG0cUhnu3cX4wRWMEPKjVaAhD9gvGf7pXq/Rz1hsbAZhTTKkt6LUqbyoMx/pnZ8QVA91Oe085jJsgd8iUIpwRZ/ggvRt2HLi9GVT8TGgfNNgIzrrq3AvrE0AmGgFT3cqPNNmPih5wJos2utlhxNDn3pqJ26N1qIbvG/A1nW4g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c7ed8d-cb12-4802-f92c-08d813263ed1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 01:23:45.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQbF4ryZI3abIF9QEcRvnPeFaWxWMl95gzH7ViehtUU5HGjKyFhNnfDRm7Tra31YKpR6oghxg5W0LrDhJ7HTCF7fXbycue1ODNun14gJSls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 6/18/20 2:28 AM, Randy MacLeod wrote:
> On 2020-06-17 6:51 a.m., Richard Purdie wrote:
>> On Wed, 2020-06-17 at 12:07 +0800, Changqing Li wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> startx RDEPENDS on xterm, fix below error:
>>> /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb=20
>>> b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>>> index c9e28d9bba..5f8c370c59 100644
>>> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>>> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>>> @@ -19,4 +19,4 @@ SRC_URI[sha256sum] =3D=20
>>> "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>>> =C2=A0 =C2=A0 EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie=
"
>>> =C2=A0 -RDEPENDS_${PN} +=3D "util-linux-mcookie"
>>> +RDEPENDS_${PN} +=3D "util-linux-mcookie xterm"
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/2015
>>
>> ERROR: Nothing RPROVIDES 'xterm' (but=20
>> /home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-graphics=
/xorg-app/xinit_1.4.1.bb=20
>> RDEPENDS on or otherwise requires it)
>
>
> xterm is in meta-oe. It seems to be a bit out of date:
> =C2=A0 https://invisible-mirror.net/archives/xterm/
> so please update to version 356
>
> While we could pull xterm into oe-core, it's old crufty code
> with several dependencies on similarily crufty libraries:
> =C2=A0 https://layers.openembedded.org/layerindex/recipe/5041/
>
> It would be better to understand why startx wants it and
> use rxvt perhaps. People have been trying to get rid of
> xterm and libxaw for many, many years. It seems that xinit
> does have configure time support to specify what app to use
> instead of xterm:
>
> $ git blame configure.ac | grep xterm | \
> sed -e 's/=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //'
> 0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000=C2=A0 \
> =C2=A0 47) DEFAULT_XTERM=3Dxterm
> 0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000=C2=A0 \
> =C2=A0 74) AC_ARG_WITH(xterm,
> 0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000=C2=A0 \
> =C2=A0 75)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AS_HELP_STRING([--with-xterm=3D=
XTERM], [Path to xterm]),
>
> and that 'feature' has survived. Can you see if we use rxvt by default
> and have a PACKAGECONFIG to use xterm optionally?
>
> ../Randy
>
OK,=C2=A0 I will check this.=C2=A0 Thanks Randy.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>=20
>>
>
>
