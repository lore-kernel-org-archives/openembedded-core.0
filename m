Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id EDCBC6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:47:13 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c52so5374319qte.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=iCkhDu8iHl9rOcuGm6O7Kjw48B7e9lZ5glOEsKrbpmw=;
	b=0ObqC/JKeBMAoFLaKtT6rrNTgoBkhTW6cnfnQBH8gVtHzDonbUGgfwyh7OrT/oyM+Y
	FOr4ciXMYeOqDgLb3ostUnzLsSMI803M4V4/A9CcuORfD7eXcwdB2kdIW5V9QyCgglpL
	EwSKFyFgQVBbaQJStnMpynB+R50mjah13OBYtvan9a6lVo6o1gANa5W+GVamIBaLQO1y
	1OXfDrqAceLZT69dz8ZkfGHELdz5iunLRSHdjwWbtL2+D60NZPN9IzK9jymZubP5D+KC
	D2o3AGpP/U47kijpeU3eNmRJWQxh76Fmi1iMZjmidCOYKTTovxstakAGAnBi1DUsiKqa
	kCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=iCkhDu8iHl9rOcuGm6O7Kjw48B7e9lZ5glOEsKrbpmw=;
	b=QpmQY3n7uifNTAIRmeiSmPY8cMVdEtx/FjPUAngd9MIUy8tWCeEy9zsNWj6mTltl1X
	1S65PrzedM8pCCQuEaV+41wjS3C2hSP7WVHknFVuYstkexNqyPp1hdTTjq6Yg+BTfNVZ
	qKVjoxVXGyJWopzNwn2Oh3EHXkilaV+bpQs863FHxcbnfg4TpEfWBaq3TSUZYAWjWDNn
	ril2giwEdb6sdlVU0GK6AN4NvFISiM1TrmH3piVNCgSYCebNoVcREosS6+2EHJESFRhc
	mg4b/VZ0P1xup0+5TkFa3nZ/IinqYlIpXFRMv9I9YlzeKdKFAD8P7psyX2je55wiVJV8
	frWQ==
X-Gm-Message-State: AEkoouu32l7z7rfhSMSaJChepCbVcWmkFfyq8j2Q1qlIZ9H3brtyL6Wg0SOWvnAMZW8Db7Jpitp6XWl8GM54FA==
MIME-Version: 1.0
X-Received: by 10.237.50.35 with SMTP id y32mr7172148qtd.98.1469202434131;
	Fri, 22 Jul 2016 08:47:14 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 08:47:14 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 08:47:14 -0700 (PDT)
In-Reply-To: <CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
References: <1469197543.23580.65.camel@linuxfoundation.org>
	<CAMKF1srw4bVtAHrq6uOVU__WueXjoNwKRsvxLNLudt_zFyzrzQ@mail.gmail.com>
	<CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
Date: Fri, 22 Jul 2016 08:47:14 -0700
Message-ID: <CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add mechanism to extend siteinfo information from BSP layer
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
X-List-Received-Date: Fri, 22 Jul 2016 15:47:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c116a7a30902405383b5999

--94eb2c116a7a30902405383b5999
Content-Type: text/plain; charset=UTF-8

Whats the motivation here. This looks like a backdoor for bsps. To user it
will make inconsistent behaviour. Even now its quite hard to root cause
errors due to siteinfo

