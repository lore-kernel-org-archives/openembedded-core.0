Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5D4F60938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 09:11:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so12904761wma.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a4H2LyH5rq+eEJpoDUB/1c2e3gVG59MS2I2ISCOsl8g=;
	b=R23nyQjDwLJlk6roCa7hHNpMiLpt6ptQ55mAHtmtF5T596CDUg4UX6/t4tGvDraXpC
	mwvmDUk7l0lW0SEfXHLjVoC3UuooznSYl2zsm8QZW6S7w91A3QDw6Vf6PHBww+3W7VdJ
	wMJq2aT62E6JL0JiZU7Pa79sVQorGRrdZgUbYGEbyGNI31M1+9BX5pFosD6TwxbOw9l8
	6nZtHS7sIgBoSazxh81ktbO2v04KqAKNUCcZfd7FU261gTe3XrPoIXl5+Qf1gJ7HPJ0C
	uC0bvufNkUmYrczfbxv/yzQwxV8WFaeaB+k5A7d0/GUBUpbP1JN5s+btHM6f7O+lymRe
	7TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a4H2LyH5rq+eEJpoDUB/1c2e3gVG59MS2I2ISCOsl8g=;
	b=hkv9hSuDuQmW6bCwn8m4/8jd2CsBfrYGUQogEuf4IdDAPPnwPVZMHo4F3m1IJmPBjZ
	nE9ZXTzuw2PsakPdVwPCkXerxhcdWjmKXCe/fkHdvWQorv0awKUUCU+bQwiNf2uOUrh2
	xCMLKFsLHaFgQv+BJsAsPzRELvJkyx/ywlkfbG8ACsxKcWrfIJfP1KAmHCRIwOQkyk3g
	iM4U+lsaaCS136RsCD0nqI21MKYwJuPu07mZ9KCHUJzAz5lj0OTSLdyDfvb+Uf4C0LIj
	b2sfd7wJ3bwly5SUVV3wp3ADdka1Cp3fkMmVEVTyy2NpzzdpxNu0YTR3RU4rpV2UEGDP
	4i8g==
X-Gm-Message-State: AE9vXwM93I3YTxavs6llcnVv67L8RrlTbj/BwMzAlbnqikL7WHc9qAJwnFUdq8L0a2bW7ei/hge15iBz400VGw==
X-Received: by 10.194.232.200 with SMTP id tq8mr961840wjc.63.1474535513789;
	Thu, 22 Sep 2016 02:11:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.143.226 with HTTP; Thu, 22 Sep 2016 02:11:53 -0700 (PDT)
In-Reply-To: <CALDxG5jN6gi0naERO2bksjy50FNwymdbmgK3XDHLmiUPSGswgw@mail.gmail.com>
References: <CALDxG5jN6gi0naERO2bksjy50FNwymdbmgK3XDHLmiUPSGswgw@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
Date: Thu, 22 Sep 2016 14:41:53 +0530
Message-ID: <CALwQErrHFgMr9K4K5pi8er0FMmxerLqO_-n_QGDwxjZz7_2BsA@mail.gmail.com>
To: srikanth krishnakar <skrishnakar@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Terminating matchbox window manager leads to DRM lockups
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
X-List-Received-Date: Thu, 22 Sep 2016 09:11:56 -0000
Content-Type: multipart/alternative; boundary=001a1134daa28237f9053d150da7

--001a1134daa28237f9053d150da7
Content-Type: text/plain; charset=UTF-8

Hi,

@Ping

Please advise further pointers if any.


Thanks
Shrikant

On Thu, Aug 25, 2016 at 8:13 PM, srikanth krishnakar <skrishnakar@gmail.com>
wrote:

