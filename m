Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 720E660125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 08:25:37 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id is5so17526633obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C+9qWrzstRbl/eUCJrnpDALGHkBfhZ6pAqOGf/qNyy8=;
	b=knbghIA4d9Qq8O2NO2b7bLqpRdR+pW504+jPlUQyGaLB+p4zzyHDuzJEN2Es7ZS9Z0
	G82pY9daeJv4f649AvKcaSrPL6Nddyy2R9+ZXfiJ2iJXr5N/wbF5lOHmGdSfR6Fl+dcw
	TMcCe5xMkMJfBku8ou6EGJDRfOO456T+2rS1L+v9QxiH3raQ+XNMU75fMtN+/o5swxu3
	eajyT3IVK6DrJzkuMGzE2SUaIkclrdTBiPiVcf7/2KDdF10yXzLqmXo3hGKMM+U+pbID
	/u2qzXMmAQ2DF4kB/6Ih1QeBEC1nrbYeab48jBrOWTWA1HIXXBkKDsYyE7looz+YRAYE
	N1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C+9qWrzstRbl/eUCJrnpDALGHkBfhZ6pAqOGf/qNyy8=;
	b=gMg9LxA2HsieJBUcKaOWPq4XI6k2mGeaIHymeztISmaHU1UdKWWLYxLPF6s3FZlCGH
	2Y/AKO3D25GCWzhDOlBz7csajm/ijYo4qBHvFVWbKfwGi1zfxq9KcqaZs2HLiirYJNB9
	dbe/EXj5VdGuCyr1k8mu3LNpaMRx6e+p4yLVO2VMKmPqcFB/V4FeEjAkx3VgEKcNWZDR
	2htuFvRsse+27XK6QXLfzJWpeO8zMIVcMkOPWLAVso6o8g1sm3GBn7hpofh5K/uCs/SU
	4wEulUrdV3KwskYnN/sdnbT7rhjohViX+6JP8CbdpjkTqJMAli8fmLTsbOaKhmCdSh8c
	csoA==
X-Gm-Message-State: AG10YOSwxwLCPyQL35gSOomjMbYKYZMKe9HZ859oH4BuxJ4M0BTK+7vItlB/CXR5pnnxelnKdRZWMIR7aYyMc8nt
X-Received: by 10.60.227.74 with SMTP id ry10mr34716467oec.48.1455092738085;
	Wed, 10 Feb 2016 00:25:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.224.68 with HTTP; Wed, 10 Feb 2016 00:25:08 -0800 (PST)
In-Reply-To: <56BA2A15.2060706@windriver.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
	<56BA2A15.2060706@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 10 Feb 2016 10:25:08 +0200
Message-ID: <CAHiDW_GPu1LrmHnBVCqsCXm7MGCxwESoejb57zaqSG1HQAjwWw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Wed, 10 Feb 2016 08:25:38 -0000
Content-Type: multipart/alternative; boundary=001a1136935ec500af052b662d5b

--001a1136935ec500af052b662d5b
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 20:04, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 2/9/16 11:54 AM, Khem Raj wrote:
> >
> >> On Feb 9, 2016, at 1:39 AM, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
> >>
> >> On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen
> >> <jussi.kukkonen@intel.com> wrote:
> >>> Default to libcrypto (openssl) as before.
> >>>
> >>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> >>
> >> Looks good to me. this is the same implementation I used in the mesa
> >> patch.. so we need to make sure that any review feedback is applied to
> >> both before merging the too,
> >
> > since its spans multiple recipes would it be better to control it with
> > a global knob instead of packageconfig.
>
> I'm not sure it makes sense in -this- case..  but I've more then once
> thought
> that it would be nice for a global distro "this is the preferred crypto
> engine"
> setting.
>
> That way you could do things like default to openssl, libgcrypt, libnss,
> etc..
> whatever is appropriate for the system you are building.  It wouldn't
> promise
> that everything would just use that crypto backend, but things that could
> -- should.


I was wondering if something like this was possible as well: that's how I
got into reviewing the reverse dependencies of openssl & gnutls.

There are some cases that might make this effort not worth the trouble:
SHA1 is easy and switching implementations is something upstream projects
want to support but with e.g. TLS it is not always so: An example is
glib-networking with only gnutls for TLS support*.

Jussi


*) There's a "wip/openssl" branch of glib-networking so this might get
fixed in future releases .



(This is certainly a more extensive patch then what's being discussed
> here..)
>
> --Mark
>
> >> should we get any review feedback.. but
> >> in any case:
> >>
> >> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1136935ec500af052b662d5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 9=
 February 2016 at 20:04, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On 2/9/16 11:54 AM=
, Khem Raj wrote:<br>
&gt;<br>
&gt;&gt; On Feb 9, 2016, at 1:39 AM, Nicolas Dechesne &lt;<a href=3D"mailto=
:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen<br>
&gt;&gt; &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">=
jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Default to libcrypto (openssl) as before.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukk=
onen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Looks good to me. this is the same implementation I used in the me=
sa<br>
&gt;&gt; patch.. so we need to make sure that any review feedback is applie=
d to<br>
&gt;&gt; both before merging the too,<br>
&gt;<br>
&gt; since its spans multiple recipes would it be better to control it with=
<br>
&gt; a global knob instead of packageconfig.<br>
<br>
</span>I&#39;m not sure it makes sense in -this- case..=C2=A0 but I&#39;ve =
more then once thought<br>
that it would be nice for a global distro &quot;this is the preferred crypt=
o engine&quot;<br>
setting.<br>
<br>
That way you could do things like default to openssl, libgcrypt, libnss, et=
c..<br>
whatever is appropriate for the system you are building.=C2=A0 It wouldn&#3=
9;t promise<br>
that everything would just use that crypto backend, but things that could -=
- should.</blockquote><div><br></div><div>I was wondering if something like=
 this was possible as well: that&#39;s how I got into reviewing the reverse=
 dependencies of openssl &amp; gnutls.=C2=A0</div><div><br></div><div>There=
 are some cases that might make this effort not worth the trouble: SHA1 is =
easy and switching implementations is something upstream projects want to s=
upport but with e.g. TLS it is not always so: An example is glib-networking=
 with only gnutls for TLS support*.</div><div><br></div><div>Jussi</div><di=
v><br></div><div><br></div><div>*) There&#39;s a &quot;wip/openssl&quot; br=
anch of glib-networking so this might get fixed in future releases .</div><=
div><br></div><div><br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
(This is certainly a more extensive patch then what&#39;s being discussed h=
ere..)<br>
<span><font color=3D"#888888"><br>
--Mark<br>
</font></span><div><div><br>
&gt;&gt; should we get any review feedback.. but<br>
&gt;&gt; in any case:<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.deches=
ne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1136935ec500af052b662d5b--
