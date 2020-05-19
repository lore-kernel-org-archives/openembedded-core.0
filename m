Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.49])
 by mx.groups.io with SMTP id smtpd.web12.8128.1589876552914157685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 01:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YbADLOG1;
 spf=pass (domain: windriver.com, ip: 40.107.75.49, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGgdEOPMIP6PDJYQEzJD54sqLZs7FsOtFEoHoRVrNIIKzxh8KEKrEMnZ1WvdhNHmT2a2t9++x7u8XkzubfbDIJdF3XUmdT3Ug8OT3jwnZfiSO3kgGMH79kruhrfJ5ncQvpJbNfxSbIGU0zeExjnR7uib2E2dTdTbEMsStMmsBiymtG0MK5U8p4Fs0SzZHIJxOIKiwTWaXG/hn60kgTl0vNJWAjnkTj/ra6dFczJ7HZ7/9il577w2ZK1lAhemG81MNR3uuL2px1l6W8+lmm4XSJen5N3204p9bCbtKwk6G1ljghLmPvn7aB7oaWZ0TfTqOoPRNXd4y2v9crosil67tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlgdiAKFYC81cp+MDTZA+zPwQuuJ74+lT1Iot/zPSYM=;
 b=KvXfgxPoSegN2lIXoow93V/2jGsbT7FOnt7Bhz/wirPqlpXl4urkwG1Pj9xQGlracnNv3eQ5jEP7ceTMrnDukh3eHrioBKzb6k8IBcYRWKbs1/1/65npKWf2sFBUVvsU9FuvOOSpn7oEcxe+Q61oVpFY3jAAa80U8NRjxBjakqxHXHkjMH7yds/fR5JVu3uAC8HokUSpJ/qyXe9EX7OseEhXVc0HX8igrxXU2VFMf2EzZY+BXNXl8B0PXo+EJS5dgRKo6khVYHSo3cYxOSf/bYQ4OjQPsJNVoQpdiQ0OsjwrvgbTLxtH8IkVdsdEpEazErkOcyTO49MYhz8kqmCCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlgdiAKFYC81cp+MDTZA+zPwQuuJ74+lT1Iot/zPSYM=;
 b=YbADLOG1VgkWfgmoTagG3kAkK4Yqp8X/WFLSvEMYMaiYJ3PyhUX4ABCD7AYdOWjJZk3zEI/kS1fGuzQi/a+5ViY8guKI1zyaJNBW18pdFjdyfwSeqTuBLWkAwME+KpWYGKaDQOkHwSxFVPfPcaM/T1/0wYjkmNekguIcV/BwZCM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 08:22:30 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3000.022; Tue, 19 May 2020
 08:22:30 +0000
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <20200518073201.23647-1-mingli.yu@windriver.com>
 <1610296324895336.31912@lists.openembedded.org>
 <ae41e89e-8f14-fc87-b4ae-5d9a7763e259@linux.microsoft.com>
 <73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com>
 <c82bf9fd-4ca4-6d7c-a2eb-8c28c5cb5ab6@linux.microsoft.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <29909622-d157-7fae-467c-d34f0871988a@windriver.com>
Date: Tue, 19 May 2020 16:22:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <c82bf9fd-4ca4-6d7c-a2eb-8c28c5cb5ab6@linux.microsoft.com>
X-ClientProxiedBy: YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::10) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend Transport; Tue, 19 May 2020 08:22:29 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25933beb-7431-4ec0-f2a2-08d7fbcdc5ec
X-MS-TrafficTypeDiagnostic: BYAPR11MB2855:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2855EE93E93843427C956E71F1B90@BYAPR11MB2855.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M/e28N04kYolFcAPUWNajfTGHn3GeP5sz70TKaVnGuDoNhcFA/077CzIw0aHDW+tzzvgnJa6MP3eAvi/tYFoHAoIIZoDh0954+e7i4YFDwLhO5yWET6xjdtlT+O2fVDnqvCjGHMTBjgA40lNEUIjrra2XkKznamJAl5Q3TsAXtTYY/tzaIV3wNKB1EZbnmy5ZVS8Zud2uuAAW/Hiwuf6hRgZorsu77YhHEbwA9L2QcpdhEt684BU9aP0VwTrvR6X1nze1UBYC8XOiZLAtyE6AHeLjBGR4JUpEyl2WSjNpbNLNAYWRCp5wh0iD/aejvMTrvQKM53aPr9OacaqqI6a/NfuenHRL/DNEYxagScnwsEGtgLVfmD78jH9VDwPZ9ezG1no10xEtkqnqEPLT5sHiDKTa9OtoQqZNoK+8xHgjcMIovSeQY9ZY8bwF4ryIoouuZlioKAVTm9Jgws92uX+6yP+9b0nQZ0xiTHiTCNk9p4nClp7MlGUARnDARCq6Bxs/47waye4+M45i3jvCnxRri/9m+jAHWh3LjxR66LOXMz/8HmDjhxZOHzVwZXU32mwUejt/7f6av9mm85wX25/CfUuQVMtJxU4XhlmRvWtTL5CNUczLhyO4hzELqEPsSQNxdKshGQ2CsBsXA/ov+RvGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(396003)(39850400004)(376002)(66574014)(8676002)(316002)(66556008)(66946007)(66476007)(8936002)(16576012)(26005)(6706004)(6486002)(186003)(52116002)(2616005)(956004)(478600001)(31696002)(31686004)(16526019)(5660300002)(2906002)(966005)(36756003)(86362001)(53546011)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QaS1sD/KEnlXXIE2nwDOqriHNIH/Q46PCy+8xEMdNHZwHTIEUyJj4BO1lt+JmQkzSOSxKX/7G3+vKMLjk/PTjbVQs4ICW3LXj5QGjbEVHT5TRc1tYTX6gO2QxYEEXeO8/3+0Sq4h6vY0G/x+kXczKKT+VeGkquFoSbTEmI2y/SyfbcGzIjMNgRO2AbnsdN5j9APq++9rxzvJbhcGlSaZ9CDZlmCF/pKh1Cfz/VZmirDQ/gXVIMSf+YA9mv6S4VZZXnshS4uhwKiaNdBm2HAMaMTJ1FHDTsFjHXz62Gz29WxBljBL7j/o6L6oatMfIaGBLF6NL7+vSbtO1in0mz1VZ0VsjJyP6GWhRKEKtrZGNE7iYpiAZhkaLKIrbQCUDlu1Y/sDjjjuOWJD0xRgjFx290/6e7aZJtHnmO2c4b9mo3UxJiYLjAo1k0CmDzyPsenqGSl1rnY+HI2otf8uoRVpEit8t18MhKduJm8OMw7NURM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25933beb-7431-4ec0-f2a2-08d7fbcdc5ec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 08:22:30.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8fCMSRLWhDUT2E8MRhbLAk8Yr7NSn6k38eu8ap/kz+y5guQvyVXnuAWwzN1BvFj9eJN5qNRhA2sO7vzsZ792w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2855
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On 5/19/20 3:51 PM, Alejandro Hernandez Samaniego wrote:
> Hey Mingly Yu,
>=20
> On 5/19/20 12:43 AM, Yu, Mingli wrote:
>> Hi Alejandro,
>>
>>
>> On 2020/5/19 =E4=B8=8B=E5=8D=883:22, Alejandro Hernandez Samaniego wrot=
e:
>>> Hello,
>>>
>>> The more I look into this, the more I realize its incorrect.
>>
>> Understood your concern.
>>
>>>
>>>
>>> On 5/18/20 8:36 AM, Alejandro Hernandez wrote:
>>>>
>>>> Hello Mingli,
>>>>
>>>> Did you happen to run the create_manifest task after modifying the=20
>>>> manifest to make sure that runtime dependencies are still valid?
>>>>
>>>>
>>>> Thanks
>>>>
>>>> Alejandro
>>>>
>>>> On 5/18/20 12:32 AM, Yu, Mingli wrote:
>>>>> From: Mingli Yu<mingli.yu@windriver.com>
>>>>>
>>>>> Add pydoc and urllib to core to fix below error:
>>>>> =C2=A0 # python3
>>>>> =C2=A0 >>> help()
>>>>> =C2=A0 Traceback (most recent call last):
>>>>> =C2=A0 File "<stdin>", line 1, in <module>
>>>>> =C2=A0 File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __c=
all_
>>>>> =C2=A0 import pydoc
>>>>> =C2=A0 ModuleNotFoundError: No module named 'pydoc'
>>>>> =C2=A0 File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>>>>> =C2=A0 import urllib.parse
>>>>> =C2=A0 ModuleNotFoundError: No module named 'urllib'
>>>
>>> Why would pydoc be required to run python? or urllib in any case?
>>
>>
>> It's better make the python3-core more lightweight.
>>
>> But in a system which didn't install other python modules but just=20
>> python3-core, then we type help() as below and the help cannot show=20
>> normally. So add the needed pydoc and urllib file to make the help()=20
>> works.
>>
>> =C2=A0# python3
>> =C2=A0>>> help()
>> =C2=A0Traceback (most recent call last):
>> =C2=A0File "<stdin>", line 1, in <module>
>> =C2=A0File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
>> =C2=A0import pydoc
>> =C2=A0ModuleNotFoundError: No module named 'pydoc'
>> =C2=A0File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>> =C2=A0import urllib.parse
>> =C2=A0ModuleNotFoundError: No module named 'urllib'
>>
>>
>> After pydoc and urllib added and also just install python3-core and no=
=20
>> additional python3 modules installed.
>>
>> # python3
>> Python 3.8.2 (default, May 18 2020, 07:15:10)
>> [GCC 9.3.0] on linux
>> Type "help", "copyright", "credits" or "license" for more information.
>> >>> help()
>> Welcome to Python 3.8's help utility!
>>
>> If this is your first time using Python, you should definitely check ou=
t
>> the tutorial on the Internet at https://docs.python.org/3.8/tutorial/.
>>
>> Enter the name of any module, keyword, or topic to get help on writing
>> Python programs and using Python modules.=C2=A0 To quit this help utili=
ty and
>> return to the interpreter, just type "quit".
>>
>> To get a list of available modules, keywords, symbols, or topics, type
>> "modules", "keywords", "symbols", or "topics".=C2=A0 Each module also c=
omes
>> with a one-line summary of what it does; to list the modules whose name
>> or summary contain a given string such as "spam", type "modules spam".
>> help>
>>
>>
>> Thanks,
>>
> I still believe python3-core should be left as small as possible, the us=
e case
> of an embedded device calling help() is probably seldom, IMO that fits m=
ore in
> the workflow of installing the netlib and pydoc modules for that specifi=
c usecase.
>=20
> It also looks like simply installing python3-pydoc would do what you wan=
t, since

