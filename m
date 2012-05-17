Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SUvfZ-00055Y-Cn
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 10:02:45 +0200
Received: by yhjj56 with SMTP id j56so1728720yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=teXq5sSO+5+TdfBoj6WAbwKij9NOH9Ygj/zhFIvctrA=;
	b=LyJ5314SxmVTiu8LfDHzfEg7xWYFVZC9rkMNNntw3mi7WEQJNB3F9ydLP6rGjob297
	JhcbXb2YhpLs9EOHWsaLNWSiLFHn8xfthxwe+ZrQsoBuslsy2zx4roIm4O4C6g/arfN3
	UXDqSSxyOMXIXRffC30uJ3xVFJdI/E10+v7BaDYyLcQ73sE/2P/9AQUspHGVvjIXEqKE
	lMoC/HQEYUX3MgWXa2ZQoiBuZ4uV7ZRD5AB4K0miXyFQ3L7zZ7DKXj1agnaw7gOHDzra
	nbgZo2LbcTmkXYApw2jXIhIavfEuROm/zr/GkNGJ+/6U5Dj690hGgUbMChlfjOW51oJL
	irGg==
MIME-Version: 1.0
Received: by 10.50.163.37 with SMTP id yf5mr4420694igb.40.1337241162224; Thu,
	17 May 2012 00:52:42 -0700 (PDT)
Received: by 10.64.25.18 with HTTP; Thu, 17 May 2012 00:52:42 -0700 (PDT)
X-Originating-IP: [109.166.131.71]
Received: by 10.64.25.18 with HTTP; Thu, 17 May 2012 00:52:42 -0700 (PDT)
In-Reply-To: <3971F75E-21A4-4BB6-92BE-888FFC716BD1@dominion.thruhere.net>
References: <cover.1337114347.git.otavio@ossystems.com.br>
	<1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
	<3971F75E-21A4-4BB6-92BE-888FFC716BD1@dominion.thruhere.net>
Date: Thu, 17 May 2012 10:52:42 +0300
Message-ID: <CAK18fxG4fV-aR8DTNzx8k2XzgVadHHMJeFQRuB3sK08bFtc_JQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkJc1zXFb1NTGpnQjoUIGyUuFt6IrM9oeWsSywBPlVOxka/GExrU3JI8Tt+o3msKghL0LuJ
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Thu, 17 May 2012 08:02:45 -0000
Content-Type: multipart/alternative; boundary=e89a8f646a8b7415e004c036b842

--e89a8f646a8b7415e004c036b842
Content-Type: text/plain; charset=ISO-8859-1

Yes. I need this too. Hope it will make it soon.
On May 17, 2012 10:49 AM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:

>
> Op 15 mei 2012, om 22:39 heeft Otavio Salvador het volgende geschreven:
>
> > The pkgconfig files need to be installed in ${libdir} instead of
> > ${base_libdir}.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
>
> Udev have been broken for a week now, can this please to in ASAP?
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f646a8b7415e004c036b842
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Yes. I need this too. Hope it will make it soon.</p>
<div class=3D"gmail_quote">On May 17, 2012 10:49 AM, &quot;Koen Kooi&quot; =
&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.ne=
t</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Op 15 mei 2012, om 22:39 heeft Otavio Salvador het volgende geschreven:<br>
<br>
&gt; The pkgconfig files need to be installed in ${libdir} instead of<br>
&gt; ${base_libdir}.<br>
&gt;<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;<br>
<br>
Acked-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@=
dominion.thruhere.net</a>&gt;<br>
<br>
Udev have been broken for a week now, can this please to in ASAP?<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div>

--e89a8f646a8b7415e004c036b842--
