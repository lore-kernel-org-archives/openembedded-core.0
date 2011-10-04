Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RB2rn-0001i3-8u
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 13:08:55 +0200
Received: by ywf7 with SMTP id 7so313019ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 04:03:20 -0700 (PDT)
Received: by 10.236.187.35 with SMTP id x23mr5856819yhm.6.1317726200446;
	Tue, 04 Oct 2011 04:03:20 -0700 (PDT)
Received: from [10.1.10.77] (rrcs-97-79-162-178.sw.biz.rr.com. [97.79.162.178])
	by mx.google.com with ESMTPS id v4sm15645098yhk.3.2011.10.04.04.03.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 04:03:19 -0700 (PDT)
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
In-Reply-To: <20110930183732.GH7364@jama.jama.net>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <87E5B689-06D2-4E3C-81E1-D4DA363CD0C1@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 4 Oct 2011 06:03:16 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Tue, 04 Oct 2011 11:08:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 30 sep. 2011 om 13:37 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>=20
>> Rebased these patches to the newer code
>>    modified:   python-native/nohostlibs.patch
>>    modified:   python/01-use-proper-tools-for-cross-build.patch
>>    modified:   python/06-avoid_usr_lib_termcap_path_in_linking.patch
>>    modified:   python/06-ctypes-libffi-fix-configure.patch
>>    modified:   python/multilib.patch
>>=20
>> Deleted these patches are the are now upstream
>>    deleted:    python/02-remove-test-for-cross.patch
>>    deleted:    python/security_issue_2254_fix.patch
>>=20
>> Added this patch to python-native
>>    new file:   python-native/multilib.patch
>>=20
>> Updated site config files for python
>>    modified:   ../../site/arm-common
>>    modified:   ../../site/mips-common
>>=20
>> Updated default python version
>>    modified:   ../../conf/distro/include/default-versions.inc
>>=20
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>> meta/conf/distro/include/default-versions.inc      |    6 +-
>> ...on-2.6-manifest.inc =3D> python-2.7-manifest.inc} |    0
>> .../python/python-native/multilib.patch            |  240 +++++++++++++++=
+++++
>> .../python/python-native/nohostlibs.patch          |   36 ++-
>> ...thon-native_2.6.6.bb =3D> python-native_2.7.2.bb} |   13 +-
>> meta/recipes-devtools/python/python.inc            |   16 +-
>> .../01-use-proper-tools-for-cross-build.patch      |  118 +++++++---
>> .../python/python/02-remove-test-for-cross.patch   |  108 ---------
>> .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
>> .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
>> meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
>> .../python/python/security_issue_2254_fix.patch    |  184 ---------------=

>> .../python/{python_2.6.6.bb =3D> python_2.7.2.bb}    |   10 +-
>> meta/site/arm-common                               |    3 +
>> meta/site/mips-common                              |    3 +
>> 15 files changed, 467 insertions(+), 454 deletions(-)
>> rename meta/recipes-devtools/python/{python-2.6-manifest.inc =3D> python-=
2.7-manifest.inc} (100%)
>> create mode 100644 meta/recipes-devtools/python/python-native/multilib.pa=
tch
>> rename meta/recipes-devtools/python/{python-native_2.6.6.bb =3D> python-n=
ative_2.7.2.bb} (74%)
>> delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-for=
-cross.patch
>> delete mode 100644 meta/recipes-devtools/python/python/security_issue_225=
4_fix.patch
>> rename meta/recipes-devtools/python/{python_2.6.6.bb =3D> python_2.7.2.bb=
} (92%)
>>=20
>> diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/di=
stro/include/default-versions.inc
>> index e3ef1e6..90ff005 100644
>> --- a/meta/conf/distro/include/default-versions.inc
>> +++ b/meta/conf/distro/include/default-versions.inc
>> @@ -4,9 +4,9 @@
>> PREFERRED_VERSION_pulseaudio ?=3D "0.9.23"
>>=20
>> # Force the python versions in one place
>> -PYTHON_BASEVERSION ?=3D "2.6"
>> -PREFERRED_VERSION_python ?=3D "2.6.6"
>> -PREFERRED_VERSION_python-native ?=3D "2.6.6"
>> +PYTHON_BASEVERSION ?=3D "2.7"
>> +PREFERRED_VERSION_python ?=3D "2.7.2"
>> +PREFERRED_VERSION_python-native ?=3D "2.7.2"
>>=20
>> # Force the older version of liberation-fonts until we fix the fontforge i=
ssue
>> PREFERRED_VERSION_liberation-fonts ?=3D "1.04"
>> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/meta/=
recipes-devtools/python/python-2.7-manifest.inc
>> similarity index 100%
>> rename from meta/recipes-devtools/python/python-2.6-manifest.inc
>> rename to meta/recipes-devtools/python/python-2.7-manifest.inc
>=20
> this is wrong.. just to rename it isn't enough

It also drops the source checksums :(



>=20
> I will send patch which regenerates manifest with right paths to
> actually package something..
>=20
> Regards,
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


