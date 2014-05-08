Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (unknown [209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B884465F62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 17:30:27 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so76389wib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 10:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=PVp5cqFIIVcyqkab+Gn3G2Un0CyZqBtRP2DBzYqKw8c=;
	b=JJ5dbysxinn/WCcuG5qrP9Amc5wb/sjLbHrpDKuLVCrFOnFXBTd5pXw51JCeSWViqs
	xQ5NeixgKCnF+Cm7gIfwGrQkvLvJrs27pEgK+/gsQTjMDep+P5ig9yC0aCe3fwiECWGa
	m3BaWJoYs83jOyeoB8eHdZ96R5B58mC9dzJ6HzG7KpbKe7d6EG9LWCiYLQ+mCwXFOmL9
	mAH8rqLna+3xsR6gq4ebin/1Xx3MzSAFyCYWgZUFz6l9S3vkshNwlqlITnHzT9sId9T6
	BcP9cQ1ZEHw6v4XkY+cnY0C/xyvJwyQbAsND93gNDBl7fEvnEJU9E5PE3DqXJflxZhq3
	nBhw==
X-Gm-Message-State: ALoCoQmMUJm6Z4pJHOgahO8+jXmUjSUuOaJWJNEU+OTlL41eNPG6kWItz4/pnFWjOtM7y/2i/oSH
X-Received: by 10.180.72.205 with SMTP id f13mr14019583wiv.45.1399570228473;
	Thu, 08 May 2014 10:30:28 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c98c:c22d:ccab:585?
	([2001:610:612:0:c98c:c22d:ccab:585])
	by mx.google.com with ESMTPSA id fq2sm258181wib.2.2014.05.08.10.30.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 May 2014 10:30:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <536BB2C0.60903@linux.intel.com>
Date: Thu, 8 May 2014 19:30:25 +0200
Message-Id: <7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
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
X-List-Received-Date: Thu, 08 May 2014 17:30:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 mei 2014, om 18:37 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 05/02/2014 01:36 AM, Koen Kooi wrote:
>> Git.pm wasn't ending up in the package because do_install removed it
>> with a misleading comment about multilib. Workaround the problem so
>> that Git.pm ends up in the correct dir *and* doesn't get deleted.
>>=20
>=20
> Seems to be a problem as RP was concerned with:
>=20
>=20
>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/git difftool
>> Can't locate Error.pm in @INC (@INC contains: =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl//=
5.14.3 =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/ =
/srv/ssd/machines/meta-intel-iot-devkit/build/tmp/sysroots/x86_64-linux/us=
r/lib/perl-native/perl/5.14.3 .) at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>> BEGIN failed--compilation aborted at =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-d=
ifftool line 17.
>=20
> Doing a find in my sysroot:
>=20
> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5=
.14.3/CPANPLUS/Error.pm
> =
/srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl/5.14.3/Error.=
pm

Drat, I checked for buildpaths and didn't find anything. I'll retest and =
send a new version hopefully tomorrow.

regards,

Koen

>=20
> Sau!
>=20
>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  meta/recipes-devtools/git/git.inc | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>> index 73e11eb..178b768 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -28,10 +28,14 @@ do_install () {
>>  		template_dir=3D${datadir}/git-core/templates \
>>  		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>=20
>> +	cd ${B}/perl && oe_runmake install DESTDIR=3D"${D}" =
bindir=3D${bindir}
>> +
>>  	# ${libdir} is not applicable here, perl-native files are always
>>  	# installed to /usr/lib on both 32/64 bits targets.
>> +	# Fix up build paths and point to target locations.
>> +	mv ${D}${exec_prefix}/lib/perl-native/perl =
${D}${exec_prefix}/lib/perl
>> +	sed -i -e s:${D}::g =
${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
>>  	rm -rf ${D}${exec_prefix}/lib/perl-native
>> -	rmdir ${D}${exec_prefix}/lib || true
>>  }
>>=20
>>  PERLSEDFIXUP =3D " \
>> @@ -75,6 +79,7 @@ PERLTOOLS =3D " \
>>  PACKAGES =3D+ "${PN}-perltools"
>>  FILES_${PN}-perltools +=3D " \
>>      ${PERLTOOLS} \
>> +    ${prefix}/lib/perl \
>>      ${datadir}/perl \
>>  "
>>  RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
liberror-perl findutils"
>>=20


