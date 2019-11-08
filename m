Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E31C7FC8F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 17:56:00 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id j84so1693152vkj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 09:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D+YVft6cDKzE6zEPvqvbh7rAaHwSFSd/JVtPi/pzDkI=;
	b=kKFpUTXM0Qg8e/0R3bkWCfaXihxY1Thq1MFnwGewwbkf3eFxzmbwHz/2GD+kzbdnYd
	i6+G8v5QhTKhnqELa3e86KpLpkKx3EwsQ6p8CGrY7NuD1sykXKx2atwtfROsfe0KFbkk
	zpkaSVdKbajpjVp9yGf3o0/t8VsB0GeDoaZsdfzEJ0F/G5STHMUQ3+EdcH2XBON1kuUd
	NL39MCJdX7MEdmSPNmIl+r//+7sr6fjwN4koh6TFHuyadyX4lCfPzSWI5Whgr5/wGxjY
	OFPKhVkwpi9Z1EeLUVekeklqQ3eun2eRDXAwAiAA0DXuUxYxaw31IzHSNieAq12/Kqk9
	XHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D+YVft6cDKzE6zEPvqvbh7rAaHwSFSd/JVtPi/pzDkI=;
	b=dIMPgzAvUiQWE82ZcUghxGIEbV8/WaaK4Z8JKGkli7nsP72lApBvZP8VenBG20wOb2
	hozTW6m1RpS2ixhqphpEeNu0GiMpXr6ZX5B+Te/BJOgRzWwPzYqwt00iK0REs3zwlOlz
	WGdnw31f7K3ejoO74jDaQ5L1ML0ln1wjGpgHNmo2qNI97aDmEPLSDzQMYwRQcMdtYg1J
	NpPqYjloBzSxXeztox0OkcFD9+esk3M9sX413hmV47wObh+PxjQKdhCFVx5/e0d2GpRj
	fpJYyF7gxXMQG8ZixJmi0wXR+Dq1XWDXDopAIo1y2xei0bq2ssxVjFttPQ7orgGzQOpp
	iB/Q==
X-Gm-Message-State: APjAAAWBaa8VPRiC9oeUNOP0VPh36HSNqU5FuFdxDxuVZaSoEa7DoT3S
	AVgc1GNc9j3NXfS7cWOC3tbS6RxyOlLFX9EE8Kaw1A==
X-Google-Smtp-Source: APXvYqzRuR46er7fmgERDB9b4elcTKu71l9cHGLgWVgYgB0cWsCk3W/2xhWNoynekReLTQLIoAQdvYimVq/LA5Hhmo4=
X-Received: by 2002:a1f:d604:: with SMTP id n4mr896122vkg.1.1573235760665;
	Fri, 08 Nov 2019 09:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
	<CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
	<CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
	<CADfgfoYap0Z83h-mRXOLvX2kkC8xitN1Mx5wQM4uHugRhG15Nw@mail.gmail.com>
In-Reply-To: <CADfgfoYap0Z83h-mRXOLvX2kkC8xitN1Mx5wQM4uHugRhG15Nw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Nov 2019 18:55:49 +0100
Message-ID: <CANNYZj8fQV9vaubTyYF2gzicP3U8w0bZP4Fne91bkRRzPP5hew@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
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
X-List-Received-Date: Fri, 08 Nov 2019 17:56:00 -0000
Content-Type: multipart/alternative; boundary="000000000000a99a740596d97ede"

--000000000000a99a740596d97ede
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2019 at 18:20, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> > If you replace that with tigervnc (a modern, supported fork of
> tightvnc), then the tests pass fine.
> > https://tigervnc.org/
> >
>
> TigerVNC is now installed from the standard repos where available.
>
> >
> > As Fedora has already obsoleted tightvnc in favor of tigervnc, I think
> we should do the same on all debian machines (debian provides both tightvnc
> and tigervnc, but treats them as equal).
> > https://src.fedoraproject.org/rpms/tightvnc/blob/master/f/dead.package
> > I also checked that tightvnc is not available for opensuse either.
>
>
> Server components of TigerVNC are in xorg-x11-Xvnc package which is
> installed on all the openSUSE workers so I expect the VNC server there to
> work. Please let me know if they do not.
>
>
> On Ubuntu 16.04 and Debian 8 workers I've installed from
> https://bintray.com/tigervnc/stable/tigervnc/1.9.0. This should allow
> tests to complete. Installing packages outside of the distribution's
> package manager might invalidate these as sanity tested distros. I'd
> appreciate feedback about this.
>

Thanks a lot! There are two things to check:
1. Old instances of vnc may still be running and should be shut down (via
'vncserver -kill :1')
2. vncserver executable should point to tigervnc (if both tigervnc and
tightvnc are installed - I don't know if you removed the tightvnc packages).

Otherwise everything should be ready for re-testing the patches. I can
resend them if needed.

Alex

--000000000000a99a740596d97ede
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 8 Nov 2019 at 18:20, Michael Hals=
tead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org">mhalstead@linuxfo=
undation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">&gt; If you replace=
 that with tigervnc (a modern, supported fork of tightvnc), then the tests =
pass fine.<br>&gt; <a href=3D"https://tigervnc.org/" target=3D"_blank">http=
s://tigervnc.org/</a><br>&gt;<br><br>TigerVNC is now installed from the sta=
ndard repos where available.<br>=C2=A0<br>&gt;<br>&gt; As Fedora has alread=
y obsoleted tightvnc in favor of tigervnc, I think we should do the same on=
 all debian machines (debian provides both tightvnc and tigervnc, but treat=
s them as equal).<br>&gt; <a href=3D"https://src.fedoraproject.org/rpms/tig=
htvnc/blob/master/f/dead.package" target=3D"_blank">https://src.fedoraproje=
ct.org/rpms/tightvnc/blob/master/f/dead.package</a><br>&gt; I also checked =
that tightvnc is not available for opensuse either.<br><br><br>Server compo=
nents of TigerVNC are in xorg-x11-Xvnc package which is installed on all th=
e openSUSE workers so I expect the VNC server there to work. Please let me =
know if they do not.<br><br><br>On Ubuntu 16.04 and Debian 8 workers I&#39;=
ve installed from <a href=3D"https://bintray.com/tigervnc/stable/tigervnc/1=
.9.0" target=3D"_blank">https://bintray.com/tigervnc/stable/tigervnc/1.9.0<=
/a>. This should allow tests to complete. Installing packages outside of th=
e distribution&#39;s package manager might invalidate these as sanity teste=
d distros. I&#39;d appreciate feedback about this.<br></div></blockquote><d=
iv><br></div><div>Thanks a lot! There are two things to check:</div><div>1.=
 Old instances of vnc may still be running and should be shut down (via &#3=
9;vncserver -kill :1&#39;)</div><div>2. vncserver executable should point t=
o tigervnc (if both tigervnc and tightvnc are installed - I don&#39;t know =
if you removed the tightvnc packages).</div><div><br></div><div>Otherwise e=
verything should be ready for re-testing the patches. I can resend them if =
needed.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000a99a740596d97ede--
