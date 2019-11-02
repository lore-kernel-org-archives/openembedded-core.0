Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 567D67FC8A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 11:01:49 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id f21so3668729uan.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2019 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QCLc+pl3vZVg84S+/sWF+a4siPAML5CgrLnKmFZ0SSw=;
	b=M7DdQrmpjgSDewmvfaLXqSr6DKsbK06w5lPwS+7NdtTo8fVjDhEMtH5FBduiFc/U3d
	MFoe4tSczguw3qZg8nkhji0iqG1MV1Y9aXbA04s9PUWfdWk8tYy2hb4KTOeLisyETUiM
	snZptmyIcNNUgqGx0h8vBj08SQdD6GdY8BxqnnzgRj9A7wyB1vB8AFRA8+QzYV653hQ/
	iFKx5A4JIODSRkeg7QNR/RLC01ChzF8it72ZLTlRowaavAmapHOWBLoW0RgOj+BwgE0+
	9qlSqMPsUyaRcR9CXv7Rs98pMsVUqPrgi3J8Oai06E3fZvhaEH7BBGDMJPE1Bj6ZI0oh
	l1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QCLc+pl3vZVg84S+/sWF+a4siPAML5CgrLnKmFZ0SSw=;
	b=lOm+D6bzIh1CCs/oBSSsnmuVLR2vqu2Ot3he2R0XXE90QV8SEtOCm96T/cixvLI+lh
	grhO8PhJLYxM/0v2zaTj0V331saREu7W4sRLsHxlhG3vjpvx+KDvWJ69bB0BA9Ckta1B
	eD9lxtai/jApZzdAFkgB73e7DEkRJOnns5Zb5dmVtneBVu6Fu5SNc5oRSu5Jz0Te1yri
	M96WcQ0FhIQREFlH9Ei2A+wxSdeODUC19pxUAjByt3AwrHn246rIjHecwx66WHvS5Dtk
	RuPP2tzSRuLVS7o2pYYWH6oWZnsCWbO3aGkf7Ez0fvum1jMBOfX0GX3hw0AWCmvasMz9
	T6cw==
X-Gm-Message-State: APjAAAW/+TLg+iSaMJHagb+prSGgZvQ70aOH1V6OsXGp+cPfp2KEkBVd
	gnzIhpKkKErivDywV+qwvvShHzgsIL/AnSYRWhk=
X-Google-Smtp-Source: APXvYqzugAzoeJlPVIK8mOBcKLmCC7IMbA6UISHWRQ6YkiljB9O5FoMmbtln29ynl9nu55IH66I8AFHu/14kiN7odOY=
X-Received: by 2002:ab0:2258:: with SMTP id z24mr8097412uan.100.1572692509893; 
	Sat, 02 Nov 2019 04:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
	<20191101201225.GA1826@localhost>
In-Reply-To: <20191101201225.GA1826@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2019 12:01:38 +0100
Message-ID: <CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Sat, 02 Nov 2019 11:01:49 -0000
Content-Type: multipart/alternative; boundary="00000000000064a75005965b0226"

--00000000000064a75005965b0226
Content-Type: text/plain; charset="UTF-8"

I too think that the information may never reach the target audience, as
they could never update their builds to the point where it would start
printing 'end of life'.

What could work instead is printing a link to the wiki during
'oe-init-build-env'.

Alex

On Fri, 1 Nov 2019 at 21:12, Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, Nov 01, 2019 at 07:46:38PM +0100, Ruslan Bilovol wrote:
> > When OE/Yocto project goes through its lifecycle, there
> > is no any way to identify where it is other than go
> > to a Yocto wiki and look at current status.
>
> The status in the wiki can be updated.
>
> > Moreover, change from maintained to community maintained
> > end EOLing happens silently so users not always know
> > about that.
> >
> > This patch aims to remove this gap. The status should
> > be changed so users can clearly identify at which point
> > it is now:
> >  Development -> Stable -> Community supported -> End Of Life
> >
> > It is now printed during the build.
> >...
>
> What is printed is the status at the point in the
> (sometime distant) past when a release was made.
>
> It is not uncommon for hardware to come with an example BSP based
> on an older release like for example Yocto 2.0.3 (sic) today.
>
> The Yocto 2.0.3 release shipped as part of this distribution would
> never print "End Of Life".
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000064a75005965b0226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I too think that the information may never reach the =
target audience, as they could never update their builds to the point where=
 it would start printing &#39;end of life&#39;.</div><div><br></div><div>Wh=
at could work instead is printing a link to the wiki during &#39;oe-init-bu=
ild-env&#39;.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1 Nov 2019 a=
t 21:12, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Fri, Nov 01, 2019 at 07:46:38PM +0100, Ruslan Bilovol wrote:<br>
&gt; When OE/Yocto project goes through its lifecycle, there<br>
&gt; is no any way to identify where it is other than go<br>
&gt; to a Yocto wiki and look at current status.<br>
<br>
The status in the wiki can be updated.<br>
<br>
&gt; Moreover, change from maintained to community maintained<br>
&gt; end EOLing happens silently so users not always know<br>
&gt; about that.<br>
&gt; <br>
&gt; This patch aims to remove this gap. The status should<br>
&gt; be changed so users can clearly identify at which point<br>
&gt; it is now:<br>
&gt;=C2=A0 Development -&gt; Stable -&gt; Community supported -&gt; End Of =
Life<br>
&gt; <br>
&gt; It is now printed during the build.<br>
&gt;...<br>
<br>
What is printed is the status at the point in the<br>
(sometime distant) past when a release was made.<br>
<br>
It is not uncommon for hardware to come with an example BSP based<br>
on an older release like for example Yocto 2.0.3 (sic) today.<br>
<br>
The Yocto 2.0.3 release shipped as part of this distribution would<br>
never print &quot;End Of Life&quot;.<br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000064a75005965b0226--
