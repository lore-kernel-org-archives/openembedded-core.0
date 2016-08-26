Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id C91A373191
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 18:15:11 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l89so62241811lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j+G1ZSVaZvyzu1XM2TvzthIXrTKUMsv/XbhqB9cnHsI=;
	b=dglNVAo4azgj4dNxv3sPVtLZpVNc1oHGldAZeUG8qMJ1/ANqx73vI5Y3EEksiS+pu6
	JidCAjboEbEkSbSrmciXMeDBNt8LqBhXTo1z7p/r6TKbemu9q9mekYR2RZiAejxrxRNz
	iWrksLs9KuzyArdzzTG3GRsd1f1OniNstC2PLfA3rN16ZHuehvceb0kquhtIK1th0Nng
	36+AsHjQDZEgxGTBJjTLPjYYjm8DnLYPwyzGb4fYLH/uWrGJXygqjjkt+ddKepm1kuSH
	Ola1DtmoiHSkuo9RinT3y1aum58FrVBAJSam77MMBtZFPfHlnoAeoAJkH4nK1r8kbWuM
	IAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j+G1ZSVaZvyzu1XM2TvzthIXrTKUMsv/XbhqB9cnHsI=;
	b=lV9yiBkvMZZNqzXObHdIvYLQdCqsLFCJ115KjMrdUnga220ExxLgLuDabpg33Lc+X8
	Y4Rupu1tAwYvIqxNvhzwYlkOrTfGSKWuodV1GMdVzWOOQQU2sn3jQ5+HhI7Y0NDtRmVm
	2IvGtXubdQ+Yizef8NMXZQ2eQ8ulFNQ+aPLkjeDoCdWMzVq+3drUf2kEmX4ybKIHZzYv
	cZZ+KhfLWD4deiHHubNy23l+R1KR6/p1avc8Psda60FsfeeIyC5qeWSyn6kV1vcQmHJn
	5MZHM7/zUrT2oo4TIIeHUbVxnACnpayv6dmELAtzJz4WDcuqwrTDz6w88+44GHOCDh7b
	FPbA==
X-Gm-Message-State: AE9vXwPM8aDyRyK3Hcci/FC+BlZ7sHw72Nb6MzrgXz8lPLwXYtkbiyIppQkbRri/tMkCo/DXCz1ZPRoNw6GtMw==
X-Received: by 10.25.139.214 with SMTP id n205mr1806349lfd.84.1472235311410;
	Fri, 26 Aug 2016 11:15:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Fri, 26 Aug 2016 11:14:40 -0700 (PDT)
X-Originating-IP: [177.127.4.56]
In-Reply-To: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
References: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 26 Aug 2016 15:14:40 -0300
Message-ID: <CAAPZna3477dZ6jJDGSuJWMjJX14cUDTtKxzOmpnOm-OZ6smszQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Fri, 26 Aug 2016 18:15:14 -0000
Content-Type: multipart/alternative; boundary=001a113fb9f4c34e8c053afd7e9a

--001a113fb9f4c34e8c053afd7e9a
Content-Type: text/plain; charset=UTF-8

Hi Ricardo,

Are you using krogoth branch? If yes, look here:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/python/python-3.5-manifest.inc?h=krogoth#n122

It's missing ${libdir}/python3.5/operator.*

You don't need to add misc package to core.

Fabio.

