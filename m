Return-Path: <koen@dominion.thruhere.net>
X-Greylist: delayed 64105 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 08:51:02 UTC
Received: from mail-wg0-f45.google.com (unknown [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 059BF60559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 08:51:02 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so3714207wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 01:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3EB4PMGvESoJobXnIzc10lMEwLtgs+xa/+KJWoWSaHk=;
	b=jdGK0HLSIRTokthjRg5Xqw/sMpCrnMmH8FEoCtxBV9LgNJ8W4r7CZSWFn6E9e0pWyA
	LYQSE1zNVbc0ZqRi9uC3GDayMcQk8FbLFR8qpj+ynFr3z3UzRgIxzqtXC+L8jUHQ59k6
	REGlLZIQLKUNFDooaQ1i+CZcFn0AbG1WrlQ24LYNmcsvK6do5Z+oRSPvosR74ME3TP5q
	QCtxeUEQ9LGk7s7zgFsh9NjJthjaYpx15cw+L7YajhNUaMSkC8SRGXkQCaIAh35fy5WI
	cKogtVawZ8lnRuP3uWcaC/+C/Mj3JA0Fq4cgnLeayk+XKAhgINHN7R8N01A83ImFv7uv
	ZKqw==
X-Gm-Message-State: ALoCoQlkHJz6FLL6FXuFLDtuQSStpcTvgpixsInxhN0QBwikR092Q9gy8+4M+rAhNoYn1Fc6J8cw
X-Received: by 10.194.78.77 with SMTP id z13mr645573wjw.64.1399625462669;
	Fri, 09 May 2014 01:51:02 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id m2sm4612118wjf.42.2014.05.09.01.51.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 01:51:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <536C77D5.6040205@linux.intel.com>
Date: Fri, 9 May 2014 10:50:59 +0200
Message-Id: <6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
	<536C77D5.6040205@linux.intel.com>
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
X-List-Received-Date: Fri, 09 May 2014 08:51:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2014, om 08:38 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 05/08/2014 10:59 PM, Koen Kooi wrote:
>>=20
>> Op 8 mei 2014, om 19:30 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>>=20
>>>=20
>>> Op 8 mei 2014, om 18:37 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>>>=20
>>>> On 05/02/2014 01:36 AM, Koen Kooi wrote:
>>>>> Git.pm wasn't ending up in the package because do_install removed =
it
>>>>> with a misleading comment about multilib. Workaround the problem =
so
>>>>> that Git.pm ends up in the correct dir *and* doesn't get deleted.
>>>>>=20
>>>>=20
>>>> Seems to be a problem as RP was concerned with:
>>>>=20
>>>>=20
>>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/git =
difftool
>>>>> Can't locate Error.pm in @INC (@INC contains: =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl//=
5.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/ =
/srv/ssd/machines/meta-intel-iot-devkit/build/tmp/sysroots/x86_64-linux/us=
r/lib/perl-native/perl/5.14.3 .) at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>>>>> BEGIN failed--compilation aborted at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>>>>=20
>>>> Doing a find in my sysroot:
>>>>=20
>>>> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3/CPANPLUS/Error.pm
>>>> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl/5.14.3/Error.=
pm
>>>=20
>>> Drat, I checked for buildpaths and didn't find anything. I'll retest =
and send a new version hopefully tomorrow.
>>=20
>> I need to read errors better :) Do you have =
http://patches.openembedded.org/patch/70635/ applied? And did 'difftool' =
work before this? None of the perl tools worked for me due to error.pm =
missing.
>>=20
> Apparently not, this must have gotten lost during the release crazies.
>=20
> Can you please resend a rebased patch set against master with both of =
these tested using the ' target.

What is 'git-replacement-native' and how do I test it?

regards,

Koen

>=20
> Thanks
> 	Sau!
>=20
>>=20
>>>=20
>>> regards,
>>>=20
>>> Koen
>>>=20
>>>>=20
>>>> Sau!
>>>>=20
>>>>=20
>>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>>> ---
>>>>> meta/recipes-devtools/git/git.inc | 7 ++++++-
>>>>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>>>>> index 73e11eb..178b768 100644
>>>>> --- a/meta/recipes-devtools/git/git.inc
>>>>> +++ b/meta/recipes-devtools/git/git.inc
>>>>> @@ -28,10 +28,14 @@ do_install () {
>>>>> 		template_dir=3D${datadir}/git-core/templates \
>>>>> 		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>>>>=20
>>>>> +	cd ${B}/perl && oe_runmake install DESTDIR=3D"${D}" =
bindir=3D${bindir}
>>>>> +
>>>>> 	# ${libdir} is not applicable here, perl-native files are always
>>>>> 	# installed to /usr/lib on both 32/64 bits targets.
>>>>> +	# Fix up build paths and point to target locations.
>>>>> +	mv ${D}${exec_prefix}/lib/perl-native/perl =
${D}${exec_prefix}/lib/perl
>>>>> +	sed -i -e s:${D}::g =
${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
>>>>> 	rm -rf ${D}${exec_prefix}/lib/perl-native
>>>>> -	rmdir ${D}${exec_prefix}/lib || true
>>>>> }
>>>>>=20
>>>>> PERLSEDFIXUP =3D " \
>>>>> @@ -75,6 +79,7 @@ PERLTOOLS =3D " \
>>>>> PACKAGES =3D+ "${PN}-perltools"
>>>>> FILES_${PN}-perltools +=3D " \
>>>>>     ${PERLTOOLS} \
>>>>> +    ${prefix}/lib/perl \
>>>>>     ${datadir}/perl \
>>>>> "
>>>>> RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
liberror-perl findutils"


