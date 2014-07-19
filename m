Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 24A2F7059E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 18:38:43 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so3706343lab.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=iDM7skHo3ShcQ9YidQYLFDpAksC/lDI7AMZ6DoB44IY=;
	b=MKf1xQdjQ/s2RTg5QfJil5NgCESDNx4triWRtRJEZ/H66TyfcT4qUwOQl8tdqZ03qw
	AJ2Z/XgMyygortRi/Zl/aUKyX13H6vbUYS2g65c9dkHCuNSHeboL8nE+/HVTIfGUaBRw
	XZup/advh1xCApNiN1vSDZr1S2tZi2cF2Tn761W8q5afL24lLC5NpKzQJ63UVqdQMxnd
	m/DxiOaps8Z6XVYb1iX2ctyxmQS0aN/i7shhZgEH0lyiTHWb5VDojog5XuX0B3KxLQy/
	CzqyTewqx2OZsvopYXVFxK0DzKRbob3qpRY5AXXZjWytKZ0pHIXrjRCVzKB+D9lFu1Vd
	1LjQ==
X-Received: by 10.112.198.161 with SMTP id jd1mr12909040lbc.56.1405795124083; 
	Sat, 19 Jul 2014 11:38:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Sat, 19 Jul 2014 11:38:23 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407181726070.25832@localhost>
References: <alpine.LFD.2.11.1407181455510.13980@localhost>
	<CAJTo0Lbefya8wCNvhfVXXytN+HH0nuMbsEO7XPfTk5kVzQ0XxA@mail.gmail.com>
	<alpine.LFD.2.11.1407181726070.25832@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 19 Jul 2014 11:38:23 -0700
X-Google-Sender-Auth: Kr2Y3AnxmxWTj3MUWa_FYrXtadE
Message-ID: <CABcZAN=K0zQ6JENDWWC4PCn9yNaPx0GD=xZS+sjhcrPx9KuapQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: patches can be either ".patch" or ".diff" files, yes?
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
X-List-Received-Date: Sat, 19 Jul 2014 18:38:44 -0000
Content-Type: multipart/alternative; boundary=001a11c34b88ff84fd04fe902e3b

--001a11c34b88ff84fd04fe902e3b
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 18, 2014 at 2:26 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Fri, 18 Jul 2014, Burton, Ross wrote:
>
> > On 18 July 2014 19:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >  not sure where i saw this recently (i'll track it down), but some OE
> > > or yocto doc claimed that patch files *must* be suffixed with
> > > ".patch". i'm pretty sure it can be either .patch or .diff, correct?
> > > as in, it's perfectly valid to do this in a .bbappend file:
>

Also remember that as Ross says ('*automatically* applied as a patch'),
it's not a must, you can opt-in to patch application with ;apply=yes if the
filename doesn't match the expected extensions.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c34b88ff84fd04fe902e3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 18, 2014 at 2:26 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Fri, 18 Jul 2014, Burton,=
 Ross wrote:<br>
<br>
&gt; On 18 July 2014 19:58, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@c=
rashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; &gt; =C2=A0not sure where i saw this recently (i&#39;ll track it down)=
, but some OE<br>
&gt; &gt; or yocto doc claimed that patch files *must* be suffixed with<br>
&gt; &gt; &quot;.patch&quot;. i&#39;m pretty sure it can be either .patch o=
r .diff, correct?<br>
&gt; &gt; as in, it&#39;s perfectly valid to do this in a .bbappend file:</=
div></blockquote></div><br></div><div class=3D"gmail_extra">Also remember t=
hat as Ross says (&#39;*automatically* applied as a patch&#39;), it&#39;s n=
ot a must, you can opt-in to patch application with ;apply=3Dyes if the fil=
ename doesn&#39;t match the expected extensions.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c34b88ff84fd04fe902e3b--
