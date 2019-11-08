Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 498B56C0C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 17:20:14 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k2so5868083oij.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 09:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h/Z9UcNhFdNtFGNxKYyXEkykRlXKks2SYbjpY2OxRIg=;
	b=M9/otxgcTZzIKdN/aqyFaFDkHQ0PgNphCBfGftpTqO8KyswQrCpZQ2JhKABO+oy2HK
	By6CI+qM5ZgxMIqEPxdydtZs8r+O2HmzSwjC4TAgPlFMKhkc1NFjpDBMzT1OvWGQBkq7
	TenhpDfXj4Gs2NawEZ0kk6rExfu6qnvih3Lto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h/Z9UcNhFdNtFGNxKYyXEkykRlXKks2SYbjpY2OxRIg=;
	b=O4RObOCT9Ddi9W1jcIWygtC8MPmpDH8dtmmJOUH2BzCNyIxN2UmHRXgzpkjy4IpkkQ
	0/KSCjMeJuFgw683oFqpymEVUD5kkXrOPU2H6/Qp9WY2zEwHkNzA2OGqvn8gwfdmhyW6
	c8sQSueP3feCHhgemskSwmdzOj7labYQCvhLtrXzGGDApVoibBDgbFdajYs6S5o3uJ6B
	ImuJgc0Ycy02btylvJmG8fkgqPxuiybvl3tGCvKMgvdr2FocGAgHoctYOajeifuz21ol
	bcVzbGBOXBBhb9Hkd7Ao9yY6rwZ7x24x9zj/sbOxdUs/CNIAJ42A+yo2BHUXAq6fCDqW
	h8cw==
X-Gm-Message-State: APjAAAVbBgy0ZblamePlNF9u6RDJlu6GNCWHoiCXLe6lk55iNUUvoyzD
	DSjlBP0Ik+0uiP/SSsqxgqPOBpLPPlWNEBTltYS+lw==
X-Google-Smtp-Source: APXvYqwJvOTJKU3f1dLlSZyAw0X4yAddyrYkw0qXyONZt4daQ26/0noyuqiPM0LqTJZdbbJ1XRB4W9thA6tf5TTah9Y=
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr10786515oih.63.1573233615834;
	Fri, 08 Nov 2019 09:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
	<CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
	<CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
In-Reply-To: <CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 8 Nov 2019 09:20:04 -0800
Message-ID: <CADfgfoYap0Z83h-mRXOLvX2kkC8xitN1Mx5wQM4uHugRhG15Nw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 08 Nov 2019 17:20:15 -0000
Content-Type: multipart/alternative; boundary="000000000000d222630596d8fe80"

--000000000000d222630596d8fe80
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 4, 2019 at 1:11 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:
>
> On Sat, 2 Nov 2019 at 23:29, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:
>>
>> Same failures on the Debian 10 worker:
>>>>
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/778
>>>
>>>
>>> runqemu - ERROR - Failed to run qemu: Xlib:  extension "RANDR" missing
on display ":1".
>>> qemu-system-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863:
epoxy_get_proc_address: Assertion `0 && "Couldn't find current GLX or EGL
context.\n"' failed.
>>>
>>> Thanks - the Gtk part is passing fine, so it's something SDL does that
upsets the X/GL stack on the Debian 10 host.
>>> I am reluctant to disable the SDL part of the virgl tests on Debian 10,
as it is a new distro (unlike centos 7).
>>>
>>> I'll try to see if I can run Debian 10 in a VM here and try to
reproduce. Or is it possible to debug directly on a Debian 10 worker?
>>
>>
>> So I actually went ahead, and installed Debian 10 into a qemu image,
then transferred a pre-populated build directory into it, and ran runqemu
there against tigervnc (hurray for the nested kvm feature!).
>>
>> Both 'runqemu kvm sdl gl' and 'runqemu kvm gtk gl' work fine, including
running kmscube!
>>
>> So I'd like to see what packages are installed on the Debian 10 worker
vs. my Debian 10 installation.
>>
>> Can you issue 'dpkg -l' on the worker, and send me the output, please?
Maybe something is missing?
>
>
> After additional digging I reproduced this. The culprit is the outdated
VNC server implementation that runs on the Debian 10 autobuilder (and maybe
others as well).
>
> Specifically, it's tightvncserver, where all Linux development has ceased
10 years ago (!).
> https://www.tightvnc.com/
>
> If you replace that with tigervnc (a modern, supported fork of tightvnc),
then the tests pass fine.
> https://tigervnc.org/
>

TigerVNC is now installed from the standard repos where available.

>
> As Fedora has already obsoleted tightvnc in favor of tigervnc, I think we
should do the same on all debian machines (debian provides both tightvnc
and tigervnc, but treats them as equal).
> https://src.fedoraproject.org/rpms/tightvnc/blob/master/f/dead.package
> I also checked that tightvnc is not available for opensuse either.


Server components of TigerVNC are in xorg-x11-Xvnc package which is
installed on all the openSUSE workers so I expect the VNC server there to
work. Please let me know if they do not.


On Ubuntu 16.04 and Debian 8 workers I've installed from
https://bintray.com/tigervnc/stable/tigervnc/1.9.0. This should allow tests
to complete. Installing packages outside of the distribution's package
manager might invalidate these as sanity tested distros. I'd appreciate
feedback about this.

--
Michael Halstead
Yocto Project / SysAdmin


>
> Alex

--000000000000d222630596d8fe80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Nov 4, 2019 at 1:11 PM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br>&gt;<br>&gt; On Sat, 2 Nov 2019 at 23:29, Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br>&gt;&gt;<br>&gt;&gt; Same failures on the Debian 10 worker:<br>&gt;=
&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; <a href=3D"https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/56/builds/778">https://autobui=
lder.yoctoproject.org/typhoon/#/builders/56/builds/778</a><br>&gt;&gt;&gt;<=
br>&gt;&gt;&gt;<br>&gt;&gt;&gt; runqemu - ERROR - Failed to run qemu: Xlib:=
 =C2=A0extension &quot;RANDR&quot; missing on display &quot;:1&quot;.<br>&g=
t;&gt;&gt; qemu-system-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863:=
 epoxy_get_proc_address: Assertion `0 &amp;&amp; &quot;Couldn&#39;t find cu=
