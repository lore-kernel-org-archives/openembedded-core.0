Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U2d83-0003Px-Ja
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 08:39:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2013 23:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="282868836"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 23:23:52 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 5 Feb 2013 07:23:51 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Tue, 5 Feb 2013 07:23:51 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
Thread-Index: AQHOAI4PdLN+lulFpkeBYkrJwRybYZhnZ2sAgAIFehCAANXaAIAAnliA
Date: Tue, 5 Feb 2013 07:23:51 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161F377B@IRSMSX102.ger.corp.intel.com>
References: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
	<258C02DC-9331-432A-93B2-4173DA69968D@gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
	<51102D9E.1000305@linux.intel.com>
In-Reply-To: <51102D9E.1000305@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools: upgrade to v1.60-24.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 07:39:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

In my own findings, it appears that 1.60-24.2 is a stable release.

It is included in:
http://packages.ubuntu.com/raring/net-tools
and
http://packages.debian.org/wheezy/net-tools

I do agree with you that these two distros are not yet released.
The download site does not say anything about 1.60-24.2 being an unstable r=
elease.

If you have info that this version is unstable, please let me know.

Regards,
Cristian


-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Monday, February 04, 2013 11:52 PM
To: Iorga, Cristian; Lei Yang
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2

On 02/04/2013 01:10 AM, Iorga, Cristian wrote:
> See my answers below.
>
> -----Original Message-----
> From: Lei Yang [mailto:yanglei.fage@gmail.com]
> Sent: Sunday, February 03, 2013 4:15 AM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
>
>
>
> Sent from my iPhone
>
> On 2013-2-1, at 23:09, Cristian Iorga <cristian.iorga@intel.com> wrote:
>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>> .../net-tools-config.h                                           |    0
>> .../net-tools-config.make                                        |    0
>> .../net-tools/{net-tools_1.60-23.bb =3D> net-tools_1.60-24.2.bb}   |    =
6 +++---
>> 3 files changed, 3 insertions(+), 3 deletions(-) rename
>> meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D>=20
>> net-tools-1.60-24.2}/net-tools-config.h (100%) rename
>> meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D>=20
>> net-tools-1.60-24.2}/net-tools-config.make (100%) rename=20
>> meta/recipes-extended/net-tools/{net-tools_1.60-23.bb =3D>=20
>> net-tools_1.60-24.2.bb} (94%)
>>
>> diff --git
>> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.
>> h=20
>> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi
>> g
>> .h
>> similarity index 100%
>> rename from
>> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
>> rename to
>> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.
>> h
>> diff --git
>> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.
>> m
>> ake
>> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi
>> g
>> .make
>> similarity index 100%
>> rename from
>> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.ma
>> k
>> e rename to
>> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.
>> m ake diff --git=20
>> a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> similarity index 94%
>> rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> index bc61d21..4040e1a 100644
>> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> @@ -5,7 +5,7 @@ BUGTRACKER =3D "http://bugs.debian.org/net-tools"
>> LICENSE =3D "GPLv2+"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b \
>>                      file://ifconfig.c;beginline=3D11;endline=3D15;md5=
=3Dd1ca372080ad5401e23ca0afc35cf9ba"
>> -PR =3D "r3"
>> +PR =3D "r0"
>>
>
> Is there a reason to change it back to r0 Yes, because an upgrade has=20
> been done.
>
>
> Lei
>
>> SRC_URI =3D=20
>> "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=3Dta
>> rball \
>>
>> ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=3Dno;name=
=3D
>> p
>> atch \
>
> Not sure why it not apply but not remove it.
> Sorry, I don't understand your comment.
> This package is distributed as a "base" tarball + patches to higher versi=
ons.
> Hence, I don't understand your comment.
>
Cristian:

A couple of questions that further need answering:

It seems that 1.60-24.2 is a testing/unstable version. Although it also see=
ms that whezzy and Sid are running with this version.

Lei:

If you look at the full recipe, you will see that net-tools has it's own do=
_patch to deal with the downloaded version diff patch, therefore not applyi=
ng during normal patching is correct.

In this case as Cristian points out, the .diff.gz is the "update"

Sau!


>
> Lei
>
>> @@ -17,8 +17,8 @@ S =3D "${WORKDIR}/net-tools-1.60"
>> SRC_URI[tarball.md5sum] =3D "ecaf37acb5b5daff4bdda77785fd916d"
>> SRC_URI[tarball.sha256sum] =3D "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc=
9aa3095d5c591f302c2de0f5"
>>
>> -SRC_URI[patch.md5sum] =3D "2412e55c20308d5fbd28bfadd18c075f"
>> -SRC_URI[patch.sha256sum] =3D "d678b3ea97d6c7ca548918994642bfc6b5511ab02=
f3a5881dfcca00c88bfd73b"
>> +SRC_URI[patch.md5sum] =3D "524658bb8df5ff92c4a991f5edcaf240"
>> +SRC_URI[patch.sha256sum] =3D "170cc024fcb34329f4c25fd88b5f160a06be5d6d3=
eaf0bc976650fd1b1a6235d"
>>
>> inherit gettext
>>
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


