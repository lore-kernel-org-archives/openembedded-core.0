Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2B24A745B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:43:26 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id k5so7519895ote.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tC8DGwiYPatvR02SVcG7Ngf64pq1ylxyeZUy7fTyY2g=;
	b=j1TnfxXtq99FNQdNuesR6zdnpeWHHLesv56MCx/lC4JXJgiE8cC0MRP9r9bI4c3IM+
	lPvO8FLwwwaBhB7fT1/v60R9wXY/JeZWW5vncIfX3OUb1YrJdZyq6v6up/fB7WBwsTnv
	UoFdauWjWg7XTHd46atWwjr/eNIEa5Uzs709Cj4ieJlJvqumLs8U6xg3GjFNGFJVrbmB
	c9f2DW6kRtXbZy4FjqOV/ikpp03Vzwvvof55rhxc2ljMeacuLPenN9PqmqM/PJKfbkdH
	tbP2GbWBNb9QaRWRRvov3acNhWAnIkaLTxSEJMeRKyrj08NOw9etbhwhdXYXZG+WwM4Y
	s0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tC8DGwiYPatvR02SVcG7Ngf64pq1ylxyeZUy7fTyY2g=;
	b=IaLCwqMHSKtByv9eOP1jKGchUnpSHmC20x3VG6sMTxmptj3/n+rMulYRCr9kSpFW52
	9kC2oL1oo0Mx8MSQBPpS4QZkaugsNbValBVO66tT/FI7hLZiIih+XO9KV2USXY2kIC3e
	I4WnyMLI5fYFFenotaL2NNKxzKvnyTPsI9r7iwOUd8f2j3FK2qXj9c0im0qGEuCA/XFQ
	ZIoY+HiyMH4ivvzA1xOKeE0xUlK5RyjatIkmyGgP2yTkQyUL2Jrodta3AUv7xHE+S0Ym
	LmiuqNSXGawAJVP6La14xAsC/Ptn2TP8mRydc+mKQyzjmFDutQOsyuwWplbRYhjCbXTv
	Lk9w==
X-Gm-Message-State: ABuFfojLVg2WHHk1ikH4iHgo1P0h4SrwmkDcisMz0QJJ3pbLKnsnP2t3
	vVAlsfX6DOEwAwxsNb7MyCP4rYc+5vw8xtcBXUgSTPnz
X-Google-Smtp-Source: ACcGV61o1aYQO7ShlEBRqpdpC1gMITGhAT/FYsqnNysztOwQuxEj3SEXN9iN5nr26CRVzqPvUfn/k25utrzuBteqECQ=
X-Received: by 2002:a9d:7613:: with SMTP id
	k19-v6mr14686720otl.297.1539013406961; 
	Mon, 08 Oct 2018 08:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <655290B7709079438B7932553958E60DA15843CA@ESS-EX01.essvote.corp.local>
In-Reply-To: <655290B7709079438B7932553958E60DA15843CA@ESS-EX01.essvote.corp.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Oct 2018 16:43:15 +0100
Message-ID: <CAJTo0LacsX89u4ueXgQmgtip_PtyfF04SekXD1pAMjtTgtu2GQ@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Support for changing the imager used in wic.
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
X-List-Received-Date: Mon, 08 Oct 2018 15:43:27 -0000
Content-Type: multipart/alternative; boundary="0000000000006d4e660577b97bf6"

--0000000000006d4e660577b97bf6
Content-Type: text/plain; charset="UTF-8"

That's one messed up patch: can you resend using git-send-email please?

Ross

On Mon, 8 Oct 2018 at 14:59, Davis, Michael <michael.davis@essvote.com>
wrote:

