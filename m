Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id EFDBF78224
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 07:10:04 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g71so7899714ioe.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DIYhkuk3Av2Q4wh1u5+FANhxpOI3Fq5CiQMmgzU9Rsc=;
	b=WeXI5PtIoJHDXG6ti1mhXYbWB2eaOdHUBYim4IBF3NJlqFwzYk3LM0UPR4K97X3Gyx
	ejMD4P7IN6jNpOGVWahh32HvhFvWjOXzwrD9F5iE+7fyHe/O6pPSCtLu9Y7aCdLdYuow
	h+YI5erBHY0zUGv4+pm7cjEs7LsTGbSIP17xMoPWgsipDLn4xxcu+wJv3yLDOK71T7co
	eYf/LdU1h6jheD9IodG9DQ7oVlV1bw457tNB25ACXTyNPDgIsrVtVxSKW87rH8h7ltUg
	LcggzoKZwE3vQi+mTrKb25pHD6vAggWGYyS5/J9DQE41zWowtf+RaGG8gjVK2lRCldYG
	/gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DIYhkuk3Av2Q4wh1u5+FANhxpOI3Fq5CiQMmgzU9Rsc=;
	b=BLPBJ3sw6GI9W+hEBHsSVl0GBr2t4VRFPTx18aH/GPdT4i+XX8TRSyxX7xAerEhUzw
	V86FiuXnIa58iBiaduxSYKHFvFsPzVfdtntvT+p0SrQ3pBzYOBVaRHi53NKJATw+GaHb
	nSghmkDH20R9xKTAQqhVQ/DDcpMTYAUDHmcVMOO8uaPQ7tLEfERCxTSpJomxLLnSO8Pv
	nUKDgW5Mun7xa2oxWKWreqnA8Bcv+h1nWe+Rlqs3RVRSXqZmOsLvs0393MHJPNvkM6Zy
	LnrNiu1vpkyqP93tynCaVWg+dE62WQyb8BI73+uG2LYCMIYzFIir115qQNNPQT/wLYAk
	ZhaA==
X-Gm-Message-State: AHYfb5hCrjQhX6UXZx9O5YpNBPHTw+1Nb0WNhl4Y0+TiymGhrDNNuFPE
	gBKRmyJRrHbBhWZ4KDsYcPIIVthzYUrR
X-Received: by 10.107.15.155 with SMTP id 27mr4163591iop.203.1503558605866;
	Thu, 24 Aug 2017 00:10:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.200.71 with HTTP; Thu, 24 Aug 2017 00:09:35 -0700 (PDT)
In-Reply-To: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
References: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 24 Aug 2017 10:09:35 +0300
Message-ID: <CAHiDW_EiK7Yzj9MAoMi_E=+hVdmiHej5c=8JtAd0Ksv8uho0Cw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vulkan distro flag update
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
X-List-Received-Date: Thu, 24 Aug 2017 07:10:06 -0000
Content-Type: multipart/alternative; boundary="001a113eeca89a1a3005577a84a2"

--001a113eeca89a1a3005577a84a2
Content-Type: text/plain; charset="UTF-8"

On 23 August 2017 at 18:50, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> I'm not sure if this is right or not, but it resolves the failures I was
> getting after updating oe this morning.
>
> I was attempting to run the yocto project compliant script, which runs
> bitbake -S none world.  The results of this were an error that vulkan
> needed 'mesa-vulkan-drivers'.  Looking at mesa, it was clear that these
> are only built in the 'vulkan' distro flag is set.  (and mesa is only
> built in the opengl flag is set.)
>
> So I've added these checks to the vulkan recipe, and resolved the check.


Looks good to me, thanks.

It's possible that mesa could be talked into building just vulkan drivers
(and so could work without opengl feature) but the mesa recipe certainly
doesn't support it right now. I'll have a look at that but for now the
RRECOMMENDS tweak seems reasonable too.

Jussi


>
>
> Mark Hatle (1):
>   vulkan: Only build when 'vulkan' distro flag is set
>
>  meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 ++
>  meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb  | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113eeca89a1a3005577a84a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 August 2017 at 18:50, Mark Hatle &lt;<a href=3D"mail=
to:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>&gt=
;<br>&gt; I&#39;m not sure if this is right or not, but it resolves the fai=
lures I was<br>&gt; getting after updating oe this morning.<br>&gt;<br>&gt;=
 I was attempting to run the yocto project compliant script, which runs<br>=
&gt; bitbake -S none world.=C2=A0 The results of this were an error that vu=
lkan<br>&gt; needed &#39;mesa-vulkan-drivers&#39;.=C2=A0 Looking at mesa, i=
t was clear that these<br>&gt; are only built in the &#39;vulkan&#39; distr=
o flag is set. =C2=A0(and mesa is only<br>&gt; built in the opengl flag is =
set.)<br>&gt;<br>&gt; So I&#39;ve added these checks to the vulkan recipe, =
and resolved the check.<br><br><br>Looks good to me, thanks.<br><br>It&#39;=
s possible that mesa could be talked into building just vulkan drivers (and=
 so could work without opengl feature) but the mesa recipe certainly doesn&=
#39;t support it right now. I&#39;ll have a look at that but for now the RR=
ECOMMENDS tweak seems reasonable too.<br><br>Jussi<br><br><br>&gt;<br>&gt;<=
br>&gt; Mark Hatle (1):<br>&gt; =C2=A0 vulkan: Only build when &#39;vulkan&=
#39; distro flag is set<br>&gt;<br>&gt; =C2=A0meta/recipes-graphics/vulkan/=
<a href=3D"http://vulkan-demos_git.bb">vulkan-demos_git.bb</a> | 2 ++<br>&g=
t; =C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://vulkan_1.0.51.0.bb"=
>vulkan_1.0.51.0.bb</a> =C2=A0| 4 +++-<br>&gt; =C2=A02 files changed, 5 ins=
ertions(+), 1 deletion(-)<br>&gt;<br>&gt; --<br>&gt; 1.8.3.1<br>&gt;<br>&gt=
; --<br>&gt; _______________________________________________<br>&gt; Openem=
bedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.=
openembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a h=
ref=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core">ht=
tp://lists.openembedded.org/mailman/listinfo/openembedded-core</a></div>

--001a113eeca89a1a3005577a84a2--
