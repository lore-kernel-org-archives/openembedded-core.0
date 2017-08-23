Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 71FE478269
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 02:33:24 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id d124so1406003vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KDukBqkeiQwgInybiQZVrPPNSfv7sVXYomFfo6g/T/I=;
	b=aXtfyPClaiqkp0oxVP6VZCxrCYJrcDQ56rkDR0RoscaGUdJwp8MWw2xtHxE+vWe4gJ
	5OwbJ2dVf4C6PGQSdQL7l/Bhx+/3vCo83J9IEqZqe2FWcBbdOEvVf/QJAlA0orQ1DkX5
	lTWGvvV86IBU/UBA8RRnthoSHOXUbRYgfH35dvFk8kVRneTnbJNqU2qnEbJ7u4Vwmgu3
	AOaeF7vUgPZMhvfcVtWA0lVHRWkt6DyBTLDf883kJuC/PbvwijmGpBWYL1MKeav+uIoS
	9XMLP7ZCVNz+XdrzRZ1oDbpsy6JDLersTeBWcTEnARQDpmAqSH34kDvFxo+2SZIuhdQ0
	1gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KDukBqkeiQwgInybiQZVrPPNSfv7sVXYomFfo6g/T/I=;
	b=LJ4ikl9MWKcuhaefhzsll+/SYymhGEf2ldJn2L3Z2WorErAcvJJQNUavghFO0ukRgc
	sZV7dC9YnyGkWGdOayZZUHjQjHugIBhZb62/Yzxj/KD5j4s2zDAw/U871l6mfbQZ7+1h
	OI4Pg6XUHGOlbufvKav0NbEi3dTpPVRdtzzpm77oREzlJsWYkhfgqu8rifymrMdG4aVl
	6jv7UoqUE5pyUfrb5X6YzDOYGpvQHt1A1Z8New1xmYgwcOw29lxAU1V1xrZn62keczqb
	e6+QZ8Z6rMk8QlKEy4wnDNyRKdUy/00EMgYy2Rq6vF6BgBGOQ5i06PF4rZgigEgrMBBN
	QDzg==
X-Gm-Message-State: AHYfb5jOhFPGmyI0iVQ6a7ekGnIOot5CqfdlT/u4y4SIjIUq+H7PbgZn
	SYsne2QkKh2RzH36d+0MXjtKBkHExA==
X-Received: by 10.31.2.18 with SMTP id 18mr747681vkc.7.1503455605526; Tue, 22
	Aug 2017 19:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.88.220 with HTTP; Tue, 22 Aug 2017 19:33:25 -0700 (PDT)
In-Reply-To: <CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 23 Aug 2017 04:33:25 +0200
Message-ID: <CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Wed, 23 Aug 2017 02:33:25 -0000
Content-Type: multipart/alternative; boundary="001a11466c2e4d959e05576289e1"

--001a11466c2e4d959e05576289e1
Content-Type: text/plain; charset="UTF-8"

Hi, Andre:

Arha, I did not know that when I was submitting the patch, may I know why
it's rejected at that moment? Since even with the alternative fixes, the
developers still could introduce duplicated whitespaces in their BSP layers
if they do not know the rules, since it's quite common in recipes to assign
variables with duplicated whitespcaces.

BTW: i just checked, it's been merged to master already.

//Ming Liu

