Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7333371A51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 21:17:33 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n204so96846249qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AoPoVUUI6iNZm0GtsOHbqK3P2+DOmpITNBFt2YaYT2g=;
	b=K+8f1FvA/ZD6p1fWCginJP7UXwhTLyYi3XjfyLH6cPi1QUFOgf6eFYLiogC674dUFa
	VYsgtQtid4+bZyHxQPHGTWAD77bSwJMC4/nFmhrdiZRAeABMtc0OtLglaHSry3dHS245
	wVKTPDLtdlqmmZjvynO7fc1BWsAAX6pvFpoedjuQ3lzW6vcr5lKPesPRvamojTCrD2mn
	fEIcdOzcRH9Lo9+pt1QLu/973YmVFIBS+6ovGLC0euge8TVBGWOcYHP5/QZDBod+Y7+0
	uLo4hAhZhwXBG8WcLiwIHoGVfNU/G0aK7nmbAitkN+DVx9e8R+thF2a7YtAHJA8hJzit
	0H+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AoPoVUUI6iNZm0GtsOHbqK3P2+DOmpITNBFt2YaYT2g=;
	b=Vpfk3xjB0SAtiUmmwD95gAVhg5Z9mKmgscR+gzhJE13txJy62lU9Yp+S8OrdvlaoP1
	jKAXIbEyvNSXhYhYCXAstlM49v+s30TxBw7p2QONB+kuNsJ9duG2Te6EW+dnUte4fne5
	bc/MlQ3cgFQzjLZezErJDN1cl5gEEavKXo7XNPP8/pisow9PqSHxExsrdGp11q0rWGl+
	23+WjZuNqycloeLWFF8u/PlDCNjGdFATBpeQn/obiPRe8+8HpoA/62BYgPnhvIPyBFPc
	xqqGxD3tp+fj7dH27lZfG9c7XW90Sc/KCbIdmC0rj7s8kpH4uY/YaZaMA5V+SkgjXbFM
	6r6g==
X-Gm-Message-State: AKaTC03SONfT5Lw7BVEoe45QyaSimlXiir46i+Kb45CGX73O5LF/kGZitVvn4FTHzbs0RWFrDX8wj451YhTMZTOQ
X-Received: by 10.55.75.17 with SMTP id y17mr72980472qka.26.1481577454850;
	Mon, 12 Dec 2016 13:17:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 13:17:14 -0800 (PST)
In-Reply-To: <3629007.TMJVuC0a6H@tal>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
	<FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
	<3629007.TMJVuC0a6H@tal>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 21:17:14 +0000
Message-ID: <CAJTo0Lb0SgZH9LQyqwdXm858XTk6RQD0HTGBnZ1g-sXoy_HbjQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Mon, 12 Dec 2016 21:17:35 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8e777c205437ca1f4

--001a114a88c8e777c205437ca1f4
Content-Type: text/plain; charset=UTF-8

On 12 December 2016 at 20:51, Mark Asselstine <mark.asselstine@windriver.com
> wrote:

> I think the discussion I pointed to in the commit log closes the door on
> any
> such change. Specific the comment from Lennart --
> https://github.com/systemd/systemd/issues/3810#issuecomment-235290526
>
> They don't want the library to be found in the default search path, they
> want
> to maintain this as a "hidden, internal resource".
>

Oh if it's an implementation detail of systemd and not a user-facing
library then I can see their argument I guess.

Don't agree with it though.  But, the point is that as long as the parts of
systemd that could realistically be multilibd are in $libdir then this
isn't a problem.

Ross

--001a114a88c8e777c205437ca1f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 20:51, Mark Asselstine <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":2y2" class=3D"a3s aXjCH m158f4cdff0c2f642">I think the discussion I=
 pointed to in the commit log closes the door on any<br>
such change. Specific the comment from Lennart --<br>
<a href=3D"https://github.com/systemd/systemd/issues/3810#issuecomment-2352=
90526" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/<wbr=
>systemd/issues/3810#<wbr>issuecomment-235290526</a><br>
<br>
They don&#39;t want the library to be found in the default search path, the=
y want<br>
to maintain this as a &quot;hidden, internal resource&quot;.</div></blockqu=
ote></div><br>Oh if it&#39;s an implementation detail of systemd and not a =
user-facing library then I can see their argument I guess.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Don&#39;t agree with =
it though.=C2=A0 But, the point is that as long as the parts of systemd tha=
t could realistically be multilibd are in $libdir then this isn&#39;t a pro=
blem.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a114a88c8e777c205437ca1f4--
