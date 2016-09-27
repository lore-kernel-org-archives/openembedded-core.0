Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E25F60234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 10:28:57 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l132so167820354wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2H4pNd6kCFDQyWF9dS6O/cbOti3NM/5cjsZktnwTbes=;
	b=W6QK8q59PZVUrUsdosDaSA+XxXDTAYpE/6hdtE17YDRz7YeTwHW/PZrEQ7aS5vZr4X
	8iiaVD7D69YCXaBZgbNzn0wmfl0BqrYZgNrWF7MSOgx5P4DrfCSlHj3QNLQcr57pJ2FO
	PmNsunCO7LlYza6WCX+NKM/uIhfsmm18ybBE9oVQdOP1xu4MdwT7waD529d+wb7VoH9x
	jP/dZK+BLB3fylrE00zr2syeinQ7FH5pAV4/96MJW0OmZc+WIFOBrDsDnYAuESBD5a4j
	4V1BUdf4/6J6DumQ3PPIilwDwXoqMovBnZPsWO6IKPm0rXihXxjQxDMOo5ZgSaewlFZA
	Tw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2H4pNd6kCFDQyWF9dS6O/cbOti3NM/5cjsZktnwTbes=;
	b=b86xGO5UEVnj3KM4RfkUZNwPWYc4myFdr00fkJCmwl6obhSb4IyOIqeCpR2rZWie1x
	J6NTV0vYhINt7tk9zM/Cm/xjceba5xvXBKriO9tyvXcbwHtX+jQAuwH20d9zECYFnFfh
	TgVqrrh+E+zeyLTySqkVVeMbdL1mLRB4UvAXCCaUtuM5YpDZ8tCUn/gjR9JDtcTrI8LL
	C+8C06dICJkuttiCzw89tmDYeElC5KoS3XuJk+txeJtm2xA0VgiJsODyIT7bAX6R6olt
	ZZKqV1oAmspYmCnjOt7q0jQKHXaiTofUFt4GQ4IroU5JsJjLfEeX6c+zJqnJk/7/+WJ/
	Ru4Q==
X-Gm-Message-State: AE9vXwNjUB3JfTA6EMmv5Wp8oVr0+54Lq7DTelXSxSH6FBbKA5+y7LR7eiFIWU8FOGFkkv+xNwwz6iF5EFeccg==
X-Received: by 10.195.11.104 with SMTP id eh8mr21797013wjd.128.1474972138506; 
	Tue, 27 Sep 2016 03:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.143.226 with HTTP; Tue, 27 Sep 2016 03:28:58 -0700 (PDT)
In-Reply-To: <CALwQErrHFgMr9K4K5pi8er0FMmxerLqO_-n_QGDwxjZz7_2BsA@mail.gmail.com>
References: <CALDxG5jN6gi0naERO2bksjy50FNwymdbmgK3XDHLmiUPSGswgw@mail.gmail.com>
	<CALwQErrHFgMr9K4K5pi8er0FMmxerLqO_-n_QGDwxjZz7_2BsA@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
Date: Tue, 27 Sep 2016 15:58:58 +0530
Message-ID: <CALwQErqWH8HOsDwqPbv=PwUZEC2+S59a+QqMZH3teevPzCQVGQ@mail.gmail.com>
To: srikanth krishnakar <skrishnakar@gmail.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Sep 2016 10:28:58 -0000
Content-Type: multipart/alternative; boundary=047d7b874df45e910e053d7ab669

--047d7b874df45e910e053d7ab669
Content-Type: text/plain; charset=UTF-8

Hi,

@ping,

Please advise further pointers if any.
similar thread for this issue & more details @
https://lists.yoctoproject.org/pipermail/meta-freescale/2016-September/019237.html

Thanks
Shrikant



On Thu, Sep 22, 2016 at 2:41 PM, Shrikant Bobade <bobadeshrikant@gmail.com>
wrote:

