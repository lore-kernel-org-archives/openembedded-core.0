Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UTCF1-00086w-6N
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 16:24:53 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1846340eek.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 07:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Zqd9aHm51PgzZpX7pwPUKeOBpYT3dXT9+BMqR63dMT0=;
	b=iEfYd2ZYWHEvGTtyyn/242G908t4yhfcGfWVDMVTgIbKsLzTso97E3EP+NEEutKWe1
	tbbFdQwWSCgaCfG/EvKLsPG9+01aEsghRDeRZ5IyBtDHHvLCh+ueTfWahdBGyE+ybrGo
	i0atCzJy1NZVxPYIlLAnlQE2xMMVteBVUS/ODQGd5eYHeK1YiV56Ha2bod3UMPYPzP09
	Urpas+lXVYJCMQrTo6bOL1IJjtllpobVJ5MpJxShtERL9Ueg1v39pgvwMClCeQfROLbu
	mQMsx2znZIbY9X0eYUiP+jN5aaxjuSYzzQvXZ2/SxlCirePhjnVlujE/RcoVNaQHqHs6
	XYhw==
X-Received: by 10.14.173.71 with SMTP id u47mr6841420eel.24.1366380428658;
	Fri, 19 Apr 2013 07:07:08 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id d47sm23295623eem.9.2013.04.19.07.07.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 07:07:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8A0CB92A-B97D-4F53-A6BB-AB3C09ECE46C@dominion.thruhere.net>
