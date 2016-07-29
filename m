Return-Path: <ncrypticus@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B820607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 20:30:38 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id m60so4280562uam.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RH99g14f0ep61qSphmSkxw0bhDrVjShMY0/DE3uxGAg=;
	b=AsHTIMfqrnHNTpNYGQNjbJBMP+13ZmKIqQ2JttlCOQItrZGI3h46IOQBQ9yP0O3oLN
	iRvJsajZDXs4/8i0fNltm3opF3new83SqSpetMYISFcZ9nBejdAukqvXMD6iAk2CVIYK
	0DAg6yeRWNb8kfsrA1x+W5tV7JVw8s/ZgIZjuMLBVj1YhCECY2lzleww4FW9yCY3gbQj
	B+2mWJ5KwbM+8cOekHrAtx+lPm+MASa/XxYIUXj+8UrNOB4hIr9UXpotuKrp5Dt7SB95
	A/Zzkdfo6C0jZ6M7gondU5yRHiHvhaCEXyLBQllXzyxx67OoGNEizxUZZ93489Tk9qmU
	H5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RH99g14f0ep61qSphmSkxw0bhDrVjShMY0/DE3uxGAg=;
	b=BetYaLAWkwjl9VRBcZ+WonkMnR6PDDJZ5T99l6A/V7YvP/tAiTmN1ZFEIrB7h7hvBM
	qtRTKrGV/uN3N/FDljQyvVUDNvc4at+UiyFUhvknMXIRQeqZCTYN4SIWAPjFWmHEq9e8
	2RcCgjzRAR7JdV0WE3rEokJINaEecpcj3VEjebxu5hIvx2Vy12EaSzuGnBz/CBz8RY+e
	6uMfRuxOdrk7JPg4xmVdU3DvdUSB8GGHBYPj5IpfNOtrzAfQ1PgvMZMVqK96ncMJ/bpz
	ZlTyMUDbBjstpTbOdgDMxYNofrwrXW+USv3m52uOVY3WVr2gMFXz1W2EC1ULYJzdfZB5
	U6/A==
X-Gm-Message-State: AEkoouvxSo8ds/Trb5nTNql7oFlahO3S2mKcA3ttJY/0/KkwbwAjAMDX00MA8pj4iQ7J8jKHJeNSnYNyha0zyQ==
X-Received: by 10.176.4.3 with SMTP id 3mr19454089uav.127.1469824238823; Fri,
	29 Jul 2016 13:30:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.112.2 with HTTP; Fri, 29 Jul 2016 13:30:38 -0700 (PDT)
In-Reply-To: <175B9BD5-9DEE-4B4C-B9AD-65F1D81438A3@gmail.com>
References: <CAMSG=xVPrR7peULZh4Ng+EVrjo5SXWwRBU2+o2XjFJGb_F-Xyw@mail.gmail.com>
	<175B9BD5-9DEE-4B4C-B9AD-65F1D81438A3@gmail.com>
From: Nemicolopterus Crypticus <ncrypticus@gmail.com>
Date: Fri, 29 Jul 2016 13:30:38 -0700
Message-ID: <CAMSG=xVfhcMA3_23fi8hxiaA6NqU_Ki10yFnxAd24jde0wn16A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: multilib support on Jethro: populate_sdk help
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
X-List-Received-Date: Fri, 29 Jul 2016 20:30:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c063734a32cde0538cc1f78

--94eb2c063734a32cde0538cc1f78
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Added: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10054


Please let me know if I can try anything else or provide more info.

In the meantime, I'm going to try to disable multilib, and only build the
ARMv7 version of the SDK.


