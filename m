Return-Path: <kad@kad.name>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 15C926FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 09:47:48 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id z123so4193870itg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2016 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bxjB+ZpvHB4QuHK7jDu4TSFiRueUbtj5vILXHJcHGAk=;
	b=RVD+z9OK+dnejIC1sS1DifI0Osqrxe9T4jkSVt71TEfXHd1VfSVxmb1fgKbRNWAALd
	VQjYwnkP3YvFqZMx69HNNRMXAYcXdxwiRgf3cWIyDW3OgsFVUi9DzblJvg2jv4s6IRC8
	lnhdH7UOIUpgCA/g2hobpaqGl4vw07JlNRb5Ar+DneGfaGl3016q7iVknsMmVfCCRnoH
	dO6u/wK/QovvfoD3qRmCDMH+RWWmJjpCNPZR5UEyfWJ6ORnEuk3j2+J4sSE5V3QQ0gkJ
	UEskyCUI9+JWpVccdH9tiDU0uCcCGYbc+wOt+kBStlGg0vTmstVDiOfxMaV4MePMgG94
	sfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bxjB+ZpvHB4QuHK7jDu4TSFiRueUbtj5vILXHJcHGAk=;
	b=IkppDy8nv+aEt3kXXIxZW9FVbdbt5o4PJ32XTHZS6okciH8n/F7pfK/rKzwCJXsD2y
	1Xqr6esYGIqDK3+gTA1MwXDd5DK31Au1w0UqYcoFEPiiyf69t024meO4SRh2TsBTNk1B
	mV3KqPEmVbmGiHjtNMRX95pJot3IAXCsEplFbQF36aPzOKwCEK4EofrudEovXPa162OB
	cYEQTFHQULAi0/tB5K88WXz2Ta6YkIZkbhLhkWG1mIMpgfUfgQdvJLN8yKG4u7lOYOmq
	1QxL7ztobVhvq9zneGDxutDpTx+qwCvqiwTLBADkBhcb887Upyot+lcRBQLU68FB2dfN
	YiMw==
X-Gm-Message-State: ALyK8tIBOvio88LPgoWj4KS1VKVIHGVDL2GggBErjb+2UsOC1rP1RcpemnKDqz41lluVQTopq60wIvJgMjrCvQ==
X-Received: by 10.36.217.10 with SMTP id p10mr11109355itg.23.1465379269095;
	Wed, 08 Jun 2016 02:47:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.216 with HTTP; Wed, 8 Jun 2016 02:47:48 -0700 (PDT)
In-Reply-To: <10776768.uSdOil2dlO@peggleto-mobl.ger.corp.intel.com>
References: <20160605214429.63811-1-kad@kad.name>
	<10776768.uSdOil2dlO@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanevskiy <kad@kad.name>
Date: Wed, 8 Jun 2016 12:47:48 +0300
Message-ID: <CANFkWpk+hk5Hj02VHbGdttoA0RawV17PsB9X6x0MmXYUwbEWrg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-pkgdata-util: new option to provide full info for binary package(s)
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
X-List-Received-Date: Wed, 08 Jun 2016 09:47:49 -0000
Content-Type: multipart/alternative; boundary=001a1149a47ecbce350534c13206

--001a1149a47ecbce350534c13206
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 8, 2016 at 12:06 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Sasha,
>
> Functionality wise this looks good.
>
> On Mon, 06 Jun 2016 00:44:29 Alexander D. Kanevskiy wrote:
> > New option can be used for displaying full information about binary
> > package(s), including name, full version, recipe name, recipe full
> version
> > and package size.
> >
> > This information can be useful to produce detailed image manifest
> > for further analysis.
>
> Possibly worth noting that since this looks up current information rather
> than
> what's in the image, this is only going to be accurate for that purpose if
> no
> packages have been rebuilt (strictly speaking no do_packagedata tasks have
> executed) since the manifest was generated.
>

Assumption that it would be used in extra buildhistory class, so pkgdata
still should be valid.
But good point that it can be executed manually.


> > +    for pkg in packages:
> > +        items.append(("%s %s%s%s %s %s%s%s %s" % (
> > +            pkg,
> > +            mappings[pkg]['PKGE'] + ":" if mappings[pkg]['PKGE'] else
> "",
> > +            mappings[pkg]['PKGV'],
> > +            "-" + mappings[pkg]['PKGR'] if mappings[pkg]['PKGR'] else
> "",
> > +            mappings[pkg]['PN'],
> > +            mappings[pkg]['PE'] + ":" if mappings[pkg]['PE'] else "",
> > +            mappings[pkg]['PV'],
> > +            "-" + mappings[pkg]['PR'] if mappings[pkg]['PR'] else "",
> > +            mappings[pkg]['PKGSIZE']
> > +        )).strip()
> > +        )
>
> This seems like a bit of an ugly construction. If it were me writing it I
> would probably break it down using variables rather than trying to do it
> all
> on one line. That said it's not bad enough to block it, if nobody else
> feels
> strongly about it then you're in the clear.
>

ok. I'll send new version of patch a bit later today.

-- 
br, Alexander Kanevskiy

--001a1149a47ecbce350534c13206
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jun 8, 2016 at 12:06 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hi Sasha,<br>
<br>
Functionality wise this looks good.<br>
<span class=3D""><br>
On Mon, 06 Jun 2016 00:44:29 Alexander D. Kanevskiy wrote:<br>
&gt; New option can be used for displaying full information about binary<br=
>
&gt; package(s), including name, full version, recipe name, recipe full ver=
sion<br>
&gt; and package size.<br>
&gt;<br>
&gt; This information can be useful to produce detailed image manifest<br>
&gt; for further analysis.<br>
<br>
</span>Possibly worth noting that since this looks up current information r=
ather than<br>
what&#39;s in the image, this is only going to be accurate for that purpose=
 if no<br>
packages have been rebuilt (strictly speaking no do_packagedata tasks have<=
br>
executed) since the manifest was generated.<br></blockquote><div><br></div>=
<div>Assumption that it would be used in extra buildhistory class, so pkgda=
ta still should be valid.</div><div>But good point that it can be executed =
manually.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5">&gt; +=C2=A0 =C2=A0 for pkg in packages:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 items.append((&quot;%s %s%s%s %s %s%s%s %=
s&quot; % (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGE&#39=
;] + &quot;:&quot; if mappings[pkg][&#39;PKGE&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGV&#39=
;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-&quot; + mappings[pk=
g][&#39;PKGR&#39;] if mappings[pkg][&#39;PKGR&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PN&#39;]=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PE&#39;]=
 + &quot;:&quot; if mappings[pkg][&#39;PE&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PV&#39;]=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-&quot; + mappings[pk=
g][&#39;PR&#39;] if mappings[pkg][&#39;PR&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGSIZE&=
#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )).strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
</div></div>This seems like a bit of an ugly construction. If it were me wr=
iting it I<br>
would probably break it down using variables rather than trying to do it al=
l<br>
on one line. That said it&#39;s not bad enough to block it, if nobody else =
feels<br>
strongly about it then you&#39;re in the clear.<br></blockquote><div><br></=
div><div>ok. I&#39;ll send new version of patch a bit later today.</div><di=
v>=C2=A0</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--001a1149a47ecbce350534c13206--
