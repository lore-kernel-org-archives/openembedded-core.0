Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6DD37883C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 12:30:08 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id b34so9653419ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=29qqaQNyEj/H/wJJm1KiP1Ft+FpWMtziFp5HqePxhvE=;
	b=CAQCjrKh7+HFSmCNlbkzF61isFRwgBLxj1yt1Efpr1UZOOwuGspsJgDbRl8COjtnVr
	epel++ZKmLVXYqnLV6LduKAO048AnNepB0As3mYhjFpUZHgHrRPp9JrtVvyQ9Hzprj6o
	lTK3+Sag9ryE/cNVsXJFaRbnI2BPlX624WlTk4r19dyS8cMiOgWSQpY5bN9VcXiWCCIx
	rfvKpug5NKNtSFhGkK/FKBRi9poCC4wiGVEzNf5w21yrMRBcqYL/C6at+J2O4ftqfRGp
	HNPoXu5PjjJZ8iWsdW6SNRozd7C9OPo5khv6GfmH0ehrhp+GNpP79fd3ZK6AAdQY20+k
	O7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=29qqaQNyEj/H/wJJm1KiP1Ft+FpWMtziFp5HqePxhvE=;
	b=coiczTQO3KQPfT1dtNeiX5zteWaVurcbXI8WXNgLT4adMn20sili54nror8ySA0kA1
	LPlrSBhWdSEvw6Jl/5TOJR7X2QyKnRX0VlqEe1j6TH0g4x/+zW+RKdRm6ibDqEe5obLq
	JPUFY/XADpg9JREKlc36gUFUhv8RGhK0qU3cKF9bjU4F3c6lBjroSykyRomxbHR40a69
	DYJPOMxZd3U1fw3vCVxxw8vGIfyCKYjAevRRmSTjLQ08c7D+JfTy+ZJcVCz2wnQKdL8n
	85FNEOzDrudNssQc4mthZOLl++4xbpudlHyhUC1GEc35WrPVj9nL0YixrhUc0kySAoCg
	rOLA==
X-Gm-Message-State: APf1xPDLqiCiMRswETzMKzEAZgwuFEQlQYfvlVlvS+RX8Jx6lFbKTJx6
	VAcM8fA/vy17Thu5esWNYGQ33bs/yI35Oo/jVhWVAg==
X-Google-Smtp-Source: AG47ELtz4/c8Ou4lbxo2vlJIWsjXkIeOpgrYgWoBRtzynS44KNaTJWQFnDj6UdbT0bYm32uQ4JVNYaI542Ue+3TTXF8=
X-Received: by 10.107.183.76 with SMTP id h73mr1537330iof.201.1519389007632;
	Fri, 23 Feb 2018 04:30:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 23 Feb 2018 04:29:47 -0800 (PST)
In-Reply-To: <CAMKF1spdL49Ny-yqk+n-k0JSU8PGVQyv43MgpZU_fOwVc1Fr4A@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
	<CAMKF1spdL49Ny-yqk+n-k0JSU8PGVQyv43MgpZU_fOwVc1Fr4A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Feb 2018 12:29:47 +0000
Message-ID: <CAJTo0LZ8ycUQ_SYb3gWYhirHC1nv3MVJsmnas=7a30m3Jp1vPA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Fri, 23 Feb 2018 12:30:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a1370680565e05262"

--94eb2c0b9e3a1370680565e05262
Content-Type: text/plain; charset="UTF-8"

I've made it work!  See the patches in poky-contrib:ross/glibc, although
I'm cleaning them up now.

Ross

On 23 February 2018 at 03:06, Khem Raj <raj.khem@gmail.com> wrote:

> glibc community thinks that the way we are depending upon old
> localedata while using newer
> glibc in nativesdk is not a supported usecase, and there is no
> guarantees of internal data structures changes between major releases,
> like what we are facing here. The suggestion is
> to ship own localedata instead of relying on SDK host. You can follow
> the discussion on glibc
> thread I added in previous email and if have some suggestions or
> inputs feel free.
>
> I will try to come up with a patch along with this upgrade to add
> nativesdk locale along and
> check if this fixes the issue we have
>
> On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Wanted to send update on this issue
> >
> > I got to bottom of this issue and Ross you should have known it :)
> >
> > https://patchwork.openembedded.org/patch/127105/
> >
> > introduced an optimization into nativesdk glibc to let it ride on
> localedate
> > from SDK host. This has now broken in glibc with
> >
> > https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe
> 62dc41be54
> >
> > it is recommended for static programs to be relinked if using glibc 2.27
> > our case is also similar mismatch of libc version and localedata just in
> > opposite direction where we are trying to read old data with new glibc
> > instead.
> >
> > I have initiated a discussion within glibc community on it to explore
> what
> > options we have, but be prepared to ship full localedata in worst case
> with
> > glibc 2.27,  this might be the worst case option if no alternative is
> found.
> >
> > Thank you
> > -Khem
> >
> > On 2/15/18 4:12 AM, Burton, Ross wrote:
> >>
> >> Yes, that's it.
> >>
> >> Ross
> >>
> >> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com
> >> <mailto:raj.khem@gmail.com>> wrote:
> >>
> >>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
> >>     <mailto:ross.burton@intel.com>> wrote:
> >>     > Getting there: https://autobuilder.yocto.io/tgrid
> >> <https://autobuilder.yocto.io/tgrid>
> >>     >
> >>     > Just two actual problems:
> >>     > - The non-gplv3 build failed as the make fix needs to be
> backported
> >> to
> >>     > meta-gplv2
> >>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the new
> >> glibc
> >>     > shouldn't be causing a problem with uninative so this is
> >> interesting, maybe
> >>     > the new one is behaving slightly differently.  Should be easy to
> >> replicate.
> >>     > The same problem caused selftest to fail.
> >>     >
> >>
> >>     is the UTF error like this one
> >>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
> >>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
> >>
> >>      > Ross
> >>
> >>
> >
>