On Fri, Jul 29, 2016 at 12:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Jul 29, 2016, at 10:48 AM, Nemicolopterus Crypticus <
> ncrypticus@gmail.com> wrote:
>
> Hello all,
>
> We are having issues with our generated SDK files. We're using the jethro
> branch, and have enabled multilib (see relevant portion of local.conf
> below).
>
> I can succesfully run the command to generate the SDK:
> $ bitbake <recipe name> -c populate_sdk
>
> But the output is incorrect. *While the aarch sysroots look good, the
> sysroots for arm are completely missing. The environment setup script end=
s
> up pointing to non-existent compilers. *Please let me know if you need
> more information!
>
>
> Thanks for report. It will be good if you can open a bugzilla entry for
> this. So it can be tracked.
>
>
> Steps to reproduce:
> $ bitbake <recipe name> -c populate_sdk
> $ cp tmp/deploy/sdk/<sdk-script>.sh /test/directory
> $ cd /test/directory
> $ bash <sdk-script>.sh
> $ ls sysroots/
> aarch64-poky-linux/   x86_64-pokysdk-linux/
>
> Note the missing ARM directories.
>
> Also, the setup script for arm sets this as the command for compiler:
>  12 export CC=3D"arm-pokymllib32-linux-gnueabi-gcc
>
> But that compiler doesn't exist anywhere in the folder where I installed
> everything, or environment!
>
> So it appears that it's not completely or correctly packaging everything
> for ARMv7.
>
> The documentation does mention some environment variables
> <http://www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-de=
v-environment>,
> but it's not clear how those related to multilib.
>
> For instance, none of our recipes have "SDKIMAGE_FEATURES" defined, but
> clearly the aarch64 sysroots are getting populated correctly (we
> succesfully compiled and ran a simple hello world).
>
> *Can anyone point me to an example, or discuss a successful use of
> "multilib" on the Jethro branch (given desparate brainstorming below),
> share some more verbose documentation, or ask follow-up questions?*
>
>
> _____________________________________________________________
> Desperate brainstorming below:
> I did find this years-old patch:
> https://patchwork.openembedded.org/patch/30941/
> Notably, the do_populate_sdk method in
> poky/meta/classes/populate_sdk_base.bbclass iterates over the values list=
ed
> in the MULTILIB_VARIANTS variable:
>
> +	variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""+	for item in var=
iants.split():+		# Load overrides from 'd' to avoid having to reset the val=
ue...+		overrides =3D d.getVar("OVERRIDES", False) + ":virtclass-multilib-"=
 + item+		localdata.setVar("OVERRIDES", overrides)+		bb.data.update_data(lo=
caldata)+		bb.build.exec_func("create_sdk_files", localdata)
>
>
>
> The latest version in Jethro does not have anything equivalent to that,
> but I did not dig deeply into the code or the commit history.
>
>
>
>
> ______________________________________________________________
> More data:
>
> local.conf relevant section:
> #
> # Multilib configuration
> #
> # This sets any packages preprended with lib32- to be built with
> # the armv7a tuning (32 bit) instead of 64 bit aarch.
> #
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7at-neon"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--94eb2c063734a32cde0538cc1f78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Added: <a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D10054">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D10054</a><br><br><br></div><div>Please let me know if I can try anything=
 else or provide more info.<br><br></div><div>In the meantime, I&#39;m goin=
g to try to disable multilib, and only build the ARMv7 version of the SDK.<=
br><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Fri, Jul 29, 2016 at 12:07 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"word-wrap:br=
eak-word"><br><div><span class=3D""><blockquote type=3D"cite"><div>On Jul 2=
9, 2016, at 10:48 AM, Nemicolopterus Crypticus &lt;<a href=3D"mailto:ncrypt=
icus@gmail.com" target=3D"_blank">ncrypticus@gmail.com</a>&gt; wrote:</div>=
<br><div><div dir=3D"ltr"><div><div>Hello all,<br><br></div>We are having i=
ssues with our=20
generated SDK files. We&#39;re using the jethro branch, and have enabled=20
multilib (see relevant portion of local.conf below).<br><br></div><div>I ca=
n succesfully run the command to generate the SDK:<br></div><div>$ bitbake =
&lt;recipe name&gt; -c populate_sdk<br><br></div><div>But the output is inc=
orrect. <b>While
 the aarch sysroots look good, the sysroots for arm are completely=20
