Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1B16B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:34:28 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so5228983pde.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=FbrBRjX1qdfvWCM3DIUHsazPYwDHtMKxhQpBpfAzWLI=;
	b=IdIuCZ97XHKayxjHnRopHoHDPs9SPNH1WjY9xu3826zMC5qtbCBXbQzi05/9cFfVB+
	TqPoQ7Z+i87NoCXvgwu+lGrqqdIEGTfvhfgXbfsh3R9kkeD3idtvgbgwcce7qZBnK5yf
	Kx83KkGtZ4Cg4HoWJ6r9Z0lvlxOz0+46nd/uMzWUDI3ywIf7Jbq/ONkMxvHw6wamLOL2
	hAa2s5rWrZjvsW/a28x1chwJS+SV6ml9ay56NJOOtgQO0wQJoDDJwulHSD3ZnEwwCnnB
	c4+2dGUH/cHCHjS2MtPRNMrrYYlYyFLOumuvkSd/HupDb0C4KfbhTtGYYon/KA1ilyJ2
	WSaw==
MIME-Version: 1.0
X-Received: by 10.66.216.129 with SMTP id oq1mr26441280pac.75.1375104869121;
	Mon, 29 Jul 2013 06:34:29 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 06:34:29 -0700 (PDT)
In-Reply-To: <1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Date: Mon, 29 Jul 2013 14:34:29 +0100
X-Google-Sender-Auth: O62lTOWVwvXEnNRziq5V-Z1jydY
Message-ID: <CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQlORm5ZYe4uL9ZIfghpXkxlltq9jir6BFzrQwYLBX7JPnNPyZtExMk6KrMJSx8BdHrOUTNt
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
X-List-Received-Date: Mon, 29 Jul 2013 13:34:28 -0000
Content-Type: multipart/alternative; boundary=047d7b5d954940d27804e2a68d75

--047d7b5d954940d27804e2a68d75
Content-Type: text/plain; charset=ISO-8859-1

No, it should be disabled by default based on the fact most people do not
need this "rfkill" what even upstream has been disabling, and it would be
only enabled for those two utils out of the several thousand out there,
anyhow.

I am just repeating myself as the same is questioned again, again, and
again.

... or you really think that "rfkill" is needed for the majority use cases
out there?


On Mon, Jul 29, 2013 at 2:34 PM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> On 29 July 2013 14:20:05 Laszlo Papp <lpapp@kde.org> wrote:
>
>> Oh, it is actually also in danny. I was looking into the "files"
>> directory,
>> but it is in the other.
>>
>> It is definitely not in denzil though.
>>
>
> Perhaps disable it only in the layer that pulls in these pre-2.6.31 kernel
> headers?
>
> Thanks,
>
>
>>
>> On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> > Only _one_, not two.
>> >
>> >
>> > On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:
>> >
>> >> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
>> >> > I disagree. This change should not have gone in the first place
>> >> > causing the regression for the users. Please be consistent with the
>> >> > history.
>> >>
>> >> If this was a recent change then I would have some (limited) amount of
>> >> sympathy for your position.  But the commit you are complaining about
>> >> has been in the tree for over a year, and it was presumably included in
>> >> at least one if not two of the most recent stable releases.
>> >>
>> >> p.
>> >>
>> >>
>> >>
>> >>
>> >
>>
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>

--047d7b5d954940d27804e2a68d75
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, it should be disabled by default based on the fact mos=
t people do not need this &quot;rfkill&quot; what even upstream has been di=
sabling, and it would be only enabled for those two utils out of the severa=
l thousand out there, anyhow.<div>
<br></div><div>I am just repeating myself as the same is questioned again, =
again, and again.</div><div><br></div><div>... or you really think that &qu=
ot;rfkill&quot; is needed for the majority use cases out there?</div></div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Jul 2=
9, 2013 at 2:34 PM, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 14:20:05 L=
aszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde=
.org</a>&gt; wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Oh, it is actually also in danny. I was looking into the &quot;files&quot; =
directory,<br>
but it is in the other.<br>
<br>
It is definitely not in denzil though.<br>
</blockquote>
<br></div>
Perhaps disable it only in the layer that pulls in these pre-2.6.31 kernel =
headers?<br>
<br>
Thanks,<div class=3D"im"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kd=
e.org" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>
<br>
&gt; Only _one_, not two.<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell &lt;<a href=3D"mailto:=
pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:<br>
&gt;&gt; &gt; I disagree. This change should not have gone in the first pla=
ce<br>
&gt;&gt; &gt; causing the regression for the users. Please be consistent wi=
th the<br>
&gt;&gt; &gt; history.<br>
&gt;&gt;<br>
&gt;&gt; If this was a recent change then I would have some (limited) amoun=
t of<br>
&gt;&gt; sympathy for your position. =A0But the commit you are complaining =
about<br>
&gt;&gt; has been in the tree for over a year, and it was presumably includ=
ed in<br>
&gt;&gt; at least one if not two of the most recent stable releases.<br>
&gt;&gt;<br>
&gt;&gt; p.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</blockquote>
<br>
<br></div>
Sent with AquaMail for Android<br>
<a href=3D"http://www.aqua-mail.com" target=3D"_blank">http://www.aqua-mail=
.com</a><br>
<br>
<br>
</blockquote></div><br></div>

--047d7b5d954940d27804e2a68d75--
