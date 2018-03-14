Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 60A04788E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 12:41:31 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id e7so4230600ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5cEdgk03PCkiUBQvnKzrpHsPEg8n3beudfr7LLT+/RQ=;
	b=fXsY2frWNtzhf3R6DSrAEk7niDFzjZCa9lfG+vxg9bHrjTUw4u/kj4zywci4QHizbR
	2vDTFh+b10bLMAZK6pzjXCaECrFKZqqQ1W5Lgr7ZIB0MCWopWGWBLJZlAw7rfY3KAzkT
	OvwudVRWJsDYQdcqOUjWU1yK5kgDwjquFuD0IxdDKAbyRgPmrZZ0vfzLnGv+kb9LbHrM
	5oIpnQdprbl4nTdDEpdwZgtqgEzx7CRaKbEAF+4cClNB60qwPO3sQMu0N/DjQ90vq5uk
	E7H5jb7nyVr1t0OBYll/Gl/f0eXZSkU5TLsrOrD0IbpD3bNtQ8red1CZTaXXR4rrcllw
	tAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5cEdgk03PCkiUBQvnKzrpHsPEg8n3beudfr7LLT+/RQ=;
	b=EL2mT7N8Cq7Nel+y76Q2EcYHcHYM5+2x/1+QS9f+NV2Xc/gUV/g2u/j+fjsHRBTc3o
	3IG8TsN2RxJqJU3p0S4CwiBl5y4UiE1t/EOTbVi7VlbJvyEKmT+olDYTvIIGUVfMGBDf
	g15VXjP7OkYbOuEDAAkrjjGsL2NGVm/uq4mfY9dsSXWEfLfZIjL8ndFqulDTHvdMFfOI
	WCNVZm/2wZp+48nRE85okbojZ7wlPLlQFCfB9IM7d4fkcvTjjd8dWgh12Ym+B17u+eS4
	k6gXC0r2+C4pYxmJWy+gVvyYH0/mVd2FiDmzak+anniXFq66V6OvjLOrHEdUEjFLCCUe
	cuGw==
X-Gm-Message-State: AElRT7EcM6cOmYNqcwmbrDxT0q8xlnTFad8QF1m+KGdi/7tktrMVvon3
	3m+IppZZulJK9+2xWXoUgckymcvs37wj142nyF9sMw==
X-Google-Smtp-Source: AG47ELtrT0kwegl9RFExp1x9TYlbETFKYJR5cyvss0GkMkLJhY5z7hJXw/SVVa22HFzOjVgstvqTfXMBdAsMQfae//E=
X-Received: by 10.107.7.68 with SMTP id 65mr1524758ioh.216.1521031292642; Wed,
	14 Mar 2018 05:41:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 05:41:12 -0700 (PDT)
In-Reply-To: <f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 12:41:12 +0000
Message-ID: <CAJTo0LZcrg5TmTEyEwjAW0_49RJ0T2A4ZBsuNmyJ=wSMFWtuZw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 14 Mar 2018 12:41:32 -0000
Content-Type: multipart/alternative; boundary="001a113f9730e4195805675eb1ef"

--001a113f9730e4195805675eb1ef
Content-Type: text/plain; charset="UTF-8"

On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Integrating a configuration change for systemtap:
>
>   features/systemtap/systemtap.cfg: enable CONFIG_KERNEL_DEBUG
>

I noticed that all the performance machines had a big spike in kernel build
time and build directory size, and annoyingly spent too long bisecting
builds before noticing this in the commit message for the offending
commit.  If I re-read the logs I might have spotted this sooner. :)

$ buildstats-diff 20180314122002-3a8cce8b5c2 20180314122610-a7c9bc7020a/
Ignoring tasks less than 00:03.0 (3.0s)
Ignoring differences less than 00:01.0 (1.0s)

  PKG            TASK                      ABSDIFF   RELDIFF  CPUTIME1 ->
CPUTIME2
  linux-yocto    do_package                  20.2s   +153.0%     13.2s ->
33.3s
  linux-yocto    do_deploy                   29.9s  +1502.8%      2.0s ->
31.9s
  linux-yocto    do_package_write_ipk       125.5s   +310.2%     40.5s ->
