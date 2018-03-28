Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C9ED46069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 18:57:28 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id b20so4752832iof.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=vN4Bs+GTlyXe+oNeoisJbSPCltu6RoDgpCJ3idDExPY=;
	b=Auo598D++h4nHsF6+qYR+glsE03Qvf8j+axeV7xiUIWlKAz8voo694j6AmVAuh5qJa
	RK8qbmia0gUT4ueSC2c1P3vmPT5Ik5IzGeNWi2o2W8ZtFwjbPjLzxiwu9M/YRedlp78K
	cVLwPKpxgShq9eLORupdbhiQllXogcQPNjpxEhwQ2S+0fNPftdxa89DhIU6UJ4Tn222S
	yDr8PjpQtsmOlhC890dz5+MzZsZ012dAayDWLnUQsZkoOpBo00GcIOj9JqKURa4/8bJC
	+i0eRTdxtuhf24tsuhvdnCWoZuWsoHgDs1Ava/aNG/66ZbeV+vJsPeJWTLXpJ5FUM1U+
	jkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=vN4Bs+GTlyXe+oNeoisJbSPCltu6RoDgpCJ3idDExPY=;
	b=OpjE+A2LHDUqv16lZylNxK0yC/jskFmyC8YGkhNA85tPj2XGpwIoLZj9Y+hRbfmIF/
	cTiIr9OouOHfHVm2WS6dCw0ZzoSNcXqgpMQfPUCMr3p1ajrSL//Dp8jIn9fh7vpYHjEg
	uqCHcDZI2A27NC8xCrsElzifbxH5qVU0BRlR9xJjFOY3e1s2VohLP4sY/5FiG3adKma7
	N8E4Rut9vICYwCwELW4ffSLSDUTKeN9cdIbRym4tQTwvkg6YRKsm6Y7++GBwWMSfp3gZ
	CfFzUHtZM+7dRutHmAIHV8VkyIxah3M6ogEzqNbA6BOIlH6tCg3/PLSLr6GDfiS4DAV/
	tYOg==
X-Gm-Message-State: AElRT7EPzaUKIfuWZ33OLvScq416jN6EPFAXHi4m6ILQJ2KBM6tha08U
	eG6LjtrCriR6TdMK+mbW0Fk=
X-Google-Smtp-Source: AG47ELtYtrO7HxvnBTvbEE5MKEKtuhvxWaqFAhm3lZNA/6YQjqQH1MGExxYbhsFZxxT2Sv8hQHeTgw==
X-Received: by 10.107.3.71 with SMTP id 68mr52463340iod.66.1522263449857;
	Wed, 28 Mar 2018 11:57:29 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y192-v6sm82312itb.0.2018.03.28.11.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Mar 2018 11:57:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1522263448.3242.260.camel@gmail.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 28 Mar 2018 13:57:28 -0500
In-Reply-To: <CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
References: <20180321203301.18296-1-JPEWhacker@gmail.com>
	<CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Mar 2018 18:57:28 -0000
Content-Type: multipart/alternative; boundary="=-cGq5PmAY8GCNz6wKt8Of"

