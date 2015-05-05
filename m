Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id B623173BB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 20:05:25 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so113024564igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sLFGBb7eOEOe5NtMHCNPGZQ2vtMZrZKzIzPwBxRRaqE=;
	b=V/x9pF7OrSFq0o+Qy6WcyvXnRr6xZrWZh2W7sNJHn8RqhU7MkBqi5OqPDYtbqQv312
	FjRsWXfE9Y/hDMjR9Z6mJ7QgIgSc7foOizLSlP66JBAs4FgG6GDBG6moYuTlRwm7SJgl
	BiwOP2pde5jRNXW5JkfGyci7qbip6jUpbQlr5GcoegpthB7jAHGmXrAq5biwsc6rOT/Y
	eTLM6ZTkETmi260zyyDpYHPP6l6XovWWlhoehQqNPA563wqgzyqYe/hCXIcpc8ERGAxb
	cM2UqxmcjJW9muWoaqm32AkgcyVuFCRKOfNhp4+VIS5tDv/NLV3XhKbD9I/QlNhMyGCY
	HzuA==
MIME-Version: 1.0
X-Received: by 10.50.117.35 with SMTP id kb3mr4073098igb.13.1430856326573;
	Tue, 05 May 2015 13:05:26 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 5 May 2015 13:05:26 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 5 May 2015 13:05:26 -0700 (PDT)
In-Reply-To: <1430855489.8074.10.camel@linuxfoundation.org>
References: <5547BE45.2050206@windriver.com>
	<1430855489.8074.10.camel@linuxfoundation.org>
Date: Tue, 5 May 2015 13:05:26 -0700
Message-ID: <CAMKF1sqVu4WSjSwfmH5WiKvzaKQE-yP9Xtt0Tmr5zEcKqtOpSA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add libreSSL to oe-core?
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
X-List-Received-Date: Tue, 05 May 2015 20:05:28 -0000
Content-Type: multipart/alternative; boundary=089e01183c9e11f55505155b3327

--089e01183c9e11f55505155b3327
Content-Type: text/plain; charset=UTF-8

On May 5, 2015 12:52 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2015-05-04 at 14:45 -0400, Randy MacLeod wrote:
> > Should oe-core add libressl as an alternative to openssl and other
> > OE SSL/TLS implementations?
> >
> > We had a request from a customer to add LibreSSL so I was wondering
> > about the plans of the Yocto community and indeed of the larger Linux
> > distro community.
> >
> > Libressl claims (aims?) to be  a more stable, secure TLS implementation
> > then OpenSSL. It was initially only for OpenBSD but it supports a
> > variety of platforms now:
> >     http://www.libressl.org/releases.html
> > The CVE history enthusiastically summarized on Wikipedia:
> >     https://en.wikipedia.org/wiki/LibreSSL
> > does indicate that libressl has been vulnerable to fewer CVEs than
> > openssl so far. I quickly reviewed:
> >     https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations
> > but perhaps someone on the list has more direct experience, knowledge
> > and/or opinions of implementations of TLS? Note that the libressl devs
> > has stated that they have no interest in FIPS 140-2 certification:
> >     http://marc.info/?l=openbsd-misc&m=139819485423701&w=2
> > so that could be a problem for some users.
> >
> >
> > Other than Arch, and openSUSE Factory build, it seems that no
> > major linux distro has added libressl:
> >     http://pkgs.org/search/libressl
> >
> > An OE libressl recipe is not current indexed:
> >
> >
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libressl
> >
> > If I search more broadly:
> >
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ssl
> >
> > I see that the OE community does have recipes for:
> >    gnutls, nss, polarssl (now mbed TLS) and wolfssl.
> >
> > So what do you think of libressl?
>
> I don't see a pressing reason to accept this into OE-Core right now.

Me neither

