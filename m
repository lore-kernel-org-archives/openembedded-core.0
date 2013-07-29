Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id ED30E60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:30:37 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so767057pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=C37SpwL46E5AliqPIHg8OWvK4jFwkEdTeuzty5ijjH8=;
	b=DYHO8t+dQoE8o8jPvJXaywsOWCw/mXXHJj70vwtWKKs3RhVqijA/NS/ThPNq9d+NtR
	NdJq+6rh8WN/EDHd5ilITArDw8faacE1DX+ow7DPY1ko2bHgqT29V530mFXwEm9ZzX/S
	pKzSRD8gCeaix7XjZBQK1sshhI4BWG4bNaHt565zOrUxBry45SM6e6fRLWdaQmK7T0yq
	J7zsbgIePFHqaoes9Gks7FLiXp3hYT7x5PkbPqlC8E8ZhiOSWSMExA919VtxXestDkjL
	Pb1FwNslxr9tKVI6s9qVAqBTScyl5ytS7j9uTQLAwW1vp1q9h7A6RzYGiM22eFv6Vzq/
	D9sg==
MIME-Version: 1.0
X-Received: by 10.68.224.161 with SMTP id rd1mr67333187pbc.121.1375093838600; 
	Mon, 29 Jul 2013 03:30:38 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:30:38 -0700 (PDT)
In-Reply-To: <CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
Date: Mon, 29 Jul 2013 11:30:38 +0100
X-Google-Sender-Auth: weXtJghcS5ehtth4u0LlbM9ywPw
Message-ID: <CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkvjXVOlp+XV5Jl/efe8GTWBnOjIb8RjZzy9k2DBP69AaDLccZj/X/EMQ3IHeeqlIga8mSq
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
X-List-Received-Date: Mon, 29 Jul 2013 10:30:38 -0000
Content-Type: multipart/alternative; boundary=e89a8ff24ff6c86f4b04e2a3fb3a

--e89a8ff24ff6c86f4b04e2a3fb3a
Content-Type: text/plain; charset=ISO-8859-1

Not to mention, there is a huge difference between build time regression
and run time, so I disagree.

a)-c) can just as well be done after this change with the same loss. Do not
blame me for introducing build (!) regressions, and then you have got a
situation like this. If you feel it serious, write a change on top of mine.


On Mon, Jul 29, 2013 at 11:22 AM, Laszlo Papp <lpapp@kde.org> wrote:

> I disagree. This change should not have gone in the first place causing
> the regression for the users. Please be consistent with the history.
>
>
> On Mon, Jul 29, 2013 at 11:20 AM, Phil Blundell <pb@pbcl.net> wrote:
>
>> On Mon, 2013-07-29 at 11:01 +0100, Laszlo Papp wrote:
>> > No, that was intentional. That is why the change has been updated.
>> >
>> >
>> > I can update the commit message if that is what you wish?
>>
>> As a general rule yes, please always make sure that the commit message
>> describes what the patch is actually doing.
>>
>> But in this particular case, your new patch seems to have more serious
>> problems since it will cause rfkill to silently disappear for many
>> people who do currently have it.
>>
>> If your distro selects a toolchain which doesn't contain the necessary
>> bits to support rfkill then it seems as though the appropriate course of
>> action would be to either:
>>
>> a) patch rfkill so that it does build with your headers; or
>>
>> b) introduce a PACKAGECONFIG option for busybox to turn off rfkill even
>> if it would naturally default to on, and set this in your distro
>> configuration; or
>>
>> c) just add your own .bbappend for busybox to do what you want.
>>
>> p.
>>
>>
>>
>>
>

--e89a8ff24ff6c86f4b04e2a3fb3a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not to mention, there is a huge difference between build t=
ime regression and run time, so I disagree.<div><br></div><div>a)-c) can ju=
st as well be done after this change with the same loss. Do not blame me fo=
r introducing build (!) regressions, and then you have got a situation like=
 this. If you feel it serious, write a change on top of mine.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Jul 29, 2013 at 11:22 AM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">I disagree. This change should not have gone in the first =
place causing the regression for the users. Please be consistent with the h=
istory.</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_ex=
tra">
<br><br><div class=3D"gmail_quote">On Mon, Jul 29, 2013 at 11:20 AM, Phil B=
lundell <span dir=3D"ltr">&lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_bla=
nk">pb@pbcl.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Mon, 2013-07-29 at 11:01 +0100, Lasz=
lo Papp wrote:<br>
&gt; No, that was intentional. That is why the change has been updated.<br>
&gt;<br>
&gt;<br>
&gt; I can update the commit message if that is what you wish?<br>
<br>
</div>As a general rule yes, please always make sure that the commit messag=
e<br>
describes what the patch is actually doing.<br>
<br>
But in this particular case, your new patch seems to have more serious<br>
problems since it will cause rfkill to silently disappear for many<br>
people who do currently have it.<br>
<br>
If your distro selects a toolchain which doesn&#39;t contain the necessary<=
br>
bits to support rfkill then it seems as though the appropriate course of<br=
>
action would be to either:<br>
<br>
a) patch rfkill so that it does build with your headers; or<br>
<br>
b) introduce a PACKAGECONFIG option for busybox to turn off rfkill even<br>
if it would naturally default to on, and set this in your distro<br>
configuration; or<br>
<br>
c) just add your own .bbappend for busybox to do what you want.<br>
<span><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--e89a8ff24ff6c86f4b04e2a3fb3a--
