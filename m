Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RGrH7-0004Jy-IK
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 13:59:05 +0200
Received: by vwe42 with SMTP id 42so1983172vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6RaGnfRMHa0RGURcwIGWh9jORVNXCIJd5aOSfDIEYvs=;
	b=HXPzqspeWBuKJzIsLa19cqbh+hW5/kxU2POg5GlbWC3erD9hkWgYi2v5fgUDI+OJDo
	ZRhwMBY5Y0UG6zLhl1QiCLsWTAgR2I2C3KY1/3EjSlPNZu4pQPHl0BSPsCuSSB26fLno
	tYW7e3l2oShIvu+zeZ5S0FVDRe7sxdMPXoYoo=
MIME-Version: 1.0
Received: by 10.52.29.9 with SMTP id f9mr10298102vdh.30.1319111593138; Thu, 20
	Oct 2011 04:53:13 -0700 (PDT)
Received: by 10.52.107.40 with HTTP; Thu, 20 Oct 2011 04:53:13 -0700 (PDT)
In-Reply-To: <46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
	<67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
	<1319109715.16061.4.camel@ted>
	<46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 13:53:13 +0200
Message-ID: <CACW_hTa0Vke_VUP2szxyr0fLcQgJ=bw0dvj1phmNhYntaro_7g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 20 Oct 2011 11:59:05 -0000
Content-Type: multipart/alternative; boundary=20cf307cfd4eed980d04afb999b0

--20cf307cfd4eed980d04afb999b0
Content-Type: text/plain; charset=ISO-8859-1

2011/10/20 Koen Kooi <koen@dominion.thruhere.net>

>
> Op 20 okt. 2011, om 13:21 heeft Richard Purdie het volgende geschreven:
>
> > On Thu, 2011-10-20 at 08:23 +0200, Koen Kooi wrote:
> >> Op 28 sep. 2011, om 22:04 heeft Otavio Salvador het volgende geschreven:
> >>
> >>> On Wed, Sep 28, 2011 at 16:50, Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>> This patch improves the current situation and I don't foresee the
> >>>>> autoPR code working soon
> >>>>
> >>>> Which is why we need to switch to that model and shake out the issues
> >>>> sooner than later. Enough is enough with the PR madness and we need to
> >>>> get to grips and fix it.
> >>>
> >>> I fully agree this is the way to go but this doesn't mean we ought to
> >>> hold this patch until all this happens. This patch allows the removal
> >>> of the kernel.bbclass from meta-oe so reducing the delta between
> >>> oe-core and meta-oe.
> >>
> >> So a month later and no sign of the mythical working
> >> auto-PR-incrementer or work on it.
> >
> > A month where we were stabilising for a release. Its on the 1.2 feature
> > list and as it happens I've been hearing questions about what is needed
> > here.
> >
> >> So can this patch go in? It would mean we can drop kernel.bbclass
> >> from meta-oe.
> >
> > I *HATE* this PR bumping stuff. I've just been told we likely need to
> > bump the PR for anything using libGL which once again shows that build
> > system basically failing to automate building things.
> >
> > So I'm drawing a line here and no, we can't take this. If its fine to
> > expect people to bump PR values manually for lib* changes, its fine for
> > kernels too. I'd suggest you do drop this from meta-oe and we start
> > building up pressure for the problem to get fixed properly rather than
> > letting people wallpaper over the cracks.
>
> I have products to ship, so treating meta-oe as a plaything and break this
> for the sake of breaking it is unacceptable. I'll let oe-core have the
> monopoly on high-qualitily, but broken metadata.
> .
>

Didn't we have a TSC to escalate discussions and disagreements between
developers to???

Best regards, Frans

--20cf307cfd4eed980d04afb999b0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/10/20 Koen Kooi <span dir=3D"ltr">&=
lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net=
</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">
<br>
Op 20 okt. 2011, om 13:21 heeft Richard Purdie het volgende geschreven:<br>
<div><div></div><div class=3D"h5"><br>
&gt; On Thu, 2011-10-20 at 08:23 +0200, Koen Kooi wrote:<br>
&gt;&gt; Op 28 sep. 2011, om 22:04 heeft Otavio Salvador het volgende gesch=
reven:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Wed, Sep 28, 2011 at 16:50, Richard Purdie<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; This patch improves the current situation and I don&#3=
9;t foresee the<br>
&gt;&gt;&gt;&gt;&gt; autoPR code working soon<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Which is why we need to switch to that model and shake out=
 the issues<br>
&gt;&gt;&gt;&gt; sooner than later. Enough is enough with the PR madness an=
d we need to<br>
&gt;&gt;&gt;&gt; get to grips and fix it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I fully agree this is the way to go but this doesn&#39;t mean =
we ought to<br>
&gt;&gt;&gt; hold this patch until all this happens. This patch allows the =
removal<br>
&gt;&gt;&gt; of the kernel.bbclass from meta-oe so reducing the delta betwe=
en<br>
&gt;&gt;&gt; oe-core and meta-oe.<br>
&gt;&gt;<br>
&gt;&gt; So a month later and no sign of the mythical working<br>
&gt;&gt; auto-PR-incrementer or work on it.<br>
&gt;<br>
&gt; A month where we were stabilising for a release. Its on the 1.2 featur=
e<br>
&gt; list and as it happens I&#39;ve been hearing questions about what is n=
eeded<br>
&gt; here.<br>
&gt;<br>
&gt;&gt; So can this patch go in? It would mean we can drop kernel.bbclass<=
br>
&gt;&gt; from meta-oe.<br>
&gt;<br>
&gt; I *HATE* this PR bumping stuff. I&#39;ve just been told we likely need=
 to<br>
&gt; bump the PR for anything using libGL which once again shows that build=
<br>
&gt; system basically failing to automate building things.<br>
&gt;<br>
&gt; So I&#39;m drawing a line here and no, we can&#39;t take this. If its =
fine to<br>
&gt; expect people to bump PR values manually for lib* changes, its fine fo=
r<br>
&gt; kernels too. I&#39;d suggest you do drop this from meta-oe and we star=
t<br>
&gt; building up pressure for the problem to get fixed properly rather than=
<br>
&gt; letting people wallpaper over the cracks.<br>
<br>
</div></div>I have products to ship, so treating meta-oe as a plaything and=
 break this for the sake of breaking it is unacceptable. I&#39;ll let oe-co=
re have the monopoly on high-qualitily, but broken metadata.<br>
<div><div></div><div>.<br></div></div></blockquote><div><br>Didn&#39;t we h=
ave a TSC to escalate discussions and disagreements between developers to??=
?<br><br>Best regards, Frans<br></div></div>

--20cf307cfd4eed980d04afb999b0--
