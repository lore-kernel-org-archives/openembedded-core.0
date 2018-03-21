Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD5B78972
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:10:56 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id e79so5943664ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=URKvjw8gHrUHHy6d2uEmQir7NIz0ZE+8w1D2JsEQXr4=;
	b=eAZAp0DTy9SXGT6emztHpPRC4VyVytDfIEFENKCSy7L6+/eZi5GmysfFu4p8S5Vzpb
	tirYbowtGpan/5m43bjMxsPe7r5AtCsCQ/rNqWaA/K+U22yMatXNRkBn3VDQEw9oOmUO
	gN0ocsqrwUo0R8HfLTyr2WxO7RZeRmZS+iKym96Ds6A/Gyywm4+K4pog6mIJzE4KOj9N
	gKJObbL+OyFYtaHjbsnSXIeZ3L2yxP2B5kaLheMvTOHYA7iqyWVox2s+pIQ0fgui4eMN
	QGy1bmgXGqsby40SZ4p9NbIncck6NNil9zyiKHzG7V0BFR/7OoKBKmUOpwlzmh4YAmfu
	UH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=URKvjw8gHrUHHy6d2uEmQir7NIz0ZE+8w1D2JsEQXr4=;
	b=CHyHmb+Cy4G5wv5IhhkiQIM/IpQJPPCVqMNd4kqbLVF3GYeVGY5GXdIhqp1MBYovG4
	737/tlvV/piteUPOGypR6MiyAD3W+g/KA+WVx/O+atr79Y9tDQEPw+Xn0LtwG8eJDSHy
	OvRQ+4+FjuIUcb2LV5Rt0uUrtld8K7QB2CSG1tFRYcFmri0DRSp5/A5cAYG8x2fdz3zf
	0xJlvXtVCJ/ZP8WUTkDt/PwYZbVTqsVH0q5vAsx75ApjdSOLH38dL+ELQ9GNk5LfhLOB
	L8vp0Ewa1QsnHyiUWihKlemtqiQG8ZbSZqhc4hVgcUeUCoK/NCJLPRzT2fu22m3K3WFA
	8vTw==
X-Gm-Message-State: AElRT7H20uPkm9ujPDRsrYcEFxhOlGIJg1OZ6fe2mg5qh33+2y/fsFlU
	ynsI7I2DIANXEauA1TX779QXxq/TZdWLz2mup41S7A==
X-Google-Smtp-Source: AG47ELudZxHC1OKiainz18/TtKNzQjgekziUt+B44csib3fH+DMB/mXMqRWrNmJcDriOVas+xrmG37YaZtyA78qJ65k=
X-Received: by 10.107.183.4 with SMTP id h4mr20049731iof.201.1521627058496;
	Wed, 21 Mar 2018 03:10:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:10:38 -0700 (PDT)
In-Reply-To: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:10:38 +0000
Message-ID: <CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-openembeded] bug in adding network layer
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
X-List-Received-Date: Wed, 21 Mar 2018 10:10:57 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b8e084d84370567e9688a"

--94eb2c0b8e084d84370567e9688a
Content-Type: text/plain; charset="UTF-8"

First, you don't need meta-networking to make networking "work", because
oe-core has the basics.

Second, you need to match the release of layers.  You're using
meta-networking master, and a previous release of poky.  Checkout the
corresponding release branch of meta-networking.

Ross

On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:

> I am tryiing to add meta-networking layer (to get Internet connection to
> poky)and i have included the following line of code in bbconfig file
> /home/jarvis/poky/meta-openembedded/meta-networking \
>
> but while building i get this below error
>
>
> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-
> openembedded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
> Traceback (most recent call last):
> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
> expression was     python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d,
> '-j%d', limit=64)}
>  which triggered exception AttributeError: module 'oe.utils' has no
> attribute 'parallel_make_argument'
>
>
> DO help,
>
> is there any other way to establish Internet connection inside poky?
>
> Thanks
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c0b8e084d84370567e9688a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">First, you don&#39;t need meta-networking to make networki=
ng &quot;work&quot;, because oe-core has the basics.<div><br></div><div>Sec=
ond, you need to match the release of layers.=C2=A0 You&#39;re using meta-n=
etworking master, and a previous release of poky.=C2=A0 Checkout the corres=
ponding release branch of meta-networking.</div><div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 Ma=
rch 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajat=
hcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>I am tryii=
ng to add meta-networking layer (to get Internet connection to poky)and i h=
ave included the following line of code in bbconfig file <br>/home/jarvis/p=
oky/meta-<wbr>openembedded/meta-networking \<br><br></div>but while buildin=
g i get this below error<br><br><div><div><br>ERROR: ExpansionError during =
parsing /home/jarvis/poky/meta-<wbr>openembedded/meta-networking/<wbr>recip=
es-support/libtdb/<a href=3D"http://libtdb_1.3.15.bb" target=3D"_blank">lib=
tdb_<wbr>1.3.15.bb</a><br>Traceback (most recent call last):<br>bb.data_sma=
rt.ExpansionError: Failure expanding variable do_compile, expression was=C2=
=A0=C2=A0=C2=A0=C2=A0 python ./buildtools/bin/waf ${@oe.utils.parallel_make=
_<wbr>argument(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0which triggered exc=
eption AttributeError: module &#39;oe.utils&#39; has no attribute &#39;para=
llel_make_argument&#39;<br><br><br></div><div>DO help,<br><br></div><div>is=
 there any other way to establish Internet connection inside poky?<br><br><=
/div><div>Thanks<br></div><div><br></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c0b8e084d84370567e9688a--