> Hi,
>
> @Ping
>
> Please advise further pointers if any.
>
>
> Thanks
> Shrikant
>
> On Thu, Aug 25, 2016 at 8:13 PM, srikanth krishnakar <
> skrishnakar@gmail.com> wrote:
>
>> Hello All,
>>
>> I am building latest yocto with core-image-sato and noticed that matchbox
>> session or its relative apps are using kernel context and eventually these
>> are shown when the window manager is terminated or the target is rebooted.
>> Please see the logs below:
>>
>> Target: i.MX6Q ARM
>> Kernel: Linux-4.1
>> Yocto: master (7b9f59)
>>
>>
>> --------------------------------------
>> root@mx6q:~# ps | grep match
>>   558 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
>> yes
>>   612 root      174m S    matchbox-desktop
>>   614 root      174m S    matchbox-panel --start-applets
>> showdesktop,windowselector --end-applets clock,battery,,systray,startup
>> -notify,notify
>>   677 root      2752 S    grep match
>> root@mx6q:~#
>> root@mx6q:~#
>> root@mx6q:~# opkg list | grep -i xserver-xorg
>> xserver-xorg - 2:1.18.4-r0.3
>> xserver-xorg-extension-glx - 2:1.18.4-r0.3
>> xserver-xorg-extension-viv-autohdmi - 3:5.0.11.p8.4-r0.3
>> xserver-xorg-module-exa - 2:1.18.4-r0.3
>> root@mx6q:~# opkg list | grep -i matchbox
>> matchbox-config-gtk - 0.2-r0.2
>> matchbox-desktop - 2.1-r0.2
>> matchbox-keyboard - 0.1.1-r0.2
>> matchbox-keyboard-applet - 0.1.1-r0.2
>> matchbox-keyboard-im - 0.1.1-r0.2
>> matchbox-panel-2 - 2.11-r0.2
>> matchbox-session - 0.1-r4.0
>> matchbox-session-sato - 0.1-r30.0
>> matchbox-terminal - 0.1-r0.2
>> matchbox-theme-sato - 0.2-r0.0
>> matchbox-wm - 1.2.1-r0.1
>> root@mx6q:~#
>> root@mx6q:~# kill 558
>> root@mx6q:~# [  404.937507] [drm:drm_legacy_unlock] *ERROR* Process 614
>> using kernel context 0
>> [  404.947643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
>> [  404.953752] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
>> context 0
>> [  405.132658] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
>> context 0
>> [  405.140370] [drm:drm_legacy_unlock] *ERROR* Process 614 using kernel
>> context 0
>> --------------------------------------
>>
>> Reboot scenario:
>> ---------------------------------------
>> root@mx6q:~#
>> root@mx6q:~# ps | grep -i match
>>   569 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
>> yes
>>   621 root      174m S    matchbox-desktop
>>   622 root      174m S    matchbox-panel --start-applets
>> showdesktop,windowselector --end-applets clock,battery,,systray,startup
>> -notify,notify
>>   652 root      2752 S    grep -i match
>> root@mx6q:~#
>> root@mx6q:~# reboot
>> [   26.234069] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
>> context 0
>> [   26.247957] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
>> context 0
>> [   26.261257] [drm:drm_legacy_unlock] *ERROR* Process 621 using kernel
>> context 0
>> [   26.268810] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
>> ---------------------------------------
>>
>> Killing Xorg directly does not have any issue related to DRM lockup, but
>> termination of matchbox session is showing up these errors. The target has
>> DRM support and runs on accelerated graphics.
>>
>> This is not seen on "krogoth yocto-2.1" builds.
>>
>> Did anyone notice this on most recent core-image-sato running on DRM
>> enabled target ?
>>
>> Any pointers will be much appreciated.
>>
>> TIA!
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--047d7b874df45e910e053d7ab669
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>@ping,<br><br></div><div>P=
lease advise further pointers if any. <br></div><div>similar thread for thi=
s issue &amp; more details @ <a href=3D"https://lists.yoctoproject.org/pipe=
rmail/meta-freescale/2016-September/019237.html">https://lists.yoctoproject=
.org/pipermail/meta-freescale/2016-September/019237.html</a><br></div><div>=
<br></div>Thanks<br></div>Shrikant<br><div><div><br><br><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, Sep 22, 2016 at 2:41 PM, Shr=
ikant Bobade <span dir=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:boba=
deshrikant@gmail.com">bobadeshrikant@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div><div><=
div><div>Hi,<br><br></div>@Ping<br><br></div>Please advise further pointers=
 if any. <br><br><br></div>Thanks<br></div>Shrikant<br><div><div><div><div>=
<div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div cl=
ass=3D"gmail-h5">On Thu, Aug 25, 2016 at 8:13 PM, srikanth krishnakar <span=
 dir=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:skrishnakar@gmail.com"=
>skrishnakar@gmail.com</a>&gt;</span> wrote:<br></div></div><blockquote sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex" class=3D"gmail_quote"><div><div class=3D"gmail-h5"><div dir=3D=
"ltr"><div><div><div><div><div><div><font face=3D"monospace,monospace">Hell=
o All, <br><br></font></div><font face=3D"monospace,monospace">I am buildin=
g latest yocto with core-image-sato and noticed that matchbox session or it=
s relative apps are using kernel context and eventually these are shown whe=
n the window manager is terminated or the target is rebooted. Please see th=
e logs below:<br><br></font></div><div><font face=3D"monospace,monospace">T=
arget: i.MX6Q ARM<br></font></div><div><font face=3D"monospace,monospace">K=
ernel: Linux-4.1<br></font></div><div><font face=3D"monospace,monospace">Yo=
cto: master (7b9f59)<br></font><table summary=3D"commit info" height=3D"24"=
 width=3D"369"><tbody><tr><th><br></th><td colspan=3D"2"><br></td></tr></tb=
ody></table></div><div><font face=3D"monospace,monospace">-----------------=
-------------<wbr>--------<br>root@mx6q:~# ps | grep match<br>=C2=A0 558 ro=
ot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7080 S=C2=A0=C2=A0=C2=A0 matchbox-window-m=
anager -theme Sato -use_cursor yes<br>=C2=A0 612 root=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-desktop<br>=C2=A0 614 root=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-panel --start=
-applets showdesktop,windowselector --end-applets clock,battery,,systray,st=
artup<wbr>-notify,notify<br>=C2=A0 677 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=
752 S=C2=A0=C2=A0=C2=A0 grep match<br>root@mx6q:~# <br>root@mx6q:~# <br>roo=
t@mx6q:~# opkg list | grep -i xserver-xorg<br>xserver-xorg - 2:1.18.4-r0.3<=
br>xserver-xorg-extension-glx - 2:1.18.4-r0.3<br>xserver-xorg-extension-viv=
-aut<wbr>ohdmi - 3:5.0.11.p8.4-r0.3<br>xserver-xorg-module-exa - 2:1.18.4-r=
0.3<br>root@mx6q:~# opkg list | grep -i matchbox=C2=A0=C2=A0=C2=A0 <br>matc=
hbox-config-gtk - 0.2-r0.2<br>matchbox-desktop - 2.1-r0.2<br>matchbox-keybo=
ard - 0.1.1-r0.2<br>matchbox-keyboard-applet - 0.1.1-r0.2<br>matchbox-keybo=
ard-im - 0.1.1-r0.2<br>matchbox-panel-2 - 2.11-r0.2<br>matchbox-session - 0=
.1-r4.0<br>matchbox-session-sato - 0.1-r30.0<br>matchbox-terminal - 0.1-r0.=
2<br>matchbox-theme-sato - 0.2-r0.0<br>matchbox-wm - 1.2.1-r0.1<br>root@mx6=
q:~# <br>root@mx6q:~# kill 558<br>root@mx6q:~# [=C2=A0 404.937507] [drm:drm=
_legacy_unlock] *ERROR* Process 614 using kernel context 0<br>[=C2=A0 404.9=
47643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock<br>[=C2=A0 404.=
953752] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel context 0<=
br>[=C2=A0 405.132658] [drm:drm_legacy_unlock] *ERROR* Process 612 using ke=
rnel context 0<br>[=C2=A0 405.140370] [drm:drm_legacy_unlock] *ERROR* Proce=
ss 614 using kernel context 0<br>------------------------------<wbr>-------=
-<br><br></font></div><font face=3D"monospace,monospace">Reboot scenario:<b=
r>------------------------------<wbr>---------<br>root@mx6q:~# <br>root@mx6=
q:~# ps | grep -i match<br>=C2=A0 569 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70=
80 S=C2=A0=C2=A0=C2=A0 matchbox-window-manager -theme Sato -use_cursor yes<=
br>=C2=A0 621 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 m=
atchbox-desktop<br>=C2=A0 622 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=
=A0=C2=A0=C2=A0 matchbox-panel --start-applets showdesktop,windowselector -=
-end-applets clock,battery,,systray,startup<wbr>-notify,notify<br>=C2=A0 65=
2 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2752 S=C2=A0=C2=A0=C2=A0 grep -i match=
<br>root@mx6q:~# <br>root@mx6q:~# reboot<br>[=C2=A0=C2=A0 26.234069] [drm:d=
rm_legacy_unlock] *ERROR* Process 622 using kernel context 0<br>[=C2=A0=C2=
=A0 26.247957] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel con=
text 0<br>[=C2=A0=C2=A0 26.261257] [drm:drm_legacy_unlock] *ERROR* Process =
621 using kernel context 0<br>[=C2=A0=C2=A0 26.268810] [drm:drm_lock_take] =
*ERROR* 1 holds heavyweight lock<br>------------------------------<wbr>----=
-----<br><br></font></div><font face=3D"monospace,monospace">Killing Xorg d=
irectly does not have any issue related to DRM lockup, but termination of m=
atchbox session is showing up these errors. The target has DRM support and =
runs on accelerated graphics. <br><br></font></div><div><font face=3D"monos=
pace,monospace">This is not seen on &quot;krogoth yocto-2.1&quot; builds. <=
br><br></font></div><font face=3D"monospace,monospace">Did anyone notice th=
is on most recent core-image-sato running on DRM enabled target ?<br><br></=
font></div><font face=3D"monospace,monospace">Any pointers will be much app=
reciated. <br><br></font></div><font face=3D"monospace,monospace">TIA!<br><=
/font></div>
<br></div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a target=3D"_blank" href=3D"mailto:Openembedded-core@lists.openembedded.or=
g">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a target=3D"_blank" rel=3D"noreferrer" href=3D"http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div><br></div></div></div></div></div></di=
v></div>
</blockquote></div><br></div></div></div></div>

--047d7b874df45e910e053d7ab669--
