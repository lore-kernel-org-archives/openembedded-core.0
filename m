Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0656260703
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 09:31:59 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so1406943wes.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 02:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=BpNf/GPjNml2YKYFbfeFmr8IV/DNKH+G6i7pXNWSAqY=;
	b=fUQ/hsnQagHTzxV53XJxFLuma7rIlixHkLy3Ka8H6/PsnhBj528SVDxewsAIgYBJH/
	hp3FqfzRTSu09VBuS3UMIwsSWGKwb7z/0mK4oMFEPxJGE4rydVnSMjQHuzNKIoNZXjax
	Cpd4ipL7iB1/yxuOmoek0M1sm7RGskGOuf/vrV7fKvJhM6Eep/iBXsoAqd+lqIJv6PP8
	SH4dPaXcZ0uzEHXd8NO1flrw0THgUZzwq8xlMdVJpioVQkhhj8ZngGD/RUq5MKY1KNes
	eg+jNrvK7VirNvfI5eXy15S0yG6DUMWpVlICYF0OgSYIhunJwgU2YSbT3/bEwbeiV+Sh
	NE5A==
X-Gm-Message-State: ALoCoQkPUOoJY8m3I2IzBG4BguAFQtwDL1fkKZRheBgwU1+3Pi6sveYY7vUwDJy27/uA8zNUZfuO
X-Received: by 10.194.80.7 with SMTP id n7mr3004528wjx.8.1398850319833;
	Wed, 30 Apr 2014 02:31:59 -0700 (PDT)
Received: from ?IPv6:2001:610:612::cda9:35f1:7be3:33e?
	([2001:610:612:0:cda9:35f1:7be3:33e])
	by mx.google.com with ESMTPSA id
	hm5sm35300937wjc.17.2014.04.30.02.31.58 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Apr 2014 02:31:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53603012.9060408@linux.intel.com>
Date: Wed, 30 Apr 2014 11:31:55 +0200
Message-Id: <BC558DFA-748A-4BB2-9450-3C539914EFD3@dominion.thruhere.net>
References: <1398749875-32207-1-git-send-email-koen@dominion.thruhere.net>
	<1398749875-32207-2-git-send-email-koen@dominion.thruhere.net>
	<53603012.9060408@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] xinput-calibrator: fix XDG launch
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
X-List-Received-Date: Wed, 30 Apr 2014 09:32:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2014, om 01:04 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 04/28/2014 10:37 PM, Koen Kooi wrote:
>> In the move from meta-oe to OE-core XDG based launched was dropped
>> without noting it in the commit message, so fix that regression.
>>=20
>> Gnome-session will now launch the calibrator again.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 =
++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git =
a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> index 3f97e19..f942c55 100644
>> --- =
a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> +++ =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> @@ -25,7 +25,11 @@ do_install_append() {
>>=20
>>      install -d ${D}${sysconfdir}/X11/Xsession.d/
>>      install -m 0755 ${WORKDIR}/30xinput_calibrate.sh =
${D}${sysconfdir}/X11/Xsession.d/
>> +
>> +    install -d ${D}${sysconfdir}/xdg/autostart
>> +    sed -e 's,^Exec=3D.*,Exec=3D${bindir}/xinput_calibrator_once.sh,' =
scripts/xinput_calibrator.desktop > =
${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
>=20
> This sed line is not quite right:
>> | sed: can't read scripts/xinput_calibrator.desktop: No such file or =
directory
>> | WARNING: =
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+=
gitAUTOINC+c01c5af807-r6/temp/run.do_install.23227:1 exit 2 from
>> |   sed -e 's,^Exec=3D.*,Exec=3D/usr/bin/xinput_calibrator_once.sh,' =
scripts/xinput_calibrator.desktop > =
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+=
gitAUTOINC+c01c5af807-r6/image/etc/xdg/autostart/xinput_calibrator.desktop=

>> | ERROR: Function failed: do_install (log file is located at =
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+=
gitAUTOINC+c01c5af807-r6/temp/log.do_install.23227)
>> ERROR: Task 2 =
(/srv/hdd/poky/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_g=
it.bb, do_install) failed with exit code '1'

Ouch! I only tested this pre autotools seperation. V2 coming up!

>=20
>=20
> Sau!
>=20
>=20
>>  }
>>=20
>> +FILES_${PN} +=3D "${sysconfdir}/xdg/autostart"
>>  RDEPENDS_${PN} =3D "xinput formfactor"
>>  RRECOMMENDS_${PN} =3D "pointercal-xinput"


