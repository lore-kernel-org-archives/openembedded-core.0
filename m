Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Skevy-0005ud-23
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 19:24:42 +0200
Received: by eaal1 with SMTP id l1so1495337eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yM5O187bPJn/SB72gBHaALDzmxul4tPoSZhmr86ih28=;
	b=G4DRB7Me8SgkBKZsBak28gJ0GezEcNaUvW0STJWj453PELKk+JfLF/pnKvNYCvJvz0
	MlEk7AcpLJbqADVhkaT201L4Rr1OdWX3cp67cs1ZgsmPE+kqnLZhbUwWam+mtpxxWhQo
	kSFShMmE6qX2vGl2m+gtnRseegIg0vItov/BTNVXTtNODkQAY34wpEhyU1Lg02aEp1xO
	ONSzd4HdICoEPlqUdIgibi6EvFOHCaBjSl1iVJUeAxmcBUFuBZoW4YZo6ESWv44C2ryH
	B/F2BqZ/DucbnKlYj/EwuvAc2OW7aKMM9hqrmNEFc5pDQ2EU/U7P2p0WAyFZwGdnc59D
	eI0g==
MIME-Version: 1.0
Received: by 10.14.37.206 with SMTP id y54mr842022eea.218.1340990025900; Fri,
	29 Jun 2012 10:13:45 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 10:13:45 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206291259270.4694@oneiric>
References: <alpine.DEB.2.02.1206291259270.4694@oneiric>
Date: Fri, 29 Jun 2012 10:13:45 -0700
Message-ID: <CAMKF1sq7aAb=d3Bcnf27AhZo8A06WH63mGdp+gfSPHL-J9h09A@mail.gmail.com>
From: "raj.khem" <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: any subtle reason for using "BPN" with ALLOW_EMPTY instead of just "PN"?
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
X-List-Received-Date: Fri, 29 Jun 2012 17:24:42 -0000
Content-Type: multipart/alternative; boundary=bcaec517a71c24224004c39f9235

--bcaec517a71c24224004c39f9235
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>  in current poky ref manual, the explanation of ALLOW_EMPTY talks
> about using it with a package name, as in:
>
>  ALLOW_EMPTY_${PN} = "1"
>
> which makes perfect sense, except that there is the occasional example
> where something other than "PN" is used, sometimes for good reason,
> sometimes not clear.
>
>  for instance, there's this:
>
> meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${PN} = "1"
> meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
>
> which makes sense (i guess) since, in this case, PN=qt4-x11-free,
> while QT_BASE_NAME=qt4.  so there are obviously going to be special
> cases like that.
>
>  but here are a few that seem to use BPN unnecessarily:
>
> meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-binaries =
"1"
> meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-charmaps =
"1"
> meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-gconvs = "1"
> meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-localedatas
= "1"
> meta/recipes-graphics/pango/pango.inc:ALLOW_EMPTY_${BPN}-modules = "1"
>
> it seems that, with the above packages, PN = BPN so, yes, either one
> would have worked, but is there a best practice?  i would think that
> using anything other than PN should be reserved for when it's
> necessary, so that it's more aesthetically obvious that something
> different is happening.


This is needed when PN is altered e.g
When using BBCLASSEXTEND
>
>  thoughts?  yes, i know it makes no functional difference.  again,
> i'm just trying to codify best practices.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec517a71c24224004c39f9235
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Robert P. J. Day &lt;<a href=3D"mailto:rp=
jday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>&gt;<br>&gt; =
=C2=A0in current poky ref manual, the explanation of ALLOW_EMPTY talks<br>&=
gt; about using it with a package name, as in:<br>
&gt;<br>&gt; =C2=A0ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>&gt;<br>&gt; whic=
h makes perfect sense, except that there is the occasional example<br>&gt; =
where something other than &quot;PN&quot; is used, sometimes for good reaso=
n,<br>
&gt; sometimes not clear.<br>&gt;<br>&gt; =C2=A0for instance, there&#39;s t=
his:<br>&gt;<br>&gt; meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${PN} =3D &quo=
t;1&quot;<br>&gt; meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${QT_BASE_NAME}-f=
onts =3D &quot;1&quot;<br>
&gt;<br>&gt; which makes sense (i guess) since, in this case, PN=3Dqt4-x11-=
free,<br>&gt; while QT_BASE_NAME=3Dqt4. =C2=A0so there are obviously going =
to be special<br>&gt; cases like that.<br>&gt;<br>&gt; =C2=A0but here are a=
 few that seem to use BPN unnecessarily:<br>
&gt;<br>&gt; meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-=
binaries =3D &quot;1&quot;<br>&gt; meta/recipes-core/eglibc/eglibc-locale.i=
nc:ALLOW_EMPTY_${BPN}-charmaps =3D &quot;1&quot;<br>&gt; meta/recipes-core/=
eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-gconvs =3D &quot;1&quot;<br>
&gt; meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-localeda=
tas =3D &quot;1&quot;<br>&gt; meta/recipes-graphics/pango/pango.inc:ALLOW_E=
MPTY_${BPN}-modules =3D &quot;1&quot;<br>&gt;<br>&gt; it seems that, with t=
he above packages, PN =3D BPN so, yes, either one<br>
&gt; would have worked, but is there a best practice? =C2=A0i would think t=
hat<br>&gt; using anything other than PN should be reserved for when it&#39=
;s<br>&gt; necessary, so that it&#39;s more aesthetically obvious that some=
thing<br>
&gt; different is happening.<br><br><br>This is needed when PN is altered e=
.g<br>When using BBCLASSEXTEND<br>&gt;<br>&gt; =C2=A0thoughts? =C2=A0yes, i=
 know it makes no functional difference. =C2=A0again,<br>&gt; i&#39;m just =
trying to codify best practices.<br>
&gt;<br>&gt; rday<br>&gt;<br>&gt; --<br>&gt;<br>&gt; =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; Robert P. J. Day =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ottawa, Ontario, CANADA<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://crashcourse.ca">http://crashcourse.ca</a><br>
&gt;<br>&gt; Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://twitter.com/rpjday">http://twitter.com/rpjday</a><=
br>&gt; LinkedIn: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ca.linke=
din.com/in/rpjday">http://ca.linkedin.com/in/rpjday</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>&gt;<br>&gt; _______________________________________________<br>&gt; Opene=
mbedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists=
.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec517a71c24224004c39f9235--
