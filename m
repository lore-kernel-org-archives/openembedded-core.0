Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 182A7601D4
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 17:43:35 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id u201so127552389oie.0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0LeABBtI7jkQbu3gn6s7/9n995eltRJ59abmRyExUnI=;
	b=MyHd34U2hgBJCUF6+egJt35pQFxOu4ctphW/hnCrW88y14mJrQYGwJfVg3LTdt1eMU
	el4Pe/mdVJrXOv1rywx4XUDtVrg+7fkGUzEHtCL8eIELn10B5o9Z8U8k+jZB3tPp1cQ6
	1WjxlEeg0/FNvUW/NWgiNeg7L+IsCE07k8QOOHv9D7O50qWRRzsdlzfghizrfcsaNJUI
	eFmg4XpbYpjjKDgacfEghYSkF6rXSlWWWobIba8OYdd7HcKepu6pYR7qPxty1qr4fwZp
	I9Rr93WRzeSA7Xph9FLVgH+hNcf9EsDlKyiPvQo+xmSpj3Bh4eDSJZGoqTxHEtzTfc8L
	WDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0LeABBtI7jkQbu3gn6s7/9n995eltRJ59abmRyExUnI=;
	b=fW7A651oX06NYfC5IfttWLAi1CSSgLz8/bTrVI9wLgw1AgWLzOAZZWZHKC5HVPkaR/
	wfz4HkNwmC9fh3bfj6M3IlnWYpqhqqT3wiVd3GRBIdj+o6/i5YWafsNRipeRgUwLs6Pl
	2WBYpDw2eVcVe9SIcbwIGKYR0EkkoDrzi2LbEBEV83jBLhyWdnYbZCnLkja5YzeNxPDn
	Gp+0dw6ljnwEZfg9gmwLfoqH8Jq3BQkSFd6XtEBzkJRQ8QiGUOmkeL8bjGwqXYDemV8C
	If+g1sbrVvPSH0Kkw9tdKQee6T0+wTAEjv6o81pV5fnfhe5SCgdHtI/GygMyemZ7RsrN
	xqcQ==
X-Gm-Message-State: ALyK8tJhJ2WUsgrTQ1PLwj3ibtXqcKZMsGJPvCmzlOxM6dyqYb5kkvydRqvlX86wGfOOjIeX+4C9RsOIqafTnoQz
X-Received: by 10.157.40.150 with SMTP id s22mr2544280ota.62.1466185416118;
	Fri, 17 Jun 2016 10:43:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 17 Jun 2016 10:43:06 -0700 (PDT)
In-Reply-To: <10638163.jDLm51fopt@tal>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
	<CAJ86T=VA5n8==dM4v-AdToxkKfgTH3vTgOBijpJBYjcvygp_Jw@mail.gmail.com>
	<10638163.jDLm51fopt@tal>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 17 Jun 2016 20:43:06 +0300
Message-ID: <CAHiDW_FDRgonk9F8w55YryDn5uS44iQTassWFKMMchUOj_P0_A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Fri, 17 Jun 2016 17:43:36 -0000
Content-Type: multipart/alternative; boundary=001a11c17060e72b3205357ce488

--001a11c17060e72b3205357ce488
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 16:33, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> On June 16, 2016 18:10:09 Andre McCurdy wrote:
> > On Thu, Jun 16, 2016 at 2:47 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > > On 16 June 2016 at 21:49, Mark Asselstine <
> mark.asselstine@windriver.com>
> > >
> > > wrote:
> > >> While waiting to hear back about my inquiry I did take some
> > >> time to put together this patch that allows things that
> > >> require the older vte to continue to build. Since xfce4-terminal
> > >> lives in meta-openembedded this might make more sense to carry
> > >> over there. I am sure folks will have an opinion so sending this
> > >> out as an RFC.
> > >
> > > That's certainly a good argument for putting the old vte in meta-oe.
> >
> > The meta-oe layers generally have a higher priority than oe-core, so
> > having an older version in meta-oe and a newer version in oe-core can
> > lead to unexpected results.
>
> This should not be an issue. My change has the old recipe renamed with the
> API
> version so the old version becomes referenced by 'vte-0.0' (per the commit
> log
> the 0.0 is consistent with the API versioning upstream). So recipes which
> require the old version, like xfce4-terminal, have to have their DEPENDS
> adjusted accordingly. There should be no surprises.
>
> I will have a closer look today to ensure nothing in oe-core is requiring
> the
> old version and if not I will prepare a patch for meta-oe since that seems
> to
> be the general agreement for a home for this. I need to do some further
> checks
> and runtime tests but I will get this out shortly. In the meantime anyone
> else
> running in to the build failure can exploit the RFC patch.


