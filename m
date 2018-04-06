Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5085875455;
	Fri,  6 Apr 2018 18:25:06 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s12so2567520wrc.8;
	Fri, 06 Apr 2018 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kx/vpL2FIl0XiC8BtilPTTw7inNtZeU6HDC1xJXoszw=;
	b=Xs7lkuZs3Vp9BaPVKMMsR8w7Sh4rmZ5XUbrn4NTDb2Vx0vpgk+rVsXYS3199bhv6xp
	gWgh2nG3feJ3nzlxuxEdkMxnXKYIZB3vSl9ddbKu37Wr8RnWvfuQHEgHuQ6I8T3P6cZ0
	UaO4pQQa2TpyRnrZSYOGsjlTCqJwWU6CbHam5fk5hoTw4xkyEvCClLCE3YRyY1sOzxk9
	Mq7Pds9/untvf45yfMFnV0o7ARz7pgit47Dpe8Wv5zMlDJ5CfYTpo5nhopNHNDswM9LY
	4Z2cTG3MKT1xCMYGaX44LPho1VtAyAfOCGOZ7uBB2xUMn9yrIQOW46nAz28YPWmgoKRO
	ZTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kx/vpL2FIl0XiC8BtilPTTw7inNtZeU6HDC1xJXoszw=;
	b=k1yW0UBTGw0gcT9SjKhO3Eucgz85C7qLRuoU7PeI1GlA1bm/w4sXC2b/6vU1QdpnaC
	Qm2xCGCL0enENXBahXnYL5ccvOSywOWqSEpwONYBBJ0dj7/F/vpphVwP7Cd0MkHAS0uN
	0zn0NB4qE/MM1tCLdbr+05sP1Pj6GlMA4j8OPO8uJh7vD144DsrJWxpJZmRoIhlfZT83
	rOMOzgBhj/58i5XMY2MAlyPj88dRt39UO1zv5oL1wlM0GZxL5bRyHmdVVZR4B7tmaAZ4
	Lweni5ex01CIditCzdq+FX88Uxui7IuNnjs3pHIkAMkrSvbheMeqrWP0vCfVMj6Cs9IE
	0/rA==
X-Gm-Message-State: AElRT7G6p80cONovOkaUk+rKViuAJJ6F+eZ3DEVgktoeNFnW/2u3Rv2n
	D+y9tWN2V2YOnZR5/4P9s+Px15ZRNmCbFKONgqA=
X-Google-Smtp-Source: AIpwx4+eG593kgfrZnNPkl/rsOwb9lYaXb9RCsWiQyRmOZ7lEIgL1c9mgZtSJ2fzEfhE6EmnjT0fNuJPpQYM5PxGtvA=
X-Received: by 10.223.149.70 with SMTP id 64mr19218225wrs.223.1523039107705;
	Fri, 06 Apr 2018 11:25:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 6 Apr 2018 11:25:07 -0700 (PDT)
In-Reply-To: <1523028587.2942.13.camel@linuxfoundation.org>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Apr 2018 20:25:07 +0200
Message-ID: <CA+chaQdiX_GKXAfWJMMc_oZQ5XW-oiuxzxPyMEF2LKZ-rMgDgQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 18:25:07 -0000
Content-Type: multipart/alternative; boundary="94eb2c0df210fe72ff0569322ca3"

--94eb2c0df210fe72ff0569322ca3
Content-Type: text/plain; charset="UTF-8"

FWIW: I've updated some layers with this LAYERSERIES_COMPAT_<layer> today
and I think it's good idea.

It probably won't be enough to stop questions like this:
http://lists.openembedded.org/pipermail/openembedded-core/2018-April/149696.html

but it's still better to show warning first and then some often
harder-to-read exception or error log.

Updating layer.conf in meta-qt5 was a bit more tricky as people tend to mix
the meta-qt5 branches with different branches of other layers, just because
their requirements for Qt are often very different than for other layers
(e.g. many people still using meta-qt5/krogoth with Qt 5.6 because of the
license, even with much newer morty, pyro, rocko, sumo, master branches of
other layers and vice versa that someone is stuck with krogoth release for
whatever reason, but needs newer LTS Qt 5.9 from meta-qt5/rocko). So for
meta-qt5 I've used multiple values for LAYERSERIES_COMPAT_<layer> for
combinations I use somewhere (so that I cover at least some testing with
such uncommon combination) and I'm willing to accept more values to it if
someone really uses another combination regularly. The rest of combination
(like meta-qt5/krogoth with dizzy, which is usable as described in meta-qt5
commits which introduced incompatiblitites, will eventually trigger the
warning which is fine, because people should be aware that they are doing
something less tested and that they might to implement some work arounds to
make it usable).

Regards,

On Fri, Apr 6, 2018 at 5:29 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-04-06 at 10:16 -0400, Trevor Woerner wrote:
> > A) Some layers only switch to an official branch name when the find a
> > reason to. E.g. branch "sumo" is created on openembedded-core but
> > meta-A keeps working on master unless an incompatible change is
> > created in openembedded-core that forces meta-A to create a "sumo"
> > branch.
> >
> > B) Other layers create official branches the moment they exist. E.g.
> > branch "sumo" is created on openembedded-core and meta-B instantly
> > creates a "sumo" branch to mark this point in time, and continues
> > working on master. If meta-B's "sumo" branch fails to build against
> > openembedded-core's "sumo" branch because an incompatible change is
> > made to openembedded-core's sumo branch, meta-B fixes the issue on
> > the sumo branch.
> >
> >
> > I can see how the change you've implemented will be very useful for
> > the A)
> > cases. Will it be needed for the B) cases? In other words, does the
> > code
> > you're adding implicitly assume:
> >
> >       LAYERSERIES_COMPAT_<...> = "layer"
> >
> > for any given "layer"?
>
> No, there is no implicit assumption.
>
> In both A) and B) cases the maintainer adds the new "codename" to the
> list of compatible layer series in LAYERSERIES_COMPAT_<layer> for their
> layer. They can list multiple layers in there, e.g. "rocko sumo".
>
> The one annoying thing about all this is the layer maintainers do have
> to update layer.conf each time a new release codename comes out. I
> think that is a reasonable compromise to be able to give users a much
> better idea of which layers are compatible or incomaptible with their
> setup though. It means someone has looked at it and believes it will
> work with a given release series.
>
> Just to be clear, "layer" would never be a valid value there, it will
> always be the release/branch codenames.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>

