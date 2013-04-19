Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UTBmD-0004mT-NI
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 15:55:06 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1722595ead.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=havEWJYHJn4wyIVyj6vcI0mSiqtcOFULjxwF15SjYN8=;
	b=Hu+TrORZ1VW0KunrIM2m1Keib4Zp77BxWbLKlpt4ZkSN3ZwWNuAbhdV8GWHmhOw6oF
	pioLM5dBvMNnoE7D8wdQha9xOR11CPL/Rm3AArgTnWwGWoEfoistzJgvHUHfLW/aqcSu
	qZhhVD3blD+w7bRDyWOgfvdTNSiNn2n+1nupcYEV7BvP1oMBkXntGb31g3uPneSXbaEl
	blI2SxdNVJQrNtIRC/2Y3DDb+gcmIocQm8yFXwMhY8oTQY4OpXouUZWAQ4g2n2a15XK5
	YKH2ir7wi3oUzENBQPLoTXr3GJhr0xAXhZFgHxZrkxotWNQWnV0thAWCmGkDnsSnJJb7
	6ujw==
X-Received: by 10.15.36.2 with SMTP id h2mr42419153eev.2.1366378642839;
	Fri, 19 Apr 2013 06:37:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id cd3sm23126868eeb.6.2013.04.19.06.37.20
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 06:37:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6B56E483-2965-46F1-A120-2F5F9807C594@dominion.thruhere.net>
Date: Fri, 19 Apr 2013 15:37:19 +0200
Message-Id: <447FAD55-F561-4BCB-B4FC-D0E5907143D6@dominion.thruhere.net>
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
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnfBupi0OVU3cD5ZAu80Kq548WqPFJ062LPmSU/8HRK6aXau/cnoTHBOkHsV848KIf7ACQp
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
X-List-Received-Date: Fri, 19 Apr 2013 13:55:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 15:13 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 19 apr. 2013, om 15:03 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:
>=20
>> On 19 April 2013 13:49, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> Running the postinstalls at first boot appear to hang because (and
>>>> that's just a feeling) gtk-icon-cache is run twice on target... =
which is
>>>> time consuming.
>>>=20
>>> I know it's time consuming, but it finished on 60-90 minutes with =
1.3, I left it overnight and it still hadn't finished. I have the LEDS =
configured to short mmc0 and cpu0 activity and there' s no IO, only cpu =
from time to time. I don't think it takes more than 14 hours to run =
those postinsts.
>>=20
>> How about hacking the postinsts to use sh -x, so you can see what =
it's
>> executing?
>=20
> Going to do that in a minute. Todays build just finished (*$(@*$(@ =
webkit-gtk build times) and I added timeoutsec=3D600 to the .service =
file:
>=20
> root@beaglebone:~# systemctl status run-postinsts -a
> run-postinsts.service - Run pending postinsts
>   Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
>   Active: failed (Result: timeout) since Sat 2000-01-01 18:30:33 UTC; =
13 years 3 months ago
> Main PID: 122
>   CGroup: name=3Dsystemd:/system/run-postinsts.service
>=20
> Jan 01 18:20:33 beaglebone S98run-postinsts[122]: adduser: group gdm =
does not exist
> Jan 01 18:20:33 beaglebone S98run-postinsts[122]: chown: unknown =
user/group gdm:gdm
> Jan 01 18:30:33 beaglebone systemd[1]: run-postinsts.service operation =
timed out. Terminating.
> Jan 01 18:30:33 beaglebone systemd[1]: Failed to start Run pending =
postinsts.
> Jan 01 18:30:33 beaglebone systemd[1]: MESSAGE=3DUnit =
run-postinsts.service entered failed state.
> root@beaglebone:~#=20
>=20
> So it seems to just hang. Will report about the set -x thing shortly.

And here it is:

Change postinst.service to Type=3Dsimple

root@beaglebone:~# journalctl -a -f -b -n500 -u run-postinsts
-- Logs begin at Sat 2000-01-01 18:47:13 UTC. --
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x ']'
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ grep '^gdm:' =
/etc/group
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ addgroup gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ grep '^gdm:' =
/etc/passwd
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ adduser =
--disabled-password --system --home /var/lib/gdm gdm --ingroup gdm -g =
gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: adduser: /var/lib/gdm: =
File exists
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -d /var/lib/gdm =
']'
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ chown -R gdm:gdm =
/var/lib/gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: chown: unknown =
user/group gdm:gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ chmod 0750 =
/var/lib/gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ mkdir -p /etc/X11/
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ echo /usr/bin/gdm
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ OPTS=3D
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -n '' ']'
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ type systemctl
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ systemctl enable =
gdm.service
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ '[' -z '' -a enable =
=3D enable ']'
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ systemctl restart =
gdm.service
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ test x '!=3D' x
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ OPT=3D-s
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ type update-rc.d
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: ++ update-rc.d -s gdm =
start 99 5 2 . stop 20 0 1 6 .
Jan 01 18:47:21 beaglebone S98run-postinsts[125]: Adding system startup =
for /etc/init.d/gdm.
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x ']'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gdk-pixbuf-query-loaders --update-cache
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Crux ']'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Crux
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast ']'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast-SVG ']'
Jan 01 18:47:22 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG

Connman does NTP at this point

Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastInverse ']'
Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrint ']'
Apr 19 13:21:11 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrintInverse ']'
Apr 19 13:21:14 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt =
/usr/share/icons/HighContrastLargePrintInverse
Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LargePrint ']'
Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LargePrint
Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:16 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LowContrastLargePrint ']'
Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LowContrastLargePrint
Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Mist ']'
Apr 19 13:21:17 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Mist
Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/gnome ']'
Apr 19 13:21:20 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/gnome
Apr 19 13:21:55 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:21:56 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/hicolor ']'
Apr 19 13:21:56 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/hicolor
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x ']'
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: +++ gconftool-2 =
--get-default-source
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ export =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ =
SCHEMA_LOCATION=3D/etc/gconf/schemas
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
gdm-simple-greeter.schemas
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/gdm-simple-greeter.schemas ']'
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:21:57 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/gdm-simple-greeter.schemas
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' -n '' ']'
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--config-source=3Dxml:readwrite:/etc/gconf/gconf.xml.defaults --direct =
--load /etc/gconf/schemas/panel-default-setup.entries
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' x '!=3D' x ']'
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
gdk-pixbuf-query-loaders --update-cache
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Crux ']'
Apr 19 13:22:02 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Crux
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast ']'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrast-SVG ']'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastInverse ']'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrint ']'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:03 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/HighContrastLargePrintInverse ']'
Apr 19 13:22:04 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt =
/usr/share/icons/HighContrastLargePrintInverse
Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LargePrint ']'
Apr 19 13:22:06 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LargePrint
Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/LowContrastLargePrint ']'
Apr 19 13:22:07 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/LowContrastLargePrint
Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/Mist ']'
Apr 19 13:22:09 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/Mist
Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ for icondir in =
'/usr/share/icons/*'
Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ '[' -d =
/usr/share/icons/gnome ']'
Apr 19 13:22:10 beaglebone S98run-postinsts[125]: ++ =
gtk-update-icon-cache -fqt /usr/share/icons/gnome
 +++ gconftool-2 --get-default-source
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ export =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ =
GCONF_CONFIG_SOURCE=3Dxml:merged:/etc/gconf/gconf.xml.defaults
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ =
SCHEMA_LOCATION=3D/etc/gconf/schemas
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/window-list.schemas ']'
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:22:31 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/window-list.schemas
Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/clock.schemas ']'
Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:22:41 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/clock.schemas
Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-general.schemas ']'
Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:22:47 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-general.schemas
Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-compatibility.schemas ']'
Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:22:55 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-compatibility.schemas
Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-global.schemas ']'
Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:22:56 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-global.schemas
Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-object.schemas ']'
Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:23:04 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-object.schemas
Apr 19 13:23:08 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:23:08 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/workspace-switcher.schemas ']'
Apr 19 13:23:10 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:23:10 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/workspace-switcher.schemas
Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/panel-toplevel.schemas ']'
Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-toplevel.schemas
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/fish.schemas ']'
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/fish.schemas
Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ test -n ''
Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ udevadm hwdb =
--update
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring gdm.
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
gnome-panel.
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring udev-hwdb.

*wait 5 minutes*

CTRL-C journalctl, inspect it:

run-postinsts.service - Run pending postinsts
   Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
   Active: inactive (dead) since Fri 2013-04-19 13:24:00 UTC; 6min ago
 Main PID: 125 (code=3Dexited, status=3D0/SUCCESS)
   CGroup: name=3Dsystemd:/system/run-postinsts.service

Apr 19 13:23:22 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/panel-toplevel.schemas
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ for SCHEMA in =
window-list.schemas clock.schemas panel-general.schemas =
panel-compatibility.schemas panel-global.schemas panel-object.schemas =
workspace-switcher.schemas panel-toplevel.schemas fish.schemas
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ '[' -e =
/etc/gconf/schemas/fish.schemas ']'
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ HOME=3D/root
Apr 19 13:23:32 beaglebone S98run-postinsts[125]: ++ gconftool-2 =
--makefile-install-rule /etc/gconf/schemas/fish.schemas
Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ test -n ''
Apr 19 13:23:51 beaglebone S98run-postinsts[125]: ++ udevadm hwdb =
--update
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring gdm.
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring =
gnome-panel.
Apr 19 13:24:00 beaglebone S98run-postinsts[125]: Configuring udev-hwdb.

root@beaglebone:~# ls /etc/rcS.d
S03systemd-udevd
root@beaglebone:~#=20

So it completed this time. This is the 5th reboot already. I have no =
idea why it finished this time :(

regards,

Koen=


