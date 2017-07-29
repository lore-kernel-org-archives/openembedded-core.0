Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 51C6178548
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 13:49:08 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j32so77446417iod.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N3bVOM78lJgGFXdG5XUjtl/Pslikax79R9xNFAiOWS0=;
	b=xk38xVY9jMkE0iDKVtCcOpPkumftdgw7lxmne0H4yI4cRqK2XnPWTvci43lfwXDFa3
	CBVnYlQC3/RZmfJ+4bFQultqcCyvoO6DC0Qyrehqw6FwHTfHX17Z/mGO9DIDTW0kH+7B
	qQTZKIfkdZ+OYsY2llBC6QJokp/yvMECHw+VgJM2KlZY8l4CMWiPw+WixvjRwIfSnFPF
	q2FA03H1kobkHV6/aqwwsfQyt9VV2+UwmkkZWOYheQgu1UUenb63Z3+ExDhNWWq4hvyI
	4mxouAUBLLeED4fnd6+TrJd02dYYdIBM0tOcBTABqmP2mzG+6Lc/1Vo7+XA1D9pFE7tL
	44nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N3bVOM78lJgGFXdG5XUjtl/Pslikax79R9xNFAiOWS0=;
	b=tMUWDzmuyP17hNSkdRFW6YeANeRKrbrUrngCbHnW4kyISz83bZjCTFY40TRFUH+Gb7
	Fxv2D1v93EJ0+sMdT09Q8EThb0zl6HMOui+eW9MprMxbGpvSTJ+PfCDrxYOKPjtjrTCP
	NdKBTECaHbch330NSY75iRPvWgd+ODW/Z82Ebg+lRBMVU8QUrUM3NYnhz4fHPhqjAoIY
	H33MkAWmmOtnLy36+Gd5VXmpDTIkQKxQWsfkzQxyeqsCEeTQ0m3CkvZNPgvfsXXSq79R
	E8NeagulcNYW9Nz1le5rWyEcrAOACY5ejX9wFAwFeH6iSKQwTageAle1PVOO+vBrz1GI
	ypdQ==
X-Gm-Message-State: AIVw113iaUHecs6qrAKEyUkTNjrm1BUyDx8QwIyaH3sPhIDtG6OgTUhS
	C63ac0JfBjghwvuMyoqfBPzDqaIuczjBLes=
X-Received: by 10.107.170.170 with SMTP id g42mr13844460ioj.19.1501336150239; 
	Sat, 29 Jul 2017 06:49:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Sat, 29 Jul 2017 06:48:49 -0700 (PDT)
In-Reply-To: <cover.1500914447.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1500914447.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Jul 2017 14:48:49 +0100
Message-ID: <CAJTo0LbPzRM1dqQzZMD-iqA+a4zKevm0qiZzEvp4HXOUeMv9-g@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] python-3.5-manifest: move python3.5-config script into the dev package
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
X-List-Received-Date: Sat, 29 Jul 2017 13:49:09 -0000
Content-Type: multipart/alternative; boundary="001a114260baec735e0555750ffb"

--001a114260baec735e0555750ffb
Content-Type: text/plain; charset="UTF-8"

The first line of the python-3.5-manifest.inc:

# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time
I regenerate the file.

You'll need to edit the script and then regenerate the manifest.

Might be worth patching the script to wrap long lines instead of writing
1000 character lines to save the line length problem in the future too.

Ross

On 24 July 2017 at 17:44, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The following changes since commit a4f2bf37b7eac888f37f11cd4d4606
> 436909c507:
>
>   mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES (2017-07-17 15:14:27 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib lsandov1/python3-config-multilib
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
> lsandov1/python3-config-multilib
>
> Leonardo Sandoval (1):
>   python-3.5-manifest: move python3.5-config script into the dev package
>
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.12.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114260baec735e0555750ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The first line of the python-3.5-manifest.inc:<div><br><di=
v># WARNING: This file is AUTO GENERATED: Manual edits will be lost next ti=
me I regenerate the file.<br></div></div><div><br></div><div>You&#39;ll nee=
d to edit the script and then regenerate the manifest.</div><div><br></div>=
<div>Might be worth patching the script to wrap long lines instead of writi=
ng 1000 character lines to save the line length problem in the future too.<=
/div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 24 July 2017 at 17:44,  <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blan=
k">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">From: Leonardo Sandoval &lt;<a href=3D"mailto:le=
onardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>l=
inux.intel.com</a>&gt;<br>
<br>
The following changes since commit a4f2bf37b7eac888f37f11cd4d4606<wbr>43690=
9c507:<br>
<br>
=C2=A0 mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES (2017-07-17 15:14:27 +01=
00)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> lsan=
dov1/python3-config-<wbr>multilib<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dlsandov1/python3-config-multilib" rel=3D"noreferrer" target=3D"_blank">h=
ttp://git.yoctoproject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>lsandov=
1/python3-config-<wbr>multilib</a><br>
<br>
Leonardo Sandoval (1):<br>
=C2=A0 python-3.5-manifest: move python3.5-config script into the dev packa=
ge<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 4 ++--<br=
>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114260baec735e0555750ffb--