2017-08-23 4:19 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Aug 21, 2017 at 4:43 AM,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > To give a example:
> > Before the change, in our build console, TUNE_FEATURES looks like:
> > ...
> > TUNE_FEATURES     = "arm armv7a vfp  neon        cortexa8"
> > ...
> >
> > After the change:
> > ...
> > TUNE_FEATURES     = "arm armv7a vfp neon cortexa8"
> > ...
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta/classes/base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index 8c86977..07734ac 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -206,7 +206,7 @@ def buildcfg_vars(d):
> >      for var in statusvars:
> >          value = d.getVar(var)
> >          if value is not None:
> > -            yield '%-17s = "%s"' % (var, value)
> > +            yield '%-17s = "%s"' % (var, " ".join(value.split()))
>
> This fix has been rejected once already:
>
>   http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-November/129358.html
>
> The preferred alternative was to remove all duplicated whitespace in
> the BUILDCFG_VARS variables:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=
> 5610c6397ee098dd998b7417b343494de77179f9
>   http://git.openembedded.org/openembedded-core/commit/?id=
> 971e43270173afb08f21ffac16a4157f7e611b81
>
> >  def buildcfg_neededvars(d):
> >      needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11466c2e4d959e05576289e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Andre:<div><br></div><div>Arha, I did not know that wh=
en I was submitting the patch, may I know why it&#39;s rejected at that mom=
ent? Since even with the=C2=A0<span style=3D"color:rgb(33,33,33);font-famil=
y:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial=
,sans-serif,serif,EmojiFont;font-size:13.3333px">alternative fixes, the dev=
elopers still could introduce duplicated whitespaces in their BSP layers if=
 they do not know the rules, since it&#39;s quite common in recipes to assi=
gn variables with duplicated whitespcaces.</span></div><div><span style=3D"=
color:rgb(33,33,33);font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&qu=
ot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont;font-size:13.3333=
px"><br></span></div><div><span style=3D"color:rgb(33,33,33);font-family:wf=
_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,san=
s-serif,serif,EmojiFont;font-size:13.3333px">BTW: i just checked, it&#39;s =
been merged to master already.</span></div><div><span style=3D"color:rgb(33=
,33,33);font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&=
quot;,Tahoma,Arial,sans-serif,serif,EmojiFont;font-size:13.3333px"><br></sp=
an></div><div><span style=3D"color:rgb(33,33,33);font-family:wf_segoe-ui_no=
rmal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,seri=
f,EmojiFont;font-size:13.3333px">//Ming Liu</span></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">2017-08-23 4:19 GMT+02:00 Andr=
e McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" targ=
et=3D"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, Aug 21, 2017 at 4:=
43 AM,=C2=A0 &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.c=
om</a>&gt; wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; To give a example:<br>
&gt; Before the change, in our build console, TUNE_FEATURES looks like:<br>
&gt; ...<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp=C2=A0 neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa8&quot;<br>
&gt; ...<br>
&gt;<br>
&gt; After the change:<br>
&gt; ...<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp neon cortexa=
8&quot;<br>
&gt; ...<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
&gt; index 8c86977..07734ac 100644<br>
&gt; --- a/meta/classes/base.bbclass<br>
&gt; +++ b/meta/classes/base.bbclass<br>
&gt; @@ -206,7 +206,7 @@ def buildcfg_vars(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for var in statusvars:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D d.getVar(var)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value is not None:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield &#39;%-17s =3D &quot;=
%s&quot;&#39; % (var, value)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield &#39;%-17s =3D &quot;=
%s&quot;&#39; % (var, &quot; &quot;.join(value.split()))<br>
<br>
</div></div>This fix has been rejected once already:<br>
<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core=
/2016-November/129358.html" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-November/129=
358.html</a><br>
<br>
The preferred alternative was to remove all duplicated whitespace in<br>
the BUILDCFG_VARS variables:<br>
<br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3D5610c6397ee098dd998b7417b343494de77179f9" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/<wbr>openembedded-core/commit/?id=3D<wbr=
>5610c6397ee098dd998b7417b34349<wbr>4de77179f9</a><br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3D971e43270173afb08f21ffac16a4157f7e611b81" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/<wbr>openembedded-core/commit/?id=3D<wbr=
>971e43270173afb08f21ffac16a415<wbr>7f7e611b81</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 def buildcfg_neededvars(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 needed_vars =3D oe.data.typed_value(&quot;BUILDCFG=
_<wbr>NEEDEDVARS&quot;, d)<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11466c2e4d959e05576289e1--
