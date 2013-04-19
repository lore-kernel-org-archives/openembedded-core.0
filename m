Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UT6PH-0001sI-RV
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 10:10:56 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1661772eae.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 00:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sRpifZHR2WXR9Euzg0AcZrkqZBwqwI3u2u093Qp8xgw=;
	b=Le0cEXAzaFJBX6S/UoTO7OkmyQFsDh5uto70nHG69Wpn80bUFX5t0UPz2yD5/+hkJB
	wAaWmlhaSDRKQrn/5rkRLnFgv8mUjIteBkUkHD0eGj7uUPZ6jS3xQEamH/pw0kcf6ii4
	99L9GfdNZylCxfonxXRXv1m5co+pOi63GIiZj0jyTXeKcYjp8pqkHjb7W5md/IguqUAy
	g4pqTwddSqBZfjp7CWcV/Qs+xF1neInTihw67Y4DTSruFVKOKb+Sw4LxIAUQ1vEuGq89
	sO/Rj/Ik/QXB6L68zlRXfE6vvnfO1rd6CBN8LVQRFivRpfGxi03OYvlVCZgcKhbj9H/f
	TrrA==
X-Received: by 10.15.99.201 with SMTP id bl49mr38913198eeb.43.1366358001493;
	Fri, 19 Apr 2013 00:53:21 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id i53sm21038388eeu.5.2013.04.19.00.53.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 00:53:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
Date: Fri, 19 Apr 2013 09:53:20 +0200
Message-Id: <5DF91529-D80F-4028-ADB0-029A8C9820C2@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmnCXLc2r2BDzCSN7l5RnRQfSjmRPz1fEx+SaIkkLJkcnJEsSMsrbn8jxCigI4KSnnPjTMp
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
X-List-Received-Date: Fri, 19 Apr 2013 08:11:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2013, om 20:45 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 17 apr. 2013, om 20:55 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:
>=20
>> On 17 April 2013 19:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> I get a similar result here, but I have to rerun all postinsts with =
gconftool to make the packages actually work. I'll update OE-core =
tomorrow and try to get some more debug info. Systemctl says postinsts =
ran for 3 and a half minutes, a big improvement over the 60+ minutes for =
the same image built against 1.3.
>>=20
>> 3.5 minutes is still a long time, what packages does it run on the =
target?
>=20
> I finally have a new build done and was able to inspect log.do_rootfs:
>=20
> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" =
temp/log.do_rootfs
> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-jpeg.postinst returned 1, marking as unpacked only, =
configuration required on target.
> liberation-fonts.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-xpm.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-gif.postinst returned 1, marking as unpacked only, =
configuration required on target.
> hicolor-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-bluetooth.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-disk-utility.postinst returned 1, marking as unpacked only, =
configuration required on target.
> nautilus.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-session.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdm.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-settings-daemon.postinst returned 1, marking as unpacked only, =
configuration required on target.
> libgweather1.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-panel.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-power-manager.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-control-center.postinst returned 1, marking as unpacked only, =
configuration required on target.
> epiphany.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-theme-crux.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-highcontrastlargeprint.postinst returned 1, marking as =
unpacked only, configuration required on target.
> librsvg-2-gtk.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-sans.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-highcontrastinverse.postinst returned 1, marking as =
unpacked only, configuration required on target.
> gnome-theme-mist.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-serif.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-mono.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-largeprint.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-themes.postinst returned 1, marking as unpacked only, =
configuration required on target.
> udev-hwdb.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-theme-highcontrastlargeprintinverse.postinst returned 1, marking =
as unpacked only, configuration required on target.
> gnome-theme-highcontrast.postinst returned 1, marking as unpacked =
only, configuration required on target.
> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-jpeg.postinst returned 1, marking as unpacked only, =
configuration required on target.
> liberation-fonts.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-xpm.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdk-pixbuf-loader-gif.postinst returned 1, marking as unpacked only, =
configuration required on target.
> hicolor-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-bluetooth.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-disk-utility.postinst returned 1, marking as unpacked only, =
configuration required on target.
> nautilus.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-session.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gdm.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-settings-daemon.postinst returned 1, marking as unpacked only, =
configuration required on target.
> libgweather1.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-panel.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-power-manager.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-control-center.postinst returned 1, marking as unpacked only, =
configuration required on target.
> epiphany.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-theme-crux.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-highcontrastlargeprint.postinst returned 1, marking as =
unpacked only, configuration required on target.
> librsvg-2-gtk.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-sans.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-highcontrastinverse.postinst returned 1, marking as =
unpacked only, configuration required on target.
> gnome-theme-mist.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-serif.postinst returned 1, marking as unpacked only, =
configuration required on target.
> ttf-liberation-mono.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-theme-largeprint.postinst returned 1, marking as unpacked only, =
configuration required on target.
> gnome-themes.postinst returned 1, marking as unpacked only, =
configuration required on target.
> udev-hwdb.postinst returned 1, marking as unpacked only, configuration =
required on target.
> gnome-theme-highcontrastlargeprintinverse.postinst returned 1, marking =
as unpacked only, configuration required on target.
> gnome-theme-highcontrast.postinst returned 1, marking as unpacked =
only, configuration required on target.
>=20
>=20
> And on first boot it hangs on the postinsts:
>=20
> [   ***] A start job is running for Run pending postinsts
>=20
> More debugging scheduled for tomorrow...

A smaller console only image built against this mornings OE-core does =
complete the postinsts:

root@beaglebone:~# systemctl status run-postinsts
run-postinsts.service - Run pending postinsts
   Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabled)
   Active: inactive (dead) since Sat 2000-01-01 13:16:08 UTC; 13 years 3 =
months ago
  Process: 120 ExecStart=3D/etc/rcS.d/S98run-postinsts (code=3Dexited, =
status=3D0/SUCCESS)

Jan 01 13:16:08 beaglebone S98run-postinsts[120]: Configuring udev-hwdb.
Jan 01 13:16:08 beaglebone systemd[1]: Started Run pending postinsts.

root@beaglebone:~# systemd-analyze blame | grep run-post
          8.931s run-postinsts.service
root@beaglebone:~#=20

Running a build from scratch for the GNOME image right now with a local =
patch to add TimeoutSec=3D600 to the run-postinst service to be able to =
get a login prompt after 10 minutes.

regards,

Koen=


