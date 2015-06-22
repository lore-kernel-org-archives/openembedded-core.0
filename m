Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4B673905
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 10:43:36 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so80961258qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 03:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=lMjklm5lh+yYmX27vm7kfpmgcb6qnK6GXbHm68LVo4I=;
	b=jcpKqzg+gSCG+ioyK3S6IlBs8ITzaFwqJ6ROCIbjjdg+EIJ4Z6pmhS2uGH4cg2xT5e
	QWCwnbDsE3bWt3P5yaRvgXvxG2pAuS3gosQ/8qeDKP/I6t7xMazeS4DB7G43wostQk3Y
	vfFwgKBwHCI3BNDrtXnS7Nb69IYKyuVmp5IJP+iHwamqO3A8okQrsEhaaWYiuoH+K6fR
	vVhHemktdPVzYuk2sWTM8X0dIxPJiikK7ZviQATeMX8wvcgZWVXwVUWKOU4N9VJ8zjmY
	bqakwx6wIWf7dhk8IzvHLwAOIZFg0iVBoDmaCYYwsH/kDDKxSw4xybeMvtNmAPcUI7kA
	snYg==
X-Gm-Message-State: ALoCoQllnqksbqERVkDpg5pijWFzVGlCmBM7YYaHioMPb8vYsg5RtYQGwvlXnXqtrqf7w+3Yitmm
X-Received: by 10.140.89.104 with SMTP id u95mr36390434qgd.15.1434969817130;
	Mon, 22 Jun 2015 03:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 22 Jun 2015 03:43:17 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jun 2015 11:43:17 +0100
Message-ID: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: Future of Qt4 recipes
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
X-List-Received-Date: Mon, 22 Jun 2015 10:43:36 -0000
Content-Type: multipart/alternative; boundary=001a11c135f636c210051918f2d1

--001a11c135f636c210051918f2d1
Content-Type: text/plain; charset=UTF-8

Hi,

So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the end
of 2015, and 4.8.7 is planned to be the last ever release of Qt4. It's
still mandated by the long-awaited LSB 5 but I think it's fair to say that
the majority of developers have moved to Qt5. So, what should we do with
Qt4 moving forward?[2]  I see several options:

1) There's still lots of people using Qt4 in production, please keep it in
oe-core!  (and revisit in six months time)
2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core 1.9
ships without Qt4, and anyone wanting full LSB compliance or Qt4 will need
to add that layer to their distro.

Personally, I vote for (2).  Any other comments?

Ross

[1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812

--001a11c135f636c210051918f2d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div>So, Qt 4.8.7 was released last month[1].=
=C2=A0 Support for Qt4 stops at the end of 2015, and 4.8.7 is planned to be=
 the last ever release of Qt4. It&#39;s still mandated by the long-awaited =
LSB 5 but I think it&#39;s fair to say that the majority of developers have=
 moved to Qt5. So, what should we do with Qt4 moving forward?[2] =C2=A0I se=
e several options:</div><div><br></div><div>1) There&#39;s still lots of pe=
ople using Qt4 in production, please keep it in oe-core! =C2=A0(and revisit=
 in six months time)</div><div>2) Move Qt4 recipes and classes to a meta-qt=
4 layer now so that oe-core 1.9 ships without Qt4, and anyone wanting full =
LSB compliance or Qt4 will need to add that layer to their distro.</div><di=
v><br></div><div>Personally, I vote for (2).=C2=A0 Any other comments?</div=
><div><br></div><div>Ross</div><div><br></div><div>[1] <a href=3D"https://b=
log.qt.io/blog/2015/05/26/qt-4-8-7-released/">https://blog.qt.io/blog/2015/=
05/26/qt-4-8-7-released/</a></div><div>[2]=C2=A0<a href=3D"https://bugzilla=
.yoctoproject.org/show_bug.cgi?id=3D7812">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D7812</a></div></div>

--001a11c135f636c210051918f2d1--
