Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 81FF460720
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:16:54 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so89629108qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gU71P/QaxEjxyspJFK82JVKsdS/a3ozYQjQzBhFQs3k=;
	b=0JTF1h0SYY66dnYMaS0QSrqx3LNRaMQG8k2b2g/20Vg23gSsj88iewIEEY1hghCoNM
	fHXdRtcB84IHJkdI7wRUH9pZKLeRd8PaQvuJYW9nPpS6E/agx9EB5aaT0kS3eW9PUqxu
	HOLENK+7ACJhRoMXfBlVfL5lDg5TSHT75q4r5bSPOVEP23pieL7EEOvkDdETs0kzSK4R
	ZhY6KihQca3OEDnPl2XubkrqwpwRxj2NsTYT75kpz+tYgBit46MRkkm0Irz6CJVIELOk
	+JQXW51mrwomUKnCwveUKEIxpBaPbxGrNrTqh9+15IBNHOBbtemT9D2+XRgqRf7NQ/W/
	CoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gU71P/QaxEjxyspJFK82JVKsdS/a3ozYQjQzBhFQs3k=;
	b=UDuDsMTauI/N1bdxoIaTtp4eCKSLCZlpm8UXLSu/dxXqNctQKsLBmQFr6mHdJ7+7LX
	qr//w51UbdQFFCEnM+O1S/hlX51+2TyQgG7yOqHrCtvS2i27hgACPOd41QyrewF6Z0zm
	DYz7t3omvhwp3wUgvcldXS8AHJ7W52GHQdFgSV+MUvZpn6bMiwiqj1wAKOQ5F71j2LCh
	e1PZ4/WQWWpVcpjK4B4VigFN9J7PFPtUSdBG7dOy60eQUtPxg1mnqP9QW9ZAAnDYHNs0
	SrNNTEDWpREMa9B0U7oneCXNwqDdLMRcs0ummYGuPt2bueYSdS73RXFz/sMQwR3l7EnX
	Mc/Q==
X-Gm-Message-State: ABUngvfGV7FH/pMxhD4ck5qLrACXSou8FuLaaqP1GeyCgKuBbn3+TZYI+9IVCOZ8hLyYYx0GyT0bcO6E6mjJ6YQz
X-Received: by 10.55.39.88 with SMTP id n85mr15070112qkn.244.1479118615608;
	Mon, 14 Nov 2016 02:16:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 02:16:35 -0800 (PST)
In-Reply-To: <CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 10:16:35 +0000
Message-ID: <CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 10:16:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16aa1337054140233d

--94eb2c094b16aa1337054140233d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 November 2016 at 10:02, Maciej Borz=C4=99cki <maciej.borzecki@rndity.=
com>
wrote:

> I see that the builds were running with qemux85-64 MACHINE, shouldn't
> TARGET_ARCH be set to x86-64 then? There's a check that builds
> syslinux(-native) for x86 archs only since it's not buildable for
> anything else. Same for HDDIMG.
>

Not quite:

$ MACHINE=3Dqemux86 bitbake core-image-minimal -e | grep ^TARGET_ARCH=3D
TARGET_ARCH=3D"i586"

$ MACHINE=3Dqemux86-64 bitbake core-image-minimal -e | grep ^TARGET_ARCH=3D
TARGET_ARCH=3D"x86_64"

(had to patch bitbake.conf to export TARGET_ARCH)


> One more question, the assert raised when comparing parted's output is
> caused by different locale. Do you think it would be ok to just enforce
> LC_ALL=3DC when running commands under wic?
>

Yes, enforcing a  locale is essential when comparing output of commands.
Bitbake switches to en_US.UTF8 on startup for the same reason, so feel free
to use that or C.

Ross

--94eb2c094b16aa1337054140233d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 10:02, Maciej Borz=C4=99cki <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzec=
ki@rndity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1=
8u" class=3D"gmail-a3s gmail-aXjCH gmail-m158624a7f32db916">I see that the =
builds were running with qemux85-64 MACHINE, shouldn&#39;t<br>
TARGET_ARCH be set to x86-64 then? There&#39;s a check that builds<br>
syslinux(-native) for x86 archs only since it&#39;s not buildable for<br>
anything else. Same for HDDIMG.<br></div></blockquote><div><br></div><div>N=
ot quite:</div><div><br></div><div>$ MACHINE=3Dqemux86 bitbake core-image-m=
inimal -e | grep ^TARGET_ARCH=3D</div><div>TARGET_ARCH=3D&quot;i586&quot;<b=
r></div><div><br></div><div>$ MACHINE=3Dqemux86-64 bitbake core-image-minim=
al -e | grep ^TARGET_ARCH=3D<br></div><div>TARGET_ARCH=3D&quot;x86_64&quot;=
</div><div><br></div><div>(had to patch bitbake.conf to export TARGET_ARCH)=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D"gmail-:18u" class=3D"gma=
il-a3s gmail-aXjCH gmail-m158624a7f32db916">One more question, the assert r=
aised when comparing parted&#39;s output is<br>
caused by different locale. Do you think it would be ok to just enforce<br>
LC_ALL=3DC when running commands under wic?</div></blockquote></div><br>Yes=
, enforcing a =C2=A0locale is essential when comparing output of commands.=
=C2=A0 Bitbake switches to en_US.UTF8 on startup for the same reason, so fe=
el free to use that or C.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--94eb2c094b16aa1337054140233d--
