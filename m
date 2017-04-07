Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7A295601D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 05:57:39 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id i124so14847917ybc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vgkEo8uyeot7bqd2mMU/2TvHxFKKrEavy1CZEX50NF0=;
	b=YO9D0emV9KRHynYT/zs/LWgfu8ODkjvKROEWDz0uzwg/d2NtmWLdd5WwOVufxRNXa2
	3KGG4uF5Cow70ELdHGC0DYx5Uy5H5f6Hby2h6Ll2cMzR2Pmdnup457NdGioeyYyBgQlB
	9FcTZ3qlASibIDRx/HD5pPLyMdFk8KoSUjDKtwvxmHAq3nC539ljdM6DpOEr4F8BdstT
	p7SmVpTBIMJ4UFeeArgscR6cIVxpeAfDYzA+lExwgSPd8rt7XI2+M3gHgwaffqskjhJE
	XD6fihCmXa+psWtyMli4uu7jKVRABNR72FZeJBC4EdfZjqCQttaoYCoV27l69bFXM7jy
	GxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vgkEo8uyeot7bqd2mMU/2TvHxFKKrEavy1CZEX50NF0=;
	b=pWQH+izBIoCsEfjFtI7XdmvtjeBnDexs2uF86rLZW5kysZFYIFQaQmJeMm66Qmi86G
	WOrd7pqbx0mXfZMS7YlovqE3c0R9WJhDp7bmnioWJs4FuF1VCPkmyCbPDkyMGzLPFjxo
	lnPlprhZr7vKyr4mCqNMk0GCc1KR23O0GaQaapvqejxTd0lFjWB55l3bUcMCvAXNBCh0
	z8WDx8+/aDBunj6T7FEvx6VaciifarcU2GzwCMmv6REilS+3f6MgMV7YGq06LtOyHRts
	Cr08v1aZkP4LpAlNVxBX/vDWCZTHiVq+T9k8TjSlIv4kL7MJIZ6qK+TyK50rpjsNPseA
	1TzQ==
X-Gm-Message-State: AFeK/H0PFM0ZwEGJOnDIm02BOVFQc2Abyqz93uV74q1CwiW8LFwD7aUBl8JbRwn0L1jH6yK8IsECuqeJGfHuxfEU
X-Received: by 10.37.177.165 with SMTP id h37mr24383410ybj.68.1491544661159;
	Thu, 06 Apr 2017 22:57:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 6 Apr 2017 22:57:10 -0700 (PDT)
In-Reply-To: <20170406164151.40269-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170406164151.40269-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Apr 2017 08:57:10 +0300
Message-ID: <CAHiDW_EF2H0urVd7uV4vX9Wfma6LSOvP+nXVOtu2icJA=-M9vQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/recipetool: skip create_git in case x11 feature is not present
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
X-List-Received-Date: Fri, 07 Apr 2017 05:57:42 -0000
Content-Type: multipart/alternative; boundary=f403045ed29cb20e2c054c8d4db3

--f403045ed29cb20e2c054c8d4db3
Content-Type: text/plain; charset=UTF-8

On 6 April 2017 at 19:41, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The unit test requires x11 as distro feature, otherwise it will fail
> while building the test requirements.
>

How about changing the test recipe to something non-x11 instead?


>
> [YOCTO #10903]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@
> linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/recipetool.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/recipetool.py
> b/meta/lib/oeqa/selftest/recipetool.py
> index d47b9dd..7bfb02f 100644
> --- a/meta/lib/oeqa/selftest/recipetool.py
> +++ b/meta/lib/oeqa/selftest/recipetool.py
> @@ -382,6 +382,8 @@ class RecipetoolTests(RecipetoolBase):
>
>      @testcase(1194)
>      def test_recipetool_create_git(self):
> +        if 'x11' not in get_bb_var('DISTRO_FEATURES'):
> +            self.skipTest('Test requires x11 as distro feature')
>          # Ensure we have the right data in shlibs/pkgdata
>          bitbake('libpng pango libx11 libxext jpeg libcheck')
>          # Try adding a recipe
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045ed29cb20e2c054c8d4db3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 6 April 2017 at 19:41,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leon=
ardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval=
.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">From: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonz=
alez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&g=
t;<br>
<br>
The unit test requires x11 as distro feature, otherwise it will fail<br>
while building the test requirements.<br></blockquote><div><br></div><div>H=
ow about changing the test recipe to something non-x11 instead?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
[YOCTO #10903]<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>=
&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>recipetool.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/<wbr>recipetool.py b/meta/lib/oeqa/self=
test/<wbr>recipetool.py<br>
index d47b9dd..7bfb02f 100644<br>
--- a/meta/lib/oeqa/selftest/<wbr>recipetool.py<br>
+++ b/meta/lib/oeqa/selftest/<wbr>recipetool.py<br>
@@ -382,6 +382,8 @@ class RecipetoolTests(<wbr>RecipetoolBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0@testcase(1194)<br>
=C2=A0 =C2=A0 =C2=A0def test_recipetool_create_git(<wbr>self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;x11&#39; not in get_bb_var(&#39;DISTRO=
_FEATURES&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;Test requires=
 x11 as distro feature&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ensure we have the right data in shlibs=
/pkgdata<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;libpng pango libx11 libxext =
jpeg libcheck&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Try adding a recipe<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--f403045ed29cb20e2c054c8d4db3--