> Hello All,
>
> I am building latest yocto with core-image-sato and noticed that matchbox
> session or its relative apps are using kernel context and eventually these
> are shown when the window manager is terminated or the target is rebooted.
> Please see the logs below:
>
> Target: i.MX6Q ARM
> Kernel: Linux-4.1
> Yocto: master (7b9f59)
>
>
> --------------------------------------
> root@mx6q:~# ps | grep match
>   558 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
> yes
>   612 root      174m S    matchbox-desktop
>   614 root      174m S    matchbox-panel --start-applets
> showdesktop,windowselector --end-applets clock,battery,,systray,
> startup-notify,notify
>   677 root      2752 S    grep match
> root@mx6q:~#
> root@mx6q:~#
> root@mx6q:~# opkg list | grep -i xserver-xorg
> xserver-xorg - 2:1.18.4-r0.3
> xserver-xorg-extension-glx - 2:1.18.4-r0.3
> xserver-xorg-extension-viv-autohdmi - 3:5.0.11.p8.4-r0.3
> xserver-xorg-module-exa - 2:1.18.4-r0.3
> root@mx6q:~# opkg list | grep -i matchbox
> matchbox-config-gtk - 0.2-r0.2
> matchbox-desktop - 2.1-r0.2
> matchbox-keyboard - 0.1.1-r0.2
> matchbox-keyboard-applet - 0.1.1-r0.2
> matchbox-keyboard-im - 0.1.1-r0.2
> matchbox-panel-2 - 2.11-r0.2
> matchbox-session - 0.1-r4.0
> matchbox-session-sato - 0.1-r30.0
> matchbox-terminal - 0.1-r0.2
> matchbox-theme-sato - 0.2-r0.0
> matchbox-wm - 1.2.1-r0.1
> root@mx6q:~#
> root@mx6q:~# kill 558
> root@mx6q:~# [  404.937507] [drm:drm_legacy_unlock] *ERROR* Process 614
> using kernel context 0
> [  404.947643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
> [  404.953752] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
> context 0
> [  405.132658] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
> context 0
> [  405.140370] [drm:drm_legacy_unlock] *ERROR* Process 614 using kernel
> context 0
> --------------------------------------
>
> Reboot scenario:
> ---------------------------------------
> root@mx6q:~#
> root@mx6q:~# ps | grep -i match
>   569 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
> yes
>   621 root      174m S    matchbox-desktop
>   622 root      174m S    matchbox-panel --start-applets
> showdesktop,windowselector --end-applets clock,battery,,systray,
> startup-notify,notify
>   652 root      2752 S    grep -i match
> root@mx6q:~#
> root@mx6q:~# reboot
> [   26.234069] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
> context 0
> [   26.247957] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
> context 0
> [   26.261257] [drm:drm_legacy_unlock] *ERROR* Process 621 using kernel
> context 0
> [   26.268810] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
> ---------------------------------------
>
> Killing Xorg directly does not have any issue related to DRM lockup, but
> termination of matchbox session is showing up these errors. The target has
> DRM support and runs on accelerated graphics.
>
> This is not seen on "krogoth yocto-2.1" builds.
>
> Did anyone notice this on most recent core-image-sato running on DRM
> enabled target ?
>
> Any pointers will be much appreciated.
>
> TIA!
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1134daa28237f9053d150da7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br></div>@Ping<br><br></div>Pl=
ease advise further pointers if any. <br><br><br></div>Thanks<br></div>Shri=
kant<br><div><div><div><div><div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Aug 25, 2016 at 8:13 PM, srikanth krishnakar <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:skrishnakar@gmail.com" target=3D"_blank"=
>skrishnakar@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div><div><div><div><div><div><font face=3D"monospace,=
monospace">Hello All, <br><br></font></div><font face=3D"monospace,monospac=
e">I am building latest yocto with core-image-sato and noticed that matchbo=
x session or its relative apps are using kernel context and eventually thes=
e are shown when the window manager is terminated or the target is rebooted=
. Please see the logs below:<br><br></font></div><div><font face=3D"monospa=
ce,monospace">Target: i.MX6Q ARM<br></font></div><div><font face=3D"monospa=
ce,monospace">Kernel: Linux-4.1<br></font></div><div><font face=3D"monospac=
e,monospace">Yocto: master (7b9f59)<br></font><table summary=3D"commit info=
" height=3D"24" width=3D"369"><tbody><tr><th><br></th><td colspan=3D"2"><br=
></td></tr></tbody></table></div><div><font face=3D"monospace,monospace">--=
----------------------------<wbr>--------<br>root@mx6q:~# ps | grep match<b=
r>=C2=A0 558 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7080 S=C2=A0=C2=A0=C2=A0 ma=
tchbox-window-manager -theme Sato -use_cursor yes<br>=C2=A0 612 root=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-desktop<br>=C2=
=A0 614 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbo=
x-panel --start-applets showdesktop,windowselector --end-applets clock,batt=
ery,,systray,<wbr>startup-notify,notify<br>=C2=A0 677 root=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2752 S=C2=A0=C2=A0=C2=A0 grep match<br>root@mx6q:~# <br>roo=
t@mx6q:~# <br>root@mx6q:~# opkg list | grep -i xserver-xorg<br>xserver-xorg=
 - 2:1.18.4-r0.3<br>xserver-xorg-extension-glx - 2:1.18.4-r0.3<br>xserver-x=
org-extension-viv-<wbr>autohdmi - 3:5.0.11.p8.4-r0.3<br>xserver-xorg-module=
-exa - 2:1.18.4-r0.3<br>root@mx6q:~# opkg list | grep -i matchbox=C2=A0=C2=
=A0=C2=A0 <br>matchbox-config-gtk - 0.2-r0.2<br>matchbox-desktop - 2.1-r0.2=
<br>matchbox-keyboard - 0.1.1-r0.2<br>matchbox-keyboard-applet - 0.1.1-r0.2=
<br>matchbox-keyboard-im - 0.1.1-r0.2<br>matchbox-panel-2 - 2.11-r0.2<br>ma=
tchbox-session - 0.1-r4.0<br>matchbox-session-sato - 0.1-r30.0<br>matchbox-=
terminal - 0.1-r0.2<br>matchbox-theme-sato - 0.2-r0.0<br>matchbox-wm - 1.2.=
1-r0.1<br>root@mx6q:~# <br>root@mx6q:~# kill 558<br>root@mx6q:~# [=C2=A0 40=
4.937507] [drm:drm_legacy_unlock] *ERROR* Process 614 using kernel context =
0<br>[=C2=A0 404.947643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lo=
ck<br>[=C2=A0 404.953752] [drm:drm_legacy_unlock] *ERROR* Process 612 using=
 kernel context 0<br>[=C2=A0 405.132658] [drm:drm_legacy_unlock] *ERROR* Pr=
ocess 612 using kernel context 0<br>[=C2=A0 405.140370] [drm:drm_legacy_unl=
ock] *ERROR* Process 614 using kernel context 0<br>------------------------=
------<wbr>--------<br><br></font></div><font face=3D"monospace,monospace">=
Reboot scenario:<br>------------------------------<wbr>---------<br>root@mx=
6q:~# <br>root@mx6q:~# ps | grep -i match<br>=C2=A0 569 root=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 7080 S=C2=A0=C2=A0=C2=A0 matchbox-window-manager -theme Sat=
o -use_cursor yes<br>=C2=A0 621 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=
=C2=A0=C2=A0=C2=A0 matchbox-desktop<br>=C2=A0 622 root=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-panel --start-applets showdeskt=
op,windowselector --end-applets clock,battery,,systray,<wbr>startup-notify,=
notify<br>=C2=A0 652 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2752 S=C2=A0=C2=A0=
=C2=A0 grep -i match<br>root@mx6q:~# <br>root@mx6q:~# reboot<br>[=C2=A0=C2=
=A0 26.234069] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel con=
text 0<br>[=C2=A0=C2=A0 26.247957] [drm:drm_legacy_unlock] *ERROR* Process =
622 using kernel context 0<br>[=C2=A0=C2=A0 26.261257] [drm:drm_legacy_unlo=
ck] *ERROR* Process 621 using kernel context 0<br>[=C2=A0=C2=A0 26.268810] =
[drm:drm_lock_take] *ERROR* 1 holds heavyweight lock<br>-------------------=
-----------<wbr>---------<br><br></font></div><font face=3D"monospace,monos=
pace">Killing Xorg directly does not have any issue related to DRM lockup, =
but termination of matchbox session is showing up these errors. The target =
has DRM support and runs on accelerated graphics. <br><br></font></div><div=
><font face=3D"monospace,monospace">This is not seen on &quot;krogoth yocto=
-2.1&quot; builds. <br><br></font></div><font face=3D"monospace,monospace">=
Did anyone notice this on most recent core-image-sato running on DRM enable=
d target ?<br><br></font></div><font face=3D"monospace,monospace">Any point=
ers will be much appreciated. <br><br></font></div><font face=3D"monospace,=
monospace">TIA!<br></font></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div></div></div></div></div>

--001a1134daa28237f9053d150da7--
