Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEC574BBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 19:56:57 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b16-v6so11902249oic.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LlxAlMhXZpgbsz9jN3o0zL/4/nqwni2up9ovlcIu6Kc=;
	b=cCyOt6+7vDnaEqD6IAgkfq9pEFgtvQjb8ocp2GFny4kuRHscGk1EI4VSmrvp4uSpVU
	aiaKo8dFyYpcBmu6GqBRptfoKf6FzJIYfA7tEW1R6JKGzD8f7syQVcNSLYgqc+X+l4bn
	nR1Pd5CovW2eoLpHDFoeVoZ2L5zcrCnZFBBiptxNGpBHM8x0lnKrNhhp27Kh4Q5VbngE
	ufuFmhfTVDAfPSo3B9ixu3H/bDTdVDBzBejAeglb+lztdBQp/HhAbfRtg5SCXfDbWETE
	pZXZXlzeOGNeDJ73K6IwAoKrRBYCml5WahForeA9cTIJ26AvADtLQoL7l4zg3W9CaxjJ
	6RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LlxAlMhXZpgbsz9jN3o0zL/4/nqwni2up9ovlcIu6Kc=;
	b=r9KKhRKLbO2IA2tDkVeHMCkZEEQpfTLoeQ/BmAK044UHUlJSprrjjhhR4qYmYOt8xV
	lKQPNm18hcYp3JKFd6PSj/y75kHtZ1tPF4uDL/iW+Pdua2wJl4eb8y1nKr/xDIyRas/B
	IRytN/t9sUBbqFnmxUWJzGLR4xcsaI3RtG00w63u8JqMLQCwEY2T/5GTtmfB5knElgIp
	A6rqTb8fWofjO9WyNkUahEZGmHK3Xgr8wW/c6K046D/qzkbmMPRR8eSoLYNqgCJBHM6g
	Fm2KulEsb96z2IjcbxueOtcD8Df3dOkVkkibOLlUHf6eleTuVd73XGSBtAMSwlWO/oYf
	8cug==
X-Gm-Message-State: AOUpUlEEcW/5ve7e2oREO5ld9evA5y2boijW1+AqEzlxvtxVsaMTzt9W
	aNc3YnVd2kBqNlfZXspacs6vno3nD0Yt1xAe3G0=
X-Google-Smtp-Source: AA+uWPwvDOHeMqjerNKvHWGC4Kv5m8lW3sfOIa5mW6KfVhd/F0rWPXGKcEL66G150wyrgywcOm373ggMaHyDjMmoVkQ=
X-Received: by 2002:aca:c40e:: with SMTP id
	u14-v6mr3319400oif.288.1533844618181; 
	Thu, 09 Aug 2018 12:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
	<CA+chaQc0jpZx+43G-1SGQuahPksikGQteo4c=c9dDTsspBQM9w@mail.gmail.com>
	<CALbNGRRpOXtZXgnJWAx2Ut5V3TM_LZx6LYokqOfzhW_G5vX3Ew@mail.gmail.com>
In-Reply-To: <CALbNGRRpOXtZXgnJWAx2Ut5V3TM_LZx6LYokqOfzhW_G5vX3Ew@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 10 Aug 2018 07:56:46 +1200
Message-ID: <CADySD0HR+pdE8GipDH72Mo6ZD0OBiRz--ub1NwG2ranWgr0S5A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to upgrade Qt modules in daisy branch
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
X-List-Received-Date: Thu, 09 Aug 2018 19:56:57 -0000
Content-Type: multipart/alternative; boundary="0000000000009b81d905730607c0"

--0000000000009b81d905730607c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Andreas, Martin and Alex for your responses.

I will follow your leads and hopefully will be able to do it.

Regards
Ankur

On Fri 10 Aug, 2018, 4:16 AM Andreas M=C3=BCller, <schnitzeltony@gmail.com>
wrote:

> On Thu, Aug 9, 2018 at 2:40 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > For daisy you probably don't have support for PACKAGECONFIG_CONFARGS
> which
> > was added in Yocto 2.1 krogoth.
> >
> I remember doing similar for other reasons. We have images based on
> jethro (ok - daisy is a bit older) with later Qt's. Our builds are
> based on [1] but I created branches up to Qt5.9 (stable release - but
> not updated to latest) [2] for jethro.
>
> It's not daisy - not Qt5.11 - no guarantees - but maybe a start.
>
> [1] https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.7
> [2] https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.9
>
> Andreas
>

--0000000000009b81d905730607c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thank you Andreas, Martin and Alex for your response=
s.<br><br>I will follow your leads and hopefully will be able to do it.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"au=
to">Ankur</div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto=
"><div dir=3D"ltr">On Fri 10 Aug, 2018, 4:16 AM Andreas M=C3=BCller, &lt;<a=
 href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Thu, Aug 9, 2018 at 2:40 PM=
, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; For daisy you probably don&#39;t have support for PACKAGECONFIG_CONFAR=
GS which<br>
&gt; was added in Yocto 2.1 krogoth.<br>
&gt;<br>
I remember doing similar for other reasons. We have images based on<br>
jethro (ok - daisy is a bit older) with later Qt&#39;s. Our builds are<br>
based on [1] but I created branches up to Qt5.9 (stable release - but<br>
not updated to latest) [2] for jethro.<br>
<br>
It&#39;s not daisy - not Qt5.11 - no guarantees - but maybe a start.<br>
<br>
[1] <a href=3D"https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.7" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/schnitzel=
tony/meta-qt5/tree/jethro+5.7</a><br>
[2] <a href=3D"https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.9" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/schnitzel=
tony/meta-qt5/tree/jethro+5.9</a><br>
<br>
Andreas<br>
</blockquote></div></div></div>

--0000000000009b81d905730607c0--
