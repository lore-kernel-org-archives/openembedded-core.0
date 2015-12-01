Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 37696601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 14:46:14 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so11043583lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WrYiVTISwNsEx32qu4ctHTenvn7QfD1THm1aWw/pe2o=;
	b=MDLTNeXcq+ezb34SNwjFMXTcoTuQaOEpwb8AVvXX1GB2ApyCPvfyoGVns76kVCXFmp
	YaiHUPPP1xnrnrwa0rCQkfYAwx6oXwlDjejygDwlt4zDZmouW6CTHVdPa/RvoHe6y4dw
	hzWgmHmyTer0KbZxWKRlQdnDkQFr8gK27PJ9hO7XFMRcZE4bj02oUAjk8+mY3N/xufo+
	W9uIi1gNJghft6syqf5JP1WkQo8JpiqSlaaPpwy2p0mAq6HAnsURDaXgTtEfnaDkKecw
	rOjgyu0FgGa7xLPNpu6W5TwPmajdrXRSCHsvQAL0Lu3hk1IK+p6yix0eYHmQcbycm7z6
	nM4A==
MIME-Version: 1.0
X-Received: by 10.112.158.66 with SMTP id ws2mr29883599lbb.126.1448981174902; 
	Tue, 01 Dec 2015 06:46:14 -0800 (PST)
Received: by 10.25.39.72 with HTTP; Tue, 1 Dec 2015 06:46:14 -0800 (PST)
In-Reply-To: <1448978421-17308-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1448978421-17308-1-git-send-email-alexander.kanavin@linux.intel.com>
Date: Tue, 1 Dec 2015 15:46:14 +0100
Message-ID: <CAEGpDubxxeOF3sORangXzwg3N-8JMGhTZGAAzeC0iBRdM5eT2Q@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: add a native systemd unit file
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
X-List-Received-Date: Tue, 01 Dec 2015 14:46:16 -0000
Content-Type: multipart/alternative; boundary=001a11c340063768970525d73882

--001a11c340063768970525d73882
Content-Type: text/plain; charset=UTF-8

2015-12-01 15:00 GMT+01:00 Alexander Kanavin <
alexander.kanavin@linux.intel.com>:

> +       install -d ${D}${systemd_unitdir}/system
> +       install -m0644 ${WORKDIR}/weston.service
> ${D}${systemd_system_unitdir}
>

Sorry to be picky, but you only changed
"systemd_unitdir/system"->"systemd_system_unitdir" in one of the two lines
containing it! ;)

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

--001a11c340063768970525d73882
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2015-12-01 15:00 GMT+01:00 Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div id=3D":2us" class=3D"" style=3D"overflow:hidden">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m0644 ${WORKDIR}/weston.service ${D}${=
systemd_system_unitdir}</div></blockquote></div><br>Sorry to be picky, but =
you only changed=C2=A0 &quot;systemd_unitdir/system&quot;-&gt;&quot;systemd=
_system_unitdir&quot; in one of the two lines containing it! ;)<br><br clea=
r=3D"all"><div><div class=3D"gmail_signature">Pau Espin Pedrol<br>mail/jabb=
er: <a href=3D"mailto:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@=
gmail.com</a><br><a href=3D"http://blog.espeweb.net" target=3D"_blank">http=
://blog.espeweb.net</a><br></div></div>
</div></div>

--001a11c340063768970525d73882--
