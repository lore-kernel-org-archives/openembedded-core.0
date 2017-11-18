Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 81AAB78875
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 01:09:15 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id r11so2609343uah.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 17:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IAN5Kv2YnSE1Zj1n2M9ngKyYNYPofkfYuqBxntSk8qg=;
	b=Zf2cD2n4z6NmkMq3I4cAELG/wZzv+HRIP2YKYnhFs6rhC/rCic1gBtwjYt14MY5UTG
	mHTDEA9A6FpR9rWOaZwmm0/WxuKEeNJFX8w5rJ9x5BymcZez3t0Sii+j4eB42eHv8HhT
	GYK2mmdvGk1D/s9vc/PQlkACTs8rAbOusQVaxTSK75ofoQJTz3YFvmEcF/gQFLStBMKX
	eU0lV7dwU/iLwj5YbdUy8fGVzYnST/LvrsvbIu/0T71M/0Zc3OtmGo2bmao946w3DRmA
	2OYWc5iQNChoyvdOqbgweNbgRQ5cAeT1kYvdl74EiY9e+vO5snNX+xnrZrbfn3dBtCu0
	zk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IAN5Kv2YnSE1Zj1n2M9ngKyYNYPofkfYuqBxntSk8qg=;
	b=oPfm1S5tEjC/hy0M5KLByjzHfgsRmhuMZc+fvfnTh4Vv3QCY3pIDA2r8Juc+nBMYdH
	pYYwS1RlnWeTdfuQOvcbc/axFTX7vUVVOrSWR9DOkmOPLd5OchkfQ0k18TfpEP6qR/xr
	LY1Cc7fPHs78K7GMsRb1+MZL9wrgUwTyC7rPDsOz5z+j9w7O6D38WNb9cbJgU+Adhrss
	gEROBwM6WN+T7HjZb1UC0Nc8HV4dfvA01uVrfDu5PxY7Qq2u0anqg/znXCp4sopjPgj3
	6jrH6cWiBhT7COfoynE9RxedietSY7sewqtjfhVDwb8+EKdsom4y67/q+2Ngsj9h+pEN
	+vMw==
X-Gm-Message-State: AJaThX62yd0VRNNlpRQ85uc7f+G7aVFs0Lpp0rZuC1oYkqEylenWgEyn
	TUc6BqW9FOkf0P2NKfLswZYv7LdYB8nwlZs0Nhs=
X-Google-Smtp-Source: AGs4zMbPJBS1uhdB63OkHfmCwJAIPRGycr6oUk5XDEBGlR7wlzqRFxprRwHEnNt8Ice+jo8zPiGCqNVNBghbmo1CA8A=
X-Received: by 10.159.63.15 with SMTP id h15mr6552020uaj.156.1510967356357;
	Fri, 17 Nov 2017 17:09:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Fri, 17 Nov 2017 17:08:55 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6404703B8@ORSMSX112.amr.corp.intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
	<1510861730-82471-2-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=Xs5b3dNfaNFE_kzDJ1AMknRPqMw60gC_c+8gBA21SiNw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6404703B8@ORSMSX112.amr.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 17 Nov 2017 18:08:55 -0700
Message-ID: <CABcZAN=WRku1y27c_KXfhLs3b=vBAiNRBPaP_RRn0+rbzbvkXA@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gnutls: improve reproducibility
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
X-List-Received-Date: Sat, 18 Nov 2017 01:09:15 -0000
Content-Type: multipart/alternative; boundary="089e082468bc8b07d4055e37801d"

--089e082468bc8b07d4055e37801d
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 5:23 PM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

>
> > Is there a configure option we could use (perhaps via
> > CACHED_CONFIGUREVARS) to achieve the same end result without needing
> > to run sed on config.h?
>
> Sorry Andre, I am not quite sure I understand the question. Do you suggest
> to have a "config.h"
> cached somewhere instead of generating the file at build time?


config.h is generally generated from config.h.in by the configure script
(and the config.h.in is generated in some cases by autoheader), and the
values of those defines are generally based on autoconf test results, which
are often cached. By supplying different cached results to those tests, you
can change the emitted config.h without having to explicitly and manually
do so.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--089e082468bc8b07d4055e37801d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 17, 2017 at 5:23 PM, Bystricky, Juro <span dir=3D"ltr">&lt;=
<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystrick=
y@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D""><br>
&gt; Is there a configure option we could use (perhaps via<br>
&gt; CACHED_CONFIGUREVARS) to achieve the same end result without needing<b=
r>
&gt; to run sed on config.h?<br>
<br>
</span>Sorry Andre, I am not quite sure I understand the question. Do you s=
uggest to have a &quot;config.h&quot;<br>
cached somewhere instead of generating the file at build time?</blockquote>=
<div><br></div><div>config.h is generally generated from <a href=3D"http://=
config.h.in">config.h.in</a> by the configure script (and the <a href=3D"ht=
tp://config.h.in">config.h.in</a> is generated in some cases by autoheader)=
, and the values of those defines are generally based on autoconf test resu=
lts, which are often cached. By supplying different cached results to those=
 tests, you can change the emitted config.h without having to explicitly an=
d manually do so.</div></div>-- <br><div class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>
</div></div>

--089e082468bc8b07d4055e37801d--
