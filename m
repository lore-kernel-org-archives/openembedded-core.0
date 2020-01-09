Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id B751E7FE48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:36:07 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id u14so5223341vsu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7pqhvD3Fy6XeHeVDGLWN37BYSzowkqdRK+tuTuPP2us=;
	b=pakU2PWB73Ezk272rxMCdtHDAEieszwmFSMJvGi+k76CncW98PzsK7M74Ud/yHoFiG
	ZqJ2vt1BiS2g1E/PFVfAGrDXnPD4lSpdRnOOkwFl169qib59+aj7g48vturnAU4qAa36
	fH4aBfLGY5I3JNr6jxVs1Tq3O+t9HynYp+G2mkSnBa7Gj1wsCOdw0LJzsLoK3Fz7XnoB
	CwWTR0x6xN4eXslcVaPuv9lkKiPCEeG3QTSJlobRWn41SJCASe4CPm41JJUCV4QscYiq
	xWWtZ8Brab709iKf4NSTVxX0PuiGzOcCmnAjrzMB3xEbEbdj2r8sOFbdZQb6I09+hcrc
	Izvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7pqhvD3Fy6XeHeVDGLWN37BYSzowkqdRK+tuTuPP2us=;
	b=VmAaZOiQ0aHBqbkNvPXDjrgdLNg37o2ZIbjE1WlEYwZjbd/8MEbvQm3l+h5H6hsV/g
	MWqq3e4QILGKBdKwyvoydU2/SXDAPIwr9nniWsOgvunLtZjs4Rfr7o7KLHEEZDqcqVp3
	Qh1M/nDlINKFRJU94zOM/BPJ24S9BaYVqLVpnJqLzcmlw9VqdOsgOkttHF5SRgku83HE
	Uw9tN7GrxXvYVVjbzrUfmsE4hN3th/X3BPQMjbCpLELCRlYgk/8frsEy1/9XT4FcSoD4
	p+Z31c0/KlKie7jqN3q5vvrf20FLjlXHFxCKPyil3UguY0IsvAq5310tYQ8AVvJm6UTD
	TtYA==
X-Gm-Message-State: APjAAAXVbx17pupr8VOqqaypXkxeNhsNN4d9JVs5m1cyS6M4m+8yhpLx
	o2lGLIFN+xJ74Kef19nczYsarBZyoOt19wygutQ=
X-Google-Smtp-Source: APXvYqyETl4I9mKyP90B2wYVsWwKgLo89prrx/iIDOPdCWJTgJfeRAjPf0c8qdqgYM8nLAtdhLfdxKvcNPXeH+SDcLI=
X-Received: by 2002:a67:3187:: with SMTP id x129mr7687340vsx.23.1578605768464; 
	Thu, 09 Jan 2020 13:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-2-schnitzeltony@gmail.com>
	<CANNYZj_ZS77tDpmBO-_AaYb6KYEQTi-B=AV8snywaOa-KrPLVA@mail.gmail.com>
	<CALbNGRSMELu18v7UyqHiaYQGkFqcsdP+Hx_HS1FbqMSzvua2dQ@mail.gmail.com>
In-Reply-To: <CALbNGRSMELu18v7UyqHiaYQGkFqcsdP+Hx_HS1FbqMSzvua2dQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 22:35:57 +0100
Message-ID: <CANNYZj_UYwaUGD0pj+5WK3vVMMa3tv8eRqhcwbFP0fOOhtH4ZQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] itstool: add from meta-oe
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
X-List-Received-Date: Thu, 09 Jan 2020 21:36:08 -0000
Content-Type: multipart/alternative; boundary="00000000000011dc01059bbbccc7"

--00000000000011dc01059bbbccc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding yourself is fine :)

Alex

On Thu, 9 Jan 2020 at 21:44, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> On Thu, Jan 9, 2020 at 9:35 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > This also needs a maintainers.inc entry.
> >
> > Alex
> Shall I add me - or who would like to?
>
> Andreas
>

--00000000000011dc01059bbbccc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Adding yourself is fine :)</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 9 Jan 2020 at 21:44, Andreas M=C3=BCller &lt;<a href=
=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 9, 2=
020 at 9:35 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This also needs a maintainers.inc entry.<br>
&gt;<br>
&gt; Alex<br>
Shall I add me - or who would like to?<br>
<br>
Andreas<br>
</blockquote></div>

--00000000000011dc01059bbbccc7--
