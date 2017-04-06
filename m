Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0AD77A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:56:13 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id l201so9520526ybf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 03:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p1H8GhwG3sbXl3E+7stQ7tK++NuE1OgG8F/hAFP5ais=;
	b=qA48n4MGFpzO7YJ/SFgG11ppRJs/HwIE7T5Kqu0IUFLHq0RArJSXvUcduuPW2soZVa
	kWDYVqie7ktD84L9UDsXQBFECMJ/593iUcyTa1kAqPaGsMb4VAu+9NRpLoFfACWh2J1p
	3TtIheX4D0eQZ146YTsQwhAykmZFDnuPqLSgoQlzmJsU3MT0zPUR0hXIACPkqV4hR3Ey
	4YVtvvT7w4s1mSzNhmzPSBypcWXXF0TwbBFtgWJuBRphlpLdZKNNIm8cXzNbakxcaSn+
	9jkEKEywb973BrHWG8R+9Vyqhr10MLTQaKb2BNZMNSgtPI1gQwYeuCz5/1H/v7S/LdUY
	eEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p1H8GhwG3sbXl3E+7stQ7tK++NuE1OgG8F/hAFP5ais=;
	b=a8CzUd7+w/I1hLxjOUJKF2QxtIAgTXPcI3WoV1W2hAJKgCCrF+r3MQ1llbWsHDooQC
	GJ/un6/j8+/sC/lyzzvrB19Fb+5VVivw41xsbkJfTNPe4vtqz2/At1aHYE0mE1QTayUY
	mMLb+4cl2a9YR4YYo38DSPFzMcyOmZCX3nBz+n2O2LPDi/64ke8JuJ+otkEzb1zPQnBm
	nvOtxBtHWZi5sijSX3X9qoNs42DS59Dlbi7Bb5MXEJJxY5lyc9abXKqIX3DzmV4YhHql
	pCSsIj34triBIuzSiSz3dPeXK1Wf1VR8+WpklpJjqD7nbJJ5l3+vcbu6DLejIeaoL+K6
	FUwQ==
X-Gm-Message-State: AFeK/H0tXx7adBMGG8zpUQLAXfNPgi7x+V2aPZIrNrkTDVY1f+W64mB0QAeBtlPrjc1phzWSLzOLa3oXLylQFqZo
X-Received: by 10.37.170.3 with SMTP id s3mr16685568ybi.189.1491476174261;
	Thu, 06 Apr 2017 03:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 6 Apr 2017 03:55:43 -0700 (PDT)
In-Reply-To: <2234508.nmKqqo84gx@crde-port-20.cahors.local>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_GH-WhDow0+nP-JnTq1kUKqfBmtS__BuqfUSuroNvsawg@mail.gmail.com>
	<2234508.nmKqqo84gx@crde-port-20.cahors.local>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 6 Apr 2017 13:55:43 +0300
Message-ID: <CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Thu, 06 Apr 2017 10:56:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c19d5dc8eed91054c7d5bfb

--94eb2c19d5dc8eed91054c7d5bfb
Content-Type: text/plain; charset=UTF-8

On 6 April 2017 at 12:23, David Vincent <freesilicon@gmail.com> wrote:
>
> On mercredi 5 avril 2017 09:30:52 CEST Jussi Kukkonen wrote:
> > This apparently breaks key generation with openssl-native because the
file
> > doesn't exist.
>
> Looking at the recipe right now, I understand why key generation is
broken for
> native build (I should have been more careful). I see two ways of fixing
it :
>         - either recreate the symlink in do_install_append_class_native
>         - or simply modifiyng the OPENSSL_CONF variable in the same task.
>
> >
> > I can fix it by adding one more complication to the recipe (will send a
> > patch) but I don't think the current solution is all that great: I've
been
> > looking at this patch for a while now and still don't really understand
why
> > it is needed and how these different packages interact. I'm sure it
makes
> > sense when you look at the other recipe but ... isn't it a bad sign that
> > that context seems to be needed?
>
> OK, I will provide some context because maybe my approach was wrong. In
some
> of my builds, I require some images to have a very specific configuration
to
> make OpenSSL use engines. My idea was to provide a package for this task
since
> the default file can not be overridden (and in fact shouldn't be for the
native
> build).