missing. The environment setup script ends up pointing to non-existent=20
compilers. </b>Please let me know if you need more information!<br></div></=
div></div></blockquote><div><br></div></span><div>Thanks for report. It wil=
l be good if you can open a bugzilla entry for this. So it can be tracked.<=
/div><br><blockquote type=3D"cite"><div><div><div class=3D"h5"><div dir=3D"=
ltr"><div><br></div><div>Steps to reproduce:<br></div><div>$ bitbake &lt;re=
cipe name&gt; -c populate_sdk<br></div><div>$ cp tmp/deploy/sdk/&lt;sdk-scr=
ipt&gt;.sh /test/directory<br></div><div>$ cd /test/directory<br></div><div=
>$ bash &lt;sdk-script&gt;.sh<br></div><div>$ ls sysroots/<br>aarch64-poky-=
linux/=C2=A0=C2=A0 x86_64-pokysdk-linux/ <br><br></div><div>Note the missin=
g ARM directories.<br><br></div><div>Also, the setup script for arm sets th=
is as the command for compiler:<br>=C2=A012 export CC=3D&quot;arm-pokymllib=
32-linux-gnueabi-gcc<br><br></div><div>But that compiler doesn&#39;t exist =
anywhere in the folder where I installed everything, or environment!<br><br=
></div><div>So it appears that it&#39;s not completely or correctly packagi=
ng everything for ARMv7.<br></div><div><br></div><div>The <a href=3D"http:/=
/www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-dev-environ=
ment" target=3D"_blank">documentation does mention some environment variabl=
es</a>, but it&#39;s not clear how those related to multilib.<br><br></div>=
<div>For
 instance, none of our recipes have &quot;SDKIMAGE_FEATURES&quot; defined, =
but=20
clearly the aarch64 sysroots are getting populated correctly (we=20
succesfully compiled and ran a simple hello world).<br><br></div><div><b>Ca=
n
 anyone point me to an example, or discuss a successful use of=20
&quot;multilib&quot; on the Jethro branch (given desparate brainstorming be=
low),=20
share some more verbose documentation, or ask follow-up questions?</b><br><=
/div><div><br></div><div><br>______________________________________________=
_______________<br></div><div>Desperate brainstorming below:<br></div><div>=
I did find this years-old patch: <a href=3D"https://patchwork.openembedded.=
org/patch/30941/" target=3D"_blank">https://patchwork.openembedded.org/patc=
h/30941/</a><br></div><div>Notably, the do_populate_sdk method in poky/meta=
/classes/populate_sdk_base.bbclass iterates over the values listed in the M=
ULTILIB_VARIANTS variable:<br><br><pre><span>+	variants =3D d.getVar(&quot;=
MULTILIB_VARIANTS&quot;, True) or &quot;&quot;</span>
<span>+	for item in variants.split():</span>
<span>+		# Load overrides from &#39;d&#39; to avoid having to reset the val=
ue...</span>
<span>+		overrides =3D d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:virt=
class-multilib-&quot; + item</span>
<span>+		localdata.setVar(&quot;OVERRIDES&quot;, overrides)</span>
<span>+		bb.data.update_data(localdata)</span>
<span>+		bb.build.exec_func(&quot;create_sdk_files&quot;, localdata)</span>=
</pre><br></div><div><br></div><div>The latest version in Jethro does not h=
ave anything equivalent to that, but I did not dig deeply into the code or =
the commit history.<br></div><div><br><br><br><br>_________________________=
_____________________________________<br></div><div>More data:<br></div><di=
v><br></div>local.conf relevant section:<br>#<br># Multilib configuration<b=
r>#<br># This sets any packages preprended with lib32- to be built with<br>=
# the armv7a tuning (32 bit) instead of 64 bit aarch.<br>#<br>require conf/=
multilib.conf<br>MULTILIBS =3D &quot;multilib:lib32&quot;<br>DEFAULTTUNE_vi=
rtclass-multilib-lib32 =3D &quot;armv7at-neon&quot;</div></div></div><span =
class=3D"HOEnZb"><font color=3D"#888888">
-- <br>_______________________________________________<br>Openembedded-core=
 mailing list<br><a href=3D"mailto:Openembedded-core@lists.openembedded.org=
" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a href=
=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" targe=
t=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re</a><br></font></span></div></blockquote></div><br></div></blockquote></d=
iv><br></div>

--94eb2c063734a32cde0538cc1f78--
