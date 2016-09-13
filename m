Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id A5DC8771C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 13:04:44 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id q188so264655926oia.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ptkl+I2a8bMJV9o9jwZhZ0ohxN0Hqc7Hg39E6z8S+SE=;
	b=0967dQbbTkGgNC+KN3Vr4KJANomQvlP3TDWxaEf/REV771ObVRoqTgzuKq6O60wIWA
	kR1wKvH0iyObRUasjpewWwnXrgsp9ziG0FqOzkv7EJCAtmvrFS/oFxCwYtWW2RK5i6Ig
	TaDtWoe9XotB3q/aIwFYko+FElX8/OEWQimY3LfbIlZWvjksxHvea/f4HwUzeFQWp8QC
	dSQ/mdpp74Y+pW5cnA6RCmuTB20NHYJE5CbowlnumYCQonpI4IOc2XMvRkABAU43g2oF
	deIm66IqLauu4OlJkIbYAHCKryOU3IVz7tC/e8B9YDn+zPo+MNZhHp9n/MgvpqywhvyB
	zpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ptkl+I2a8bMJV9o9jwZhZ0ohxN0Hqc7Hg39E6z8S+SE=;
	b=NykwuwK0m3sThEygHaQTY9SU/O1YzM0wgMrljQp1d3riiG0lB2IktJtAlJUqbXW8Oi
	2d8fnYDhMw1QrCIC6KuDj+vwYjkE1n38AbuCcRwCzFHkRQr1IuDFNHJp4DqR2nHSOV+I
	C8FU72Cqt7sG9hHxK8/Ri5UGLLTYMzviVRrQDm14KXJZXpRX4CFFYNkDODCuMbhw1lYY
	t+k75O4qBkvRZWVMALvI7a4k8ikdOeJbRtovNdlWUe0GUYCuIDr1v+mzq9LeFCWHY1cR
	2evhN3FRRU7feGBtYAszdoJ7zuzSnuyaowsyIo7Kyf2A0kJDxG3HYC8fJpOyw/iKDUAt
	7EDw==
X-Gm-Message-State: AE9vXwMbzVQ5KMZPkRgPTg+S5xniQkYG2e73hlhAiJRD9+dLTYrHrJPvNagn1JR8qPG/t4ISzIAxv6iBLO/9Wm2B
X-Received: by 10.202.4.137 with SMTP id 131mr6716992oie.128.1473771885491;
	Tue, 13 Sep 2016 06:04:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 13 Sep 2016 06:04:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZm=X0c9t-cP2vLeUrvVRK=U1DaNYq1MCDomTgiYVFyqg@mail.gmail.com>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
	<20160911193712.GA6859@jama>
	<CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
	<CA+chaQfeWvse-+vAb87m1A2BKVuii4SKEquZtDq-3WWFF9AKBA@mail.gmail.com>
	<CAJTo0LZm=X0c9t-cP2vLeUrvVRK=U1DaNYq1MCDomTgiYVFyqg@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 13 Sep 2016 16:04:15 +0300
Message-ID: <CAHiDW_H5mYg6QVY7L2ABnGms0LsfXth7K0ykcJN2Jp5mQWhQNQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Tue, 13 Sep 2016 13:04:47 -0000
Content-Type: multipart/alternative; boundary=001a11c03516b70a22053c6341c3

--001a11c03516b70a22053c6341c3
Content-Type: text/plain; charset=UTF-8

On 12 September 2016 at 20:43, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 11 September 2016 at 23:37, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Default qemux86 as shown in:
>> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20
>> 160910_205641.log
>>
>
> Yeah I can replicate this, must be a 32-bit x86 thing, or something.
> Annoying.
>


The good news: Upstream just fixed this today.
The bad news: The fix is a 7000 line asm patch.



It's a revert to some earlier code so not _quite_ that scary... but we
don't have ptests for gnutls and reviewing that patch is plain impossible.
I guess I'll do some manual tests and send the patch in any case?


- Jussi

--001a11c03516b70a22053c6341c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 September 2016 at 20:43, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On 11 Sep=
tember 2016 at 23:37, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Default qemu=
x86 as shown in:<div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/log.report.20160910_205641.log" target=3D"_blank">http://logs.nslu2-lin=
ux.org/bu<wbr>ildlogs/oe/world/log.report.20<wbr>160910_205641.log<br></a><=
/div></div></blockquote><div><br></div></span><div>Yeah I can replicate thi=
s, must be a 32-bit x86 thing, or something.=C2=A0 Annoying.</div></div></d=
iv></div></blockquote><div><br></div><div><br></div><div>The good news: Ups=
tream just fixed this today.</div><div>The bad news: The fix is a 7000 line=
 asm patch. =C2=A0</div><div><br></div><div><br></div><div><br></div><div>I=
t&#39;s a revert to some earlier code so not _quite_ that scary... but we d=
on&#39;t have ptests for gnutls and reviewing that patch is plain impossibl=
e. I guess I&#39;ll do some manual tests and send the patch in any case?</d=
iv><div><br></div><div><br></div><div>- Jussi</div><div><br></div></div></d=
iv></div>

--001a11c03516b70a22053c6341c3--
