Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TdMZb-00026l-2v
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 15:55:43 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so9035507lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 06:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=wQASX5TlHT1EFn0NCOLjNHzPpQJ8H+TJkHmOAnTRnOE=;
	b=yc5URlGWMehCu0CCL/GVGv0+fTpvzGTw6kO2+RhhS2luOVrgexk31VS498BBGXmZqX
	Q7bGKxrC2gb7fNl/YTt/g82sFuXAfQdmHlCwfbVycGUI2M+7Yk63a1ABg9BFt0H7e+hd
	66NpA23YydM/3puJ62LXf5yS1zSDm+I2uk/JwiOz+Ci0XcsJkjhWepRO+MiCxBderAGY
	mH6kiMsDIsnzONUE6/v2shX8kQRpw6RWH+qHAVYQ/OzwaeSI74bEV53lqODyu8MpioDt
	Uxtp79ujZwv+g2clG+yQR/L6/HQ4/8HLB9PIl1K3HR26iU/O+umr/MlRCqhGb6iSCtsN
	2ehw==
Received: by 10.152.110.229 with SMTP id id5mr14824144lab.36.1354027289804;
	Tue, 27 Nov 2012 06:41:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.42.162 with HTTP; Tue, 27 Nov 2012 06:41:09 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1211270512010.16369@oneiric>
References: <alpine.DEB.2.02.1211270427320.17683@oneiric>
	<alpine.DEB.2.02.1211270512010.16369@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Nov 2012 07:41:09 -0700
X-Google-Sender-Auth: XN9V63fa6m2RQqaXSxvcluZVSnA
Message-ID: <CABcZANmOCgtCm+QpXDvg-_=L5WK8_2xpOhrgLC7oUAd-Rm7m-g@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: qemuarm: configure of bison fails, claims to need flex [SOLVED?]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 14:55:43 -0000
Content-Type: multipart/alternative; boundary=f46d040713e39ffe3b04cf7b0b4b

--f46d040713e39ffe3b04cf7b0b4b
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 27, 2012 at 3:19 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Tue, 27 Nov 2012, Robert P. J. Day wrote:
>
> >
> >   trying to build absolutely stock qemuarm image with current oe-core,
> > got:
> >
> > ERROR: Task 800
> >
> (virtual:native:/home/rpjday/OE/dist/layers/oe-core/meta/recipes-devtools/bison/
> bison_2.5.1.bb,
> > do_configure) failed with exit code '1'
> >
> > and the log file claimed that bison needed flex.  i'm doing it all
> > over again from scratch just to make sure it wasn't something silly
> > i did, i'll report back if i can reproduce it.
>
>   ah, i see where i did something unapproved -- to test what i could
> add to the ASSUME_PROVIDED list, i added this to my local.conf:
>
> ASSUME_PROVIDED += "m4 quilt"
>
> which caused the configure step for bison to fail, claiming that it
> needed flex.  should i have expected that?  am i misunderstanding the
> rationale for ASSUME_PROVIDED?
>

First of all, if you want to do that, you should be adding m4-native and
quilt-native to ASSUME_PROVIDED, not m4 and quilt, unless your build
machine somehow has cross-compiled stuff already ;)
-- 
Christopher Larson

--f46d040713e39ffe3b04cf7b0b4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Nov 2=
7, 2012 at 3:19 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":2ai">On Tue, 27 Nov 2012, Robert=
 P. J. Day wrote:<br>
<br>
&gt;<br>
&gt; =C2=A0 trying to build absolutely stock qemuarm image with current oe-=
core,<br>
&gt; got:<br>
&gt;<br>
&gt; ERROR: Task 800<br>
&gt; (virtual:native:/home/rpjday/OE/dist/layers/oe-core/meta/recipes-devto=
ols/bison/<a href=3D"http://bison_2.5.1.bb" target=3D"_blank">bison_2.5.1.b=
b</a>,<br>
&gt; do_configure) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; and the log file claimed that bison needed flex. =C2=A0i&#39;m doing i=
t all<br>
&gt; over again from scratch just to make sure it wasn&#39;t something sill=
y<br>
&gt; i did, i&#39;ll report back if i can reproduce it.<br>
<br>
=C2=A0 ah, i see where i did something unapproved -- to test what i could<b=
r>
add to the ASSUME_PROVIDED list, i added this to my local.conf:<br>
<br>
ASSUME_PROVIDED +=3D &quot;m4 quilt&quot;<br>
<br>
which caused the configure step for bison to fail, claiming that it<br>
needed flex. =C2=A0should i have expected that? =C2=A0am i misunderstanding=
 the<br>
rationale for ASSUME_PROVIDED?</div></blockquote></div><br>First of all, if=
 you want to do that, you should be adding m4-native and quilt-native to AS=
SUME_PROVIDED, not m4 and quilt, unless your build machine somehow has cros=
s-compiled stuff already ;)<br>

-- <br>Christopher Larson<br>
</div>

--f46d040713e39ffe3b04cf7b0b4b--
