Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UUCVh-0000m3-A1
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:54:11 +0200
Received: by mail-wi0-f175.google.com with SMTP id h11so3863124wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hF/3zB1WCQ3o4i6yK50B4jFgmkCtQ8e+hbjKDHO/Ahk=;
	b=mdHn2tycUVRZs7r6Ylr/tamSzTAEIBLQhP5s674Gcd5w2wnA1aaWy2jiz2+oTYxHm4
	tQR82WnPDS1SRcSrH6/aMj+uCMRYz3B61ZhmG2ZtmA5tY31jECvX0H8t7977wNzIN6Ip
	h2UQ4On9DGGW23JIBKRMdGibYvnPIXoyZAMUaIx69X3STdZue0ONl4+QyKQ2fa6hGfX1
	83//bwZWC5+DiRglcapNzZon1lY2av9MKgxw7IvDfSVddHHFVdvwWJtUL5YTYV4xN7lo
	z8p/APKoraShZ0ktHi6c+ZU7/sbS7o/s/9khHuyOLM11tRh3KHn3oCvkwlWAK2I1jzlk
	j4Vg==
X-Received: by 10.180.105.195 with SMTP id go3mr31483146wib.2.1366619786608;
	Mon, 22 Apr 2013 01:36:26 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j44sm39033781eeu.10.2013.04.22.01.36.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 01:36:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366556948.10502.191.camel@ted>
