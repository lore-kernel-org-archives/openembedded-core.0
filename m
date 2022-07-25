Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F962C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 09:00:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.25996.1658739642724053767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oADuUnZL;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id w15so8982530lft.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZ979Mr2gGgpsD5eT/wFiu2867iJmkJN8LfBQVpmuL4=;
        b=oADuUnZLIMw09l++MFCWKNyjriPGyFyYjZn7r8+7bbOTnNZyQ8yd8h0sWA8lTuuHkC
         YqukhJVbRzpg3bu6vqpvsulf7Dz3dkQY3auaHWgLFBNeluzxNBfaveKpH/mJDnEJEslW
         L5YK2x5TRGD5oqs0w/pwzrdSHvaskyhUWN9cYuJnlbA4NaXYlfclgLU2vmzq6Zy7eFjA
         M7YWp16tShcxXxGkToeT1LFWfqPAraMQpKFnlMIdeAjYhOdzExHskEJlNvdXUbQNioC7
         oiXVd4lVQQH6h2oa6W9XoJXROy3lBNRzfdSsspdqA6Zq+JpkCSUmylEDAXFoctIYxI4r
         9CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZ979Mr2gGgpsD5eT/wFiu2867iJmkJN8LfBQVpmuL4=;
        b=LnCv1JJ+dT8SVo1VtS3phLDrApjziVB3P05kRS2DZjC2H9tYgk30mhb4glE4P3hf3k
         eBemy7C2tkfWxTQ6YZEa3NdDn88iQRqoSRo7P9NuEooEZjFQmCy3QeqVpgYkHLjWARM5
         dCOZlsrs5OTbBGj3MoqiEDHmvMRuG8JUDKQ7HBusy4jVWDY0GEtZej1h1Cqq24kDxZGc
         FTttAy/RQiA+6wpxxifqRFINcdzT/9PTB5oTSvw2EzpN16tMRujXUSH8Q25RwLXtLhJS
         5HoA8pXgQVl46UP3RCwtLl6UdiRGNs6Ee6EvxHXrZPeiD+hnKm0BYDtyQUbyUtakTj8v
         U5hg==
X-Gm-Message-State: AJIora+w91zp0VRDLjHBvUITxJ1+SSfxH8A/AVeB6OhZtw9R9DHWdHJ0
	cVLr9ixqvtTCl+UNjPP3AyAo03MLOcHU+ia9t+U=
X-Google-Smtp-Source: 
 AGRyM1tnc+Lz9TPOigLyFRJecwWt4GrmtpR9oPjebey6LBVwYhz5TgfPaQLDjVoqaJRyTPkIDUplOPlL3WeqLxTbcHw=
X-Received: by 2002:a05:6512:1088:b0:48a:845c:452f with SMTP id
 j8-20020a056512108800b0048a845c452fmr3145851lfg.471.1658739640481; Mon, 25
 Jul 2022 02:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220722123124.390710-1-jose.quaresma@foundries.io>
 <20220722123124.390710-2-jose.quaresma@foundries.io>
 <a14df0caa6e07cbc042ac622758f97056608a2f8.camel@linuxfoundation.org>
In-Reply-To: 
 <a14df0caa6e07cbc042ac622758f97056608a2f8.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 25 Jul 2022 10:00:29 +0100
Message-ID: 
 <CANPvuR=dCJpMFKSV_ZfhGDZ8WiwERdfePK7=4Ryqzsiyia+J_Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] archiver.bbclass: avoid kernel rebuilds
 caused by the do_unpack_and_patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000000bbc8b05e49d6b9d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 09:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168474

--0000000000000bbc8b05e49d6b9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 24/07/2022 =C3=A0(s) 10:53:

