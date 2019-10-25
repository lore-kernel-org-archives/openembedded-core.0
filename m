Return-Path: <yann.cardaillac@smile.fr>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A0ECB7FA3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:50:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v9so1141321wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dxWfwA7JR0h/pc08pR7WP/5QVxQ96KGHQGCEQiqg+Xs=;
	b=c+kA+5AHoZV2zgBOC5b2ApPmn12Y0IExyI+SY5esQmW2YbIc20BZaybu2np0LhkzOt
	/BGh0M69aegj/tRIdFAG8vnIR+JML0gt8a66K4ZELzksT3OlzLemuutnspzoC26i68k3
	qeZqqDllQ+UV3jGCnPwfi59Q5ev8UObdDle6JTkHw/GtIch17JWdssI3wJeo+0DepFnQ
	P8wrOAgPoDSMUx3c9cD1XKE92A1yCFchPi+cPevhV7M54iKHdsWiy8Oh+muTYTQ5AzWS
	R4QeCFn/6W34E6vU58qwnraoz5hBafPmxI3P293j9K3DV0sNso3PY6TNDKiSE+cR2mah
	akcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dxWfwA7JR0h/pc08pR7WP/5QVxQ96KGHQGCEQiqg+Xs=;
	b=RKVDd1fXx5pMrGDpeNoDXzT8zFzkldYPM4SYDGgNYmlvMmkoSZpRxE4c9uRTTCXpuE
	Fcf+lWM3FzWw19dZPSXHoLsQDLAA8Xw3zK3118lrPPn4ORd+9o4uTYnuhEmoocB5XrxM
	VEKMc/xlRxRvrpENXs5YjTrYZUE1DSMYQbLdOPm1um1bih0zVxnYxc3A1lybRTz+xYEv
	J1H8+DP2nS7lR1JjyhgIUKq3vOU4zOf/mtfVjsP+I8M8KM170C0X8+N0Eju4J0lra4K0
	+uat5tQ+jGsIltI3K4I8oNgB8pk+NrG8j/1o/Lwit7xaIW4eItUKulJ+yKaSuxSvgnxn
	lm/g==
X-Gm-Message-State: APjAAAVgT1btxaxBTG4+wEcVO+wN8qNfhlnCmorCYEzkVnnBYLe116pS
	Kgqn3UgnWKBId1N/19NGd2Qy7zkKXoPIzhZeilk9nQ==
X-Google-Smtp-Source: APXvYqxntWP7gUkmne7KcIC2w7UwB9rVxRm6HzbVCiOPjU+dKcjEC0yQOlmgz6r10imIbb7+1qy8MopXgJqbUwgAQQU=
X-Received: by 2002:adf:9185:: with SMTP id 5mr1624880wri.389.1571989813235;
	Fri, 25 Oct 2019 00:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA984JWqcX5oDhumXYBom+ZyxD+bo7oGmTzLx_tXejvPaR1UKQ@mail.gmail.com>
	<0d017fc3-b00b-cfeb-2b35-267b894e7d25@ni.com>
In-Reply-To: <0d017fc3-b00b-cfeb-2b35-267b894e7d25@ni.com>
From: Yann CARDAILLAC <yann.cardaillac@smile.fr>
Date: Fri, 25 Oct 2019 09:50:02 +0200
Message-ID: <CAA984JWrw5CasXR4UQ-qqb94KLYWzj3ZWjRFEGrm=uo751BesA@mail.gmail.com>
To: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Romain Naour <romain.naour@smile.fr>,
	"opkg-devel@googlegroups.com" <opkg-devel@googlegroups.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [opkg-devel] [yocto][PATCH][opkg] bug 13528 add SPDX id to opkg
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
X-List-Received-Date: Fri, 25 Oct 2019 07:50:13 -0000
X-Groupsio-MsgNum: 130491
Content-Type: multipart/mixed; boundary="00000000000068c93b0595b76601"

--00000000000068c93b0595b76601
Content-Type: multipart/alternative; boundary="00000000000068c9330595b766ff"

--00000000000068c9330595b766ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Here's patch v2

Thanks for your sharpened eyes !

Regards,

On Thu, Oct 24, 2019 at 9:39 PM Alejandro Del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Hi Yann,
>
> Thanks again for adding the headers. Your patch looks good, except for
> one line that has a duplicated header:
>
> /core/26_prefer_arch_to_version.py
> index 0a0d66b..82934c1 100755
> --- a/tests/core/26_prefer_arch_to_version.py
> +++ b/tests/core/26_prefer_arch_to_version.py
> @@ -1,4 +1,5 @@
> -#! /usr/bin/env python3
> +#! /usr/bin/env python3# SPDX-License-Identifier: GPL-2.0-only
> +# SPDX-License-Identifier: GPL-2.0-only
>   #
>
> could you send a v2? regarding m4 files, I looked around a bit and
> didn't find project adding SPDX identifiers to them....
>
> Cheers,
>
> Alejandro
>
> On 10/22/19 9:55 AM, Yann CARDAILLAC wrote:
> > Hi,
> >
> > I'm working on bug :
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13528
> > <
> https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D13528__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRz=
G2ASP_BdrxnvBnCnb0TyYNQ$
> >
> >
> >  I've a first patch proposal. Note that I didn't knew what to do with
> >  m4/gpgme.m4 the license header seems pretty weird to me...
> >
> > Regards,
> >
> > -- SMILE
> > <
> https://urldefense.com/v3/__http://www.smile.eu/__;!fqWJcnlTkjM!4DVD9lP2U=
dCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCnfbDCHYw$
> >
> >
> >  20 rue des Jardins 92600 Asni=C3=A8res-sur-Seine
> >
> >  *Yann CARDAILLAC* Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s
> >
> > email yann.cardaillac@smile.fr <mailto:yann.cardaillac@smile.fr> url
> > http://www.smile.eu
> > <
> https://urldefense.com/v3/__http://www.smile.eu__;!fqWJcnlTkjM!4DVD9lP2Ud=
CF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCmV9R4jPA$
> >
> >
> >
> >
> > Twitter
> > <
> https://urldefense.com/v3/__https://twitter.com/GroupeSmile__;!fqWJcnlTkj=
M!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCkq-mFzcw$
> >
> >  Facebook
> > <
> https://urldefense.com/v3/__https://www.facebook.com/smileopensource__;!f=
qWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCk8=
LxW08A$
> >
> >  LinkedIn
> > <
> https://urldefense.com/v3/__https://www.linkedin.com/company/smile__;!fqW=
JcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCk5-3=
y08w$
> >
> >  Github
> > <
> https://urldefense.com/v3/__https://github.com/Smile-SA__;!fqWJcnlTkjM!4D=
VD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnClEOxUzoA$
> >
> >
> >
> >
> >
> >
> > eco Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9cessai=
re
> >
> > -- You received this message because you are subscribed to the Google
> >  Groups "opkg-devel" group. To unsubscribe from this group and stop
> > receiving emails from it, send an email to
> > opkg-devel+unsubscribe@googlegroups.com
> > <mailto:opkg-devel+unsubscribe@googlegroups.com>. To view this
> > discussion on the web visit
> >
> https://groups.google.com/d/msgid/opkg-devel/CAA984JWqcX5oDhumXYBom%2BZyx=
D%2Bbo7oGmTzLx_tXejvPaR1UKQ%40mail.gmail.com
> >
> > <
> https://urldefense.com/v3/__https://groups.google.com/d/msgid/opkg-devel/=
CAA984JWqcX5oDhumXYBom*2BZyxD*2Bbo7oGmTzLx_tXejvPaR1UKQ*40mail.gmail.com?ut=
m_medium=3Demail&utm_source=3Dfooter__;JSUl!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J=
-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCn7bez8Tg$
> >.
>
> --
> >
> Cheers,
>
> Alejandro
>


--=20
[image: SMILE] <http://www.smile.eu/>

20 rue des Jardins
92600 Asni=C3=A8res-sur-Seine
*Yann CARDAILLAC*
Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s

[image: email] yann.cardaillac@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>


