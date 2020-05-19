Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web11.7090.1589869390477745595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 23:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BrDOMyDT;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZLCJKJ+JCRLvUBvSpkjrLAo3GrUus0h0j/kkAY73jUk1iNMp4QCl7cJIpwnzDCrk7yvUCSD6v0GCJCFfO5pHS9VhoKhMlXM3jy423bkQJEseT9G+Kj1SUVg5myKWik7eamXEKFFimcN4fgw1ViJnLCfwq59HoMFvauA/sv+G36w0BiCvL0Iv0oNhNMqOzuLCQwfTQg3gpIJcg7rHlEMPkmMS2tS47Rd4VbFm42sEzoi+DJjNmv3Zer5auFTdSU6qPBVJ3Y9Tt+4MrCrUmxgtHIP+shAzNwr8a/sLzzVOex/QOALcSiPo5vDBXRvRESAfznAws5Uo6GVwqchvNIpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaV2gImvx2iqCoPGaWcqoKGtA7Ut4pmI1PMBZH7BhCQ=;
 b=Cbfoq6IuyosUsm3J/Gur0USBez/i1PXFmX1ITeuixgHK1g14BeGtJO0OcaTidSeuAZiGVAeB1ns9BD1zl46+H/FpphALwrh6/j9rKuQ27yg6GRj9XGXVRpFPivp+PNYuAYuXGOFZQvGXg2MQLfHG+nvy/zSaogroOjaAtXui7RlCxdtyGv0wdcFmotHjM2eFC79Z5nEZz/XsdbKZ+KTaZIRwDWU/MgQMfsk0pJ2IoGWVL5FcZIWl8RABXRZh2o7aHrLNTZt2KffJzF40Vnk+E4pFmWjPRHm5k2XLmesh7d7uGssAIvTRVoHA8gaMW/rOR25xS0q3KPrWxHyeMUqwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaV2gImvx2iqCoPGaWcqoKGtA7Ut4pmI1PMBZH7BhCQ=;
 b=BrDOMyDTpkCHPK7ikU6PWTWRmggGtDTMplYNU47pbRz6S+JFfIBPUZGxl4KxbsvV85p3O8SHQjykFkYQC7tDsva0gfpIeiahBBKjuaz1e4EheK5I6LbSZ7Fb3t/5GyuogBmi++ZYsjocWi/i2KdvLECSxNYofvHadJTb/0Ody8o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3013.namprd11.prod.outlook.com (2603:10b6:a03:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Tue, 19 May
 2020 06:23:08 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3000.022; Tue, 19 May 2020
 06:23:07 +0000
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <20200518073201.23647-1-mingli.yu@windriver.com>
 <777387e3-f259-c635-77f1-1edb9b1704ff@linux.microsoft.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <eec920df-d834-c791-73fb-d5d64fe7de84@windriver.com>
Date: Tue, 19 May 2020 14:23:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <777387e3-f259-c635-77f1-1edb9b1704ff@linux.microsoft.com>
X-ClientProxiedBy: HK2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:202:2e::23) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:202:2e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Tue, 19 May 2020 06:23:06 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0452e1b-bcb2-4866-8a82-08d7fbbd1872
X-MS-TrafficTypeDiagnostic: BYAPR11MB3013:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3013FBA47238F86CD7AB2DD6F1B90@BYAPR11MB3013.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	exRaZk9pi2PpBgfxKCoiJSVih1okJC0MZjbHFzoRXm21QYEpKdwqWDCrBKlgTWCh4TUae84lkddMrZeZuTz0VC60U0wluG/CwvSkqXCixAN5NXA0zx3ejDdUR6iWgtIR2xDPmi0gLsiHgNk/cd7mRnZej1mjoh/z2JEhPoIUyjVoISAGTgs37SlFdFHGp5YEgQIKoOkl9wdle1JXtDZIE2pVH3aAPgLu7p4shtgFQ5R7XaoyaskvYFsk2qA+MheqUj2Sdufbk3jOkOsfD0nKjwT4vCoKp/O3Y1MVCY2FXRrHcLcRjjM7K/Yrc702vG85QWqn6C/qpaC6jdLcsi/umatIGTqZq23Ff/+G8BoM8y9tj20MaU4I7I1StPdg88wIGAy9cHLxvyKNiuckIoTFxJNlW1wsuARulRm4Fvyd33yL+jRO/fMRUk0Qgmd05wBzfQ/u2MUUtUGF6Vgq8PWm2Z4gaM2j01kVmWSoQuInPrZJBIwW6P4oeCyYOJsKDB8OVjqimda8DwNQZ0MEj0DQrN2+k9u6NcCvPHjxRPcauk2uLQXi7bIpxu+9wJoOtugznxetuOhPcR8rpsfgvHWKWKdWsJPOxcevK6wiGDs5Rm58TYbqtWOkwFCRQoLaVEPB882sh6Lvz51GFJumtSqiYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(346002)(136003)(366004)(31686004)(16526019)(186003)(6666004)(6706004)(31696002)(6486002)(8676002)(66946007)(66476007)(66556008)(5660300002)(478600001)(8936002)(36756003)(52116002)(316002)(53546011)(26005)(2616005)(16576012)(2906002)(956004)(86362001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Zk3p4dVY/1Y6/yR347p8wWRES9cDLqiQy2KcSAvyTZUqI35T/tam99VkWZYh8nmbKRZ9ty76Yc8DFp3ov+zhV2oimKyEEvE6KWUALXOdg7ohmgTsI6fg6chAOWq5FkWwKmLdlAQRQR9MnzN4Jp+ve4uj+WLwiU/Rc6WrI2M1Vth7+dputIoqZRghEUIGCqoLSfXXK/o/MDVI8+9/a2KNBl987jkgrzjTYROnjJODBTRaqsdTmzDg5JYL4nMBkyMXXgCHSa/LniOOhIwZehlFDhQWeNFwrLeXrFspbcCV/pPcqDMFUGkhgiwpsnGYcbIP9Mp2nGUvW0WtHCFrMyJDrQv1AsQZv4Se01F3cl+lOlCkJ8IXmyVCqfLJ8YYo16E/iVj76Z9MNHkDkJZ5Ih66hPFqlXdAgx4ChXWW6t3axhnOFUTZRkJt0vIh28/HmUG1p6pl6+bA0zKu3Yve3ZFHD9sfWVcX/MSkxJvE0Wjibro=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0452e1b-bcb2-4866-8a82-08d7fbbd1872
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 06:23:07.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wpropn/w8D9wz13EG6X62AVWxUSCK1nboUGmqY3Iti2Ufa19JEpnzJlg7hijeLO588eKWEryRiLhITVrhxelaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3013
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On 2020/5/18 =E4=B8=8B=E5=8D=8811:36, Alejandro Hernandez Samaniego wrote:
> Hello Mingli,
>=20
> Did you happen to run the create_manifest task after modifying the=20
> manifest to make sure that runtime dependencies are still valid?

Yes, did run "bitbake python3 -c create_manifest" on my side and also
did some adjustment after run create_manifest.

Thanks,

>=20
>=20
> Thanks
>=20
> Alejandro
>=20
> On 5/18/20 12:32 AM, Yu, Mingli wrote:
>> From: Mingli Yu<mingli.yu@windriver.com>
>>
>> Add pydoc and urllib to core to fix below error:
>>   # python3
>>   >>> help()
>>   Traceback (most recent call last):
>>   File "<stdin>", line 1, in <module>
>>   File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
>>   import pydoc
>>   ModuleNotFoundError: No module named 'pydoc'
>>   File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>>   import urllib.parse
>>   ModuleNotFoundError: No module named 'urllib'
>>
>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> ---
>>   .../python/python3/python3-manifest.json      | 24 +++++-------------=
-
>>   meta/recipes-devtools/python/python3_3.8.2.bb |  3 +--
>>   2 files changed, 7 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json=
 b/meta/recipes-devtools/python/python3/python3-manifest.json
>> index 3bcc9b8662..808eadb8f6 100644
>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>> @@ -203,6 +203,7 @@
>>               "${bindir}/python${PYTHON_MAJMIN}",
>>               "${bindir}/python${PYTHON_MAJMIN}.real",
>>               "${bindir}/python3",
>> +            "${bindir}/pydoc*",
>>               "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>>               "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
>> @@ -289,6 +290,7 @@
>>               "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
>> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/re.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
>> @@ -313,8 +315,11 @@
>>               "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/types.py",
>> +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
>> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
>> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
>>               "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
>>           ],
>>           "cached": [
>> @@ -363,6 +368,7 @@
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.p=
yc",
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.=
pyc",
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*=
.pyc",
>> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"=
,
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.p=
yc",
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter=
.*.pyc",
>> @@ -798,7 +804,6 @@
>>               "plistlib",
>>               "pprint",
>>               "profile",
>> -            "pydoc",
>>               "resource",
>>               "shell",
>>               "smtpd",
>> @@ -857,8 +862,6 @@
>>               "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>>               "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
>> -            "${libdir}/python${PYTHON_MAJMIN}/urllib",
>> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>>           ],
>>           "cached": [
>> @@ -989,21 +992,6 @@
>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.py=
c"
>>           ]
>>       },
>> -    "pydoc": {
>> -        "summary": "Python interactive help support",
>> -        "rdepends": [
>> -            "core",
>> -            "netclient"
>> -        ],
>> -        "files": [
>> -            "${bindir}/pydoc*",
>> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
>> -        ],
>> -        "cached": [
>> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
>> -        ]
>> -    },
>>       "resource": {
>>           "summary": "Python resource control interface",
>>           "rdepends": [
>> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recip=
es-devtools/python/python3_3.8.2.bb
>> index a4a16fd495..36aa54ba6c 100644
>> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
>> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
>> @@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk =3D =
" openssl ca-certificates"
>>   FILES_${PN} =3D ""
>>   RPROVIDES_${PN}-modules =3D "${PN}"
>>  =20
>> -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydo=
c3"
>>   FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}=
"
>>  =20
>>   # provide python-pyvenv from python3-venv
>> @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev +=3D "dev-elf"
>>  =20
>>   # catch all the rest (unsorted)
>>   PACKAGES +=3D "${PN}-misc"
>> -RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs py=
thon3-pydoc python3-pickle python3-audio"
>> +RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs py=
thon3-pickle python3-audio"
>>   RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc"
>>   RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-misc"
>>   FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/pyth=
on${PYTHON_MAJMIN}/lib-dynload"
>>
>>=20
