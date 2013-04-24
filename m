Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UUwn8-0008Dh-KP; Wed, 24 Apr 2013 12:19:13 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so1464886vbh.40
	for <multiple recipients>; Wed, 24 Apr 2013 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=h+OcHvqiJ8XrspfNbikXQEIOaVOoxtdqCqV8gf1WqdE=;
	b=vFvqmrdXzSU54XqZ62xGKC5iJsl3aCZXEZLpnwtRxJzHEGyK1uIRSdss+KMPp2k4b7
	xW2J36QOZ0uFbnBkZsuF0zC49X1K8Ilpd0OeslZ6QnUbmAjqKHfAHn29FQxL/M5W1XTg
	cCxGGeQGZHlE8GW7+PS+p7syOQMhKgIDsUWO0BXYo9MxyYbhQoaeUO91DDNwnh3rwE9G
	geyc3JjJY0gduYsm0viOJzjJsCYTvV0ahtQYsQM4dTRpISA/2X+o1DHSTNXWrexiUgSN
	/wPI/FyddxDdwL3ZXw5Mj1+M2PlifmyVCSbpvy78izVahND73prUJ4m1yvDlsguD/mbV
	A2BQ==
MIME-Version: 1.0
X-Received: by 10.52.68.51 with SMTP id s19mr21084782vdt.92.1366797688429;
	Wed, 24 Apr 2013 03:01:28 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Wed, 24 Apr 2013 03:01:28 -0700 (PDT)
In-Reply-To: <CALbNGRTSwZM05RArE3=K4QfekU=TWPCyEaoybySdVRzbJsWfdA@mail.gmail.com>
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
	<978AB207-819F-4628-BE0E-DBCA8D826DE7@dominion.thruhere.net>
	<CALbNGRSVG+PJTNbtLg5waTK0J4LQncksT5bkK5L+DRSg3TkgpQ@mail.gmail.com>
	<CALbNGRTSwZM05RArE3=K4QfekU=TWPCyEaoybySdVRzbJsWfdA@mail.gmail.com>
Date: Wed, 24 Apr 2013 12:01:28 +0200
Message-ID: <CALbNGRQt85MST1a6CsR_EX9CG4zhT4YBMYGgwG81GBwxZJTKCQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 24 Apr 2013 10:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2013 at 9:43 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Apr 23, 2013 at 9:27 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Apr 22, 2013 at 10:36 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>
>>> Op 21 apr. 2013, om 17:09 heeft Richard Purdie <richard.purdie@linuxfou=
ndation.org> het volgende geschreven:
>>>
>>>> On Sun, 2013-04-21 at 08:59 +0200, Koen Kooi wrote:
>>>>> Op 19 apr. 2013, om 16:00 heeft Koen Kooi <koen@dominion.thruhere.net=
> het volgende geschreven:
>>>>>> Op 19 apr. 2013, om 15:37 heeft Koen Kooi <koen@dominion.thruhere.ne=
t> het volgende geschreven:
>>>>>> And it still doesn't work :(
>>>>>>
>>>>>> root@beaglebone:~# systemctl status gdm -a
>>>>>> gdm.service - Gnome Display Manager
>>>>>>  Loaded: loaded (/lib/systemd/system/gdm.service; enabled)
>>>>>>  Active: active (running) since Sat 2000-01-01 19:22:11 UTC; 13 year=
s 3 months ago
>>>>>> Main PID: 147 (gdm-binary)
>>>>>>  CGroup: name=3Dsystemd:/system/gdm.service
>>>>>>          =E2=94=94=E2=94=80147 /usr/sbin/gdm-binary -nodaemon
>>>>>>
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Couldn't =
look up uid
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[337]: WARNING: User gdm =
doesn't exist
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to=
 parse output:
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Unable to=
 parse D-Bus launch output
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[338]: WARNING: User gdm =
doesn't exist
>>>>>> Apr 19 13:56:22 beaglebone gdm-simple-slave[326]: WARNING: Could not=
 run helper: Failed to execute child process "/usr/lib/gdm/ck-get-x11-displ=
