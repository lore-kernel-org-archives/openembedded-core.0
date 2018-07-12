Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 16D6260291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 17:17:00 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id w76-v6so10722208ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oILW2EJTK12JMUCloeWblpQLVFH8shSNBO+ZLQ9VfbE=;
	b=AjI25QwwBDcSSLYiR/Z8aNdYPQT7uE8tbrQTZaM54+VRKaIMGnMUKKMapwppD3KkVg
	J71Z0Erp5c2GcnKyDfVsocs9Bmjjvj0XXBuaErFqcC4JZf5yRKvBnNxsan8dr98pBBQ3
	gPVPMUp6xQS3H+fpIiTS1MQpvkVukegBLAN/fx3FAXYzQAwAV1dVzs45NmvzMxsUAhKA
	s5hDqCHeInAoazi94n0RlJQW5I5hBaZe5fddw6fFQlh+aNa+WmaA/REIpDLVJ0l71hNC
	Gqd4OiE03z6/HTkAEoA/jDR9kAH4sR/RinmGmWywGwGQRlvF4IfFHZhf+WsJgaeGZKm9
	5EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oILW2EJTK12JMUCloeWblpQLVFH8shSNBO+ZLQ9VfbE=;
	b=WkrR89ogA/y8PEBvL6eCu1WWqe+QNEM9dmRK3upzctc9oS02yyPR0bGTDmGdIvQ4qd
	fvKkGZDKdFZPsVWi7CmggSdYA1Lya6vVsnlTAsJigKCuCV7E/TSAqOVtN3LKFmmNJjHe
	Eq3urqmXLnSVcY9W0S6FvlMwiasFnt+RQsEVn+arOBS/2ZMKpDLJBYkClmYwa36NQ4aJ
	AhJjqj+5M7gbOSrMQALEtfWx9PjIZ0tmy+3qWMgBh3Xo6CQs+dFRFjbLC7kznjLMU/RS
	BPUm/voTjqeh5x5V2zGvHc8p3qnLtVOw22fqzPeZP7o31oKzu8xStJx5BCYUvG3oDdl3
	Adfg==
X-Gm-Message-State: AOUpUlFJ8tCA0JOfvfTzRmXEO/Flz0mOZ9A5QlZmhXitfTUVNhjQwA8l
	62EWg2fGJwicq4QDt0s3nlZP1C11lqa/CsnKPqo=
X-Google-Smtp-Source: AAOMgpfVJYrU+9k5icrAfDeKPYfkIqmUtivgaFMkXdZmQKJjceSj6OOCZKj7SL77JdJ6qsBW04QC/nPmZw59L5+wF/o=
X-Received: by 2002:a81:f208:: with SMTP id i8-v6mr1534615ywm.72.1531415821822;
	Thu, 12 Jul 2018 10:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
	<CAJTo0LYeM6ob7-d+FxNeFgLszvhry0=9Tcb90a-1vU+PXjFppQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYeM6ob7-d+FxNeFgLszvhry0=9Tcb90a-1vU+PXjFppQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 12 Jul 2018 13:16:50 -0400
Message-ID: <CAFeBWL7d02=O3SKdUYAPOmeJi1hgLyq56EVBO6hDTYmx0kjamw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using IMAGE_INSTALL_remove and PNBLACKLIST
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
X-List-Received-Date: Thu, 12 Jul 2018 17:17:01 -0000
Content-Type: multipart/alternative; boundary="0000000000001032780570d08851"

--0000000000001032780570d08851
Content-Type: text/plain; charset="UTF-8"

Right, but I am simply and quickly trying to replicate TI provided SDK
image.
So RDEPENDS does not get handled by IMAGE_INSTALL_remove / PNBLACKLIST
combo, correct?

Adam

On Thu, Jul 12, 2018 at 12:20 PM Burton, Ross <ross.burton@intel.com> wrote:

> Write your own custom image which doesn't include
> packagegroup-arago-tisdk-addons?
>
> Ross
>
> On 12 July 2018 at 16:19, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > I am attempting to exclude a package from my system image with this in my
> > local.conf:
> >
> > IMAGE_INSTALL_remove += "tiovx-app-host-examples"
> > IMAGE_INSTALL_remove += "tiovx-lib-host"
> > IMAGE_INSTALL_remove += "tiovx-app-host"
> >
> > PNBLACKLIST[tiovx-lib-host] = "Build break"
> > PNBLACKLIST[tiovx-app-host] = "Build break"
> > PNBLACKLIST[tiovx-app-host-examples] = "Build break"
> >
> > My build is still failing unfortunately:
> >
> > ERROR: Nothing RPROVIDES 'tiovx-app-host-examples' (but
> >
> /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/
> packagegroup-arago-tisdk-addons.bb
> > RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'tiovx-app-host-examples' is unbuildable,
> removing...
> > Missing or unbuildable dependency chain was: ['tiovx-app-host-examples']
> > ERROR: Required build target 'packagegroup-arago-tisdk-addons' has no
> > buildable providers.
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-arago-tisdk-addons', 'tiovx-app-host-examples']
> >
> > Is there something else I have to do to eliminate a package that is
> runtime
> > dependent? Thoughts?
> >
> > Adam
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--0000000000001032780570d08851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Right, but I am simply and quickly trying to replicate TI =
provided SDK image.<div>So RDEPENDS does not get handled by IMAGE_INSTALL_r=
emove / PNBLACKLIST combo, correct?</div><div><br></div><div>Adam</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 12, 2018 at 1=
2:20 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burt=
on@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Write y=
our own custom image which doesn&#39;t include<br>
packagegroup-arago-tisdk-addons?<br>
<br>
Ross<br>
<br>
On 12 July 2018 at 16:19, Adam Lee &lt;<a href=3D"mailto:adam.yh.lee@gmail.=
com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt; I am attempting to exclude a package from my system image with this in=
 my<br>
&gt; local.conf:<br>
&gt;<br>
&gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-app-host-examples&quot;<br>
&gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-lib-host&quot;<br>
&gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-app-host&quot;<br>
&gt;<br>
&gt; PNBLACKLIST[tiovx-lib-host] =3D &quot;Build break&quot;<br>
&gt; PNBLACKLIST[tiovx-app-host] =3D &quot;Build break&quot;<br>
&gt; PNBLACKLIST[tiovx-app-host-examples] =3D &quot;Build break&quot;<br>
&gt;<br>
&gt; My build is still failing unfortunately:<br>
&gt;<br>
&gt; ERROR: Nothing RPROVIDES &#39;tiovx-app-host-examples&#39; (but<br>
&gt; /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/r=
ecipes-core/packagegroups/<a href=3D"http://packagegroup-arago-tisdk-addons=
.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-arago-tisdk-addons.b=
b</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; NOTE: Runtime target &#39;tiovx-app-host-examples&#39; is unbuildable,=
 removing...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;tiovx-app-host-exam=
ples&#39;]<br>
&gt; ERROR: Required build target &#39;packagegroup-arago-tisdk-addons&#39;=
 has no<br>
&gt; buildable providers.<br>
&gt; Missing or unbuildable dependency chain was:<br>
&gt; [&#39;packagegroup-arago-tisdk-addons&#39;, &#39;tiovx-app-host-exampl=
es&#39;]<br>
&gt;<br>
&gt; Is there something else I have to do to eliminate a package that is ru=
ntime<br>
&gt; dependent? Thoughts?<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div>

--0000000000001032780570d08851--
