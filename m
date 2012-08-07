Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyoYb-0002EL-0e
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:31:05 +0200
Received: by eaad12 with SMTP id d12so1334427eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 11:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AH0IUztBXOgBW+kzMWSMYduH9xbUirMjB2WUlX+2kd0=;
	b=pPQLFVsCDItE7DvbY2GMAAPKL5UtD5IgMCNoOZsJ/qvBBFUyEA4NrHc8bigMPbKFeI
	RfBXbW7goVkz2lXGxoQi/Yl3bHIcV3MTR3AtcM21signZGfbPQ4Qi0Mty9eoNZAyOGPU
	v5Py0o+1CJSB8KBFK2eB12pq/ZxcfJb+A854pA8cr1NfHTlkPioU6/VlE/L9YcKEIQAA
	X94oe6ovJY2fsQobIxi2SXjEkwwH4FMF7R32qnKqvjts2bFmxF/yGiBomYX95hq4JfSm
	LmLOoLNgy5MQqbATtRoglJc+kxmTrFvjseb48oD92XkkIPUej9PBNXpyF6inF0Dc1pSz
	P3XA==
Received: by 10.14.210.132 with SMTP id u4mr4484540eeo.6.1344363559043;
	Tue, 07 Aug 2012 11:19:19 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d48sm58211470eeo.10.2012.08.07.11.19.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 11:19:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <50213D45.2070802@intel.com>
Date: Tue, 7 Aug 2012 20:19:19 +0200
Message-Id: <1E5BDEED-DBC6-463A-AE9E-2CF45C4920B6@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
	<20120807081710.GQ3267@jama.jama.net>
	<9A466F05-060B-442E-ADD5-A015FE979942@dominion.thruhere.net>
	<50213D45.2070802@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQk3ldASJ3nA7YtogHLHRKJxV9FJS/TNnBg+DMh+27Bu/iXoltoOMyGpiCdCcafR5CnAEovZ
Subject: Re: [PATCH][for-denzil 1/8] opkg-utils: bump SRCREV for Packages cache fix and other fixes
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
X-List-Received-Date: Tue, 07 Aug 2012 18:31:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 18:07 heeft Scott Garman <scott.a.garman@intel.com> =
het volgende geschreven:

> On 08/07/2012 01:19 AM, Koen Kooi wrote:
>>=20
>> Op 7 aug. 2012, om 10:17 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>>=20
>>> On Tue, Aug 07, 2012 at 09:44:41AM +0200, Koen Kooi wrote:
>>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>>=20
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> .../opkg-utils/opkg-utils/add-license-field.patch  |   39 =
-----------
>>>> .../opkg-utils/arfile_header_split.patch           |   27 --------
>>>> .../opkg-utils/index-ignore-filenotfound.patch     |   73 =
--------------------
>>>> .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
>>>> .../opkg-utils/opkg-utils/shebang.patch            |   46 =
------------
>>>> meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +-
>>>> 6 files changed, 1 insertion(+), 221 deletions(-)
>>>> delete mode 100644 =
meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
>>>> delete mode 100644 =
meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
>>>> delete mode 100644 =
meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patc=
h
>>>> delete mode 100644 =
meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>>>> delete mode 100644 =
meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb =
b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>>> index 4fe4038..1996c75 100644
>>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>>> @@ -6,16 +6,11 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>>>>                     =
file://opkg.py;beginline=3D1;endline=3D18;md5=3D15917491ad6bf7acc666ca5f7c=
c1e083"
>>>> RDEPENDS_${PN} =3D "python"
>>>> RDEPENDS_${PN}_virtclass-native =3D ""
>>>> -SRCREV =3D "16665959c330b5958c0f0f4624a9ca7f823f98de"
>>>> +SRCREV =3D "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
>>>=20
>>> Better to use latest for this (only 3 commits, 2 of them fixing
>>> python-2.6)
>>=20
>> Should I cherry-pick them from master to keep history or just make a =
single, new update to latest SRCREV for the denzil branch?
>=20
> I slightly favor cherry-picks from master when possible.

Since the cherry-picks would be incremental, can these 8 be queued and =
extra cherrypicks be added at a later point? I need to actually test =
those before submitting :)=


