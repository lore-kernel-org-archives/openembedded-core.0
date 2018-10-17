Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25AEE79B16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:20:09 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c32so26773195otb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3QS+eOcdy8t7biHyjeWKp4yySHL+kbsWqJhrru4p70o=;
	b=Ecd4uHQgaDKVdNXwvWELCgETXYQOQ7wWMbgq34ixk6bpSzrbjIN+qMhCmBrugLQ3b2
	bxiCD9LJmniWy8AlHvdet7hHrm39NilAQ4J3sTQzbKrdhmB0N0O9HlUi3unC0hTC3X3h
	XsD8nhd2j/MsrlGYgiEXSAKGU0t22vRKk/TOmhDlP6ad69ZixsFh35x/Pj5m78vaygk/
	0HixHFTb7ygdGkFABErtOV9wSiwEVeER+AQru0AsrwlCrMbOs4XVza2vKMn7PGFr+fuE
	+qRj8gD5FzIFHSNzVnhoCcHNBWVLjoVxr5tAiZcr4EXX3wRJZiAopki2Qh6QE2a3lm6Z
	bhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3QS+eOcdy8t7biHyjeWKp4yySHL+kbsWqJhrru4p70o=;
	b=WRNMT2TwtvvGsvwrpAsMN34ylUiBInW2QY6oy1QG/6yALGiGnln+j3nyfyO1wrOs9W
	2DjWJNPQxZxTdwa9s/g3Xaw4Ea6u1cKAie513N/644bh45ni8X6T3fscQEw/m8HBQYa2
	m6pdftxYAK0zW+3oQDaBccI+3xMubqDbhF9D/gpVQ9AiRiQhnXDSP3QlYU/5yVPxOhBI
	FULm4Byv3pqF4kVMIiyW6Q3C/TWVYI86q5L1MgwLddAs87/NIVY67AYwhZs3p1u+fR0n
	k+XY6J914IJ6OOI87GdFc1b8E++LWqYFQqBMdCcCmp01nnB4Paj5HDPf20KcYjRbi7Jo
	eGWg==
X-Gm-Message-State: ABuFfogBDFGSayw5qJEAusCgvK9KeMD3gaOkD7Qt4hpeuHYrKfYTrUv9
	ivOA1P+FMnxTIVYRyLHYShxb2r63Q3uRn7Epx41KGw==
X-Google-Smtp-Source: ACcGV625klXRMQqCflf2WpDZ5d2UxtmjxvikJCAXKzHv6tRjrK4k78Au9mfuCCR3jOR9t9oO8hpTPXUCYcu185kD79A=
X-Received: by 2002:a9d:758f:: with SMTP id s15mr16527198otk.353.1539793211013;
	Wed, 17 Oct 2018 09:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
	<333ac1ec-594d-ebc8-4855-af533f1b016c@windriver.com>
In-Reply-To: <333ac1ec-594d-ebc8-4855-af533f1b016c@windriver.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 18:19:58 +0200
Message-ID: <CA+4=imbw4S+DynKxn=MpVo2zEsg3ucCm+LXbiTsN1bNRvU=i8A@mail.gmail.com>
To: mark.hatle@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 16:20:10 -0000
Content-Type: multipart/alternative; boundary="0000000000005ed4a405786f0b0a"

--0000000000005ed4a405786f0b0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 oct. 2018 =C3=A0 17:58, Mark Hatle <mark.hatle@windriver.com> a
=C3=A9crit :

> On 10/17/18 10:46 AM, Martin Jansa wrote:
> > well, I realized that this won't work with the BLUEZ intentionally set
> to empty
> > value and setting BLUEZ to no-bluetooth globally also probably won't
> work for
> > cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline
> python
> > appending only either bluez4 or bluez5 alternative here?
>
> I'm slightly confused.  In the suggestion you made below, ??=3D within th=
e
> specific package, why would 'no-bluetooth' cause a problem.  For all othe=
r
> recipes it will remain blank as expected.
>

I guess the problem is more when it is globally set to "", we would anyway
need to handle that
case in addition to our recipe-specific default.


