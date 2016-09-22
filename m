Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id E649A60616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 07:59:05 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 186so74444402itf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+l8Krfo1F3zQja/2zauzXt6rjoUH1URZMfC16D58aKI=;
	b=slcC3tR10fVPqMuiyY3SfPnqCO+JRrsfQP8ETFa7gFbjWtAYeumyUZTz5PUTEXXNQn
	Jq61phsm5HbuzG2I1jpadVTmFkwN/+csFDH9YfamFpeGIiZLoXnJ7JVbxJ6azB363K2r
	iRRiWZn8xEahowfRv8aw75TRLDwztS7LEiKyQDJV5HXnb1BdT+q5LamroEd+tTA8dbGR
	GzFqNGujsEYbAcHxQjcUkXcHeuxSK5zbcmNIAiPBKWM9fL2jeGvGnMbfdSg7CvTl0e6G
	Y+2ENh5FLZGFGrW85U+NfGim1o46wSKIVyYfigTuPQlRrZ8sUDlcrkeAG2awsxk940Uh
	vdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+l8Krfo1F3zQja/2zauzXt6rjoUH1URZMfC16D58aKI=;
	b=bJMQE04ahophZRiP0jpabDyUHSL9yaU+Pj3zxlRQAnSZ2iEneSvxop+m/DUM7FBQuO
	v8uV5EMLz5LYomFHyQfXXbs7EGIf9gt8S40X7V6VPVaYIXx7SbOrK2HCYLVemU6DQjO9
	PdU5cBw4LyuMw3W3Q6rvXASo9BkxDO3fKkn6HUwCUdTIqRT6NSY+UsgjxWzkwc8CDPBg
	IXOeBe0GmaDeiWHENxq+34zuvuFavRCdv9AGe5oRM5MTRzUiE8sZX4b7mgl2RNKvPcvN
	7cmPrIL3TQVW++I8AaS2TMpAU2kaKzCd9ktSHv06pE1UO6EZRM1oaotJ+JgftDDz33Jp
	N3lQ==
X-Gm-Message-State: AE9vXwPACkn0JDZpicecjd1yCBopWJb7e5E6h5GWIKLxcIqUFFIZmxG+oRvXRyLBd4X5Ugh80Fu+m/0vf0m9yVwa
X-Received: by 10.36.121.206 with SMTP id z197mr9740055itc.22.1474531146760;
	Thu, 22 Sep 2016 00:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 22 Sep 2016 00:58:46 -0700 (PDT)
In-Reply-To: <C43D7C6FFC265C429F44FEB1C68F1B25633E1761@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1472708151-1708-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<C43D7C6FFC265C429F44FEB1C68F1B25633E1761@G08CNEXMBPEKD03.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Sep 2016 08:58:46 +0100
Message-ID: <CAJTo0LYY6H_X6oS_3MBZZ6StPo=0TF+ANB=Wo3e=4ELkEJEXhg@mail.gmail.com>
To: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ruby: 2.2.5 -> 2.3.1
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
X-List-Received-Date: Thu, 22 Sep 2016 07:59:06 -0000
Content-Type: multipart/alternative; boundary=001a114aa82036b28b053d140901

--001a114aa82036b28b053d140901
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This upgrade missed the M3 window which was the last time that upgrades are
acceptable, so it will have to wait until after the 2.2 release.

Ross

