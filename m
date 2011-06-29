Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbxXs-0006Mg-4q
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 18:23:20 +0200
Received: by wwi18 with SMTP id 18so1205434wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 09:19:37 -0700 (PDT)
Received: by 10.227.37.7 with SMTP id v7mr939298wbd.41.1309364376949;
	Wed, 29 Jun 2011 09:19:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fi5sm1018237wbb.22.2011.06.29.09.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 09:19:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
Date: Wed, 29 Jun 2011 18:19:33 +0200
Message-Id: <53FFBC7D-50F2-4307-B253-EAB8F86DFDAA@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
	<4E0A794C.5060303@gmail.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 16:23:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 18:14 heeft Cui, Dexuan het volgende geschreven:

> Khem Raj wrote:
>> On 06/28/2011 04:07 AM, Paul Eggleton wrote:
>>> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
>>>> So it works as expected, but the output is a bit confusing. I have
>>>> a few (conflicting) suggestions:=20
>>>>=20
>>>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision',
>>>> e.g.:=20
>>>>=20
>>>> 	meta-archos branch          =3D "master"
>>>> 	meta-archos revision        =3D
>>>> "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>>>=20
>>>> 2) for the extra layers put branch and revision on a single line:
>>>>=20
>>>> 	meta-archos          =3D
>>>> "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>>=20
>>> I'd go with option 2 over 1, personally - the list gets rather long
>>> on something like Angstrom, better to keep it short.
>>=20
>> I would say to do it uniformly and treat oe-core as one of layers too
>> when emitting this info
> Ok. I'll make a new version for this.
> BTW: meta and mete-yocto belong to the same git repo actually, so do =
you think showing them in one line like this
>=20
> meta,meta-yocto   =3D =
"master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>=20
> is better than showing 2 lines like this:
>=20
> meta             =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
> meta-yocto    =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"

That breaks with repos like meta-intel and meta-oe. Maybe something like =
this:

BB_VERSION                  =3D "1.13.2"
TARGET_ARCH                 =3D "arm"
TARGET_OS                   =3D "linux-gnueabi"
MACHINE                     =3D "archosa32"
DISTRO                      =3D "angstrom"
DISTRO_VERSION              =3D "v2011.06-core"
TARGET_FPU                  =3D "hard"
METADATA_BRANCH             =3D "master"
METADATA_REVISION           =3D =
"16f84804cfbe472833ff00bfd2694947eabf8e20"
meta-angstrom               =3D =
"master:fd68a073e9669fdee0a9dc0483b3d39d3e3e0b46"
meta-oe                     =3D =
"master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
meta-efl                    	same
meta-gpe                    	same
meta-gnome                 same
meta-texasinstruments       =3D =
"master:2e16e2fbd93bc00bc0a0afaf86975da7778eaa43"
meta-efikamx                =3D =
"master:70cff8742d629fd32463e3ef1bddb83f04d08dc5"
meta-nslu2                  =3D =
"master:aaf918b85d7a8155d6e7c0ff042808346998fbea"
meta-htc                    =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-nokia                  	same
meta-openmoko              same
meta-palm                   same
meta-zaurus                 same
meta-sugarbay               =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-crownbay               same
meta-emenlow                same
meta-fishriver             same
meta-jasperforest           same
meta-n450                   same
meta-ettus                  =3D =
"master:c34c30fa29f7ab484cc90efb9713325da8e01460"
meta-openpandora            =3D =
"master:edaf6e751f873ed7a82c1116d3d58b9a070052dc"
meta-archos                 =3D =
"master:4b689944d968b0ef4d0e9928e76c54f8a76a919a"

regards,

Koen=


