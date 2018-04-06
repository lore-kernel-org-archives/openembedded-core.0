Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id E070A7544B;
	Fri,  6 Apr 2018 18:16:14 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id m7-v6so2145082otd.1;
	Fri, 06 Apr 2018 11:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tvg3L7K3cSrnbRd4JdHUTFbVVUtNBtux1LBKN9RSYB4=;
	b=NSBnC61MY+n6hnUfd0HmUpZEh9UYz4x7TZgX9RS91PyOcMMTwflWq5c1hanmH0cic9
	zSyvO2YNrxo8sKvsfV2uX7IiapM6QKM/M3CgI6rBT3Gt+TiMqg83m8/SxR7QNCml6e1R
	AVrMxKZIZucNIPktKwrStOApxVq5Jch701oyWk1UNAcv0PG5VzCPbunl+pFY94ZysJ7V
	lcyhc1SoBmgpkLWJa2dtiBxaKABBmoMba1477+QuYCLP8iKThcejgeJTzRBKTAkeil1o
	xOgduv4kXEIe8nuK//s5mXMV/Z8bDYkiAGOnfiZwGg/AlMOfE/zSpd1ND11uzAcseX4A
	TZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tvg3L7K3cSrnbRd4JdHUTFbVVUtNBtux1LBKN9RSYB4=;
	b=RgMy3W+NUBBhynSiNv0PbkeOvtnuY8B9pW77Dk3dcU3ztKJ1Cq3R06EKvQKIgiNE6d
	yx9gzlZwaf6xpSCIfaJKaxtc6O7mNCS2DfsecRsiJFgsbzZ4pyVZ1DPVfEFSsXg7Vqdn
	q+YWhSiiQPUrxBZz6xo0WPGX30N2VLFTtgH259/hH+Y0s/HqdihNZSuJsJS7gI4/KhQM
	sesIcQJ2knmhI8goLqm7QZNQOJSW75MpWmlqoSgyLSWoTuKEzoushJ03ekYW7b/vWmu9
	npHtWdvrp4IagB0yvhLDOYiQMmAva5dDCO7hzxfFl96VXvauqwu+gclSazOnWxjmr2Nm
	hETg==
X-Gm-Message-State: ALQs6tAVntLHbV65h49wReyJ33BpcY6JOwdltp5ukJBlP6XSQvDvUoDk
	QcPVPXYJOc4DILG8xUzMPyqzswWqL41rE0E4h2E=
X-Google-Smtp-Source: AIpwx48Zkb7VAna5nrMz3VlsqP4dtF92VGxFdkingKFPdzD/koA6ns0lnZvkroXHbKThPgCp7FZyWb3SjDmxooCF3Ew=
X-Received: by 2002:a9d:3c55:: with SMTP id
	j21-v6mr16202088ote.51.1523038575716; 
	Fri, 06 Apr 2018 11:16:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:256a:0:0:0:0:0 with HTTP;
	Fri, 6 Apr 2018 11:16:15 -0700 (PDT)
In-Reply-To: <1523028587.2942.13.camel@linuxfoundation.org>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 6 Apr 2018 11:16:15 -0700
Message-ID: <CAFNP8Os_Zn-yLT_cZ7fQ8JLjOP8ERDSuA9YOsxQO7LJXDUb68g@mail.gmail.com>
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
X-List-Received-Date: Fri, 06 Apr 2018 18:16:15 -0000
Content-Type: multipart/alternative; boundary="00000000000048ef5c0569320d03"

--00000000000048ef5c0569320d03
Content-Type: text/plain; charset="UTF-8"

We have this variable appearing in a couple manuals BTW.  If anyone has any
feedback on what is being said here I can update.

Thanks,
Scott

https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYERSERIES_COMPAT
https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#creating-your-own-layer



On Fri, Apr 6, 2018 at 8:29 AM, Richard Purdie <
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

--00000000000048ef5c0569320d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>We have this variable appearing in a couple manu=
als BTW.=C2=A0 If anyone has any feedback on what is being said here I can =
update.<br><br></div>Thanks,<br></div>Scott<br><br><a href=3D"https://www.y=
octoproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYERSERIES_COMPAT"=
>https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYER=
SERIES_COMPAT</a><br><a href=3D"https://www.yoctoproject.org/docs/2.5/dev-m=
anual/dev-manual.html#creating-your-own-layer">https://www.yoctoproject.org=
/docs/2.5/dev-manual/dev-manual.html#creating-your-own-layer</a><br><br><br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Ap=
r 6, 2018 at 8:29 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Fri, 2018-04-06 at 10:16 -0400, Trevor Woerner wrote:<br>
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

--00000000000048ef5c0569320d03--
