Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5F73A611E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 20:33:13 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id p34so2066208qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rZRvDqVCR1bsE6o+qvrhBGTDNfnf/YWfzCVvWZdY0GI=;
	b=pS+FhNbeGIq/rd2zGBx/o17h9Ht3JzORSnx6Aa9fF/BT3fNfWYyUc1dQ558gzwUixP
	jLqwPde35fBz2p2PRgO7SYlRSO+YNQVd2Zn6aOcEEAsx3LW3ZMnGtTU3jNF4p54ByRCG
	HSodeWJy+zGNWabe67EOZigbZt4rN5XOAh2G1E9tailCdMzcJGnQGPvuzHMmbvdMgcE/
	r3UDoRXU7u8li87gt6mbJUY8oQ0MDRINc52Xln8w2l5QBprTZp9PFLt7Dr8F+jeMZC75
	ZGJMUI6q7kgyEYusL1l/JZfEt1mJw9DJbSLkuNPk4+/rzymPTFJTH2pGeinzJXWvci+H
	UF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rZRvDqVCR1bsE6o+qvrhBGTDNfnf/YWfzCVvWZdY0GI=;
	b=XfMyheIfYaf8EwGEPXPchfpQe5nthFMzanMOujUWLCe2eeizfvbLDslEXlmw2FKiBO
	fSy4G+cHqa/ryZMj41zVzWDSsvsBT7OHbGHgFxcfBrtqb7XMRTI+agc+/5kNye+O6eYv
	8HdUVkTOcjqY+gZKqLs48d1ZlgnC3r1oB+pOhfrekyLP7XN7aoLe0PKP8qBYlAzK1U2Z
	z4xUUGFqG2lUZ5n9+O3WDOs35nd8TEG4gVJveoBg2SCX3yT0g2WC9krmpEODokkaxi4U
	84qIXtUOzXSnG7H3gSF5tpQlc3g4UPA1cw628l9DOrCBev9+sPYAIcEaQZECH51lnvYU
	712g==
X-Gm-Message-State: APjAAAWe9PtWyZPYUjnsYIcTH+K9LGFtqZcpXzb6MPI7E9ftyXyl041t
	5P637BCI0+/uICuluNyzdgiEYKWsXITHtAENUsejThas
X-Google-Smtp-Source: APXvYqxaEzmZ1JUgrCUJUzd3I7kdxds57QFsk3bB5oZS8XOr4WJDBAX1lNFXvKRw3ZfowzTfwCvH1Lcc7yKWjqLBe2A=
X-Received: by 2002:ac8:4e3c:: with SMTP id d28mr28373699qtw.190.1582230793631;
	Thu, 20 Feb 2020 12:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
	<CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
In-Reply-To: <CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2020 12:33:01 -0800
Message-ID: <CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 20:33:13 -0000
Content-Type: multipart/alternative; boundary="000000000000683fd6059f07d037"

--000000000000683fd6059f07d037
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 12:24 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Thu, Feb 20, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
> wrote:
> >
> > On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > You need to at the same time drop the introspection enablement logic
> from EXTRA_OECMAKE I think?
> > > This line:
> > >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/web=
kit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70
> > >
> > > And for consistency, it would be good to do the same for gtk-doc.
> >
> > This is odd: I fell over this because there was no gir created. Did
> > not notice it was few lines below. Need to check that - maybe I am a
> > bit off-sync to master or something is wrong elsewhere.
> >
> > Will sync to master and send V2 then.
> >
> Finally had time to look into again. In the recipe there is
>
> GI_DATA_ENABLED_armv7a =3D "False"
> GI_DATA_ENABLED_armv7ve =3D "False"
>
> =3D> My patch is wrong it overrides above accidentally - thanks Alex!
>
> Since webkit builds gir fine (my machine is armv7ve) that does not
> seem necessary any more. I would like to send out a patch removing at
> least armv7ve - shall I take the risk to remove armv7a - maybe as two
> patches?


Perhaps just the part you are
Confident about

>
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000683fd6059f07d037
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 20, 2020 at 12:24 PM Andreas M=C3=BCller &lt;<a=
 href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Thu, Feb 20, 2020 at 1:45 P=
M Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com" target=
=3D"_blank">schnitzeltony@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; You need to at the same time drop the introspection enablement lo=
gic from EXTRA_OECMAKE I think?<br>
&gt; &gt; This line:<br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/me=
ta/recipes-sato/webkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70" rel=3D"nore=
ferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tr=
ee/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70</a><br>
&gt; &gt;<br>
&gt; &gt; And for consistency, it would be good to do the same for gtk-doc.=
<br>
&gt;<br>
&gt; This is odd: I fell over this because there was no gir created. Did<br=
>
&gt; not notice it was few lines below. Need to check that - maybe I am a<b=
r>
&gt; bit off-sync to master or something is wrong elsewhere.<br>
&gt;<br>
&gt; Will sync to master and send V2 then.<br>
&gt;<br>
Finally had time to look into again. In the recipe there is<br>
<br>
GI_DATA_ENABLED_armv7a =3D &quot;False&quot;<br>
GI_DATA_ENABLED_armv7ve =3D &quot;False&quot;<br>
<br>
=3D&gt; My patch is wrong it overrides above accidentally - thanks Alex!<br=
>
<br>
Since webkit builds gir fine (my machine is armv7ve) that does not<br>
seem necessary any more. I would like to send out a patch removing at<br>
least armv7ve - shall I take the risk to remove armv7a - maybe as two<br>
patches?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps =
just the part you are</div><div dir=3D"auto">Confident about=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
Andreas<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000683fd6059f07d037--
