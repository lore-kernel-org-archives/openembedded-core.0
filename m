Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 42B85781F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:25:06 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id v17so70651914qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4w0bEPt/d7pHtC23KRUP/5PHLnJw2ziL2zOlGXc9+Hk=;
	b=hqrkX65sB814wgGAGPhJA24QMBxJ0XWvsK3LqVc30dwfSElFTJMbvuUcXNKJ131CTj
	8xmi5JKwCHyRXPkPgjTUmBSf5r0lt0PwOxx1QSu2NlGzVFC1HoR6kwxhHVvQ1umAUvJG
	SxzCzrR8ls6K87FeGYRgDCFIxjoZau7H+F/oRlyCo6W7/NlR+U5c89p/f5hHKccQzfB3
	LFXNqVJpxiuDxaLQgOCeucSij9Ms1nwZ75tf6t4rroGRmwd+TIuSeFmiW1TCIhGVe6Bw
	Sd8uiF6WAG+aNJLp7T/8C1UQYMpsGd7NnyercQ8fz7am7+Ws39jTjpnA8bY2k2geN1GG
	PT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4w0bEPt/d7pHtC23KRUP/5PHLnJw2ziL2zOlGXc9+Hk=;
	b=qSdvAfQVK1SMBiKAPQvLVedJLOCIgY+A1xG6fsBWh3WFTLFUPonSjrOgy0Cvbrvwoe
	y+54eE4SmTM6ae+O7jQqSO/l2iUuBkFchOCdtUXgZcv1GoNZIKwHMMO3sC44fR2z5Ird
	6xBUDaq0wvx2qCtNHCqP7kVL26ipoS/1W3nwB4FBRHCA100sHDvLeM7ZI0yiI2So2+dR
	lweDTNw8zf/O5FRi+0i+iulzv7YawBPAEjt7QHVdsJh5uIpRAcWJHQ9fwvxE4grHaEpS
	FBNYtwrceCmHzqZz59rQ8FtBIl0BtgijiPlk13YvJ3azy/DQ2u95+9m3f1ubUTgq5PFm
	wwLg==
X-Gm-Message-State: AIVw1123EwuaDaMQ69laTfxCNHO+o9kY6StyWQVHxcSj27nwO0YnA8Il
	oSaYrnKe3dc2hW4sjptawalVfB+bLg==
X-Received: by 10.55.31.76 with SMTP id f73mr12404522qkf.85.1500042307831;
	Fri, 14 Jul 2017 07:25:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.6 with HTTP; Fri, 14 Jul 2017 07:24:47 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1707140547090.12072@localhost.localdomain>
References: <alpine.LFD.2.20.1707140547090.12072@localhost.localdomain>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 14 Jul 2017 07:24:47 -0700
Message-ID: <CABcZAN=DimUEqjJTNzrh69aCWXx+SrVy2=2pKypPiN+9vOqRLg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: two identically-named machine .conf files in two different layers?
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
X-List-Received-Date: Fri, 14 Jul 2017 14:25:07 -0000
Content-Type: multipart/alternative; boundary="001a1147d536e80dab055447d0fb"

--001a1147d536e80dab055447d0fb
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 14, 2017 at 2:50 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   just ran across someone else's OE work, where he pulled in a
> standard layer that defined a machine, call it "machine.conf", then
> added an internal layer with some tweaks but *also* contained a
> machine definition file named precisely "machine.conf", which was just
> the original file with some edits. so it wasn't extending or modifying
> the original machine.conf, it was meant to completely override it.
>
>   i was a bit confused as i'm not sure what even happens in a
> situation like that. does one take precedence over the other based on
> layer priority? or what?
>

Config files and classes are pulled in via relative paths, which are always
found via BBPATH, which in turn is defined based on layer.conf files. Since
any sane layer.conf file will append to BBPATH, BBPATH ends up obeying the
same order as BBLAYERS.

If you want layer A to override a config file or class in layer B, put
layer A before layer B in BBLAYERS in conf/bblayers.conf.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1147d536e80dab055447d0fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 14, 2017 at 2:50 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 just ran across someone else&#39;s OE work, where he pulled in a<br>
standard layer that defined a machine, call it &quot;machine.conf&quot;, th=
en<br>
added an internal layer with some tweaks but *also* contained a<br>
machine definition file named precisely &quot;machine.conf&quot;, which was=
 just<br>
the original file with some edits. so it wasn&#39;t extending or modifying<=
br>
the original machine.conf, it was meant to completely override it.<br>
<br>
=C2=A0 i was a bit confused as i&#39;m not sure what even happens in a<br>
situation like that. does one take precedence over the other based on<br>
layer priority? or what?<br></blockquote><div>=C2=A0</div><div>Config files=
 and classes are pulled in via relative paths, which are always found via B=
BPATH, which in turn is defined based on layer.conf files. Since any sane l=
ayer.conf file will append to BBPATH, BBPATH ends up obeying the same order=
 as BBLAYERS.</div><div><br></div><div>If you want layer A to override a co=
nfig file or class in layer B, put layer A before layer B in BBLAYERS in co=
nf/bblayers.conf.</div></div>-- <br><div class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>
</div></div>

--001a1147d536e80dab055447d0fb--
