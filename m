Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4FB74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:36:18 +0000 (UTC)
Received: by vkbf67 with SMTP id f67so36879442vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XiynbhrSvIqpdLyddCd3+JVNbdu6fzof9U6ooF/X+kc=;
	b=uj9uzaFvPxifttYxncJEmK5AIlhu4ZywxJL9rZ382+c+X0xqFbThSdTcXMITiH0pEn
	a5j9DZ/EOnFePftwuPVXGJGPAMdtrDCUZ+kD0nE8YKsYOzyvb25lxDz5c1Lbw127czo+
	fU47rU7K62CD7w45yPXDTAnxONmZo82P9aINrYbP0YE2Ld5yzIdYgNH/iuV4XL/Jbrm9
	9CGc2GXHYVuJglb6nLBOnq3zWQTChdhauV2EDJ7RiRr790bDYVzgAWmbwqqAsG3kFYP4
	bPi+ETYGsLW6jqDtFgOLdZ3yvXIDr3WjZqJy0W1XggKmGzdbTQhI9lqTxm3Q+PARPYJ9
	ipEg==
X-Received: by 10.52.230.130 with SMTP id sy2mr22850827vdc.50.1441042578561;
	Mon, 31 Aug 2015 10:36:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Mon, 31 Aug 2015 10:35:59 -0700 (PDT)
In-Reply-To: <CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 31 Aug 2015 10:35:59 -0700
X-Google-Sender-Auth: -oaCO0xF8Wixa92W1UswZLxFiLU
Message-ID: <CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 17:36:19 -0000
Content-Type: multipart/alternative; boundary=001a11c25544006122051e9edf83

--001a11c25544006122051e9edf83
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
> > On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com> wrote:
> >> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
> >> exception, there is no other occurance of GPL-3.0 use, lets mark the
> >> licence correctly.
> >
> > Unless the macro is actually shipped with any of the packages, I don't
> > think we actually need to do this. Generally, LICENSE should be the
> > intersection of all LICENSE_${PN}*.
>
> its not shipped on target,
>
> >
> > I think the correct fix here is actually:
> >
> > LICENSE = "GPLv2+ & PD"
>
> why did you drop LGPLv2.1+


I think we need a way to indicate the license of the source in addition to
the license of what we ship, to cover the case where the license affects
the ability to redistribute sources. I'd thought that the base LICENSE was
essentially that. If that's not the case, then we should give some careful
thought to how to cover both.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c25544006122051e9edf83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Aug =
31, 2015 at 10:05 AM, Flanagan, Elizabeth<br>
&lt;<a href=3D"mailto:elizabeth.flanagan@intel.com">elizabeth.flanagan@inte=
l.com</a>&gt; wrote:<br>
&gt; On 30 August 2015 at 17:31, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf<b=
r>
&gt;&gt; exception, there is no other occurance of GPL-3.0 use, lets mark t=
he<br>
&gt;&gt; licence correctly.<br>
&gt;<br>
&gt; Unless the macro is actually shipped with any of the packages, I don&#=
39;t<br>
&gt; think we actually need to do this. Generally, LICENSE should be the<br=
>
&gt; intersection of all LICENSE_${PN}*.<br>
<br>
</span>its not shipped on target,<br>
<span class=3D""><br>
&gt;<br>
&gt; I think the correct fix here is actually:<br>
&gt;<br>
&gt; LICENSE =3D &quot;GPLv2+ &amp; PD&quot;<br>
<br>
</span>why did you drop LGPLv2.1+</blockquote></div><br>I think we need a w=
ay to indicate the license of the source in addition to the license of what=
 we ship, to cover the case where the license affects the ability to redist=
ribute sources. I&#39;d thought that the base LICENSE was essentially that.=
 If that&#39;s not the case, then we should give some careful thought to ho=
w to cover both.<br>-- <br><div class=3D"gmail_signature">Christopher Larso=
n<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div=
>
</div></div>

--001a11c25544006122051e9edf83--
