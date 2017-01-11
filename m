Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 17F5A71AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 17:28:08 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s140so193349563qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7qVP4pWVPoyH673ri02XXEFGFopypjRxyaceD/NA88Y=;
	b=qM0K3bsarxeI573FnZwePr5iaCz4B4qBFTMgn+InBiYNs/Hl+wPnqn9Wyi+Ubqh0IX
	HXQ1EkwfJndM+BHYaHQF0V+hJHSxWnWLU5KdMtFunL+GiRJwMiWwMi6UppARCi1K7SKJ
	7gsG3b3nz3jDGBv3gVsxiVK4YOVhU9MGX/Wb9SdqtGpWWXq4d/bxdpX5u+iVA9hsLpKL
	GmhTVZSzXDCck5W8AL0LdqayGWZ+MEM08owLDiKjywbYnGy1076guqGAGcsQV+bmMW9S
	sNiQJgBpA53s7Snj5pB30AeUWFjW8Wz4UX8j2uBAM1fekhOdPGvPjifhaMTaeIAUOChd
	yxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7qVP4pWVPoyH673ri02XXEFGFopypjRxyaceD/NA88Y=;
	b=QprFbhKYLuxDgXX/eavd/b/SR1wiI0eg7rhWcUtb+9RCPpUFbSzAHoluJcspSZgRUd
	6PUsXOypMSOW7qn7rlHTHwXk+fA1AQt2D8X+0/8Wx/qMgDCquLgfh5KXp0kLtLcNO9ji
	UBmlrwTBtMKBkLJY79kwBc9MPMGAekckdXrqq266LZVxWAUWao6YCihlSezh4MkRiE+2
	K6khKNFFbVMp/UU/WI/DpKC8FgGjq25E6t6CGuArI/3ExhRuD936DG5ONcdYP6jyFJvg
	7uTeTfRpnQ0HTi9UqAi7+IQ214sdZn+pWBjQkgLQ3dVQco4H9byLLMT8+9j6vK3BPQqA
	GWtA==
X-Gm-Message-State: AIkVDXI9wn0UmuMc4utsF1aXyxl45ZHvJ+drHuddB2epxDDdsDFkx7+ix07POgnhe6YPIMLXg7HjZEJC+9ft14Ll
X-Received: by 10.55.15.231 with SMTP id 100mr8717690qkp.244.1484155688523;
	Wed, 11 Jan 2017 09:28:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 09:27:48 -0800 (PST)
In-Reply-To: <bd50489338d4e001bc7f5511db02792b311a3672.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bd50489338d4e001bc7f5511db02792b311a3672.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 17:27:48 +0000
Message-ID: <CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/4] selftest: imagefeatures: skip tests based on distro features and supported fstypes
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
X-List-Received-Date: Wed, 11 Jan 2017 17:28:10 -0000
Content-Type: multipart/alternative; boundary=001a114760329b51500545d4eccd

--001a114760329b51500545d4eccd
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 17:45, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +++ b/meta/lib/oeqa/selftest/imagefeatures.py
> @@ -77,6 +77,9 @@ class ImageFeatures(oeSelfTest):
>          AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
>          """
>
> +        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
> +            self.skipTest('opengl not present on DISTRO_FEATURES so
> core-image-clutter cannot be built')
> +
>          # Build a core-image-clutter
>          bitbake('core-image-clutter')
>

This test is pretty pointless, lets just delete it.


> @@ -91,6 +94,10 @@ class ImageFeatures(oeSelfTest):
>          AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
>          """
>
> +        distro_features = get_bb_var('DISTRO_FEATURES')
> +        if not ('opengl' in distro_features and 'wayland' in
> distro_features):
> +            self.skipTest('neither opengl nor wayland present on
> DISTRO_FEATURES so core-image-weston cannot be built')
> +
>          features = 'DISTRO_FEATURES_append = " wayland"\n'
>          features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
>          self.write_config(features)
>

This test is 90% nonsense, let's fix it whilst we're here.  After checking
that opengl and wayland are in DISTRO_FEATURES it can just build
core-image-weston: DISTRO_FEATURES doesn't need appending as it already has
wayland in, and CORE_IMAGE_EXTRA_INSTALL doesn't need extending as
core-image-weston obviously already contains weston.

Ross

--001a114760329b51500545d4eccd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 17:45,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonar=
do.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.g=
onzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":4lo" class=3D"a3s aXjCH m15984507a75cf04f">+++ b/meta/lib/=
oeqa/selftest/<wbr>imagefeatures.py<br>
@@ -77,6 +77,9 @@ class ImageFeatures(oeSelfTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AutomatedBy: Daniel Istrate &lt;<a href=
=3D"mailto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@<=
wbr>intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;opengl&#39; not in get_bb_var(&#39;DIS=
TRO_FEATURES&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;opengl not pr=
esent on DISTRO_FEATURES so core-image-clutter cannot be built&#39;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build a core-image-clutter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;core-image-clutter&#39;)<br>=
</div></blockquote><div><br></div><div>This test is pretty pointless, lets =
just delete it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":4lo" class=3D"a3s aXjCH m15984507a75cf04f">
@@ -91,6 +94,10 @@ class ImageFeatures(oeSelfTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AutomatedBy: Daniel Istrate &lt;<a href=
=3D"mailto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@<=
wbr>intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 distro_features =3D get_bb_var(&#39;DISTRO_FEA=
TURES&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (&#39;opengl&#39; in distro_features an=
d &#39;wayland&#39; in distro_features):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;neither openg=
l nor wayland present on DISTRO_FEATURES so core-image-weston cannot be bui=
lt&#39;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D &#39;DISTRO_FEATURES_append =
=3D &quot; wayland&quot;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features +=3D &#39;CORE_IMAGE_EXTRA_INSTA=
LL +=3D &quot;wayland weston&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(features)</div></blockq=
uote></div><br></div><div class=3D"gmail_extra">This test is 90% nonsense, =
let&#39;s fix it whilst we&#39;re here.=C2=A0 After checking that opengl an=
d wayland are in DISTRO_FEATURES it can just build core-image-weston: DISTR=
O_FEATURES doesn&#39;t need appending as it already has wayland in, and COR=
E_IMAGE_EXTRA_INSTALL doesn&#39;t need extending as core-image-weston obvio=
usly already contains weston.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114760329b51500545d4eccd--
