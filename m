Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SIQ20-0000EP-AA
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:50:12 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Apr 2012 12:39:38 -0700
Received: by lahi5 with SMTP id i5so1645459lah.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 12:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=tB2FPz+iQf7ctQWZHmYV+Uh+FC3fzeQjLw9iWQ6Tw+0=;
	b=I70s1UmRwUaxYdgYQmCNvyMZzDydFCr3j3+8z2VbUh29S/kXMWSix48+SU7+WbiIHU
	jTBncC0K7pF6Kx9CXwD+XhVtdZmnV6FDfYjBKaYxDM78rXCxbqdrmG+gSnI+RcFnZuuT
	iad3/lG4R1UWrcz1Wm5RH9wQzoctg2d3YGSImFI/gAG6Vmqz4SCLLag3JRQDCseytBNA
	sO/fnU0PFuSNs8nJgDUeWjT+b60xNbzO70CR3HpphdpcVQ+VumluamykS/Rx4CSzDDQl
	qSoBbiIKFP/45xQaowuHovKzZkljXcoXKs0osCawScLcIe1Wn+1sEaGSB2UagZxmGF2/
	PMyQ==
MIME-Version: 1.0
Received: by 10.152.129.137 with SMTP id nw9mr3259173lab.48.1334259576625;
	Thu, 12 Apr 2012 12:39:36 -0700 (PDT)
Received: by 10.112.102.5 with HTTP; Thu, 12 Apr 2012 12:39:36 -0700 (PDT)
In-Reply-To: <20120412183147.GD13291@denix.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<20120412183147.GD13291@denix.org>
Date: Thu, 12 Apr 2012 12:39:36 -0700
Message-ID: <CAPhnLPD6fvP2Uq=nbxev0RcRh6Zw2t4kx2A=-iJdiLbdp8OmgQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmC52kqlVPFfgh1v8q+10eR7QubF2IzFUZ2gP4IxoJc2tD2QHz/1DRJOoyiDAxh0i9JxTvG
Subject: Re: Yocto Project 1.2 M4 schedule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 19:50:12 -0000
Content-Type: multipart/alternative; boundary=f46d0430878e1a5b1b04bd80847a

--f46d0430878e1a5b1b04bd80847a
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 12, 2012 at 11:31 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Apr 12, 2012 at 02:32:00PM -0300, Otavio Salvador wrote:
> > On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> > > You just volunteered to handle all the "Does it work with yocto 1.2?"
> questions :)
> > >
> > > Simply put: people are stupid, they need explicit PHB compliant names
> in tags, even if it isn't 100% politically correct to say "yocto" when we
> actually mean "oe-core".
> > >
> > > Unless the yocto 1.2 release note state that it's based on oe-core
> "foo" and all layers compatible with "foo" use "foo" in tags/branches.
> >
> > I think layers ought to have tags for both ...
> >
> > <layer>-oe-core-<tag>
> > <layer>-yocto-<tag>
>
> And <layer>-poky-<tag> for completeness?
>
> Seriously, "yocto"-naming schema is not that bad. For shortness, it can be
> "yp-1.2" as a suffix to the layer-specific tags...
>
> But I'm flexible with other naming schemas, such as "YYYY.MM" or "YYYY.#"
>
>
I'm open to whatever naming scheme people want to decide on with few
caveats. That it be painstakingly documented. That it can handle point
releases and release candidates. I personally like YYYY.MM schemes, but, in
the end, all I care about is that it's flexible, agreed upon and very well
documented.

-b

--
> Denys
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

--f46d0430878e1a5b1b04bd80847a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Apr 12, 2012 at 11:31 AM, Denys =
Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org">denis@=
denix.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Apr 12, 2012 at 02:32:00PM -0300, Otavio Salvador=
 wrote:<br>
&gt; On Thu, Apr 12, 2012 at 14:22, Koen Kooi &lt;<a href=3D"mailto:koen@do=
minion.thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>
&gt; &gt; You just volunteered to handle all the &quot;Does it work with yo=
cto 1.2?&quot; questions :)<br>
&gt; &gt;<br>
&gt; &gt; Simply put: people are stupid, they need explicit PHB compliant n=
ames in tags, even if it isn&#39;t 100% politically correct to say &quot;yo=
cto&quot; when we actually mean &quot;oe-core&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Unless the yocto 1.2 release note state that it&#39;s based on oe=
-core &quot;foo&quot; and all layers compatible with &quot;foo&quot; use &q=
uot;foo&quot; in tags/branches.<br>
&gt;<br>
&gt; I think layers ought to have tags for both ...<br>
&gt;<br>
&gt; &lt;layer&gt;-oe-core-&lt;tag&gt;<br>
&gt; &lt;layer&gt;-yocto-&lt;tag&gt;<br>
<br>
</div>And &lt;layer&gt;-poky-&lt;tag&gt; for completeness?<br>
<br>
Seriously, &quot;yocto&quot;-naming schema is not that bad. For shortness, =
it can be<br>
&quot;yp-1.2&quot; as a suffix to the layer-specific tags...<br>
<br>
But I&#39;m flexible with other naming schemas, such as &quot;<a href=3D"ht=
tp://YYYY.MM" target=3D"_blank">YYYY.MM</a>&quot; or &quot;YYYY.#&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br>I&#39;m open to whatever naming scheme people want to decide on=
 with few caveats. That it be painstakingly documented. That it can handle =
point releases and release candidates. I personally like <a href=3D"http://=
YYYY.MM">YYYY.MM</a> schemes, but, in the end, all I care about is that it&=
#39;s flexible, agreed upon and very well documented. <br>
<br>-b<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0=
pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"HOEnZb"><font color=3D"#888888">
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Elizabeth F=
lanagan<br>Yocto Project<br>Build and Release<br>

--f46d0430878e1a5b1b04bd80847a--