ay-device" (No such file or directory)
>>>>>> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: GdmDi=
splay: display lasted 1.401004 seconds
>>>>>> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: GdmDisplay: dis=
play lasted 1.401004 seconds
>>>>>> Apr 19 13:56:22 beaglebone gdm-binary[147]: WARNING: GdmLocalDisplay=
Factory: maximum number of X display failures reached: check X server log f=
or errors
>>>>>> Apr 19 13:56:22 beaglebone gdm[147]: gdm-binary[147]: WARNING: GdmLo=
calDisplayFactory: maximum number of X display failures reached: check X se=
rver log for errors
>>>>>>
>>>>>> Hmm, let's rerun gdm.postinst:
>>>>>>
>>>>>> root@beaglebone:~# sh /var/lib/opkg/info/gdm.postinst
>>>>>> + '[' x '!=3D' x ']'
>>>>>> + grep '^gdm:' /etc/group
>>>>>> + grep '^gdm:' /etc/passwd
>>>>>> + adduser --disabled-password --system --home /var/lib/gdm gdm --ing=
roup gdm -g gdm
>>>>>> adduser: /var/lib/gdm: File exists
>>>>>> + '[' -d /var/lib/gdm ']'
>>>>>> + chown -R gdm:gdm /var/lib/gdm
>>>>>> + chmod 0750 /var/lib/gdm
>>>>>> + mkdir -p /etc/X11/
>>>>>> + echo /usr/bin/gdm
>>>>>> + OPTS=3D
>>>>>> + '[' -n '' ']'
>>>>>> + type systemctl
>>>>>> + systemctl enable gdm.service
>>>>>> + '[' -z '' -a enable =3D enable ']'
>>>>>> + systemctl restart gdm.service
>>>>>> + test x '!=3D' x
>>>>>> + OPT=3D-s
>>>>>> + type update-rc.d
>>>>>> + update-rc.d -s gdm start 99 5 2 . stop 20 0 1 6 .
>>>>>> System startup links for /etc/init.d/gdm already exist.
>>>>>> + '[' x '!=3D' x ']'
>>>>>> + GDK_PIXBUF_MODULEDIR=3D/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
>>>>>> + gdk-pixbuf-query-loaders --update-cache
>>>>>> [  102.324520] tilcdc 4830e000.fb: timeout waiting for framedone
>>>>>> + for icondir in '/usr/share/icons/*'
>>>>>> + '[' -d /usr/share/icons/Crux ']'
>>>>>> + gtk-update-icon-cache -fqt /usr/share/icons/Crux
>>>>>> + for icondir in '/usr/share/icons/*'
>>>>>> + '[' -d /usr/share/icons/HighContrast ']'
>>>>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast
>>>>>> + for icondir in '/usr/share/icons/*'
>>>>>> + '[' -d /usr/share/icons/HighContrast-SVG ']'
>>>>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrast-SVG
>>>>>> + for icondir in '/usr/share/icons/*'
>>>>>> + '[' -d /usr/share/icons/HighContrastInverse ']'
>>>>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastInverse
>>>>>> + for icondir in '/usr/share/icons/*'
>>>>>> + '[' -d /usr/share/icons/HighContrastLargePrint ']'
>>>>>> + gtk-update-icon-cache -fqt /usr/share/icons/HighContrastLargePrint
>>>>>>
>>>>>> (etc)
>>>>>>
>>>>>> So it looks like the postinsts do run when used inside run-postinst.=
service, but don't save their output (sucky description, I know).
>>>>>
>>>>> Another datapoint, same GNOME image built for x86 finishes run-postin=
sts as expected, but also doesn't work, gconf stuff has to get run manually=
 again to work.
>>>>
>>>> FWIW I think there are multiple issues here and they're combining
>>>> together to make a rather weird problem.
>>>>
>>>> One issue we now know about is that the intercept code and the way it
>>>> uses "exit 1" can cause some later parts of some postinst scripts not =
to
>>>> get executed. I believe Laurentiu has a fix for this problem and this =
is
>>>> the one causing the gdm issue.
>>>>
>>>> I think the hang people are reporting is something else though, perhap=
s
>>>> related to the hwdb. I'm also aware of matchbox-session-sato conflicti=
ng
>>>> with settings-deamon and some multilib issues such as the wrong
>>>> qemuwrapper being used.
>>>>
>>>> We're going to have to work through each issue in turn and re-evaluate
>>>> after each fix.
>>>>
>>>> I wish we'd come across this earlier as to add fixes to the release at
>>>> this point would mean slipping the release date by a week :(. I'm
>>>> therefore leaning towards testing any fixes and queuing them quickly o=
n
>>>> the branch post-release, following up with a point release relatively
>>>> soon to catch things that people find as the release gets more exposur=
e.
>>>> I know the point releases have happened slowly and I want to change
>>>> that.
>>>
>>> To be honest, I don't are about point releases, I only care about fixes=
 getting into the release branch in a timely fashion. I build from git bran=
ches, not from tarballs after all.
>>>
>>> regards,
>>>
>>> Koen
>> I think I got at least a hot hint on this: opkg-cl configure seems
>> started twice. I did
>>
>> * create an image
>> * deleted /etc/rcS.d/S98run-postinsts from this image manually
>> * booted fine
>>
>> Andreas
> This was another 'get some coffee before writing heureka' - sorry
>
> Andreas
Again heureka: I debugged this again and again with kernel param

systemd.journald.forward_to_console=3Dtrue

and finally found strange message (strange because I sent a patch
somewhere long time ago to fix):

| systemd[1]: Cannot add dependency job for unit
display-manager.service, ignoring: Unit display-manager.service failed
to load: No such file or directory.

Looking into lxdm-postinst:

if [ "x$D" !=3D "x" ]; then
    exit 1
fi
langs=3D""
....

OPTS=3D""

if [ -n "$D" ]; then
    OPTS=3D"--root=3D$D"
fi

if type systemctl >/dev/null 2>/dev/null; then
	systemctl $OPTS enable lxdm.service

	if [ -z "$D" -a "enable" =3D "enable" ]; then
		systemctl restart lxdm.service
	fi
fi

Which idiot wrote code causing postinst exititing offline. Hereby all
appending postinsts are skipped. No systemct-native.

Looking into lxdm recipe (and later also gdm - same there - Koen I
think your image above had gdm) turned my head into deep red: The
idiot was me!

Up to now I only tested lxdm fix and postinst works fine now. I will
check meta-openembedded for further 'postinst-exits' and send a patch
after lunch.

Andreas