rrent GLX or EGL context.\n&quot;&#39; failed.<br>&gt;&gt;&gt;<br>&gt;&gt;&=
gt; Thanks - the Gtk part is passing fine, so it&#39;s something SDL does t=
hat upsets the X/GL stack on the Debian 10 host.<br>&gt;&gt;&gt; I am reluc=
tant to disable the SDL part of the virgl tests on Debian 10, as it is a ne=
w distro (unlike centos 7).<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; I&#39;ll try to=
 see if I can run Debian 10 in a VM here and try to reproduce. Or is it pos=
sible to debug directly on a Debian 10 worker?<br>&gt;&gt;<br>&gt;&gt;<br>&=
gt;&gt; So I actually went ahead, and installed Debian 10 into a qemu image=
, then transferred a pre-populated build directory into it, and ran runqemu=
 there against tigervnc (hurray for the nested kvm feature!). <br>&gt;&gt;<=
br>&gt;&gt; Both &#39;runqemu kvm sdl gl&#39; and &#39;runqemu kvm gtk gl&#=
39; work fine, including running kmscube!<br>&gt;&gt;<br>&gt;&gt; So I&#39;=
d like to see what packages are installed on the Debian 10 worker vs. my De=
bian 10 installation.<br>&gt;&gt;<br>&gt;&gt; Can you issue &#39;dpkg -l&#3=
9; on the worker, and send me the output, please? Maybe something is missin=
g?<br>&gt;<br>&gt;<br>&gt; After additional digging I reproduced this. The =
culprit is the outdated VNC server implementation that runs on the Debian 1=
0 autobuilder (and maybe others as well).<br>&gt;<br>&gt; Specifically, it&=
#39;s tightvncserver, where all Linux development has ceased 10 years ago (=
!).<br>&gt; <a href=3D"https://www.tightvnc.com/">https://www.tightvnc.com/=
</a><br>&gt;<br>&gt; If you replace that with tigervnc (a modern, supported=
 fork of tightvnc), then the tests pass fine.<br>&gt; <a href=3D"https://ti=
gervnc.org/">https://tigervnc.org/</a><br>&gt;<br><br>TigerVNC is now insta=
lled from the standard repos where available.<br>=C2=A0<br>&gt;<br>&gt; As =
Fedora has already obsoleted tightvnc in favor of tigervnc, I think we shou=
ld do the same on all debian machines (debian provides both tightvnc and ti=
gervnc, but treats them as equal).<br>&gt; <a href=3D"https://src.fedorapro=
ject.org/rpms/tightvnc/blob/master/f/dead.package">https://src.fedoraprojec=
t.org/rpms/tightvnc/blob/master/f/dead.package</a><br>&gt; I also checked t=
hat tightvnc is not available for opensuse either.<br><br><br>Server compon=
ents of TigerVNC are in xorg-x11-Xvnc package which is installed on all the=
 openSUSE workers so I expect the VNC server there to work. Please let me k=
now if they do not.<br><br><br>On Ubuntu 16.04 and Debian 8 workers I&#39;v=
e installed from <a href=3D"https://bintray.com/tigervnc/stable/tigervnc/1.=
9.0">https://bintray.com/tigervnc/stable/tigervnc/1.9.0</a>. This should al=
low tests to complete. Installing packages outside of the distribution&#39;=
s package manager might invalidate these as sanity tested distros. I&#39;d =
appreciate feedback about this.<br><br>--<br>Michael Halstead<br>Yocto Proj=
ect / SysAdmin<br><br><br>&gt;<br>&gt; Alex</div>

--000000000000d222630596d8fe80--
