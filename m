Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 13DEA6B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 16:02:15 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so441346pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=3Cv8ELNGLsoYkkk3+nh83IB/4mTWajIDhV9zlEimF0Q=;
	b=md4M5oqMQVLYns5yt32zMXdPSoLyV6tEUnH4VeWC6fS4TaOkVqmLTGLp5dR5YXJ9cW
	VCKmpi7NmArnTvxR/0/fEwjYik/ldPIa/Gmd8cBr5W/xmDSsTnZ/mi6q/j1bt+jkh4l2
	Z/UcEwHjtGXOqM9dipZQMT5MLZoJ48Eu1xw8dKA3/tGJADddSXtFWzQ7J8zoN6IjCwix
	vmxz59U8WtfpaWaUJ5w/bJji0+WrzbqRFzbGMsLN1V4Bf4nJ+pu0A8e8V1hF6t8KmMMz
	INPdEoqm9NBOzwSdygce8ja9zceHUhOYtMO8b2XdWIbo8DWc/9OHhFhp40PodO4hMv3Z
	750A==
MIME-Version: 1.0
X-Received: by 10.68.223.225 with SMTP id qx1mr74034145pbc.157.1375199721062; 
	Tue, 30 Jul 2013 08:55:21 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 30 Jul 2013 08:55:20 -0700 (PDT)
In-Reply-To: <1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
	<1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Date: Tue, 30 Jul 2013 16:55:20 +0100
X-Google-Sender-Auth: J84ceRurRTkMW7kLA_fkKp8bdCA
Message-ID: <CAOMwXhPw4K+T82qs21UzFFT+-eCYz9vBRVfUNGs5smmHCTP=VQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQmRduNf2tYfXvxleEAIvEvQCA/bvJPl9mCrRCetYa+eXUteaGhnwv+NV1HLEmz8LjJR9zcB
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 30 Jul 2013 16:02:15 -0000
Content-Type: multipart/alternative; boundary=047d7b160515de955604e2bca2e8

--047d7b160515de955604e2bca2e8
Content-Type: text/plain; charset=ISO-8859-1

One person not using the latest toolchains?

At any rate, can someone provide a helper change from the past for
PACKAGEGROUP like changes?


On Mon, Jul 29, 2013 at 4:42 PM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> On 29 July 2013 15:34:29 Laszlo Papp <lpapp@kde.org> wrote:
>
>> No, it should be disabled by default based on the fact most people do not
>> need this "rfkill" what even upstream has been disabling, and it would be
>> only enabled for those two utils out of the several thousand out there,
>> anyhow.
>>
>
> It was disabled just because of one guy known to notoriously use outdated
> toolchains on recent packages. But OK, I'm out of this whole discussion.
>
> Cheers,
>
>
>> I am just repeating myself as the same is questioned again, again, and
>> again.
>>
>> ... or you really think that "rfkill" is needed for the majority use cases
>> out there?
>>
>>
>> On Mon, Jul 29, 2013 at 2:34 PM, Bernhard Reutner-Fischer <
>> rep.dot.nop@gmail.com> wrote:
>>
>> > On 29 July 2013 14:20:05 Laszlo Papp <lpapp@kde.org> wrote:
>> >
>> >> Oh, it is actually also in danny. I was looking into the "files"
>> >> directory,
>> >> but it is in the other.
>> >>
>> >> It is definitely not in denzil though.
>> >>
>> >
>> > Perhaps disable it only in the layer that pulls in these pre-2.6.31
>> kernel
>> > headers?
>> >
>> > Thanks,
>> >
>> >
>> >>
>> >> On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> >>
>> >> > Only _one_, not two.
>> >> >
>> >> >
>> >> > On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:
>> >> >
>> >> >> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
>> >> >> > I disagree. This change should not have gone in the first place
>> >> >> > causing the regression for the users. Please be consistent with
>> the
>> >> >> > history.
>> >> >>
>> >> >> If this was a recent change then I would have some (limited) amount
>> of
>> >> >> sympathy for your position.  But the commit you are complaining
>> about
>> >> >> has been in the tree for over a year, and it was presumably
>> included in
>> >> >> at least one if not two of the most recent stable releases.
>> >> >>
>> >> >> p.
>> >> >>
>> >> >>
>> >> >>
>> >> >>
>> >> >
>> >>
>> >
>> >
>> > Sent with AquaMail for Android
>> > http://www.aqua-mail.com
>> >
>> >
>> >
>>
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>

--047d7b160515de955604e2bca2e8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">One person not using the latest toolchains?</span><br><div><span style=3D=
"font-family:arial,sans-serif;font-size:13px"><br></span></div><div><span s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">At any rate, can someo=
ne provide a helper change from the past for PACKAGEGROUP like changes?</sp=
an></div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Jul 29, 2013 at 4:42 PM, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 15:34:29 L=
aszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde=
.org</a>&gt; wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
No, it should be disabled by default based on the fact most people do not<b=
r>
need this &quot;rfkill&quot; what even upstream has been disabling, and it =
would be<br>
only enabled for those two utils out of the several thousand out there,<br>
anyhow.<br>
</blockquote>
<br></div>
It was disabled just because of one guy known to notoriously use outdated t=
oolchains on recent packages. But OK, I&#39;m out of this whole discussion.=
<br>
<br>
Cheers,<div class=3D"HOEnZb"><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I am just repeating myself as the same is questioned again, again, and<br>
again.<br>
<br>
... or you really think that &quot;rfkill&quot; is needed for the majority =
use cases<br>
out there?<br>
<br>
<br>
On Mon, Jul 29, 2013 at 2:34 PM, Bernhard Reutner-Fischer &lt;<br>
<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmai=
l.com</a>&gt; wrote:<br>
<br>
&gt; On 29 July 2013 14:20:05 Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.o=
rg" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Oh, it is actually also in danny. I was looking into the &quot;fil=
es&quot;<br>
&gt;&gt; directory,<br>
&gt;&gt; but it is in the other.<br>
&gt;&gt;<br>
&gt;&gt; It is definitely not in denzil though.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Perhaps disable it only in the layer that pulls in these pre-2.6.31 ke=
rnel<br>
&gt; headers?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp &lt;<a href=3D"mailto=
:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Only _one_, not two.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell &lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:<br>
&gt;&gt; &gt;&gt; &gt; I disagree. This change should not have gone in the =
first place<br>
&gt;&gt; &gt;&gt; &gt; causing the regression for the users. Please be cons=
istent with the<br>
&gt;&gt; &gt;&gt; &gt; history.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If this was a recent change then I would have some (limit=
ed) amount of<br>
&gt;&gt; &gt;&gt; sympathy for your position. =A0But the commit you are com=
plaining about<br>
&gt;&gt; &gt;&gt; has been in the tree for over a year, and it was presumab=
ly included in<br>
&gt;&gt; &gt;&gt; at least one if not two of the most recent stable release=
s.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; p.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; Sent with AquaMail for Android<br>
&gt; <a href=3D"http://www.aqua-mail.com" target=3D"_blank">http://www.aqua=
-mail.com</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote>
<br>
<br>
Sent with AquaMail for Android<br>
<a href=3D"http://www.aqua-mail.com" target=3D"_blank">http://www.aqua-mail=
.com</a><br>
<br>
<br>
</div></div></blockquote></div><br></div>

--047d7b160515de955604e2bca2e8--
