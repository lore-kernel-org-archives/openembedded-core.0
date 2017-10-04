Return-Path: <Jef.Driesen@niko.eu>
Received: from relay04.secure-mail.be (relay04.secure-mail.be [195.13.7.7])
	by mail.openembedded.org (Postfix) with ESMTP id DE44777C31
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 09:51:01 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BKAwD3rdRZ/7lOx1RdGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFQEBAQECAQEBAQgBAQEBgmZMVBCBFQeddoF2mD4KH4UcAoRWQhUBAQE?=
	=?us-ascii?q?BAQEBAQEBAWoogjMigkMBAQEBAzo/EAIBCBgKFBAyJQIEAQ0FCIopAwGoXYseA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBHQkBgyOBMVGGY4UGBSUMgwqCMgEEiguJHo4?=
	=?us-ascii?q?Jh16DYAWLNoVviwaVVIE5NSKBDnuHeHaIOYEQAQEB?=
X-IPAS-Result: =?us-ascii?q?A2BKAwD3rdRZ/7lOx1RdGgEBAQECAQEBAQgBAQEBFQEBAQE?=
	=?us-ascii?q?CAQEBAQgBAQEBgmZMVBCBFQeddoF2mD4KH4UcAoRWQhUBAQEBAQEBAQEBAWoog?=
	=?us-ascii?q?jMigkMBAQEBAzo/EAIBCBgKFBAyJQIEAQ0FCIopAwGoXYseAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQEBHQkBgyOBMVGGY4UGBSUMgwqCMgEEiguJHo4Jh16DYAWLNoVvi?=
	=?us-ascii?q?waVVIE5NSKBDnuHeHaIOYEQAQEB?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay04.secure-mail.be with ESMTP; 04 Oct 2017 11:51:01 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 4 Oct 2017 11:51:01 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Wed, 4 Oct 2017 11:51:01 +0200
From: <Jef.Driesen@niko.eu>
To: <alexander.kanavin@linux.intel.com>, <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] Small improvement for the initscripts package
Thread-Index: AQHTOPkyug4RbXCTlkS3EIoEWRxT86LLnS2AgAZNSQiAAAIoAIAATzhq///1mICAARZz4g==
Date: Wed, 4 Oct 2017 09:51:00 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE4761033969D5C9@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
	<FAB9E48578194042BE5C63B8BE4761033969175B@MBX.NIKO.LAN>
	<CAJTo0LY6UW=G2pfVPSQH3bMdU03FDMRFACpzsXJYoW1255rPRg@mail.gmail.com>
	<FAB9E48578194042BE5C63B8BE47610339692797@MBX.NIKO.LAN>,
	<238e8a7d-59e1-309a-6f96-6be7261646a2@linux.intel.com>
In-Reply-To: <238e8a7d-59e1-309a-6f96-6be7261646a2@linux.intel.com>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.222]
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Small improvement for the initscripts package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 09:51:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin:
>On 10/03/2017 06:03 PM, Jef.Driesen@niko.eu wrote:
>> Burton, Ross [ross.burton@intel.com]
>>> On 3 October 2017 at 11:03, <Jef.Driesen@niko.eu> wrote:
>>>> Note: base-files-emperor is the package with the custom init scripts. =
I added:
>>>>
>>>> PROVIDES =3D "initscripts"
>>>>
>>>> And in conf/machine/emperor.conf, I added:
>>>>
>>>> PREFERRED_PROVIDER_initscripts =3D "base-files-emperor"
>>>>
>>>   If your initscripts package is a replacement for the oe-core initscri=
pts package, then also set RPROVIDES_${PN} +=3D "initscripts".
>>
>> I tried your suggest, but I still get the error:
>>
>> "The recipe base-files-emperor is trying to install files into a shared =
area when those files already exist." error
>>
>> With base-files-emperor.bb containing:
>>
>> PROVIDES +=3D "initscripts"
>> RPROVIDES_${PN} +=3D "initscripts"
>>
>> What am I still doing wrong?
>>
>> (I'll try to re-build after wiping the tmp directory tonight. A simple "=
bitbake -c cleanall initscripts base-files-emperor" didn't help.)
>
> I might be reading it wrong, but the full error message seems to
> indicate you also have a recipe called emperor-intscripts that provides
> (some of) the same files as base-files-emperor, and they clash?

It's the oe-core initscripts recipe that clashes with base-files-emperor. B=
oth recipies have their own /etc/init.d/halt script.

The full rebuild failed as well, with the error "Can't install ntp-4.2.8p8-=
r0.7@armv7a_vfp_neon: no package provides initscripts-functions"

And that's probably because the oe-core recipe produces a initscripts-funct=
ions package. We stil need that package in our image. I assume that due to =
using PROVIDES, the oe-core initscripts recipe is replaced completely with =
our own base-files-emperor recipe. And since our custom package doesn't pro=
duce an initscripts-functions package (because we still want the one from t=
he oe-core initscripts), the build fails. So it looks like using PROVIDES d=
oesn't work.

Alex
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