--94eb2c0df210fe72ff0569322ca3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve updated some layers with this=C2=A0<span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">LAYERSERIES_COMPAT_&lt;layer&gt; today and I think it&#3=
9;s good idea.</span><div><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline"><br></span></div><div>=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">It probably won&#39;t be enough to stop question=
s like this:</span></div><div><span style=3D"text-align:start;text-indent:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline"><span style=3D"font-size:1=
2.8px"><a href=3D"http://lists.openembedded.org/pipermail/openembedded-core=
/2018-April/149696.html">http://lists.openembedded.org/pipermail/openembedd=
ed-core/2018-April/149696.html</a></span><br></span></div><div><span style=
=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><span style=3D"font-size:12.8px"><br></span></span></div><div><span=
 style=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial;float:none;di=
splay:inline"><span style=3D"font-size:12.8px">but it&#39;s still better to=
 show warning first and then some often harder-to-read exception or error l=
og.</span></span></div><div><br></div><div>Updating layer.conf in meta-qt5 =
was a bit more tricky as people tend to mix the meta-qt5 branches with diff=
erent branches of other layers, just because their requirements for Qt are =
often very different than for other layers (e.g. many people still using me=
ta-qt5/krogoth with Qt 5.6 because of the license, even with much newer mor=
ty, pyro, rocko, sumo, master branches of other layers and vice versa that =
someone is stuck with krogoth release for whatever reason, but needs newer =
LTS Qt 5.9 from meta-qt5/rocko). So for meta-qt5 I&#39;ve used multiple val=
ues for=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">LAYERSERIES_COMPAT_&lt;layer&gt; fo=
r combinations I use somewhere (so that I cover at least some testing with =
such uncommon combination) and I&#39;m willing to accept more values to it =
if someone really uses another combination regularly. The rest of combinati=
on (like meta-qt5/krogoth with dizzy, which is usable as described in meta-=
qt5 commits which introduced incompatiblitites, will eventually trigger the=
 warning which is fine, because people should be aware that they are doing =
something less tested and that they might to implement some work arounds to=
 make it usable).</span></div><div><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline"><br></span></=
div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">Regards,</span></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 5:29=
 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Fri, 2018-04-06 at 10:16 -0400, Trevor Woerner wrote:<br>
&gt; A) Some layers only switch to an official branch name when the find a<=
br>
&gt; reason to. E.g. branch &quot;sumo&quot; is created on openembedded-cor=
e but<br>
&gt; meta-A keeps working on master unless an incompatible change is<br>
&gt; created in openembedded-core that forces meta-A to create a &quot;sumo=
&quot;<br>
&gt; branch.<br>
&gt;<br>
&gt; B) Other layers create official branches the moment they exist. E.g.<b=
r>
&gt; branch &quot;sumo&quot; is created on openembedded-core and meta-B ins=
tantly<br>
&gt; creates a &quot;sumo&quot; branch to mark this point in time, and cont=
inues<br>
&gt; working on master. If meta-B&#39;s &quot;sumo&quot; branch fails to bu=
ild against<br>
&gt; openembedded-core&#39;s &quot;sumo&quot; branch because an incompatibl=
e change is<br>
&gt; made to openembedded-core&#39;s sumo branch, meta-B fixes the issue on=
<br>
&gt; the sumo branch.<br>
&gt;<br>
&gt;<br>
&gt; I can see how the change you&#39;ve implemented will be very useful fo=
r<br>
&gt; the A)<br>
&gt; cases. Will it be needed for the B) cases? In other words, does the<br=
>
&gt; code<br>
&gt; you&#39;re adding implicitly assume:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LAYERSERIES_COMPAT_&lt;...&gt; =3D &quot;lay=
er&quot;<br>
&gt;<br>
&gt; for any given &quot;layer&quot;?<br>
<br>
</span>No, there is no implicit assumption.<br>
<br>
In both A) and B) cases the maintainer adds the new &quot;codename&quot; to=
 the<br>
list of compatible layer series in=C2=A0LAYERSERIES_COMPAT_&lt;layer&gt; fo=
r their<br>
layer. They can list multiple layers in there, e.g. &quot;rocko sumo&quot;.=
<br>
<br>
The one annoying thing about all this is the layer maintainers do have<br>
to update layer.conf each time a new release codename comes out. I<br>
think that is a reasonable compromise to be able to give users a much<br>
better idea of which layers are compatible or incomaptible with their<br>
setup though. It means someone has looked at it and believes it will<br>
work with a given release series.<br>
<br>
Just to be clear, &quot;layer&quot; would never be a valid value there, it =
will<br>
always be the release/branch codenames.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<wbr>_________________<br>
Openembedded-architecture mailing list<br>
<a href=3D"mailto:Openembedded-architecture@lists.openembedded.org">Openemb=
edded-architecture@<wbr>lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-arch=
itecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.or=
g/<wbr>mailman/listinfo/openembedded-<wbr>architecture</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0df210fe72ff0569322ca3--