On Jul 22, 2016 7:26 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> In order to add a new architecture or sub-architecture to OE, you
currently
> need to tweak the table in siteinfo.bbclass. This adds a mechanism so this
> can be done from a BSP layer. It needs a function definition which needs
> a class file but can then be done with something like:
>
> def rp_testfunc2(archinfo, osinfo, targetinfo, d):
>     archinfo['testarch'] = "little-endian bit-32"
>     osinfo['testos'] = "common-linux"
>     targetinfo['mymach-linux'] = "mymach-linux-common"
>
>     return archinfo, osinfo, targetinfo
>
> SITEINFO_EXTRA_DATAFUNCS = "rp_testfunc2"
>
> [YOCTO #8554]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 50141a3..3c9ab2a 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -107,6 +107,14 @@ def siteinfo_data(d):
>          "x86_64-mingw32": "bit-64",
>      }
>
> +    # Add in any extra user supplied data which may come from a BSP
layer, removing the
> +    # need to always change this class directly
> +    extra_siteinfo = (d.getVar("SITEINFO_EXTRA_DATAFUNCS", True) or
"").split()
> +    for m in extra_siteinfo:
> +        call = m + "(archinfo, osinfo, targetinfo, d)"
> +        locs = { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo"
: targetinfo, "d" : d}
> +        archinfo, osinfo, targetinfo = bb.utils.better_eval(call, locs)
> +
>      hostarch = d.getVar("HOST_ARCH", True)
>      hostos = d.getVar("HOST_OS", True)
>      target = "%s-%s" % (hostarch, hostos)
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c116a7a30902405383b5999
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Whats the motivation here. This looks like a backdoor for bs=
ps. To user it will make inconsistent behaviour. Even now its quite hard to=
 root cause errors due to siteinfo</p>
<p dir=3D"ltr">On Jul 22, 2016 7:26 AM, &quot;Richard Purdie&quot; &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; In order to add a new architecture or sub-architecture to OE, you curr=
ently<br>
&gt; need to tweak the table in siteinfo.bbclass. This adds a mechanism so =
this<br>
&gt; can be done from a BSP layer. It needs a function definition which nee=
ds<br>
&gt; a class file but can then be done with something like:<br>
&gt;<br>
&gt; def rp_testfunc2(archinfo, osinfo, targetinfo, d):<br>
&gt; =C2=A0 =C2=A0 archinfo[&#39;testarch&#39;] =3D &quot;little-endian bit=
-32&quot;<br>
&gt; =C2=A0 =C2=A0 osinfo[&#39;testos&#39;] =3D &quot;common-linux&quot;<br=
>
&gt; =C2=A0 =C2=A0 targetinfo[&#39;mymach-linux&#39;] =3D &quot;mymach-linu=
x-common&quot;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 return archinfo, osinfo, targetinfo<br>
&gt;<br>
&gt; SITEINFO_EXTRA_DATAFUNCS =3D &quot;rp_testfunc2&quot;<br>
&gt;<br>
&gt; [YOCTO #8554]<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;<br>
&gt; diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbc=
lass<br>
&gt; index 50141a3..3c9ab2a 100644<br>
&gt; --- a/meta/classes/siteinfo.bbclass<br>
&gt; +++ b/meta/classes/siteinfo.bbclass<br>
&gt; @@ -107,6 +107,14 @@ def siteinfo_data(d):<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;x86_64-mingw32&quot;: &quot;bi=
t-64&quot;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 # Add in any extra user supplied data which may come fr=
om a BSP layer, removing the<br>
&gt; +=C2=A0 =C2=A0 # need to always change this class directly<br>
&gt; +=C2=A0 =C2=A0 extra_siteinfo =3D (d.getVar(&quot;SITEINFO_EXTRA_DATAF=
UNCS&quot;, True) or &quot;&quot;).split()<br>
&gt; +=C2=A0 =C2=A0 for m in extra_siteinfo:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 call =3D m + &quot;(archinfo, osinfo, tar=
getinfo, d)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 locs =3D { &quot;archinfo&quot; : archinf=
o, &quot;osinfo&quot; : osinfo, &quot;targetinfo&quot; : targetinfo, &quot;=
d&quot; : d}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 archinfo, osinfo, targetinfo =3D bb.utils=
.better_eval(call, locs)<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0hostarch =3D d.getVar(&quot;HOST_ARCH&quot;, True)=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0hostos =3D d.getVar(&quot;HOST_OS&quot;, True)<br>
&gt; =C2=A0 =C2=A0 =C2=A0target =3D &quot;%s-%s&quot; % (hostarch, hostos)<=
br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br></p>

--94eb2c116a7a30902405383b5999--
