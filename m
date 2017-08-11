Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFF1471B0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 01:53:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7B1rZQs029580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Aug 2017 18:53:35 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 18:53:34 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
	<CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
	<CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
	<04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
	<20170810235637.GA3320@jama>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a7fc84e4-f364-ad8e-faf6-7d156f10d5cf@windriver.com>
Date: Thu, 10 Aug 2017 20:53:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170810235637.GA3320@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 11 Aug 2017 01:53:36 -0000
X-Groupsio-MsgNum: 101240
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="97WJNOcoetNRp0ue3QpksuTj6ji3uLn0s"

--97WJNOcoetNRp0ue3QpksuTj6ji3uLn0s
Content-Type: multipart/mixed; boundary="OSTQuor55RUPfxlfOCRmQlCvvCjqf9uAo";
 protected-headers="v1"
From: Mark Hatle <mark.hatle@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <a7fc84e4-f364-ad8e-faf6-7d156f10d5cf@windriver.com>
Subject: Re: [OE-core] [PATCH] autoconf-archive: move from meta-oe to OE-core
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
 <CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
 <CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
 <04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
 <20170810235637.GA3320@jama>
In-Reply-To: <20170810235637.GA3320@jama>

--OSTQuor55RUPfxlfOCRmQlCvvCjqf9uAo
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/10/17 6:56 PM, Martin Jansa wrote:
> On Thu, Aug 10, 2017 at 03:34:48PM -0500, Mark Hatle wrote:
>> On 8/10/17 3:18 PM, Martin Jansa wrote:
>>> -2
>>
>> I agree that autoconf-archive should be in oe-core.  But...
>=20
> No argument about that, it was already merged to oe-core, I was only
> commenting about the gnome-common change included in this commit.

Sorry, I missed the context.. ya if the gnome change is arch or board spe=
cific
that is wrong.  There should be no reason for that.

--Mark

>>
>>> LBTM
>>>
>>>
>>> If gnome-common should depend on TUNE_PKGARCH autoconf-archive, then =
it cannot inherit allarch anymore, see:
>>>
>>>
>>> ERROR: gnome-common different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
>>> runtaskdeps changed:
>>> autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with h=
ash e26a8076711b7e88a3ffcda74a9e5332
>>>  changed to
>>> autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with h=
ash ee3f5138593bed3feb8519cf3c26aa7b
>>> Hash for dependent task autoconf-archive/autoconf-archive_2016.09.16.=
bb.do_packagedata changed from e26a8076711b7e88a3ffcda74a9e5332 to ee3f51=
38593bed3feb8519cf3c26aa7b
>>>
>>
>> There should not be an architectural difference.  There is no reason i=
t
>> shouldn't be allarch.  Part of the reason we really need to move it in=
to oe-core
>> is that currently different BSPs may implement it differently making t=
he
>> 'allarch' even MORE complicated.
>=20
> I don't understand what you mean with BSPs wrt autoconf-archive, but as=

> it is now, the autoconf-archive in oe-core isn't allarch, so allarch
> gnome-common in meta-oe cannot depend on it.
>=20
> It could be whitelisted in layer.conf or allarch can be dropped from
> gnome-common or autoconf-archive can be updated to inherit allarch as
> well - either of these options is fine with me, but I won't merge this
> change in current state.
>=20
>>
>> --Mark
>>
>>>
>>> On Fri, Jul 28, 2017 at 6:45 PM, Khem Raj <raj.khem@gmail.com
>>> <mailto:raj.khem@gmail.com>> wrote:
>>>
>>>     On Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly <patrick.ohly@intel=
=2Ecom
>>>     <mailto:patrick.ohly@intel.com>> wrote:
>>>     > Having common macros in OE-core that are needed by autotools ba=
sed
>>>     > projects makes sense. For example, tpm2.0-tools in meta-measure=
d
>>>     > depended on meta-oe only because of autoconf-archive.
>>>     >
>>>     > This is a verbatim copy of the autoconf-archive recipe in
>>>     > meta-openembedded rev 1cbd1bc1, with just one change: the patch=
 which
>>>     > disabled the installation of ax_code_coverage.m4 and
>>>     > ax_check_enable_debug.m4 was removed.
>>>     >
>>>     > So now autoconf-archive in OE-core provides them. gnome-common =
in
>>>     > meta-oe will be changed to not install them and instead depend =
on
>>>     > autoconf-archive.
>>>
>>>     +1
>>>     LGTM
>>>
>>>     >
>>>     > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com
>>>     <mailto:patrick.ohly@intel.com>>
>>>     > ---
>>>     >  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc   =
        |
