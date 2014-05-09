Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (unknown [74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF6A65EC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 09:16:44 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so3714424wes.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 02:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=PPcZWNRSVKgubSVUZLjOnY6oRYMWADzg5LBkI6m9D+U=;
	b=dMJngOzUHLANwFsa8iNQdMLqhFj4Lc6EhFgo/QYmbR71u2xU3/GY8eek8sWNXiFX+F
	4qvyGnsk/3EUmpJB38jWq/cPKyEWJn6Fw/OCQS15575q8Er0CiWsXXDfljW4TmdnCFVb
	zoTftb+QqZ8VEmnlc5AsxjHT1gYILGNK3A0zcE9mqvaWUDkreCvMjkvcOdkX/HEQeECK
	kldRfX8qpA4iFmbmrWwCCqmFbynwg4e5pdUkNxldZshUy4CZSk5NKKr/mWTHTLTyDhnr
	imm7gaszm0Xkokf7UiT6cegnkuhgSVneM7VuxkjOaM5uJFXHa/NUoIvWminZ5co6Ofw6
	9ttQ==
X-Gm-Message-State: ALoCoQnMeSsh1VIJX7d5kAClI6rXg/5Ibd2kIViVC8nkf/OnqCRHZnK05EOoB+2/j/kLb7v9ri66
X-Received: by 10.180.109.69 with SMTP id hq5mr2435996wib.30.1399627005736;
	Fri, 09 May 2014 02:16:45 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c98c:c22d:ccab:585?
	([2001:610:612:0:c98c:c22d:ccab:585])
	by mx.google.com with ESMTPSA id t18sm4037514wiv.16.2014.05.09.02.16.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 02:16:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
Date: Fri, 9 May 2014 11:16:42 +0200
Message-Id: <51490BD6-0BCB-4422-9620-8D4FFAD3791F@dominion.thruhere.net>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
	<536C77D5.6040205@linux.intel.com>
	<6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Fri, 09 May 2014 09:16:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2014, om 10:50 heeft Koen Kooi <koen@dominion.thruhere.net> het =
volgende geschreven:

>=20
> Op 9 mei 2014, om 08:38 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
>> On 05/08/2014 10:59 PM, Koen Kooi wrote:
>>>=20
>>> Op 8 mei 2014, om 19:30 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>>>=20
>>>>=20
>>>> Op 8 mei 2014, om 18:37 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>>>>=20
>>>>> On 05/02/2014 01:36 AM, Koen Kooi wrote:
>>>>>> Git.pm wasn't ending up in the package because do_install removed =
it
>>>>>> with a misleading comment about multilib. Workaround the problem =
so
>>>>>> that Git.pm ends up in the correct dir *and* doesn't get deleted.
>>>>>>=20
>>>>>=20
>>>>> Seems to be a problem as RP was concerned with:
>>>>>=20
>>>>>=20
>>>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/git =
difftool
>>>>>> Can't locate Error.pm in @INC (@INC contains: =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl//=
5.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/ =
/srv/ssd/machines/meta-intel-iot-devkit/build/tmp/sysroots/x86_64-linux/us=
r/lib/perl-native/perl/5.14.3 .) at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>>>>>> BEGIN failed--compilation aborted at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>>>>>=20
>>>>> Doing a find in my sysroot:
>>>>>=20
>>>>> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3/CPANPLUS/Error.pm
>>>>> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl/5.14.3/Error.=
pm
>>>>=20
>>>> Drat, I checked for buildpaths and didn't find anything. I'll =
retest and send a new version hopefully tomorrow.
>>>=20
>>> I need to read errors better :) Do you have =
http://patches.openembedded.org/patch/70635/ applied? And did 'difftool' =
work before this? None of the perl tools worked for me due to error.pm =
missing.
>>>=20
>> Apparently not, this must have gotten lost during the release =
crazies.
>>=20
>> Can you please resend a rebased patch set against master with both of =
these tested using the ' target.
>=20
> What is 'git-replacement-native' and how do I test it?

OK, I figured it out, I remove TMPDIR and sstate-cache, then did:

bitbake git-replacement-native
bitbake linaro-image-minimal

That blew up with:

RROR: Function failed: Fetcher failure: Fetch command failed with exit =
code 128, output:
Cloning into =
'/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0=
+gitAUTOINC+6822ec76aa-r0/git'...
git-upload-pack: error while loading shared libraries: =
libcrypto.so.1.0.0: cannot open shared object file: No such file or =
directory
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

