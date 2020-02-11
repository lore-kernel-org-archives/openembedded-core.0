Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id DBB026058C;
	Tue, 11 Feb 2020 12:48:55 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id x18so6191862vsq.4;
	Tue, 11 Feb 2020 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=u/nUGgQi4Wv+gwlnC5ul2Xy2VrsMiTntpsvY5JfzJnA=;
	b=vAzM4zyIJ77cXzaw/aNO7KkfMz54Nr4oluIE3hRd7JO5SE7UdAHNvG6I5G+Ho8LkBk
	s1Npp+7lDepLZSIHVjqMHgNMdrBbcj21AsVgiZeBGE05lxyJMNZIu9geX8bEbkn2WY3I
	xyDkqz3a8QdE5t+HWG90sgGvxfYlMPhCh0LX7gJ3oCmEck408OdPzbNne6Ky2noGVYwp
	0q6vUdBO9xPKqJQxLTOP+IDPjDvNbLp1w7ESwHBchgMBPnsoFYsPuU2jKuyQv7Amate/
	/pQxFhNDFMSS7lgH6el7VgddNFnICaFzg0wQb3e8G89dq5IeeTdthmi8nF0oFwStrOUp
	RPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=u/nUGgQi4Wv+gwlnC5ul2Xy2VrsMiTntpsvY5JfzJnA=;
	b=NmMs2lJAGe7zEGVVqgypbr/Hzf5SokM9uHgRusYF9F4WOfR1EhNhW1y1AGveVMX96k
	DWKlrPhOi8DZNEmcB8P+I1R1hjz8er4fHVKinA3EFC86/rznfKY4SVbITLuMsaZtlp66
	UelIgq9NFZveU64nvHdpeBF3gAZX+HmbhAz07PsZ6DQKQKc3ye2nSpyvYrNxUBJ5i/gh
	KSyc14eZZtFGKT/HxxdOGRvXYGakCkDwu5/tuCu/Gq/5RX1I6deiTpXx3DLbBToZzi5F
	VNL1eDXcsiAI2N4P3JFXvipJ0ZWIvEZ5iKYSORwySJrO8RAQ48witJqrAN1bJmyiOFym
	hDUA==
X-Gm-Message-State: APjAAAU2ALNlNpEydMYDzzPpc9S7qT8OhGbbQy1dz02OADZ0zpb2gesY
	FHRmBavyT3P33tojbqKkX0d2gv02X6X4qNKYOZGCSHe6
X-Google-Smtp-Source: APXvYqx1lNqJDkq4HwTs4FmAdaoKfPBjKhaKg7ZDWH8XhJFnPJwyzn6V4WqMAZNcA0Wch6EkxdggRzeD1GtaKAitAMM=
X-Received: by 2002:a67:7987:: with SMTP id u129mr9143636vsc.83.1581425336429; 
	Tue, 11 Feb 2020 04:48:56 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 13:49:27 +0100
Message-ID: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 12:48:56 -0000
Content-Type: multipart/alternative; boundary="0000000000006ab46f059e4c4767"

--0000000000006ab46f059e4c4767
Content-Type: text/plain; charset="UTF-8"

Hello,

I'd like to lay out a few ideas/thoughts on what should be done with sato
(matchbox bits) and X going forward. The inputs are:

- Red Hat is the only company doing X maintenance anymore, and they're
transitioning it to 'hard maintenance mode'
https://blogs.gnome.org/uraeus/2019/06/24/on-the-road-to-fedora-workstation-31/
"Once we are done with this [xwayland gaining missing features] we expect
X.org to go into hard maintenance mode fairly quickly. The reality is that
X.org is basically maintained by us and thus once we stop paying attention
to it there is unlikely to be any major new releases coming out and there
might even be some bitrot setting in over time. We will keep an eye on it
as we will want to ensure X.org stays supportable until the end of the
RHEL8 lifecycle at a minimum, but let this be a friendly notice for
everyone who rely the work we do maintaining the Linux graphics stack, get
onto Wayland, that is where the future is.
"

- matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and does
not have a Wayland compositor. Yocto project does not have the resources to
do the gtk4 port, or add a compositor.

- no 'lightweight Wayland compositor with a desktop/launcher experience"
has emerged in the open source space; I think the only realistic choice at
the moment is the reference compositor Weston which provides a blank
desktop with ability to open terminal windows.

So the way I think things should be going (seeking opinions/inputs of
course):

- oe-core adopts Weston as the 'new sato'; all sato images that currently
pull in matchbox and friends are changed to be Weston-based. Note that
there is no requirement for 3D acceleration; Weston works with plain frame
buffer device. However, both options should be supported and tested. Also,
support for Xwayland should be tested.

- oe-core continues to support and runtime-test X for as long as possible;
for this a new image (say, 'core-image-sato-xorg') is created which will
provide matchbox under X. However, once upstream bitrot sets in, and pain
threshold is exceeded, this will be removed and/or relegated to a legacy
layer.

Thoughts?

Regards,
Alex

--0000000000006ab46f059e4c4767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><di=
v>I&#39;d like to lay out a few ideas/thoughts on what should be done with =
sato (matchbox bits) and X going forward. The inputs are:</div><div><br></d=
iv><div>- Red Hat is the only company doing X maintenance anymore, and they=
&#39;re transitioning it to &#39;hard maintenance mode&#39;</div><div><a hr=
ef=3D"https://blogs.gnome.org/uraeus/2019/06/24/on-the-road-to-fedora-works=
tation-31/">https://blogs.gnome.org/uraeus/2019/06/24/on-the-road-to-fedora=
-workstation-31/</a><br></div><div>&quot;<span style=3D"color:rgb(85,85,85)=
;font-family:&quot;Lucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,Verd=
ana,sans-serif;font-size:13px;background-color:rgb(248,248,240)">Once we ar=
e done with this [xwayland gaining missing features] we expect X.org to go =
into hard maintenance mode fairly quickly. The reality is that X.org is bas=
ically maintained by us and thus once we stop paying attention to it there =
is unlikely to be any major new releases coming out and there might even be=
 some bitrot setting in over time. We will keep an eye on it as we will wan=
t to ensure X.org stays supportable until the end of the RHEL8 lifecycle at=
 a minimum, but let this be a friendly notice for everyone who rely the wor=
k we do maintaining the Linux graphics stack, get onto Wayland, that is whe=
re the future is.</span></div><div><span style=3D"color:rgb(85,85,85);font-=
family:&quot;Lucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,Verdana,sa=
ns-serif;font-size:13px;background-color:rgb(248,248,240)">&quot;</span></d=
iv><div><br></div><div>- matchbox is reliant on gtk3 (to be obsoleted by gt=
k4 this year), and does not have a Wayland compositor. Yocto project does n=
ot have the resources to do the gtk4 port, or add a compositor.</div><div><=
br></div><div>- no &#39;lightweight Wayland compositor with a desktop/launc=
her experience&quot; has emerged in the open source space; I think the only=
 realistic choice at the moment is the reference compositor Weston which pr=
ovides a blank desktop with ability to open terminal windows.</div><div><br=
></div><div>So the way I think things should be going (seeking opinions/inp=
uts of course):</div><div><br></div><div>- oe-core adopts Weston as the &#3=
9;new sato&#39;; all sato images that currently pull in matchbox and friend=
s are changed to be Weston-based. Note that there is no requirement for 3D =
acceleration; Weston works with plain frame buffer device. However, both op=
tions should be supported and tested. Also, support for Xwayland should be =
tested.</div><div><br></div><div>- oe-core continues to support and runtime=
-test X for as long as possible; for this a new image (say, &#39;core-image=
-sato-xorg&#39;) is created which will provide matchbox under X. However, o=
nce upstream bitrot sets in, and pain threshold is exceeded, this will be r=
emoved and/or relegated to a legacy layer.</div><div><br></div><div>Thought=
s?</div><div><br></div><div>Regards,</div><div>Alex<br></div></div></div></=
div>

--0000000000006ab46f059e4c4767--
