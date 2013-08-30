Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1356BD59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:02:58 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so1848960pde.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iOrQUA2LnlU6bITxIS7kTPNOuN+32NvqIMMgQ/JsV9k=;
	b=IkCUej+OfJndVUtPvWpwqxOo8F2yhbPwrOR6iVRTs9AFJQUG4VjjGgcawfoL0HmaxP
	YLNP2OlvV+5wAG19GjRZOG5Ps8Jb1x0nF6ydXzz4OaNqwM/x6yE5ati3AhWJtVRROUeE
	492QHVIo3fUZtjtLLdS+xgaY8G0Fb+6qUNtT81J7kZrUQLd8EOqBV4UzasOPfDPKvC7W
	Rp8cIIL1M2bxep9PKfenVOJCmDsDG7awOdrfZIJ3dUOrg52JaSO+QkRKAluXxgWuPd9x
	ezaXUDDOM0TJuW1aWocd0wXc/OkO0kFqWHC+80f/hKSESweKcMV857MpRs95wkTD5Ezn
	QOkQ==
X-Gm-Message-State: ALoCoQnZX2TIurG7iuFo6R3hgo8WWU2vhHHr5IAWQ6s1F6liGEWQ5wOn1GI0VMFtcA8+O6L6YlR5
MIME-Version: 1.0
X-Received: by 10.68.59.98 with SMTP id y2mr9738939pbq.135.1377867778888; Fri,
	30 Aug 2013 06:02:58 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Fri, 30 Aug 2013 06:02:58 -0700 (PDT)
In-Reply-To: <CADkTA4MAD8vB4EEdbSSfKSFuF4bRRmUxoft_y=VQLAZo3gb3Gw@mail.gmail.com>
References: <CAOMwXhN=mJMrePAXftb8CX_WOshN=S6ufC3BaXwfjY9WYGat+A@mail.gmail.com>
	<CADkTA4MAD8vB4EEdbSSfKSFuF4bRRmUxoft_y=VQLAZo3gb3Gw@mail.gmail.com>
Date: Fri, 30 Aug 2013 14:02:58 +0100
X-Google-Sender-Auth: clRFdV_KJuqUpooXzuGaO7qFVIU
Message-ID: <CAOMwXhOd5JUf1HiEkcHXW5Tj3DrYqAnjq0KCQe3Up7RuL0=L9g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bug: 5089
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
X-List-Received-Date: Fri, 30 Aug 2013 13:02:59 -0000
Content-Type: multipart/alternative; boundary=bcaec5304f81822f7504e529d7c7

--bcaec5304f81822f7504e529d7c7
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 30, 2013 at 1:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Fri, Aug 30, 2013 at 7:45 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > Hi,
> >
> > there was this change which also goes undocumented. Unfortunately, this
> is
> > causing a lot of headache for me, but I expect that for others, too.
> >
> > I would like to propose the default kernel and module name from:
> >
> > uImage--3.2.1...
> >
> > to:
> >
> > uImage-3.2.1...
> >
> > This would avoid a lot of work for people. I have been trying to fix
> issues
> > for one day due to this which is unfortunate.
> >
> > Also, the double dash on its looks silly IMO. It should be either '-0-'
> or
> > '-'. I prefer the latter for compatibility reasons, although someone
> could
> > argue about that the former is more readable.
>
> Having maintained several systems when the default name was changed
> to include PE, it didn't cause any problems here. Both dependent recipes
> and scripts picked up the change easily and convenience symlinks made
> the -- or -0- not something that needed to be dealt with.
>

That makes me think you have too flexible scripts which will cause issues
elsewhere due to the flexibility. I had been on that front, too. That was a
gate in my case for a lot of issues where something was expected, but the
script was too flexible to verify properly. Either, when you use an
accurate script, i.e. you follow the name format specified, it will cause
you issues when updated. It is likely that you just have not provided
accurate enough pattern matching.

Anyway, I will not insist on this much if people think breaking this for
many scripts is fine, and extending the documentation should be enough.

-- Laszlo

--bcaec5304f81822f7504e529d7c7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Aug 30, 2013 at 1:47 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, Aug 30, 2013 at 7:=
45 AM, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&g=
t; wrote:<br>

&gt; Hi,<br>
&gt;<br>
&gt; there was this change which also goes undocumented. Unfortunately, thi=
s is<br>
&gt; causing a lot of headache for me, but I expect that for others, too.<b=
r>
&gt;<br>
&gt; I would like to propose the default kernel and module name from:<br>
&gt;<br>
&gt; uImage--3.2.1...<br>
&gt;<br>
&gt; to:<br>
&gt;<br>
&gt; uImage-3.2.1...<br>
&gt;<br>
&gt; This would avoid a lot of work for people. I have been trying to fix i=
ssues<br>
&gt; for one day due to this which is unfortunate.<br>
&gt;<br>
&gt; Also, the double dash on its looks silly IMO. It should be either &#39=
;-0-&#39; or<br>
&gt; &#39;-&#39;. I prefer the latter for compatibility reasons, although s=
omeone could<br>
&gt; argue about that the former is more readable.<br>
<br>
</div>Having maintained several systems when the default name was changed<b=
r>
to include PE, it didn&#39;t cause any problems here. Both dependent recipe=
s<br>
and scripts picked up the change easily and convenience symlinks made<br>
the -- or -0- not something that needed to be dealt with.<br></blockquote><=
div><br></div><div>That makes me think you have too flexible scripts which =
will cause issues elsewhere due to the flexibility. I had been on that fron=
t, too. That was a gate in my case for a lot of issues where something was =
expected, but the script was too flexible to verify properly. Either, when =
you use an accurate script, i.e. you follow the name format specified, it w=
ill cause you issues when updated. It is likely that you just have not prov=
ided accurate enough pattern matching.</div>
<div><br></div><div>Anyway, I will not insist on this much if people think =
breaking this for many scripts is fine, and extending the documentation sho=
uld be enough.</div><div><br></div><div>-- Laszlo</div></div></div></div>

--bcaec5304f81822f7504e529d7c7--
