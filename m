Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TEOfq-0003vP-C3
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 20:06:58 +0200
Received: by qadc11 with SMTP id c11so4556289qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+kgv5Dz9PM4eAyexqTSnZ+YG9mmkBLpbeYbuRnCIHn0=;
	b=rMrW0sKS4X4BgfRX3tdgb9OBmd3WRKsTAjQ3q8ByYqgR/zoT84m0dDYeVK6LN6XR+3
	ZC1Yio9ohgRvnPRzitLiThU75K3LfJ4KmkPffyKnDbSFOstEJFO0ystCgac/A6S33ujO
	UBa0KE404WqzccbuotQVRcldoNRhaqgV5XYWESI+R6dw4jcUa3FFZQRIbL3KkQTiikRg
	jETVHIIEIvmFpqfxmpgUdzGjLZnIpHrBj7UgSb5YAB+2o3HvOnE9Cv5kBfiS+7C3uDiL
	wJfcCUAyxR/YHd8FOAQsuUqQ8t0NYsbzm5+CbhKNv0+2rPa4STB07V4i8gCjfng2f+j/
	nkmw==
MIME-Version: 1.0
Received: by 10.224.39.147 with SMTP id g19mr8874585qae.46.1348077256467; Wed,
	19 Sep 2012 10:54:16 -0700 (PDT)
Received: by 10.224.174.19 with HTTP; Wed, 19 Sep 2012 10:54:16 -0700 (PDT)
In-Reply-To: <CAMKF1sr8_PN8p0H+35JqUAyKyDLFTij4etP47VEb613pOi11Tw@mail.gmail.com>
References: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
	<CAMKF1sr8_PN8p0H+35JqUAyKyDLFTij4etP47VEb613pOi11Tw@mail.gmail.com>
Date: Wed, 19 Sep 2012 18:54:16 +0100
Message-ID: <CAB3sqtb1fBxg0u=1RWL5m5aY1LLeBZwRe-Qb5eVf+R=UjjYBHg@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SVN checkout ERROR: Function failed: Fetcher failure for URL:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 18:06:58 -0000
Content-Type: multipart/alternative; boundary=20cf306f74d60063c304ca11b2aa

--20cf306f74d60063c304ca11b2aa
Content-Type: text/plain; charset=ISO-8859-1

I've tried with both protocol=http and without the argument at all. Still
not fetching!

On Wed, Sep 19, 2012 at 6:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Sep 19, 2012 at 9:48 AM, Tarek El-Sherbiny
> <tarek.elsherbiny@gmail.com> wrote:
> >
> > I would like to check out from our local SVN repository. This is the URI
> > line I'm using in the recipe:
> >
> >  SRC_URI =
> >
> "svn://svn.local.repo/svn/dev_repos/Generation3_app;module=trunk;proto=http"
>
> use protocol=http above and make sure that your server exports over
> http otherwise drop the argument
>
> >
> > When I try the same command bitbake is using on the command line it works
> > fine. But bitbake is not fetching the package.
> >
> > Is there a special parameter that I need to modify for SVN to work?
>

--20cf306f74d60063c304ca11b2aa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;ve tried with both protocol=3Dhttp and without the argument at all. S=
till not fetching!<br><br><div class=3D"gmail_quote">On Wed, Sep 19, 2012 a=
t 6:41 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Sep 19, 2012 at 9:=
48 AM, Tarek El-Sherbiny<br>
&lt;<a href=3D"mailto:tarek.elsherbiny@gmail.com">tarek.elsherbiny@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; I would like to check out from our local SVN repository. This is the U=
RI<br>
&gt; line I&#39;m using in the recipe:<br>
&gt;<br>
&gt; =A0SRC_URI =3D<br>
&gt; &quot;svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrun=
k;proto=3Dhttp&quot;<br>
<br>
</div>use protocol=3Dhttp above and make sure that your server exports over=
<br>
http otherwise drop the argument<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; When I try the same command bitbake is using on the command line it wo=
rks<br>
&gt; fine. But bitbake is not fetching the package.<br>
&gt;<br>
&gt; Is there a special parameter that I need to modify for SVN to work?<br=
>
</div></div></blockquote></div><br>

--20cf306f74d60063c304ca11b2aa--