On Fri, Aug 26, 2016 at 12:30 PM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Fixes:
>
> root@qt5022:~# python3
> Python 3.5.1 (default, Aug  5 2016, 13:25:54)
> [GCC 5.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import collections
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.5/collections/__init__.py", line 10, in <module>
>     from operator import itemgetter as _itemgetter, eq as _eq
> ImportError: No module named 'operator'
> >>>
>
> root@qt5022:~# dpkg -S /usr/lib/python3.5/collections/__init__.py
> python3-core: /usr/lib/python3.5/collections/__init__.py
>
> Reported-by: Dimitrios Katsaros <patcherwork@gmail.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> v2: also hack the generate file
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 304611432e37..fb05d6d36df3 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -38,7 +38,7 @@ RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs
> ${PN}-importlib ${PN}-thread
>  FILES_${PN}-compression="${libdir}/python3.5/gzip.*
> ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.*
> ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so
> "
>
>  SUMMARY_${PN}-core="Python interpreter and core modules"
> -RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs
> ${PN}-io ${PN}-math"
> +RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs
> ${PN}-io ${PN}-math ${PN}-misc"
>  FILES_${PN}-core="${libdir}/python3.5/__future__.*
> ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.*
> ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.*
> ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/configparser.*
> ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.*
> ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.*
> ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.*
> ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.*
> ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.*
> ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.*
> ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so
> ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so
> ${libdir}/python3.5/lib-dynload/xreadlines.*.so
> ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.*
> ${bindir}/python* ${libdir}/python3.5/_weakrefset.*
> ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.*
> ${libdir}/python
>  3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h
> ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.*
> ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py
> "
>
>  SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py
> b/scripts/contrib/python/generate-manifest-3.5.py
> index 2906cc66d042..1cac9a7fe1c6 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -166,7 +166,7 @@ if __name__ == "__main__":
>      # Parameters: revision, name, description, dependencies, filenames
>      #
>
> -    m.addPackage( "${PN}-core", "Python interpreter and core modules",
> "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
> +    m.addPackage( "${PN}-core", "Python interpreter and core modules",
> "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math
> ${PN}-misc",
>      "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* configparser.* "
> +
>      "genericpath.* getopt.* linecache.* new.* " +
>      "os.* posixpath.* struct.* " +
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fb9f4c34e8c053afd7e9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ricardo,<br><br>Are you using krogoth branch? If yes, l=
ook here:<br><a href=3D"http://cgit.openembedded.org/openembedded-core/tree=
/meta/recipes-devtools/python/python-3.5-manifest.inc?h=3Dkrogoth#n122">htt=
p://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/pyth=
on/python-3.5-manifest.inc?h=3Dkrogoth#n122</a><br><br>It&#39;s missing ${l=
ibdir}/python3.5/operator.*<br><br>You don&#39;t need to add misc package t=
o core.<br><br>Fabio.<div class=3D"gmail_default" style=3D"font-family:mono=
space,monospace;font-size:small"><code><span class=3D""></span></code></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Au=
g 26, 2016 at 12:30 PM, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">Fixes:<br>
<br>
root@qt5022:~# python3<br>
Python 3.5.1 (default, Aug=C2=A0 5 2016, 13:25:54)<br>
[GCC 5.3.0] on linux<br>
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.<br>
&gt;&gt;&gt; import collections<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
=C2=A0 File &quot;/usr/lib/python3.5/<wbr>collections/__init__.py&quot;, li=
ne 10, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from operator import itemgetter as _itemgetter, eq as _eq<br>
ImportError: No module named &#39;operator&#39;<br>
&gt;&gt;&gt;<br>
<br>
root@qt5022:~# dpkg -S /usr/lib/python3.5/<wbr>collections/__init__.py<br>
python3-core: /usr/lib/python3.5/<wbr>collections/__init__.py<br>
<br>
Reported-by: Dimitrios Katsaros &lt;<a href=3D"mailto:patcherwork@gmail.com=
">patcherwork@gmail.com</a>&gt;<br>
Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribald=
a@gmail.com">ricardo.ribalda@gmail.com</a>&gt;<br>
---<br>
<br>
</span>v2: also hack the generate file<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 2 +-<br>
=C2=A0scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">generat<wbr>e-manifest-3.5.py</a>=C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<span class=3D""><br>
diff --git a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc b/me=
ta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
index 304611432e37..fb05d6d36df3 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-3.5-manifest.inc<br>
@@ -38,7 +38,7 @@ RDEPENDS_${PN}-compression=3D&quot;${<wbr>PN}-core ${PN}-=
codecs ${PN}-importlib ${PN}-thread<br>
=C2=A0FILES_${PN}-compression=3D&quot;${<wbr>libdir}/python3.5/gzip.* ${lib=
dir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/=
lib-<wbr>dynload/bz2.*.so ${libdir}/python3.5/lib-<wbr>dynload/zlib.*.so &q=
uot;<br>
<br>
=C2=A0SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&quot;<=
br>
-RDEPENDS_${PN}-core=3D&quot;${PN}-<wbr>lang ${PN}-re ${PN}-reprlib ${PN}-c=
odecs ${PN}-io ${PN}-math&quot;<br>
+RDEPENDS_${PN}-core=3D&quot;${PN}-<wbr>lang ${PN}-re ${PN}-reprlib ${PN}-c=
odecs ${PN}-io ${PN}-math ${PN}-misc&quot;<br>
=C2=A0FILES_${PN}-core=3D&quot;${libdir}/<wbr>python3.5/__future__.* ${libd=
ir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.*=
 ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3=
.5/<wbr>configparser.* ${libdir}/python3.5/<wbr>genericpath.* ${libdir}/pyt=
hon3.5/getopt.* ${libdir}/python3.5/linecache.<wbr>* ${libdir}/python3.5/ne=
w.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.<wbr>* ${libdir}=
/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site=
.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/pyth=
on3.5/UserList.* ${libdir}/python3.5/<wbr>UserString.* ${libdir}/python3.5/=
lib-<wbr>dynload/binascii.*.so ${libdir}/python3.5/lib-<wbr>dynload/_struct=
.*.so ${libdir}/python3.5/lib-<wbr>dynload/time.*.so ${libdir}/python3.5/li=
b-<wbr>dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python=
3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_<wbr>weakrefset.* ${l=
ibdir}/python3.5/sysconfig.<wbr>* ${libdir}/python3.5/_<wbr>sysconfigdata.*=
 ${libdir}/python<br>
=C2=A03.5/config/Makefile ${includedir}/python${PYTHON_<wbr>BINABI}/pyconfi=
g*.h ${libdir}/python${PYTHON_<wbr>MAJMIN}/collections ${libdir}/python${PY=
THON_<wbr>MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_<wbr>MAJMIN}/=
_sitebuiltins.* ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py &quo=
t;<br>
<br>
=C2=A0SUMMARY_${PN}-crypt=3D&quot;Python basic cryptographic and hashing su=
pport&quot;<br>
</span>diff --git a/scripts/contrib/python/<a href=3D"http://generate-manif=
est-3.5.py" rel=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-3.5=
.py</a> b/scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py=
" rel=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-3.5.py</a><br=
>
index 2906cc66d042..1cac9a7fe1c6 100755<br>
--- a/scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-3.5.py</a><br>
+++ b/scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-3.5.py</a><br>
@@ -166,7 +166,7 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0# Parameters: revision, name, description, dependencies=
, filenames<br>
=C2=A0 =C2=A0 =C2=A0#<br>
<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-core&quot;, &quot;Python interpret=
er and core modules&quot;, &quot;${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-co=
decs ${PN}-io ${PN}-math&quot;,<br>
+=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-core&quot;, &quot;Python interpret=
er and core modules&quot;, &quot;${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-co=
decs ${PN}-io ${PN}-math ${PN}-misc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;__future__.* _abcoll.* abc.* ast.* copy.* copyreg=
.* configparser.* &quot; +<br>
=C2=A0 =C2=A0 =C2=A0&quot;genericpath.* getopt.* linecache.* new.* &quot; +=
<br>
=C2=A0 =C2=A0 =C2=A0&quot;os.* posixpath.* struct.* &quot; +<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
2.9.3<br>
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

--001a113fb9f4c34e8c053afd7e9a--
