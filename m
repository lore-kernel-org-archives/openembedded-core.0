Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC14788E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 14:51:01 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id l12so4668719ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hjbsVykr5weJQjlOH5iAoWBpC8xliZafTQarEW9WNUA=;
	b=SJB3FY/Yz6BbG2UkOrE6RELFzYlyUHqdGRfo4CKVBwieNlJKub5U2Dhms8b6gVZ2Ft
	atOimLaDJ8+/2HKKwOBk+gBwcVq9qStm/UZSiDkVfN60AB84UkFns2sYqQeeicUg4ti5
	4429D1hzbcD6KNhMwTTyvKrCF4b4dJNwpMOAlgAtjO6obKXGLvxkY/05V6s5yaGTHNhf
	/G7D7Zy/vNWKFoU7XpX46unFNxeFHvtNvHR7604WMAxHahZhp0hPxItLBeJI0O/BlP+T
	ECAaZm6VKvDs85y2Enz1mcsNfKI1acuCGaTgnHORcNo0JXyaPmZ1GkIekPr8KoICxQrN
	2U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hjbsVykr5weJQjlOH5iAoWBpC8xliZafTQarEW9WNUA=;
	b=l7Z+V8OaJnfbnmIs0LWaKs8DcjMdKe0a2UfLBaxoDLrCFM5cUhmlbfJsUxRApq+OVh
	5GD5EQvZFFuKBUU+KKIi87VOCmiGOnjH2/ewj5UdHorQp0MFX29BUBEBhtza7123NCkg
	t+7bRpfxgqmbn/v7kKgVxi8gbXl9pJBZZOrcwl7V/7XJXblHPESY4uFJnMYvTG2BcquM
	w1NchE3bd1f4BLxwl6Bg8NZNWca1NhYVraNPiNow9cobGDunK0gjsfYyB8kvHxsUKDsw
	zG/VKU62Hw8qV78xbq+j4jS62p1lor6EuvhhRaDwPdZqt520+CJBNgBo6aT0nvBtmOrY
	BHFg==
X-Gm-Message-State: AElRT7GSOTFiedvN2iXn0K+j40VrG1zwSs2Chiwkj151omZNVeAciJig
	anc+kg4Wz7vGlY/h7a/g59Fu6xoN/Je15WfXpB83hA==
X-Google-Smtp-Source: AG47ELvwv38DeYQ27qvvepLTqxNICL4Aisjh9eWxLZ9Pc1+TgP7v0xsoW1dXfCqb9g7+UtUriRg3bP5LvX8jGlYhP5o=
X-Received: by 10.107.37.212 with SMTP id l203mr4964984iol.20.1521039062557;
	Wed, 14 Mar 2018 07:51:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 07:50:42 -0700 (PDT)
In-Reply-To: <1520910506-1642-2-git-send-email-jason.wessel@windriver.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
	<1520910506-1642-2-git-send-email-jason.wessel@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 14:50:42 +0000
Message-ID: <CAJTo0La0oaau5ugOzT=k9fdGQx3PpgsPQxm+KGiGJyU06kwoKg@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] boost: Fix link problems with caffe and Movidius SDK
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
X-List-Received-Date: Wed, 14 Mar 2018 14:51:01 -0000
Content-Type: multipart/alternative; boundary="001a11405f1603a2c0056760819a"

--001a11405f1603a2c0056760819a
Content-Type: text/plain; charset="UTF-8"

I thought that boost_python was the py2 binary, and boost_python3 was the
py3 one?  Is this not a bug in caffe?

On 13 March 2018 at 03:08, Jason Wessel <jason.wessel@windriver.com> wrote:

> When using an image built with the Yocto Project which has a compiler
> and all the required libraries, projects such as caffe for the
> Movidius SDK which use python3 and boost fail to build because they
> look for libboost_python.so.  The error that cmake returns doesn't
> even point to the fact that this is why the configuration fails.
>
> Example showing the problem with the missing symlink:
> ================
>   git clone https://github.com/weiliu89/caffe.git
>   cd caffe
>   mkdir build
>   cd build
>   cmake -DBLAS=Open ..
>
> -- Configuring done
> CMake Error at CMakeLists.txt:85 (add_dependencies):
>   The dependency target "pycaffe" of target "pytest" does not exist.
> ================
>
> Conditionally creating the link when building python3 support into
> boost is all that is needed.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-support/boost/boost.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/boost/boost.inc
> b/meta/recipes-support/boost/boost.inc
> index 0461ec6..c53edf7 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -195,6 +195,9 @@ do_install() {
>                 fi
>         done
>
> +       if [ -e ${D}${libdir}/libboost_python3.so ]; then
> +               ln -s libboost_python3.so ${D}${libdir}/libboost_python.so
> +       fi
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11405f1603a2c0056760819a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I thought that boost_python was the py2 binary, and boost_=
python3 was the py3 one?=C2=A0 Is this not a bug in caffe?</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 March 2018 at 03:08, =
Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriver=
.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">When using an image built with the Yocto Pr=
oject which has a compiler<br>
and all the required libraries, projects such as caffe for the<br>
Movidius SDK which use python3 and boost fail to build because they<br>
look for libboost_python.so.=C2=A0 The error that cmake returns doesn&#39;t=
<br>
even point to the fact that this is why the configuration fails.<br>
<br>
Example showing the problem with the missing symlink:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 git clone <a href=3D"https://github.com/weiliu89/caffe.git" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/weiliu89/<wbr>caffe.git</a>=
<br>
=C2=A0 cd caffe<br>
=C2=A0 mkdir build<br>
=C2=A0 cd build<br>
=C2=A0 cmake -DBLAS=3DOpen ..<br>
<br>
-- Configuring done<br>
CMake Error at CMakeLists.txt:85 (add_dependencies):<br>
=C2=A0 The dependency target &quot;pycaffe&quot; of target &quot;pytest&quo=
t; does not exist.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Conditionally creating the link when building python3 support into<br>
boost is all that is needed.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/boost/<wbr>boost.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/boost/<wbr>boost.inc b/meta/recipes-suppo=
rt/boost/<wbr>boost.inc<br>
index 0461ec6..c53edf7 100644<br>
--- a/meta/recipes-support/boost/<wbr>boost.inc<br>
+++ b/meta/recipes-support/boost/<wbr>boost.inc<br>
@@ -195,6 +195,9 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${D}${libdir}/libboost_<wbr>python3.so =
]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s libboost_pyth=
on3.so ${D}${libdir}/libboost_python.<wbr>so<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a11405f1603a2c0056760819a--
