Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USu6w-0002Kb-12
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 21:03:17 +0200
Received: by mail-ee0-f49.google.com with SMTP id b47so430650eek.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aOZhGwAxxJXEpQVeuOG9JI1lGENQ6Ntk7lH8vnoFe64=;
	b=c/XRDnJLUf9c81USsbrq83IeKr/FNo0hb3bl4kSlpfog4OF5yGYf79ZUkfVqcraI4d
	T9ElyLW9s3Z8SiqgOHPlGZdwpxlAO/1YYAZOsrbaaVJwyK7/GJuXbn+2N4hdFkn02LkZ
	OhfK6haz+StG+VZH3M9LL+TgwmNLObFUIoTpxwY0DPE5H2FFaKixYaXMM7mYhJ7/z9YH
	NUCu9GX1JDsy7pcSv1h8WsZCCb3eEI0kk+XasgoDUXs/F+74Yz0Wz9619oLbAKJm8dot
	4+fjwU2Da2/f2WnDrPMLy1HRviSGLVh1wImnwImL980omqcITHpj1Q5vCzhY1LWI4JAn
	yWMg==
X-Received: by 10.15.75.70 with SMTP id k46mr33249061eey.4.1366310736489;
	Thu, 18 Apr 2013 11:45:36 -0700 (PDT)
Received: from ?IPv6:2001:610:612::fce1:7c54:974f:9332?
	([2001:610:612:0:fce1:7c54:974f:9332])
	by mx.google.com with ESMTPS id 8sm17742168eeg.15.2013.04.18.11.45.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 11:45:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
Date: Thu, 18 Apr 2013 20:45:36 +0200
Message-Id: <6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlaRGYcC83q9Ts/2X6XD12ZJRjQOm/Yljl3ZynRdRNPtHJEZ+AQjn6HZjZ2Zu0FnC5Y8++v
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
X-List-Received-Date: Thu, 18 Apr 2013 19:03:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2013, om 20:55 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 17 April 2013 19:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> I get a similar result here, but I have to rerun all postinsts with =
gconftool to make the packages actually work. I'll update OE-core =
tomorrow and try to get some more debug info. Systemctl says postinsts =
ran for 3 and a half minutes, a big improvement over the 60+ minutes for =
the same image built against 1.3.
>=20
> 3.5 minutes is still a long time, what packages does it run on the =
target?

I finally have a new build done and was able to inspect log.do_rootfs:

[koen@rrMBP 1.0-r0]$ grep "configuration required on target" =
temp/log.do_rootfs
gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-jpeg.postinst returned 1, marking as unpacked only, =
configuration required on target.
liberation-fonts.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-xpm.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-gif.postinst returned 1, marking as unpacked only, =
configuration required on target.
hicolor-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-bluetooth.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-disk-utility.postinst returned 1, marking as unpacked only, =
configuration required on target.
nautilus.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-session.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdm.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-settings-daemon.postinst returned 1, marking as unpacked only, =
configuration required on target.
libgweather1.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-panel.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-power-manager.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-control-center.postinst returned 1, marking as unpacked only, =
configuration required on target.
epiphany.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-theme-crux.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-highcontrastlargeprint.postinst returned 1, marking as =
unpacked only, configuration required on target.
librsvg-2-gtk.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-sans.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-highcontrastinverse.postinst returned 1, marking as unpacked =
only, configuration required on target.
gnome-theme-mist.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-serif.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-mono.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-largeprint.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-themes.postinst returned 1, marking as unpacked only, =
configuration required on target.
udev-hwdb.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-theme-highcontrastlargeprintinverse.postinst returned 1, marking =
as unpacked only, configuration required on target.
gnome-theme-highcontrast.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-jpeg.postinst returned 1, marking as unpacked only, =
configuration required on target.
liberation-fonts.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-xpm.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdk-pixbuf-loader-gif.postinst returned 1, marking as unpacked only, =
configuration required on target.
hicolor-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-bluetooth.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-disk-utility.postinst returned 1, marking as unpacked only, =
configuration required on target.
nautilus.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-session.postinst returned 1, marking as unpacked only, =
configuration required on target.
gdm.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-settings-daemon.postinst returned 1, marking as unpacked only, =
configuration required on target.
libgweather1.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-panel.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-power-manager.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-control-center.postinst returned 1, marking as unpacked only, =
configuration required on target.
epiphany.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-theme-crux.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-highcontrastlargeprint.postinst returned 1, marking as =
unpacked only, configuration required on target.
librsvg-2-gtk.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-sans.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-icon-theme.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-highcontrastinverse.postinst returned 1, marking as unpacked =
only, configuration required on target.
gnome-theme-mist.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-serif.postinst returned 1, marking as unpacked only, =
configuration required on target.
ttf-liberation-mono.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-theme-largeprint.postinst returned 1, marking as unpacked only, =
configuration required on target.
gnome-themes.postinst returned 1, marking as unpacked only, =
configuration required on target.
udev-hwdb.postinst returned 1, marking as unpacked only, configuration =
required on target.
gnome-theme-highcontrastlargeprintinverse.postinst returned 1, marking =
as unpacked only, configuration required on target.
gnome-theme-highcontrast.postinst returned 1, marking as unpacked only, =
configuration required on target.


And on first boot it hangs on the postinsts:

[   ***] A start job is running for Run pending postinsts

More debugging scheduled for tomorrow...

regards,

Koen=