ERROR: Logfile of failure stored in: =
/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+=
gitAUTOINC+6822ec76aa-r0/temp/log.do_unpack.23257
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| DEBUG: Running export =
PATH=3D"/build/linaro/build/openembedded-core/scripts/native-intercept:/bu=
ild/linaro/build/openembedded-core/scripts:/build/linaro/build/build/tmp-e=
glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/build/linaro/build
=
ld/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/sbin:/build/linaro/=
build/build/tmp-eglibc/sysroots/x86_64-linux/bin:/build/linaro/build/opene=
mbedded-core/scripts:/build/linaro/build/openembedded-core/bitbake/bin:/us=
r/lib64/qt-3.3/b
 -s -n =
/build/linaro/build/build/downloads/git2/git.yoctoproject.org.prelink-cros=
s.git/ =
/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+=
gitAUTOINC+6822ec76aa-r0/git/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| ERROR: Function failed: Fetcher failure: Fetch command failed with =
exit code 128, output:
| Cloning into =
'/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0=
+gitAUTOINC+6822ec76aa-r0/git'...
| git-upload-pack: error while loading shared libraries: =
libcrypto.so.1.0.0: cannot open shared object file: No such file or =
directory
| fatal: Could not read from remote repository.
|
| Please make sure you have the correct access rights
| and the repository exists.
|
ERROR: Task 117 =
(virtual:native:/build/linaro/build/openembedded-core/meta/recipes-devtool=
s/prelink/prelink_git.bb, do_unpack) failed with exit code '1'
NOTE: Tasks Summary: Attempted 265 tasks of which 124 didn't need to be =
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  =
virtual:native:/build/linaro/build/openembedded-core/meta/recipes-devtools=
/prelink/prelink_git.bb, do_unpack
Summary: There were 3 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.

real    4m49.390s
user    8m30.627s
sys     1m37.368s

Libcrypto does seem to be in sysroot:

[koen@thinkpad build]$ find build/ -name "libcrypto.so.1.0.0"
build/tmp-eglibc/sysroots/x86_64-linux/lib/libcrypto.so.1.0.0

I don't think this is due to my perl changes, though.

regards,

Koen


>=20
> regards,
>=20
> Koen
>=20
>>=20
>> Thanks
>> 	Sau!
>>=20
>>>=20
>>>>=20
>>>> regards,
>>>>=20
>>>> Koen
>>>>=20
>>>>>=20
>>>>> Sau!
>>>>>=20
>>>>>=20
>>>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>>>> ---
>>>>>> meta/recipes-devtools/git/git.inc | 7 ++++++-
>>>>>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>>>>>> index 73e11eb..178b768 100644
>>>>>> --- a/meta/recipes-devtools/git/git.inc
>>>>>> +++ b/meta/recipes-devtools/git/git.inc
>>>>>> @@ -28,10 +28,14 @@ do_install () {
>>>>>> 		template_dir=3D${datadir}/git-core/templates \
>>>>>> 		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>>>>>=20
>>>>>> +	cd ${B}/perl && oe_runmake install DESTDIR=3D"${D}" =
bindir=3D${bindir}
>>>>>> +
>>>>>> 	# ${libdir} is not applicable here, perl-native files are always
>>>>>> 	# installed to /usr/lib on both 32/64 bits targets.
>>>>>> +	# Fix up build paths and point to target locations.
>>>>>> +	mv ${D}${exec_prefix}/lib/perl-native/perl =
${D}${exec_prefix}/lib/perl
>>>>>> +	sed -i -e s:${D}::g =
${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
>>>>>> 	rm -rf ${D}${exec_prefix}/lib/perl-native
>>>>>> -	rmdir ${D}${exec_prefix}/lib || true
>>>>>> }
>>>>>>=20
>>>>>> PERLSEDFIXUP =3D " \
>>>>>> @@ -75,6 +79,7 @@ PERLTOOLS =3D " \
>>>>>> PACKAGES =3D+ "${PN}-perltools"
>>>>>> FILES_${PN}-perltools +=3D " \
>>>>>>    ${PERLTOOLS} \
>>>>>> +    ${prefix}/lib/perl \
>>>>>>    ${datadir}/perl \
>>>>>> "
>>>>>> RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
liberror-perl findutils"


