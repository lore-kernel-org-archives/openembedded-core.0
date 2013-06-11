Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id ADD6D6A9C7;
	Tue, 11 Jun 2013 17:09:03 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id w20so7717427lbh.38
	for <multiple recipients>; Tue, 11 Jun 2013 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=2kP6sy+FIL+DfhuIVXce9SURRecx6YxhfBVmAAzYpfQ=;
	b=NCqpPefQpTHLx7c5yaxUYzUQR/2HW3OmZGpZF+gRoSG6nHS800FpW8wKCsJR9v1SgM
	EOfB3gEQZG/Tz7OadwZiKGuFiUlvdRVslhVw5X6NmqPEQ6m5AYMNlAd2SYKPFrjkMjFg
	k9yYM5tyk6aOdWlSN+pNC9K4/nALS0hr/t9bXpP1g2BBNK2wTWCcEKnUvKLt6qxqmnQP
	4hcI2uq5cuxJnl8IZMymRCEGzKigwsl3ydwHOHEH6VIFYDY4IJl3nRVvu3mg7PAEKjYa
	BS7vSD+t+6nlY3zH81VWqlwh7hHgnGmZJjaJBrQY6B2036R+CAu0KkTcG+Op912rq/7/
	igyA==
X-Received: by 10.112.236.33 with SMTP id ur1mr9254646lbc.13.1370970543539;
	Tue, 11 Jun 2013 10:09:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.4.66 with HTTP; Tue, 11 Jun 2013 10:08:42 -0700 (PDT)
In-Reply-To: <20130611170704.GK3233@jama>
References: <20130611144932.08F545048D@opal> <20130611170704.GK3233@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 11 Jun 2013 10:08:42 -0700
X-Google-Sender-Auth: _1wnswUVJJ7SPB34VmKvrOc4QSY
Message-ID: <CABcZANnZ4eqaSiO-aw5Gawtkbd-qiJiLN4bYq8RVGTZvxtPBOw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Christopher Larson : packagegroup-base-vfat: include dosfsprogs
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
X-List-Received-Date: Tue, 11 Jun 2013 17:09:04 -0000
Content-Type: multipart/alternative; boundary=001a11c31ca43ece9004dee3f4aa

--001a11c31ca43ece9004dee3f4aa
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 10:07 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Jun 11, 2013 at 02:49:32PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 4ec66dc5f38913056942e1288c0b01a00ea0551f
> > URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4ec66dc5f38913056942e1288c0b01a00ea0551f
> >
> > Author: Christopher Larson <chris_larson@mentor.com>
> > Date:   Mon Jun 10 13:47:06 2013 -0700
> >
> > packagegroup-base-vfat: include dosfsprogs
> >
> > The ext2 group includes e2fsprogs, so this is consistent and should be
> > appropriate, I think.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Isn't it called dosfstools?
>
> $ find openembedded-core/ -name dos\*
> openembedded-core/meta/recipes-devtools/dosfstools
> openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
> openembedded-core/meta/recipes-devtools/dosfstools/dosfstools
>
> openembedded-core/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
>
> and no RPROVIDES in dosfstools recipe ->
>
> ERROR: Nothing RPROVIDES 'dosfsprogs' (but
> /OE/shr-core/openembedded-core/meta/recipes-core/packagegroups/
> packagegroup-base.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'dosfsprogs' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['dosfsprogs']
> NOTE: Runtime target 'packagegroup-base-extended' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-base-extended', 'dosfsprogs']
>

I swear I tested these series, I must have tested one and sent another or
something. Ignore this for the time being. Sorry for the hassle.

--001a11c31ca43ece9004dee3f4aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 11, 2013 at 10:07 AM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":kz" style=3D"overflow:hidden">On=
 Tue, Jun 11, 2013 at 02:49:32PM +0000, <a href=3D"mailto:git@git.openembed=
ded.org">git@git.openembedded.org</a> wrote:<br>


&gt; Module: openembedded-core.git<br>
&gt; Branch: master<br>
&gt; Commit: 4ec66dc5f38913056942e1288c0b01a00ea0551f<br>
&gt; URL: =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/?p=3Dopenembe=
dded-core.git&amp;a=3Dcommit;h=3D4ec66dc5f38913056942e1288c0b01a00ea0551f" =
target=3D"_blank">http://git.openembedded.org/?p=3Dopenembedded-core.git&am=
p;a=3Dcommit;h=3D4ec66dc5f38913056942e1288c0b01a00ea0551f</a><br>


&gt;<br>
&gt; Author: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.c=
om">chris_larson@mentor.com</a>&gt;<br>
&gt; Date: =C2=A0 Mon Jun 10 13:47:06 2013 -0700<br>
&gt;<br>
&gt; packagegroup-base-vfat: include dosfsprogs<br>
&gt;<br>
&gt; The ext2 group includes e2fsprogs, so this is consistent and should be=
<br>
&gt; appropriate, I think.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
Isn&#39;t it called dosfstools?<br>
<br>
$ find openembedded-core/ -name dos\*<br>
openembedded-core/meta/recipes-devtools/dosfstools<br>
openembedded-core/meta/recipes-devtools/dosfstools/<a href=3D"http://dosfst=
ools_2.11.bb" target=3D"_blank">dosfstools_2.11.bb</a><br>
openembedded-core/meta/recipes-devtools/dosfstools/dosfstools<br>
openembedded-core/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-ms=
dos_fs-types.patch<br>
<br>
and no RPROVIDES in dosfstools recipe -&gt;<br>
<br>
ERROR: Nothing RPROVIDES &#39;dosfsprogs&#39; (but /OE/shr-core/openembedde=
d-core/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-base.=
bb" target=3D"_blank">packagegroup-base.bb</a> RDEPENDS on or otherwise req=
uires it)<br>


NOTE: Runtime target &#39;dosfsprogs&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;dosfsprogs&#39;]<br>
NOTE: Runtime target &#39;packagegroup-base-extended&#39; is unbuildable, r=
emoving...<br>
Missing or unbuildable dependency chain was: [&#39;packagegroup-base-extend=
ed&#39;, &#39;dosfsprogs&#39;]</div></blockquote></div><br>I swear I tested=
 these series, I must have tested one and sent another or something. Ignore=
 this for the time being. Sorry for the hassle.</div>

</div>

--001a11c31ca43ece9004dee3f4aa--