> --Mark
>
> > On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.co=
m
> > <mailto:yann.dirson@blade-group.com>> wrote:
> >
> >     Yeah, that looks like a better idea.
> >
> >     Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail=
.com
> >     <mailto:martin.jansa@gmail.com>> a =C3=A9crit :
> >
> >         What about using some less confusing default BLUEZ value?
> RDEPENDS_
> >         looks wrong.
> >
> >         BLUEZ ??=3D "no-bluetooth"
> >         RDEPENDS_no-bluetooth =3D ""
> >
> >         Might be a bit more clear.
> >
> >         On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com
> >         <mailto:yann.dirson@blade-group.com>> wrote:
> >
> >             From: Yann Dirson <yann@blade-group.com <mailto:
> yann@blade-group.com>>
> >
> >             Otherwise the build fails with:
> >
> >               NOTE: Runtime target '${RDEPENDS_}' is unbuildable,
> removing...
> >               Missing or unbuildable dependency chain was:
> ['${RDEPENDS_}']
> >
> >             This restores some truth in the "Otherwise install nothing"
> comment
> >             in the recipe.
> >
> >             Signed-off-by: Yann Dirson <yann@blade-group.com
> >             <mailto:yann@blade-group.com>>
> >             ---
> >              .../packagegroups/packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>               | 2
> ++
> >              1 file changed, 2 insertions(+)
> >
> >             diff --git
> >             a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             index 0ede5e57b..e81516fef 100644
> >             ---
> >             a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             +++
> >             b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
> >                      '', d)} \
> >              "
> >
> >             +RDEPENDS_ =3D ""
> >             +
> >              # Install bluez4 tools or bluez5 tools depending on what i=
s
> >             specified in the distro.
> >              # Otherwise install nothing.
> >              RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> >             --
> >             2.19.1
> >
> >             --
> >             _______________________________________________
> >             Openembedded-core mailing list
> >             Openembedded-core@lists.openembedded.org
> >             <mailto:Openembedded-core@lists.openembedded.org>
> >
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >     --
> >     Yann Dirson <yann@blade-group.com <mailto:yann@blade-group.com>>
> >     Blade -- 38 rue du Sentier, 75002 Paris
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


--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

--0000000000005ed4a405786f0b0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=
=A0mer. 17 oct. 2018 =C3=A0=C2=A017:58, Mark Hatle &lt;<a href=3D"mailto:ma=
rk.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 10/17/18 10:46 AM, Martin Jans=
a wrote:<br>
&gt; well, I realized that this won&#39;t work with the BLUEZ intentionally=
 set to empty<br>
&gt; value and setting BLUEZ to no-bluetooth globally also probably won&#39=
;t work for<br>
&gt; cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline p=
ython<br>
&gt; appending only either bluez4 or bluez5 alternative here?<br>
<br>
I&#39;m slightly confused.=C2=A0 In the suggestion you made below, ??=3D wi=
thin the<br>
specific package, why would &#39;no-bluetooth&#39; cause a problem.=C2=A0 F=
or all other<br>
recipes it will remain blank as expected.<br></blockquote><div><br></div><d=
iv>I guess the problem is more when it is globally set to &quot;&quot;, we =
would anyway need to handle that</div><div>case in addition to our recipe-s=
pecific default.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
--Mark<br>
<br>
&gt; On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson &lt;<a href=3D"mailto:yann=
.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a><=
br>
&gt; &lt;mailto:<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_b=
lank">yann.dirson@blade-group.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yeah, that looks like a better idea.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A017:27, Martin=
 Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">mart=
in.jansa@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:martin.jansa@gmail.com=
" target=3D"_blank">martin.jansa@gmail.com</a>&gt;&gt; a =C3=A9crit=C2=A0:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0What about using some less confusing =
default BLUEZ value? RDEPENDS_<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0looks wrong.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BLUEZ ??=3D &quot;no-bluetooth&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RDEPENDS_no-bluetooth =3D &quot;&quot=
;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Might be a bit more clear.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Oct 17, 2018 at 5:08 PM &lt;<=
a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson=
@blade-group.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yann.dir=
son@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0From: Yann Dirson &lt;<=
a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.c=
om</a> &lt;mailto:<a href=3D"mailto:yann@blade-group.com" target=3D"_blank"=
>yann@blade-group.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Otherwise the build fai=
ls with:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 NOTE: Runtime ta=
rget &#39;${RDEPENDS_}&#39; is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Missing or unbui=
ldable dependency chain was: [&#39;${RDEPENDS_}&#39;]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This restores some trut=
h in the &quot;Otherwise install nothing&quot; comment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in the recipe.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Yann Dir=
son &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blad=
e-group.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../packagegroups=
/<a href=3D"http://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" targ=
et=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/packagegroup-tools-bluetooth.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 2=
 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-conne=
ctivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-conne=
ctivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index 0ede5e57b..e81516=
fef 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-conne=
ctivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-conne=
ctivity/packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/packagegroup-tools-bluetooth.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -32,6 +32,8 @@ RDEPE=
NDS_bluez5 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+RDEPENDS_ =3D &quot;&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# Install bluez4 =
tools or bluez5 tools depending on what is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified in the distro=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# Otherwise insta=
ll nothing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0RDEPENDS_${PN} =
=3D &quot;${RDEPENDS_${BLUEZ}}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.19.1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_______________________=
________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openembedded-core maili=
ng list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@li=
sts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:Openembedded-core@lists.openembedded.org" target=3D"_blank">Openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists=
.openembedded.org/mailman/listinfo/openembedded-core" rel=3D"noreferrer" ta=
rget=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembedded=
-core</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.=
com" target=3D"_blank">yann@blade-group.com</a> &lt;mailto:<a href=3D"mailt=
o:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Blade -- 38 rue du Sentier, 75002 Paris<br>
&gt; <br>
&gt; <br>
&gt; <br>
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
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ya=
nn Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yan=
n@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></d=
iv></div></div></div>

--0000000000005ed4a405786f0b0a--
