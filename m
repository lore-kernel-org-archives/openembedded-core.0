Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web11.7665.1589874214576526172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 00:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gr+qmG1N;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcb0XGWeW+2M/CsRVBvAKBK+3ipFcRW/+x+0hVC6V+Kc8g0Bhp0F6RjYXc8V3mX/EwdzRdALbFCj8y3ATBEKdisJo8Tili4rA3MI/Hk5IlOR7s8PibJaDEbkTkUKb5jQ7ObrAeaw34CZlCLMh3pd428jozlm39YStPF9zqpyA8TURCqenQxv6TeC+MDcGg60GNhD0zw4wfcRCGpHvs/2vECWMbS6dPGWQkBhzxg8h/ZpIolqm+UVdJbdxOwRGe9gIXy5VOQwrnD9Kidkh7fws/Hwemz4WKetesGP4l/SRafojA0XOqSb6Z5C0os0UwoiFowEdZqiQj8yFsQq3HHz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcbsyCrJK98jtsSQWArCARAiIn3FUVsmFDMj9YeOyH8=;
 b=ZyHz3D4agRlo33RLu73NiJ3s9yQcpJy4puBGSIvQfZHKbOhVrH3PTDGNJkwGGexPKChepe8H30An9tt0DhJ37mWjfXiE/FhpKjpDeAmC62uABC0/EHuexEYs4fPYSF+Ts4wWhO7lcqcyADz+1dLh4G0axlwZ0psjJGK2qXrXlRHNQN91peW3vfUGrICU1bN6f1KZDUgEqyneFOGtnkzh7wY2c89UroReII8QKtBqRsD5NfHTp5KoG0XnHOpi0bkt/WKr37E4DmQKAnpdVd19aeqx/VnYkrwpCBn9bxEEuYjYEO9LLxiQmtBsbRq1/MbT8GaQpmK3ZAQt9J3TxZYtAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcbsyCrJK98jtsSQWArCARAiIn3FUVsmFDMj9YeOyH8=;
 b=gr+qmG1NMYKNoxpsEqcTtLHsFrTTJnicF0cJEJwgTBWRPsgdIkHHqElk6OyMcH9/u0J/JOTbsRCB5xcM0gl0OumhD/RKlCNV2KPPPYeK45TZtTeIyq4/uCh4FWvYhkmCttD9aCJR2fSE4Y6dXgBTQRXt1Ldivr7xYDQzJYXDAwc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3079.namprd11.prod.outlook.com (2603:10b6:a03:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Tue, 19 May
 2020 07:43:32 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3000.022; Tue, 19 May 2020
 07:43:32 +0000
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <20200518073201.23647-1-mingli.yu@windriver.com>
 <1610296324895336.31912@lists.openembedded.org>
 <ae41e89e-8f14-fc87-b4ae-5d9a7763e259@linux.microsoft.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com>
Date: Tue, 19 May 2020 15:43:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <ae41e89e-8f14-fc87-b4ae-5d9a7763e259@linux.microsoft.com>
X-ClientProxiedBy: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR03CA0065.apcprd03.prod.outlook.com (2603:1096:202:17::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.12 via Frontend Transport; Tue, 19 May 2020 07:43:31 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c85aa814-682e-47e0-14c7-08d7fbc85431
X-MS-TrafficTypeDiagnostic: BYAPR11MB3079:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB307999F45CB7B746D0BD2B02F1B90@BYAPR11MB3079.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VBiKuOn+BsAx7aVGhvOD1jkr9UPORT7omZ5p3Ro/dwdAadG0Dt/hFT0L/8qM8Ci2lQbYbw8vJGbjIfkeaBaIf1xhJgRAn2sXp85eH3eeQqC/1gq5xhY4waOOvhcvhk1pN21eec/pg5fDQXlGxPiGnQ+ce/ySg94lguIWn0/v0sGuReKBZU/c8/T2VDJqPd2LIDv6RjI3MkYdncwC+jbr1/mhSLOZKvBFqNrT/6M828cSt9LeZpfBoIfNG2+tr0bvc1uCOV5v6agpTcmfqDxuxQnfO0tdE7oivaGryyN0+8WcZyb+apbq3XCXr6LK9TlENVdnWt6Q1HstUH/3yIpVsx+Xrz3BpJ0Kxe0sc/ywGkwLErC9eQa2RpUpW5t/Gan+5g38t+y+vjfh4yzniw+xrsYmW0R7ZXhpSQijNhkbP2wjTaqYW3A+pag4LNNZFJTv1J4SQsX5rOg13tmw54BgFmoadTMq1eFbs8WnNdMdH3yfhaZJB1SKljpRa1Z3pleD+hCttfQQwqcned8BJc0QErlnA/9am1dGRlPQLooUAFakzmJ7VMirxo618c4R3vBHob2WC/PLR21rMgzSpXOa67yY0Z3RY3fmB9TkV51vN3rbyenDORVHPPlXQhTuh+NKqJkpvA9RxA3OMR3gAM4A+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(376002)(346002)(396003)(26005)(8676002)(5660300002)(316002)(2616005)(16576012)(6486002)(478600001)(6706004)(16526019)(186003)(966005)(2906002)(36756003)(66556008)(66476007)(53546011)(66946007)(86362001)(8936002)(956004)(66574014)(52116002)(31686004)(31696002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	miht17nZ/6uJqq6vh8q9tl1mZy+M2n2tIdv6ZPgwoYUC/a95KiOKoIQaO1enIxdTTpeR3nOJHln+Y1+pLoxnPlxHw8A+0zm2of/SXsIRRJcIQv62bk1QTWK0+ZBb9SBltcQHcup0rgWDAVYAIICBtzbsDocpl4xA4cUi8tOCnZ4w+1HqUC2K7aHKnF1v63+bEmgpxJn621k48x/ynLWja33XTTngvRgeSU6FgBfHldJtLOsUACO6V0ZUJvdF2KbFQxW9ZgQ2n68XWsl/CHMSTOhIiINQRCuCiOK2C/2qkDFSbrC9cvBqeROYN+vVrP7rMuNV6CmsZOZ0ow7jhSVYVXPTHK9DOXGHuOdVPTYl1rozWW2Q/jrKOv5AfgHPzqgEO82k6kc+Vkezc1ROpyQHTWtq/b08HMLsuFX6NmbhcoeyC+f3rCl7YtFduuWmNJWQ3hfxE9eLHapsTgFGuaZvuYny/cRVwU1+dRBaPGWSQJs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85aa814-682e-47e0-14c7-08d7fbc85431
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 07:43:32.3076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCF7wHpVtDg4QoEKR/sGeTlEYGp14Nl7eo+LtSMspK8gJoVpqpt2/rmWmf8Nu1NODHtb43whUgm2g+h/zjx9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3079
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,


On 2020/5/19 =E4=B8=8B=E5=8D=883:22, Alejandro Hernandez Samaniego wrote:
> Hello,
>=20
> The more I look into this, the more I realize its incorrect.

Understood your concern.

>=20
>=20
> On 5/18/20 8:36 AM, Alejandro Hernandez wrote:
>>
>> Hello Mingli,
>>
>> Did you happen to run the create_manifest task after modifying the=20
>> manifest to make sure that runtime dependencies are still valid?
>>
>>
>> Thanks
>>
>> Alejandro
>>
>> On 5/18/20 12:32 AM, Yu, Mingli wrote:
>>> From: Mingli Yu<mingli.yu@windriver.com>
>>>
>>> Add pydoc and urllib to core to fix below error:
>>>   # python3
>>>   >>> help()
>>>   Traceback (most recent call last):
>>>   File "<stdin>", line 1, in <module>
>>>   File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
>>>   import pydoc
>>>   ModuleNotFoundError: No module named 'pydoc'
>>>   File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>>>   import urllib.parse
>>>   ModuleNotFoundError: No module named 'urllib'
>=20
> Why would pydoc be required to run python? or urllib in any case?


It's better make the python3-core more lightweight.

But in a system which didn't install other python modules but just=20
python3-core, then we type help() as below and the help cannot show=20
normally. So add the needed pydoc and urllib file to make the help() works=
.

  # python3
  >>> help()
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
  import pydoc
  ModuleNotFoundError: No module named 'pydoc'
  File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
  import urllib.parse
  ModuleNotFoundError: No module named 'urllib'


After pydoc and urllib added and also just install python3-core and no=20
additional python3 modules installed.

# python3
Python 3.8.2 (default, May 18 2020, 07:15:10)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> help()
Welcome to Python 3.8's help utility!

If this is your first time using Python, you should definitely check out
the tutorial on the Internet at https://docs.python.org/3.8/tutorial/.

Enter the name of any module, keyword, or topic to get help on writing
Python programs and using Python modules.  To quit this help utility and
return to the interpreter, just type "quit".

To get a list of available modules, keywords, symbols, or topics, type
"modules", "keywords", "symbols", or "topics".  Each module also comes
with a one-line summary of what it does; to list the modules whose name
or summary contain a given string such as "spam", type "modules spam".
help>


Thanks,

>=20
> I believe there is a discrepancy between what python3-core does and what=
 you believe it should do.
> python3-core is the smallest possible package to get a working python3 i=
nterpreter, if you install python3-core
> thats what you get, if you need more modules then you install more modul=
es, e.g. python3-pydoc, python3-netlib,
> this way it allows us to keep installation size at minimum.
>=20
> If what you want is to get a fully working python3 interpreter, without =
adding any new packages to the installation,
> then you need to install the python3 package (no core), this will in fac=
t install python3-modules which contains
> all the modules, including python3-pydoc and python3-neclient which is t=
he one that provides urllib.
>=20
> Cheers,
>=20
> Alejandro
>=20
>>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>>> ---
>>>   .../python/python3/python3-manifest.json      | 24 +++++------------=
--
>>>   meta/recipes-devtools/python/python3_3.8.2.bb |  3 +--
>>>   2 files changed, 7 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.jso=
n b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> index 3bcc9b8662..808eadb8f6 100644
>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> @@ -203,6 +203,7 @@
>>>               "${bindir}/python${PYTHON_MAJMIN}",
>>>               "${bindir}/python${PYTHON_MAJMIN}.real",
>>>               "${bindir}/python3",
>>> +            "${bindir}/pydoc*",
>>>               "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>>>               "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
>>> @@ -289,6 +290,7 @@
>>>               "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
>>> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/re.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
>>> @@ -313,8 +315,11 @@
>>>               "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/types.py",
>>> +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
>>> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
>>> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
>>>               "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
>>>           ],
>>>           "cached": [
>>> @@ -363,6 +368,7 @@
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.=
pyc",
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*=
.pyc",
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.=
*.pyc",
>>> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc=
",
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.=
pyc",
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcomplete=
r.*.pyc",
>>> @@ -798,7 +804,6 @@
>>>               "plistlib",
>>>               "pprint",
>>>               "profile",
>>> -            "pydoc",
>>>               "resource",
>>>               "shell",
>>>               "smtpd",
>>> @@ -857,8 +862,6 @@
>>>               "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>>>               "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
>>> -            "${libdir}/python${PYTHON_MAJMIN}/urllib",
>>> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>>>           ],
>>>           "cached": [
>>> @@ -989,21 +992,6 @@
>>>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.p=
yc"
>>>           ]
>>>       },
>>> -    "pydoc": {
>>> -        "summary": "Python interactive help support",
>>> -        "rdepends": [
>>> -            "core",
>>> -            "netclient"
>>> -        ],
>>> -        "files": [
>>> -            "${bindir}/pydoc*",
>>> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
>>> -        ],
>>> -        "cached": [
>>> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc=
"
>>> -        ]
>>> -    },
>>>       "resource": {
>>>           "summary": "Python resource control interface",
>>>           "rdepends": [
>>> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/reci=
pes-devtools/python/python3_3.8.2.bb
>>> index a4a16fd495..36aa54ba6c 100644
>>> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
>>> @@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk =3D=
 " openssl ca-certificates"
>>>   FILES_${PN} =3D ""
>>>   RPROVIDES_${PN}-modules =3D "${PN}"
>>>  =20
>>> -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pyd=
oc3"
>>>   FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN=
}"
>>>  =20
>>>   # provide python-pyvenv from python3-venv
>>> @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev +=3D "dev-elf"
>>>  =20
>>>   # catch all the rest (unsorted)
>>>   PACKAGES +=3D "${PN}-misc"
>>> -RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs p=
ython3-pydoc python3-pickle python3-audio"
>>> +RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs p=
ython3-pickle python3-audio"
>>>   RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc"
>>>   RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-misc"
>>>   FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/pyt=
hon${PYTHON_MAJMIN}/lib-dynload"
>>>
>>
>>=20
