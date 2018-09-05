Return-Path: <tarun4690@gmail.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail.openembedded.org (Postfix) with ESMTP id B12C474C68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 13:37:02 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id y20-v6so2664949ybi.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=urz1rX/cQtQt5zXdChln04UxXRv5oySs0DSA14lcy0o=;
	b=VQJ8C99fZg5H9uo5zbERTF72oQgCledNg97A5cRfIdEU/c8xRrRo4Ap6Tgyu28MRlD
	cp2yyh7vs0Vbl2A+DjiOeRnvKvtYcgCmKUGzbyFcQErT40mWSeguFrz3i36EBX1uR1vg
	VjL3MDaTokhOZ8pBNMVKTqHE6Fxn/vMOJzw1ZuGu8zQwIXi5RlnkStHSD5BgLojvH2XD
	mFk0wy3yVSRrO0s8lH1TNbcmALSZnx+x8soNfzgU2bXvufoksFwkMz71WLf7ZKN9SSP6
	7rkbN6+cESPXI53CwPcNHvEbDP7dHsghLNgoStlUi2crEUieNRP8hsCN7tHxNVVa9w+b
	zfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=urz1rX/cQtQt5zXdChln04UxXRv5oySs0DSA14lcy0o=;
	b=OsksjosJLlzJlBuaynkbScweq+i78hZu+pW2LYY7HB/5jDLzMYrqsjTvbcZoHaURu1
	OSMNtY7/JTTIW4/IHqurjePremS8M7u6d7eIOguuUTExzdfLqpCrCdDUHaiZBQ1VMIvl
	c1hBEGppYzOTyaTCeA909QMrubRVBCe6oM2dScwZcWt3+7YmtChfpEWOBGe6HoROc48W
	TZ6BLGRg4EsiBq/iPkvA7y622RuAfXevOB13baz6LMHa/4+ch83tB1QZCnP9TV2rT8mn
	5E3UzpOx5ZFVchk/VfYzciZfRcEOI4rwpPR2UkoG7XSLNB3iq68x9iTVWgpjH71fxLDO
	Tprg==
X-Gm-Message-State: APzg51B0ckYp8lX8IZkObwpnBrWZcMu2aYQ39AuwvEIYAVD/3xSXM8+p
	wgR0U+WI2t6erlGcCQfr+cB/swPSIkh5VBPribJy4XRy
X-Google-Smtp-Source: ANB0VdbR5TjnvK2p2qQh9hIP1DlvpKe2I19j+SU14PU14ERr6KFR4I5KwnzruYLDD7YjA5CgnVCSqX5T3jMRsl7Zjr0=
X-Received: by 2002:a25:a224:: with SMTP id
	b33-v6mr8553646ybi.206.1536154623292; 
	Wed, 05 Sep 2018 06:37:03 -0700 (PDT)
MIME-Version: 1.0
From: Tarun Tej K <tarun4690@gmail.com>
Date: Wed, 5 Sep 2018 19:06:52 +0530
Message-ID: <CAMvyGd-9c41OHDgy1qaxhiNyQwH9Hf9Nzo3bqfw+fanGF-AdNg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: bitbake gstreamer1.0 : "Nothing PROVIDES 'gobject-introspection'"
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
X-List-Received-Date: Wed, 05 Sep 2018 13:37:02 -0000
Content-Type: multipart/alternative; boundary="000000000000a441dc05751fde4b"

--000000000000a441dc05751fde4b
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to build the latest gstreamer version 1.14.2 using the yocto
recipes from
https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-multimedia/gstreamer

I have added new version recipes to my custom yocto layer; added the
required .bbclass files to 'classes' directory inside my custom layer.
There are older version (1.4.5, 1.6.0) recipes in other layers but my layer
has higher priority so the 'bitbake -s' shows 1.14.2 as the version of
gstreamer family, so that proves the recipes are successfully parsed.

After that I am trying to build gstreamer1.0 using the command '*bitbake
gstreamer1.0*' but I get an error saying
*Nothing PROVIDES 'gobject-introspection' .......... *
*Close matches: *
*gobject-introspection-stub *
*gobject-introspection-native*

