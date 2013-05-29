Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 024876A499
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 17:41:24 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id 17so5001923iea.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OSHtIZNYOv4AJb1ojymDfqIYV6Kpb0D0Q8hTuvbjdrg=;
	b=Y9TsdlfsyGcqNxda3NPi80/yggdDqAg1MAlUIMYXvGOSvFYeCNU2NZQSWUQYTjjTfr
	K/wDxQUnIlZ9QnCsetoWRve50G2vXVicBdCKCT2pFBhoj1Etl45Mx4i4zvVi5QNpGKSR
	uk4GIScO11cs7Z3jGN9jcfdVwU0SMTiSATAB/K7owCiWgrb6jilScFtN3sZwp9jNsEIj
	/ll2GIBEyh8CRKvxvZGfWmHd9X2sOyHgIu89IiBU7o48+sF9Lsvq0vFLjmfFYLD5cQTB
	lKDQic0OjVp0cPy6zv1YEisszK8Vk6vxox6fhYSAqVj0mrKSYqlnKTyy7IMAc1pP8jgz
	/nrg==
MIME-Version: 1.0
X-Received: by 10.50.7.97 with SMTP id i1mr8711883iga.82.1369849285830; Wed,
	29 May 2013 10:41:25 -0700 (PDT)
Received: by 10.50.108.45 with HTTP; Wed, 29 May 2013 10:41:25 -0700 (PDT)
In-Reply-To: <1369842682-11880-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1369842682-11880-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 29 May 2013 10:41:25 -0700
Message-ID: <CAMKF1sotc9HtmKM8ZAE1k3Z1P8qf7G44T31X4T-Zbo1PcWWS4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-smartpm: add gettext-native to DEPENDS
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
X-List-Received-Date: Wed, 29 May 2013 17:41:25 -0000
Content-Type: multipart/alternative; boundary=089e0122f7d413f1d404dddee401

--089e0122f7d413f1d404dddee401
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 29, 2013, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:
> Fixes the following failure at do_install if gettext-native has not
> already been built and gettext tools are not installed on the host:
>
> | compiling locale/it/LC_MESSAGES/smart.po ->
locale/it/LC_MESSAGES/smart.mo
> | sh: msgfmt: command not found
> ...
> | creating $D/usr/share/share/locale/it/LC_MESSAGES
> | error: can't copy 'locale/it/LC_MESSAGES/smart.mo': doesn't exist or
not a regular file
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bbb/meta/recipes-devtools/python/
python-smartpm_1.4.1.bb
> index cfa2dba..0cf3847 100644
> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> @@ -8,7 +8,7 @@ SECTION = "devel/python"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>
> -DEPENDS = "python rpm"
> +DEPENDS = "python rpm gettext-native"

Why not inherit gettext ?


>  PR = "r9"
>  SRCNAME = "smart"
>
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0122f7d413f1d404dddee401
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 29, 2013, Paul Eggleton &lt;<a href=3D"mailto:pau=
l.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br=
>&gt; Fixes the following failure at do_install if gettext-native has not<b=
r>
&gt; already been built and gettext tools are not installed on the host:<br=
>&gt;<br>&gt; | compiling locale/it/LC_MESSAGES/smart.po -&gt; locale/it/LC=
_MESSAGES/smart.mo<br>&gt; | sh: msgfmt: command not found<br>&gt; ...<br>
&gt; | creating $D/usr/share/share/locale/it/LC_MESSAGES<br>&gt; | error: c=
an&#39;t copy &#39;locale/it/LC_MESSAGES/smart.mo&#39;: doesn&#39;t exist o=
r not a regular file<br>&gt;<br>&gt; Signed-off-by: Paul Eggleton &lt;<a hr=
ef=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</=
a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/recipes-devtools/python/<a href=3D"http://pytho=
n-smartpm_1.4.1.bb">python-smartpm_1.4.1.bb</a> | 2 +-<br>&gt; =C2=A01 file=
 changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/meta/r=
ecipes-devtools/python/<a href=3D"http://python-smartpm_1.4.1.bb">python-sm=
artpm_1.4.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python-=
smartpm_1.4.1.bb">python-smartpm_1.4.1.bb</a><br>
&gt; index cfa2dba..0cf3847 100644<br>&gt; --- a/meta/recipes-devtools/pyth=
on/<a href=3D"http://python-smartpm_1.4.1.bb">python-smartpm_1.4.1.bb</a><b=
r>&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python-smartpm_=
1.4.1.bb">python-smartpm_1.4.1.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SECTION =3D &quot;devel/python&quot;<br>&gt; =C2=A0LIC=
ENSE =3D &quot;GPLv2&quot;<br>&gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://=
LICENSE;md5=3D393a5ca445f6965873eca0259a17f833&quot;<br>&gt;<br>&gt; -DEPEN=
DS =3D &quot;python rpm&quot;<br>
&gt; +DEPENDS =3D &quot;python rpm gettext-native&quot;<br><br>Why not inhe=
rit gettext ?<br><br><br>&gt; =C2=A0PR =3D &quot;r9&quot;<br>&gt; =C2=A0SRC=
NAME =3D &quot;smart&quot;<br>&gt;<br>&gt; --<br>&gt; 1.8.1.2<br>&gt;<br>&g=
t; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br>
&gt;

--089e0122f7d413f1d404dddee401--
