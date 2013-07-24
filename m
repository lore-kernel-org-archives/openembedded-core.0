Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 074CD605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:47:56 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id er7so3885971obc.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=URycIoFad3AkCXTppvdgTArs8BOBA1HnDxDAjwxTaN8=;
	b=uUqugsTeKmBwStx9lU+AxGFt0T5o8cpV4jjqXNGIaAkpOJ6/E8LEr7Zzjt2qvJvQMQ
	YgvFNJASDjQRgFElGZdxeFSs0hlqNsiGcE8mEMm7GHY+1Rc8K/DUDPVEyU2wSYZ7uMut
	yxWEgythx4LKwHGOiPQkUZEBcAcB0bQOG+Bwz7B/+r5SloE99LjPPuS72qdlykzToWWt
	7z7l7vVhZ616vok3c8iht1vtwXaTllYDlQvtEMk9vzDIRutYUO3R1Cop2FD+MvvAtR81
	MzHRT2aJmaNlZcx1ww2Rw04kuvcH1E+nXKpD2DW4o5Vw0QDSHGo/97ExlHOUxquovjNf
	oafw==
MIME-Version: 1.0
X-Received: by 10.60.123.10 with SMTP id lw10mr35350954oeb.102.1374655677012; 
	Wed, 24 Jul 2013 01:47:57 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Wed, 24 Jul 2013 01:47:56 -0700 (PDT)
In-Reply-To: <1374652108.28370.6.camel@firebird.rb.intel.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
Date: Wed, 24 Jul 2013 10:47:56 +0200
Message-ID: <CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 08:47:57 -0000
Content-Type: multipart/alternative; boundary=047d7b5d49ce5121e904e23df7d2

--047d7b5d49ce5121e904e23df7d2
Content-Type: text/plain; charset=ISO-8859-1

Many thanks for the quick reply Stefan,

For completion, I'm working on FC16.
Indeed (before sending the mail) I tried downloading the make rpm for FC17 (
rpmfind.net) and to use it
(accordingly unpackaged under my personal directory, updating the PATH)
with the same failure.
Can this sound strange for you?
As you know, which are the make versions Fedora has released for the
FC17/18?

I think at the moment the build of the buildtools-tarball will be the way
I'll follow, temporary disabling the sanity check.

Cheers,
Giuseppe

2013/7/24 Stanacar, StefanX <stefanx.stanacar@intel.com>

>
>
> On Wed, 2013-07-24 at 09:33 +0200, Giuseppe Condorelli wrote:
> > Hi All,
> >
> > given that the make v. 3.82 is broken, as the sanity check highlights,
> > which is the best solution
> > to allow Fedora users (as I am) to go ahead with the build?
> > I don't like to avoid sanity checks or to use an older version of
> > sanity.bbclass.
> > Please let me know, currently this issue is blocking for me.
> >
>
>
> Fedora pushed updates for make in F17 & 18 (19 wasn't broken afaik) so
> you should just update your system. (yum update make should do the
> trick).
>
> Alternatively you can bitbake buildtools-tarball on an working system
> (or disable the sanity check before, touch conf/sanity.conf) and install
> that on your system (if you are on F16 which isn't updated anymore)
>
> Cheers,
> Stefan
>
>
> > Cheers,
> > Giuseppe
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--047d7b5d49ce5121e904e23df7d2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Many thanks for the quick reply Stefan,</div><div>=A0</div><div>For co=
mpletion, I&#39;m working on FC16.</div><div>Indeed (before sending the mai=
l) I tried downloading the make rpm for FC17 (<a href=3D"http://rpmfind.net=
">rpmfind.net</a>) and to use it</div>
<div>(accordingly unpackaged under my personal directory, updating the PATH=
) with the same failure.</div><div>Can this sound strange for you?</div><di=
v>As you know, which are the make versions Fedora has released for the FC17=
/18?</div>
<div>=A0</div><div>I think at the moment the build of the buildtools-tarbal=
l will be the way I&#39;ll follow, temporary disabling the sanity check.</d=
iv><div>=A0</div><div>Cheers,</div><div>Giuseppe<br><br></div><div class=3D=
"gmail_quote">
2013/7/24 Stanacar, StefanX <span dir=3D"ltr">&lt;<a href=3D"mailto:stefanx=
.stanacar@intel.com" target=3D"_blank">stefanx.stanacar@intel.com</a>&gt;</=
span><br><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;bor=
der-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:sol=
id" class=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Wed, 2013-07-24 at 09:33 +0200, Giuseppe Condorelli wrote:<br>
&gt; Hi All,<br>
&gt;<br>
&gt; given that the make v. 3.82 is broken, as the sanity check highlights,=
<br>
&gt; which is the best solution<br>
&gt; to allow Fedora users (as I am) to go ahead with the build?<br>
&gt; I don&#39;t like to avoid sanity checks or to use an older version of<=
br>
&gt; sanity.bbclass.<br>
&gt; Please let me know, currently this issue is blocking for me.<br>
&gt;<br>
<br>
<br>
</div></div>Fedora pushed updates for make in F17 &amp; 18 (19 wasn&#39;t b=
roken afaik) so<br>
you should just update your system. (yum update make should do the<br>
trick).<br>
<br>
Alternatively you can bitbake buildtools-tarball on an working system<br>
(or disable the sanity check before, touch conf/sanity.conf) and install<br=
>
that on your system (if you are on F16 which isn&#39;t updated anymore)<br>
<br>
Cheers,<br>
Stefan<br>
<br>
<br>
&gt; Cheers,<br>
&gt; Giuseppe<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<br>
</blockquote></div><br>

--047d7b5d49ce5121e904e23df7d2--
