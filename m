Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8E95A71ABF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 00:42:51 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id y22so9670951wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 17:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=2R1d5PavsxTcJPZRJdXwbjKspM0BKQlUZsrG8iltEGc=;
	b=qt+EI2rKRwMGOkFtddLFXIpCiRLg95Q/Z8gDb0+xV696NgIIwhNBU1x04iYzsup+wc
	i+j3mQ3TPhdcLvKD6E0FPPT6eUCKg58A/aP3NCIQpz9e4sLQqFdoB5MwJ4aDTUhFJw+G
	WSWzrjZlgexrwzkhHYX0rB+qBSF3zZQWTmqZwfITo86O6Ol/IY5S/HEM34TCD7ZikjEB
	Q5Ef6Lzjmp0/tWlcoj+q0dbcUnLu14EnSxZ3CeK7gdKOvYBaPxhx1K9BvXopr71y0xKI
	PGWiooAu6Y6sUb1QbIPmFTzYz2YDCWIJ6ZbPPLbJgt8S3dLLewPITis5iKYLkjYoYICt
	rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2R1d5PavsxTcJPZRJdXwbjKspM0BKQlUZsrG8iltEGc=;
	b=PNCgMXkpBLRCt7eyR5KKvie6cheBFPE68y4klPgrIOPHhkNR7jV8I+BxppRcIrq+t8
	qsSFWy7hurLaRNldHXxMvt2xgHJe9YmlCwEkrmJwkxukiIbB/sjEz2jMoMbMQzhgsx7B
	LidzeuVaDJZuellUm5lLQt39wIuII/6ofMeuJMOMOsQElBkvbCXF+Wzy2K/IdhkjE1sZ
	/FaMvxcn1tt16uW/rAsU/bM174Y9YhLztn5XHZi2Okq1lauwyrIfAIJxtSrTeUSadtvs
	f3lhBpm8fLA6DMLj/riVJqisDG5sxPEdbZO8++dYNYbS4yywCX3iFZpHU91KO8wjST86
	kESg==
X-Gm-Message-State: AFeK/H0Jwnc16rRfhnmaCPI3lhnYUmMdfQlYdUh97IA/4oIQMMNIiBHF
	myKrQRXlakz5MzrMm8p3IHYTAn8eSw==
X-Received: by 10.28.45.212 with SMTP id t203mr294791wmt.37.1491007372242;
	Fri, 31 Mar 2017 17:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
	<1491000595.13980.375.camel@linuxfoundation.org>
In-Reply-To: <1491000595.13980.375.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 01 Apr 2017 00:42:41 +0000
Message-ID: <CAMKF1spaeG0a=fg87UmAZF+Z9KPDqFzGCM62TKriURf2T+yMzg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Sat, 01 Apr 2017 00:42:51 -0000
Content-Type: multipart/alternative; boundary=001a11422abcc7b316054c1034c7

--001a11422abcc7b316054c1034c7
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 3:50 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2017-03-31 at 22:27 +0000, Khem Raj wrote:
> >
> > On Fri, Mar 31, 2017 at 2:29 PM Juro Bystricky <juro.bystricky@intel.
> > com> wrote:
> > > Build static libraries without the binutils "ar" -U option.
> > > This option deliberately breaks deterministic mode.
> > While this patch is ok it would be better if we configured binutils
> > with enable-deterministic-archives option please file a ticket for
> > it
>
> ncurses is specifically asking binutils to make a non-deterministic
> archive here so I'm not sure that would help in this specific case
> Cheers,


Not this case obviously but I was reminded that this should be default
option from tool gain if not specified

>
>
> Richard
>

--001a11422abcc7b316054c1034c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Fri, Mar 31, 2017 at 3:50 PM Ri=
chard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Fri, 2017-03-31 at 22:27 +0000, Khem Raj wrote:<br class=3D"g=
mail_msg">
&gt;<br class=3D"gmail_msg">
&gt; On Fri, Mar 31, 2017 at 2:29 PM Juro Bystricky &lt;juro.bystricky@inte=
l.<br class=3D"gmail_msg">
&gt; com&gt; wrote:<br class=3D"gmail_msg">
&gt; &gt; Build static libraries without the binutils &quot;ar&quot; -U opt=
ion.<br class=3D"gmail_msg">
&gt; &gt; This option deliberately breaks deterministic mode.<br class=3D"g=
mail_msg">
&gt; While this patch is ok it would be better if we configured binutils<br=
 class=3D"gmail_msg">
&gt; with enable-deterministic-archives option please file a ticket for<br =
class=3D"gmail_msg">
&gt; it=C2=A0<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
ncurses is specifically asking binutils to make a non-deterministic<br clas=
s=3D"gmail_msg">
archive here so I&#39;m not sure that would help in this specific case<br c=
lass=3D"gmail_msg">
Cheers,</blockquote><div><br></div><div>Not this case obviously but I was r=
eminded that this should be default option from tool gain if not specified=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Richard<br class=3D"gmail_msg">
</blockquote></div></div>

--001a11422abcc7b316054c1034c7--
