Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 482B77953D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:21:34 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id z185-v6so9826632oia.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wplcA+YFIonHmCrqcbycvG2snP8wQGib5bnYUaxkLa8=;
	b=ByB+wcCiZYwxyWWdTr0Wp8Wugb0hOp/5cOYqCWcNnFqxrYCx6sVllyAKKae2waqssW
	BKzZ5XzSAJYgpcUsfNbDOY5LsTt3YGsjihy3lZkJHly2u88gfOxYh6bOUAhcU6L9dyUy
	b1qzwpEw4FSVLcSKtSJVgYIFWfZ7KupXDC1RIQ0p8wKEiYTmqmmhbDmB9NEHT5xUpi5R
	3yJLfa/DWomTXxBDrwNEY6JvR/3ZEwN5HakiE9wit+JBr0chG++p9cmZoKihVjxfDGiP
	yPabwtM+ocFU6ToUARtLje0dYmjM98Q+L460LCmrpOYUH1j/mxXImPEgMNLQcEyfykN5
	2HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wplcA+YFIonHmCrqcbycvG2snP8wQGib5bnYUaxkLa8=;
	b=OBSb6yWE2mUl89E+gMQzD/wfF42PtPqxrTL6F0M/I+sLk/Oakj0Ux1gbC3O1XVXKHI
	m65kKQG1UoUT32t4j2/O9dT/gzBYSzNvWNBScSI8NYkLYQn6xdjRa8Dz9lOvNjchhAj2
	ACw9sVURWwcdKm40WHPuJGPr5cxYGDonq50nU+MRv1FFeThqD5hB5QB2j4P0cfjrGCIl
	SZgaTmNRf5leKotYydU1ePM0s/c/GXPAkMUltMFLtmyaMn+AN+Lu06zPUmPnrTwK/vbt
	lsd9SEq7ykp9/5ouuSWmZtAKdJywgo2WhmxdFsZRjSH4/FAEiqyxmCQTVkuTAMDKVlFd
	KV1Q==
X-Gm-Message-State: APzg51Dr5LSxI02gAfK5yvU70bcRq14bEX05ludtXsaAp06r9+XsCQNC
	I/LgIdyDgg4v4g8tbP+W4+9H8rF0hB1TEqbwpX8=
X-Google-Smtp-Source: ANB0VdaTQgEpGPAWQtV4b2YIi3NZUfbJyx/RiVa7kWXDK5dX0dA1tKhm2+ImRYQt9n/0W3qzVz9kuLjEpHK56vVPEkE=
X-Received: by 2002:aca:e510:: with SMTP id
	c16-v6mr9736851oih.44.1535041295156; 
	Thu, 23 Aug 2018 09:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
	<188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
	<CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
	<5a6bf05b6a04f09ed3f148c996a2b6d0d562924d.camel@linuxfoundation.org>
In-Reply-To: <5a6bf05b6a04f09ed3f148c996a2b6d0d562924d.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 23 Aug 2018 09:21:19 -0700
Message-ID: <CABcZANmK_H5kPGp2UQMBTszEXW3D++f8404c-GANqpaRShzffQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 23 Aug 2018 16:21:34 -0000
Content-Type: multipart/alternative; boundary="0000000000001d0b5905741ca7bf"

--0000000000001d0b5905741ca7bf
Content-Type: text/plain; charset="UTF-8"

IMO PGO should really stay opt-in, not opt-out, given the performance
impact.

On Thu, Aug 23, 2018 at 1:28 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2018-08-22 at 18:44 -0700, Andre McCurdy wrote:
> > On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal <anuj.mittal@intel.com>
> > wrote:
> > > On 08/17/2018 03:31 AM, Andre McCurdy wrote:
> > > > On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.
> > > > com> wrote:
> > > > Is it important to re-create the profile data during every build
> > > > or
> > > > would we get most of the same benefits from using reference data
> > > > which
> > > > is generated offline?
> > >
> > > We should get the same benefit using the data generated offline as
> > > long
> > > as the source code/configure options/flags are same I believe. I
> > > have
> > > only tried with data generate offline using the same build
> > > configuration
> > > though.
> >
> > As an additional data point, python do_compile now takes approx 18
> > minutes on my laptop. A single qemu-i386 thread loading one CPU core
> > at 100%, with nothing else being scheduled in parallel for most of
> > that time.
> >
> > If we can get most of the benefits of pgo with a pre-generated data
> > file then that might still be something to explore.
>
> I've also noticed the increased build times. I'd love to see if we
> could create an sstate object which would contain the pgo data and
> which didn't depend on the usual compiler/toolchain pieces, only the
> do_patch stage checksum. In theory, the same sstate object should be
> reusable between target/native/nativesdk too as long as we had the same
> python patchset (which I know we don't for native).
>
> Anyone fancy such a challenge? We should probably have a bug open for
> this at least...
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
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000001d0b5905741ca7bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">IMO PGO should really stay opt-in, not opt-out, given the =
performance impact.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Thu, Aug 23, 2018 at 1:28 AM Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2018-08-22 at 18:44 =
-0700, Andre McCurdy wrote:<br>
&gt; On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal &lt;<a href=3D"mailto:anu=
j.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On 08/17/2018 03:31 AM, Andre McCurdy wrote:<br>
&gt; &gt; &gt; On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal &lt;anuj.mitta=
l@intel.<br>
&gt; &gt; &gt; com&gt; wrote:<br>
&gt; &gt; &gt; Is it important to re-create the profile data during every b=
uild<br>
&gt; &gt; &gt; or<br>
&gt; &gt; &gt; would we get most of the same benefits from using reference =
data<br>
&gt; &gt; &gt; which<br>
&gt; &gt; &gt; is generated offline?<br>
&gt; &gt; <br>
&gt; &gt; We should get the same benefit using the data generated offline a=
s<br>
&gt; &gt; long<br>
&gt; &gt; as the source code/configure options/flags are same I believe. I<=
br>
&gt; &gt; have<br>
&gt; &gt; only tried with data generate offline using the same build<br>
&gt; &gt; configuration<br>
&gt; &gt; though.<br>
&gt; <br>
&gt; As an additional data point, python do_compile now takes approx 18<br>
&gt; minutes on my laptop. A single qemu-i386 thread loading one CPU core<b=
r>
&gt; at 100%, with nothing else being scheduled in parallel for most of<br>
&gt; that time.<br>
&gt; <br>
&gt; If we can get most of the benefits of pgo with a pre-generated data<br=
>
&gt; file then that might still be something to explore.<br>
<br>
I&#39;ve also noticed the increased build times. I&#39;d love to see if we<=
br>
could create an sstate object which would contain the pgo data and<br>
which didn&#39;t depend on the usual compiler/toolchain pieces, only the<br=
>
do_patch stage checksum. In theory, the same sstate object should be<br>
reusable between target/native/nativesdk too as long as we had the same<br>
python patchset (which I know we don&#39;t for native).<br>
<br>
Anyone fancy such a challenge? We should probably have a bug open for<br>
this at least...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--0000000000001d0b5905741ca7bf--
