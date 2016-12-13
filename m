Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 151A871D9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:05:48 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c47so108995170qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fOwpuOtkYvxoGB09+GCRmf8cRmaFef1oINKKRFnLKtg=;
	b=PbL+bi1O8zXLfIrezzQE7VCApM+cTNVNEESun6ewLY2S1n9vEdMzV5aauXQ9NWRfvK
	PO0LpJvdMmcBVCG0XJRjbo3CIxHOga4S3CsoJKfwBQZUX7TabqQp+RHDTLxDScn7pvZX
	JQJJst82RAGuP7WBskn7SFc3kk1hnsfenXxthzvB0QS2TTa2aF/IMpqUygBfVchNhuEX
	38TBGqPOgiTeJws29nhEXT246YSaqD0zYWMOQuDoXpusz9bsgxO+lV4hf2apXJmDCQc3
	z9/7Gj2UxCnN5a1pWeORgp9vUtErLKDsxlmXgrJY/D4LwB8EWWFoRLK8wQDfP42tc4zh
	bUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fOwpuOtkYvxoGB09+GCRmf8cRmaFef1oINKKRFnLKtg=;
	b=KnjejcumIbnjgbgeY2UlyM3RwcBaTvge7074dgdI+3g1h3zUFvMfRp/NWF6zEr10+J
	eMc6fKCzZZoL7/VYBEEHNTS9FDdQupbSFB7RJBW80qIiVqtBwUI/diivfswcUxARDogB
	3BcrCZUHsH3F+6rRgUK5U3l9v/IH931cvpGpfUGavEl1vqhvJl3B6il2fxjPzClRFPff
	/VuTt7fMhMCvboUzxI31HKUC9nsSerQNIe37n0BewCzbYTzNhMdrv+F+09y3cnMjCb7v
	iCqzc3ZwY/1R4EGhPsEZtJLcJAVq+q0vPkNsMzceePMMLWHHnIYbrvuyaUg6zYgHbacA
	GPMw==
X-Gm-Message-State: AKaTC02kEfu2CDt3MSUUTymWP9bBhXt0Hn5gq+mKkJPD0Av2c5shpw9IWhD2fdOhSu2z6U9A2t23GdGvP9vpiXjq
X-Received: by 10.237.34.46 with SMTP id n43mr93430187qtc.105.1481641550145;
	Tue, 13 Dec 2016 07:05:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 07:05:29 -0800 (PST)
In-Reply-To: <7b737d7d3b1457c58742e0807c46d2221e5d7647.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<7b737d7d3b1457c58742e0807c46d2221e5d7647.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 15:05:29 +0000
Message-ID: <CAJTo0LbHS4LiztMcKrVf83NMrDdw7D7WFF6PbVDm0EWHg6ztFg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 07/13] selftest: imagefeatures: skip tests in case distro feature is missing
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
X-List-Received-Date: Tue, 13 Dec 2016 15:05:50 -0000
Content-Type: multipart/alternative; boundary=001a11377e1847fd2105438b8e54

--001a11377e1847fd2105438b8e54
Content-Type: text/plain; charset=UTF-8

On 24 November 2016 at 20:58, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> core-image-clutter and core-image-weston, both required opengl in distro
> features, skip relevant tests if this is not the case.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@
> linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/imagefeatures.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/imagefeatures.py
> b/meta/lib/oeqa/selftest/imagefeatures.py
> index d015c49..a61510b 100644
> --- a/meta/lib/oeqa/selftest/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/imagefeatures.py
> @@ -78,6 +78,8 @@ class ImageFeatures(oeSelfTest):
>          """
>
>          # Build a core-image-clutter
> +        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
> +            self.skipTest('opengl not present on DISTRO_FEATURES so
> core-image-clutter cannot be built')
>          bitbake('core-image-clutter')
>

I don't see the point of this test.  Lets save five minutes by just
deleting it.


>      @testcase(1117)
> @@ -96,6 +98,8 @@ class ImageFeatures(oeSelfTest):
>          self.write_config(features)
>
>          # Build a core-image-weston
> +        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
> +            self.skipTest('opengl not present on DISTRO_FEATURES so
> core-image-weston cannot be built')
>          bitbake('core-image-weston')


The full test is:

        features = 'DISTRO_FEATURES_append = " wayland"\n'
        features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
        self.write_config(features)

        # Build a core-image-weston
        bitbake('core-image-weston')

Adding wayland and weston to IMAGE_INSTALL is pointless as thats what the
image does.  Adding wayland is madness if the distro doesn't support it.

Can you rewrite this test so it's basically just "if DISTRO_FEATURES
contains opengl and wayland, build core-image-weston".

Ross

--001a11377e1847fd2105438b8e54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 November 2016 at 20:58,  <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">=
leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">From: Leona=
rdo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.c=
om">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
<br>
core-image-clutter and core-image-weston, both required opengl in distro<br=
>
features, skip relevant tests if this is not the case.<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>=
&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>imagefeatures.py | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/<wbr>imagefeatures.py b/meta/lib/oeqa/s=
elftest/<wbr>imagefeatures.py<br>
index d015c49..a61510b 100644<br>
--- a/meta/lib/oeqa/selftest/<wbr>imagefeatures.py<br>
+++ b/meta/lib/oeqa/selftest/<wbr>imagefeatures.py<br>
@@ -78,6 +78,8 @@ class ImageFeatures(oeSelfTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build a core-image-clutter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;opengl&#39; not in get_bb_var(&#39;DIS=
TRO_FEATURES&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;opengl not pr=
esent on DISTRO_FEATURES so core-image-clutter cannot be built&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;core-image-clutter&#39;)<br>=
</blockquote><div><br></div><div>I don&#39;t see the point of this test.=C2=
=A0 Lets save five minutes by just deleting it.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddin=
g-left:1ex">
=C2=A0 =C2=A0 =C2=A0@testcase(1117)<br>
@@ -96,6 +98,8 @@ class ImageFeatures(oeSelfTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(features)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build a core-image-weston<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;opengl&#39; not in get_bb_var(&#39;DIS=
TRO_FEATURES&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;opengl not pr=
esent on DISTRO_FEATURES so core-image-weston cannot be built&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;core-image-weston&#39;)</blo=
ckquote><div><br></div><div>The full test is:</div><div><br></div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;DISTRO_FEATURES_append =3D &quot=
; wayland&quot;\n&#39;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D =
&#39;CORE_IMAGE_EXTRA_INSTALL +=3D &quot;wayland weston&quot;&#39;</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)</div><div><br></d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build a core-image-weston</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-weston&#39;)</div><div>=
<br></div><div>Adding wayland and weston to IMAGE_INSTALL is pointless as t=
hats what the image does.=C2=A0 Adding wayland is madness if the distro doe=
sn&#39;t support it.</div><div><br></div><div>Can you rewrite this test so =
it&#39;s basically just &quot;if DISTRO_FEATURES contains opengl and waylan=
d, build core-image-weston&quot;.</div><div><br></div><div>Ross</div></div>=
</div></div>

--001a11377e1847fd2105438b8e54--