The
> CVE numbers are bound to be lower for something with less exposure and
> the fact most mainline distros aren't using it is also a mild
> contraindication.
>
> Certainly a recipe in meta-oe and someone experimenting with it would be
> great and I've love to see the feedback and results but I'd be cautious
> here for the core right now.
>
> Obviously it will be interesting to see if anyone else has strong
> opinions though too.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e01183c9e11f55505155b3327
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 5, 2015 12:52 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Mon, 2015-05-04 at 14:45 -0400, Randy MacLeod wrote:<br>
&gt; &gt; Should oe-core add libressl as an alternative to openssl and othe=
r<br>
&gt; &gt; OE SSL/TLS implementations?<br>
&gt; &gt;<br>
&gt; &gt; We had a request from a customer to add LibreSSL so I was wonderi=
ng<br>
&gt; &gt; about the plans of the Yocto community and indeed of the larger L=
inux<br>
&gt; &gt; distro community.<br>
&gt; &gt;<br>
&gt; &gt; Libressl claims (aims?) to be=C2=A0 a more stable, secure TLS imp=
lementation<br>
&gt; &gt; then OpenSSL. It was initially only for OpenBSD but it supports a=
<br>
&gt; &gt; variety of platforms now:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.libressl.org/releases.ht=
ml">http://www.libressl.org/releases.html</a><br>
&gt; &gt; The CVE history enthusiastically summarized on Wikipedia:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://en.wikipedia.org/wiki/Libre=
SSL">https://en.wikipedia.org/wiki/LibreSSL</a><br>
&gt; &gt; does indicate that libressl has been vulnerable to fewer CVEs tha=
n<br>
&gt; &gt; openssl so far. I quickly reviewed:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://en.wikipedia.org/wiki/Compa=
rison_of_TLS_implementations">https://en.wikipedia.org/wiki/Comparison_of_T=
LS_implementations</a><br>
&gt; &gt; but perhaps someone on the list has more direct experience, knowl=
edge<br>
&gt; &gt; and/or opinions of implementations of TLS? Note that the libressl=
 devs<br>
&gt; &gt; has stated that they have no interest in FIPS 140-2 certification=
:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://marc.info/?l=3Dopenbsd-misc&=
amp;m=3D139819485423701&amp;w=3D2">http://marc.info/?l=3Dopenbsd-misc&amp;m=
=3D139819485423701&amp;w=3D2</a><br>
&gt; &gt; so that could be a problem for some users.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Other than Arch, and openSUSE Factory build, it seems that no<br>
&gt; &gt; major linux distro has added libressl:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://pkgs.org/search/libressl">ht=
tp://pkgs.org/search/libressl</a><br>
&gt; &gt;<br>
&gt; &gt; An OE libressl recipe is not current indexed:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/maste=
r/recipes/?q=3Dlibressl">http://layers.openembedded.org/layerindex/branch/m=
aster/recipes/?q=3Dlibressl</a><br>
&gt; &gt;<br>
&gt; &gt; If I search more broadly:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://layers.openembedded.org/laye=
rindex/branch/master/recipes/?q=3Dssl">http://layers.openembedded.org/layer=
index/branch/master/recipes/?q=3Dssl</a><br>
&gt; &gt;<br>
&gt; &gt; I see that the OE community does have recipes for:<br>
&gt; &gt;=C2=A0 =C2=A0 gnutls, nss, polarssl (now mbed TLS) and wolfssl.<br=
>
&gt; &gt;<br>
&gt; &gt; So what do you think of libressl?<br>
&gt;<br>
&gt; I don&#39;t see a pressing reason to accept this into OE-Core right no=
w. </p>
<p dir=3D"ltr">Me neither</p>
<p dir=3D"ltr">The<br>
&gt; CVE numbers are bound to be lower for something with less exposure and=
<br>
&gt; the fact most mainline distros aren&#39;t using it is also a mild<br>
&gt; contraindication.<br>
&gt;<br>
&gt; Certainly a recipe in meta-oe and someone experimenting with it would =
be<br>
&gt; great and I&#39;ve love to see the feedback and results but I&#39;d be=
 cautious<br>
&gt; here for the core right now.<br>
&gt;<br>
&gt; Obviously it will be interesting to see if anyone else has strong<br>
&gt; opinions though too.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--089e01183c9e11f55505155b3327--
