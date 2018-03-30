Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9012F744F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 00:45:36 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id c78-v6so10691633lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 17:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJub0Fv41r7OHDfJggPCF2UFtPaDqPngn4Vz+HYzPRE=;
	b=DNW/gT6uAEymRqryesp3hLEKj5FFeHFCA28hQAvZ/GkZSZmFbj5wnMJQMm/9xkc8Io
	qIDuozNa5dcfXnwHt1b98Ue3fJXiBmfRyEj09E43O8vElCv782C4P9bWY30KWZIEDRb5
	6FAK33cRw5hir/xGwJlqTtf/eh7MLZ9BgpRIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJub0Fv41r7OHDfJggPCF2UFtPaDqPngn4Vz+HYzPRE=;
	b=uZnEGmL0wCnnDtRnawLCqnaWkfbvkwatPKVgbbNE9lr+M4nWyZG2Eu0YA8Tmur6yy6
	/Z58CI3QFrvGYHpAF6gPV52fI9ZwzoAQ6sCDrnFcvGX/W9gqW7qG94tL7DA+5zRgCutA
	w4OPQo6mmPrPfMoGMLxkSBuLVGmTDDzTc29AlBbXfs2RDJ1X1Upj0AQLP96zYh3oKPQl
	osRgtDdmCmDlOYKIa5GECKe1mE6zckpJNxVwKJPSNeM2PvLOm66DQh+eBBUndB/Ik3dS
	i8m4QIZiPzcyS/chvypusOs3Si1LL8ieDHe9Px2RPP5k5SSS8f/9MdnZbbzJpN8tlqfA
	4png==
X-Gm-Message-State: AElRT7GSeMq883MdTkE4LzRX1U7Qeg6qQnbK8WoRCh004nJN/ZN4ZlpX
	2ay904u7o9EKjMSzraAQvYJXqX+XVrS6qmDeSEFtyA==
X-Google-Smtp-Source: AIpwx483+kbaQvbkO3YKIM9Ol3U+o5gmUVsNqccQLtinKplLAh6xeWzs6HwAP17sirpWxnqZ8ZiFMAKAE32t05CB/aU=
X-Received: by 10.46.145.74 with SMTP id q10mr6627624ljg.13.1522370736828;
	Thu, 29 Mar 2018 17:45:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:a053:0:0:0:0:0 with HTTP; Thu, 29 Mar 2018 17:45:36
	-0700 (PDT)
In-Reply-To: <CAC+thW3gJDv_RGKAhXxkXM3rjAEDk8-_Ew2rszTpij2n_SwAtg@mail.gmail.com>
References: <mailman.363.1522325586.1651.openembedded-core@lists.openembedded.org>
	<CAHUNapTc-iiZ6vbRV=J3pt5EQy-qJJbgkwzZKhpAkfC3pgzXiw@mail.gmail.com>
	<CA+chaQdYG-kNDqiStA=yg1nGjLH_pgH7vcm6Db_kxZ+Bt1pWSg@mail.gmail.com>
	<CAC+thW3gJDv_RGKAhXxkXM3rjAEDk8-_Ew2rszTpij2n_SwAtg@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 29 Mar 2018 17:45:36 -0700
Message-ID: <CADfgfoZq56q5wyyr9OQ8Xo0KACZ0-0am+LyXTp6ND7x6WqwFxw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>, Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: confirm 6bb527bbc2e6d9a2a2165aa081ea1271ece07fe8
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
X-List-Received-Date: Fri, 30 Mar 2018 00:45:37 -0000
Content-Type: multipart/alternative; boundary="f4f5e80c3474fc47dd0568968e85"

--f4f5e80c3474fc47dd0568968e85
Content-Type: text/plain; charset="UTF-8"

We had several hundred bounces from Gmail today. I've made changes and
Gmail is currently accepting new messages.

I'm running a script to clear users' bounce counts now.

-- 
Michael Halstead
SysAdmin


On Thu, Mar 29, 2018 at 3:11 PM, Andrea Galbusera <gizero@gmail.com> wrote:

> On Thu, Mar 29, 2018 at 11:56 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > I got the same today.
>
> Me too!
>
> >
> > On Thu, Mar 29, 2018 at 11:51 PM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> >>
> >> uhhh.... gmail is on the bad list?
> >> anyone else get one of these?
> >>
> >>
> >> ---------- Forwarded message ----------
> >> From: <openembedded-core-request@lists.openembedded.org>
> >> Date: Thu, Mar 29, 2018 at 8:13 AM
> >> Subject: confirm
> >> To: twoerner@gmail.com
> >>
> >>
> >> Your membership in the mailing list Openembedded-core has been
> >> disabled due to excessive bounces The last bounce received from you
> >> was dated 29-Mar-2018.  You will not get any more messages from this
> >> list until you re-enable your membership.  You will receive 3 more
> >> reminders like this before your membership in the list is deleted.
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f4f5e80c3474fc47dd0568968e85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We had several hundred bounces from Gmail today. I&#39;ve =
made changes and Gmail is currently accepting new messages.=C2=A0<div><br><=
/div><div>I&#39;m running a script to clear users&#39; bounce counts now.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">--=C2=
=A0</div><div class=3D"gmail_extra">Michael Halstead</div><div class=3D"gma=
il_extra">SysAdmin</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 29, 2018 at 3:11 PM=
, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=3D"mailto:gizero@gmail.com=
" target=3D"_blank">gizero@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span class=3D"">On Thu, Mar 29, 2018 at 11:56 PM, Martin=
 Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
&gt; I got the same today.<br>
<br>
</span>Me too!<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Thu, Mar 29, 2018 at 11:51 PM, Trevor Woerner &lt;<a href=3D"mailto=
:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; uhhh.... gmail is on the bad list?<br>
&gt;&gt; anyone else get one of these?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---------- Forwarded message ----------<br>
&gt;&gt; From: &lt;<a href=3D"mailto:openembedded-core-request@lists.openem=
bedded.org">openembedded-core-request@<wbr>lists.openembedded.org</a>&gt;<b=
r>
&gt;&gt; Date: Thu, Mar 29, 2018 at 8:13 AM<br>
&gt;&gt; Subject: confirm<br>
&gt;&gt; To: <a href=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a><b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Your membership in the mailing list Openembedded-core has been<br>
&gt;&gt; disabled due to excessive bounces The last bounce received from yo=
u<br>
&gt;&gt; was dated 29-Mar-2018.=C2=A0 You will not get any more messages fr=
om this<br>
&gt;&gt; list until you re-enable your membership.=C2=A0 You will receive 3=
 more<br>
&gt;&gt; reminders like this before your membership in the list is deleted.=
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--f4f5e80c3474fc47dd0568968e85--