So previously openssl-conf package included etc/ssl/openssl.cnf and the
symlink ${libdir}/ssl/openssl.conf. Nothing RDEPENDS on this package (but
libcrypto RRECOMMENDS it).

After your patch the actual configuration file is still installed. In a
postinst
  * ${libdir}/ssl/openssl.conf is removed if it exists (why? If it's for
upgrading, then this should happen in a prerm or postrm)
  * the symlink ${libdir}/ssl/openssl.conf is created

My confusion is this: how does the above solve the problem you describe? If
you've managed to use RCONFLICTS to prevent the configuration package from
getting included in the image, why are changes to the package needed?



Some alternative solutions to your problem I think might work:
* openssl_%.bbappend with a do_install_append() that simply copies your
conf file over the one from upstream recipe. No extra packages needed
* BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from
getting included in your image, then adding your own package with your
configuration (does not work for dpkg I think)

Jussi

--94eb2c19d5dc8eed91054c7d5bfb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 April 2017 at 12:23, David Vincent &lt;<a href=3D"mai=
lto:freesilicon@gmail.com">freesilicon@gmail.com</a>&gt; wrote:<br>&gt;<br>=
&gt; On mercredi 5 avril 2017 09:30:52 CEST Jussi Kukkonen wrote:<br>&gt; &=
gt; This apparently breaks key generation with openssl-native because the f=
ile<br>&gt; &gt; doesn&#39;t exist.<br>&gt;<br>&gt; Looking at the recipe r=
ight now, I understand why key generation is broken for<br>&gt; native buil=
d (I should have been more careful). I see two ways of fixing it :<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - either recreate the symlink in do_install_app=
end_class_native<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - or simply modifiyng =
the OPENSSL_CONF variable in the same task.<br>&gt;<br>&gt; &gt;<br>&gt; &g=
t; I can fix it by adding one more complication to the recipe (will send a<=
br>&gt; &gt; patch) but I don&#39;t think the current solution is all that =
great: I&#39;ve been<br>&gt; &gt; looking at this patch for a while now and=
 still don&#39;t really understand why<br>&gt; &gt; it is needed and how th=
ese different packages interact. I&#39;m sure it makes<br>&gt; &gt; sense w=
hen you look at the other recipe but ... isn&#39;t it a bad sign that<br>&g=
t; &gt; that context seems to be needed?<br>&gt;<br>&gt; OK, I will provide=
 some context because maybe my approach was wrong. In some<br>&gt; of my bu=
ilds, I require some images to have a very specific configuration to<br>&gt=
; make OpenSSL use engines. My idea was to provide a package for this task =
since<br>&gt; the default file can not be overridden (and in fact shouldn&#=
39;t be for the native<br>&gt; build).<br><br><br>So previously openssl-con=
f package included etc/ssl/openssl.cnf and the symlink ${libdir}/ssl/openss=
l.conf. Nothing RDEPENDS on this package (but libcrypto RRECOMMENDS it). <b=
r><br>After your patch the actual configuration file is still installed. In=
 a postinst<br>=C2=A0 * ${libdir}/ssl/openssl.conf is removed if it exists =
(why? If it&#39;s for upgrading, then this should happen in a prerm or post=
rm)<br>=C2=A0 * the symlink ${libdir}/ssl/openssl.conf is created<div><br>M=
y confusion is this: how does the above solve the problem you describe? If =
you&#39;ve managed to use RCONFLICTS to prevent the configuration package f=
rom getting included in the image, why are changes to the package needed?<b=
r><br><br><br>Some alternative solutions to your problem I think might work=
:<br>* openssl_%.bbappend with a do_install_append() that simply copies you=
r conf file over the one from upstream recipe. No extra packages needed<br>=
* BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from getti=
ng included in your image, then adding your own package with your configura=
tion (does not work for dpkg I think)<br><br>Jussi</div></div>

--94eb2c19d5dc8eed91054c7d5bfb--
