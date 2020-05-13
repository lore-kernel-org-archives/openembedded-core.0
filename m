Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web12.7238.1589380126991046024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gLk4ujXL;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShEvA9vsQ54c7E0xiaiNlA9VO86cEnnFLhYhNk/B9MtsM5StT4LUwcMDuy98ZixSx3FZH83kAj0JyY0R45JFKKj4diHyovNChDLQ8eC+BjbleRn0cmLjYJ1cqvgKfpo7KW0cxvHYaC66MK450XUqIDfG/svaBgk3JoJdtBoVQMN10LlRKWS4tDF8gUAGD4ZIBvbNwKEZ90gjFk/3gVuV/5nB53VaxFvXkq+xYZjLfMgmmSj1zdrdKe8sa+vxvyyjjyZ/6DCenuUY/9nRQKnvyTGe9mygmSpKL1widBojYON1pn86JU4F5RYpDhMSoLj4/RfcricCynnH6qYo39fb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTuIXnRPprIAM/mcVnZjL9dmFNC7Ik3Zv/RIuBvUXDk=;
 b=TWwFvu2ocdC2pMIzyCP/hDHNoiSUbqR0tPB1TKe3JCgJZtwmu7Dk9vYeEWt82jXeqi8QLzPJoaZxGQ5hkpPYNS8EYKUmubcnFK7PCzERal0P/s25iVsiywcFDgO5c7nm6a0I1km/eVnKDXqobZVH9MAAcpEHkBJttKHMuxn3r+i12FfHcFvZAZ033aNMyIY7TF2K1SsYqTcP8znAs+X6nLW6+xoJHJn0OX+Iz/Q31PhqxFJ0sznrCgpI3O1Wz0gBmHHZZoAtsRti2zxjyZMv+Sqv+Rdr+cX8gvTPlh2LJOZ+drnLZSB4k353Vo+VnlaOVRaJ37rrBVRtkC1PpXcPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTuIXnRPprIAM/mcVnZjL9dmFNC7Ik3Zv/RIuBvUXDk=;
 b=gLk4ujXL2wTErpfuFdDuHot8PymRh1fSr0RcgOyXQkjjdpJq8AanpUogrhehPUWw16SGHcDM2z2JBokAiFEAxwEHa8ovdbAjkMlOgKpnOvgTiLOElG9QVLeV9SGsH+uEmOOIgvP5+Wi4kOBcAZlmmG2IkKYC/oOSXAxoqHvdEjE=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1315.namprd11.prod.outlook.com (2603:10b6:404:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 13 May
 2020 14:28:44 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::d162:4c65:c2ce:c3e0]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::d162:4c65:c2ce:c3e0%7]) with mapi id 15.20.2979.028; Wed, 13 May 2020
 14:28:44 +0000
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>,
 Rahul Kumar <rahulk@mvista.com>,
 OE-core <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
 <160C6C52084AA802.10857@lists.openembedded.org>
 <CANv91vOtL1SwZAUWkWyCLF7TY5bXdKdb_-TQOMPgvPpWcJwtiA@mail.gmail.com>
 <f97a12c8-3323-99ca-0f6a-dd2d020c217f@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8ca68742-7d12-a108-2206-4ce8c1d87e5c@windriver.com>
