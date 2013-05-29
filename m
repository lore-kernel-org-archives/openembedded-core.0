Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 13FF86A592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 13:41:36 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j6so11653742oag.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 06:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/MIwFPZl1tFNShcQygSxm3oZ9KVed2f6LHl00kSF+u0=;
	b=DsNxC7e7MX6+ay3sCtpmlfcxxEKx32pMBDSqHQSHEQi3HUzwKEmLU6oVQ3yZbyj49t
	0F+peSM8sSf9EyCloJ6cZdWjp0oU4eup4dSVZTtl9tA8VnKvjNe29YML3KEyy+sGxGla
	sYdrBvlZCMjBu/dYWMRa7hLi7R+1vPz+O9W0iKqAAUN+1SHCJKRa84V3C6lPbH725U1v
	E6XHu4iCFeELfXliAoCTVTzy+dEj5Mtmo86RmpmIzEc6q/pl2ey0rR3Wzl/SDxap2JI3
	H6IaoKY+QkBJ97uEc1+Fum0YTaR+TCBCHhwU7aWc3gsBNucmnnJhjPIkk7MMd0AzJX0W
	hX1Q==
X-Received: by 10.60.85.39 with SMTP id e7mr1621241oez.94.1369834896797; Wed,
	29 May 2013 06:41:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.225.230 with HTTP; Wed, 29 May 2013 06:41:16 -0700 (PDT)
In-Reply-To: <1369820495.14887.214.camel@ted>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
	<1369227075.6695.89.camel@phil-desktop.brightsign>
	<CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
	<1369820495.14887.214.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 29 May 2013 16:41:16 +0300
Message-ID: <CAMZjud2a1_xUbpfhA9CaKzeqHVch9tcn=ypEXFjE1_1Lm+NsHw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkaSb6lRvBpbc7YkBF+3JDusF6RsG+Sw78x0jEy+ahGYDhjb4NDH5y5dukZQ3zBFiVUVG0E
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 29 May 2013 13:41:36 -0000
Content-Type: multipart/alternative; boundary=089e0111b6aa6d10f804dddb8a32

--089e0111b6aa6d10f804dddb8a32
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 12:41 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-05-22 at 14:41 +0100, Burton, Ross wrote:
> > On 22 May 2013 13:51, Phil Blundell <pb@pbcl.net> wrote:
> > > I had thought we had virtual-gconv-ENCODING providers but apparently
> > > that's not the case.  So I think the answer at the moment is probably
> > > no.  I guess we should add something like that.
> >
> > Agreed.  Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=4530.
>
> I'd really like to at least get the partial fix merged for this. How
> about we make this a libc class override? We can use the target override
> too, something like:
>
> RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
>
> should work?
>

This seems to be the best option for now, thanks for the suggestion. I've
sent a patch that implements this solution.

Thanks,
Bogdan


>
> We have the open bug to address the core provider issue.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0111b6aa6d10f804dddb8a32
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 29, 2013 at 12:41 PM, Richard Purdie <span dir=3D"ltr">=
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Wed, 2013-05-22 at 14:41 +0100, Burto=
n, Ross wrote:<br>


&gt; On 22 May 2013 13:51, Phil Blundell &lt;<a href=3D"mailto:pb@pbcl.net"=
>pb@pbcl.net</a>&gt; wrote:<br>
&gt; &gt; I had thought we had virtual-gconv-ENCODING providers but apparen=
tly<br>
&gt; &gt; that&#39;s not the case. =A0So I think the answer at the moment i=
s probably<br>
&gt; &gt; no. =A0I guess we should add something like that.<br>
&gt;<br>
&gt; Agreed. =A0Filed <a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D4530" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D4530</a>.<br>
<br>
</div>I&#39;d really like to at least get the partial fix merged for this. =
How<br>
about we make this a libc class override? We can use the target override<br=
>
too, something like:<br>
<br>
RDEPENDS_${PN}_append_libc-glibc_class-target =3D &quot;glibc-gconv-iso8859=
-1&quot;<br>
<br>
should work?<br></blockquote><div><br></div><div>This seems to be the best =
option for now, thanks for the suggestion. I&#39;ve sent a patch that imple=
ments this solution.</div><div><br></div><div>Thanks,</div><div>Bogdan</div=
>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
<br>
We have the open bug to address the core provider issue.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div><br></div></div>

--089e0111b6aa6d10f804dddb8a32--
