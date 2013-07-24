Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id DAAFC6065F;
	Wed, 24 Jul 2013 18:27:09 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z5so748734lbh.7
	for <multiple recipients>; Wed, 24 Jul 2013 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cwLhyCJZ8NjjZQQ2h/073izA5zr8fCKrlfNOw0XLG/8=;
	b=TNkiD+Gfj/lH9ImT32+EfPcb0md5dLA34F5Vp+6PU7yzLnAXeQavbjQubJRxP6dfzg
	nviePCbd9X0moURIinlxHetvTJY0tkJZqaQrU9Zld4fkmeNET9tg1ySnSpUr6BNli0an
	4wE1DDqeoz8ERrqEr9r7Q8JVPb/LRdSfzwwbywXxljWClvmaSf8Z3bwlRQk23pO2e7dH
	+Z8wYXSTZHxvyeQJUsZDBxWUCs4nS5t/pwogNHEGp2b1nCEYm1W0UNdb0Rsm6q4oyHPL
	pV5e8sVP9+vjtrZeRqOgTQAkih85qiBwC+w1JczzEiJgUI/2X7c/JRdR5yFEQP1jSdwA
	1Tew==
X-Received: by 10.152.44.197 with SMTP id g5mr17341692lam.0.1374690429703;
	Wed, 24 Jul 2013 11:27:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 11:26:49 -0700 (PDT)
In-Reply-To: <20130724165022.GA17913@jama>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
	<20130724165022.GA17913@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 11:26:49 -0700
X-Google-Sender-Auth: cn5bqJxiaF_F7c0UlaOWaFFlvQ8
Message-ID: <CABcZAN=2BvqECx5pLXdrt-fwpwifUsv9FA5_v4ssz3teLiEu7A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: test-dependencies.sh results from big world build
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
X-List-Received-Date: Wed, 24 Jul 2013 18:27:11 -0000
Content-Type: multipart/alternative; boundary=089e0158cae8bd1c3a04e2460e4e

--089e0158cae8bd1c3a04e2460e4e
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 9:50 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> My biggest build with 20+ layers included finally finished today (after
> many days because there was hw issue on server where it was running, so
> it was slower then it should be).
>
> The results are a bit messy because:
> 1) It had only some fixes from my last "autodetected dependencies"
>    patchsets for oe-core and meta-oe
> 2) It was started when oe-core/master had broken boost, so many packages
>    failed because of boost
> 3) It was started when oe-core/master had issues with qt-mobility (not
> sure if
>    all were fixed already)
> 4) It wasn't using latest version of test-dependencies script
> 5) It was using complete buildhistory repo which had many stalled
>    packages like task-* and couple of architectures.
>
> But at least it will allow me to restrict recipes to rebuild from 1900 to
> only 256 which were failing in this build.
>
> It was tested only for qemuarm.
>
> Complete logs are here:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/
>
> Interesting parts
> 11 recipes failed in world build:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.world
>
> 101 recipes failed in minimal build (8 caused by boost):
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.min
>
> 216 packages (160 recipes) doesn't have deterministic dependencies
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.dependencies
>
> Next results should be more interesting, because many issues are already
> fixed by change I've sent today to oe-core and oe-devel ML, but not all,
> because they were detected in build without x11 in DISTRO_FEATURES and
> without some layers (like meta-browser meta-efl meta-gnome meta-gpe
> meta-initramfs meta-webserver meta-xfce).
>

I just wanted to say, this is some impressive work, nicely done. I'm amazed
at how many recipes still don't have deterministic dependencies, even after
all these years :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158cae8bd1c3a04e2460e4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jul 24, 2013 at 9:50 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":bi" style=3D"overflow:hidden">My=
 biggest build with 20+ layers included finally finished today (after<br>
many days because there was hw issue on server where it was running, so<br>
it was slower then it should be).<br>
<br>
The results are a bit messy because:<br>
1) It had only some fixes from my last &quot;autodetected dependencies&quot=
;<br>
=C2=A0 =C2=A0patchsets for oe-core and meta-oe<br>
2) It was started when oe-core/master had broken boost, so many packages<br=
>
=C2=A0 =C2=A0failed because of boost<br>
3) It was started when oe-core/master had issues with qt-mobility (not sure=
 if<br>
=C2=A0 =C2=A0all were fixed already)<br>
4) It wasn&#39;t using latest version of test-dependencies script<br>
5) It was using complete buildhistory repo which had many stalled<br>
=C2=A0 =C2=A0packages like task-* and couple of architectures.<br>
<br>
But at least it will allow me to restrict recipes to rebuild from 1900 to<b=
r>
only 256 which were failing in this build.<br>
<br>
It was tested only for qemuarm.<br>
<br>
Complete logs are here:<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/te=
st-dependencies-2013-07-24/" target=3D"_blank">http://logs.nslu2-linux.org/=
buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/</a><br>
<br>
Interesting parts<br>
11 recipes failed in world build:<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/te=
st-dependencies-2013-07-24/failed.world" target=3D"_blank">http://logs.nslu=
2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/=
failed.world</a><br>


<br>
101 recipes failed in minimal build (8 caused by boost):<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/te=
st-dependencies-2013-07-24/failed.min" target=3D"_blank">http://logs.nslu2-=
linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/fa=
iled.min</a><br>


<br>
216 packages (160 recipes) doesn&#39;t have deterministic dependencies<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/te=
st-dependencies-2013-07-24/failed.dependencies" target=3D"_blank">http://lo=
gs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013=
-07-24/failed.dependencies</a><br>


<br>
Next results should be more interesting, because many issues are already<br=
>
fixed by change I&#39;ve sent today to oe-core and oe-devel ML, but not all=
,<br>
because they were detected in build without x11 in DISTRO_FEATURES and<br>
without some layers (like meta-browser meta-efl meta-gnome meta-gpe<br>
meta-initramfs meta-webserver meta-xfce).</div></blockquote></div><br>I jus=
t wanted to say, this is some impressive work, nicely done. I&#39;m amazed =
at how many recipes still don&#39;t have deterministic dependencies, even a=
fter all these years :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0158cae8bd1c3a04e2460e4e--
