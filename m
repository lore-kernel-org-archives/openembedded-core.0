Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id D6A4960034
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Oct 2015 12:22:45 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so100782670qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Oct 2015 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lzkUB3OFF8kpCHMUu3Tfz1Yj7aqMeHKd81FbWcS5o8s=;
	b=0+5QVr4ABXPfDIwTM8TjlsOsoO8vZbXzvP+zTaMv6cI+zWk13M8JCIErAyqM4j0U++
	7VJz7izaT6Ee4eZzAPgtrxPvD1n6obrc75QP5YqEx17Ouqbkci3wcIGv3cmimVhIy8fX
	nZqGgF9esf/wDgL5B76Uoc7IbCYlLWhc0f+DfbKn3rvOO9rjBShltpiyjJlP5p4GiIgX
	srrdEgHKKT12rJdBIVChqnGPgEa1L+rcthyDscSJBXfmBJ1aSZjg3EWDe/q44wtyeX8H
	IvxVJEMcv7gTpjEJBhB/Psgl5bWdQDqeRPzM9RJL8Ta1U+s85N7Ut+z2IdxMSyuXUqyc
	yAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lzkUB3OFF8kpCHMUu3Tfz1Yj7aqMeHKd81FbWcS5o8s=;
	b=fxFTUM98EklVrQ7YERc49JkQVhXFPGZw+iKA13PDZ9/tuyQ8Rkv5V+vPXrG699LeYG
	u3+4aWHjfJBJIuGGPrA6kVCxhTOv/H/e2x2mEezHuUWHoebUwspEshnNJLypAhCwI7yK
	Rlf9YC0Dy3IdbTM6LEVeCjdTBrxpaSoDnOzMYAlaovdbtnfkLNYQERteNv6hPENmqKqS
	e6stEfEqRg/TAGD6wdUAtJAyn8ZHAhmknRPHw9nppcGhGm6vih7hHem7CwLr7Z7T99YA
	jB1ljSIniS7sbJRFCPfqkOjN8phFzWVqeKy6OC9pNfOu3w0WHit97dkmCkfYdAN3a7eH
	NCwA==
X-Gm-Message-State: ALoCoQm0Jk9iUQF+6GEvszmBaRov25eR4mFSst0+H+rjCb+ae70ucwVxBCul7xPf2EM8axoWPE3M
MIME-Version: 1.0
X-Received: by 10.140.19.13 with SMTP id 13mr35660241qgg.97.1445775765584;
	Sun, 25 Oct 2015 05:22:45 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Sun, 25 Oct 2015 05:22:45 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Sun, 25 Oct 2015 05:22:45 -0700 (PDT)
In-Reply-To: <562BFF92.9020407@gmail.com>
References: <CAP71Wjx+xcW0qG62zxskUGY_BbWCS1Yk9OvJQx+fKooKKKyuvg@mail.gmail.com>
	<65454D5E-98C5-4BA7-828B-05BBD56FB3E5@dominion.thruhere.net>
	<562BFF92.9020407@gmail.com>
Date: Sun, 25 Oct 2015 13:22:45 +0100
Message-ID: <CAP71WjyLE=8uCDQgxbJ1yUqBhS9YWcjLTOzTJgqGVDKhT6xfQg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to handle mesa customization in BSP layers
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
X-List-Received-Date: Sun, 25 Oct 2015 12:22:47 -0000
Content-Type: multipart/alternative; boundary=001a11355f60eede720522ece6ba

--001a11355f60eede720522ece6ba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 25 oct. 2015 00:00, "Trevor Woerner" <twoerner@gmail.com> a =C3=A9crit :
>
> On 10/20/15 05:37, Koen Kooi wrote:
> >> Op 20 okt. 2015, om 11:32 heeft Nicolas Dechesne <
nicolas.dechesne@linaro.org> het volgende geschreven:
> >>
> >>
> >> The issue is that mesa is arch specific, not machine specific. So if
> >> you start mixing machines from the same arch, we are getting
> >> unexpected/wrong rebuilds.
> > In this specific case I think we should enable freedreno for
armv7/armv8 in OE-core, but the problem remains for other recipes like this=
.
>
> Are you suggesting that every armv7 device should have their mesa tuned
> for freedreno and freedreno added to their filesystem? That seems quite
> overly-broad!

No. Only building the driver. It won't be installed unless you add it into
your image.

>
> On the surface[1] it would seem as though the decisions as to how one
> builds mesa and which graphics solution to install is more similar to
> the decision as to which DEFAULTTUNE to use, rather than which
> architecture is involved?
>

DEFAULTTUNE is a generic config that impacts all packages. What Koen
proposed is to change mesa to build more drivers by default.

>
>
>
>
>
>
> [1] which is my way of saying "I don't have the experience of actually
> having done this, unlike you people" ;-)

--001a11355f60eede720522ece6ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Le=C2=A025 oct. 2015 00:00, &quot;Trevor Woerner&quot; &lt;<a href=3D"mailt=
o:twoerner@gmail.com">twoerner@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;<br>
&gt; On 10/20/15 05:37, Koen Kooi wrote:<br>
&gt; &gt;&gt; Op 20 okt. 2015, om 11:32 heeft Nicolas Dechesne &lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt;=
 het volgende geschreven:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The issue is that mesa is arch specific, not machine specific=
. So if<br>
&gt; &gt;&gt; you start mixing machines from the same arch, we are getting<=
br>
&gt; &gt;&gt; unexpected/wrong rebuilds.<br>
&gt; &gt; In this specific case I think we should enable freedreno for armv=
7/armv8 in OE-core, but the problem remains for other recipes like this.<br=
>
&gt;<br>
&gt; Are you suggesting that every armv7 device should have their mesa tune=
d<br>
&gt; for freedreno and freedreno added to their filesystem? That seems quit=
e<br>
&gt; overly-broad!</p>
<p dir=3D"ltr">No. Only building the driver. It won&#39;t be installed unle=
ss you add it into your image.</p>
<p dir=3D"ltr">&gt;<br>
&gt; On the surface[1] it would seem as though the decisions as to how one<=
br>
&gt; builds mesa and which graphics solution to install is more similar to<=
br>
&gt; the decision as to which DEFAULTTUNE to use, rather than which<br>
&gt; architecture is involved?<br>
&gt;</p>
<p dir=3D"ltr">DEFAULTTUNE is a generic config that impacts all packages. W=
hat Koen proposed is to change mesa to build more drivers by default.</p>
<p dir=3D"ltr">&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; [1] which is my way of saying &quot;I don&#39;t have the experience of=
 actually<br>
&gt; having done this, unlike you people&quot; ;-)<br>
</p>

--001a11355f60eede720522ece6ba--
