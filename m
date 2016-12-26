Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E00E660269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 10:59:21 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c85so57319310wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tpFgAgWISbmakyDe7JZQWGESl+jc8Z+j/Rp2KEEfVAE=;
	b=rMM1jicu/RjKT3UgcsBh+SmNE1OiZtLHeu5wnoRrzS3IyDk7VBhwiwGWs7hoQwyF18
	52wqSdhozKJgL4kmSwsqrMcepcLLjCeZRH7MHOLT7tCLOkhdtkWROlRfgkzOopQDM+MB
	c2aNfDqfJJ1Altjlgjh79HXSV/POjl8qr6jydZZhs6pTEwSrUS02NQPXWV/o7bml9mE5
	I0SyTKMOGEZyTr2B+26iePdBYT0fvPSaWzlP7/CPY+GFzb6VqmRATloP+H6I8mJP00Wr
	25mKLhhO6Pqa9Dxz//QuGoptf/JaDiUp43/iBNksWvkpza+5TfZ+++4gpezPrEbfSXCS
	xX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tpFgAgWISbmakyDe7JZQWGESl+jc8Z+j/Rp2KEEfVAE=;
	b=B77eQQUibeKNq9mBUe6qd18NPJPvGyTbS4cv2IYHI7cn/PFDKbBPO7/zYzjbZ24I40
	nkL4yHlxU3JWm9l4/9swBor0Tk07dhGaOAGHdQH0cOAB+mJqD2HPSsyep1EwgZW+9KHN
	BslN9Wwv/WFSy0FtdPD/la4B+VtJf5/FmXTa15fTnhstNKuSw0BZcu5YBhL+JOlrKGpG
	+LwZ0BCAXaNAcgjHb2ELEcSoNmYNF7oUeJ2UBMQwDgGdVQO8pFZLoyJNPXhlilZr0FOY
	tU10EPufoWLldGxJvVeMHgPRsKIi4GB3FVCmgtpSsjVjsbCXsJQtALs3DW8XIsXZE9vm
	R+hA==
X-Gm-Message-State: AIkVDXIknmwEB9G+TTUQgxO6tr82TTsJK/gxSD0lzvIx+RvljX1Nxw8G4v74aKdU51vHIwJ8aRrum3S4NQe5Rw==
X-Received: by 10.28.17.20 with SMTP id 20mr21902158wmr.99.1482749962359; Mon,
	26 Dec 2016 02:59:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.134.9 with HTTP; Mon, 26 Dec 2016 02:58:42 -0800 (PST)
In-Reply-To: <1482748609.9843.136.camel@linuxfoundation.org>
References: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
	<1482748609.9843.136.camel@linuxfoundation.org>
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Mon, 26 Dec 2016 16:28:42 +0530
Message-ID: <CALDxG5h=3iZTJp=d_4RKGs6pOC=W6MJeFeJ6_-ykayqWv1i3nw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Mon, 26 Dec 2016 10:59:23 -0000
Content-Type: multipart/alternative; boundary=001a1146e13acc1a0605448da02c

--001a1146e13acc1a0605448da02c
Content-Type: text/plain; charset=UTF-8

Hello Richard,

Sure, watching is best thing we can do, but it happens somewhere after 2900
tasks i.e just after linux-yocto.
Screen recorders usually ask for file name and destination folder for
saving the file, will try to see if it works as you said.
"bitbake | cat" is the best method that we can get info from.

The issue is noticeable only in ubuntu (unity) desktop's and not in Kubuntu
(KDE), Ubuntu-gnome (Gnome-3) or Xubuntu (XFCE) desktops.

Will fetch more details as per your suggestion.

Thank you !

