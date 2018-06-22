Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7675B74C63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:59:08 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id t133-v6so6539643oif.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rIMhYHofX9n8itwTLfqCXfprXZHG05U/0tQyzx/4Yu4=;
	b=WBNjWrvcEa8F0EH7IRJnqAUjTEJXrHvBryjoF8pJOM+JpHlocwARcF75UIYq1X2MKq
	1pOr0v7tLVyKb4qSOGNvHLyxRsM8xuEoUhoYGNrmp2A1438KMysID1UGY2FhGlBLBY4x
	GLHQLpyWCfJzBLK6daDyAZ4/PbCk2XjJX2NufzQ1jGcPWVUBL+VFSEU8S724qidqojv9
	Z19B0biZIhZAXiaoHr2v1LIoliqMoxgQ9bmtB+MVtTcWFV/6oBbNOAD4Rt5hDaEmfjQg
	NWDwSxjnPYfumJxpikcRqF55kkAJyxG1X4SydpcEmZOenip5xSUXgOWt2YPjFZ+qRaK1
	EBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rIMhYHofX9n8itwTLfqCXfprXZHG05U/0tQyzx/4Yu4=;
	b=LpxI2ZSKPIiAztKn1G4ZG4NoZX36M8zSdhKS1oyhG17MD2QUav7S455jYF/1D7e0Qt
	7Mpu76HsIYH2s6Oy3yTqqTKks1GdK1W9jUYd97QxIax6ghcGXagWtlXZnh/Um363Ulrs
	CHTBb/152mGKx1d0RdDc/r4RTd7xAovYgyaEze+cWJWKQx+KP88JFBYJ+xVdvrLGwPab
	LJbPaVVqrpF3nFgQjonAjkjUdDiVXoa+n0D3MpbA1g9FiepqA0OFehFQFFIp0ctdIzM1
	qWT63T6pXn1B5d+9p4ateQVtfZzS9qI93+I0qa4cu58M3tNeMGlXG5z600K/CFcVsCP0
	nU6w==
X-Gm-Message-State: APt69E013GgFb/x6ytCkFMMF9iQb6kDuV+uZKgB1aWJecgPOdRdh57b1
	YzpEykhmbbip3KP+JynSFhyG6LmCOp/e0tJRAHU=
X-Google-Smtp-Source: ADUXVKLbd4PHGQYXRxgoNKRPPbPikWpt1UzC62DN/kX2Rf/tS9gXjznCKAnM9yAdbNbHlkTbdRBnET9pCu2JfTCmgyQ=
X-Received: by 2002:aca:eb0f:: with SMTP id
	j15-v6mr1104688oih.85.1529683149447; 
	Fri, 22 Jun 2018 08:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1529603271.git.chris_larson@mentor.com>
	<61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
	<83bb6e51f031775c329e8d23f1d97151753e1f7d.camel@linuxfoundation.org>
	<CABcZAN=aMU1Y7SFJwsJBnF=yKTZsbdx0=TwvsO7cp9HYbWyAcQ@mail.gmail.com>
In-Reply-To: <CABcZAN=aMU1Y7SFJwsJBnF=yKTZsbdx0=TwvsO7cp9HYbWyAcQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 22 Jun 2018 08:58:57 -0700
Message-ID: <CABcZANn0HHPvhkX+81-BHrrgP45p6jjPNU3W9Dpb=OgewZgApw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] bbpath-intercepts.bbclass: add class
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
X-List-Received-Date: Fri, 22 Jun 2018 15:59:08 -0000
Content-Type: multipart/alternative; boundary="000000000000bde7b1056f3d1c44"

--000000000000bde7b1056f3d1c44
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 22, 2018 at 8:10 AM Christopher Larson <kergoth@gmail.com>
wrote:

>
>
> On Fri, Jun 22, 2018 at 12:42 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Fri, 2018-06-22 at 02:08 +0500, Christopher Larson wrote:
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > This class sets POSTINST_INTERCEPTS and
>> > POSTINST_INTERCEPTS_CHECKSUMS,
>> > to allow us to pull intercepts from BBPATH. This is kept as a
>> > separate
>> > class, as it's needed by both image construction and sdk
>> > construction,
>> > the latter to support meta-toolchain & similar recipes.
>> >
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > ---
>> >  meta/classes/bbpath-intercepts.bbclass | 23 +++++++++++++++++++++++
>> >  1 file changed, 23 insertions(+)
>> >  create mode 100644 meta/classes/bbpath-intercepts.bbclass
>>
>> We're struggling a bit with classes and namespaces. I'm wondering if
>> this might be better as "image-postinst-intercepts.bbclass" or similar.
>> That would mean the variable namespace matches the class and that the
>> image classes are more 'together'.
>>
>> Your next patch will need rebasing against the changes that just merged
>> into master in image.bbclass.
>>
>> I have also wondered about pushing more code to lib/oe but I can see
>> why this makes sense as a bbclass.
>>
>
> Yeah, I think in this case this works as a class, but you're right, we
> should probably shift more to the python package. Namespacing is probably a
> good idea, we've talked about doing that more in the past. In this case
> it's technically not image-only, though an sdk uses the same underlying
> functionality, so it's debatable. I wonder if we should namespace into a
> subdirectory to also make it easier to make sense of classes/ at a
> command-line, i.e. inherit image/postinst-intercepts.bbclass? Hmmm.
>

I'll submit a v2 rebased with the class renamed as you suggested for now,
later today. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000bde7b1056f3d1c44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 22, 2018 at 8:10 AM Christopher Larson &lt;<a href=3D"mailto:kergoth@=
gmail.com">kergoth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Fri, Jun 22, 2018 at 12:42 AM Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfou=
ndation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
2018-06-22 at 02:08 +0500, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; <br>
&gt; This class sets POSTINST_INTERCEPTS and<br>
&gt; POSTINST_INTERCEPTS_CHECKSUMS,<br>
&gt; to allow us to pull intercepts from BBPATH. This is kept as a<br>
&gt; separate<br>
&gt; class, as it&#39;s needed by both image construction and sdk<br>
&gt; construction,<br>
&gt; the latter to support meta-toolchain &amp; similar recipes.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/bbpath-intercepts.bbclass | 23 ++++++++++++++++++++=
+++<br>
&gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/classes/bbpath-intercepts.bbclass<br>
<br>
We&#39;re struggling a bit with classes and namespaces. I&#39;m wondering i=
f<br>
this might be better as &quot;image-postinst-intercepts.bbclass&quot; or si=
milar.<br>
That would mean the variable namespace matches the class and that the<br>
image classes are more &#39;together&#39;.<br>
<br>
Your next patch will need rebasing against the changes that just merged<br>
into master in image.bbclass.<br>
<br>
I have also wondered about pushing more code to lib/oe but I can see<br>
why this makes sense as a bbclass.<br></blockquote><div><br></div><div clas=
s=3D"">Yeah, I think in this case this works as a class, but you&#39;re rig=
ht, we should probably shift more to the python package. Namespacing is pro=
bably a good idea, we&#39;ve talked about doing that more in the past. In t=
his case it&#39;s technically not image-only, though an sdk uses the same u=
nderlying functionality, so it&#39;s debatable. I wonder if we should names=
pace into a subdirectory to also make it easier to make sense of classes/ a=
t a command-line, i.e. inherit image/postinst-intercepts.bbclass? Hmmm.</di=
v></div></div></blockquote><div><br></div><div>I&#39;ll submit a v2 rebased=
 with the class renamed as you suggested for now, later today. Thanks.<br><=
/div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div></d=
iv>

--000000000000bde7b1056f3d1c44--
