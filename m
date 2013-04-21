Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UToVu-0002el-Tg
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Apr 2013 09:16:46 +0200
Received: by mail-wg0-f44.google.com with SMTP id a12so437497wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2013 23:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AyCETBQtn1IRqo7jtVNotYgtvkcwO9JTj4VfSz9QDSo=;
	b=J/h2W4vuk0iihTv8XcMPjGnK3Hk8Y6Q1sXB73G25yc9xvTnxw+C6aEZWAgdHxYmSsG
	nELb6afNvRVCwrQWkK22pVtBzuuo4jj66SjjV0tqxWGSQQlNKrQgyRY3Elae9P+tssS5
	G9DHtCL4nomxbtL71E99D5T1z3RaH+C4SA1+D5ljv6rRq3s144L+Z2Z0w/epgpZyrmad
	Qi9/YyvCRPJIVVBr4re82w5CeVvlk6G2KndXf4rzGkEHhhlVil7lf36PyOORTDWMDlaL
	eXqCw9NIoFe1iEJQRK8CEzYQw4s6xDuiddJ8hnTyVkHtCXR3RnVS/7kn3VNMqXcwAINb
	CWiQ==
X-Received: by 10.194.143.50 with SMTP id sb18mr40385929wjb.44.1366527545760; 
	Sat, 20 Apr 2013 23:59:05 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a41sm33109879eei.4.2013.04.20.23.59.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Apr 2013 23:59:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8A0CB92A-B97D-4F53-A6BB-AB3C09ECE46C@dominion.thruhere.net>
Date: Sun, 21 Apr 2013 08:59:05 +0200
Message-Id: <84E8DA59-4879-4A6C-BB8A-4B1F766F7E76@dominion.thruhere.net>
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
X-Gm-Message-State: ALoCoQkRPDp/odV9M2eBlI9ZoOOqFMKqY96bKtLHtgGxeKte07J9SLGKlGGbiCK+dcRAyLN1/6JG
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
X-List-Received-Date: Sun, 21 Apr 2013 07:16:51 -0000
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
>> root@beaglebone:~# journalctl -a -f -b -n500 -u run-postinsts
>> -- Logs begin at Sat 2000-01-01 18:47:13 UTC. --
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x =
']'
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ grep '^gdm:' =
/etc/group
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ addgroup gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ grep '^gdm:' =
/etc/passwd
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ adduser =
--disabled-password --system --home /var/lib/gdm gdm --ingroup gdm -g =
gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: adduser: =
/var/lib/gdm: File exists
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -d =
/var/lib/gdm ']'
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ chown -R gdm:gdm =
/var/lib/gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: chown: unknown =
user/group gdm:gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ chmod 0750 =
/var/lib/gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ mkdir -p =
/etc/X11/
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ echo =
/usr/bin/gdm
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ OPTS=3D
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -n '' ']'
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ type systemctl
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ systemctl enable =
gdm.service
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -z '' -a =
enable =3D enable ']'
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ systemctl =
restart gdm.service
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ test x '!=3D' x
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ OPT=3D-s
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ type update-rc.d
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ update-rc.d -s =
gdm start 99 5 2 . stop 20 0 1 6 .
>> Jan 01 18:47:21 beaglebone S98run-postinsts[125]: Adding system =
startup for /etc/init.d/gdm.
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x =
']'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gdk-pixbuf-query-loaders --update-cache
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Crux ']'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Crux
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast ']'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast-SVG ']'
>> Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
>>=20
>> Connman does NTP at this point
>>=20
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastInverse ']'
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrint ']'
>> Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
>> Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrintInverse ']'
>> Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt =
/usr/share/icons/HighContrastLargePrintInverse
>> Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LargePrint ']'
>> Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LargePrint
>> Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LowContrastLargePrint ']'
>> Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LowContrastLargePrint
>> Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Mist ']'
>> Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Mist
>> Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/gnome ']'
>> Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/gnome
>> Apr 19 13:21:55 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:21:56 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/hicolor ']'
>> Apr 19 13:21:56 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/hicolor
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x =
']'
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: +++ gconftool-2 =
--get-default-source
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ export =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ =
SCHEMA_LOCATION=3D/etc/gconf/schemas
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
gdm-simple-greeter.schemas
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/gdm-simple-greeter.schemas ']'
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/gdm-simple-greeter.schemas
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' -n '' ']'
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--config-source=3Dxml:readwrite:/etc/gconf/gconf.xml.defaults --direct =
--load /etc/gconf/schemas/panel-default-setup.entries
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x =
']'
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
gdk-pixbuf-query-loaders --update-cache
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Crux ']'
>> Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Crux
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast ']'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast-SVG ']'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastInverse ']'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrint ']'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrintInverse ']'
>> Apr 19 13:22:04 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt =
/usr/share/icons/HighContrastLargePrintInverse
>> Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LargePrint ']'
>> Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LargePrint
>> Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LowContrastLargePrint ']'
>> Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LowContrastLargePrint
>> Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Mist ']'
>> Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Mist
>> Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
>> Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/gnome ']'
>> Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/gnome
>> +++ gconftool-2 --get-default-source
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ export =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ =
SCHEMA_LOCATION=3D/etc/gconf/schemas
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/window-list.schemas ']'
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/window-list.schemas
>> Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/clock.schemas ']'
>> Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/clock.schemas
>> Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-general.schemas ']'
>> Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-general.schemas
>> Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-compatibility.schemas ']'
>> Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-compatibility.schemas
>> Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-global.schemas ']'
>> Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-global.schemas
>> Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-object.schemas ']'
>> Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-object.schemas
>> Apr 19 13:23:08 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:23:08 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/workspace-switcher.schemas ']'
>> Apr 19 13:23:10 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:23:10 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/workspace-switcher.schemas
>> Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-toplevel.schemas ']'
>> Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-toplevel.schemas
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/fish.schemas ']'
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/fish.schemas
>> Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ test -n ''
>> Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ udevadm hwdb =
--update
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring gdm.
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
gnome-panel.
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
udev-hwdb.
>>=20
>> *wait 5 minutes*
>>=20
>> CTRL-C journalctl, inspect it:
>>=20
>> run-postinsts.service - Run pending postinsts
>>  Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
>>  Active: inactive (dead) since Fri 2013-04-19 13:24:00 UTC; 6min ago
>> Main PID: 125 (code=3Dexited, status=3D0/SUCCESS)
>>  CGroup: name=3Dsystemd:/system/run-postinsts.service
>>=20
>> Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-toplevel.schemas
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/fish.schemas ']'
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
>> Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/fish.schemas
>> Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ test -n ''
>> Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ udevadm hwdb =
--update
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring gdm.
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
gnome-panel.
>> Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
udev-hwdb.
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

Another datapoint, same GNOME image built for x86 finishes run-postinsts =
as expected, but also doesn't work, gconf stuff has to get run manually =
again to work.=