--94eb2c0b9e3a1370680565e05262
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve made it work!=C2=A0 See the patches in poky-contr=
ib:ross/glibc, although I&#39;m cleaning them up now.<div><br></div><div>Ro=
ss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
23 February 2018 at 03:06, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">glibc community thinks that the way =
we are depending upon old<br>
localedata while using newer<br>
glibc in nativesdk is not a supported usecase, and there is no<br>
guarantees of internal data structures changes between major releases,<br>
like what we are facing here. The suggestion is<br>
to ship own localedata instead of relying on SDK host. You can follow<br>
the discussion on glibc<br>
thread I added in previous email and if have some suggestions or<br>
inputs feel free.<br>
<br>
I will try to come up with a patch along with this upgrade to add<br>
nativesdk locale along and<br>
check if this fixes the issue we have<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; Wanted to send update on this issue<br>
&gt;<br>
&gt; I got to bottom of this issue and Ross you should have known it :)<br>
&gt;<br>
&gt; <a href=3D"https://patchwork.openembedded.org/patch/127105/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.<wbr>openembedded.org/patch/1=
27105/</a><br>
&gt;<br>
&gt; introduced an optimization into nativesdk glibc to let it ride on loca=
ledate<br>
&gt; from SDK host. This has now broken in glibc with<br>
&gt;<br>
&gt; <a href=3D"https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272b=
bd7ba5fe62dc41be54" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/kraj/glibc/<wbr>commit/<wbr>95cb863a1ef7760a11272bbd7ba5fe<wbr>62dc41be54<=
/a><br>
&gt;<br>
&gt; it is recommended for static programs to be relinked if using glibc 2.=
27<br>
&gt; our case is also similar mismatch of libc version and localedata just =
in<br>
&gt; opposite direction where we are trying to read old data with new glibc=
<br>
&gt; instead.<br>
&gt;<br>
&gt; I have initiated a discussion within glibc community on it to explore =
what<br>
&gt; options we have, but be prepared to ship full localedata in worst case=
 with<br>
&gt; glibc 2.27,=C2=A0 this might be the worst case option if no alternativ=
e is found.<br>
&gt;<br>
&gt; Thank you<br>
&gt; -Khem<br>
&gt;<br>
&gt; On 2/15/18 4:12 AM, Burton, Ross wrote:<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s it.<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt;<br>
&gt;&gt; On 12 February 2018 at 07:32, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross &l=
t;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ross.burton@intel.=
com">ross.burton@intel.com</a>&gt;<wbr>&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Getting there: <a href=3D"https://autobuil=
der.yocto.io/tgrid" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yocto.io/<wbr>tgrid</a><br>
&gt;&gt; &lt;<a href=3D"https://autobuilder.yocto.io/tgrid" rel=3D"noreferr=
er" target=3D"_blank">https://autobuilder.yocto.io/<wbr>tgrid</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Just two actual problems:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; - The non-gplv3 build failed as the make f=
ix needs to be backported<br>
&gt;&gt; to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta-gplv2<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; - The eSDK selftests all failed with en_US=
.UTF-8 problems, the new<br>
&gt;&gt; glibc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; shouldn&#39;t be causing a problem with un=
inative so this is<br>
&gt;&gt; interesting, maybe<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; the new one is behaving slightly different=
ly.=C2=A0 Should be easy to<br>
&gt;&gt; replicate.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; The same problem caused selftest to fail.<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0is the UTF error like this one<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gist.github.com/25a84d236188=
24f0e5e6857a960eaca4" rel=3D"noreferrer" target=3D"_blank">https://gist.git=
hub.com/<wbr>25a84d23618824f0e5e6857a960eac<wbr>a4</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gist.github.com/25a84d23=
618824f0e5e6857a960eaca4" rel=3D"noreferrer" target=3D"_blank">https://gist=
.github.com/<wbr>25a84d23618824f0e5e6857a960eac<wbr>a4</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Ross<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--94eb2c0b9e3a1370680565e05262--