> On Fri, 2022-07-22 at 13:31 +0100, Jose Quaresma wrote:
> > The commit b8c5680 [1] add the funcion is_work_shared and at the same
> > time change from kernel-yocto.bbclass to a more generic kernel.bbclass.
> >
> > This is also a fixup for the commit fed0ed8 [2] to avoid kernel rebuild=
s
> > because of the do_kernel_configme->do_unpack_and_patch task dependency.
> >
> > [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3Db8c5680a67888=
d43540366a40bd0c501e926ac31
> > [2]
> https://git.openembedded.org/openembedded-core/commit/?id=3Dfed0ed82928e6=
a7846fbad233ac657bd17bcefc7
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/archiver.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/archiver.bbclass
> b/meta/classes/archiver.bbclass
> > index 5da369d422..9c605cc932 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -610,6 +610,6 @@ python () {
> >      # sstatesig.py:sstate_rundepfilter has special support that
> excludes this dependency
> >      # so that do_kernel_configme does not need to run again when
> do_unpack_and_patch
> >      # gets added or removed (by adding or removing archiver.bbclass).
> > -    if bb.data.inherits_class('kernel-yocto', d):
> > +    if bb.data.inherits_class('kernel', d):
> >          bb.build.addtask('do_kernel_configme', 'do_configure',
> 'do_unpack_and_patch', d)
> >  }
>
> This doesn't look right since do_kernel_configme is only available in
> kernel-yocto.bbclass, not from kernel.bbclass?
>

Right, thanks for reviewing and sorry for that. Please drop this patch.

I don't even know how I got here because in fact we use
kernel-yocto.bbclass in our kernel,
when debugging the patch 3/3 and during blaming I made some confusion and
concluded it wrongly.

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000bbc8b05e49d6b9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia domingo, 24/07/2022 =C3=A0(s) 10:53:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Fri, 2022-07-22 at 13:31 +0100,=
 Jose Quaresma wrote:<br>
&gt; The commit b8c5680 [1] add the funcion is_work_shared and at the same<=
br>
&gt; time change from kernel-yocto.bbclass to a more generic kernel.bbclass=
.<br>
&gt; <br>
&gt; This is also a fixup for the commit fed0ed8 [2] to avoid kernel rebuil=
ds<br>
&gt; because of the do_kernel_configme-&gt;do_unpack_and_patch task depende=
ncy.<br>
&gt; <br>
&gt; [1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3Db8c5680a67888d43540366a40bd0c501e926ac31" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Db8c568=
0a67888d43540366a40bd0c501e926ac31</a><br>
&gt; [2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3Dfed0ed82928e6a7846fbad233ac657bd17bcefc7" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dfed0ed=
82928e6a7846fbad233ac657bd17bcefc7</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/archiver.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbc=
lass<br>
&gt; index 5da369d422..9c605cc932 100644<br>
&gt; --- a/meta/classes/archiver.bbclass<br>
&gt; +++ b/meta/classes/archiver.bbclass<br>
&gt; @@ -610,6 +610,6 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # sstatesig.py:sstate_rundepfilter has special sup=
port that excludes this dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # so that do_kernel_configme does not need to run =
again when do_unpack_and_patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # gets added or removed (by adding or removing arc=
hiver.bbclass).<br>
&gt; -=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;kernel-yocto&#39;, d):<b=
r>
&gt; +=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;kernel&#39;, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_kernel_conf=
igme&#39;, &#39;do_configure&#39;, &#39;do_unpack_and_patch&#39;, d)<br>
&gt;=C2=A0 }<br>
<br>
This doesn&#39;t look right since do_kernel_configme is only available in<b=
r>
kernel-yocto.bbclass, not from kernel.bbclass?<br></blockquote><div><br></d=
iv><div>Right, thanks=C2=A0for reviewing=C2=A0and sorry for that.=C2=A0Plea=
se drop this patch.</div><div><br></div><div>I don&#39;t even know how I go=
t here because in fact we use kernel-yocto.bbclass in our kernel,</div><div=
>when debugging=C2=A0the patch 3/3 and during blaming=C2=A0I made some conf=
usion and concluded it wrongly.</div><div><br></div><div>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000bbc8b05e49d6b9d--