> >*From 136d6214b6fc2c1118dac5b7f3e029ed006fab8a Mon Sep 17 00:00:00 2001*
>
> From: Paul Knopf <pauldotknopf at gmail.com <https://lists.yoctoproject.org/listinfo/yocto>>
>
> Date: Mon, 21 May 2018 16:56:51 -0400
>
> Subject: [PATCH] Support for changing the imager used in wic.
>
>
>
> ---
>
>  scripts/lib/wic/engine.py | 2 +-
>
>  scripts/wic               | 1 +
>
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
>
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
>
> index edcfab3..d7c5c11 100644
>
> --- a/scripts/lib/wic/engine.py
>
> +++ b/scripts/lib/wic/engine.py
>
> @@ -191,7 +191,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir,
>
> kernel_dir,
>
>      if not os.path.exists(options.outdir):
>
>          os.makedirs(options.outdir)
>
>
>
> -    pname = 'direct'
>
> +    pname = options.imager
>
>      plugin_class = PluginMgr.get_plugins('imager').get(pname)
>
>      if not plugin_class:
>
>          raise WicError('Unknown plugin: %s' % pname)
>
> diff --git a/scripts/wic b/scripts/wic
>
> index 7392bc4..255e524 100755
>
> --- a/scripts/wic
>
> +++ b/scripts/wic
>
> @@ -360,6 +360,7 @@ def wic_init_parser_create(subparser):
>
>      subparser.add_argument("-v", "--vars", dest='vars_dir',
>
>                        help="directory with <image>.env files that store "
>
>                             "bitbake variables")
>
> +    subparser.add_argument("-i", "--imager", dest="imager",
>
> default="direct", help="the wic imager plugin")
>
>      subparser.add_argument("-D", "--debug", dest="debug",
>
> action="store_true",
>
>                        default=False, help="output debug information")
>
>      return
>
> --
>
> 2.7.4
>
>
>
>
>
> I found this patch that got sent to the yocto mailing list, but never made
> it to the correct mailing list.
>
> I would really like to have the functionality if it is possible to get it
> pulled in.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006d4e660577b97bf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s one messed up patch: can you resend using git-s=
end-email please?<div><br></div><div>Ross</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Mon, 8 Oct 2018 at 14:59, Davis, Michael &lt;<=
a href=3D"mailto:michael.davis@essvote.com">michael.davis@essvote.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_951161151304717465WordSection1">
<pre><span style=3D"color:black">&gt;<i>From 136d6214b6fc2c1118dac5b7f3e029=
ed006fab8a Mon Sep 17 00:00:00 2001<u></u><u></u></i></span></pre>
<pre><span style=3D"color:black">From: Paul Knopf &lt;<a href=3D"https://li=
sts.yoctoproject.org/listinfo/yocto" target=3D"_blank">pauldotknopf at gmai=
l.com</a>&gt;<u></u><u></u></span></pre>
<pre><span style=3D"color:black">Date: Mon, 21 May 2018 16:56:51 -0400<u></=
u><u></u></span></pre>
<pre><span style=3D"color:black">Subject: [PATCH] Support for changing the =
imager used in wic.<u></u><u></u></span></pre>
<pre><span style=3D"color:black"><u></u>=C2=A0<u></u></span></pre>
<pre><span style=3D"color:black">---<u></u><u></u></span></pre>
<pre><span style=3D"color:black"> scripts/lib/wic/engine.py | 2 +-<u></u><u=
></u></span></pre>
<pre><span style=3D"color:black"> scripts/wic=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<u></u><u></u><=
/span></pre>
<pre><span style=3D"color:black"> 2 files changed, 2 insertions(+), 1 delet=
ion(-)<u></u><u></u></span></pre>
<pre><span style=3D"color:black"><u></u>=C2=A0<u></u></span></pre>
<pre><span style=3D"color:black">diff --git a/scripts/lib/wic/engine.py b/s=
cripts/lib/wic/engine.py<u></u><u></u></span></pre>
<pre><span style=3D"color:black">index edcfab3..d7c5c11 100644<u></u><u></u=
></span></pre>
<pre><span style=3D"color:black">--- a/scripts/lib/wic/engine.py<u></u><u><=
/u></span></pre>
<pre><span style=3D"color:black">+++ b/scripts/lib/wic/engine.py<u></u><u><=
/u></span></pre>
<pre><span style=3D"color:black">@@ -191,7 +191,7 @@ def wic_create(wks_fil=
e, rootfs_dir, bootimg_dir,<u></u><u></u></span></pre>
<pre><span style=3D"color:black">kernel_dir,<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.ex=
ists(options.outdir):<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 os.makedirs(options.outdir)<u></u><u></u></span></pre>
<pre><span style=3D"color:black"><u></u>=C2=A0<u></u></span></pre>
<pre><span style=3D"color:black">-=C2=A0 =C2=A0=C2=A0pname =3D &#39;direct&=
#39;<u></u><u></u></span></pre>
<pre><span style=3D"color:black">+=C2=A0=C2=A0=C2=A0 pname =3D options.imag=
er<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 plugin_class =3D =
PluginMgr.get_plugins(&#39;imager&#39;).get(pname)<u></u><u></u></span></pr=
e>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 if not plugin_cla=
ss:<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 raise WicError(&#39;Unknown plugin: %s&#39; % pname)<u></u><u></u></=
span></pre>
<pre><span style=3D"color:black">diff --git a/scripts/wic b/scripts/wic<u><=
/u><u></u></span></pre>
<pre><span style=3D"color:black">index 7392bc4..255e524 100755<u></u><u></u=
></span></pre>
<pre><span style=3D"color:black">--- a/scripts/wic<u></u><u></u></span></pr=
e>
<pre><span style=3D"color:black">+++ b/scripts/wic<u></u><u></u></span></pr=
e>
<pre><span style=3D"color:black">@@ -360,6 +360,7 @@ def wic_init_parser_cr=
eate(subparser):<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 subparser.add_arg=
ument(&quot;-v&quot;, &quot;--vars&quot;, dest=3D&#39;vars_dir&#39;,<u></u>=
<u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 help=3D&quot;directory with &lt;image&gt;.env files that st=
ore &quot;<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;bitbake variables&quot;=
)<u></u><u></u></span></pre>
<pre><span style=3D"color:black">+=C2=A0=C2=A0=C2=A0 subparser.add_argument=
(&quot;-i&quot;, &quot;--imager&quot;, dest=3D&quot;imager&quot;,<u></u><u>=
</u></span></pre>
<pre><span style=3D"color:black">default=3D&quot;direct&quot;, help=3D&quot=
;the wic imager plugin&quot;)<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 subparser.add_arg=
ument(&quot;-D&quot;, &quot;--debug&quot;, dest=3D&quot;debug&quot;,<u></u>=
<u></u></span></pre>
<pre><span style=3D"color:black">action=3D&quot;store_true&quot;,<u></u><u>=
</u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 default=3DFalse, help=3D&quot;output debug information&quot=
;)<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0 return<u></u><u><=
/u></span></pre>
<pre><span style=3D"color:black">-- <u></u><u></u></span></pre>
<pre><span style=3D"color:black">2.7.4<u></u><u></u></span></pre>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I found this patch that got sent to the yocto mailin=
g list, but never made it to the correct mailing list.<u></u><u></u></p>
<p class=3D"MsoNormal">I would really like to have the functionality if it =
is possible to get it pulled in.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000006d4e660577b97bf6--