Thanks Mark. I can confirm that nothing in oe-core needs the old vte.

As a sidenote in case you're looking at the vte users in oe-core: I notice
I didn't include a  patch for qemu yet. The situation there is that our
qemu version works fine with the new vte but might still need a small
configure.ac patch in addition to updated PACKAGECONFIG line. I'll include
this in my next patchset.

- Jussi


Mark
>
> >
> > > Ross
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c17060e72b3205357ce488
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
7 June 2016 at 16:33, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D"">On June 1=
6, 2016 18:10:09 Andre McCurdy wrote:<br>
&gt; On Thu, Jun 16, 2016 at 2:47 PM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; &gt; On 16 June 2016 at 21:49, Mark Asselstine &lt;<a href=3D"mailto:m=
ark.asselstine@windriver.com">mark.asselstine@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;&gt; While waiting to hear back about my inquiry I did take some<b=
r>
&gt; &gt;&gt; time to put together this patch that allows things that<br>
&gt; &gt;&gt; require the older vte to continue to build. Since xfce4-termi=
nal<br>
&gt; &gt;&gt; lives in meta-openembedded this might make more sense to carr=
y<br>
&gt; &gt;&gt; over there. I am sure folks will have an opinion so sending t=
his<br>
&gt; &gt;&gt; out as an RFC.<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s certainly a good argument for putting the old vte in m=
eta-oe.<br>
&gt;<br>
&gt; The meta-oe layers generally have a higher priority than oe-core, so<b=
r>
&gt; having an older version in meta-oe and a newer version in oe-core can<=
br>
&gt; lead to unexpected results.<br>
<br>
</span>This should not be an issue. My change has the old recipe renamed wi=
th the API<br>
version so the old version becomes referenced by &#39;vte-0.0&#39; (per the=
 commit log<br>
the 0.0 is consistent with the API versioning upstream). So recipes which<b=
r>
require the old version, like xfce4-terminal, have to have their DEPENDS<br=
>
adjusted accordingly. There should be no surprises.<br>
<br>
I will have a closer look today to ensure nothing in oe-core is requiring t=
he<br>
old version and if not I will prepare a patch for meta-oe since that seems =
to<br>
be the general agreement for a home for this. I need to do some further che=
cks<br>
and runtime tests but I will get this out shortly. In the meantime anyone e=
lse<br>
running in to the build failure can exploit the RFC patch.</blockquote><div=
><br></div><div>Thanks Mark. I can confirm that nothing in oe-core needs th=
e old vte.</div><div><br></div><div>As a sidenote in case you&#39;re lookin=
g at the vte users in oe-core: I notice I didn&#39;t include a =C2=A0patch =
for qemu yet. The situation there is that our qemu version works fine with =
the new vte but might still need a small <a href=3D"http://configure.ac">co=
nfigure.ac</a> patch in addition to updated PACKAGECONFIG line. I&#39;ll in=
clude this in my next patchset.</div><div><br></div><div>- Jussi</div><div>=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><span class=3D""><font color=3D"#=
888888">
Mark<br>
</font></span><div class=3D""><div class=3D"h5"><br>
&gt;<br>
&gt; &gt; Ross<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--001a11c17060e72b3205357ce488--
