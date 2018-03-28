Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id E4EF37824D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 20:15:25 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m83so5001634ioi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=BRG4cb1/dAltOFO2cSME2pD2uniRKkl5dTRJCoUt5Ng=;
	b=rEIWByLb/ijT7qI+chADb/Q6PyIZk21+Blyj/J5V01u/yrVuXnfrf86u40zBoo2idj
	NrKb5piuhBFyacbmxpNEMGQ6SHE+E5tnASdof7cFyuKo/VppbePOb/voLK1SgbSA+t1g
	4qUxr+vFVPfYbCuSJgjeaPvW+spKvygrkXMOcWabbrnkQbH2DzVHQTXsiVuV5GU9Cg3e
	aLekb1HLQ9+ZDwka+0AIN0t/Ca1KHLkU3xRLDaqP6H7I4/VGb0Am1JqDmk1FFqLtuhiY
	Xv5QwyTCRyBUVZBTHs83ANfo1Z4SjVUHdttU1IP1vaxkx585PrfngFFIR+rt9xF43a12
	aAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=BRG4cb1/dAltOFO2cSME2pD2uniRKkl5dTRJCoUt5Ng=;
	b=BnRv99HyVt5SgLvfl+474+ZIJIT+3QO7Yh4X2l3lSRRNiEvAVw3a/5JNt88GJdfKQs
	A8kJAAqhm1aVqhviIqKraJeuN0jNcB1Yq/Jwq9/atlMxaG6B/xtdZGx3lC/vLdTSjy0I
	d0CtBbp9faXPVqpn+z1itOb1pYHYpASubTRAy9Pxn4A/HW/kBMuGmGXMjU023VUPujnS
	7XOPI9yKE4DucjAMUThGAQyR/mWpTVWEPae05ieNwuspwM6AdvD003ofYvmbBkKOtGaA
	UMtDyYCIAUPWgVbZrbN7R0gc56cvaA5N0VMubwRwbJo3bVdR9t78G4fIMZXCSFZ6V69b
	kk1w==
X-Gm-Message-State: AElRT7HNWF/wjWgvn85e4wkv8epdnFbP43tiytUlJ0iT8OuR34FgvxnJ
	nzEPCkjZ9RW3zDjZTOZhpms=
X-Google-Smtp-Source: AG47ELtO91LaxvWOINEUIh4tv+zPnxca7SX9otDgH1RhWNjybpOOGiY1NAhRAdPEu1BubAMGa0JVwQ==
X-Received: by 10.107.12.230 with SMTP id 99mr48552454iom.117.1522268126800;
	Wed, 28 Mar 2018 13:15:26 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	d65sm1449388iod.54.2018.03.28.13.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Mar 2018 13:15:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1522268125.3242.262.camel@gmail.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 28 Mar 2018 15:15:25 -0500
In-Reply-To: <CAFNP8Otdnc82RGScNYuP-NsJo5tA5eLEd0AKs=LLtg86HFOfvw@mail.gmail.com>
References: <20180321203301.18296-1-JPEWhacker@gmail.com>
	<CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
	<1522263448.3242.260.camel@gmail.com>
	<CAFNP8Otdnc82RGScNYuP-NsJo5tA5eLEd0AKs=LLtg86HFOfvw@mail.gmail.com>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ref-manual: Update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 28 Mar 2018 20:15:26 -0000
Content-Type: multipart/alternative; boundary="=-1Qvt53LidWwka5/lCgSM"

--=-1Qvt53LidWwka5/lCgSM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I don't believe there are any plans to backport that feature to Rocko,
so I think we probably don't want it in the documentation.
On Wed, 2018-03-28 at 11:59 -0700, Scott Rifenbark wrote:
> oops... will it hurt it to be in Rocko?
> 
> 
> On Wed, Mar 28, 2018 at 11:57 AM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Scott,
> > 
> > This documentation update is not needed for Rocko, the
> > corresponding code change is only on master. Sorry if there was
> > some confusion
> > 
> > Thanks,
> > Joshua Watt
> > 
> > On Wed, 2018-03-28 at 10:53 -0700, Scott Rifenbark wrote:
> > > Joshua, 
> > > 
> > > Thanks for the addition.  I have implemented the change.  You can
> > > see the change at https://www.yoctoproject.org/docs/2.5/ref-manua
> > > l/ref-manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.  I will
> > > back-fill into the 'rocko' development branch of the manuals.
> > > 
> > > Scott
> > > 
> > > On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <jpewhacker@gmail.co
> > > m> wrote:
> > > > Describes the new wildcard syntax
> > > > 
> > > > 
> > > > 
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > 
> > > > ---
> > > > 
> > > >  documentation/ref-manual/ref-variables.xml | 17
> > > > +++++++++++++++++
> > > > 
> > > >  1 file changed, 17 insertions(+)
> > > > 
> > > > 
> > > > 
> > > > diff --git a/documentation/ref-manual/ref-variables.xml
> > > > b/documentation/ref-manual/ref-variables.xml
> > > > 
> > > > index 09eb9b9dfc7..58a58b0605e 100644
> > > > 
> > > > --- a/documentation/ref-manual/ref-variables.xml
> > > > 
> > > > +++ b/documentation/ref-manual/ref-variables.xml
> > > > 
> > > > @@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/font-
> > > > alias_1.0.3.bb:PR = "${INC_PR}.3"
> > > > 
> > > >                      <filename>mplayer2</filename>.
> > > > 
> > > >                  </para>
> > > > 
> > > > 
> > > > 
> > > > +                <para>
> > > > 
> > > > +                    The special token <filename>"*"</filename>
> > > > may be used on
> > > > 
> > > > +                    the left hand side of the dependency,
> > > > which will match all
> > > > 
> > > > +                    recipes except the one on the right hand
> > > > side.
> > > > 
> > > > +                    For example:
> > > > 
> > > > +                    <literallayout class='monospaced'>
> > > > 
> > > > +    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
> > > > 
> > > > +                    </literallayout>
> > > > 
> > > > +                </para>
> > > > 
> > > > +
> > > > 
> > > > +                <para>
> > > > 
> > > > +                    In this example, all recipes except
> > > > 
> > > > +                    <filename>quilt-native</filename> will
> > > > ignore task
> > > > 
> > > > +                    signatures from the <filename>quilt-
> > > > native</filename> recipe
> > > > 
> > > > +                    when determining their task signatures.
> > > > 
> > > > +                </para>
> > > > 
> > > > +
> > > > 
> > > >                  <para>
> > > > 
> > > >                      Use of this variable is one mechanism to
> > > > remove dependencies
> > > > 
> > > >                      that affect task signatures and thus force
> > > > rebuilds when a
> > > > 
> > > > --
> > > > 
> > > > 2.14.3
> > > > 
> > > > 
> > > > 