Date: Wed, 13 May 2020 10:28:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <f97a12c8-3323-99ca-0f6a-dd2d020c217f@windriver.com>
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Wed, 13 May 2020 14:28:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c2af93b-928d-4913-aef1-08d7f749f0bf
X-MS-TrafficTypeDiagnostic: BN6PR11MB1315:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1315410994C6C88A67ADC5019FBF0@BN6PR11MB1315.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4diL/+XsYoiXNRUAJ75ze/7nK1bvOeiXauH1Woybki0YR029uAK4zWPh5hejzBBNlOtBFGMmxkE6yRiXXs1z0DpWY1GSbxNXq+A+ipdCxJuSLrOHXVkcJZy+Osov1bpjRIy53ixjqWl2LrR/qnUqvbKqMjT8Kq9l5vWGdI38nFLRr7sMWrBOEvZFIgnVhp4ZiMSY1ujopRdnhcgHIb2Oo3RZV4TN55hYkCxMCJkqlmpztybnRbPtYaaZiciOn2tQGFEmpYAvL0N563Kpue7ESM0Em2ctQof4MiHoxoJFM+cnCpx5VjPETXiwlMkUghgTp7KyyrpCJ82xAfTpqFPIh73zbo7SgFAEn4mcmY5XZB2KTgFrdXeXqlbpRouKBvXYmFSivLDzDLp/tkhSOGaYgW/tDeGVbZLujZCG663MEuznadOsqbYRSUPv4//8HfTpmmZmGMvw6ZxsHTm5CJvDcnN2ganzM9JaGc2a+bY7h1tsXYWbKYa+Za3BqY2CO9OgnQOJOMP3RdJzlcsiKyJTNc7w+Ck0yXDZ2jrzfnwYJbSS5OLmVpowzpk5cRg4KFPJXIWfSsky5iJ4qdXSod2tLMDKxJFcjytqwD17jM95ODRXy6hy2D39L8536OfnUNmH8vi9vlY9zhIuYf57/wK1UrmteNTcAowtzgWVMTB+xGc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(136003)(346002)(39850400004)(33430700001)(2616005)(956004)(186003)(16526019)(2906002)(5660300002)(53546011)(966005)(86362001)(31696002)(30864003)(33440700001)(6666004)(26005)(52116002)(44832011)(54906003)(316002)(16576012)(8936002)(8676002)(110136005)(83080400001)(4326008)(66556008)(36756003)(31686004)(6486002)(66946007)(478600001)(66476007)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	99XAhiiZ0I5Ytg8A3wffecljUQ4F+XfCQcIsxpDkWgyRYDgeD3zHUlDoHJ+YUMd3ZASOTbI0j+TxiDoaqXkdj8PEMuNYSOBM7jdk8OuNNBswhSXF7vCSPVpyxOtq1OWWznh/CgCJ6j9OWeIlpwpxZIlY+wmUQW1GITF9lLcKtjTXjscs3+9037C+4HCb1l2I3xOyi1uaTkydLhXFbDjbzDgKZHlde+SkRn+1sWcnQwkZyiBMxst029SE0vqAgsN9kB8FseFEKEp4maOOgwQguhGT98mYsWU4Y2/U85JeHSipPsts+KoYzKslc82GVH5tHa7/U1Q3YNxTGhOG6/6wYvviZ7/J1rmCEOcBnc2zCPMKTU1eY1WrdL1uBcyxrTZHjI45a6AA5jvt2FXQscZPeR38wooq8QB0nWUCBBEQi6gdJKtySwI32U+jUvKiOgxrS/JoA2c5yYhxUtMloqD2A+TfjHkjrPeUqhqxdjbZBek=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2af93b-928d-4913-aef1-08d7f749f0bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 14:28:44.1470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1K/gOVDt0/KodUnxBF7ewSE+I4H9SoHisNnjb3Mm4LH0x36llMBwlb8AzXzaHRnmVYFgZ/wXYrU9+gRTSgW2JH0LqkH72waoO0dItgPzzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1315
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 5/12/20 7:22 PM, Randy MacLeod wrote:
> On 2020-05-12 12:58 a.m., Rahul Kumar wrote:
>> Hi,
>>
>> Can any one please help me to figure out how to deal with the GPLv3+=20
>> issue.
>>
>> you can see my Patch at below link
>> https://patchwork.openembedded.org/patch/172134/
>>
>> *Issue:*
>> the new license (GPLv3) causes problems:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814
>> *
>> *
>
> Hi Rahul,
>
> I'm having some email problems with the oe-core list so apologies
> if this is redundant.
>
> What happens if you split the license info into two parts like:
>
> $ grep "^LICENSE" recipes-extended/libvirt/libvirt_6.1.0.bb
> LICENSE =3D "LGPLv2.1+ & GPLv2+"
> LICENSE_${PN}-ptest =3D "GPLv2+ & LGPLv2.1+"
> except of course with GPLv3.
>
> I might try that tomorrow on our local instance of the YP autobuilder.
> If you'd like to set one up @ mvista, I hear from Trevor that it doesn't
> take all that much time. As others have explained, you can also dig
> through the yocto-autobuilder2/yocto-autobuilder-helper git repos.