--=-cGq5PmAY8GCNz6wKt8Of
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Scott,
This documentation update is not needed for Rocko, the corresponding
code change is only on master. Sorry if there was some confusion
Thanks,Joshua Watt
On Wed, 2018-03-28 at 10:53 -0700, Scott Rifenbark wrote:
> Joshua, 
> 
> Thanks for the addition.  I have implemented the change.  You can see
> the change at https://www.yoctoproject.org/docs/2.5/ref-manual/ref-ma
> nual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.  I will back-fill into
> the 'rocko' development branch of the manuals.
> 
> Scott
> 
> On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Describes the new wildcard syntax
> > 
> > 
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > 
> > ---
> > 
> >  documentation/ref-manual/ref-variables.xml | 17 +++++++++++++++++
> > 
> >  1 file changed, 17 insertions(+)
> > 
> > 
> > 
> > diff --git a/documentation/ref-manual/ref-variables.xml
> > b/documentation/ref-manual/ref-variables.xml
> > 
> > index 09eb9b9dfc7..58a58b0605e 100644
> > 
> > --- a/documentation/ref-manual/ref-variables.xml
> > 
> > +++ b/documentation/ref-manual/ref-variables.xml
> > 
> > @@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/font-
> > alias_1.0.3.bb:PR = "${INC_PR}.3"
> > 
> >                      <filename>mplayer2</filename>.
> > 
> >                  </para>
> > 
> > 
> > 
> > +                <para>
> > 
> > +                    The special token <filename>"*"</filename> may
> > be used on
> > 
> > +                    the left hand side of the dependency, which
> > will match all
> > 
> > +                    recipes except the one on the right hand side.
> > 
> > +                    For example:
> > 
> > +                    <literallayout class='monospaced'>
> > 
> > +    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
> > 
> > +                    </literallayout>
> > 
> > +                </para>
> > 
> > +
> > 
> > +                <para>
> > 
> > +                    In this example, all recipes except
> > 
> > +                    <filename>quilt-native</filename> will ignore
> > task
> > 
> > +                    signatures from the <filename>quilt-
> > native</filename> recipe
> > 
> > +                    when determining their task signatures.
> > 
> > +                </para>
> > 
> > +
> > 
> >                  <para>
> > 
> >                      Use of this variable is one mechanism to
> > remove dependencies
> > 
> >                      that affect task signatures and thus force
> > rebuilds when a
> > 
> > --
> > 
> > 2.14.3
> > 
> > 
> > 

--=-cGq5PmAY8GCNz6wKt8Of
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Scott,</div><div><br></div><div>This document=
ation update is not needed for Rocko, the corresponding code change is only=
 on master. Sorry if there was some confusion</div><div><br></div><div>Than=
ks,</div><div>Joshua Watt</div><div><br></div><div>On Wed, 2018-03-28 at 10=
:53 -0700, Scott Rifenbark wrote:</div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=
=3D"ltr"><div><div>Joshua, <br><br></div>Thanks for the addition.&nbsp; I h=
ave implemented the change.&nbsp; You can see the change at <a href=3D"http=
s://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SIGGEN_EXC=
LUDE_SAFE_RECIPE_DEPS">https://www.yoctoproject.org/docs/2.5/ref-manual/ref=
-manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS</a>.&nbsp; I will back-fil=
l into the 'rocko' development branch of the manuals.<br><br></div>Scott<br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Ma=
r 21, 2018 at 1:33 PM, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:=
jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex">Describes the new wildcard syntax<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br>
---<br>
&nbsp;documentation/ref-manual/ref-<wbr>variables.xml | 17 ++++++++++++++++=
+<br>
&nbsp;1 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/<wbr>ref-variables.xml b/documentatio=
n/ref-manual/<wbr>ref-variables.xml<br>
index 09eb9b9dfc7..58a58b0605e 100644<br>
--- a/documentation/ref-manual/<wbr>ref-variables.xml<br>
+++ b/documentation/ref-manual/<wbr>ref-variables.xml<br>
@@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/<wbr>font-alias_1.0.3.b=
b:PR =3D "${INC_PR}.3"<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;&lt;filename&gt;mplayer2&lt;/filename&gt;.<br>
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
+&nbsp; &nbsp; SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS +=3D "*-&gt;quilt-nativ=
e"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
/literallayout&gt;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/para&gt;<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;para&gt;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; In t=
his example, all recipes except<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
filename&gt;quilt-native&lt;/<wbr>filename&gt; will ignore task<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sign=
atures from the &lt;filename&gt;quilt-native&lt;/<wbr>filename&gt; recipe<b=
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
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>
</blockquote></body></html>

--=-cGq5PmAY8GCNz6wKt8Of--