I have verified that the gobject-introspection.bbclass file has been added
to classed directory of my layer. I have removed gobject-introspection from
the inherit list in the  gstreamer1.0_1.14.2.bb and it successfully
continued to bitbake until some 'installed but not shipped' error occurred
at do_package_qa task. Also another class 'upstream-version-is-even.bbclass'
is also inherited by gstreamer1.0_1.14.2.bb and that is also present in
same directory as gobject-introspection.bbclass but I don't get any error
with that.

I am using the yocto setup cloned from freescale's repository (
http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=imx-4.1.15-1.0.0_ga),
so this might contain older dependency libraries. Also the bitbake version
is 1.28.0

What could be the problem? Please let me know if I need to provide any
additional information to understand issue better.

Thanks
Tarun

--000000000000a441dc05751fde4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to build the latest gst=
reamer version 1.14.2 using the yocto recipes from=C2=A0<a href=3D"https://=
github.com/openembedded/openembedded-core/tree/master/meta/recipes-multimed=
ia/gstreamer" target=3D"_blank">https://github.com/openembedded/openembedde=
d-core/tree/master/meta/recipes-multimedia/gstreamer</a></div><div><br></di=
v><div>I have added new version recipes to my custom yocto layer; added the=
 required .bbclass files to &#39;classes&#39; directory inside my custom la=
yer. There are older version (1.4.5, 1.6.0) recipes in other layers but my =
layer has higher priority so the &#39;bitbake -s&#39; shows 1.14.2 as the v=
ersion of gstreamer family, so that proves the recipes are successfully par=
sed.</div><div><br></div><div>After that I am trying to build gstreamer1.0 =
using the command &#39;<b>bitbake gstreamer1.0</b>&#39; but I get an error =
saying=C2=A0</div><div><b>Nothing PROVIDES &#39;gobject-introspection&#39;=
=C2=A0..........=C2=A0</b></div><div><b>Close matches:=C2=A0</b></div><div>=
<b>gobject-introspection-stub=C2=A0</b></div><div><b>gobject-introspection-=
native</b></div><div><b><br></b></div><div>I have verified that the gobject=
-introspection.bbclass file has been added to classed directory of my layer=
. I have removed gobject-introspection from the inherit list in the=C2=A0=
=C2=A0<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMac=
SystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;"><a hr=
ef=3D"http://gstreamer1.0_1.14.2.bb/" target=3D"_blank">gstreamer1.0_1.14.2=
.bb</a>=C2=A0and it successfully continued to bitbake until some &#39;insta=
lled but not shipped&#39;</span>=C2=A0error occurred at do_package_qa task.=
 Also another class &#39;<span style=3D"color:rgb(36,41,46);font-family:SFM=
ono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;fo=
nt-size:12px;white-space:pre-wrap">upstream-version-is-even.bbclass</span>&=
#39; is also inherited by=C2=A0<span style=3D"color:rgb(36,41,46);font-fami=
ly:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sa=
ns-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Seg=
oe UI Symbol&quot;"><a href=3D"http://gstreamer1.0_1.14.2.bb/" target=3D"_b=
lank">gstreamer1.0_1.14.2.bb</a>=C2=A0and that is also present in same dire=
ctory as=C2=A0</span>gobject-introspection.bbclass but I don&#39;t get any =
error with that.</div><div><br></div><div>I am using the yocto setup cloned=
 from freescale&#39;s repository (<a href=3D"http://git.freescale.com/git/c=
git.cgi/imx/fsl-arm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=3Dimx-4.1.15-=
1.0.0_ga" target=3D"_blank">http://git.freescale.com/git/cgit.cgi/imx/fsl-a=
rm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=3Dimx-4.1.15-1.0.0_ga</a>), so=
 this might contain older dependency libraries. Also the bitbake version is=
 1.28.0</div><div><br></div><div>What could be the problem? Please let me k=
now if I need to provide any additional information to understand issue bet=
ter.</div><div><br></div><div>Thanks</div><div>Tarun</div></div>

--000000000000a441dc05751fde4b--