166.0s
  linux-yocto    do_compile_kernelmodules   142.6s    +17.8%    800.3s ->
942.9s
  linux-yocto    do_package_write_rpm       156.0s   +563.6%     27.7s ->
183.7s
  linux-yocto    do_compile                 174.8s    +18.7%    934.3s ->
1109.1s

Cumulative cputime:
  649.5s    +35.0%    30:56.0 (1856.0s) -> 41:45.5 (2505.5s)

$ buildhistory-diff | grep SIZE
packages/qemux86-poky-linux/linux-yocto/kernel-vmlinux: PKGSIZE changed
from 19587044 to 300944172 (+1436%)

Is this really what we want out of the box?  Can the kernel have the
debugging bits stripped out into a separate package so even if we have the
build time hit, we don't have the kernel size change?

Ross

--001a113f9730e4195805675eb1ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 March 2018 at 18:11, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">Integrating a configuration c=
hange for systemtap:<br>
<br>
=C2=A0 features/systemtap/systemtap.<wbr>cfg: enable CONFIG_KERNEL_DEBUG<br=
></blockquote><div><br></div><div>I noticed that all the performance machin=
es had a big spike in kernel build time and build directory size, and annoy=
ingly spent too long bisecting builds before noticing this in the commit me=
ssage for the offending commit.=C2=A0 If I re-read the logs I might have sp=
otted this sooner. :)</div><div><br></div><div>$ buildstats-diff 2018031412=
2002-3a8cce8b5c2 20180314122610-a7c9bc7020a/</div><div>Ignoring tasks less =
than 00:03.0 (3.0s)</div><div>Ignoring differences less than 00:01.0 (1.0s)=
</div><div><br></div><div>=C2=A0 PKG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ABSDIFF =C2=A0 RELDIFF =C2=A0CPUTIME1 -&gt; CPUTIME2</div><div>=
=C2=A0 linux-yocto =C2=A0 =C2=A0do_package =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020.2s =C2=A0 +153.0% =C2=A0 =C2=A0 13.2s -&g=
t; 33.3s</div><div>=C2=A0 linux-yocto =C2=A0 =C2=A0do_deploy =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 29.9s =C2=A0+1502.8% =C2=
=A0 =C2=A0 =C2=A02.0s -&gt; 31.9s</div><div>=C2=A0 linux-yocto =C2=A0 =C2=
=A0do_package_write_ipk =C2=A0 =C2=A0 =C2=A0 125.5s =C2=A0 +310.2% =C2=A0 =
=C2=A0 40.5s -&gt; 166.0s</div><div>=C2=A0 linux-yocto =C2=A0 =C2=A0do_comp=
ile_kernelmodules =C2=A0 142.6s =C2=A0 =C2=A0+17.8% =C2=A0 =C2=A0800.3s -&g=
t; 942.9s</div><div>=C2=A0 linux-yocto =C2=A0 =C2=A0do_package_write_rpm =
=C2=A0 =C2=A0 =C2=A0 156.0s =C2=A0 +563.6% =C2=A0 =C2=A0 27.7s -&gt; 183.7s=
</div><div>=C2=A0 linux-yocto =C2=A0 =C2=A0do_compile =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 174.8s =C2=A0 =C2=A0+18.7% =C2=A0 =C2=A0=
934.3s -&gt; 1109.1s</div><div><br></div><div>Cumulative cputime:</div><div=
>=C2=A0 649.5s =C2=A0 =C2=A0+35.0% =C2=A0 =C2=A030:56.0 (1856.0s) -&gt; 41:=
45.5 (2505.5s)</div><div><br></div><div>$ buildhistory-diff | grep SIZE</di=
v><div>packages/qemux86-poky-linux/linux-yocto/kernel-vmlinux: PKGSIZE chan=
ged from 19587044 to 300944172 (+1436%)</div><div><br></div><div>Is this re=
ally what we want out of the box?=C2=A0 Can the kernel have the debugging b=
its stripped out into a separate package so even if we have the build time =
hit, we don&#39;t have the kernel size change?</div><div><br></div><div>Ros=
s=C2=A0</div></div></div></div>

--001a113f9730e4195805675eb1ef--