Date: Fri, 19 Apr 2013 16:07:07 +0200
Message-Id: <5F6A6C49-EEAC-4C71-B680-A22FC1B9175A@dominion.thruhere.net>
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
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnzxcu2vd16CoVC/vulnxF5rCID59ENw7rmPoNqJ63ZTR6dF7yyUXviqadYCaldt+fGGvMY
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
X-List-Received-Date: Fri, 19 Apr 2013 14:25:06 -0000
X-List-Received-Date: Fri, 19 Apr 2013 14:25:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 16:00 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 19 apr. 2013, om 15:37 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>=20
>>=20
>> Op 19 apr. 2013, om 15:13 heeft Koen Kooi =
<koen@dominion.thruhere.net> het volgende geschreven:
>>=20
>>>=20
>>> Op 19 apr. 2013, om 15:03 heeft "Burton, Ross" =
<ross.burton@intel.com> het volgende geschreven:
>>>=20
>>>> On 19 April 2013 13:49, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>>> Running the postinstalls at first boot appear to hang because =
(and
>>>>>> that's just a feeling) gtk-icon-cache is run twice on target... =
which is
>>>>>> time consuming.
>>>>>=20
>>>>> I know it's time consuming, but it finished on 60-90 minutes with =
1.3, I left it overnight and it still hadn't finished. I have the LEDS =
configured to short mmc0 and cpu0 activity and there' s no IO, only cpu =
from time to time. I don't think it takes more than 14 hours to run =
those postinsts.
>>>>=20
>>>> How about hacking the postinsts to use sh -x, so you can see what =
it's
>>>> executing?
>>>=20
>>> Going to do that in a minute. Todays build just finished (*$(@*$(@ =
webkit-gtk build times) and I added timeoutsec=3D600 to the .service =
file:
>>>=20
>>> root@beaglebone:~# systemctl status run-postinsts -a
>>> run-postinsts.service - Run pending postinsts
>>> Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
>>> Active: failed (Result: timeout) since Sat 2000-01-01 18:30:33 UTC; =
13 years 3 months ago
>>> Main PID: 122
>>> CGroup: name=3Dsystemd:/system/run-postinsts.service
>>>=20
>>> Jan 01 18:20:33 beaglebone S98run-postinsts[122]: adduser: group gdm =
does not exist
>>> Jan 01 18:20:33 beaglebone S98run-postinsts[122]: chown: unknown =
user/group gdm:gdm
>>> Jan 01 18:30:33 beaglebone systemd[1]: run-postinsts.service =
operation timed out. Terminating.
>>> Jan 01 18:30:33 beaglebone systemd[1]: Failed to start Run pending =
postinsts.
>>> Jan 01 18:30:33 beaglebone systemd[1]: MESSAGE=3DUnit =
run-postinsts.service entered failed state.
>>> root@beaglebone:~#=20
>>>=20
>>> So it seems to just hang. Will report about the set -x thing =
shortly.
>>=20
>> And here it is:
>>=20
>> Change postinst.service to Type=3Dsimple
>>=20
>>=20

[ snip]

>>=20
>> root@beaglebone:~# ls /etc/rcS.d
>> S03systemd-udevd
>> root@beaglebone:~#=20
>>=20
>> So it completed this time. This is the 5th reboot already. I have no =
idea why it finished this time :(
>=20
> And it still doesn't work :(
>=20
> root@beaglebone:~# systemctl status gdm -a
> gdm.service - Gnome Display Manager
>   Loaded: loaded (/lib/systemd/system/gdm.service; enabled)
>   Active: active (running) since Sat 2000-01-01 19:22:11 UTC; 13 years =
3 months ago
> Main PID: 147 (gdm-binary)
>   CGroup: name=3Dsystemd:/system/gdm.service
>           =E2=94=94=E2=94=80147 /usr/sbin/gdm-binary -nodaemon
>=20
> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Couldn't =
look up uid
> Apr 19 13:56:22 beaglebone gdm-simple-slave[337]: WARNING: User gdm =
doesn't exist
> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to =
parse output:
> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to =
parse D-Bus launch output
> Apr 19 13:56:22 beaglebone gdm-simple-slave[338]: WARNING: User gdm =
doesn't exist
> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Could not =
run helper: Failed to execute child process =
"/usr/lib/gdm/ck-get-x11-display-device" (No such file or directory)
> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: =
GdmDisplay: display lasted 1.401004 seconds
> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: GdmDisplay: =
display lasted 1.401004 seconds
> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: =
GdmLocalDisplayFactory: maximum number of X display failures reached: =
check X server log for errors
> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: =
GdmLocalDisplayFactory: maximum number of X display failures reached: =
check X server log for errors
>=20
> Hmm, let's rerun gdm.postinst:
>=20
> root@beaglebone:~# sh /var/lib/opkg/info/gdm.postinst=20
> + '[' x '!=3D' x ']'
> + grep '^gdm:' /etc/group
> + grep '^gdm:' /etc/passwd
> + adduser --disabled-password --system --home /var/lib/gdm gdm =
--ingroup gdm -g gdm
> adduser: /var/lib/gdm: File exists
> + '[' -d /var/lib/gdm ']'
> + chown -R gdm:gdm /var/lib/gdm
> + chmod 0750 /var/lib/gdm
> + mkdir -p /etc/X11/
> + echo /usr/bin/gdm
> + OPTS=3D
> + '[' -n '' ']'
> + type systemctl
> + systemctl enable gdm.service
> + '[' -z '' -a enable =3D enable ']'
> + systemctl restart gdm.service
> + test x '!=3D' x
> + OPT=3D-s
> + type update-rc.d
> + update-rc.d -s gdm start 99 5 2 . stop 20 0 1 6 .
> System startup links for /etc/init.d/gdm already exist.
> + '[' x '!=3D' x ']'
> + GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
> + gdk-pixbuf-query-loaders --update-cache
> [  102.324520] tilcdc 4830e000.fb: timeout waiting for framedone
> + for icondir in '/usr/share/icons/*'
> + '[' -d /usr/share/icons/Crux ']'
> + gtk-update-icon-cache -fqt /usr/share/icons/Crux
> + for icondir in '/usr/share/icons/*'
> + '[' -d /usr/share/icons/HighContrast ']'
> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
> + for icondir in '/usr/share/icons/*'
> + '[' -d /usr/share/icons/HighContrast-SVG ']'
> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
> + for icondir in '/usr/share/icons/*'
> + '[' -d /usr/share/icons/HighContrastInverse ']'
> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
> + for icondir in '/usr/share/icons/*'
> + '[' -d /usr/share/icons/HighContrastLargePrint ']'
> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
>=20
> (etc)
>=20
> So it looks like the postinsts do run when used inside =
run-postinst.service, but don't save their output (sucky description, I =
know).

Does anyone know which caps systemd sets on initscripts? It could be =
that the adduser caps are disallowed and we need to explicitly set them.=20=