Install python3-pydoc indeed solves the problem, but does it mean=20
python3-core depends on python3-pydoc?

Though the use case to type help() is seldom, but help() is much useful=20
and I just add as less as possible files to let help() works.(add urllib=
=20
files in as pydoc depends on it).

Thanks,

> the error to load urllib is coming out of loading pydoc itself and the m=
anifest
> does specify the dependency from pydoc to netclient.
>=20
> Cheers,
>=20
> Alejandro
>=20
>=20
>>>
>>> I believe there is a discrepancy between what python3-core does and=20
>>> what you believe it should do.
>>> python3-core is the smallest possible package to get a working=20
>>> python3 interpreter, if you install python3-core
>>> thats what you get, if you need more modules then you install more=20
>>> modules, e.g. python3-pydoc, python3-netlib,
>>> this way it allows us to keep installation size at minimum.
>>>
>>> If what you want is to get a fully working python3 interpreter,=20
>>> without adding any new packages to the installation,
>>> then you need to install the python3 package (no core), this will in=
=20
>>> fact install python3-modules which contains
>>> all the modules, including python3-pydoc and python3-neclient which=20
>>> is the one that provides urllib.
>>>
>>> Cheers,
>>>
>>> Alejandro
>>>
>>>>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>>>>> ---
>>>>> =C2=A0 .../python/python3/python3-manifest.json=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 | 24=20
>>>>> +++++--------------
>>>>> =C2=A0 meta/recipes-devtools/python/python3_3.8.2.bb |=C2=A0 3 +--
>>>>> =C2=A0 2 files changed, 7 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git=20
>>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json=20
>>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> index 3bcc9b8662..808eadb8f6 100644
>>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> @@ -203,6 +203,7 @@
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}.real",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${bindir}/python3",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${bindir}/pydoc*",
>>>>> "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
>>>>> @@ -289,6 +290,7 @@
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/re.py",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
>>>>> @@ -313,8 +315,11 @@
>>>>> "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/types.py",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/urllib",
>>>>> + "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
>>>>> "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>>> @@ -363,6 +368,7 @@
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
>>>>> + "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
>>>>> @@ -798,7 +804,6 @@
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "plistlib",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "pprint",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "profile",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"pydoc",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "resource",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "shell",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "smtpd",
>>>>> @@ -857,8 +862,6 @@
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>>>>> "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/urllib",
>>>>> - "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>>> @@ -989,21 +992,6 @@
>>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> -=C2=A0=C2=A0=C2=A0 "pydoc": {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summary": "Python inter=
active help support",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepends": [
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"core",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"netclient"
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "files": [
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${bindir}/pydoc*",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>>> - "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>>>> -=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "resource": {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summary": "P=
ython resource control interface",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepends": [
>>>>> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb=20
>>>>> b/meta/recipes-devtools/python/python3_3.8.2.bb
>>>>> index a4a16fd495..36aa54ba6c 100644
>>>>> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
>>>>> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
>>>>> @@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk=
=20
>>>>> =3D " openssl ca-certificates"
>>>>> =C2=A0 FILES_${PN} =3D ""
>>>>> =C2=A0 RPROVIDES_${PN}-modules =3D "${PN}"
>>>>> =C2=A0 -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN}=20
>>>>> ${bindir}/pydoc3"
>>>>> =C2=A0 FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON=
_MAJMIN}"
>>>>> =C2=A0 =C2=A0 # provide python-pyvenv from python3-venv
>>>>> @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev +=3D "dev-elf"
>>>>> =C2=A0 =C2=A0 # catch all the rest (unsorted)
>>>>> =C2=A0 PACKAGES +=3D "${PN}-misc"
>>>>> -RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs=
=
=20
>>>>> python3-pydoc python3-pickle python3-audio"
>>>>> +RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs=
=
=20
>>>>> python3-pickle python3-audio"
>>>>> =C2=A0 RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc=
"
>>>>> =C2=A0 RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-m=
isc"
>>>>> =C2=A0 FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}=20
>>>>> ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
>>>>>
>>>>
>>>>
>>
>>=20
