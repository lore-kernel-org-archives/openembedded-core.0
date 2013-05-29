Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F099621A1;
	Wed, 29 May 2013 17:00:32 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n9so12052413oag.0
	for <multiple recipients>; Wed, 29 May 2013 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hbgemA0zdsxsFQMxCCS9WLoySRdkXBupNWebth4BwbU=;
	b=BqK3oEwz94R2IbywRzYqYyeUimTXGu0PUq4w0Zo7P3c8aZECMtDCjxMqocicvegsXK
	2ei656qVwX01FPFoIO5nGGpvNHu5cYPPPeViKHpubA3l1EaAAcstSxI/Fx9M+cNqWFhG
	SUnvP3W+OZNK52+QIcU0N38yEowSKh2YE3r4McNgposYr51B3XMYn2ZtD2B4WGAQD91G
	QQ3pQjwZLS7/moZtEhMpa4KlR3Z5LYamLppWbKKTp/72rsekjpUZTZhNgsN/SqbSd8Tk
	MAfmKOrwDOWKc/xVDoNOOy8WcJDoBifOfYa9XGmsw45Si8EfH+9ioUJrMQAmcr/3ncZ1
	lMDA==
MIME-Version: 1.0
X-Received: by 10.182.97.194 with SMTP id ec2mr2249043obb.7.1369846833043;
	Wed, 29 May 2013 10:00:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 29 May 2013 10:00:32 -0700 (PDT)
In-Reply-To: <1369838840.14887.220.camel@ted>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
	<20130529143740.GL3192@jama> <1369838840.14887.220.camel@ted>
Date: Wed, 29 May 2013 14:00:32 -0300
X-Google-Sender-Auth: fswWQUFjCOV6Effdw7CQr_GANiE
Message-ID: <CAP9ODKp1Tu3HXXz-4qOBQa1oY_r338keLFvvP6rZRf+aTyHtxQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 17:00:33 -0000
Content-Type: multipart/alternative; boundary=047d7b2e4962e1ad1504ddde51fb

--047d7b2e4962e1ad1504ddde51fb
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 11:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-05-29 at 16:37 +0200, Martin Jansa wrote:
> > On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:
> > > Background:
> > >
> > > At the recent TSC meeting we were discussing ways of removing the PRINC
> > > in favor of the PR server, which should now be standard.  The first
> step
> > > in this process is coming up with a simple patch that declared PRINC as
> > > deprecated.  If this type of patch is successful, the block of code
> could
> > > be replaced with a bb.error eventually.
> > >
> > > It is not expected that this patch will go in by itself, but instead
> > > should be coordinated with changes to the recipes in common layers such
> > > as openembedded-core, meta-openembedded/meta-* and other community
> layers.
> >
> > This doesn't say what's the process of getting all PR increments
> > applied.
> >
> > Should we send list of recipes and required PR increments per layer (and
> > someone will sum these increments and create actual PR bump from it). Or
> > will we take turns and send actual PR bump patches per layer and someone
> > will define order of layers to go in (so that we prevent many conflicts
> > while merging)?
>
> This is something we need to figure out. The realistic process is
> probably do this layer by layer. If we can batch some up together that
> would obviously be better...
>

If this is the case, to ensure we have the PR in sync we should have it
PRINC as a bb.error; this will cause some pain but will avoid PRServer
picking the layer PRINC and losing it in next build. Or does PRServer
handle this gracefully?

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e4962e1ad1504ddde51fb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 29, 2013 at 11:47 AM, Richard Purdie <span dir=3D"ltr">=
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-05-29 at 16:3=
7 +0200, Martin Jansa wrote:<br>
&gt; On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:<br>
&gt; &gt; Background:<br>
&gt; &gt;<br>
&gt; &gt; At the recent TSC meeting we were discussing ways of removing the=
 PRINC<br>
&gt; &gt; in favor of the PR server, which should now be standard. =A0The f=
irst step<br>
&gt; &gt; in this process is coming up with a simple patch that declared PR=
INC as<br>
&gt; &gt; deprecated. =A0If this type of patch is successful, the block of =
code could<br>
&gt; &gt; be replaced with a bb.error eventually.<br>
&gt; &gt;<br>
&gt; &gt; It is not expected that this patch will go in by itself, but inst=
ead<br>
&gt; &gt; should be coordinated with changes to the recipes in common layer=
s such<br>
&gt; &gt; as openembedded-core, meta-openembedded/meta-* and other communit=
y layers.<br>
&gt;<br>
&gt; This doesn&#39;t say what&#39;s the process of getting all PR incremen=
ts<br>
&gt; applied.<br>
&gt;<br>
&gt; Should we send list of recipes and required PR increments per layer (a=
nd<br>
&gt; someone will sum these increments and create actual PR bump from it). =
Or<br>
&gt; will we take turns and send actual PR bump patches per layer and someo=
ne<br>
&gt; will define order of layers to go in (so that we prevent many conflict=
s<br>
&gt; while merging)?<br>
<br>
</div>This is something we need to figure out. The realistic process is<br>
probably do this layer by layer. If we can batch some up together that<br>
would obviously be better...<br></blockquote><div><br></div><div style>If t=
his is the case, to ensure we have the PR in sync we should have it PRINC a=
s a bb.error; this will cause some pain but will avoid PRServer picking the=
 layer PRINC and losing it in next build. Or does PRServer handle this grac=
efully?</div>
<div style><br></div><div style>Regards,</div><div>=A0</div></div>-- <br>Ot=
avio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. =
Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http:/=
/www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossyste=
ms.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b2e4962e1ad1504ddde51fb--