On Mon, Dec 26, 2016 at 4:06 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2016-12-26 at 15:11 +0530, srikanth krishnakar wrote:
> > Environment: Ubuntu-14.04.5/16.04.1 (64-bit)
> > Yocto build: qemuarm
> > Target image: core-image-sato
> > Error nature: The lightdm restarts on its own and logs out by killing
> > processes running and brings up a login UI.
> >
> >
> > We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and
> > Ubuntu-16.04.1 hosts due to restart of "lightdm" (Light Desktop
> > Manager)  that is triggered by crash of "unity-settings-daemon", we
> > couldn't figure out any workaround so far to overcome the issue. The
> > build goes fine in the beginning but eventually the unity desktop
> > logs out and kills all the processes running in the user session
> > (including bitbake) and lands us into "Login screen" and when we
> > login its a new session where as the bitbake running in previous
> > session is killed and we need to continue the build. This is
> > happening consistently when the user logs into desktop via lightdm
> > and triggers a build.
> >
> > Another interesting thing to notice is the build goes fine if we
> > connect to host via. SSH session and invoke a bitbake build. We are
> > suspecting on unity-settings-daemon that is crashing consistently and
> > is evident from the ".xsession-errors" log file as shown below:
> >
> > builder@ubuntu:~$ cat .xsession-errors.old
> > Script for ibus started at run_im.
> > Script for auto started at run_im.
> > Script for default started at run_im.
> > init: Disconnected from notified D-Bus bus
> > init:"unity-settings-daemon main process (2076) terminated with
> > status 1"
> > init: indicator-bluetooth main process (2212) killed by TERM signal
> > init: indicator-power main process (2214) killed by TERM signal
> > init: indicator-datetime main process (2215) killed by TERM signal
> > init: indicator-printers main process (2222) killed by TERM signal
> > init: indicator-session main process (2245) killed by TERM signal
> > init: indicator-application main process (2270) killed by TERM signal
> >
> > Corresponding unity-settings-daemon bug reported in Launchpad:
> >
> > https://bugs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/
> > 1546641
> >
> > Would anyone kindly confirm the logout behaviour during bitbake
> > process on Ubuntu-14.04.5 & Ubuntu-16.04.1 ? Since Yocto 2.2 mentions
> > both Ubuntu-14.04 & 16.04 as supported distributions this blocker
> > issue must be resolved at earliest.
> >
> > Appreciate your Inputs !
>
> What would really help is knowing what recipe is being built when this
> happens. There are a few ways you might be able to figure this out:
>
> a) Watching the screen to see which recipes were building when it
> happens
> b) Perhaps using some kind of screen recorder to automate this, you'd
> be able to review the recording to see when it breaks
> c) Looking at the bitbake/build logs to see what it was doing when the
> build broke (assuming bitbake stops when the session dies).
>
> "bitbake | cat" can provide better output for this since it will
> produce a scrolling log rather than the more interactive UI.
>
> Once you find the problematic recipe, a "bitbake XXX -c clean; bitbake
> XXX" should hopefully reproduce this more easily.
>
> Cheers,
>
> Richard
>

--001a1146e13acc1a0605448da02c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace">Hello Richard,</font><=
div><font face=3D"monospace, monospace"><br></font></div><div><font face=3D=
"monospace, monospace">Sure, watching is best thing we can do, but it happe=
ns somewhere after 2900 tasks i.e just after linux-yocto.=C2=A0</font></div=
><div><font face=3D"monospace, monospace">Screen recorders usually ask for =
file name and destination folder for saving the file, will try to see if it=
 works as you said.=C2=A0</font></div><div><font face=3D"monospace, monospa=