[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire

--00000000000068c9330595b766ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alejandro,</div><div><br></div><div>Here&#39;s pat=
ch v2<br></div><div><br></div><div>Thanks for your sharpened eyes !</div><d=
iv><br></div><div>Regards,<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2019 at 9:39 PM Alejand=
ro Del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com">alejand=
ro.delcastillo@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Yann,<br>
<br>
Thanks again for adding the headers. Your patch looks good, except for<br>
one line that has a duplicated header:<br>
<br>
/core/26_prefer_arch_to_version.py<br>
index 0a0d66b..82934c1 100755<br>
--- a/tests/core/26_prefer_arch_to_version.py<br>
+++ b/tests/core/26_prefer_arch_to_version.py<br>
@@ -1,4 +1,5 @@<br>
-#! /usr/bin/env python3<br>
+#! /usr/bin/env python3# SPDX-License-Identifier: GPL-2.0-only<br>
+# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0 #<br>
<br>
could you send a v2? regarding m4 files, I looked around a bit and <br>
didn&#39;t find project adding SPDX identifiers to them....<br>
<br>
Cheers,<br>
<br>
Alejandro<br>
<br>
On 10/22/19 9:55 AM, Yann CARDAILLAC wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I&#39;m working on bug : <br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13528" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D13528</a> <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D13528__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDh=
mAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCnb0TyYNQ$" rel=3D"noreferrer" target=3D"_b=
lank">https://urldefense.com/v3/__https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13528__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KM=
CFRzG2ASP_BdrxnvBnCnb0TyYNQ$</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 I&#39;ve a first patch proposal. Note that I didn&#39;t knew wha=
t to do with<br>
&gt;=C2=A0 m4/gpgme.m4 the license header seems pretty weird to me...<br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; -- SMILE <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__http://www.smile.eu/__;!fqW=
JcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCnfbD=
CHYw$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__htt=
p://www.smile.eu/__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5K=
MCFRzG2ASP_BdrxnvBnCnfbDCHYw$</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 20 rue des Jardins 92600 Asni=C3=A8res-sur-Seine<br>
&gt; <br>
&gt;=C2=A0 *Yann CARDAILLAC* Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s<br=
>
&gt; <br>
&gt; email <a href=3D"mailto:yann.cardaillac@smile.fr" target=3D"_blank">ya=
nn.cardaillac@smile.fr</a> &lt;mailto:<a href=3D"mailto:yann.cardaillac@smi=
le.fr" target=3D"_blank">yann.cardaillac@smile.fr</a>&gt; url<br>
&gt; <a href=3D"http://www.smile.eu" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.smile.eu</a> <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__http://www.smile.eu__;!fqWJ=
cnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCmV9R4=
jPA$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__http=
://www.smile.eu__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMC=
FRzG2ASP_BdrxnvBnCmV9R4jPA$</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Twitter <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://twitter.com/GroupeS=
mile__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_Bd=
rxnvBnCkq-mFzcw$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.c=
om/v3/__https://twitter.com/GroupeSmile__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-=
XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCkq-mFzcw$</a>&gt;<br>
&gt;=C2=A0 Facebook <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://www.facebook.com/sm=
ileopensource__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFR=
zG2ASP_BdrxnvBnCk8LxW08A$" rel=3D"noreferrer" target=3D"_blank">https://url=
defense.com/v3/__https://www.facebook.com/smileopensource__;!fqWJcnlTkjM!4D=
VD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCk8LxW08A$</a>&g=
t;<br>
&gt;=C2=A0 LinkedIn <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://www.linkedin.com/co=
mpany/smile__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG=
2ASP_BdrxnvBnCk5-3y08w$" rel=3D"noreferrer" target=3D"_blank">https://urlde=
fense.com/v3/__https://www.linkedin.com/company/smile__;!fqWJcnlTkjM!4DVD9l=
P2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCk5-3y08w$</a>&gt;<b=
r>
&gt;=C2=A0 Github <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://github.com/Smile-SA=
__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_Bdrxnv=
BnClEOxUzoA$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v=
3/__https://github.com/Smile-SA__;!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyD=
hmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnClEOxUzoA$</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; eco Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=C3=
=A9cessaire<br>
&gt; <br>
&gt; -- You received this message because you are subscribed to the Google<=
br>
&gt;=C2=A0 Groups &quot;opkg-devel&quot; group. To unsubscribe from this gr=
oup and stop<br>
&gt; receiving emails from it, send an email to<br>
&gt; <a href=3D"mailto:opkg-devel%2Bunsubscribe@googlegroups.com" target=3D=
"_blank">opkg-devel+unsubscribe@googlegroups.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:opkg-devel%2Bunsubscribe@googlegroups.com=
" target=3D"_blank">opkg-devel+unsubscribe@googlegroups.com</a>&gt;. To vie=
w this<br>
&gt; discussion on the web visit <br>
&gt; <a href=3D"https://groups.google.com/d/msgid/opkg-devel/CAA984JWqcX5oD=
humXYBom%2BZyxD%2Bbo7oGmTzLx_tXejvPaR1UKQ%40mail.gmail.com" rel=3D"noreferr=
er" target=3D"_blank">https://groups.google.com/d/msgid/opkg-devel/CAA984JW=
qcX5oDhumXYBom%2BZyxD%2Bbo7oGmTzLx_tXejvPaR1UKQ%40mail.gmail.com</a><br>
&gt;=C2=A0 <br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://groups.google.com/d=
/msgid/opkg-devel/CAA984JWqcX5oDhumXYBom*2BZyxD*2Bbo7oGmTzLx_tXejvPaR1UKQ*4=
0mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter__;JSUl!fqWJcnlTk=
jM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_BdrxnvBnCn7bez8Tg$"=
 rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://g=
roups.google.com/d/msgid/opkg-devel/CAA984JWqcX5oDhumXYBom*2BZyxD*2Bbo7oGmT=
zLx_tXejvPaR1UKQ*40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfoote=
r__;JSUl!fqWJcnlTkjM!4DVD9lP2UdCF5UedI8J-XjhQQuyDhmAiLaOXk8OW5KMCFRzG2ASP_B=
drxnvBnCn7bez8Tg$</a>&gt;.<br>
<br>
--<br>
&gt; <br>
Cheers,<br>
<br>
Alejandro<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">

                    <div style=3D"display:block"><div>
   =20
    <font face=3D"Raleway, regular">
    <table style=3D"padding:20px" border=3D"0">
        <tbody>
        <tr>
            <td style=3D"font-size:13px;color:rgb(255,128,84);text-align:ce=
nter;padding-right:30px">
                <a href=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p>20 rue des Jardins<br>
92600 Asni=C3=A8res-sur-Seine</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Yann CARDAILLAC</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:yann.cardaillac@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">yann.cardaillac@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.facebook.com/smileopensource" target=3D"_blank"><img src=3D"http://ftp.smi=
le.fr/client/Communication/signature/img/rs-facebook.png" alt=3D"Facebook" =
style=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
   =20
    <br>
    <div style=3D"color:rgb(163,172,181);font-size:10px">
        <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/=
eco.png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    </div>
    </font>
</div></div></div></div></div></div>

--00000000000068c9330595b766ff--

--00000000000068c93b0595b76601
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-add-SPDX-License-identifier.patch"
Content-Disposition: attachment; 
	filename="0001-add-SPDX-License-identifier.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k25u4tl20>
X-Attachment-Id: f_k25u4tl20

RnJvbSBiYTkyOTg3NDFmZTk5M2U2NjNjODhlNjQyYTk2MzZkZDlmYTE3YTg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5uIENBUkRBSUxMQUMgPHlhbm4uY2FyZGFpbGxhY0BzbWls
ZS5mcj4KRGF0ZTogVHVlLCAyMiBPY3QgMjAxOSAxNjo0OTo0MiArMDIwMApTdWJqZWN0OiBbUEFU
Q0hdIGFkZCBTUERYIExpY2Vuc2UgaWRlbnRpZmllcgoKU2lnbmVkLW9mZi1ieTogWWFubiBDQVJE
QUlMTEFDIDx5YW5uLmNhcmRhaWxsYWNAc21pbGUuZnI+Ci0tLQogaW50ZXJjZXB0L2RlcG1vZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiBpbnRlcmNlcHQvbGRjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIGludGVyY2VwdC91cGRhdGUtbW9k
dWxlcyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogbGlib3BrZy9ja3N1bV9saXN0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9ja3N1bV9saXN0Lmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9jb25mZmlsZS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9jb25mZmlsZS5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9jb25mZmlsZV9saXN0
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9jb25mZmlsZV9saXN0
LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9maWxlX2xpc3QuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9maWxlX2xpc3QuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9maWxlX3V0aWwuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9maWxlX3V0aWwuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9oYXNoX3RhYmxlLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9oYXNoX3RhYmxlLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9saXN0LmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogbGlib3BrZy9tZDUuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyArKysKIGxpYm9wa2cvbWQ1LmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKysrCiBsaWJvcGtnL252X3BhaXIuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL252X3BhaXIuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL252X3BhaXJfbGlz
dC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL252X3BhaXJfbGlz
dC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2cuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2cuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfYXJjaGl2
ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfYXJjaGl2
ZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY21kLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY21kLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY29uZi5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY29uZi5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY29uZmln
dXJlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfY29uZmln
dXJlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZG93bmxv
YWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZG93bmxv
YWQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZG93bmxv
YWRfY3VybC5jICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZG93bmxv
YWRfd2dldC5jICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZ3BnLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfZ3BnLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfaW5zdGFs
bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfaW5zdGFs
bC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfbWVzc2Fn
ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfbWVzc2Fn
ZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfb3BlbnNz
bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfb3BlbnNz
bC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfcmVtb3Zl
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfcmVtb3Zl
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfc29sdmVy
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfdXRpbHMu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfdXRpbHMu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfdmVyaWZ5
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL29wa2dfdmVyaWZ5
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BhcnNlX3V0aWwu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BhcnNlX3V0aWwu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZy5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZy5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXBlbmRz
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXBlbmRz
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXN0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXN0Lmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXN0X2xp
c3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19kZXN0X2xp
c3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19leHRyYWN0
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19leHRyYWN0
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19oYXNoLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19oYXNoLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19wYXJzZS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19wYXJzZS5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19zcmMuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19zcmMuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19zcmNfbGlz
dC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ19zcmNfbGlz
dC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ192ZWMuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3BrZ192ZWMuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3JlbGVhc2UuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3JlbGVhc2UuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3JlbGVhc2VfcGFy
c2UuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3JlbGVhc2VfcGFy
c2UuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3NoYTI1Ni5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3NoYTI1Ni5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ19hY3Rpb24uYyAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ19pbnN0YWxsX2ludGVybmFsLmMgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ19pbnN0YWxsX2ludGVybmFsLmggfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ19zb2x2ZXJfaW50ZXJuYWwuYyAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ19zb2x2ZXJfaW50ZXJuYWwuaCAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ191cGdyYWRlX2ludGVybmFsLmMgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvb3BrZ191cGdyYWRlX2ludGVybmFsLmggfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvcGtnX2RlcGVuZHNfaW50ZXJuYWwuYyAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvaW50
ZXJuYWwvcGtnX2RlcGVuZHNfaW50ZXJuYWwuaCAgfCAyICsrCiBsaWJvcGtnL3NvbHZlcnMvbGli
c29sdi9vcGtnX3NvbHZlcl9saWJzb2x2LmMgICAgfCAyICsrCiBsaWJvcGtnL3NwcmludGZfYWxs
b2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3NwcmludGZfYWxs
b2MuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3N0cl9saXN0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3N0cl9saXN0Lmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3N0cmluZ191dGls
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3N0cmluZ191dGls
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3ZvaWRfbGlzdC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3ZvaWRfbGlzdC5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBsaWJvcGtnL3hmdW5jcy5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIGxpYm9wa2cveGZ1bmNzLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIGxpYm9wa2cveHJlZ2V4LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIGxpYm9wa2cveHJlZ2V4LmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIGxpYm9wa2cveHN5c3RlbS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIGxpYm9wa2cveHN5c3RlbS5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIHNjcmlwdHMvY2hlY2twYXRjaC5w
bCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogc2NyaXB0cy90ZXN0LWJyYW5jaC5w
eSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogc3JjL29wa2cuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogdGVzdHMvY2ZnLnB5ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzAxX2luc3RhbGwu
cHkgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMDJfZmlsZS5weSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8wM191cGdyYWRlLnB5
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzA0X3VwZ3JhZGVfZmls
ZS5weSAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMDVfZG93bmdyYWRlLnB5
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8wNl9kZXBlbmRlbmN5LnB5
ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzA3X2hvbGRfdXBncmFkZS5w
eSAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMDhfaG9sZF9ieV9oYW5kLnB5
ICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8wOV9ob2xkX2RlcGVuZHMucHkg
ICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzEwX3ZpcnR1YWxfY29uZmxpY3Rz
X2ZpcnN0LnB5ICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMTFfdmlydHVhbF9jb25mbGljdHNf
c2Vjb25kLnB5ICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8xMl92aXJ0dWFsX25vX2NvbmZsaWN0
cy5weSAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzEzX3ZpcnR1YWxfdXBncmFkZS5weSAg
ICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMTRfdXBncmFkZV9ieV91cmkucHkgICAg
ICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8xNV9yZWluc3RhbGxfYnlfdXJpLnB5ICAg
ICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzE2X3VwZ3JhZGVfZGVwZW5kZW5jeS5weSAg
ICAgICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMTdfdXBncmFkZV9jb25mbGljdHMucHkgICAg
ICAgICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8xOF91cGdyYWRlX3JlY29tbWVuZHMucHkgICAg
ICAgICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzE5X25vX3JlY29tbWVuZHMucHkgICAgICAgICAg
ICAgICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMjBfZXhjbHVkZS5weSAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEgKwogdGVzdHMvY29yZS8yMV9hdXRvcmVtb3ZlLnB5ICAgICAgICAgICAgICAg
ICAgICAgIHwgMSArCiB0ZXN0cy9jb3JlLzIyX2F1dG9yZW1vdmVfZGVwZW5kZW5jeS5weSAgICAg
ICAgICAgfCAxICsKIHRlc3RzL2NvcmUvMjRfbm9kZXBzLnB5ICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDEgKwogdGVzdHMvY29yZS8yNV9lc3NlbnRpYWwucHkgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiB0ZXN0cy9jb3JlLzI1YV9lc3NlbnRpYWwucHkgICAgICAgICAgICAgICAgICAg
ICAgfCAxICsKIHRlc3RzL2NvcmUvMjZfcHJlZmVyX2FyY2hfdG9fdmVyc2lvbi5weSAgICAgICAg
ICB8IDEgKwogdGVzdHMvY29yZS8yN19yZWxkZXBzX2x0LnB5ICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCiB0ZXN0cy9jb3JlLzI4X3JlbGRlcHNfbHRlcS5weSAgICAgICAgICAgICAgICAgICAg
fCAxICsKIHRlc3RzL2NvcmUvMjlfcmVsZGVwc19lcS5weSAgICAgICAgICAgICAgICAgICAgICB8
IDEgKwogdGVzdHMvY29yZS8zMF9yZWxkZXBzX2d0ZXEucHkgICAgICAgICAgICAgICAgICAgIHwg
MSArCiB0ZXN0cy9jb3JlLzMxX3JlbGRlcHNfZ3QucHkgICAgICAgICAgICAgICAgICAgICAgfCAx
ICsKIHRlc3RzL2NvcmUvMzJfaW50ZXJjZXB0X2Rpc2FibGUucHkgICAgICAgICAgICAgICB8IDEg
KwogdGVzdHMvY29yZS8zM19pbnN0YWxsX2V4YWN0X3ZlcnNpb24ucHkgICAgICAgICAgIHwgMSAr
CiB0ZXN0cy9jb3JlLzM0X2xpc3RfdXBncmFkYWJsZS5weSAgICAgICAgICAgICAgICAgfCAxICsK
IHRlc3RzL2NvcmUvMzVfZG93bmxvYWRfb25seS5weSAgICAgICAgICAgICAgICAgICB8IDEgKwog
dGVzdHMvY29yZS8zNl9pbnN0YWxsX3ZpcnR1YWwucHkgICAgICAgICAgICAgICAgIHwgMSArCiB0
ZXN0cy9jb3JlLzM3X2dsb2JzLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRl
c3RzL2NvcmUvMzhfaW5zdGFsbF9jb25zdHJhaW5lZF92ZXJzaW9uLnB5ICAgICB8IDEgKwogdGVz
dHMvY29yZS8zOV9kaXN0dXBncmFkZS5weSAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0
cy9jb3JlLzQwX2FyY2gucHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3Rz
L2NvcmUvNDJfaW5mb19kZXNjcmlwdGlvbi5weSAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMv
Y29yZS80M19hZGRfaWdub3JlX3JlY29tbWVuZHMucHkgICAgICAgICAgIHwgMSArCiB0ZXN0cy9t
aXNjL2ZpbGVoYXNoLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL21p
c2MvdXBkYXRlX2xvc2VzX2F1dG9pbnN0YWxsZWRfZmxhZy5weSAgICB8IDEgKwogdGVzdHMvbWlz
Yy92ZXJzaW9uX2NvbXBhcmlzb25zLnB5ICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9vcGsu
cHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL29wa2dj
bC5weSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVz
cy9pc3N1ZTEwMy5weSAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNz
L2lzc3VlMTAzNTgucHkgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3Mv
aXNzdWUxMDM1OGIucHkgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9p
c3N1ZTEwNzc3LnB5ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lz
c3VlMTA3ODEucHkgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNz
dWUxMTAzMy5weSAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1
ZTExMDMzYi5weSAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3Vl
MTE4MjYucHkgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUx
MjEucHkgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTEy
NC5weSAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlMTI0
YS5weSAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUxMjcu
cHkgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTE1Mi5w
eSAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlMTU0LnB5
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUxNTYucHkg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTE2Mi5weSAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlMTYzLnB5ICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUxNjUucHkgICAg
ICAgICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTE2NWEucHkgICAg
ICAgICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlMTY1Yi5weSAgICAg
ICAgICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUxNjcucHkgICAgICAg
ICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTI2LnB5ICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlMzEucHkgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWUzMi5weSAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTQ1LnB5ICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlNDYucHkgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU1MC5weSAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTUxLnB5ICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlNTUucHkgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU1OC5weSAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTcyLnB5ICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlNzkucHkgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU4MzUxLnB5ICAgICAgICAgICAgICAgICAg
ICAgICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTg1LnB5ICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlODYwMS5weSAgICAgICAgICAgICAgICAgICAg
ICAgfCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU4OS5weSAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTg5MTIucHkgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlODkxMy5weSAgICAgICAgICAgICAgICAgICAgICAg
fCAxICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU5MDU5LnB5ICAgICAgICAgICAgICAgICAgICAgICB8
IDEgKwogdGVzdHMvcmVncmVzcy9pc3N1ZTkxLnB5ICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MSArCiB0ZXN0cy9yZWdyZXNzL2lzc3VlOTIxOC5weSAgICAgICAgICAgICAgICAgICAgICAgfCAx
ICsKIHRlc3RzL3JlZ3Jlc3MvaXNzdWU5NTMzLnB5ICAgICAgICAgICAgICAgICAgICAgICB8IDEg
KwogdGVzdHMvcmVncmVzcy9pc3N1ZTk4MDIucHkgICAgICAgICAgICAgICAgICAgICAgIHwgMSAr
CiB0ZXN0cy9yZWdyZXNzL2lzc3VlOTgwMmIucHkgICAgICAgICAgICAgICAgICAgICAgfCAxICsK
IHRlc3RzL3JlZ3Jlc3MvaXNzdWU5OTM5LnB5ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwog
dGVzdHMvcmVncmVzcy9pc3N1ZTk5ODcucHkgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiB1
dGlscy9vcGtnLWNoZWNrLWNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiB1
dGlscy9vcGtnLWtleSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIDIw
MiBmaWxlcyBjaGFuZ2VkLCAzMDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ludGVyY2Vw
dC9kZXBtb2QgYi9pbnRlcmNlcHQvZGVwbW9kCmluZGV4IGY4YTRmOWEuLmNkNjlmZjEgMTAwNjQ0
Ci0tLSBhL2ludGVyY2VwdC9kZXBtb2QKKysrIGIvaW50ZXJjZXB0L2RlcG1vZApAQCAtMSw0ICsx
LDUgQEAKICMhL2Jpbi9zaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAKIGlmIFsgIngkMSIgPSAieC1hIiBdIHx8IFsgIngkMSIgPSAieC1BIiBdOyB0aGVuCiAgIGVj
aG8gImRlcG1vZCAkQCIgPj4gJE9QS0dfSU5URVJDRVBUX0RJUi9kZXBtb2QKZGlmZiAtLWdpdCBh
L2ludGVyY2VwdC9sZGNvbmZpZyBiL2ludGVyY2VwdC9sZGNvbmZpZwppbmRleCBlMDdjODFkLi4z
YzgzYzdiIDEwMDY0NAotLS0gYS9pbnRlcmNlcHQvbGRjb25maWcKKysrIGIvaW50ZXJjZXB0L2xk
Y29uZmlnCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL3NoCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKIAogaWYgWyAhIC1mICRPUEtHX0lOVEVSQ0VQVF9ESVIvbGRjb25m
aWcgXTsgdGhlbgogICBlY2hvICJsZGNvbmZpZyIgPiAkT1BLR19JTlRFUkNFUFRfRElSL2xkY29u
ZmlnCmRpZmYgLS1naXQgYS9pbnRlcmNlcHQvdXBkYXRlLW1vZHVsZXMgYi9pbnRlcmNlcHQvdXBk
YXRlLW1vZHVsZXMKaW5kZXggYWM1NzQ5Yy4uYmI1OTlmOCAxMDA2NDQKLS0tIGEvaW50ZXJjZXB0
L3VwZGF0ZS1tb2R1bGVzCisrKyBiL2ludGVyY2VwdC91cGRhdGUtbW9kdWxlcwpAQCAtMSw0ICsx
LDUgQEAKICMhL2Jpbi9zaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAKIGlmIFsgISAtZiAkT1BLR19JTlRFUkNFUFRfRElSL3VwZGF0ZS1tb2R1bGVzIF07IHRoZW4K
ICAgZWNobyAidXBkYXRlLW1vZHVsZXMiID4gJE9QS0dfSU5URVJDRVBUX0RJUi91cGRhdGUtbW9k
dWxlcwpkaWZmIC0tZ2l0IGEvbGlib3BrZy9ja3N1bV9saXN0LmMgYi9saWJvcGtnL2Nrc3VtX2xp
c3QuYwppbmRleCBlMjg5NTFmLi42NDZhOWM5IDEwMDY0NAotLS0gYS9saWJvcGtnL2Nrc3VtX2xp
c3QuYworKysgYi9saWJvcGtnL2Nrc3VtX2xpc3QuYwpAQCAtMyw2ICszLDggQEAKIAogICAgQ29w
eXJpZ2h0IChDKSAyMDEwLDIwMTEgSmF2aWVyIFBhbGFjaW9zCiAKKyAgIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwg
b3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL2Nrc3VtX2xpc3QuaCBiL2xpYm9wa2cvY2tzdW1f
bGlzdC5oCmluZGV4IGU1OTQyNmEuLjNkNDliYmEgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvY2tzdW1f
bGlzdC5oCisrKyBiL2xpYm9wa2cvY2tzdW1fbGlzdC5oCkBAIC0zLDYgKzMsOCBAQAogCiAgICBD
b3B5cmlnaHQgKEMpIDIwMTAsMjAxMSBKYXZpZXIgUGFsYWNpb3MKIAorICAgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
LCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvY29uZmZpbGUuYyBiL2xpYm9wa2cvY29uZmZp
bGUuYwppbmRleCA3YjRiODdiLi42MjQ3MjY2IDEwMDY0NAotLS0gYS9saWJvcGtnL2NvbmZmaWxl
LmMKKysrIGIvbGlib3BrZy9jb25mZmlsZS5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmln
aHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
CiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL2NvbmZmaWxlLmggYi9saWJvcGtn
L2NvbmZmaWxlLmgKaW5kZXggZmM0OTYxNC4uODdhNDVhNSAxMDA2NDQKLS0tIGEvbGlib3BrZy9j
b25mZmlsZS5oCisrKyBiL2xpYm9wa2cvY29uZmZpbGUuaApAQCAtNSw2ICs1LDggQEAKIAogICAg
Q29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisg
ICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAg
ICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9jb25mZmlsZV9saXN0
LmMgYi9saWJvcGtnL2NvbmZmaWxlX2xpc3QuYwppbmRleCBkYmNjM2JjLi4yYzBiMGZjIDEwMDY0
NAotLS0gYS9saWJvcGtnL2NvbmZmaWxlX2xpc3QuYworKysgYi9saWJvcGtnL2NvbmZmaWxlX2xp
c3QuYwpAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkg
b2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0t
Z2l0IGEvbGlib3BrZy9jb25mZmlsZV9saXN0LmggYi9saWJvcGtnL2NvbmZmaWxlX2xpc3QuaApp
bmRleCA4YTQwNTA4Li5lMzkwZDQ1IDEwMDY0NAotLS0gYS9saWJvcGtnL2NvbmZmaWxlX2xpc3Qu
aAorKysgYi9saWJvcGtnL2NvbmZmaWxlX2xpc3QuaApAQCAtNSw2ICs1LDggQEAKIAogICAgQ29w
eXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBt
b2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
ciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9maWxlX2xpc3QuYyBiL2xp
Ym9wa2cvZmlsZV9saXN0LmMKaW5kZXggY2IyMDQ3Ni4uMDNjM2MxMiAxMDA2NDQKLS0tIGEvbGli
b3BrZy9maWxlX2xpc3QuYworKysgYi9saWJvcGtnL2ZpbGVfbGlzdC5jCkBAIC0zLDYgKzMsOCBA
QAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMTcgTWljaGFlbCBIYW5zZW4KIAorICAgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAg
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvZmlsZV9saXN0LmggYi9saWJvcGtnL2Zp
bGVfbGlzdC5oCmluZGV4IGY0ZWNlMTguLmQxM2U4MDUgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvZmls
ZV9saXN0LmgKKysrIGIvbGlib3BrZy9maWxlX2xpc3QuaApAQCAtMyw2ICszLDggQEAKIAogICAg
Q29weXJpZ2h0IChDKSAyMDE3IE1pY2hhZWwgSGFuc2VuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3Ig
KGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL2ZpbGVfdXRpbC5jIGIvbGlib3BrZy9maWxlX3V0aWwu
YwppbmRleCBhMTQwMjdiLi5mYmVkN2I0IDEwMDY0NAotLS0gYS9saWJvcGtnL2ZpbGVfdXRpbC5j
CisrKyBiL2xpYm9wa2cvZmlsZV91dGlsLmMKQEAgLTYsNiArNiw4IEBACiAgICBDYXJsIEQuIFdv
cnRoCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9y
bmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAg
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL2ZpbGVf
dXRpbC5oIGIvbGlib3BrZy9maWxlX3V0aWwuaAppbmRleCA0MWRjYjNiLi4yNDg3NjQ5IDEwMDY0
NAotLS0gYS9saWJvcGtnL2ZpbGVfdXRpbC5oCisrKyBiL2xpYm9wa2cvZmlsZV91dGlsLmgKQEAg
LTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRo
ZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3It
bGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xp
Ym9wa2cvaGFzaF90YWJsZS5jIGIvbGlib3BrZy9oYXNoX3RhYmxlLmMKaW5kZXggZTgyZTJjMS4u
ODFmMDIzYiAxMDA2NDQKLS0tIGEvbGlib3BrZy9oYXNoX3RhYmxlLmMKKysrIGIvbGlib3BrZy9o
YXNoX3RhYmxlLmMKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMiBDb21w
YXEgQ29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAt
LWdpdCBhL2xpYm9wa2cvaGFzaF90YWJsZS5oIGIvbGlib3BrZy9oYXNoX3RhYmxlLmgKaW5kZXgg
OGI5MWE4OC4uZTRlOTBlOCAxMDA2NDQKLS0tIGEvbGlib3BrZy9oYXNoX3RhYmxlLmgKKysrIGIv
bGlib3BrZy9oYXNoX3RhYmxlLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykg
MjAwMiBDb21wYXEgQ29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAo
YXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvbGlzdC5oIGIvbGlib3BrZy9saXN0LmgKaW5kZXggZjUy
N2EwOC4uNWFhZTdkYiAxMDA2NDQKLS0tIGEvbGlib3BrZy9saXN0LmgKKysrIGIvbGlib3BrZy9s
aXN0LmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwOCBPcGVubW9rbyBJ
bmMuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAg
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL21kNS5j
IGIvbGlib3BrZy9tZDUuYwppbmRleCBiYzJiMjI5Li45ODFiOWI4IDEwMDY0NAotLS0gYS9saWJv
cGtnL21kNS5jCisrKyBiL2xpYm9wa2cvbWQ1LmMKQEAgLTMsNiArMyw5IEBACiAgICBhY2NvcmRp
bmcgdG8gdGhlIGRlZmluaXRpb24gb2YgTUQ1IGluIFJGQyAxMzIxIGZyb20gQXByaWwgMTk5Mi4K
ICAgIENvcHlyaWdodCAoQykgMTk5NSwxOTk2LDE5OTcsMTk5OSwyMDAwLDIwMDEsMjAwNSwyMDA2
LDIwMDgKIAlGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKworICAgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBmaWxlIGlzIHBhcnQgb2Yg
dGhlIEdOVSBDIExpYnJhcnkuCiAKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0CmRpZmYgLS1naXQgYS9saWJv
cGtnL21kNS5oIGIvbGlib3BrZy9tZDUuaAppbmRleCAyYTcyNzRkLi44ZDQ4ZDgxIDEwMDY0NAot
LS0gYS9saWJvcGtnL21kNS5oCisrKyBiL2xpYm9wa2cvbWQ1LmgKQEAgLTMsNiArMyw5IEBACiAg
ICBsaWJyYXJ5IGZ1bmN0aW9ucy4KICAgIENvcHlyaWdodCAoQykgMTk5NS0xOTk3LDE5OTksMjAw
MCwyMDAxLDIwMDQsMjAwNSwyMDA2LDIwMDgKICAgICAgIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
biwgSW5jLgorCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgor
CiAgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KIAogICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnkgaXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvbnZfcGFpci5jIGIvbGlib3BrZy9udl9wYWly
LmMKaW5kZXggY2U2YmM3Yi4uMmZmNjQyOSAxMDA2NDQKLS0tIGEvbGlib3BrZy9udl9wYWlyLmMK
KysrIGIvbGlib3BrZy9udl9wYWlyLmMKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAo
QykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAg
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvbnZfcGFpci5oIGIvbGlib3BrZy9udl9w
YWlyLmgKaW5kZXggZTkzMDliNi4uOTdkOTY5YiAxMDA2NDQKLS0tIGEvbGlib3BrZy9udl9wYWly
LmgKKysrIGIvbGlib3BrZy9udl9wYWlyLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdo
dCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMK
ICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvbnZfcGFpcl9saXN0LmMgYi9saWJv
cGtnL252X3BhaXJfbGlzdC5jCmluZGV4IGIyMGI1ODAuLjY5NGYxNzkgMTAwNjQ0Ci0tLSBhL2xp
Ym9wa2cvbnZfcGFpcl9saXN0LmMKKysrIGIvbGlib3BrZy9udl9wYWlyX2xpc3QuYwpAQCAtNSw2
ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4g
Q2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3Br
Zy9udl9wYWlyX2xpc3QuaCBiL2xpYm9wa2cvbnZfcGFpcl9saXN0LmgKaW5kZXggNDY2Mzk0Ny4u
ZmQ1MmVmMCAxMDA2NDQKLS0tIGEvbGlib3BrZy9udl9wYWlyX2xpc3QuaAorKysgYi9saWJvcGtn
L252X3BhaXJfbGlzdC5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEg
VW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3Ig
KGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2cuYyBiL2xpYm9wa2cvb3BrZy5jCmluZGV4IDM2
NjliN2UuLjA1ZGU4M2QgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZy5jCisrKyBiL2xpYm9wa2cv
b3BrZy5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDggT3Blbk1va28g
SW5jCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAg
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2cu
aCBiL2xpYm9wa2cvb3BrZy5oCmluZGV4IDgyYjYwNjguLjQ1MzJmNDAgMTAwNjQ0Ci0tLSBhL2xp
Ym9wa2cvb3BrZy5oCisrKyBiL2xpYm9wa2cvb3BrZy5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBD
b3B5cmlnaHQgKEMpIDIwMDggT3Blbk1va28gSW5jCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQg
YnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0
CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfYXJjaGl2ZS5jIGIvbGlib3BrZy9vcGtnX2FyY2hp
dmUuYwppbmRleCAxZThjOWQxLi4zZDg3ZGIxIDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfYXJj
aGl2ZS5jCisrKyBiL2xpYm9wa2cvb3BrZ19hcmNoaXZlLmMKQEAgLTMsNiArMyw4IEBACiAKICAg
IENvcHlyaWdodCAoQykgMjAxNCBQYXVsIEJhcmtlcgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVk
IGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChh
dApkaWZmIC0tZ2l0IGEvbGlib3BrZy9vcGtnX2FyY2hpdmUuaCBiL2xpYm9wa2cvb3BrZ19hcmNo
aXZlLmgKaW5kZXggMDcwMmMxZi4uYzJiNmVhMyAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX2Fy
Y2hpdmUuaAorKysgYi9saWJvcGtnL29wa2dfYXJjaGl2ZS5oCkBAIC0zLDYgKzMsOCBAQAogCiAg
ICBDb3B5cmlnaHQgKEMpIDIwMTQgUGF1bCBCYXJrZXIKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAo
YXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19jbWQuYyBiL2xpYm9wa2cvb3BrZ19jbWQuYwpp
bmRleCBmZDI3MDYyLi5lZjU2Mzg4IDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfY21kLmMKKysr
IGIvbGlib3BrZy9vcGtnX2NtZC5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMp
IDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBw
dWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24g
Miwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfY21kLmggYi9saWJvcGtnL29wa2df
Y21kLmgKaW5kZXggM2MxYzIzNi4uNjk0NzI2ZiAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX2Nt
ZC5oCisrKyBiL2xpYm9wa2cvb3BrZ19jbWQuaApAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJp
Z2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2Rp
ZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBh
cwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2
ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9vcGtnX2NvbmYuYyBiL2xpYm9w
a2cvb3BrZ19jb25mLmMKaW5kZXggZjIzMzBjZC4uZTljNTllNyAxMDA2NDQKLS0tIGEvbGlib3Br
Zy9vcGtnX2NvbmYuYworKysgYi9saWJvcGtnL29wa2dfY29uZi5jCkBAIC02LDYgKzYsOCBAQAog
ICAgQ2FybCBELiBXb3J0aAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291
dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEv
bGlib3BrZy9vcGtnX2NvbmYuaCBiL2xpYm9wa2cvb3BrZ19jb25mLmgKaW5kZXggMzE2YzUwMC4u
YzIwMGFmNyAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX2NvbmYuaAorKysgYi9saWJvcGtnL29w
a2dfY29uZi5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVy
c2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRp
ZmYgLS1naXQgYS9saWJvcGtnL29wa2dfY29uZmlndXJlLmMgYi9saWJvcGtnL29wa2dfY29uZmln
dXJlLmMKaW5kZXggYjQ0YmE2ZS4uNWM4M2M4OCAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX2Nv
bmZpZ3VyZS5jCisrKyBiL2xpYm9wa2cvb3BrZ19jb25maWd1cmUuYwpAQCAtNSw2ICs1LDggQEAK
IAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5p
YQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9vcGtnX2Nv
bmZpZ3VyZS5oIGIvbGlib3BrZy9vcGtnX2NvbmZpZ3VyZS5oCmluZGV4IDJlYWMwMmMuLjlhMGMy
YzkgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZ19jb25maWd1cmUuaAorKysgYi9saWJvcGtnL29w
a2dfY29uZmlndXJlLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMSBV
bml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAo
YXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19kb3dubG9hZC5jIGIvbGlib3BrZy9vcGtnX2Rv
d25sb2FkLmMKaW5kZXggMmJkNTY4My4uNWM3NGY2NiAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtn
X2Rvd25sb2FkLmMKKysrIGIvbGlib3BrZy9vcGtnX2Rvd25sb2FkLmMKQEAgLTYsNiArNiw4IEBA
CiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlh
CiAgICBDb3B5cmlnaHQgKEMpIDIwMDggT3Blbk1va28gSW5jCiAKKyAgIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwg
b3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfZG93bmxvYWQuaCBiL2xpYm9wa2cvb3Br
Z19kb3dubG9hZC5oCmluZGV4IDI3ZTI0ZjIuLmU4OGFmODUgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cv
b3BrZ19kb3dubG9hZC5oCisrKyBiL2xpYm9wa2cvb3BrZ19kb3dubG9hZC5oCkBAIC01LDYgKzUs
OCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxp
Zm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29w
a2dfZG93bmxvYWRfY3VybC5jIGIvbGlib3BrZy9vcGtnX2Rvd25sb2FkX2N1cmwuYwppbmRleCA0
NjdlYmMwLi5kNTcyMDcwIDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfZG93bmxvYWRfY3VybC5j
CisrKyBiL2xpYm9wa2cvb3BrZ19kb3dubG9hZF9jdXJsLmMKQEAgLTUsNiArNSw4IEBACiAgICBD
b3B5cmlnaHQgKEMpIDIwMDggT3Blbk1va28gSW5jCiAgICBDb3B5cmlnaHQgKEMpIDIwMTQgUGF1
bCBCYXJrZXIKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIK
KwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cv
b3BrZ19kb3dubG9hZF93Z2V0LmMgYi9saWJvcGtnL29wa2dfZG93bmxvYWRfd2dldC5jCmluZGV4
IDkwMDE0OTMuLjNkZWM3NjYgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZ19kb3dubG9hZF93Z2V0
LmMKKysrIGIvbGlib3BrZy9vcGtnX2Rvd25sb2FkX3dnZXQuYwpAQCAtNSw2ICs1LDggQEAKICAg
IENvcHlyaWdodCAoQykgMjAwOCBPcGVuTW9rbyBJbmMKICAgIENvcHlyaWdodCAoQykgMjAxNCBQ
YXVsIEJhcmtlcgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3Br
Zy9vcGtnX2dwZy5jIGIvbGlib3BrZy9vcGtnX2dwZy5jCmluZGV4IGY2M2M0NTUuLmQyMzZjODQg
MTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZ19ncGcuYworKysgYi9saWJvcGtnL29wa2dfZ3BnLmMK
QEAgLTUsNiArNSw4IEBACiAgICAgQ29weXJpZ2h0IChDKSAyMDA4IE9wZW5Nb2tvIEluYwogICAg
IENvcHlyaWdodCAoQykgMjAxNCBQYXVsIEJhcmtlcgogCisgICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgICBtb2RpZnkgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgIHB1Ymxp
c2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBv
ciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19ncGcuaCBiL2xpYm9wa2cvb3BrZ19ncGcu
aAppbmRleCA1MWFiZGJkLi4zZTlkZWU5IDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfZ3BnLmgK
KysrIGIvbGlib3BrZy9vcGtnX2dwZy5oCkBAIC0zLDYgKzMsOCBAQAogCiAgICAgQ29weXJpZ2h0
IChDKSAyMDE0IFBhdWwgQmFya2VyCiAKKyAgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorCiAgICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICAgcHVibGlzaGVkIGJ5IHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZm
IC0tZ2l0IGEvbGlib3BrZy9vcGtnX2luc3RhbGwuYyBiL2xpYm9wa2cvb3BrZ19pbnN0YWxsLmMK
aW5kZXggNTg1ZTdkOC4uMzIwZTUyZiAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX2luc3RhbGwu
YworKysgYi9saWJvcGtnL29wa2dfaW5zdGFsbC5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5
cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1v
ZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfaW5zdGFsbC5oIGIv
bGlib3BrZy9vcGtnX2luc3RhbGwuaAppbmRleCA4YjE3MTA1Li45ODM3OGJiIDEwMDY0NAotLS0g
YS9saWJvcGtnL29wa2dfaW5zdGFsbC5oCisrKyBiL2xpYm9wa2cvb3BrZ19pbnN0YWxsLmgKQEAg
LTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRo
ZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3It
bGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xp
Ym9wa2cvb3BrZ19tZXNzYWdlLmMgYi9saWJvcGtnL29wa2dfbWVzc2FnZS5jCmluZGV4IGZkZGVm
YjUuLjJiN2I2NDEgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZ19tZXNzYWdlLmMKKysrIGIvbGli
b3BrZy9vcGtnX21lc3NhZ2UuYwpAQCAtNCw2ICs0LDggQEAKICAgIENvcHlyaWdodCAoQykgMjAw
OSBVYmlxIFRlY2hub2xvZ2llcyA8Z3JhaGFtLmdvd2VyQGdtYWlsLmNvbT4KICAgIENvcHlyaWdo
dCAoQykgMjAwMyBEYW5pZWxlIE5pY29sb2RpIDxkYW5pZWxlQGdyaW50YS5uZXQ+CiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1v
ZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfbWVzc2FnZS5oIGIv
bGlib3BrZy9vcGtnX21lc3NhZ2UuaAppbmRleCBkYzUyMDcyLi42ZTJjMDMyIDEwMDY0NAotLS0g
YS9saWJvcGtnL29wa2dfbWVzc2FnZS5oCisrKyBiL2xpYm9wa2cvb3BrZ19tZXNzYWdlLmgKQEAg
LTQsNiArNCw4IEBACiAgICBDb3B5cmlnaHQgKEMpIDIwMDkgVWJpcSBUZWNobm9sb2dpZXMgPGdy
YWhhbS5nb3dlckBnbWFpbC5jb20+CiAgICBDb3B5cmlnaHQgKEMpIDIwMDMgRGFuaWVsZSBOaWNv
bG9kaSA8ZGFuaWVsZUBncmludGEubmV0PgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZm
IC0tZ2l0IGEvbGlib3BrZy9vcGtnX29wZW5zc2wuYyBiL2xpYm9wa2cvb3BrZ19vcGVuc3NsLmMK
aW5kZXggMDM2MTBkMS4uZjBjZTAxZiAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX29wZW5zc2wu
YworKysgYi9saWJvcGtnL29wa2dfb3BlbnNzbC5jCkBAIC02LDYgKzYsOCBAQAogICAgIENvcHly
aWdodCAoQykgMjAwOSBDYW1pbGxlIE1vbmNlbGllciA8bW9uY2VsaWVyQGRldmxpZmUub3JnPgog
ICAgIENvcHlyaWdodCAoQykgMjAxNCBQYXVsIEJhcmtlcgogCisgICAgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgICBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgIHB1
Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
LCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19vcGVuc3NsLmggYi9saWJvcGtnL29w
a2dfb3BlbnNzbC5oCmluZGV4IGQ1MGRiNzYuLjQ3ZWJjZGMgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cv
b3BrZ19vcGVuc3NsLmgKKysrIGIvbGlib3BrZy9vcGtnX29wZW5zc2wuaApAQCAtNCw2ICs0LDgg
QEAKICAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9y
bmlhCiAgICAgQ29weXJpZ2h0IChDKSAyMDE0IFBhdWwgQmFya2VyCiAKKyAgICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAg
ICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJz
aW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9vcGtnX3JlbW92ZS5jIGIvbGlib3Br
Zy9vcGtnX3JlbW92ZS5jCmluZGV4IDM5MzY2MjguLjVlZWFhOTQgMTAwNjQ0Ci0tLSBhL2xpYm9w
a2cvb3BrZ19yZW1vdmUuYworKysgYi9saWJvcGtnL29wa2dfcmVtb3ZlLmMKQEAgLTUsNiArNSw4
IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlm
b3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwog
ICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3Br
Z19yZW1vdmUuaCBiL2xpYm9wa2cvb3BrZ19yZW1vdmUuaAppbmRleCA0MDgyN2ZkLi5iNzMxODUy
IDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfcmVtb3ZlLmgKKysrIGIvbGlib3BrZy9vcGtnX3Jl
bW92ZS5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0
eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYg
LS1naXQgYS9saWJvcGtnL29wa2dfc29sdmVyLmggYi9saWJvcGtnL29wa2dfc29sdmVyLmgKaW5k
ZXggZWQ0YmMwMS4uMTM4NmUxYiAxMDA2NDQKLS0tIGEvbGlib3BrZy9vcGtnX3NvbHZlci5oCisr
KyBiL2xpYm9wa2cvb3BrZ19zb2x2ZXIuaApAQCAtNCw2ICs0LDggQEAKIAogICAgQ29weXJpZ2h0
IChDKSAyMDE1IE5hdGlvbmFsIEluc3RydW1lbnRzIENvcnAuCiAKKyAgIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwg
b3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfdXRpbHMuYyBiL2xpYm9wa2cvb3BrZ191
dGlscy5jCmluZGV4IGQzNjNmNTIuLmQ5ZDNiMTIgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvb3BrZ191
dGlscy5jCisrKyBiL2xpYm9wa2cvb3BrZ191dGlscy5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBD
b3B5cmlnaHQgKEMpIDIwMDIgQ29tcGFxIENvbXB1dGVyIENvcnBvcmF0aW9uCiAKKyAgIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
CiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfdXRpbHMuaCBiL2xpYm9w
a2cvb3BrZ191dGlscy5oCmluZGV4IDhkZTM0OTAuLmQ5ZDY0ZWUgMTAwNjQ0Ci0tLSBhL2xpYm9w
a2cvb3BrZ191dGlscy5oCisrKyBiL2xpYm9wa2cvb3BrZ191dGlscy5oCkBAIC01LDYgKzUsOCBA
QAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDIgQ29tcGFxIENvbXB1dGVyIENvcnBvcmF0aW9uCiAK
KyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IK
ICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsg
ZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfdmVyaWZ5
LmMgYi9saWJvcGtnL29wa2dfdmVyaWZ5LmMKaW5kZXggMzY4YjRkYS4uMmMzNjg0MSAxMDA2NDQK
LS0tIGEvbGlib3BrZy9vcGtnX3ZlcmlmeS5jCisrKyBiL2xpYm9wa2cvb3BrZ192ZXJpZnkuYwpA
QCAtMyw2ICszLDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDE0IFBhdWwgQmFya2VyCiAKKyAg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAg
IG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL29wa2dfdmVyaWZ5Lmgg
Yi9saWJvcGtnL29wa2dfdmVyaWZ5LmgKaW5kZXggNDkzNGUxOS4uOTY3N2EwYyAxMDA2NDQKLS0t
IGEvbGlib3BrZy9vcGtnX3ZlcmlmeS5oCisrKyBiL2xpYm9wa2cvb3BrZ192ZXJpZnkuaApAQCAt
Myw2ICszLDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDE0IFBhdWwgQmFya2VyCiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1v
ZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BhcnNlX3V0aWwuYyBiL2xp
Ym9wa2cvcGFyc2VfdXRpbC5jCmluZGV4IDdmNDM4ZDcuLmE2ZjY2NGEgMTAwNjQ0Ci0tLSBhL2xp
Ym9wa2cvcGFyc2VfdXRpbC5jCisrKyBiL2xpYm9wa2cvcGFyc2VfdXRpbC5jCkBAIC02LDYgKzYs
OCBAQAogICAgU3RldmVuIE0uIEF5ZXIKICAgIENvcHlyaWdodCAoQykgMjAwMiBDb21wYXEgQ29t
cHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBh
L2xpYm9wa2cvcGFyc2VfdXRpbC5oIGIvbGlib3BrZy9wYXJzZV91dGlsLmgKaW5kZXggMzA3ZDdh
NS4uNTc2NjRmOCAxMDA2NDQKLS0tIGEvbGlib3BrZy9wYXJzZV91dGlsLmgKKysrIGIvbGlib3Br
Zy9wYXJzZV91dGlsLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMiBD
b21wYXEgQ29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlm
ZiAtLWdpdCBhL2xpYm9wa2cvcGtnLmMgYi9saWJvcGtnL3BrZy5jCmluZGV4IDg0NGYwNzkuLjIw
YmUyMjkgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnLmMKKysrIGIvbGlib3BrZy9wa2cuYwpAQCAt
NSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhl
cm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGli
b3BrZy9wa2cuaCBiL2xpYm9wa2cvcGtnLmgKaW5kZXggZDI2OTUyOC4uYTYyYzA2NSAxMDA2NDQK
LS0tIGEvbGlib3BrZy9wa2cuaAorKysgYi9saWJvcGtnL3BrZy5oCkBAIC01LDYgKzUsOCBAQAog
CiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlh
CiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BrZ19kZXBl
bmRzLmMgYi9saWJvcGtnL3BrZ19kZXBlbmRzLmMKaW5kZXggODhiMTdmMy4uZWVjODk2MSAxMDA2
NDQKLS0tIGEvbGlib3BrZy9wa2dfZGVwZW5kcy5jCisrKyBiL2xpYm9wa2cvcGtnX2RlcGVuZHMu
YwpAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAyIENvbXBhcSBDb21wdXRl
ciBDb3Jwb3JhdGlvbgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGli
b3BrZy9wa2dfZGVwZW5kcy5oIGIvbGlib3BrZy9wa2dfZGVwZW5kcy5oCmluZGV4IGEzMWIyMjYu
LjE3ZTY2ODYgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnX2RlcGVuZHMuaAorKysgYi9saWJvcGtn
L3BrZ19kZXBlbmRzLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMiBD
b21wYXEgQ29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlm
ZiAtLWdpdCBhL2xpYm9wa2cvcGtnX2Rlc3QuYyBiL2xpYm9wa2cvcGtnX2Rlc3QuYwppbmRleCBh
MWQ5NmUxLi43MTMxOWI5IDEwMDY0NAotLS0gYS9saWJvcGtnL3BrZ19kZXN0LmMKKysrIGIvbGli
b3BrZy9wa2dfZGVzdC5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEg
VW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3Ig
KGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BrZ19kZXN0LmggYi9saWJvcGtnL3BrZ19kZXN0LmgK
aW5kZXggZmQ4MmVlNy4uZjc5N2Y5MSAxMDA2NDQKLS0tIGEvbGlib3BrZy9wa2dfZGVzdC5oCisr
KyBiL2xpYm9wa2cvcGtnX2Rlc3QuaApAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChD
KSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAg
cHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9wa2dfZGVzdF9saXN0LmMgYi9saWJvcGtn
L3BrZ19kZXN0X2xpc3QuYwppbmRleCA2OGRiMTg3Li4zNjVkMDY5IDEwMDY0NAotLS0gYS9saWJv
cGtnL3BrZ19kZXN0X2xpc3QuYworKysgYi9saWJvcGtnL3BrZ19kZXN0X2xpc3QuYwpAQCAtNSw2
ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4g
Q2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3Br
Zy9wa2dfZGVzdF9saXN0LmggYi9saWJvcGtnL3BrZ19kZXN0X2xpc3QuaAppbmRleCA0Yjc2YmMx
Li40ZTlkOTJhIDEwMDY0NAotLS0gYS9saWJvcGtnL3BrZ19kZXN0X2xpc3QuaAorKysgYi9saWJv
cGtnL3BrZ19kZXN0X2xpc3QuaApAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAy
MDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIs
IG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy9wa2dfZXh0cmFjdC5jIGIvbGlib3BrZy9wa2df
ZXh0cmFjdC5jCmluZGV4IDAwMTg1MWMuLjYxODlhNjYgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtn
X2V4dHJhY3QuYworKysgYi9saWJvcGtnL3BrZ19leHRyYWN0LmMKQEAgLTUsNiArNSw4IEBACiAK
ICAgIENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEK
IAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
cgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvcGtnX2V4dHJh
Y3QuaCBiL2xpYm9wa2cvcGtnX2V4dHJhY3QuaAppbmRleCAyZjVjY2E2Li40NmUwZGQ0IDEwMDY0
NAotLS0gYS9saWJvcGtnL3BrZ19leHRyYWN0LmgKKysrIGIvbGlib3BrZy9wa2dfZXh0cmFjdC5o
CkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBT
b3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQg
YS9saWJvcGtnL3BrZ19oYXNoLmMgYi9saWJvcGtnL3BrZ19oYXNoLmMKaW5kZXggOTZkOWIxOS4u
NmM2YzI2OSAxMDA2NDQKLS0tIGEvbGlib3BrZy9wa2dfaGFzaC5jCisrKyBiL2xpYm9wa2cvcGtn
X2hhc2guYwpAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAyIENvbXBhcSBD
b21wdXRlciBDb3Jwb3JhdGlvbgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0
IGEvbGlib3BrZy9wa2dfaGFzaC5oIGIvbGlib3BrZy9wa2dfaGFzaC5oCmluZGV4IGRkZmNjNTgu
LjJhYjkzNTYgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnX2hhc2guaAorKysgYi9saWJvcGtnL3Br
Z19oYXNoLmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMiBDb21wYXEg
Q29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdp
dCBhL2xpYm9wa2cvcGtnX3BhcnNlLmMgYi9saWJvcGtnL3BrZ19wYXJzZS5jCmluZGV4IGQ5NzEz
ODguLjY3ZTdlY2QgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnX3BhcnNlLmMKKysrIGIvbGlib3Br
Zy9wa2dfcGFyc2UuYwpAQCAtNiw2ICs2LDggQEAKICAgIFN0ZXZlbiBNLiBBeWVyCiAgICBDb3B5
cmlnaHQgKEMpIDIwMDIgQ29tcGFxIENvbXB1dGVyIENvcnBvcmF0aW9uCiAKKyAgIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAg
ICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BrZ19wYXJzZS5oIGIvbGlib3BrZy9w
a2dfcGFyc2UuaAppbmRleCBiY2Q3YzA5Li5mMzViY2NmIDEwMDY0NAotLS0gYS9saWJvcGtnL3Br
Z19wYXJzZS5oCisrKyBiL2xpYm9wa2cvcGtnX3BhcnNlLmgKQEAgLTUsNiArNSw4IEBACiAKICAg
IENvcHlyaWdodCAoQykgMjAwMiBDb21wYXEgQ29tcHV0ZXIgQ29ycG9yYXRpb24KIAorICAgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9k
aWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvcGtnX3NyYy5jIGIvbGlib3Br
Zy9wa2dfc3JjLmMKaW5kZXggMzk1ODYxMS4uZWRkMTlhZCAxMDA2NDQKLS0tIGEvbGlib3BrZy9w
a2dfc3JjLmMKKysrIGIvbGlib3BrZy9wa2dfc3JjLmMKQEAgLTUsNiArNSw4IEBACiAKICAgIENv
cHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAg
bW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvcGtnX3NyYy5oIGIvbGli
b3BrZy9wa2dfc3JjLmgKaW5kZXggNjA4Zjc4Mi4uZmE0M2EwYSAxMDA2NDQKLS0tIGEvbGlib3Br
Zy9wa2dfc3JjLmgKKysrIGIvbGlib3BrZy9wa2dfc3JjLmgKQEAgLTUsNiArNSw4IEBACiAKICAg
IENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAor
ICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgog
ICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvcGtnX3NyY19saXN0
LmMgYi9saWJvcGtnL3BrZ19zcmNfbGlzdC5jCmluZGV4IGQwMmIzMzAuLmYyOTYyYTQgMTAwNjQ0
Ci0tLSBhL2xpYm9wa2cvcGtnX3NyY19saXN0LmMKKysrIGIvbGlib3BrZy9wa2dfc3JjX2xpc3Qu
YwpAQCAtNSw2ICs1LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2Yg
U291dGhlcm4gQ2FsaWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0
IGEvbGlib3BrZy9wa2dfc3JjX2xpc3QuaCBiL2xpYm9wa2cvcGtnX3NyY19saXN0LmgKaW5kZXgg
MzUxYWU1ZS4uYzBjOWY0YiAxMDA2NDQKLS0tIGEvbGlib3BrZy9wa2dfc3JjX2xpc3QuaAorKysg
Yi9saWJvcGtnL3BrZ19zcmNfbGlzdC5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQg
KEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAg
ICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BrZ192ZWMuYyBiL2xpYm9wa2cvcGtn
X3ZlYy5jCmluZGV4IGI0NWM4MzkuLjgwMWE0NjAgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnX3Zl
Yy5jCisrKyBiL2xpYm9wa2cvcGtnX3ZlYy5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmln
aHQgKEMpIDIwMDIgQ29tcGFxIENvbXB1dGVyIENvcnBvcmF0aW9uCiAKKyAgIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBw
dWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24g
Miwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3BrZ192ZWMuaCBiL2xpYm9wa2cvcGtnX3Zl
Yy5oCmluZGV4IGFkZjdjNDQuLjVmMWMzMzcgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcGtnX3ZlYy5o
CisrKyBiL2xpYm9wa2cvcGtnX3ZlYy5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQg
KEMpIDIwMDIgQ29tcGFxIENvbXB1dGVyIENvcnBvcmF0aW9uCiAKKyAgIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwg
b3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3JlbGVhc2UuYyBiL2xpYm9wa2cvcmVsZWFzZS5j
CmluZGV4IGU1YzgwMGMuLjFiZGM5MDkgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcmVsZWFzZS5jCisr
KyBiL2xpYm9wa2cvcmVsZWFzZS5jCkBAIC0zLDYgKzMsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMp
IDIwMTAsMjAxMSBKYXZpZXIgUGFsYWNpb3MKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlm
ZiAtLWdpdCBhL2xpYm9wa2cvcmVsZWFzZS5oIGIvbGlib3BrZy9yZWxlYXNlLmgKaW5kZXggNmEy
ODI4NC4uM2RjNjJkYSAxMDA2NDQKLS0tIGEvbGlib3BrZy9yZWxlYXNlLmgKKysrIGIvbGlib3Br
Zy9yZWxlYXNlLmgKQEAgLTMsNiArMyw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAxMCwyMDEx
IEphdmllciBQYWxhY2lvcwogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEv
bGlib3BrZy9yZWxlYXNlX3BhcnNlLmMgYi9saWJvcGtnL3JlbGVhc2VfcGFyc2UuYwppbmRleCBl
YTMzNWM5Li40NWY5NTIxIDEwMDY0NAotLS0gYS9saWJvcGtnL3JlbGVhc2VfcGFyc2UuYworKysg
Yi9saWJvcGtnL3JlbGVhc2VfcGFyc2UuYwpAQCAtMyw2ICszLDggQEAKIAogICAgQ29weXJpZ2h0
IChDKSAyMDEwLDIwMTEgSmF2aWVyIFBhbGFjaW9zCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQg
YnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0
CmRpZmYgLS1naXQgYS9saWJvcGtnL3JlbGVhc2VfcGFyc2UuaCBiL2xpYm9wa2cvcmVsZWFzZV9w
YXJzZS5oCmluZGV4IDA4NmMwMjQuLjhlYjU4MDQgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvcmVsZWFz
ZV9wYXJzZS5oCisrKyBiL2xpYm9wa2cvcmVsZWFzZV9wYXJzZS5oCkBAIC0zLDYgKzMsOCBAQAog
CiAgICBDb3B5cmlnaHQgKEMpIDIwMTAsMjAxMSBKYXZpZXIgUGFsYWNpb3MKIAorICAgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMK
ICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc2hhMjU2LmMgYi9saWJvcGtnL3No
YTI1Ni5jCmluZGV4IGJjZWVkNzIuLmQzM2ZlNjUgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvc2hhMjU2
LmMKKysrIGIvbGlib3BrZy9zaGEyNTYuYwpAQCAtNCw2ICs0LDggQEAKIAogICAgQ29weXJpZ2h0
IChDKSAyMDA1LCAyMDA2IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgogCisgICBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBp
dAogICAgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBh
cyBwdWJsaXNoZWQgYnkgdGhlCiAgICBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2
ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55CmRpZmYgLS1naXQgYS9saWJvcGtnL3No
YTI1Ni5oIGIvbGlib3BrZy9zaGEyNTYuaAppbmRleCAwZDFlOWU1Li4zYWFmYzAzIDEwMDY0NAot
LS0gYS9saWJvcGtnL3NoYTI1Ni5oCisrKyBiL2xpYm9wa2cvc2hhMjU2LmgKQEAgLTMsNiArMyw4
IEBACiAgICBsaWJyYXJ5IGZ1bmN0aW9ucy4KICAgIENvcHlyaWdodCAoQykgMjAwNSwgMjAwNiBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKICAgIHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRo
ZQogICAgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQg
eW91ciBvcHRpb24pIGFueQpkaWZmIC0tZ2l0IGEvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29w
a2dfYWN0aW9uLmMgYi9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwvb3BrZ19hY3Rpb24uYwppbmRl
eCAyMDQzYTU2Li44ODlkN2MzIDEwMDY0NAotLS0gYS9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwv
b3BrZ19hY3Rpb24uYworKysgYi9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwvb3BrZ19hY3Rpb24u
YwpAQCAtMyw2ICszLDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDE1IE5hdGlvbmFsIEluc3Ry
dW1lbnRzIENvcnAuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJv
cGtnL3NvbHZlcnMvaW50ZXJuYWwvb3BrZ19pbnN0YWxsX2ludGVybmFsLmMgYi9saWJvcGtnL3Nv
bHZlcnMvaW50ZXJuYWwvb3BrZ19pbnN0YWxsX2ludGVybmFsLmMKaW5kZXggMTNiNDNhOS4uNTlj
YmUwOSAxMDA2NDQKLS0tIGEvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfaW5zdGFsbF9p
bnRlcm5hbC5jCisrKyBiL2xpYm9wa2cvc29sdmVycy9pbnRlcm5hbC9vcGtnX2luc3RhbGxfaW50
ZXJuYWwuYwpAQCAtMyw2ICszLDggQEAKIAogICAgICBDb3B5cmlnaHQgKEMpIDIwMTUgTmF0aW9u
YWwgSW5zdHJ1bWVudHMgQ29ycC4KIAorICAgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorCiAgICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgICAgcHVibGlzaGVkIGJ5
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApk
aWZmIC0tZ2l0IGEvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfaW5zdGFsbF9pbnRlcm5h
bC5oIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfaW5zdGFsbF9pbnRlcm5hbC5oCmlu
ZGV4IDI4NDA1ODMuLmVkNTE5MWIgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvc29sdmVycy9pbnRlcm5h
bC9vcGtnX2luc3RhbGxfaW50ZXJuYWwuaAorKysgYi9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwv
b3BrZ19pbnN0YWxsX2ludGVybmFsLmgKQEAgLTMsNiArMyw4IEBACiAKICAgICAgQ29weXJpZ2h0
IChDKSAyMDE1IE5hdGlvbmFsIEluc3RydW1lbnRzIENvcnAuCiAKKyAgICAgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAg
ICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc29sdmVycy9pbnRlcm5hbC9vcGtn
X3NvbHZlcl9pbnRlcm5hbC5jIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfc29sdmVy
X2ludGVybmFsLmMKaW5kZXggYjg1NTVhMC4uYzU1ZmQyYyAxMDA2NDQKLS0tIGEvbGlib3BrZy9z
b2x2ZXJzL2ludGVybmFsL29wa2dfc29sdmVyX2ludGVybmFsLmMKKysrIGIvbGlib3BrZy9zb2x2
ZXJzL2ludGVybmFsL29wa2dfc29sdmVyX2ludGVybmFsLmMKQEAgLTMsNiArMyw4IEBACiAKICAg
ICAgQ29weXJpZ2h0IChDKSAyMDE1IE5hdGlvbmFsIEluc3RydW1lbnRzIENvcnAuCiAKKyAgICAg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAg
ICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzCiAgICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc29sdmVycy9p
bnRlcm5hbC9vcGtnX3NvbHZlcl9pbnRlcm5hbC5oIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFs
L29wa2dfc29sdmVyX2ludGVybmFsLmgKaW5kZXggYjNlNjYzMS4uZmI5YmNiNiAxMDA2NDQKLS0t
IGEvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfc29sdmVyX2ludGVybmFsLmgKKysrIGIv
bGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfc29sdmVyX2ludGVybmFsLmgKQEAgLTMsNiAr
Myw4IEBACiAKICAgICAgQ29weXJpZ2h0IChDKSAyMDE1IE5hdGlvbmFsIEluc3RydW1lbnRzIENv
cnAuCiAKKyAgICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwog
ICAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yCiAgICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAgICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9w
a2cvc29sdmVycy9pbnRlcm5hbC9vcGtnX3VwZ3JhZGVfaW50ZXJuYWwuYyBiL2xpYm9wa2cvc29s
dmVycy9pbnRlcm5hbC9vcGtnX3VwZ3JhZGVfaW50ZXJuYWwuYwppbmRleCAwYTQ4Zjc1Li4xYTNl
ZGQ5IDEwMDY0NAotLS0gYS9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwvb3BrZ191cGdyYWRlX2lu
dGVybmFsLmMKKysrIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfdXBncmFkZV9pbnRl
cm5hbC5jCkBAIC02LDYgKzYsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDMgRGFuaWVsZSBO
aWNvbG9kaSA8ZGFuaWVsZUBncmludGEubmV0PgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApk
aWZmIC0tZ2l0IGEvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfdXBncmFkZV9pbnRlcm5h
bC5oIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL29wa2dfdXBncmFkZV9pbnRlcm5hbC5oCmlu
ZGV4IDNkMmRmZjkuLjQxMWY4ODAgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvc29sdmVycy9pbnRlcm5h
bC9vcGtnX3VwZ3JhZGVfaW50ZXJuYWwuaAorKysgYi9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwv
b3BrZ191cGdyYWRlX2ludGVybmFsLmgKQEAgLTMsNiArMyw4IEBACiAKICAgIENvcHlyaWdodCAo
QykgMjAwMyBEYW5pZWxlIE5pY29sb2RpIDxkYW5pZWxlQGdyaW50YS5uZXQ+CiAKKyAgIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
CiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3NvbHZlcnMvaW50ZXJuYWwvcGtn
X2RlcGVuZHNfaW50ZXJuYWwuYyBiL2xpYm9wa2cvc29sdmVycy9pbnRlcm5hbC9wa2dfZGVwZW5k
c19pbnRlcm5hbC5jCmluZGV4IDVkZWVlNzAuLmQ3YjZiNzIgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cv
c29sdmVycy9pbnRlcm5hbC9wa2dfZGVwZW5kc19pbnRlcm5hbC5jCisrKyBiL2xpYm9wa2cvc29s
dmVycy9pbnRlcm5hbC9wa2dfZGVwZW5kc19pbnRlcm5hbC5jCkBAIC0zLDYgKzMsOCBAQAogCiAg
ICBDb3B5cmlnaHQgKEMpIDIwMTYgTmF0aW9uYWwgSW5zdHJ1bWVudHMgQ29ycG9yYXRpb24KIAor
ICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgog
ICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc29sdmVycy9pbnRl
cm5hbC9wa2dfZGVwZW5kc19pbnRlcm5hbC5oIGIvbGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL3Br
Z19kZXBlbmRzX2ludGVybmFsLmgKaW5kZXggNGE4NjQ5MS4uMWVjN2JiMiAxMDA2NDQKLS0tIGEv
bGlib3BrZy9zb2x2ZXJzL2ludGVybmFsL3BrZ19kZXBlbmRzX2ludGVybmFsLmgKKysrIGIvbGli
b3BrZy9zb2x2ZXJzL2ludGVybmFsL3BrZ19kZXBlbmRzX2ludGVybmFsLmgKQEAgLTMsNiArMyw4
IEBACiAKICAgICAgQ29weXJpZ2h0IChDKSAyMDE1IE5hdGlvbmFsIEluc3RydW1lbnRzIENvcnAu
CiAKKyAgICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAg
ICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yCiAgICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzCiAgICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cv
c29sdmVycy9saWJzb2x2L29wa2dfc29sdmVyX2xpYnNvbHYuYyBiL2xpYm9wa2cvc29sdmVycy9s
aWJzb2x2L29wa2dfc29sdmVyX2xpYnNvbHYuYwppbmRleCA5NTQ4NTc4Li4zNzNhYmU4IDEwMDY0
NAotLS0gYS9saWJvcGtnL3NvbHZlcnMvbGlic29sdi9vcGtnX3NvbHZlcl9saWJzb2x2LmMKKysr
IGIvbGlib3BrZy9zb2x2ZXJzL2xpYnNvbHYvb3BrZ19zb2x2ZXJfbGlic29sdi5jCkBAIC00LDYg
KzQsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMTUgTmF0aW9uYWwgSW5zdHJ1bWVudHMgQ29y
cC4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAg
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc3ByaW50
Zl9hbGxvYy5jIGIvbGlib3BrZy9zcHJpbnRmX2FsbG9jLmMKaW5kZXggOTM2MWM2YS4uMTIwNzI1
OCAxMDA2NDQKLS0tIGEvbGlib3BrZy9zcHJpbnRmX2FsbG9jLmMKKysrIGIvbGlib3BrZy9zcHJp
bnRmX2FsbG9jLmMKQEAgLTMsNiArMyw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAxMCBVYmlx
IFRlY2hub2xvZ2llcyA8Z3JhaGFtLmdvd2VyQGdtYWlsLmNvbT4KIAorICAgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
LCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9saWJvcGtnL3NwcmludGZfYWxsb2Mu
aCBiL2xpYm9wa2cvc3ByaW50Zl9hbGxvYy5oCmluZGV4IDUxMjM5ODIuLjM1ODkxZDUgMTAwNjQ0
Ci0tLSBhL2xpYm9wa2cvc3ByaW50Zl9hbGxvYy5oCisrKyBiL2xpYm9wa2cvc3ByaW50Zl9hbGxv
Yy5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBv
ZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0
aW9uKQpkaWZmIC0tZ2l0IGEvbGlib3BrZy9zdHJfbGlzdC5jIGIvbGlib3BrZy9zdHJfbGlzdC5j
CmluZGV4IGE3MTVmYzQuLmVjYTlhMmMgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cvc3RyX2xpc3QuYwor
KysgYi9saWJvcGtnL3N0cl9saXN0LmMKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAo
QykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAg
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvc3RyX2xpc3QuaCBiL2xpYm9wa2cvc3Ry
X2xpc3QuaAppbmRleCBiOTJlOTZlLi5mYjQ3ODcwIDEwMDY0NAotLS0gYS9saWJvcGtnL3N0cl9s
aXN0LmgKKysrIGIvbGlib3BrZy9zdHJfbGlzdC5oCkBAIC01LDYgKzUsOCBAQAogCiAgICBDb3B5
cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1v
ZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3N0cmluZ191dGlsLmMgYi9s
aWJvcGtnL3N0cmluZ191dGlsLmMKaW5kZXggODIyY2FiNi4uZjRmZDE2NSAxMDA2NDQKLS0tIGEv
bGlib3BrZy9zdHJpbmdfdXRpbC5jCisrKyBiL2xpYm9wa2cvc3RyaW5nX3V0aWwuYwpAQCAtMyw2
ICszLDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDE1IFBhdWwgQmFya2VyCiAKKyAgIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
CiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3N0cmluZ191dGlsLmggYi9saWJv
cGtnL3N0cmluZ191dGlsLmgKaW5kZXggYTkyMGUyYS4uNmUyMTg5NSAxMDA2NDQKLS0tIGEvbGli
b3BrZy9zdHJpbmdfdXRpbC5oCisrKyBiL2xpYm9wa2cvc3RyaW5nX3V0aWwuaApAQCAtMyw2ICsz
LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDE1IFBhdWwgQmFya2VyCiAKKyAgIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAg
ICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3ZvaWRfbGlzdC5jIGIvbGlib3BrZy92
b2lkX2xpc3QuYwppbmRleCA5MWE2NmMxLi4xZmViMDcyIDEwMDY0NAotLS0gYS9saWJvcGtnL3Zv
aWRfbGlzdC5jCisrKyBiL2xpYm9wa2cvdm9pZF9saXN0LmMKQEAgLTUsNiArNSw4IEBACiAKICAg
IENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAor
ICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgog
ICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlmZiAtLWdpdCBhL2xpYm9wa2cvdm9pZF9saXN0Lmgg
Yi9saWJvcGtnL3ZvaWRfbGlzdC5oCmluZGV4IDBjYThlZWUuLjlmODUwMjUgMTAwNjQ0Ci0tLSBh
L2xpYm9wa2cvdm9pZF9saXN0LmgKKysrIGIvbGlib3BrZy92b2lkX2xpc3QuaApAQCAtNSw2ICs1
LDggQEAKIAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFVuaXZlcnNpdHkgb2YgU291dGhlcm4gQ2Fs
aWZvcm5pYQogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgor
CiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yCiAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcwogICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdApkaWZmIC0tZ2l0IGEvbGlib3BrZy94
ZnVuY3MuYyBiL2xpYm9wa2cveGZ1bmNzLmMKaW5kZXggNGU3OTE2Zi4uOWVlMWE3ZCAxMDA2NDQK
LS0tIGEvbGlib3BrZy94ZnVuY3MuYworKysgYi9saWJvcGtnL3hmdW5jcy5jCkBAIC0zLDYgKzMs
NyBAQAogICogVXRpbGl0eSByb3V0aW5lcy4KICAqCiAgKiBDb3B5cmlnaHQgKEMpIDE5OTksMjAw
MCwyMDAxIGJ5IEVyaWsgQW5kZXJzZW4gPGFuZGVyc2VlQGRlYmlhbi5vcmc+CisgKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogICoKICAqIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAg
KiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieQpkaWZmIC0tZ2l0IGEvbGlib3BrZy94ZnVuY3MuaCBiL2xpYm9wa2cveGZ1
bmNzLmgKaW5kZXggMzI3NWQyZC4uNWQyNzhiNCAxMDA2NDQKLS0tIGEvbGlib3BrZy94ZnVuY3Mu
aAorKysgYi9saWJvcGtnL3hmdW5jcy5oCkBAIC0yLDYgKzIsOCBAQAogLyoKICAqIFV0aWxpdHkg
cm91dGluZXMuCiAgKgorICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKKyAqCiAgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAqIHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCmRpZmYg
LS1naXQgYS9saWJvcGtnL3hyZWdleC5jIGIvbGlib3BrZy94cmVnZXguYwppbmRleCA1ZjIyMDY3
Li42YzM5NWU1IDEwMDY0NAotLS0gYS9saWJvcGtnL3hyZWdleC5jCisrKyBiL2xpYm9wa2cveHJl
Z2V4LmMKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAwMSBVbml2ZXJzaXR5
IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBv
cHRpb24pCmRpZmYgLS1naXQgYS9saWJvcGtnL3hyZWdleC5oIGIvbGlib3BrZy94cmVnZXguaApp
bmRleCAxYTVkODcxLi5mNmYxNWNiIDEwMDY0NAotLS0gYS9saWJvcGtnL3hyZWdleC5oCisrKyBi
L2xpYm9wa2cveHJlZ2V4LmgKQEAgLTUsNiArNSw4IEBACiAKICAgIENvcHlyaWdodCAoQykgMjAw
MSBVbml2ZXJzaXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBv
ciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9saWJvcGtnL3hzeXN0ZW0uYyBiL2xpYm9w
a2cveHN5c3RlbS5jCmluZGV4IDhmMmVmMWMuLmQ3Y2MzMWUgMTAwNjQ0Ci0tLSBhL2xpYm9wa2cv
eHN5c3RlbS5jCisrKyBiL2xpYm9wa2cveHN5c3RlbS5jCkBAIC01LDYgKzUsOCBAQAogCiAgICBD
b3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAKKyAg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAg
IG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9saWJvcGtnL3hzeXN0ZW0uaCBiL2xp
Ym9wa2cveHN5c3RlbS5oCmluZGV4IGRhZTc5NjAuLjk2MDU1OTQgMTAwNjQ0Ci0tLSBhL2xpYm9w
a2cveHN5c3RlbS5oCisrKyBiL2xpYm9wa2cveHN5c3RlbS5oCkBAIC01LDYgKzUsOCBAQAogCiAg
ICBDb3B5cmlnaHQgKEMpIDIwMDEgVW5pdmVyc2l0eSBvZiBTb3V0aGVybiBDYWxpZm9ybmlhCiAK
KyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IK
ICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzCiAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsg
ZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0CmRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKaW5kZXggMjcxN2M1OS4uMTVlMjQxMSAxMDA3NTUK
LS0tIGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsCisrKyBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbApA
QCAtMTEsNiArMTEsNyBAQAogIyAoYykgMjAwNSwgSm9lbCBTY2hvcHAgPGpzY2hvcHBAYXVzdGlu
LmlibS5jb20+ICh0aGUgdWdseSBiaXQpCiAjIChjKSAyMDA3LDIwMDgsIEFuZHkgV2hpdGNyb2Z0
IDxhcHdAdWsuaWJtLmNvbT4gKG5ldyBjb25kaXRpb25zLCB0ZXN0IHN1aXRlKQogIyAoYykgMjAw
OC0yMDEwIEFuZHkgV2hpdGNyb2Z0IDxhcHdAY2Fub25pY2FsLmNvbT4KKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIyBMaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHUEwgTGljZW5zZSB2ZXJzaW9uIDIKIAogdXNlIHN0cmljdDsKZGlmZiAtLWdpdCBh
L3NjcmlwdHMvdGVzdC1icmFuY2gucHkgYi9zY3JpcHRzL3Rlc3QtYnJhbmNoLnB5CmluZGV4IDM2
MDIxODMuLmM3ZGFlNjAgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvdGVzdC1icmFuY2gucHkKKysrIGIv
c2NyaXB0cy90ZXN0LWJyYW5jaC5weQpAQCAtNCw2ICs0LDggQEAKICMKICMJQ29weXJpZ2h0IChD
KSAyMDEzIFBhdWwgQmFya2VyCiAjCisjICAgICAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyCisjCiAjCVRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0CiAjCXVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQogIwlG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9w
dGlvbikgYW55CmRpZmYgLS1naXQgYS9zcmMvb3BrZy5jIGIvc3JjL29wa2cuYwppbmRleCAzMmE5
OGU2Li5iOGIxYTQxIDEwMDY0NAotLS0gYS9zcmMvb3BrZy5jCisrKyBiL3NyYy9vcGtnLmMKQEAg
LTcsNiArNyw4IEBACiAgICBDYXJsIEQuIFdvcnRoCiAgICBDb3B5cmlnaHQgMjAwMSBVbml2ZXJz
aXR5IG9mIFNvdXRoZXJuIENhbGlmb3JuaWEKIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKICAgIHB1Ymxpc2hlZCBieSB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2NmZy5weSBiL3Rlc3RzL2NmZy5weQppbmRleCBjYTU5ZDAzLi5hOWMx
Y2Y2IDEwMDY0NAotLS0gYS90ZXN0cy9jZmcucHkKKysrIGIvdGVzdHMvY2ZnLnB5CkBAIC0xLDMg
KzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiBpbXBvcnQg
b3MKIAogb3BrZGlyID0gIi90bXAvb3BrIgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8wMV9pbnN0
YWxsLnB5IGIvdGVzdHMvY29yZS8wMV9pbnN0YWxsLnB5CmluZGV4IGFmNjk3ZWYuLjhjMTRjMzYg
MTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMDFfaW5zdGFsbC5weQorKysgYi90ZXN0cy9jb3JlLzAx
X2luc3RhbGwucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIEluc3RhbGwgYSBwYWNr
YWdlIGFuZCBjaGVjayB0aGF0IGl0IGlzIGxpc3RlZCBhcyBpbnN0YWxsZWQuIFRoZW4gcmVtb3Zl
IHRoZQogIyBwYWNrYWdlIGFuZCBjaGVjayB0aGF0IGl0IGlzIG5vIGxvbmdlciBsaXN0ZWQgYXMg
aW5zdGFsbGVkLgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8wMl9maWxlLnB5IGIvdGVzdHMvY29y
ZS8wMl9maWxlLnB5CmluZGV4IGVhZmRmYjIuLjc2OWY3MDggMTAwNzU1Ci0tLSBhL3Rlc3RzL2Nv
cmUvMDJfZmlsZS5weQorKysgYi90ZXN0cy9jb3JlLzAyX2ZpbGUucHkKQEAgLTEsNCArMSw1IEBA
CiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjCiAjIEluc3RhbGwgYSBwYWNrYWdlIGNvbnRhaW5pbmcgYSBmaWxlIGFuZCBj
aGVjayB0aGF0IHRoZSBmaWxlIGlzIGNyZWF0ZWQuIFJlbW92ZQogIyB0aGUgcGFja2FnZSBhbmQg
Y2hlY2sgdGhhdCB0aGUgZmlsZSBpcyByZW1vdmVkLgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8w
M191cGdyYWRlLnB5IGIvdGVzdHMvY29yZS8wM191cGdyYWRlLnB5CmluZGV4IDAyYjFlZWYuLjUx
YTgxYjggMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMDNfdXBncmFkZS5weQorKysgYi90ZXN0cy9j
b3JlLzAzX3VwZ3JhZGUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9u
MworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIEluc3RhbGwg
YSBwYWNrYWdlIGFuZCB0aGVuIG1ha2UgYXZhaWxhYmxlIGEgbmV3IHZlcnNpb24gb2YgdGhlIHNh
bWUgcGFja2FnZS4KICMgVXBncmFkZSBhbmQgY2hlY2sgdGhhdCB0aGUgbmV3IHZlcnNpb24gaXMg
aW5zdGFsbGVkIGFuZCB0aGUgb2xkIHZlcnNpb24KZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMDRf
dXBncmFkZV9maWxlLnB5IGIvdGVzdHMvY29yZS8wNF91cGdyYWRlX2ZpbGUucHkKaW5kZXggYWYz
YzYyMi4uYzVmOTg2YiAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8wNF91cGdyYWRlX2ZpbGUucHkK
KysrIGIvdGVzdHMvY29yZS8wNF91cGdyYWRlX2ZpbGUucHkKQEAgLTEsNCArMSw1IEBACiAjISAv
dXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAjCiAjIEluc3RhbGwgYSBwYWNrYWdlIGFuZCB0aGVuIG1ha2UgYXZhaWxhYmxlIGEgbmV3
IHZlcnNpb24gb2YgdGhlIHNhbWUgcGFja2FnZS4KICMgVGhpcyBpcyBzaW1pbGFyIHRvIHRlc3Qg
MyBidXQgd2UgcHV0IGEgZmlsZSAidGVzdDEiIGluIHZlcnNpb24gMS4wIG9mIHRoZQpkaWZmIC0t
Z2l0IGEvdGVzdHMvY29yZS8wNV9kb3duZ3JhZGUucHkgYi90ZXN0cy9jb3JlLzA1X2Rvd25ncmFk
ZS5weQppbmRleCAwOGI3NzQ1Li43OWQwYWZlIDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzA1X2Rv
d25ncmFkZS5weQorKysgYi90ZXN0cy9jb3JlLzA1X2Rvd25ncmFkZS5weQpAQCAtMSw0ICsxLDUg
QEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkKICMKICMgTWFrZSBhdmFpbGFibGUgdHdvIHZlcnNpb25zIG9mIHRoZSBzYW1l
IHBhY2thZ2UgYW5kIGluc3RhbGwgaXQuIENoZWNrIHRoYXQgdGhlCiAjIGxhdGVzdCB2ZXJzaW9u
IGlzIGNob3NlbiBvdXQgb2YgdGhlIHR3byBhdmFpbGFibGUuIFRoZW4gZXhwbGljaXRseSBpbnN0
YWxsIHRoZQpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8wNl9kZXBlbmRlbmN5LnB5IGIvdGVzdHMv
Y29yZS8wNl9kZXBlbmRlbmN5LnB5CmluZGV4IDhhMTE2YmEuLjM3YjE2YWMgMTAwNzU1Ci0tLSBh
L3Rlc3RzL2NvcmUvMDZfZGVwZW5kZW5jeS5weQorKysgYi90ZXN0cy9jb3JlLzA2X2RlcGVuZGVu
Y3kucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIEluc3RhbGwgYSBwYWNrYWdlICdh
JyB3aGljaCBkZXBlbmRzIG9uIGEgc2Vjb25kIHBhY2thZ2UgJ2InLiBDaGVjayB0aGF0IGJvdGgK
ICMgYXJlIGluc3RhbGxlZCwgdGhhdCBwYWNrYWdlICdhJyBkb2VzIG5vdCByZXBvcnQgYXMgYXV0
b21hdGljYWxseSBpbnN0YWxsZWQgYnV0CmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzA3X2hvbGRf
dXBncmFkZS5weSBiL3Rlc3RzL2NvcmUvMDdfaG9sZF91cGdyYWRlLnB5CmluZGV4IGIxOGRmZjEu
LmRmNTk2MGIgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMDdfaG9sZF91cGdyYWRlLnB5CisrKyBi
L3Rlc3RzL2NvcmUvMDdfaG9sZF91cGdyYWRlLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9i
aW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQog
IwogIyBJbnN0YWxsIGEgcGFja2FnZSBhbmQgbWFyayBpdCBhcyBvbiBob2xkLiBNYWtlIGFuIHVw
ZGF0ZWQgdmVyc2lvbiBhdmFpbGFibGUKICMgYW5kIHVwZ3JhZGUuIENoZWNrIHRoYXQgdGhlIG5l
dyB2ZXJzaW9uIGlzIG5vdCBpbnN0YWxsZWQgYW5kIHRoZSBvbGQgdmVyc2lvbgpkaWZmIC0tZ2l0
IGEvdGVzdHMvY29yZS8wOF9ob2xkX2J5X2hhbmQucHkgYi90ZXN0cy9jb3JlLzA4X2hvbGRfYnlf
aGFuZC5weQppbmRleCAzNzA2MzNmLi5kNzc2NTRlIDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzA4
X2hvbGRfYnlfaGFuZC5weQorKysgYi90ZXN0cy9jb3JlLzA4X2hvbGRfYnlfaGFuZC5weQpAQCAt
MSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgV2l0aGluIHRoZSBmdW5jdGlvbiBgcGtnX2hhc2hf
ZmV0Y2hfYmVzdF9pbnN0YWxsYXRpb25fY2FuZGlkYXRlYCwgd2Ugd2lzaCB0bwogIyB0ZXN0IHRo
ZSBjb25kaXRpb24gd2hlcmUgYChoZWxkX3BrZyAmJiBnb29kX3BrZ19ieV9uYW1lKSA9PSB0cnVl
YC4gU28gaW5zdGFsbApkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8wOV9ob2xkX2RlcGVuZHMucHkg
Yi90ZXN0cy9jb3JlLzA5X2hvbGRfZGVwZW5kcy5weQppbmRleCAwNjRiYTNjLi4wZDU1NDA5IDEw
MDc1NQotLS0gYS90ZXN0cy9jb3JlLzA5X2hvbGRfZGVwZW5kcy5weQorKysgYi90ZXN0cy9jb3Jl
LzA5X2hvbGRfZGVwZW5kcy5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRo
b24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgTWFyayBh
biBpbnN0YWxsZWQgcGFja2FnZSBhLTEuMCBhcyBvbiBob2xkLCBtYWtlIGF2YWlsYWJsZSBhLTIu
MCBkZXBlbmRlZCBvbgogIyBieSB6LiBDaGVjayB0aGF0IHogcmVmdXNlcyB0byBpbnN0YWxsIGR1
ZSB0byBhLTEuMCBiZWluZyBoZWxkLgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8xMF92aXJ0dWFs
X2NvbmZsaWN0c19maXJzdC5weSBiL3Rlc3RzL2NvcmUvMTBfdmlydHVhbF9jb25mbGljdHNfZmly
c3QucHkKaW5kZXggMzJiMDdiMS4uZWExMGU1YSAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8xMF92
aXJ0dWFsX2NvbmZsaWN0c19maXJzdC5weQorKysgYi90ZXN0cy9jb3JlLzEwX3ZpcnR1YWxfY29u
ZmxpY3RzX2ZpcnN0LnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBJbnN0YWxsIGEg
cGFja2FnZSAneCcgd2hpY2ggUFJPVklERVMgYW5kIENPTkZMSUNUUyAndicsIGluZGljYXRpbmcg
dGhhdCAndicgaXMKICMgYSB2aXJ0dWFsIHBhY2thZ2UgYW5kIG5vIG90aGVyIHByb3ZpZGVyIG9m
IHRoaXMgdmlydHVhbCBwYWNrYWdlIHNob3VsZCBiZQpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8x
MV92aXJ0dWFsX2NvbmZsaWN0c19zZWNvbmQucHkgYi90ZXN0cy9jb3JlLzExX3ZpcnR1YWxfY29u
ZmxpY3RzX3NlY29uZC5weQppbmRleCAxZjM2Yjc4Li4yMDkwYjJlIDEwMDc1NQotLS0gYS90ZXN0
cy9jb3JlLzExX3ZpcnR1YWxfY29uZmxpY3RzX3NlY29uZC5weQorKysgYi90ZXN0cy9jb3JlLzEx
X3ZpcnR1YWxfY29uZmxpY3RzX3NlY29uZC5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmlu
L2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMK
ICMgSW5zdGFsbCBhIHBhY2thZ2UgJ3gnIHdoaWNoIFBST1ZJREVTICd2Jy4gVGhlbiB0cnkgdG8g
aW5zdGFsbCAneScgd2hpY2gKICMgUFJPVklERVMgYW5kIENPTkZMSUNUUyAndicsIGluZGljYXRp
bmcgdGhhdCBubyBvdGhlciBwcm92aWRlciBvZiB0aGUgdmlydHVhbApkaWZmIC0tZ2l0IGEvdGVz
dHMvY29yZS8xMl92aXJ0dWFsX25vX2NvbmZsaWN0cy5weSBiL3Rlc3RzL2NvcmUvMTJfdmlydHVh
bF9ub19jb25mbGljdHMucHkKaW5kZXggOGU4MTE3My4uZDJlNjA4YiAxMDA3NTUKLS0tIGEvdGVz
dHMvY29yZS8xMl92aXJ0dWFsX25vX2NvbmZsaWN0cy5weQorKysgYi90ZXN0cy9jb3JlLzEyX3Zp
cnR1YWxfbm9fY29uZmxpY3RzLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5
dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBJbnN0
YWxsIGEgcGFja2FnZSAneCcgd2hpY2ggUFJPVklERVMgJ3YnIGFuZCBlbnN1cmUgdGhhdCB3ZSBj
YW4gaW5zdGFsbAogIyBhbm90aGVyIHBhY2thZ2UgJ3knIHdoaWNoIGFsc28gUFJPVklERVMgJ3Yn
LgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8xM192aXJ0dWFsX3VwZ3JhZGUucHkgYi90ZXN0cy9j
b3JlLzEzX3ZpcnR1YWxfdXBncmFkZS5weQppbmRleCAzNzVkNDcxLi4zZmI4MTEzIDEwMDc1NQot
LS0gYS90ZXN0cy9jb3JlLzEzX3ZpcnR1YWxfdXBncmFkZS5weQorKysgYi90ZXN0cy9jb3JlLzEz
X3ZpcnR1YWxfdXBncmFkZS5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRo
b24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgSW5zdGFs
bCB2ZXJzaW9uIDEuMCBvZiBhIHBhY2thZ2UgJ3gnIHdoaWNoIFBST1ZJREVTIGFuZCBDT05GTElD
VFMgJ3YnLCB0aGVuCiAjIHRyeSB0byB1cGdyYWRlIGl0LgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29y
ZS8xNF91cGdyYWRlX2J5X3VyaS5weSBiL3Rlc3RzL2NvcmUvMTRfdXBncmFkZV9ieV91cmkucHkK
aW5kZXggNmRmMWY0Yi4uOWNkMWQ0YSAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8xNF91cGdyYWRl
X2J5X3VyaS5weQorKysgYi90ZXN0cy9jb3JlLzE0X3VwZ3JhZGVfYnlfdXJpLnB5CkBAIC0xLDQg
KzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogIwogIyBJbnN0YWxsIGEgcGFja2FnZSBhbmQgdGhlbiBtYWtlIGF2
YWlsYWJsZSBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBzYW1lIHBhY2thZ2UuCiAjIEluc3RhbGwgdGhp
cyBzZWNvbmQgdmVyc2lvbiBvZiB0aGUgcGFja2FnZSBieSBVUkkgdG8gdGhlIHBhY2thZ2UgZmls
ZSByYXRoZXIKZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMTVfcmVpbnN0YWxsX2J5X3VyaS5weSBi
L3Rlc3RzL2NvcmUvMTVfcmVpbnN0YWxsX2J5X3VyaS5weQppbmRleCAwY2VkOTk0Li5lMGVjODQ1
IDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzE1X3JlaW5zdGFsbF9ieV91cmkucHkKKysrIGIvdGVz
dHMvY29yZS8xNV9yZWluc3RhbGxfYnlfdXJpLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9i
aW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQog
IwogIwogCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzE2X3VwZ3JhZGVfZGVwZW5kZW5jeS5weSBi
L3Rlc3RzL2NvcmUvMTZfdXBncmFkZV9kZXBlbmRlbmN5LnB5CmluZGV4IDBjNTY5YzQuLmE5YjAx
NzQgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMTZfdXBncmFkZV9kZXBlbmRlbmN5LnB5CisrKyBi
L3Rlc3RzL2NvcmUvMTZfdXBncmFkZV9kZXBlbmRlbmN5LnB5CkBAIC0xLDQgKzEsNSBAQAogIyEg
L3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogIwogIyBJbnN0YWxsIGEgcGFja2FnZSAnYScgYXQgdmVyc2lvbiAxLjAuIE1ha2UgYXZh
aWxhYmxlICdhJyBhdCB2ZXJzaW9uIDIuMCB3aXRoCiAjIGRlcGVuZGVuY3kgb24gJ2InLCBhbmQg
bWFrZSBhdmFpbGFibGUgJ2InLiBEbyB1cGdyYWRlIGFuZCBlbnN1cmUgdGhhdCAnYicgaW4KZGlm
ZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMTdfdXBncmFkZV9jb25mbGljdHMucHkgYi90ZXN0cy9jb3Jl
LzE3X3VwZ3JhZGVfY29uZmxpY3RzLnB5CmluZGV4IDdjZDM0OGEuLmE0MGYxNDMgMTAwNzU1Ci0t
LSBhL3Rlc3RzL2NvcmUvMTdfdXBncmFkZV9jb25mbGljdHMucHkKKysrIGIvdGVzdHMvY29yZS8x
N191cGdyYWRlX2NvbmZsaWN0cy5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBw
eXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgSW5z
dGFsbCBhIHBhY2thZ2UgQSBhdCB2ZXJzaW9uIFYuIEluc3RhbGwgYSBwYWNrYWdlIEIsIHdoaWNo
IGNvbmZsaWN0cwogIyB3aXRoIGEgdmVyc2lvbiBvZiBBIG9sZGVyIHRoYW4gVi4gTWFrZSBhdmFp
bGFibGUgQSBhdCBhIHZlcnNpb24gbmV3ZXIKZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMThfdXBn
cmFkZV9yZWNvbW1lbmRzLnB5IGIvdGVzdHMvY29yZS8xOF91cGdyYWRlX3JlY29tbWVuZHMucHkK
aW5kZXggNDYyNGNkMi4uYmMyNGFjZSAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8xOF91cGdyYWRl
X3JlY29tbWVuZHMucHkKKysrIGIvdGVzdHMvY29yZS8xOF91cGdyYWRlX3JlY29tbWVuZHMucHkK
QEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIEluc3RhbGwgYSBwYWNrYWdlIEIsIHdoaWNo
IHJlY29tbWVuZHMgcGFja2FnZSBBLiBWZXJpZnkgdGhhdCBBIGluc3RhbGxzCiAjIGF1dG9tYXRp
Y2FsbHkgYW5kIGdldHMgZmxhZ2dlZCBhcyBhdXRvLWluc3RhbGxlZC4gTWFrZSBhIG5ld2VyIHZl
cnNpb24KZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMTlfbm9fcmVjb21tZW5kcy5weSBiL3Rlc3Rz
L2NvcmUvMTlfbm9fcmVjb21tZW5kcy5weQppbmRleCAyODc2NGMyLi40MzMyMzlmIDEwMDc1NQot
LS0gYS90ZXN0cy9jb3JlLzE5X25vX3JlY29tbWVuZHMucHkKKysrIGIvdGVzdHMvY29yZS8xOV9u
b19yZWNvbW1lbmRzLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBDcmVhdGUgcGFj
a2FnZXMgJ2EnLCAnYicgd2hpY2ggcmVjb21tZW5kcyAnYScgYW5kICdjJyB3aGljaCBkZXBlbmRz
IG9uICdhJy4KICMgSW5zdGFsbCAnYicgd2l0aCAnLS1uby1pbnN0YWxsLXJlY29tbWVuZHMnIGFu
ZCBlbnN1cmUgJ2EnIGlzIG5vdCBpbnN0YWxsZWQuCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzIw
X2V4Y2x1ZGUucHkgYi90ZXN0cy9jb3JlLzIwX2V4Y2x1ZGUucHkKaW5kZXggYjAzZWIyNC4uZDEx
NDIwMiAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8yMF9leGNsdWRlLnB5CisrKyBiL3Rlc3RzL2Nv
cmUvMjBfZXhjbHVkZS5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24z
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgQ3JlYXRlIHBh
Y2thZ2VzICdhJywgJ2InIHdoaWNoIHJlY29tbWVuZHMgJ2EnIGFuZCAnYycgd2hpY2ggZGVwZW5k
cyBvbiAnYScuCiAjIEluc3RhbGwgJ2InIHdpdGggJy0tYWRkLWV4Y2x1ZGUgYScgYW5kIGVuc3Vy
ZSAnYicgaXMgaW5zdGFsbGVkIGJ1dCAnYScgaXMgbm90LgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29y
ZS8yMV9hdXRvcmVtb3ZlLnB5IGIvdGVzdHMvY29yZS8yMV9hdXRvcmVtb3ZlLnB5CmluZGV4IDRi
OGQzMzUuLmQ0MzRmYWEgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMjFfYXV0b3JlbW92ZS5weQor
KysgYi90ZXN0cy9jb3JlLzIxX2F1dG9yZW1vdmUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNy
L2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjCiAjIENyZWF0ZSBwYWNrYWdlICdhJyB3aGljaCBkZXBlbmRzIG9uICdiJyBhbmQgJ2MnLgog
IyBFeHBsaWNpdGx5IGluc3RhbGwgJ2InIHRoZW4gaW5zdGFsbCAnYScuCmRpZmYgLS1naXQgYS90
ZXN0cy9jb3JlLzIyX2F1dG9yZW1vdmVfZGVwZW5kZW5jeS5weSBiL3Rlc3RzL2NvcmUvMjJfYXV0
b3JlbW92ZV9kZXBlbmRlbmN5LnB5CmluZGV4IGM1ZDA5MzEuLjczZTkyNDYgMTAwNzU1Ci0tLSBh
L3Rlc3RzL2NvcmUvMjJfYXV0b3JlbW92ZV9kZXBlbmRlbmN5LnB5CisrKyBiL3Rlc3RzL2NvcmUv
MjJfYXV0b3JlbW92ZV9kZXBlbmRlbmN5LnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4v
ZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwog
IyBDcmVhdGUgcGFja2FnZXMgJ2EnIGFuZCAnYicgd2hpY2ggYm90aCBkZXBlbmQgb24gJ2MnLgog
IyBJbnN0YWxsICdhJyBhbmQgJ2InIGFuZCBjaGVjayB0aGF0ICdjJyBpcyBhdXRvaW5zdGFsbGVk
LgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8yNF9ub2RlcHMucHkgYi90ZXN0cy9jb3JlLzI0X25v
ZGVwcy5weQppbmRleCA5M2I1ODI2Li4zMjU2MTJmIDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzI0
X25vZGVwcy5weQorKysgYi90ZXN0cy9jb3JlLzI0X25vZGVwcy5weQpAQCAtMSw0ICsxLDUgQEAK
ICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKICMKICMgQ3JlYXRlIHBhY2thZ2UgJ2EnIHdoaWNoIGRlcGVuZHMgb24gJ2InCiAj
IEluc3RhbGwgJ2EnIHdpdGggLS1ub2RlcHMgYW5kIGNoZWNrIHRoYXQgJ2InIGlzIG5vdCBpbnN0
YWxsZWQKZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMjVfZXNzZW50aWFsLnB5IGIvdGVzdHMvY29y
ZS8yNV9lc3NlbnRpYWwucHkKaW5kZXggMzhlZWM1Zi4uYjBlN2ZmZSAxMDA3NTUKLS0tIGEvdGVz
dHMvY29yZS8yNV9lc3NlbnRpYWwucHkKKysrIGIvdGVzdHMvY29yZS8yNV9lc3NlbnRpYWwucHkK
QEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIENyZWF0ZSBlc3NlbnRpYWwgcGFja2FnZXMg
J2EoMS4wKScgYW5kICdhKDIuMCknLgogIyBJbnN0YWxsICdhKDEuMCknLgpkaWZmIC0tZ2l0IGEv
dGVzdHMvY29yZS8yNWFfZXNzZW50aWFsLnB5IGIvdGVzdHMvY29yZS8yNWFfZXNzZW50aWFsLnB5
CmluZGV4IGNjNTM2NzAuLmM3MzlmZjMgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMjVhX2Vzc2Vu
dGlhbC5weQorKysgYi90ZXN0cy9jb3JlLzI1YV9lc3NlbnRpYWwucHkKQEAgLTEsNCArMSw1IEBA
CiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjCiAjIENyZWF0ZSBlc3NlbnRpYWwgcGFja2FnZXMgJ2EnLCB3aGljaCBEZXBl
bmRzIG9uIGIuIFBhY2thZ2UgJ2InIGRlcGVuZHMgb24gJ2MnCiAjIEluc3RhbGwgJ2EnLgpkaWZm
IC0tZ2l0IGEvdGVzdHMvY29yZS8yNl9wcmVmZXJfYXJjaF90b192ZXJzaW9uLnB5IGIvdGVzdHMv
Y29yZS8yNl9wcmVmZXJfYXJjaF90b192ZXJzaW9uLnB5CmluZGV4IDBhMGQ2NmIuLjM1YjM4ODMg
MTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMjZfcHJlZmVyX2FyY2hfdG9fdmVyc2lvbi5weQorKysg
Yi90ZXN0cy9jb3JlLzI2X3ByZWZlcl9hcmNoX3RvX3ZlcnNpb24ucHkKQEAgLTEsNCArMSw1IEBA
CiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjCiAjIENyZWF0ZSBwYWNrYWdlICd4KDEuMCknIHdpdGggYXJjaGl0ZWN0dXJl
IGEgYW5kICd4KDIuMCknIHdpdGggYXJjaGl0ZWN0dXJlIGIuCiAjIEluc3RhbGwgJ3gnIHdpdGgg
LS1hZGQtYXJjaCBhOjIgYW5kIC0tYWRkLWFyY2ggYjoxLgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29y
ZS8yN19yZWxkZXBzX2x0LnB5IGIvdGVzdHMvY29yZS8yN19yZWxkZXBzX2x0LnB5CmluZGV4IDgy
YmFhNGIuLjlmZjQyY2UgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMjdfcmVsZGVwc19sdC5weQor
KysgYi90ZXN0cy9jb3JlLzI3X3JlbGRlcHNfbHQucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNy
L2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjCiAjIENyZWF0ZSAnYScgd2hpY2ggZGVwZW5kcyBvbiAnYicgZWFybGllciB0aGFuIDIuMC4K
ICMgY3JlYXRlICdiJyBpbiB2ZXJzaW9ucyAxLjAsIDIuMCwgYW5kIDMuMC4KZGlmZiAtLWdpdCBh
L3Rlc3RzL2NvcmUvMjhfcmVsZGVwc19sdGVxLnB5IGIvdGVzdHMvY29yZS8yOF9yZWxkZXBzX2x0
ZXEucHkKaW5kZXggM2IxNGRhNC4uNGRiZDY5NSAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8yOF9y
ZWxkZXBzX2x0ZXEucHkKKysrIGIvdGVzdHMvY29yZS8yOF9yZWxkZXBzX2x0ZXEucHkKQEAgLTEs
NCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIENyZWF0ZSAnYScgd2hpY2ggZGVwZW5kcyBvbiAnYicg
ZWFybGllciB0aGFuIG9yIGVxdWFsIHRvIDIuMC4KICMgY3JlYXRlICdiJyBpbiB2ZXJzaW9ucyAx
LjAsIDIuMCwgYW5kIDMuMC4KZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMjlfcmVsZGVwc19lcS5w
eSBiL3Rlc3RzL2NvcmUvMjlfcmVsZGVwc19lcS5weQppbmRleCAzMzYxYmZiLi43NzU3ZTBhIDEw
MDc1NQotLS0gYS90ZXN0cy9jb3JlLzI5X3JlbGRlcHNfZXEucHkKKysrIGIvdGVzdHMvY29yZS8y
OV9yZWxkZXBzX2VxLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBDcmVhdGUgJ2En
IHdoaWNoIGRlcGVuZHMgb24gJ2IoMi4wKScuCiAjIGNyZWF0ZSAnYicgaW4gdmVyc2lvbnMgMS4w
LCAyLjAsIGFuZCAzLjAuCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzMwX3JlbGRlcHNfZ3RlcS5w
eSBiL3Rlc3RzL2NvcmUvMzBfcmVsZGVwc19ndGVxLnB5CmluZGV4IGFjYzdlMmEuLmViZWI1NWYg
MTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMzBfcmVsZGVwc19ndGVxLnB5CisrKyBiL3Rlc3RzL2Nv
cmUvMzBfcmVsZGVwc19ndGVxLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5
dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBDcmVh
dGUgJ2EnIHdoaWNoIGRlcGVuZHMgb24gJ2InIGxhdGVyIHRoYW4gb3IgZXF1YWwgdG8gMi4wLgog
IyBjcmVhdGUgJ2InIGluIHZlcnNpb25zIDEuMCwgMi4wLCBhbmQgMy4wLgpkaWZmIC0tZ2l0IGEv
dGVzdHMvY29yZS8zMV9yZWxkZXBzX2d0LnB5IGIvdGVzdHMvY29yZS8zMV9yZWxkZXBzX2d0LnB5
CmluZGV4IDBmN2VhNGYuLmQ0NjNkZDcgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMzFfcmVsZGVw
c19ndC5weQorKysgYi90ZXN0cy9jb3JlLzMxX3JlbGRlcHNfZ3QucHkKQEAgLTEsNCArMSw1IEBA
CiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjCiAjIENyZWF0ZSAnYScgd2hpY2ggZGVwZW5kcyBvbiAnYicgbGF0ZXIgdGhh
biAyLjAuCiAjIGNyZWF0ZSAnYicgaW4gdmVyc2lvbnMgMS4wLCAyLjAsIGFuZCAzLjAuCmRpZmYg
LS1naXQgYS90ZXN0cy9jb3JlLzMyX2ludGVyY2VwdF9kaXNhYmxlLnB5IGIvdGVzdHMvY29yZS8z
Ml9pbnRlcmNlcHRfZGlzYWJsZS5weQppbmRleCA5ZTQ5ZmM0Li5hNzc2Mzc0IDEwMDc1NQotLS0g
YS90ZXN0cy9jb3JlLzMyX2ludGVyY2VwdF9kaXNhYmxlLnB5CisrKyBiL3Rlc3RzL2NvcmUvMzJf
aW50ZXJjZXB0X2Rpc2FibGUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0
aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFZlcmlm
aWVzIGludGVyY2VwdCBzY3JpcHRzIGNhbiBiZSBkaXNhYmxlZCBieSBhbiBvcGtnIGNvbmYgdG9r
ZW4uCiAjCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzMzX2luc3RhbGxfZXhhY3RfdmVyc2lvbi5w
eSBiL3Rlc3RzL2NvcmUvMzNfaW5zdGFsbF9leGFjdF92ZXJzaW9uLnB5CmluZGV4IDYyYWNiNWUu
LjAxZjFjZTIgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMzNfaW5zdGFsbF9leGFjdF92ZXJzaW9u
LnB5CisrKyBiL3Rlc3RzL2NvcmUvMzNfaW5zdGFsbF9leGFjdF92ZXJzaW9uLnB5CkBAIC0xLDQg
KzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogIwogIyBUZXN0IG9wa2cgd2hlbiBzcGVjaWZ5aW5nIHRoZSB2ZXJz
aW9uIHRvIGluc3RhbGwgdmlhOgogIyAgICAgICBvcGtnIGluc3RhbGwgPHBrZ19uYW1lPj08cGtn
X3ZlcnNpb24+CmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzM0X2xpc3RfdXBncmFkYWJsZS5weSBi
L3Rlc3RzL2NvcmUvMzRfbGlzdF91cGdyYWRhYmxlLnB5CmluZGV4IGQ2MjI4NzEuLjk1M2ZiZTYg
MTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMzRfbGlzdF91cGdyYWRhYmxlLnB5CisrKyBiL3Rlc3Rz
L2NvcmUvMzRfbGlzdF91cGdyYWRhYmxlLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4v
ZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwog
IyBUZXN0IG9wa2cgbGlzdC11cGdyYWRhYmxlIGJlaGF2aW9yLgogCmRpZmYgLS1naXQgYS90ZXN0
cy9jb3JlLzM1X2Rvd25sb2FkX29ubHkucHkgYi90ZXN0cy9jb3JlLzM1X2Rvd25sb2FkX29ubHku
cHkKaW5kZXggZGFiNTM0Ny4uYWU0MTAwNCAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8zNV9kb3du
bG9hZF9vbmx5LnB5CisrKyBiL3Rlc3RzL2NvcmUvMzVfZG93bmxvYWRfb25seS5weQpAQCAtMSw0
ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKICMKICMgVGVzdCB0aGF0IC0tZG93bmxvYWQtb25seSBmbGFnIGRv
ZXNuJ3QgY2hhbmdlIHRoZSBzdGF0ZQogIyBvZiB0aGUgc3lzdGVtIGR1cmluZyBpbnN0YWxsL3Jl
bW92ZS91cGdyYWRlIG9wZXJhdGlvbnMKZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvMzZfaW5zdGFs
bF92aXJ0dWFsLnB5IGIvdGVzdHMvY29yZS8zNl9pbnN0YWxsX3ZpcnR1YWwucHkKaW5kZXggMzQz
OWVkNy4uZWRhNzUzYyAxMDA2NDQKLS0tIGEvdGVzdHMvY29yZS8zNl9pbnN0YWxsX3ZpcnR1YWwu
cHkKKysrIGIvdGVzdHMvY29yZS8zNl9pbnN0YWxsX3ZpcnR1YWwucHkKQEAgLTEsNCArMSw1IEBA
CiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjCiAjIFRlc3Qgb3BrZyB3aGVuIHNwZWNpZnlpbmcgYSB2aXJ0dWFsIHBhY2th
Z2UgdG8gaW5zdGFsbDoKICMgICAgICAgb3BrZyBpbnN0YWxsIDx2aXJ0dWFsX3BrZ19uYW1lPgpk
aWZmIC0tZ2l0IGEvdGVzdHMvY29yZS8zN19nbG9icy5weSBiL3Rlc3RzL2NvcmUvMzdfZ2xvYnMu
cHkKaW5kZXggNTc2ODY5Yy4uODIyYjlkMSAxMDA3NTUKLS0tIGEvdGVzdHMvY29yZS8zN19nbG9i
cy5weQorKysgYi90ZXN0cy9jb3JlLzM3X2dsb2JzLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vz
ci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQogIwogIyBSZXBvcnRlcjogYWxlamFuZHJvLmRlbGNhc3RpbGxvQG5pLmNvbQogIwpkaWZmIC0t
Z2l0IGEvdGVzdHMvY29yZS8zOF9pbnN0YWxsX2NvbnN0cmFpbmVkX3ZlcnNpb24ucHkgYi90ZXN0
cy9jb3JlLzM4X2luc3RhbGxfY29uc3RyYWluZWRfdmVyc2lvbi5weQppbmRleCA4YTg4NWViLi5h
NjA2OWE3IDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzM4X2luc3RhbGxfY29uc3RyYWluZWRfdmVy
c2lvbi5weQorKysgYi90ZXN0cy9jb3JlLzM4X2luc3RhbGxfY29uc3RyYWluZWRfdmVyc2lvbi5w
eQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgVGVzdCBvcGtnIHdoZW4gc3BlY2lmeWlu
ZyBhIGNvbnN0cmFpbmVkL2Z1enp5IHZlcnNpb24gdG8gaW5zdGFsbCB2aWE6CiAjICAgICAgIG9w
a2cgaW5zdGFsbCBwa2dfbmFtZTw9cGtnX3ZlcnNpb24KZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUv
MzlfZGlzdHVwZ3JhZGUucHkgYi90ZXN0cy9jb3JlLzM5X2Rpc3R1cGdyYWRlLnB5CmluZGV4IGJl
ZTIwY2IuLjM2NDE3ZDYgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvMzlfZGlzdHVwZ3JhZGUucHkK
KysrIGIvdGVzdHMvY29yZS8zOV9kaXN0dXBncmFkZS5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91
c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKICMKICMgSW5zdGFsbCBwYWNrYWdlICdhJyB3aXRoIGEgRGVwZW5kcyBvbiAnYicuIE1ha2Ug
YXZhaWxhYmxlIGEgbmV3IHZlcnNpb24gb2YKICMgJ2EnIHRoYXQgQ29uZmxpY3RzIHdpdGggJ2In
LiBEaXN0LXVwZ3JhZGUgYW5kIG1ha2Ugc3VyZSAnYScgaXMgdXBncmFkZWQgdG8KZGlmZiAtLWdp
dCBhL3Rlc3RzL2NvcmUvNDBfYXJjaC5weSBiL3Rlc3RzL2NvcmUvNDBfYXJjaC5weQppbmRleCBi
MTY1OGRkLi45OTRkZDdiIDEwMDc1NQotLS0gYS90ZXN0cy9jb3JlLzQwX2FyY2gucHkKKysrIGIv
dGVzdHMvY29yZS80MF9hcmNoLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5
dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBDcmVh
dGUgcGFja2FnZSAneCgxLjApJyB3aXRoIGFyY2hpdGVjdHVyZSBhIGFuZCAneCgxLjApJyB3aXRo
IGFyY2hpdGVjdHVyZSBiLgogIyBJbnN0YWxsICd4JyB3aXRoIC0tYWRkLWFyY2ggYToyIGFuZCAt
LWFkZC1hcmNoIGI6My4KZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmUvNDJfaW5mb19kZXNjcmlwdGlv
bi5weSBiL3Rlc3RzL2NvcmUvNDJfaW5mb19kZXNjcmlwdGlvbi5weQppbmRleCA5ZjQxYTcxLi5i
OTE3NmRlIDEwMDY0NAotLS0gYS90ZXN0cy9jb3JlLzQyX2luZm9fZGVzY3JpcHRpb24ucHkKKysr
IGIvdGVzdHMvY29yZS80Ml9pbmZvX2Rlc2NyaXB0aW9uLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEg
L3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogIwogIyBDcmVhdGUgcGFja2FnZSAnYSgxLjApJyB3aXRoIHNob3J0IGRlc2NyaXB0aW9u
IG9ubHkuCiAjIENyZWF0ZSBwYWNrYWdlICdiKDEuMCknIHdpdGggYSBjb21wbGV0ZSBtdWx0aWxp
bmUgZGVzY3JpcHRpb24uCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlLzQzX2FkZF9pZ25vcmVfcmVj
b21tZW5kcy5weSBiL3Rlc3RzL2NvcmUvNDNfYWRkX2lnbm9yZV9yZWNvbW1lbmRzLnB5CmluZGV4
IDdkYTAwOTYuLmEwMmZkMDMgMTAwNzU1Ci0tLSBhL3Rlc3RzL2NvcmUvNDNfYWRkX2lnbm9yZV9y
ZWNvbW1lbmRzLnB5CisrKyBiL3Rlc3RzL2NvcmUvNDNfYWRkX2lnbm9yZV9yZWNvbW1lbmRzLnB5
CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBDcmVhdGUgcGFja2FnZSAnYScgKDEuMCkg
d2hpY2ggUmVjb21tZW5kcyAnYycuCiAjIEluc3RhbGwgJ2EnIHdpdGggLS1hZGQtaWdub3JlLXJl
Y29tbWVuZHMgJ2MnLgpkaWZmIC0tZ2l0IGEvdGVzdHMvbWlzYy9maWxlaGFzaC5weSBiL3Rlc3Rz
L21pc2MvZmlsZWhhc2gucHkKaW5kZXggNmJkZmI5MS4uM2VhMzAyZiAxMDA3NTUKLS0tIGEvdGVz
dHMvbWlzYy9maWxlaGFzaC5weQorKysgYi90ZXN0cy9taXNjL2ZpbGVoYXNoLnB5CkBAIC0xLDQg
KzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogCiBpbXBvcnQgb3MKIGltcG9ydCBvcGssIGNmZywgb3BrZ2NsCmRp
ZmYgLS1naXQgYS90ZXN0cy9taXNjL3VwZGF0ZV9sb3Nlc19hdXRvaW5zdGFsbGVkX2ZsYWcucHkg
Yi90ZXN0cy9taXNjL3VwZGF0ZV9sb3Nlc19hdXRvaW5zdGFsbGVkX2ZsYWcucHkKaW5kZXggM2Ex
ZmU3ZS4uZTYyMWJjOSAxMDA3NTUKLS0tIGEvdGVzdHMvbWlzYy91cGRhdGVfbG9zZXNfYXV0b2lu
c3RhbGxlZF9mbGFnLnB5CisrKyBiL3Rlc3RzL21pc2MvdXBkYXRlX2xvc2VzX2F1dG9pbnN0YWxs
ZWRfZmxhZy5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIAogaW1wb3J0IG9zCiBpbXBvcnQg
b3BrLCBjZmcsIG9wa2djbApkaWZmIC0tZ2l0IGEvdGVzdHMvbWlzYy92ZXJzaW9uX2NvbXBhcmlz
b25zLnB5IGIvdGVzdHMvbWlzYy92ZXJzaW9uX2NvbXBhcmlzb25zLnB5CmluZGV4IDUwZDE2YTcu
LjMxNDUyZDMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21pc2MvdmVyc2lvbl9jb21wYXJpc29ucy5weQor
KysgYi90ZXN0cy9taXNjL3ZlcnNpb25fY29tcGFyaXNvbnMucHkKQEAgLTEsNCArMSw1IEBACiAj
IS91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKIAogaW1wb3J0IG9zCiBpbXBvcnQgb3BrLCBjZmcsIG9wa2djbApkaWZmIC0tZ2l0IGEv
dGVzdHMvb3BrLnB5IGIvdGVzdHMvb3BrLnB5CmluZGV4IGM4MThmMWMuLjJkYjEzZWIgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL29way5weQorKysgYi90ZXN0cy9vcGsucHkKQEAgLTEsMyArMSw0IEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGltcG9ydCB0YXJmaWxlLCBv
cywgc3lzLCBzdGF0CiBpbXBvcnQgY2ZnCiBpbXBvcnQgZXJybm8KZGlmZiAtLWdpdCBhL3Rlc3Rz
L29wa2djbC5weSBiL3Rlc3RzL29wa2djbC5weQppbmRleCAzZGYyYTMyLi40MDMxODljIDEwMDc1
NQotLS0gYS90ZXN0cy9vcGtnY2wucHkKKysrIGIvdGVzdHMvb3BrZ2NsLnB5CkBAIC0xLDQgKzEs
NSBAQAogIyEvdXNyL2Jpbi9weXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKIAogaW1wb3J0IG9zLCBzdWJwcm9jZXNzCiBpbXBvcnQgY2ZnCmRpZmYgLS1naXQg
YS90ZXN0cy9yZWdyZXNzL2lzc3VlMTAzLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEwMy5weQpp
bmRleCAzYjVkNGY1Li40OGRiODk0IDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTAz
LnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMDMucHkKQEAgLTEsNCArMSw1IEBACiAjISAv
dXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAjCiAjIFJlcG9ydGVyOiBQYXVsIEJhcmtlcgogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVn
cmVzcy9pc3N1ZTEwMzU4LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEwMzU4LnB5CmluZGV4IDkw
NWU4OTIuLjQzMjVlZDMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMDM1OC5weQor
KysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTAzNTgucHkKQEAgLTEsNCArMSw1IEBACiAjIS91c3Iv
YmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
IAogaW1wb3J0IG9zCiBpbXBvcnQgb3BrLCBjZmcsIG9wa2djbApkaWZmIC0tZ2l0IGEvdGVzdHMv
cmVncmVzcy9pc3N1ZTEwMzU4Yi5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMDM1OGIucHkKaW5k
ZXggNzIzNjdiMC4uNzBmZjA0NCAxMDA2NDQKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTEwMzU4
Yi5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTAzNThiLnB5CkBAIC0xLDQgKzEsNSBAQAog
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5CiAKIGltcG9ydCBvcwogaW1wb3J0IG9waywgY2ZnLCBvcGtnY2wKZGlmZiAtLWdpdCBh
L3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMDc3Ny5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMDc3Ny5w
eQppbmRleCA0NTIzZmFiLi45OTdmZDRmIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3Vl
MTA3NzcucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEwNzc3LnB5CkBAIC0xLDQgKzEsNSBA
QAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogIwogIyBSZXBvcnRlcjogbWFya3VzLmxlaHRvbmVuQGxpbnV4LmludGVsLmNv
bQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTEwNzgxLnB5IGIvdGVzdHMvcmVn
cmVzcy9pc3N1ZTEwNzgxLnB5CmluZGV4IDI3YTI0NTMuLjUxNTMyYTIgMTAwNzU1Ci0tLSBhL3Rl
c3RzL3JlZ3Jlc3MvaXNzdWUxMDc4MS5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTA3ODEu
cHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBtYXJrdXMubGVodG9u
ZW5AbGludXguaW50ZWwuY29tCiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTEw
MzMucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTEwMzMucHkKaW5kZXggMmU2YzJlMC4uOGVjMmYy
OSAxMDA2NDQKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTExMDMzLnB5CisrKyBiL3Rlc3RzL3Jl
Z3Jlc3MvaXNzdWUxMTAzMy5weQpAQCAtMSw0ICsxLDUgQEAKICMhL3Vzci9iaW4vZW52IHB5dGhv
bjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogCiBpbXBvcnQgb3MK
IGltcG9ydCBvcGssIGNmZywgb3BrZ2NsCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3Vl
MTEwMzNiLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTExMDMzYi5weQppbmRleCBmMmFlOWY3Li4y
MTdiNTg0IDEwMDY0NAotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTEwMzNiLnB5CisrKyBiL3Rl
c3RzL3JlZ3Jlc3MvaXNzdWUxMTAzM2IucHkKQEAgLTEsNCArMSw1IEBACiAjIS91c3IvYmluL2Vu
diBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIAogaW1w
b3J0IG9zCiBpbXBvcnQgb3BrLCBjZmcsIG9wa2djbApkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVz
cy9pc3N1ZTExODI2LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTExODI2LnB5CmluZGV4IDI1M2E5
NTMuLjAzMzBhYzkgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMTgyNi5weQorKysg
Yi90ZXN0cy9yZWdyZXNzL2lzc3VlMTE4MjYucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jp
bi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAj
CiAjIFJlcG9ydGVyOiBEYW1pbmUgR290ZnJvaSA8Z290ZnJvaS5kYW1pZW5AZ21haWwuY29tPgog
IwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTEyMS5weSBiL3Rlc3RzL3JlZ3Jlc3Mv
aXNzdWUxMjEucHkKaW5kZXggYjhjMGZmYy4uYWY0YTQ3ZiAxMDA3NTUKLS0tIGEvdGVzdHMvcmVn
cmVzcy9pc3N1ZTEyMS5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTIxLnB5CkBAIC0xLDQg
KzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBvcnRlZCBieSBLaXJHZU5lLCBGZWIgNiwgMjAxNAog
IyBUZXN0IGNhc2UgbW9kaWZpZWQgYnkgUGF1bCBCYXJrZXIKZGlmZiAtLWdpdCBhL3Rlc3RzL3Jl
Z3Jlc3MvaXNzdWUxMjQucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTI0LnB5CmluZGV4IDM4NTY5
MGIuLjRjNzliNTAgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMjQucHkKKysrIGIv
dGVzdHMvcmVncmVzcy9pc3N1ZTEyNC5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2Vu
diBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMg
SXNzdWUgMTI0LCByZXBvcnRlZCBieSBtdXVzY2xhdXMKICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3Jl
Z3Jlc3MvaXNzdWUxMjRhLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEyNGEucHkKaW5kZXggNmNi
MDFiOS4uODdlYzExYyAxMDA3NTUKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTEyNGEucHkKKysr
IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEyNGEucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jp
bi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAj
CiAjIElzc3VlIDEyNCwgcmVwb3J0ZWQgYnkgbXV1c2NsYXVzCiAjCmRpZmYgLS1naXQgYS90ZXN0
cy9yZWdyZXNzL2lzc3VlMTI3LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTEyNy5weQppbmRleCBj
ZDcxNjFhLi5hZGMyNWUxIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTI3LnB5Cisr
KyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxMjcucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jp
bi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAj
CiAjIElzc3VlIDEyNyByZXBvcnRlZCBieSBtdXVzY2xhdXMKICMKZGlmZiAtLWdpdCBhL3Rlc3Rz
L3JlZ3Jlc3MvaXNzdWUxNTIucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMTUyLnB5CmluZGV4IGU2
YjM4ODMuLjAyNWNkZWYgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNTIucHkKKysr
IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTE1Mi5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmlu
L2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMK
ICMgSXNzdWUgMTUyCiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTU0LnB5IGIv
dGVzdHMvcmVncmVzcy9pc3N1ZTE1NC5weQppbmRleCAzYWJlZjFlLi5lNjc5MDg5IDEwMDc1NQot
LS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTU0LnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUx
NTQucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBtaWNoYWwucC4u
LkBnbWFpbC5jb20KICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNTYucHkgYi90
ZXN0cy9yZWdyZXNzL2lzc3VlMTU2LnB5CmluZGV4IGE1MDAxMmMuLjIxN2ZiZWEgMTAwNzU1Ci0t
LSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNTYucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTE1
Ni5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgUmVwb3J0ZXI6IGFsZXhleXRlY2hA
Z21haWwuY29tCiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTYyLnB5IGIvdGVz
dHMvcmVncmVzcy9pc3N1ZTE2Mi5weQppbmRleCBjMjY5Zjk5Li5lOGQwZGVjIDEwMDc1NQotLS0g
YS90ZXN0cy9yZWdyZXNzL2lzc3VlMTYyLnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjIu
cHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBFcmljIFl1CiAjCmRp
ZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTYzLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1
ZTE2My5weQppbmRleCAxMjA3NDg3Li45MDZjN2MxIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNz
L2lzc3VlMTYzLnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjMucHkKQEAgLTEsNCArMSw1
IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBFcmljIFl1CiAjCmRpZmYgLS1naXQgYS90ZXN0
cy9yZWdyZXNzL2lzc3VlMTY1LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTE2NS5weQppbmRleCA4
OWRmMzIxLi43MDg1N2NmIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTY1LnB5Cisr
KyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jp
bi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAj
CiAjIFJlcG9ydGVyOiBFcmljIFl1CiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3Vl
MTY1YS5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjVhLnB5CmluZGV4IDRhZDUyMTAuLmI0ZWM2
YmQgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjVhLnB5CisrKyBiL3Rlc3RzL3Jl
Z3Jlc3MvaXNzdWUxNjVhLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhv
bjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBvcnRl
cjogRXJpYyBZdQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTE2NWIucHkgYi90
ZXN0cy9yZWdyZXNzL2lzc3VlMTY1Yi5weQppbmRleCAyNzJiZTg0Li44YTdmOGY3IDEwMDc1NQot
LS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlMTY1Yi5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3Vl
MTY1Yi5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgUmVwb3J0ZXI6IEVyaWMgWXUK
ICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUxNjcucHkgYi90ZXN0cy9yZWdyZXNz
L2lzc3VlMTY3LnB5CmluZGV4IGNiZDgyNzYuLjA1ODE1OWEgMTAwNzU1Ci0tLSBhL3Rlc3RzL3Jl
Z3Jlc3MvaXNzdWUxNjcucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTE2Ny5weQpAQCAtMSw0
ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKICMKICMgUmVwb3J0ZWQgYnkgYWxlamFuZHJvLmRlbGNhc3RpbGxv
QG5pLmNvbQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTI2LnB5IGIvdGVzdHMv
cmVncmVzcy9pc3N1ZTI2LnB5CmluZGV4IGYyMDU4NzcuLjAwN2ZlODYgMTAwNzU1Ci0tLSBhL3Rl
c3RzL3JlZ3Jlc3MvaXNzdWUyNi5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMjYucHkKQEAg
LTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBHcmFoYW0gR293ZXIKICMKZGlm
ZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUzMS5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWUz
MS5weQppbmRleCBmMGRhMzQwLi5mODhlNTE1IDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lz
c3VlMzEucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTMxLnB5CkBAIC0xLDQgKzEsNSBAQAog
IyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQogIwogIyBSZXBvcnRlcjogR3JhaGFtIEdvd2VyCiAjCmRpZmYgLS1naXQgYS90ZXN0
cy9yZWdyZXNzL2lzc3VlMzIucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlMzIucHkKaW5kZXggMDg2
M2U3ZC4uZjVlZDU3YyAxMDA3NTUKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTMyLnB5CisrKyBi
L3Rlc3RzL3JlZ3Jlc3MvaXNzdWUzMi5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2Vu
diBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMg
UmVwb3J0ZXI6IHBpeGRhbWl4QGdtYWlsLmNvbQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVz
cy9pc3N1ZTQ1LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTQ1LnB5CmluZGV4IDE5ZTY2ODcuLjIw
NjcxMGUgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU0NS5weQorKysgYi90ZXN0cy9y
ZWdyZXNzL2lzc3VlNDUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9u
MworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVy
OiBwaXhkYW1peAogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTQ2LnB5IGIvdGVz
dHMvcmVncmVzcy9pc3N1ZTQ2LnB5CmluZGV4IGE5ZGIzYTIuLjkyMTk0YzkgMTAwNzU1Ci0tLSBh
L3Rlc3RzL3JlZ3Jlc3MvaXNzdWU0Ni5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlNDYucHkK
QEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBHcmFoYW0gR293ZXIKICMK
ZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU1MC5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNz
dWU1MC5weQppbmRleCAyNjlkNDFmLi42ZjgyM2ZjIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNz
L2lzc3VlNTAucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTUwLnB5CkBAIC0xLDQgKzEsNSBA
QAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogIwogIyBSZXBvcnRlcjogR3JhaGFtIEdvd2VyCiAjCmRpZmYgLS1naXQgYS90
ZXN0cy9yZWdyZXNzL2lzc3VlNTEucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlNTEucHkKaW5kZXgg
MzlmOTY0MS4uNDMzOTIxMCAxMDA3NTUKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTUxLnB5Cisr
KyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU1MS5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmlu
L2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMK
ICMgUmVwb3J0ZXI6IEdyYWhhbSBHb3dlcgogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9p
c3N1ZTU1LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTU1LnB5CmluZGV4IDI4N2Q0ZTguLjIwZmM1
MTMgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU1NS5weQorKysgYi90ZXN0cy9yZWdy
ZXNzL2lzc3VlNTUucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMwor
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydCBhbmQg
Zml4IGZyb20gInBhcmFkb3gua2FobiIgaW4gYSBnb29nbGUgY29kZSBjb21tZW50IHRvIHI1NDMu
CiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlNTgucHkgYi90ZXN0cy9yZWdyZXNz
L2lzc3VlNTgucHkKaW5kZXggZjQzYzc2NC4uMzQ4NzI0YyAxMDA3NTUKLS0tIGEvdGVzdHMvcmVn
cmVzcy9pc3N1ZTU4LnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU1OC5weQpAQCAtMSw0ICsx
LDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKICMKICMgUmVwb3J0ZXI6IEdyYWhhbSBHb3dlcgogIwpkaWZmIC0tZ2l0
IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTcyLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTcyLnB5Cmlu
ZGV4IDJmMjRkZWMuLjZmN2U5YzQgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU3Mi5w
eQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlNzIucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNy
L2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjCiAjIFJlcG9ydGVyOiBHcmFoYW0gR293ZXIKICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jl
c3MvaXNzdWU3OS5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU3OS5weQppbmRleCAyMDM0NmZlLi5i
Yzc4YWE2IDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlNzkucHkKKysrIGIvdGVzdHMv
cmVncmVzcy9pc3N1ZTc5LnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhv
bjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBvcnRl
cjogcGl4ZGFtaXgKICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4MzUxLnB5IGIv
dGVzdHMvcmVncmVzcy9pc3N1ZTgzNTEucHkKaW5kZXggOTY1YWMzYi4uOTI3YzJlYyAxMDA3NTUK
LS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTgzNTEucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1
ZTgzNTEucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBtdXVzY2xh
dXMKICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4NS5weSBiL3Rlc3RzL3JlZ3Jl
c3MvaXNzdWU4NS5weQppbmRleCAzNjU1MGRlLi45N2IzMTRmIDEwMDc1NQotLS0gYS90ZXN0cy9y
ZWdyZXNzL2lzc3VlODUucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTg1LnB5CkBAIC0xLDQg
KzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBvcnRlcjogR3JhaGFtIEdvd2VyCiAjCmRpZmYgLS1n
aXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlODYwMS5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4NjAx
LnB5CmluZGV4IDUxOTAyYzkuLmZhMTQ4NDAgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNz
dWU4NjAxLnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4NjAxLnB5CkBAIC0xLDQgKzEsNSBA
QAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogIwogIyBSZXBvcnRlcjogamF0aW52YXRzYWx5YUBnbWFpbC5jb20KICMKZGlm
ZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4OS5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4
OS5weQppbmRleCBlZGEzMWIwLi5lYTRlODlhIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lz
c3VlODkucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTg5LnB5CkBAIC0xLDQgKzEsNSBAQAog
IyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQogIwogIyBSZXBvcnRlZCBieSBjY29zcGVsLCBKYW4gMjcsIDIwMTIKICMKZGlmZiAt
LWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4OTEyLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTg5
MTIucHkKaW5kZXggMGRkNGQxYS4uM2U3NDVkYyAxMDA2NDQKLS0tIGEvdGVzdHMvcmVncmVzcy9p
c3N1ZTg5MTIucHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTg5MTIucHkKQEAgLTEsNCArMSw1
IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBhbGVqYW5kcm8uZGVsY2FzdGlsbG9AbmkuY29t
CiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lzc3VlODkxMy5weSBiL3Rlc3RzL3JlZ3Jl
c3MvaXNzdWU4OTEzLnB5CmluZGV4IDIyYmNiMTQuLjdmNGQzZGMgMTAwNzU1Ci0tLSBhL3Rlc3Rz
L3JlZ3Jlc3MvaXNzdWU4OTEzLnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU4OTEzLnB5CkBA
IC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBvcnRlcjogYWxlamFuZHJvLmRlbGNhc3Rp
bGxvQG5pLmNvbQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTkwNTkucHkgYi90
ZXN0cy9yZWdyZXNzL2lzc3VlOTA1OS5weQppbmRleCA1NzY1ODUzLi5iOGZmNDU5IDEwMDc1NQot
LS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlOTA1OS5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3Vl
OTA1OS5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3IvYmluL2VudiBweXRob24zCisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICMKICMgUmVwb3J0ZXI6IHNjb3Quc2Fs
bW9uQG5pLmNvbQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMvcmVncmVzcy9pc3N1ZTkxLnB5IGIvdGVz
dHMvcmVncmVzcy9pc3N1ZTkxLnB5CmluZGV4IGNiY2JiYzguLmQzOTM5ZDUgMTAwNzU1Ci0tLSBh
L3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5MS5weQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlOTEucHkK
QEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVkIGJ5IGJvcmlzLmJpc2Nob2Zm
LCBBdWcgMTcsIDIwMTIKICMKZGlmZiAtLWdpdCBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5MjE4LnB5
IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTkyMTgucHkKaW5kZXggZmE5YzIzMS4uNWIwMjA5NCAxMDA3
NTUKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTkyMTgucHkKKysrIGIvdGVzdHMvcmVncmVzcy9p
c3N1ZTkyMTgucHkKQEAgLTEsNCArMSw1IEBACiAjISAvdXNyL2Jpbi9lbnYgcHl0aG9uMworIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjCiAjIFJlcG9ydGVyOiBhbGVq
YW5kcm8uZGVsY2FzdGlsbG9AbmkuY29tCiAjCmRpZmYgLS1naXQgYS90ZXN0cy9yZWdyZXNzL2lz
c3VlOTUzMy5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5NTMzLnB5CmluZGV4IGE4NGZiMzIuLjll
ODBlOWYgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5NTMzLnB5CisrKyBiL3Rlc3Rz
L3JlZ3Jlc3MvaXNzdWU5NTMzLnB5CkBAIC0xLDQgKzEsNSBAQAogIyEgL3Vzci9iaW4vZW52IHB5
dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogIwogIyBSZXBv
cnRlZDogYWxlamFuZHJvLmRlbGNhc3RpbGxvQG5pLmNvbQogIwpkaWZmIC0tZ2l0IGEvdGVzdHMv
cmVncmVzcy9pc3N1ZTk4MDIucHkgYi90ZXN0cy9yZWdyZXNzL2lzc3VlOTgwMi5weQppbmRleCAy
NDg0YmVlLi5iZjkzNDkyIDEwMDc1NQotLS0gYS90ZXN0cy9yZWdyZXNzL2lzc3VlOTgwMi5weQor
KysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlOTgwMi5weQpAQCAtMSw0ICsxLDUgQEAKICMhIC91c3Iv
YmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
IAogaW1wb3J0IG9zCiBpbXBvcnQgb3BrLCBjZmcsIG9wa2djbApkaWZmIC0tZ2l0IGEvdGVzdHMv
cmVncmVzcy9pc3N1ZTk4MDJiLnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTk4MDJiLnB5CmluZGV4
IDU0Y2RjNDYuLjk3MTk3MTUgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5ODAyYi5w
eQorKysgYi90ZXN0cy9yZWdyZXNzL2lzc3VlOTgwMmIucHkKQEAgLTEsNCArMSw1IEBACiAjISAv
dXNyL2Jpbi9lbnYgcHl0aG9uMworIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAKIGltcG9ydCBvcwogaW1wb3J0IG9waywgY2ZnLCBvcGtnY2wKZGlmZiAtLWdpdCBhL3Rl
c3RzL3JlZ3Jlc3MvaXNzdWU5OTM5LnB5IGIvdGVzdHMvcmVncmVzcy9pc3N1ZTk5MzkucHkKaW5k
ZXggOGNhNGM2NS4uNWQwNzBkMSAxMDA3NTUKLS0tIGEvdGVzdHMvcmVncmVzcy9pc3N1ZTk5Mzku
cHkKKysrIGIvdGVzdHMvcmVncmVzcy9pc3N1ZTk5MzkucHkKQEAgLTEsNCArMSw1IEBACiAjIS91
c3IvYmluL2VudiBweXRob24zCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKICMKICMgUmVwb3J0ZXI6IG92aWRpdS52YW5jZWFAbmkuY29tCiAjCmRpZmYgLS1naXQgYS90
ZXN0cy9yZWdyZXNzL2lzc3VlOTk4Ny5weSBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5OTg3LnB5Cmlu
ZGV4IDg3NzgyM2EuLmU1ZTA1ZDUgMTAwNzU1Ci0tLSBhL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5OTg3
LnB5CisrKyBiL3Rlc3RzL3JlZ3Jlc3MvaXNzdWU5OTg3LnB5CkBAIC0xLDQgKzEsNSBAQAogIyEg
L3Vzci9iaW4vZW52IHB5dGhvbjMKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogIwogIyBSZXBvcnRlcjogcGF1bC5zcGFuZ2xlckBuaS5jb20KICMKZGlmZiAtLWdpdCBh
L3V0aWxzL29wa2ctY2hlY2stY29uZmlnIGIvdXRpbHMvb3BrZy1jaGVjay1jb25maWcKaW5kZXgg
OGRjOTY3Ni4uYTdlZjY5NiAxMDA3NTUKLS0tIGEvdXRpbHMvb3BrZy1jaGVjay1jb25maWcKKysr
IGIvdXRpbHMvb3BrZy1jaGVjay1jb25maWcKQEAgLTQsNiArNCw4IEBACiAjCiAjICAgQ29weXJp
Z2h0IChDKSAyMDE0IFBhdWwgQmFya2VyCiAjCisjICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKyMKICMgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdAogIyAgIHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRo
ZQogIyAgIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0
IHlvdXIgb3B0aW9uKSBhbnkKZGlmZiAtLWdpdCBhL3V0aWxzL29wa2cta2V5IGIvdXRpbHMvb3Br
Zy1rZXkKaW5kZXggMDVkZWQ0NC4uZTM5NWE1OSAxMDA3NTUKLS0tIGEvdXRpbHMvb3BrZy1rZXkK
KysrIGIvdXRpbHMvb3BrZy1rZXkKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vc2gKKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogCiAjIEJhc2VkIG9uIGFwdC1rZXkgZnJv
bSBhcHQtMC42LjI1CiAjIExpY2Vuc2VkIHVuZGVyIEdQTCBWZXJzaW9uIDIKLS0gCjIuNy40Cgo=

--00000000000068c93b0595b76601--