>>>     15 +++++++++++++++
>>>     >  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.0=
9.16.bb
>>>     <http://autoconf-archive_2016.09.16.bb> | 13 +++++++++++++
>>>     >  2 files changed, 28 insertions(+)
>>>     >  create mode 100644
>>>     meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>>>     >  create mode 100644
>>>     meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.1=
6.bb
>>>     <http://autoconf-archive_2016.09.16.bb>
>>>     >
>>>     > diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-ar=
chive.inc
>>>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>>>     > new file mode 100644
>>>     > index 0000000..9684d1f
>>>     > --- /dev/null
>>>     > +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.i=
nc
>>>     > @@ -0,0 +1,15 @@
>>>     > +LICENSE =3D "GPLv3"
>>>     > +HOMEPAGE =3D "http://www.gnu.org/software/autoconf-archive/
>>>     <http://www.gnu.org/software/autoconf-archive/>"
>>>     > +SECTION =3D "devel"
>>>     > +
>>>     > +DEPENDS +=3D "m4-native"
>>>     > +DEPENDS_class-native =3D "m4-native gnu-config-native"
>>>     > +DEPENDS_class-nativesdk =3D "m4-nativesdk gnu-config-nativesdk=
"
>>>     > +
>>>     > +RDEPENDS_${PN} =3D "m4 gnu-config gnome-common"
>>>     > +RDEPENDS_${PN}_class-native =3D "m4-native gnu-config-native"
>>>     > +RDEPENDS_${PN}_class-nativesdk =3D "m4-nativesdk gnu-config-na=
tivesdk"
>>>     > +
>>>     > +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>>>     > +
>>>     > +inherit autotools
>>>     > diff --git
>>>     a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09=
=2E16.bb
>>>     <http://autoconf-archive_2016.09.16.bb>
>>>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09=
=2E16.bb
>>>     <http://autoconf-archive_2016.09.16.bb>
>>>     > new file mode 100644
>>>     > index 0000000..0a1a771
>>>     > --- /dev/null
>>>     > +++
>>>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09=
=2E16.bb
>>>     <http://autoconf-archive_2016.09.16.bb>
>>>     > @@ -0,0 +1,13 @@
>>>     > +require autoconf-archive.inc
>>>     > +
>>>     > +
>>>     > +PARALLEL_MAKE =3D ""
>>>     > +
>>>     > +LICENSE =3D "GPLv2 & GPLv3"
>>>     > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
>>>     > +
>>>     > +SRC_URI[md5sum] =3D "bf19d4cddce260b3c3e1d51d42509071"
>>>     > +SRC_URI[sha256sum] =3D
>>>     "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82=
"
>>>     > +
>>>     > +EXTRA_OECONF +=3D "ac_cv_path_M4=3Dm4"
>>>     > +BBCLASSEXTEND =3D "native nativesdk"
>>>     >
>>>     > base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
>>>     > --
>>>     > git-series 0.9.1
>>>     > --
>>>     > _______________________________________________
>>>     > Openembedded-core mailing list
>>>     > Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     > http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e
>>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core=
>
>>>     --
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core=
>
>>>
>>>
>>>
>>>
>>
>=20



--OSTQuor55RUPfxlfOCRmQlCvvCjqf9uAo--

--97WJNOcoetNRp0ue3QpksuTj6ji3uLn0s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAEBCgAGBQJZjQ4eAAoJEH7+/ev69L75msgH/3SsEaaqEowt3nBoQhHcRAPB
2dA9bYei7sSPb3kLpjrUDtsdqCD1IfeQjBOy6hX/SHd5nOrA+u0gAyVDWf2Wq9Md
TmbqXYmvm0fIxHK8TRjK0fEwnB0oGcPXkRULCcPVh5tN3iTb/0Roew4imE15tSy0
NROnD3woZqL7RV9l4MH1dnVSSPN2mBOJpWA4YiNWvmZcToALXM1XRS9hhJrVsEc/
IWR9WO0tYbD3q2J5Fd/WIvIxyIQmH2/ZdgGxMfB9tL/gYV3l9kWTQP2SQdfyOnVC
1xuu2aodCPZTay20m3m3XT0xq6z+ed+GiehH61PuauT98Y3qoBJVfTuy2ZnQWa8=
=zlVp
-----END PGP SIGNATURE-----

--97WJNOcoetNRp0ue3QpksuTj6ji3uLn0s--