--=-1Qvt53LidWwka5/lCgSM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>I don't believe there are any plans to backpo=
rt that feature to Rocko, so I think we probably don't want it in the docum=
entation.</div><div><br></div><div>On Wed, 2018-03-28 at 11:59 -0700, Scott=
 Rifenbark wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">oops... =
will it hurt it to be in Rocko?<br><br></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Wed, Mar 28, 2018 at 11:57 AM, Joshua Watt <=
span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_bla=
nk">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><div><div>Scott,</div><div><br></div><div>This documentation update is no=
t needed for Rocko, the corresponding code change is only on master. Sorry =
if there was some confusion</div><div><br></div><div>Thanks,</div><div>Josh=
ua Watt</div><div><div class=3D"h5"><div><br></div><div>On Wed, 2018-03-28 =
at 10:53 -0700, Scott Rifenbark wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div=
 dir=3D"ltr"><div><div>Joshua, <br><br></div>Thanks for the addition.&nbsp;=
 I have implemented the change.&nbsp; You can see the change at <a href=3D"=
https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SIGGEN=
_EXCLUDE_SAFE_RECIPE_DEPS" target=3D"_blank">https://www.yoctoproject.org/<=
wbr>docs/2.5/ref-manual/ref-<wbr>manual.html#var-SIGGEN_<wbr>EXCLUDE_SAFE_R=
ECIPE_DEPS</a>.&nbsp; I will back-fill into the 'rocko' development branch =
of the manuals.<br><br></div>Scott<br></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank=
">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">=
Describes the new wildcard syntax<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
&nbsp;documentation/ref-manual/ref-<wbr>variables.xml | 17 ++++++++++++++++=
+<br>
&nbsp;1 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/ref<wbr>-variables.xml b/documentatio=
n/ref-manual/ref<wbr>-variables.xml<br>
index 09eb9b9dfc7..58a58b0605e 100644<br>
--- a/documentation/ref-manual/ref<wbr>-variables.xml<br>
+++ b/documentation/ref-manual/ref<wbr>-variables.xml<br>
@@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/fon<wbr>t-alias_1.0.3.b=
b:PR =3D "${INC_PR}.3"<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;&lt;filename&gt;mplayer2&lt;/filename&gt;<wbr>.<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/para&gt;=
<br>
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;para&gt;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; The =
special token &lt;filename&gt;"*"&lt;/filename&gt; may be used on<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; the =
left hand side of the dependency, which will match all<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reci=
pes except the one on the right hand side.<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; For =
example:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
literallayout class=3D'monospaced'&gt;<br>
+&nbsp; &nbsp; SIGGEN_EXCLUDE_SAFE_RECIPE_DEP<wbr>S +=3D "*-&gt;quilt-nativ=
e"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
/literallayout&gt;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/para&gt;<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;para&gt;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; In t=
his example, all recipes except<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
filename&gt;quilt-native&lt;/filena<wbr>me&gt; will ignore task<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sign=
atures from the &lt;filename&gt;quilt-native&lt;/filena<wbr>me&gt; recipe<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; when=
 determining their task signatures.<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/para&gt;<br>
+<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;para&gt;<=
br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;Use of this variable is one mechanism to remove dependencies<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;that affect task signatures and thus force rebuilds when a<br>
<span class=3D"m_4517762190543744689HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>
</blockquote></div></div></div></blockquote></div><br></div>
</blockquote></body></html>

--=-1Qvt53LidWwka5/lCgSM--