ce">&quot;bitbake | cat&quot; is the best method that we can get info from.=
=C2=A0</font></div><div><font face=3D"monospace, monospace"><br></font></di=
v><div><font face=3D"monospace, monospace">The issue is noticeable=C2=A0onl=
y in ubuntu (unity) desktop&#39;s and not in Kubuntu (KDE), Ubuntu-gnome (G=
nome-3) or Xubuntu (XFCE) desktops.=C2=A0</font></div><div><font face=3D"mo=
nospace, monospace"><br></font></div><div><font face=3D"monospace, monospac=
e">Will fetch more details as per your suggestion.=C2=A0</font></div><div><=
font face=3D"monospace, monospace"><br></font></div><div><font face=3D"mono=
space, monospace">Thank you !</font></div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Mon, Dec 26, 2016 at 4:06 PM, Richard Pur=
die <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"=
h5">On Mon, 2016-12-26 at 15:11 +0530, srikanth krishnakar wrote:<br>
&gt; Environment: Ubuntu-14.04.5/16.04.1 (64-bit)<br>
&gt; Yocto build: qemuarm<br>
&gt; Target image: core-image-sato<br>
&gt; Error nature: The lightdm restarts on its own and logs out by killing<=
br>
&gt; processes running and brings up a login UI.=C2=A0<br>
&gt;<br>
&gt;<br>
&gt; We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and<=
br>
&gt; Ubuntu-16.04.1 hosts due to restart of &quot;lightdm&quot; (Light Desk=
top<br>
&gt; Manager) =C2=A0that is triggered by crash of &quot;unity-settings-daem=
on&quot;, we<br>
&gt; couldn&#39;t figure out any workaround so far to overcome the issue. T=
he<br>
&gt; build goes fine in the beginning but eventually the unity desktop<br>
&gt; logs out and kills all the processes running in the user session<br>
&gt; (including bitbake) and lands us into &quot;Login screen&quot; and whe=
n we<br>
&gt; login its a new session where as the bitbake running in previous<br>
&gt; session is killed and we need to continue the build. This is<br>
&gt; happening consistently when the user logs into desktop via lightdm<br>
&gt; and triggers a build.=C2=A0<br>
&gt;<br>
&gt; Another interesting thing to notice is the build goes fine if we<br>
&gt; connect to host via. SSH session and invoke a bitbake build. We are<br=
>
&gt; suspecting on unity-settings-daemon that is crashing consistently and<=
br>
&gt; is evident from the &quot;.xsession-errors&quot; log file as shown bel=
ow:<br>
&gt;<br>
&gt; builder@ubuntu:~$ cat .xsession-errors.old<br>
&gt; Script for ibus started at run_im.<br>
&gt; Script for auto started at run_im.<br>
&gt; Script for default started at run_im.<br>
&gt; init: Disconnected from notified D-Bus bus<br>
&gt; init:&quot;unity-settings-daemon main process (2076) terminated with<b=
r>
&gt; status 1&quot;<br>
&gt; init: indicator-bluetooth main process (2212) killed by TERM signal<br=
>
&gt; init: indicator-power main process (2214) killed by TERM signal<br>
&gt; init: indicator-datetime main process (2215) killed by TERM signal<br>
&gt; init: indicator-printers main process (2222) killed by TERM signal<br>
&gt; init: indicator-session main process (2245) killed by TERM signal<br>
&gt; init: indicator-application main process (2270) killed by TERM signal<=
br>
&gt;<br>
&gt; Corresponding unity-settings-daemon bug reported in Launchpad:<br>
&gt;<br>
&gt; <a href=3D"https://bugs.launchpad.net/ubuntu/+source/unity-settings-da=
emon/+bug/" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net=
/<wbr>ubuntu/+source/unity-settings-<wbr>daemon/+bug/</a><br>
&gt; 1546641<br>
&gt;<br>
&gt; Would anyone kindly confirm the logout behaviour during bitbake<br>
&gt; process on Ubuntu-14.04.5 &amp; Ubuntu-16.04.1 ? Since Yocto 2.2 menti=
ons<br>
&gt; both Ubuntu-14.04 &amp; 16.04 as supported distributions this blocker<=
br>
&gt; issue must be resolved at earliest.=C2=A0<br>
&gt;<br>
&gt; Appreciate your Inputs !<br>
<br>
</div></div>What would really help is knowing what recipe is being built wh=
en this<br>
happens. There are a few ways you might be able to figure this out:<br>
<br>
a) Watching the screen to see which recipes were building when it<br>
happens<br>
b) Perhaps using some kind of screen recorder to automate this, you&#39;d<b=
r>
be able to review the recording to see when it breaks<br>
c) Looking at the bitbake/build logs to see what it was doing when the<br>
build broke (assuming bitbake stops when the session dies).<br>
<br>
&quot;bitbake | cat&quot; can provide better output for this since it will<=
br>
produce a scrolling log rather than the more interactive UI.<br>
<br>
Once you find the problematic recipe, a &quot;bitbake XXX -c clean; bitbake=
<br>
XXX&quot; should hopefully reproduce this more easily.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a1146e13acc1a0605448da02c--