Hi Rahul, I can definitely help you get an autobuilder instance running=20
locally, if you'd like. At the moment I'd suggest doing so on a host=20
that's running Fedora, as that's where I've had the most success=20
(Richard has explained to me how they run it on Ubuntu, but I haven't=20
gotten it fully functional there yet).

Are you on either the #yocto and/or #oe IRC channels?

>
> ../Randy
>
>> Thanks & Regards,
>> Rahul Kumar
>> Software Engineer,Linux Solutions Engineering
>> Group,Montavista Software LLC
>> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
>> <https://plus.google.com/+CodeTwoSoftware>
>>
>>
>> On Wed, May 6, 2020 at 4:47 PM Rahul Kumar via lists.openembedded.org=
=20
>> <http://lists.openembedded.org>=20
>> <rahulk=3Dmvista.com@lists.openembedded.org=20
>> <mailto:mvista.com@lists.openembedded.org>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 Hi Randy,
>>
>> =C2=A0=C2=A0=C2=A0 As per your suggestion I did some progress.
>>
>> =C2=A0=C2=A0=C2=A0 Issue 1:
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> =C2=A0=C2=A0=C2=A0 Configuration for this issue:
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 MACHINE =3D "edgerouter"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 DISTRO =3D "poky"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDKMACHINE =3D "i686"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PACKAGE_CLASSES =3D "package_rpm packag=
e_deb package_ipk"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D 'image-buildinfo'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 IMAGE_BUILDINFO_VARS_append =3D ' IMAGE=
_BASENAME IMAGE_NAME'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 QEMU_USE_KVM =3D 'True'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D 'report-error'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PREMIRRORS =3D ''
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D '1'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_NUMBER_THREADS =3D '16'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PARALLEL_MAKE =3D '-j 16'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL =3D '5'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL_task-testimage =3D '=
0'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL =3D '2.7'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL_task-testimage =3D=
 '2.1'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D 'testimage'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D '1500'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SANITY_TESTED_DISTROS =3D ''
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_EXT_TYPE =3D 'minimal'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D '1'
>> =C2=A0=C2=A0=C2=A0 Command:
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 bitbake core-image-sato core-image-sato-dev core-ima=
ge-sato-sdk
>> =C2=A0=C2=A0=C2=A0 core-image-minimal core-image-minimal-dev core-image=
-sato-ptest
>> =C2=A0=C2=A0=C2=A0 core-image-sato:do_populate_sdk -k
>>
>> =C2=A0=C2=A0=C2=A0 but could not reproduce the issue.
>>
>> =C2=A0=C2=A0=C2=A0 work-around to reproduce this issue.
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 I am observing since bzip2-tests is a git repo and
>> =C2=A0=C2=A0=C2=A0 fsmonitor-watchman.sample (.git/hooks/fsmonitor-watc=
hman.sample) is
>> =C2=A0=C2=A0=C2=A0 perl script.
>> =C2=A0=C2=A0=C2=A0 that's why I got this error.
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0so manually I copied fsmonitor-watchman.=
sample file into the
>> =C2=A0=C2=A0=C2=A0 bzip2-tests/.git/hooks and able to reproduce the iss=
ue.
>> =C2=A0=C2=A0=C2=A0 Error:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
>> =C2=A0=C2=A0=C2=A0 step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issu=
e:
>> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample=
=20
>> contained
>> =C2=A0=C2=A0=C2=A0 in package bzip2-ptest requires /usr/bin/perl, but n=
o providers
>> =C2=A0=C2=A0=C2=A0 found in RDEPENDS_bzip2-ptest? [file-rdeps]
>> =C2=A0=C2=A0=C2=A0 step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run =
found fatal
>> =C2=A0=C2=A0=C2=A0 errors. Please consider fixing them.
>>
>> =C2=A0=C2=A0=C2=A0 I find out the solution by appending RDEPENDS_${PN}-=
ptest with perl.
>> =C2=A0=C2=A0=C2=A0 RDEPENDS_${PN}-ptest +=3D "make bash perl"
>>
>> =C2=A0=C2=A0=C2=A0 so this issue got resolved.
>>
>> =C2=A0=C2=A0=C2=A0 Issue2:
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 Configuration for this issue
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 MACHINE =3D "qemux86"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 DISTRO =3D "poky"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDKMACHINE =3D "i686"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PACKAGE_CLASSES =3D "package_rpm packag=
e_deb package_ipk"
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INCOMPATIBLE_LICENSE =3D '*GPLv3'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 WARN_QA_remove =3D 'incompatible-licens=
e'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 QEMU_USE_KVM =3D 'True'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D 'report-error'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PREMIRRORS =3D ''
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D '1'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_NUMBER_THREADS =3D '16'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PARALLEL_MAKE =3D '-j 16'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL =3D '5'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL_task-testimage =3D '=
0'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL =3D '2.7'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL_task-testimage =3D=
 '2.1'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D 'testimage'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D '1500'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SANITY_TESTED_DISTROS =3D ''
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_EXT_TYPE =3D 'minimal'
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D '1'
>> =C2=A0=C2=A0=C2=A0 Command
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 bitbake core-image-minimal core-image-full-cmdline -=
k
>>
>>
>> =C2=A0=C2=A0=C2=A0 INCOMPATIBLE_LICENSE =3D '*GPLv3'
>> =C2=A0=C2=A0=C2=A0 WARN_QA_remove =3D 'incompatible-license'
>> =C2=A0=C2=A0=C2=A0 My doubt is since above configuration is using durin=
g build and we
>> =C2=A0=C2=A0=C2=A0 are using GPLv3+ license then definetly it will repo=
rt error.
>>
>> =C2=A0=C2=A0=C2=A0 It looks like you are packaging the test code/data w=
ith the main=20
>> package
>> =C2=A0=C2=A0=C2=A0 not in bzip2-ptest. Have a look at:
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/recipes-support/libpcre/lib=
pcre_8.44.bb
>> =C2=A0=C2=A0=C2=A0 <http://libpcre_8.44.bb>
>> =C2=A0=C2=A0=C2=A0 for an example. There are many more.
>> =C2=A0=C2=A0=C2=A0 Also, if you look at oe-core.git:
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ rgrep LICENSE_ * =C2=A0| grep =
PN
>> =C2=A0=C2=A0=C2=A0 you can see many examples of sub-packages with diffe=
rent licenses
>> =C2=A0=C2=A0=C2=A0 than the main package. One example is:
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/recipes-support/gnutls/gnut=
ls_3.6.13.bb
>> =C2=A0=C2=A0=C2=A0 <http://gnutls_3.6.13.bb>
>> =C2=A0=C2=A0=C2=A0 I hope that can address the buildbot problem but I h=
aven't tried it
>> =C2=A0=C2=A0=C2=A0 myself yet.
>>
>> =C2=A0=C2=A0=C2=A0 Explanation:
>> =C2=A0=C2=A0=C2=A0 I checked, Here is packaging the test code/data in b=
zip2-ptest.
>> /opt/opensource/build/tmp/work/mips64-poky-linux/bzip2/1.0.8-r0/package=
s-split/bzip2-ptest
>>
>> =C2=A0=C2=A0=C2=A0 I tried with the changes below=C2=A0 in the bzip2_1.=
0.8.bb
>> =C2=A0=C2=A0=C2=A0 <http://bzip2_1.0.8.bb> file.
>> =C2=A0=C2=A0=C2=A0 LICENSE =3D "bzip2"
>> =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D "GPLv3+"
>>
>> =C2=A0=C2=A0=C2=A0 WARNING: LICENSE_bzip2-ptest includes licenses (GPLv=
3+) that are not
>> =C2=A0=C2=A0=C2=A0 listed in LICENSE
>> =C2=A0=C2=A0=C2=A0 To resolve this warning i did below changes.
>> =C2=A0=C2=A0=C2=A0 LICENSE =3D "bzip2 & GPLv3+"
>> =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D "GPLv3+"
>>
>> =C2=A0=C2=A0=C2=A0 But I am getting below error in both case
>>
>> =C2=A0=C2=A0=C2=A0 ERROR: Nothing RPROVIDES 'bzip2' (but
>> /opt/opensource/poky/meta/recipes-extended/packagegroups/packagegroup-c=
ore-full-cmdline.bb
>> =C2=A0=C2=A0=C2=A0 <http://packagegroup-core-full-cmdline.bb>,
>> /opt/opensource/poky/meta/recipes-devtools/python/python3_3.8.2.bb
>> =C2=A0=C2=A0=C2=A0 <http://python3_3.8.2.bb> RDEPENDS on or otherwise r=
equires it)
>> =C2=A0=C2=A0=C2=A0 bzip2 was skipped: it has incompatible license(s): G=
PL-3.0+
>> =C2=A0=C2=A0=C2=A0 NOTE: Runtime target 'bzip2' is unbuildable, removin=
g...
>> =C2=A0=C2=A0=C2=A0 Missing or unbuildable dependency chain was: ['bzip2=
']
>>
>> =C2=A0=C2=A0=C2=A0 So as per my understanding, if we are splitting the =
package and
>> =C2=A0=C2=A0=C2=A0 assigning Licence to it.
>> =C2=A0=C2=A0=C2=A0 example:
>> =C2=A0=C2=A0=C2=A0 LICENSE =3D "bzip2"
>> =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D "GPLv3+"
>>
>> =C2=A0=C2=A0=C2=A0 In this case I have to set LICENSE_PATH where your l=
icense file is
>> =C2=A0=C2=A0=C2=A0 located.
>> =C2=A0=C2=A0=C2=A0 or if I am using standard license, I have to set LIC=
ENSE first then
>> =C2=A0=C2=A0=C2=A0 we can set LICENSE_${PN}-ptest.
>>
>> =C2=A0=C2=A0=C2=A0 Example:
>> =C2=A0=C2=A0=C2=A0 LICENSE =3D "bzip2 & GPLv3+"
>> =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D "GPLv3+"
>>
>> =C2=A0=C2=A0=C2=A0 Kindly comment on it and feel free to point out if i=
 am wrong at any
>> =C2=A0=C2=A0=C2=A0 point.
>>
>>
>> =C2=A0=C2=A0=C2=A0 *Thanks & Regards,*
>> =C2=A0=C2=A0=C2=A0 Rahul Kumar
>> =C2=A0=C2=A0=C2=A0 Software Engineer,Linux Solutions Engineering
>> =C2=A0=C2=A0=C2=A0 Group,Montavista Software LLC
>> =C2=A0=C2=A0=C2=A0 Email Id: rahulk@mvista.com <mailto:rahulk@mvista.co=
m>
>> =C2=A0=C2=A0=C2=A0 <https://plus.google.com/+CodeTwoSoftware>
>>
>>
>> =C2=A0=C2=A0=C2=A0 On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
>> =C2=A0=C2=A0=C2=A0 <randy.macleod@windriver.com <mailto:randy.macleod@w=
indriver.com>>
>> =C2=A0=C2=A0=C2=A0 wrote:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On 2020-04-27 3:39 p.m., Ale=
xander Kanavin wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > You need to first se=
e from the failure page which
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > failing, for example=
 non-gpl3 is one such.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Then you find that c=
onfiguration in config.json. The below
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > hopefully be self-ex=
planatory in how you should set up the=20
>> build?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |"non-gpl3" : { "NEE=
DREPOS" : ["poky", "meta-gplv2"],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MACHINE" :
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > "qemux86", "BBTARGET=
S" : "core-image-minimal
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 core-image-full-cmdline",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > "extravars" : [ "INC=
OMPATIBLE_LICENSE =3D '*GPLv3'",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "WARN_QA_remove =3D
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > 'incompatible-licens=
e'" ], "EXTRACMDS" : [
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > "../../yocto-autobui=
lder-helper/scripts/check-gplv3" ] },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |Alex
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hi Rahul,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sorry for my late reply.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The commit log for v2 is ver=
y good now!
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for incorporating my =
--pedantic suggestions. ;-)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It seems that you need a per=
l dependency for something (docs?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ cd ...=
/bzip2.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ grep -=
r "perl " *
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 format.p=
l:#!/usr/bin/perl -w
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 README.X=
ML.STUFF:It uses format.pl <http://format.pl>, a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl script...
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Then we need to figure out h=
ow to deal with the GPLv3 issue.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The buildbot output can be t=
edious to figure out. I haven't=20
>> really
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spent enough time plugging a=
way at it to be proficient yet=20
>> either.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Have you been able to reprod=
uce the problems that Richard=20
>> reported?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If not, and you've tried for=
 a bit, then just say so and I'll=20
>> try to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help tomorrow or early next =
week.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It looks like you are packag=
ing the test code/data with the main
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not in bzip2-ptest. Have a l=
ook at:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/rec=
ipes-support/libpcre/libpcre_8.44.bb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <http://libpcre_8.44.bb>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for an example. There are ma=
ny more.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Also, if you look at oe-core=
.git:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ rgrep =
LICENSE_ *=C2=A0 | grep PN
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 you can see many examples of=
 sub-packages with different=20
>> licenses
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 than the main package. One e=
xample is:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/rec=
ipes-support/gnutls/gnutls_3.6.13.bb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <http://gnutls_3.6.13.bb>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I hope that can address the =
buildbot problem but I haven't=20
>> tried it
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 myself yet.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BTW, Trevor has gotten the Y=
P autobuilder going at Wind River=20
>> and
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 he'll be sending a few docum=
entation updates next week or so.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 That may help in case you wa=
nt to reproduce the YP AB test
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 infrastructure. I expect tha=
t you don't _have_ to do so but
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I think it would be good if =
more contributing organizations did
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 have an instance with only l=
imited builders of the YP AB so that
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 we can do more testing befor=
e Richard runs our changes through
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the main system. Richard has=
 cautioned that the YP AB has=20
>> lots of
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 builders each of which has m=
any cores but I hope that we can at
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 least
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do some AB checking ourselve=
s.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../Randy
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > On Mon, 27 Apr 2020 =
at 20:54, Rahul Kumar <rahulk@mvista.com
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:rahulk@mvista.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > <mailto:rahulk@mvist=
a.com <mailto:rahulk@mvista.com>>> wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0H=
i Richard/Alexander,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0I=
 am not able to understand how I can use the below file.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree=
/config.json
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0d=
id you mean to say that i have to set MACRO in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local.conf based on
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0t=
his file.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0*=
Thanks & Regards,*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0R=
ahul Kumar
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0S=
oftware Engineer,Linux Solutions Engineering
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0G=
roup,Montavista Software LLC
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0E=
mail Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:rahulk@mvista.com <m=
ailto:rahulk@mvista.com>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > =C2=A0<https://plus.=
google.com/+CodeTwoSoftware>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0O=
n Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0<=
richard.purdie@linuxfoundation.org
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:richard.purdie@linux=
foundation.org>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0<=
mailto:richard.purdie@linuxfoundation.org
>> <mailto:richard.purdie@linuxfoundation.org>>> wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 > You need to look at configurations defined here:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree=
/config.json
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 > and replicate them locally. Then you can=20
>> reproduce the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0failures that
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 > the AB gets in those configurations.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0That start of the failing logs on the autobuilder
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 also list out the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0configuration options for that build.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0Cheers,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0Richard
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # Randy MacLeod
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Wind River Linux
>>
>> =C2=A0=C2=A0=C2=A0=20
>>
>
>
