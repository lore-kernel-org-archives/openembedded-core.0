Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id C42DE7864B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:27:43 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id c16so9373313itc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=14LzzKkjgYeO6uyWAejREnZndhY3LRiNZgf+vJoVZZ8=;
	b=1pg3sOmbZfRaIJOIOd0o78o1a0ODcWkceyjpFwyOMqrBgThRCNg13lbGdDrB8DYP+x
	cPApjDHJeJ54fOfhBbORo4UfjEBcfTnIFKDb2FWqP+U7Ilz9YBxHM0pAFXUVEyyD3uPL
	2KlFVDJJ+xy88NsTePu3G/zkc/2885hEtJb3PTssiR1V9U5hBQtUODU9VW7Fc+ElGeLY
	YL0MM2qZ5Ve9Uu/bBw/jrGOmEAA1BwgxozLgvmkfuvs1QSyJwOX0ADeaTaJQj+JoMZuK
	qC7xxjRj4ucf7TZja0mIUE6EMhUofH3eeELjg+4jiM62juVdHXyoESbBZI17HHWIfYlS
	IzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=14LzzKkjgYeO6uyWAejREnZndhY3LRiNZgf+vJoVZZ8=;
	b=ifTxOnpbAtAJ2Mbt5/d1hlQyRu6WqW/E9juMjuMe1A7GfwaLQBA8R5jdyjXbvE56oH
	0e9RJILlzHjCk4gDoSFCmaLw25JCiIqZ9T0skCNhfunVgNtfwMre607yWk+INYZcjOzr
	av4kXq0rMJVkJbbjjoHtiaW4oRzjasTwh7c83EDZyIyC3dsgmhnL+3LoZQLGKA1LGBGu
	gzolCSBRkmSaUdDViZqOc9rSVA4BKqNK6erLrWNMrlQtBJvyBXv4//gOTlhiAnfrS8F2
	DlLCz1K8b6co6y2q8Ylrg0KIrzbgyo0UnEvFpWxgYRbeR/Ocyn90exroyb+VQRUyl8fn
	WGzQ==
X-Gm-Message-State: AKwxyte7NAT95MpIcwGrIQO5UiPZb2Dqo+0U1I7OgMJU6G7khoTeNxV1
	jXQeQNhB/d+741EnCXisn6qD6gzmI8zabWywUUNklw==
X-Google-Smtp-Source: ACJfBouZDo64CatoZhlLeMsKE55Xc4cBzLNA0+eQYmz2p557+O5XDY6oc1MRg6qJC0Y3nFblBi06FWaae+B4n3/sMXc=
X-Received: by 10.36.85.206 with SMTP id e197mr15926667itb.124.1516199264900; 
	Wed, 17 Jan 2018 06:27:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 06:27:24 -0800 (PST)
In-Reply-To: <CAP9ODKovqG0rzUPTrv4gHgCJCRH16vpY8bOQeUxPHKtoUNH3RQ@mail.gmail.com>
References: <20180117131155.2297-1-otavio@ossystems.com.br>
	<20180117131155.2297-3-otavio@ossystems.com.br>
	<CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
	<CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
	<CAJTo0LaMzcg4uWMDO8kQw2-OVuGAAAg6MF4m6E-mz4kJJRAxuw@mail.gmail.com>
	<CAP9ODKovqG0rzUPTrv4gHgCJCRH16vpY8bOQeUxPHKtoUNH3RQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 14:27:24 +0000
Message-ID: <CAJTo0LbL9VJuHQvAbhLe20=DFT4EtSSimSS6cPjS0TRoahceMA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 14:27:43 -0000
Content-Type: multipart/alternative; boundary="001a1139924297ed4e0562f9a66d"

--001a1139924297ed4e0562f9a66d
Content-Type: text/plain; charset="UTF-8"

On 17 January 2018 at 13:34, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Wed, Jan 17, 2018 at 11:28 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 17 January 2018 at 13:22, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> >>
> >> I believe it is looking for the utils inside sysroot now. Do you think
> >> it makes sense to avoid the dependency?
> >
> >
> > Yes, we don't need to build it as make is in HOSTTOOLS.
> >
> > Can you just tell it where to find the make, or even better just tell it
> to
> > run "make"?
> >
> > (also, I've patches to switch cmake from make to ninja)
>
> Please send me your patches (or branch) so I send it all together. I
> will see if I find the change.


It was a RFC on the list yesterday.  Was hoping for some testing/feedback
on it.

Ross

--001a1139924297ed4e0562f9a66d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 January 2018 at 13:34, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Wed, Jan 17, 2018 at 11:28 AM, Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 17 January 2018 at 13:22, Otavio Salvador<br>
&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvado=
r@ossystems.<wbr>com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I believe it is looking for the utils inside sysroot now. Do you t=
hink<br>
&gt;&gt; it makes sense to avoid the dependency?<br>
&gt;<br>
&gt;<br>
&gt; Yes, we don&#39;t need to build it as make is in HOSTTOOLS.<br>
&gt;<br>
&gt; Can you just tell it where to find the make, or even better just tell =
it to<br>
&gt; run &quot;make&quot;?<br>
&gt;<br>
&gt; (also, I&#39;ve patches to switch cmake from make to ninja)<br>
<br>
</span>Please send me your patches (or branch) so I send it all together. I=
<br>
will see if I find the change.</blockquote><div><br></div><div>It was a RFC=
 on the list yesterday.=C2=A0 Was hoping for some testing/feedback on it.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1139924297ed4e0562f9a66d--
