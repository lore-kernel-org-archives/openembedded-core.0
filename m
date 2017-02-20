Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB8071D31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:18:59 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s186so99397771qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SPfQTdKapOmzSkgfjQD7/HxNTVIszc97ocnCZPKu5qg=;
	b=dgTE4BwxfdconNsIIiy1c9Qu7Yxg5SLzqHts1nQveh0V/OLd80q5Pp9WGH9ba9QAkm
	yHTxSgq9unpmSM2/h5k2B9p3AeqPlIXokPy+I6h8lbRtjSlIhKrvNI5skfpcYGsosfx5
	OqDMGF1mAusRSlUyj5WUnw+PLkRC03oAOUSFStSPbmBTF+GnNzZAkT++LT//kroD9pyO
	oYqJrpir/OBkfXS31/zekZMzR/jdgAxYaSBosPmEvAXo1cMDMk7PGp6Edu0uH/UsHrD7
	7rwNxWUohpLWMgsdycjyuTpinT6Cbxc+K1p51Ad8xNcxALM/nPde4vQCx+n8zu/3rFNZ
	hIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SPfQTdKapOmzSkgfjQD7/HxNTVIszc97ocnCZPKu5qg=;
	b=Cvk0a/KxfrgFzfHeBgLb3DiT+IHUyOl0b5RyyN84EYiRlGB3Yn6lsgHyj2OXz2xS2J
	fzJSjH75txHKkQW5IWf+YLH/1RQWS+DwY40VW/RMhM9xOtfO75cT0dkyDXYkMdBtBeS2
	GR1D6dbjrLvSxqF/9mbuEh0MyXGl4bWQTVQjnr6IkFKmerRhRErETih0cVYE63X8Nxjt
	YgCAWg4J5Z28XnpAT9BaJTpoEhuBEjewH8AGxROlvejX5D16BUzFdkoUPTdhbSxmhj1c
	/HkaCop9UF/OStdbM0t1WD/rdW7ZNziFmF75svULWTDG6k+lGPn6AGOgDx/CJjGgPKW3
	8dZQ==
X-Gm-Message-State: AMke39nNfZZYTTDGFHx/cKDHc51aKM4hoReYftk17GL/y6lktDXjZAdjj3tUmfENlcE+DrrGI1mcVT8BfvvACS83
X-Received: by 10.55.40.67 with SMTP id o64mr23266458qkh.3.1487607539442; Mon,
	20 Feb 2017 08:18:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 08:18:39 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702201052360.3945@localhost.localdomain>
References: <alpine.LFD.2.20.1702200935010.377@localhost.localdomain>
	<CABcZANkGtd+ikiFq+gL3d1m8_usPGfLZP9uaCKzarfXObEGO-w@mail.gmail.com>
	<alpine.LFD.2.20.1702201052360.3945@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 16:18:39 +0000
Message-ID: <CAJTo0LZm1u=7SO8ABO23_pBNLQ0HEOn5TNNsobw_go+Q85SdDA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: dbus seems to be given debian naming convention, breaking another recipe
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
X-List-Received-Date: Mon, 20 Feb 2017 16:18:59 -0000
Content-Type: multipart/alternative; boundary=001a1140af28f49b2e0548f89ebb

--001a1140af28f49b2e0548f89ebb
Content-Type: text/plain; charset=UTF-8

On 20 February 2017 at 15:53, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   i'm still confused, then ... what is libnet-dbus-perl complaining
> about?
>

You'll have to look at what libnet-dbus-perl is doing.  Maybe the logic is
broken and it thinks 1.10 < 1.3 (ascii compare would do that).  Maybe you
forgot a dbus DEPENDS.

Ross

--001a1140af28f49b2e0548f89ebb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2017 at 15:53, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2f3" cl=
ass=3D"a3s aXjCH m15a5c3b4f8e42b75">=C2=A0 i&#39;m still confused, then ...=
 what is libnet-dbus-perl complaining<br>
about?<br></div></blockquote></div><br>You&#39;ll have to look at what libn=
et-dbus-perl is doing.=C2=A0 Maybe the logic is broken and it thinks 1.10 &=
lt; 1.3 (ascii compare would do that).=C2=A0 Maybe you forgot a dbus DEPEND=
S.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1140af28f49b2e0548f89ebb--
