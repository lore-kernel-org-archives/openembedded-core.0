Return-Path: <mikko.ylinen@intel.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 80FDD6E667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:37:46 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id z8so18043538ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jhbcLMZj6Fq6dNjFS9ytb3KyxMKEMi/a7stf8nw6VZQ=;
	b=biBWQhK5v81/bGpRkTxoyPl3re5C0ieDU4WDx3387DMSs1ozVdKWaauM/+4QaSejEG
	yV3oHR9hPDOraXejiTssEZ4vGDrPWBDQFDs8oq5/hVGVlflDiOYmPSJ4QFp95dYwXeXr
	llva7PAl0Kmo+gnFVUxpiiN4+b9WFGRoOekEJVDPcMc9oR4DgLr0snG/SC5Cgj0Ae0+v
	vwNBZ/smsNOsP3sl1CGGm4o4q54CK12FwCWhL4GdJJduaqWxdddnTB9qhoD0IqfViD6R
	7z7bT2fGDeXpBmLkUqQ4RU34PSg4svzwcwfQ0OpdTrXlDSMxhAjmrW9rRfy2MYbtOFPJ
	Dlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jhbcLMZj6Fq6dNjFS9ytb3KyxMKEMi/a7stf8nw6VZQ=;
	b=mhzVqg/KVn40uiZat6RPETMhb8K/c8E86l5JHcqOOnDMt/2FmnD5u+A2wXdPn9EWxY
	M3JReHFgesNVC9rD/XSlQ+yurSzkMnZK28WVQKsPXJZZVmrR2uGphlcAbw2/P3zehTQd
	Biz5Sqv3bLrKEunVQZEyc01QftNnhsFrZC+CGkSNbrmAsoksO5bFKOXsX+iYWiGm7M1l
	8LivnNDFYl69qMrrUoqn3tyeT+vZq7MmcS9ey3i6znTXYzBroPpan7ILbYlq8eifFU/h
	6cmwxPUk5iFuhKdSvT5mXGCVsGD82ag2+GkG5co4vmoUhXW/E3PyRPMx90wOTR+0uyjc
	dfLQ==
X-Gm-Message-State: AEkooutrvEfyRD9z8kN1mW8ntZo/FBz6K4ZAMsf+hPJqUhpIGeCF5yx+aYQQbu777kx/BsRm3Ls8HsFh4NO0LD02
X-Received: by 10.13.233.193 with SMTP id s184mr7066836ywe.84.1471631867352;
	Fri, 19 Aug 2016 11:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.123.194 with HTTP; Fri, 19 Aug 2016 11:37:46 -0700 (PDT)
In-Reply-To: <1471617947.16712.41.camel@linuxfoundation.org>
References: <1471617353-3904-1-git-send-email-ed.bartosh@linux.intel.com>
	<1471617947.16712.41.camel@linuxfoundation.org>
From: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Date: Fri, 19 Aug 2016 21:37:46 +0300
Message-ID: <CAHZ0fbGXw4jm-Wq6yEx9_0yA81NbZaLOa=0oQ=38dW-xyVCUEg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: use COMPRESSIONTYPES variable for backward compatibility
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
X-List-Received-Date: Fri, 19 Aug 2016 18:37:47 -0000
Content-Type: multipart/alternative; boundary=94eb2c068ee0b1c963053a70feb6

--94eb2c068ee0b1c963053a70feb6
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri, Aug 19, 2016 at 5:45 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2016-08-19 at 17:35 +0300, Ed Bartosh wrote:
> > Recent renaming of COMPRESSIONTYPES variable can break recipes that
> > still use it. Including value of COMPRESSIONTYPES variable into
> > CONVERSIONTYPES should prevent this.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/classes/image_types.bbclass | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
>
> Does this actually work? Won't COMPRESSION_CMD be unset in these cases
> so it would just trigger further failures?
>
> Perhaps we should just error and tell the user if COMPRESSION_TYPES is
> set (in sanity.bbclass?).
>

These lines were simply missing
from 9d68c024790850cab72ead1e3372a5fcec4ef7b0
(the commit message talks about these lines).

In Ostro we add a few custom conversions via COMPRESSIONTYPES_append and
without
this patch those types are not recognized and we hit:

"No IMAGE_CMD defined for IMAGE_FSTYPES entry 'dsk.ova' - possibly invalid
type name or missing support class"

(ova is one of our COMPRESSIONTYPES).

-- Mikko

--94eb2c068ee0b1c963053a70feb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Fri, Aug 19, 2016 at 5:45 PM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span class=3D"">On Fri, 2016-08-19 at 17=
:35 +0300, Ed Bartosh wrote:<br>
&gt; Recent renaming of COMPRESSIONTYPES variable can break recipes that<br=
>
&gt; still use it. Including value of COMPRESSIONTYPES variable into<br>
&gt; CONVERSIONTYPES should prevent this.<br>
&gt;<br>
&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel=
.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image_types.<wbr>bbclass | 8 +++++++-<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
</span>Does this actually work? Won&#39;t COMPRESSION_CMD be unset in these=
 cases<br>
so it would just trigger further failures?<br>
<br>
Perhaps we should just error and tell the user if COMPRESSION_TYPES is<br>
set (in sanity.bbclass?).<br></blockquote><div><br></div><div>These lines w=
ere simply missing from=C2=A09d68c024790850cab72ead1e3372a5fcec4ef7b0</div>=
<div>(the commit message talks about these lines).</div><div><br></div><div=
>In Ostro we add a few custom conversions via COMPRESSIONTYPES_append and w=
ithout</div><div>this patch those types are not recognized and we hit:</div=
><div><br></div><div>&quot;No IMAGE_CMD defined for IMAGE_FSTYPES entry &#3=
9;dsk.ova&#39; - possibly invalid type name or missing support class&quot;<=
br></div><div><br></div><div>(ova is one of our COMPRESSIONTYPES).</div><di=
v><br></div><div>-- Mikko</div></div></div></div>

--94eb2c068ee0b1c963053a70feb6--
