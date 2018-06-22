Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 668CD75522
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:10:37 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id l15-v6so7837461oth.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PuK64pP5RL1l8Sibwyb8f8bMVMlGdFulFyOFzCSGKk4=;
	b=UOm8SqtkkSYIR8sB7FBFXhj3bKM5LJzbjzKg9ppEPnAOp159N+1qHlS44Dy/P5gr/c
	YQQ8wY2MpVP5OU7Vex1tFh361Jtu/BV8+p0Y+ArPFifYignU8KrKjDA1MorpiqR8N0Fr
	7jwIdqY1uv5SauIsBnMuifgeLNlkQubKxqTzNpddkpO0Avu/cLmWaH0uR7IqLhxad3yh
	F3OPdvsmrhIcRDgzovcXzIKoiaZJl5s6K4Xb/pINCS2iW8s6SxNh3VnwWZXZ4qMbfEwA
	Ns6SIcTaKtghykh1IOwsOKt2n4sDUyH9TO1SbPFDSRn3SC4sAUPLa3gInzACzfXa4GF9
	2VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PuK64pP5RL1l8Sibwyb8f8bMVMlGdFulFyOFzCSGKk4=;
	b=CS87sN2ZpLQjmYlxnSWiixW43Khrtg4G77s6jh31d8tzuVVQWo84n89JwLH89lErgS
	9DvpOJcN8cNinnq58YQVeTuu6in1tUaN0fc2ZoN2EDs9zVzwniC9C35vQRnw2XscFwQv
	7XZkN0JvmxPAPXorrHFaT74S9Qgjr0alccHEx2vutU9dw4gfhStRnDnzzkD3Jwkhtpgl
	ONok9063gByGWFVrWrc2uzuKhpr3FuTXCB8AvKjPXk9BQGA9iPRe7UvSIqgHNqtPii90
	jWwyKAiiv5zEH1SMof6dGZ882pi40NukRqsRG3EI/KSa5oRrhrZ184z+8ji1MNSxgKvu
	6Bsg==
X-Gm-Message-State: APt69E1XhCCNDkqFfJLOutIXGc9dt2PEkjcYnTdHRaX/jVYry+sIk7sj
	cBHQpGD6jf6B2WgVByI2qlilwmF6MzbD+425e7nbAQ==
X-Google-Smtp-Source: ADUXVKK3FoNKaCHDaHa3yO+L/RXMxdHzRngjTPkCJdqKo94jbYx9VvJTCBeGWwJQ2SyxV8TE/WpUTzry+04PYoE3vcY=
X-Received: by 2002:a9d:2104:: with SMTP id i4-v6mr116451otb.275.1529680238264;
	Fri, 22 Jun 2018 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1529603271.git.chris_larson@mentor.com>
	<61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
	<83bb6e51f031775c329e8d23f1d97151753e1f7d.camel@linuxfoundation.org>
In-Reply-To: <83bb6e51f031775c329e8d23f1d97151753e1f7d.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 22 Jun 2018 08:10:26 -0700
Message-ID: <CABcZAN=aMU1Y7SFJwsJBnF=yKTZsbdx0=TwvsO7cp9HYbWyAcQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Jun 2018 15:10:37 -0000
Content-Type: multipart/alternative; boundary="00000000000038c574056f3c6fb4"

--00000000000038c574056f3c6fb4
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 22, 2018 at 12:42 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-06-22 at 02:08 +0500, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This class sets POSTINST_INTERCEPTS and
> > POSTINST_INTERCEPTS_CHECKSUMS,
> > to allow us to pull intercepts from BBPATH. This is kept as a
> > separate
> > class, as it's needed by both image construction and sdk
> > construction,
> > the latter to support meta-toolchain & similar recipes.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/classes/bbpath-intercepts.bbclass | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta/classes/bbpath-intercepts.bbclass
>
> We're struggling a bit with classes and namespaces. I'm wondering if
> this might be better as "image-postinst-intercepts.bbclass" or similar.
> That would mean the variable namespace matches the class and that the
> image classes are more 'together'.
>
> Your next patch will need rebasing against the changes that just merged
> into master in image.bbclass.
>
> I have also wondered about pushing more code to lib/oe but I can see
> why this makes sense as a bbclass.
>

Yeah, I think in this case this works as a class, but you're right, we
should probably shift more to the python package. Namespacing is probably a
good idea, we've talked about doing that more in the past. In this case
it's technically not image-only, though an sdk uses the same underlying
functionality, so it's debatable. I wonder if we should namespace into a
subdirectory to also make it easier to make sense of classes/ at a
command-line, i.e. inherit image/postinst-intercepts.bbclass? Hmmm.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000038c574056f3c6fb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 22, 2018 at 12:42 AM Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Fri, 2018-06-22 at 02:08 +0500, =
Christopher Larson wrote:<br>
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
why this makes sense as a bbclass.<br></blockquote><div><br></div><div>Yeah=
, I think in this case this works as a class, but you&#39;re right, we shou=
ld probably shift more to the python package. Namespacing is probably a goo=
d idea, we&#39;ve talked about doing that more in the past. In this case it=
&#39;s technically not image-only, though an sdk uses the same underlying f=
unctionality, so it&#39;s debatable. I wonder if we should namespace into a=
 subdirectory to also make it easier to make sense of classes/ at a command=
-line, i.e. inherit image/postinst-intercepts.bbclass? Hmmm.<br></div></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>ker=
goth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Sen=
ior Software Engineer, Mentor Graphics</div></div></div></div></div>

--00000000000038c574056f3c6fb4--
