Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id AE2E17829F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:57:21 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id y129so2331697pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=d5avHokEZu2iX5gDzzh6vUDaseqlture3YK0GVuT85c=;
	b=jn0xx9TnxIYt1taBPvL+R+Gq68E5HWMmaJDtnsZy83vF4Rzz/Y3PeXpw/cT+RSiwWN
	GVQvLd78+0g+6EnoF/5JIThNnLYH4vmejUDxfjmhfAhG487jdh/ez5uu0WJLo3gWfsvv
	ETiqxKzGQjhE49PmBy4ql7b9BIjvZDo6ihi4I/0E4NlWqCQdECYCBbfjHabAfIq0X+GD
	Z+HFeB0kTcOdt9UuQP92LRoLp6trS4fbMqYW/fs6NmI1A9TtfNdMf3t/WSNI1j9oEqkD
	TYWhUyrrA7w3CbYGh/+XK+o16gWzE3qmbJuhfXS4XC9y1+vuLRxVxGvJzu/LVXYSZ0qH
	68rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=d5avHokEZu2iX5gDzzh6vUDaseqlture3YK0GVuT85c=;
	b=m9yWtouwJQ69ndOxW2atXZQ1vPW5Oqu7sCpy1XgZNZw0vb4AooSGd0F5T0CPH9i5oQ
	GyjqIl4EdVC1Wec0CuboZfC341akSX0euTIM3j/EXedPUcY5Zk9DqigTgK4BpDraroLX
	9zpUyFxhnIsXwr/Wxs4+BN5nxtVToZ11tGhxXqGCHwPyxprGwKM9x/BFj4sr92gmPr7K
	Ow3C/E5Uz6bU8UtAgU/EOtAV9qqIRsxM6kP0apjHkQtXETfGoJLGrRHXQF7kDs/yVYcR
	Lf81R4b/coi1jTHa9D7O6ioA0tVvLRhjvK5wrdFmR9QZqBKBQFXFDITOzwCB/agCXb5l
	74Cg==
X-Gm-Message-State: AHYfb5g9KbHntXLHisBzi+D+5z9Hayu4EEoMfDPWuxQib36y6hyCHNru
	5zLzCYJmPXQXcIqJB2jlPAZ3kgIH+w==
X-Received: by 10.84.216.75 with SMTP id f11mr3700804plj.444.1503507442582;
	Wed, 23 Aug 2017 09:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <352435b6-964b-505d-ceba-ffb5f8bd00ea@windriver.com>
	<d82dd608-8d33-fdb0-73de-79333f80fa60@windriver.com>
In-Reply-To: <d82dd608-8d33-fdb0-73de-79333f80fa60@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2017 16:57:11 +0000
Message-ID: <CAMKF1srbnYTRGX_OfOcG+PHFHqV0--rArZdqPrxZd7x8-PbW-A@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pkgconfig vs pkgconf
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
X-List-Received-Date: Wed, 23 Aug 2017 16:57:21 -0000
Content-Type: multipart/alternative; boundary="f403045c6b64084c2105576e9b7b"

--f403045c6b64084c2105576e9b7b
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 9:19 AM Mark Hatle <mark.hatle@windriver.com> wrote:

> On 8/23/17 10:46 AM, Mark Hatle wrote:
> > As of this morning, I'm not getting a warning about a preferred provider
> being
>
> typo.. 'I'm -NOW- getting a warning'
>
> sorry for the confusion...
>
> > necessary to differentiate between pkgconfig and pkgconf.
> >
> > I've set the following to make it "go away".  But I assume we need to
> set a
> > default somewhere in the system...
> >
> > PREFERRED_PROVIDER_pkconfig = "pkgconfig"
> > PREFERRED_PROVIDER_pkgconfig-native = "pkgconfig-native"
> >
> > PREFERRED_RPROVIDER_pkgconfig = "pkgconfig"
> >
>

How about nativesdk ? I filed a bug for this earlier

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c6b64084c2105576e9b7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Aug 23, 2017 =
at 9:19 AM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.=
hatle@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 8/23/17 10:46 AM, Mark Hatle wrote:<br>
&gt; As of this morning, I&#39;m not getting a warning about a preferred pr=
ovider being<br>
<br>
typo.. &#39;I&#39;m -NOW- getting a warning&#39;<br>
<br>
sorry for the confusion...<br>
<br>
&gt; necessary to differentiate between pkgconfig and pkgconf.<br>
&gt;<br>
&gt; I&#39;ve set the following to make it &quot;go away&quot;.=C2=A0 But I=
 assume we need to set a<br>
&gt; default somewhere in the system...<br>
&gt;<br>
&gt; PREFERRED_PROVIDER_pkconfig =3D &quot;pkgconfig&quot;<br>
&gt; PREFERRED_PROVIDER_pkgconfig-native =3D &quot;pkgconfig-native&quot;<b=
r>
&gt;<br>
&gt; PREFERRED_RPROVIDER_pkgconfig =3D &quot;pkgconfig&quot;<br>
&gt;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">How about native=
sdk ? I filed a bug for this earlier=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c6b64084c2105576e9b7b--