On 22 September 2016 at 02:39, Wang, Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> ping
>
> -----Original Message-----
> From: Wang, Xin/=E7=8E=8B =E9=91=AB
> Sent: Thursday, September 01, 2016 1:36 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Wang, Xin/=E7=8E=8B =E9=91=AB
> Subject: [OE-core][PATCH] ruby: 2.2.5 -> 2.3.1
>
> 1) Upgrade ruby from 2.2.5 to 2.3.1.
> 2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But th=
e
> LICENSE has not been changed.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc                         | 2 +-
>  meta/recipes-devtools/ruby/{ruby_2.2.5.bb =3D> ruby_2.3.1.bb} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)  rename
> meta/recipes-devtools/ruby/{ruby_2.2.5.bb =3D> ruby_2.3.1.bb} (89%)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc
> b/meta/recipes-devtools/ruby/ruby.inc
> index fde67e9..f38ebb0 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING;md5=3D837b32593517ae48b9c3b5c87a5d288c \
>      file://BSDL;md5=3D19aaf65c88a40b508d17ae4be539c4b5\
>      file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263\
> -    file://LEGAL;md5=3Dc440adb575ba4e6e2344c2630b6a5584\
> +    file://LEGAL;md5=3D78e8a29b8cc93e042990dbbb5572b1e1\
>  "
>
>  DEPENDS =3D "ruby-native zlib openssl tcl libyaml db gdbm readline"
> diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
> similarity index 89%
> rename from meta/recipes-devtools/ruby/ruby_2.2.5.bb
> rename to meta/recipes-devtools/ruby/ruby_2.3.1.bb
> index 5a64582..f9f5b33 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
> @@ -1,7 +1,7 @@
>  require ruby.inc
>
> -SRC_URI[md5sum] =3D "bd8e349d4fb2c75d90817649674f94be"
> -SRC_URI[sha256sum] =3D "30c4b31697a4ca4ea0c8db8ad30cf4
> 5e6690a0f09687e5d483c933c03ca335e3"
> +SRC_URI[md5sum] =3D "0d896c2e7fd54f722b399f407e48a4c6"
> +SRC_URI[sha256sum] =3D "b87c738cb2032bf4920fef8e3864dc
> 5cf8eae9d89d8d523ce0236945c5797dcd"
>
>  # it's unknown to configure script, but then passed to extconf.rb  #
> maybe it's not really needed as we're hardcoding the result with
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114aa82036b28b053d140901
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This upgrade missed the M3 window which was the last time =
that upgrades are acceptable, so it will have to wait until after the 2.2 r=
elease.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On 22 September 2016 at 02:39, Wang, Xin <span di=
r=3D"ltr">&lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"=
_blank">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">ping<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
-----Original Message-----<br>
From: Wang, Xin/=E7=8E=8B =E9=91=AB<br>
Sent: Thursday, September 01, 2016 1:36 PM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Wang, Xin/=E7=8E=8B =E9=91=AB<br>
Subject: [OE-core][PATCH] ruby: 2.2.5 -&gt; 2.3.1<br>
<br>
1) Upgrade ruby from 2.2.5 to 2.3.1.<br>
2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the =
LICENSE has not been changed.<br>
<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/ruby/<wbr>ruby.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-devtools/ruby/{<a href=3D"http://ruby_2.2.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">ru<wbr>by_2.2.5.bb</a> =3D&gt; <a href=3D"http=
://ruby_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">ruby_2.3.1.bb</a>} |=
 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)=C2=A0 rename meta/re=
cipes-devtools/ruby/{<a href=3D"http://ruby_2.2.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ru<wbr>by_2.2.5.bb</a> =3D&gt; <a href=3D"http://ruby_2.3.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ruby_2.3.1.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-devtools/ruby/<wbr>ruby.inc b/meta/recipes-devtoo=
ls/ruby/<wbr>ruby.inc<br>
index fde67e9..f38ebb0 100644<br>
--- a/meta/recipes-devtools/ruby/<wbr>ruby.inc<br>
+++ b/meta/recipes-devtools/ruby/<wbr>ruby.inc<br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D<wbr>837b32593517ae48b9c3b5c87a5d2=
8<wbr>8c \<br>
=C2=A0 =C2=A0 =C2=A0file://BSDL;md5=3D<wbr>19aaf65c88a40b508d17ae4be539c4<w=
br>b5\<br>
=C2=A0 =C2=A0 =C2=A0file://GPL;md5=3D<wbr>b234ee4d69f5fce4486a80fdaf4a42<wb=
r>63\<br>
-=C2=A0 =C2=A0 file://LEGAL;md5=3D<wbr>c440adb575ba4e6e2344c2630b6a55<wbr>8=
4\<br>
+=C2=A0 =C2=A0 file://LEGAL;md5=3D<wbr>78e8a29b8cc93e042990dbbb5572b1<wbr>e=
1\<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;ruby-native zlib openssl tcl libyaml db gdbm readli=
ne&quot;<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.5.bb" re=
l=3D"noreferrer" target=3D"_blank">r<wbr>uby_2.2.5.bb</a> b/meta/recipes-de=
vtools/ruby/<a href=3D"http://ruby_2.3.1.bb" rel=3D"noreferrer" target=3D"_=
blank">r<wbr>uby_2.3.1.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">rub<wbr>y_2.2.5.bb</a><br>
rename to meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rub<wbr>y_2.3.1.bb</a><br>
index 5a64582..f9f5b33 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.5.bb" rel=3D"no=
referrer" target=3D"_blank">r<wbr>uby_2.2.5.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.3.1.bb" rel=3D"no=
referrer" target=3D"_blank">r<wbr>uby_2.3.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require ruby.inc<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>bd8e349d4fb2c75d90817649674f94<wbr>be&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>30c4b31697a4ca4ea0c8db8ad30cf4<wbr>5e669=
0a0f09687e5d483c933c03ca3<wbr>35e3&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>0d896c2e7fd54f722b399f407e48a4<wbr>c6&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>b87c738cb2032bf4920fef8e3864dc<wbr>5cf8e=
ae9d89d8d523ce0236945c579<wbr>7dcd&quot;<br>
<br>
=C2=A0# it&#39;s unknown to configure script, but then passed to extconf.rb=
=C2=A0 # maybe it&#39;s not really needed as we&#39;re hardcoding the resul=
t with<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114aa82036b28b053d140901--