Date: Mon, 22 Apr 2013 10:36:25 +0200
Message-Id: <978AB207-819F-4628-BE0E-DBCA8D826DE7@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
	<CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
	<623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
	<5171293A.5010300@intel.com>
	<0E83C36A-8358-40B0-B022-A39DBFF44880@dominion.thruhere.net>
	<51713804.9000002@intel.com>
	<5437CC85-9AC1-4A18-BAE8-BDE01613215D@dominion.thruhere.net>
	<CAJTo0LbkfHKtEGnMDso0L5L0C62rO+ox__NHRu63HOt7Toh5wA@mail.gmail.com>
	<6B56E483-2965-46F1-A120-2F5F9807C594@dominion.thruhere.net>
	<447FAD55-F561-4BCB-B4FC-D0E5907143D6@dominion.thruhere.net>
	<8A0CB92A-B97D-4F53-A6BB-AB3C09ECE46C@dominion.thruhere.net>
	<84E8DA59-4879-4A6C-BB8A-4B1F766F7E76@dominion.thruhere.net>
	<1366556948.10502.191.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlway7+wzCWnVU2uTXxhplX9kVVnzoqo2mGeOE4z5occP8W3rKOKXB3RXgC4N1Syn6HuYrp
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Mon, 22 Apr 2013 08:54:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 21 apr. 2013, om 17:09 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sun, 2013-04-21 at 08:59 +0200, Koen Kooi wrote:
>> Op 19 apr. 2013, om 16:00 heeft Koen Kooi =
<koen@dominion.thruhere.net> het volgende geschreven:
>>> Op 19 apr. 2013, om 15:37 heeft Koen Kooi =
<koen@dominion.thruhere.net> het volgende geschreven:
>>> And it still doesn't work :(
>>>=20
>>> root@beaglebone:~# systemctl status gdm -a
>>> gdm.service - Gnome Display Manager
>>>  Loaded: loaded (/lib/systemd/system/gdm.service; enabled)
>>>  Active: active (running) since Sat 2000-01-01 19:22:11 UTC; 13 =
years 3 months ago
>>> Main PID: 147 (gdm-binary)
>>>  CGroup: name=3Dsystemd:/system/gdm.service
>>>          =E2=94=94=E2=94=80147 /usr/sbin/gdm-binary -nodaemon
>>>=20
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Couldn't =
look up uid
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[337]: WARNING: User gdm =
doesn't exist
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to =
parse output:
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to =
parse D-Bus launch output
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[338]: WARNING: User gdm =
doesn't exist
>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Could not =
run helper: Failed to execute child process =
"/usr/lib/gdm/ck-get-x11-display-device" (No such file or directory)
>>> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: =
GdmDisplay: display lasted 1.401004 seconds
>>> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: GdmDisplay: =
display lasted 1.401004 seconds
>>> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: =
GdmLocalDisplayFactory: maximum number of X display failures reached: =
check X server log for errors
>>> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: =
GdmLocalDisplayFactory: maximum number of X display failures reached: =
check X server log for errors
>>>=20
>>> Hmm, let's rerun gdm.postinst:
>>>=20
>>> root@beaglebone:~# sh /var/lib/opkg/info/gdm.postinst=20
>>> + '[' x '!=3D' x ']'
>>> + grep '^gdm:' /etc/group
>>> + grep '^gdm:' /etc/passwd
>>> + adduser --disabled-password --system --home /var/lib/gdm gdm =
--ingroup gdm -g gdm
>>> adduser: /var/lib/gdm: File exists
>>> + '[' -d /var/lib/gdm ']'
>>> + chown -R gdm:gdm /var/lib/gdm
>>> + chmod 0750 /var/lib/gdm
>>> + mkdir -p /etc/X11/
>>> + echo /usr/bin/gdm
>>> + OPTS=3D
>>> + '[' -n '' ']'
>>> + type systemctl
>>> + systemctl enable gdm.service
>>> + '[' -z '' -a enable =3D enable ']'
>>> + systemctl restart gdm.service
>>> + test x '!=3D' x
>>> + OPT=3D-s
>>> + type update-rc.d
>>> + update-rc.d -s gdm start 99 5 2 . stop 20 0 1 6 .
>>> System startup links for /etc/init.d/gdm already exist.
>>> + '[' x '!=3D' x ']'
>>> + GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
>>> + gdk-pixbuf-query-loaders --update-cache
>>> [  102.324520] tilcdc 4830e000.fb: timeout waiting for framedone
>>> + for icondir in '/usr/share/icons/*'
>>> + '[' -d /usr/share/icons/Crux ']'
>>> + gtk-update-icon-cache -fqt /usr/share/icons/Crux
>>> + for icondir in '/usr/share/icons/*'
>>> + '[' -d /usr/share/icons/HighContrast ']'
>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
>>> + for icondir in '/usr/share/icons/*'
>>> + '[' -d /usr/share/icons/HighContrast-SVG ']'
>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
>>> + for icondir in '/usr/share/icons/*'
>>> + '[' -d /usr/share/icons/HighContrastInverse ']'
>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
>>> + for icondir in '/usr/share/icons/*'
>>> + '[' -d /usr/share/icons/HighContrastLargePrint ']'
>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
>>>=20
>>> (etc)
>>>=20
>>> So it looks like the postinsts do run when used inside =
run-postinst.service, but don't save their output (sucky description, I =
know).
>>=20
>> Another datapoint, same GNOME image built for x86 finishes =
run-postinsts as expected, but also doesn't work, gconf stuff has to get =
run manually again to work.
>=20
> FWIW I think there are multiple issues here and they're combining
> together to make a rather weird problem.
>=20
> One issue we now know about is that the intercept code and the way it
> uses "exit 1" can cause some later parts of some postinst scripts not =
to
> get executed. I believe Laurentiu has a fix for this problem and this =
is
> the one causing the gdm issue.
>=20
> I think the hang people are reporting is something else though, =
perhaps
> related to the hwdb. I'm also aware of matchbox-session-sato =
conflicting
> with settings-deamon and some multilib issues such as the wrong
> qemuwrapper being used.
>=20
> We're going to have to work through each issue in turn and re-evaluate
> after each fix.
>=20
> I wish we'd come across this earlier as to add fixes to the release at
> this point would mean slipping the release date by a week :(. I'm
> therefore leaning towards testing any fixes and queuing them quickly =
on
> the branch post-release, following up with a point release relatively
> soon to catch things that people find as the release gets more =
exposure.
> I know the point releases have happened slowly and I want to change
> that.

To be honest, I don't are about point releases, I only care about fixes =
getting into the release branch in a timely fashion. I build from git =
branches, not from tarballs after all.

regards,

Koen=


