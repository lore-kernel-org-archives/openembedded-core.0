Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFDF7C6F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:35:52 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id v83so14688045itf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 01:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5T+x9k0bTr/GCdeqB2/n11bNDYFsGxp5bfd73ZtOhhk=;
	b=b+KFxmJ8hlC385cXWYyldSdWMF8/EzxI2G3xSDIvNdltu5RDtKkcnBLQuKLeET8OuJ
	keS/tJ+D9CVMUMNaq5AFE72wV7OzE//6X9/s3QElD4QgWD1/BJlmushgZ+v3MHe6gdw7
	hQHPmexk5h+dxZ7Hg6jAUD7sygTdFbjGAWs9U+tIeJB/cTifYlaNfRykLSdILAj/fYKS
	/uDLZrFNVNiha7w9JA7Coh1YLOCq9AgzlPbGEjLcQ5lX7qsnKq5x/PBgn3kIr1DMJs1c
	HslMTSZynnsBO+Ibl1oQA3L3P2TvXke2+7iK7BCndxGvtwqv/uij6JCoPbjcKRHtOcyI
	zWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5T+x9k0bTr/GCdeqB2/n11bNDYFsGxp5bfd73ZtOhhk=;
	b=kAauv7Qb9aQJxTfQFPhoJPoc9GWypu/l/Jf4AvKoxBCD3FHlrfUFvctkBwAnnzzrVy
	5Fvmck3JoYt9tKmQWfVkT19Gogj18UljaRWgA3A/771Re0qjQleI7jFxNx1kxIuQBXii
	PHYv9JPviJ1dstEhQwRWuQSXQEMcoOCghU/n/G37wRDLb29L2xAuVGCAXg8qTnU4A5Fu
	htDxmBk2rYQkn+XIkcDH6SMF/kjpswdp0nrk0S5ROvnA1RrOqb6KJ4bUHtsKu24MGFrA
	q/lazNvViB1IxhMxPr9EQZ5fxRftS1vGeCfz3orcIIRR1ySYYEfCQayCNJsg9Huh4mD0
	yEZg==
X-Gm-Message-State: APjAAAX25NwRfqsAiCOQEhHnXOPqyuOGEQQdhYK1Bx+8z8tL32Uz13Uf
	tthxQkLBWi4p6gjCKM0yw2YnpI679B0JufTKcjA=
X-Google-Smtp-Source: APXvYqzUnUpFARkQMw94B/hNTvWaD/uK7YXPhUruaBCWwXz5GhhsJy6st4J0XRMv2rjEmAuSWazxmC6fHKBiiog5MdU=
X-Received: by 2002:a24:6d5:: with SMTP id 204mr2327026itv.122.1551346553957; 
	Thu, 28 Feb 2019 01:35:53 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
In-Reply-To: <CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 28 Feb 2019 10:35:42 +0100
Message-ID: <CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
To: Damien Riegel <damien.riegel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Thu, 28 Feb 2019 09:35:53 -0000
Content-Type: multipart/alternative; boundary="00000000000045b0620582f1045a"

--00000000000045b0620582f1045a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Damien,

With GO_LINKSHARED =3D "" it work fine.

I'm very new to Go, does it mean that there is a mixing issue in go modules
from Yocto and from node_exporter vendor folder, so it links wrongly at
runtime?

Thanks for the quickfix,
Vincent




Le mer. 27 f=C3=A9vr. 2019 =C3=A0 23:22, Damien Riegel <damien.riegel@gmail=
.com> a
=C3=A9crit :

> On Wed, 27 Feb 2019 at 12:10, Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Hello everyone,
> >
> > I'm trying to add node_exporter from Prometheus project to an Intel
> x86-64 machine.
> > I made the following recipe:
> >
> >
> https://github.com/nefethael/meta-random/blob/master/recipes-connectivity=
/prometheus/go-nodeexporter_0.18.0.bb
> >
> > node_exporter is crashing with multiple different runtime errors, so I
> raised an issue on github:
> > https://github.com/prometheus/node_exporter/issues/1244
>
> I've faced the same kind of issue with a custom application of ours.
> The fix was to add the following line to the recipe:
> GO_LINKSHARED =3D ""
>
> Let me know if that helps.
>
> Cheers,
> Damien
>

--00000000000045b0620582f1045a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>Hi Damien,</div><div><br></div><div>With=20
GO_LINKSHARED =3D &quot;&quot; it work fine.</div><div><br></div><div>I&#39=
;m very new to Go, does it mean that there is a mixing issue in go modules =
from Yocto and from node_exporter vendor folder, so it links wrongly at run=
time?</div><div><br></div><div>Thanks for the quickfix,</div><div>Vincent<b=
r></div><div><br></div><div><br></div><div><br> </div>

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Le=C2=A0mer. 27 f=C3=A9vr. 2019 =C3=A0=C2=A023:22, Damien Riegel &lt;<a hre=
f=3D"mailto:damien.riegel@gmail.com" target=3D"_blank">damien.riegel@gmail.=
com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, 27 Feb 2019 at 12:10, Vincent Prince<br>
&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">vincen=
t.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I&#39;m trying to add node_exporter from Prometheus project to an Inte=
l x86-64 machine.<br>
&gt; I made the following recipe:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/nefethael/meta-random/blob/master/recipe=
s-connectivity/prometheus/go-nodeexporter_0.18.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/nefethael/meta-random/blob/master/recipes=
-connectivity/prometheus/go-nodeexporter_0.18.0.bb</a><br>
&gt;<br>
&gt; node_exporter is crashing with multiple different runtime errors, so I=
 raised an issue on github:<br>
&gt; <a href=3D"https://github.com/prometheus/node_exporter/issues/1244" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/node_expor=
ter/issues/1244</a><br>
<br>
I&#39;ve faced the same kind of issue with a custom application of ours.<br=
>
The fix was to add the following line to the recipe:<br>
GO_LINKSHARED =3D &quot;&quot;<br>
<br>
Let me know if that helps.<br>
<br>
Cheers,<br>
Damien<br>
</blockquote></div>

--00000000000045b0620582f1045a--
