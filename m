Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RILSA-0001jI-0X
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 16:24:38 +0200
Received: by wwe32 with SMTP id 32so3800210wwe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 07:18:37 -0700 (PDT)
Received: by 10.227.196.79 with SMTP id ef15mr9277935wbb.112.1319465917556;
	Mon, 24 Oct 2011 07:18:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm39302362wbb.1.2011.10.24.07.18.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 07:18:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319465445.25011.18.camel@ted>
Date: Mon, 24 Oct 2011 16:18:34 +0200
Message-Id: <C0347AB9-9B51-4127-AEB7-AA1F0BE53BD6@dominion.thruhere.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<d546fdc94cb627040c657facc23f00406967c838.1319394187.git.sgw@linux.intel.com>
	<1319463290.25011.10.camel@ted>
	<3D2F5FE5-B1DC-44C4-8A5A-E81C41F00125@dominion.thruhere.net>
	<1319465445.25011.18.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 20/27] libtool: Upgrade from 2.4 -> 2.4.2
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
X-List-Received-Date: Mon, 24 Oct 2011 14:24:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 16:10 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-10-24 at 15:37 +0200, Koen Kooi wrote:
>> Op 24 okt. 2011, om 15:34 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>=20
>>>> Adjust prefix.patch and delete resolve-sysroot.patch
>>>> since its already applied upstream
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> .../libtool/{libtool.inc =3D> libtool-2.4.2.inc}     |   26 =
+++++++++---
>>>> meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ------
>>>> ...libtool-cross_2.4.bb =3D> libtool-cross_2.4.2.bb} |    2 +-
>>>> ...btool-native_2.4.bb =3D> libtool-native_2.4.2.bb} |    2 +-
>>>> ...nativesdk_2.4.bb =3D> libtool-nativesdk_2.4.2.bb} |    2 +-
>>>> meta/recipes-devtools/libtool/libtool/prefix.patch |   46 =
++++++++++----------
>>>> .../libtool/libtool/resolve-sysroot.patch          |   42 =
------------------
>>>> .../libtool/{libtool_2.4.bb =3D> libtool_2.4.2.bb}   |    2 +-
>>>> 8 files changed, 47 insertions(+), 88 deletions(-)
>>>> rename meta/recipes-devtools/libtool/{libtool.inc =3D> =
libtool-2.4.2.inc} (57%)
>>>> delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
>>>> rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb =3D> =
libtool-cross_2.4.2.bb} (98%)
>>>> rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb =3D> =
libtool-native_2.4.2.bb} (96%)
>>>> rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb =3D> =
libtool-nativesdk_2.4.2.bb} (97%)
>>>> delete mode 100644 =
meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
>>>> rename meta/recipes-devtools/libtool/{libtool_2.4.bb =3D> =
libtool_2.4.2.bb} (94%)
>>>>=20
>>>> diff --git a/meta/recipes-devtools/libtool/libtool.inc =
b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> similarity index 57%
>>>> rename from meta/recipes-devtools/libtool/libtool.inc
>>>> rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> index ef9095b..1f652ef 100644
>>>> --- a/meta/recipes-devtools/libtool/libtool.inc
>>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> @@ -1,4 +1,3 @@
>>>> -SUMMARY =3D "Generic library support script"
>>>=20
>>> Why drop the SUMMARY field?
>>=20
>> What's the difference between SUMMARY and DESCRIPTION? And what =
happens if both are set?
>=20
> SUMMARY is a one line 74? character summary of the package, =
DESCRIPTION
> is a multiple line stream of text containing a more verbose =
description.
> What happens to the data is package backend specific, I know RPM has
> uses for both. There was definitely discussion about this on the =
mailing
> list at the time, I'm not sure what if anything made it into the =
manuals
> but if its not there it should be added.


It seems to get OR'd:

meta/classes/package_deb.bbclass:       summary =3D =
bb.data.getVar('SUMMARY', localdata, True) or =
bb.data.getVar('DESCRIPTION', localdata, True) or "."
package_deb.bbclass:                     description =3D =
bb.data.getVar('DESCRIPTION', localdata, True) or "."

meta/classes/package_ipk.bbclass:         summary =3D =
bb.data.getVar('SUMMARY', localdata, True) or =
bb.data.getVar('DESCRIPTION', localdata, True) or "."
package_ipk.bbclass:                                    description =3D =
bb.data.getVar('DESCRIPTION', localdata, True) or "."

meta/classes/package_rpm.bbclass:       srcsummary =3D =
(bb.data.getVar('SUMMARY', d, True) or bb.data.getVar('DESCRIPTION', d, =
True) or ".")
package_rpm.bbclass:    srcdescription =3D bb.data.getVar('DESCRIPTION', =
d, True) or "."

regards,

Koen=


