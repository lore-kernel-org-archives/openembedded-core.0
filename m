Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 46C627CDF4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:18:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id h18so2280704wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SCc+yTTdCsg56TDXU5CFZ2NpVieAX/7d08czEDW0Nhk=;
	b=Lo8XTIIhmSZ+drvzyXEdajil3qeK1dLQUWcb6L9nvUEzt41InKJeerkawMsj54ITPo
	0cP6Cvx/aMg//zLsXdXrFRAz1l4KbMIGp7WMmNS7KBxDnyuzxB2RIm3h/qBf49LgtdSh
	j0HYpKBhEKiHMHzrw+q3yclRgZPrVQX88JxniiordBWX5IUxJy8f65ImlHY6xqS9xrhQ
	GbsJpVj/tt4LoS9c/+CEoVcBGx7YUrB1dTJtRlF4J+v0J5Hict0c2cCTAXO0dzoJuUhq
	hckkrMSyOdBvJys/wVUNxkCyeIeMssdPwAMfeN3YPAMtLu5UODGKDpv1HTKOkOb+1LRT
	Z9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SCc+yTTdCsg56TDXU5CFZ2NpVieAX/7d08czEDW0Nhk=;
	b=agrOuLpyGfJwNc+A0xotvvTjdvH61OEPoJcrcxGLiRs+aYfqsBvCP9ofpCa5xIwz+w
	mo0f1ae7rCmV57xZ1O4uLbbsDy3Jdp4BheMwP7rFutRfZTSbBzmT3wtgdhYdOZxjthmz
	qmXBT50RhIC2Ft6DUTyjlWgw4uNQaRFQ4BMLEZFGTeIximkOBy9Ay2lj73RiTIRsGuT5
	bIwWdnbX4t8H3atiIy5+elFb77GHOPFOtnWNkbAVfvMvNlRvmQPJgZ0dUO0RuVCQo/lG
	mFeWVZiZmfmTtlWxy4lta0xsB9fVyE6SQ64deuF47Xm+Hv3GSST5NyPseERrZizYYW57
	FtbA==
X-Gm-Message-State: APjAAAWGE3+8PKJ6g8IfWThpTHFQ8Qg24c0p60KA72on+Zob52VmXxq/
	VlK2z+cSZUx0cCKKzrnTRZy5MxpyeKm/N2ofj3E=
X-Google-Smtp-Source: APXvYqyN05YRJZEl2fUOQjaf7vuxlNMbagwT3LfuvzJNvSd0ltCj/QW14dvknhrkzWONgMZ7xn5upJnkDIA7l5qYDmU=
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr2270165wmt.33.1554189514845; 
	Tue, 02 Apr 2019 00:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
	<20190319075206.GK20077@hiutale> <20190324180113.GA1947@jama>
	<f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
	<20190324184803.GB1947@jama>
In-Reply-To: <20190324184803.GB1947@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 Apr 2019 09:18:23 +0200
Message-ID: <CA+chaQfznYy8kNoRYynaZQuc1wA7VOxroxcgcPqp8dJcUB3V9A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Tue, 02 Apr 2019 07:18:34 -0000
Content-Type: multipart/alternative; boundary="000000000000f23215058586f1b0"

--000000000000f23215058586f1b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any update on this one? Or should we downgrade it on our side when bumping
oe-core/thud revision?

On Sun, Mar 24, 2019 at 7:48 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> On Sun, Mar 24, 2019 at 11:45:08AM -0700, akuster808 wrote:
> >
> >
> > On 3/24/19 11:01 AM, Martin Jansa wrote:
> > > On Tue, Mar 19, 2019 at 07:52:06AM +0000, Mikko.Rapeli@bmw.de wrote:
> > >> On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=C3=BCller wrote:
> > >>> On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster <akuster808@gmail.com>
> wrote:
> > >>>> This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
> > >>>>
> > >>>> This package update slipped in doing the maint process. Removing i=
t.
> > >> <snip>
> > >>> Just my opinion - don't consider this as NAK.
> > >>>
> > >>> * I already fixed the recipes that failed for me. For at least one
> the
> > >>> change is no more compatible to 1.68.0.
> > >>> * This makes PV going backwards
> > >>>
> > >>> Thanks for addressing - what do others think?
> > >> I'm not using thud yet, but updating boost in stable branch would
> break
> > >> too many things and I would have to revert that change in our trees.
> Some boost
> > >> updates are in the end quite trivial and just require recompiling
> > >> everything but still, I would prefer that boost is not updated in
> stable
> > >> branches unless there is a huge security/stability issue with the ol=
d
> version.
> > > Agreed.
> > >
> > > I care less for PV going backwards nowadays, it's probably less
> annoying than
> > > bumping PE first in master and then backporting PE bump to thud.
> > >
> > > People with build issues related to boost upgrade probably never
> > > built whole image to push it as an upgrade to end devices.
> >
> > So do you agree with the revert?
>
> I do.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--000000000000f23215058586f1b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any update on this one? Or should we downgrade it on our s=
ide when bumping oe-core/thud revision?</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 24, 2019 at 7:48 PM Mart=
in Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Sun, Mar 24, 2019 at 11:45:08AM -0700, akuster808 wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 3/24/19 11:01 AM, Martin Jansa wrote:<br>
&gt; &gt; On Tue, Mar 19, 2019 at 07:52:06AM +0000, <a href=3D"mailto:Mikko=
.Rapeli@bmw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a> wrote:<br>
&gt; &gt;&gt; On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=C3=BCller=
 wrote:<br>
&gt; &gt;&gt;&gt; On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt; This reverts commit a384248938ea9db096866bf4ec8678d35=
ca62a12.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; This package update slipped in doing the maint proces=
s. Removing it.<br>
&gt; &gt;&gt; &lt;snip&gt;<br>
&gt; &gt;&gt;&gt; Just my opinion - don&#39;t consider this as NAK.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; * I already fixed the recipes that failed for me. For at =
least one the<br>
&gt; &gt;&gt;&gt; change is no more compatible to 1.68.0.<br>
&gt; &gt;&gt;&gt; * This makes PV going backwards<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thanks for addressing - what do others think?<br>
&gt; &gt;&gt; I&#39;m not using thud yet, but updating boost in stable bran=
ch would break<br>
&gt; &gt;&gt; too many things and I would have to revert that change in our=
 trees. Some boost<br>
&gt; &gt;&gt; updates are in the end quite trivial and just require recompi=
ling<br>
&gt; &gt;&gt; everything but still, I would prefer that boost is not update=
d in stable<br>
&gt; &gt;&gt; branches unless there is a huge security/stability issue with=
 the old version.<br>
&gt; &gt; Agreed.<br>
&gt; &gt;<br>
&gt; &gt; I care less for PV going backwards nowadays, it&#39;s probably le=
ss annoying than<br>
&gt; &gt; bumping PE first in master and then backporting PE bump to thud.<=
br>
&gt; &gt;<br>
&gt; &gt; People with build issues related to boost upgrade probably never<=
br>
&gt; &gt; built whole image to push it as an upgrade to end devices.<br>
&gt; <br>
&gt; So do you agree with the revert?<br>
<br>
I do.<br>
<br>
-- <br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</blockquote></div>

--000000000000f23215058586f1b0--
