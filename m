Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 68C8D77F9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 19:36:18 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c13so137560077qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b+4NOQVi1PR0F6qIaUcFvlecMeHMM/1oQemnHgJYAt4=;
	b=Qk+gOKlZ/EuHqTlwVQ6qTrSjmfeH3ATsEK/BLDI2lCxJxnGDyg0jQNs8kDLW9A2nke
	g4SvFW7EU9SBxsC1frmOPW9q9Qfc+r5FWruPeHXPLXAGqdpwTpQECYtkVthWttk+e+dG
	zU5ZEgX917yYp7Ehb+EY35rYBQgShtaa3UeTmJwoOa8OxuyhIKRa9VAtqpSDnKla/f3K
	Fr7qM/Q11s+OF14frILNMqyK1ofQUYHdFJJ4WTOPNQL34iYePduR65y3uXWTcyAxhbQA
	dAZrlz9PMdIieqSVAF0jcbecBGPKanLC7aJXHi9FnnMUUOydbuILKZlVildQCwFzsgxy
	3KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b+4NOQVi1PR0F6qIaUcFvlecMeHMM/1oQemnHgJYAt4=;
	b=XjL89HLz9FZzF4HQoZd3IDXRkeOyTjTVZS3a3bpKYZVojZFjoFV1UW+KFgazH0qD4d
	dZRpAy0zzvvw9XlWLrqAsN4sU4SDTfXdRubs7zXmALlHYotkIsmTeUKAaK1IFbwaWTBo
	7PLHls8VgINgtYeyhHZssTS/K3r2+JlWxfEZ6mpjYMt0ydycZoGBy3Be6/kh4aG8zahI
	jEVpAv3HROKt3OHP0bI9XB54tCbM6EUsXkDgoi96KCMsVdr5XWKrIZRDVPg7EEjw4HBG
	mSNt5zKrXhzFA8Xz+UUsbqX+9vx1mJRKkrXSqH5EQJ1bkAe8GikU7lnEiiTkkQn2gtXf
	rdJg==
X-Gm-Message-State: AODbwcDlfO7IVnt1cGBZOofiOY0s36GdmH1cgJ9993EQxp/vnVY2U8TH
	tEJSpXK+JU2WIIG6oAL0e42G7QhVgw==
X-Received: by 10.200.35.61 with SMTP id a58mr29773740qta.231.1495568179967;
	Tue, 23 May 2017 12:36:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Tue, 23 May 2017 12:36:19 -0700 (PDT)
In-Reply-To: <CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
	<CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
	<CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 May 2017 15:36:19 -0400
Message-ID: <CADkTA4NZ2E7TPb7-Awd4d_ZsWCB8Zz2Xv06VzUOnbWY5VFAUpw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Tue, 23 May 2017 19:36:24 -0000
Content-Type: multipart/alternative; boundary="001a11403a8a1abe150550361af7"

--001a11403a8a1abe150550361af7
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:

> >> +SRC_URI += "file://drm.cfg"
> >
> >
> >
> > If anything gets added to the default configurations, they need to go
> into
> > the kernel-cache
> > and then be included by the relevant kernel types there.
> >
> > If you want, I can take care of switching things to that format.
> >
>
> yes please.
>

Will do. I'll make it available to all active kernel versions + future ones.

Cheers,

Bruce



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11403a8a1abe150550361af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 22, 2017 at 1:06 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt;&gt; =
+SRC_URI +=3D &quot;file://drm.cfg&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; If anything gets added to the default configurations, they need to go =
into<br>
&gt; the kernel-cache<br>
&gt; and then be included by the relevant kernel types there.<br>
&gt;<br>
&gt; If you want, I can take care of switching things to that format.<br>
&gt;<br>
<br>
</span>yes please.<br>
</blockquote></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Will do. I&#39;ll make it available to all active kernel versions +=
 future ones.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Cheers,</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Bruce</div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a11403a8a1abe150550361af7--
