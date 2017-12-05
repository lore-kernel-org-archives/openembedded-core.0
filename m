Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id A87776093B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:39:19 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u62so789920ita.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 03:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RR1/wIkM8jwgPyYEqOx2n2qOlzIBTlxwkV6fpo6PmyY=;
	b=U63+/BvXU78K4InNKv7n1GrdHkl05Eeap1Qc9OsSoXJYSXMJyip8Ihb2AiBFDGvflA
	V8C7dWqPbP4JO8ncey7zBxAb+sKya7ABkjnAVcdRMTPHDM8n/hEW9ctIfISSMBGQ1K5H
	8+jw1NfdcZ7DPJz1l2aHhckoy+VV/r8m6cdMUpnQxuAj4Z5UN7Xh9oKGrl0NnfyYOHo8
	Z/y5VitLzkMsKdJH1GQtpwIHEUuaX/nFXCT/SPu+zEa9ZqMyTXnANdSAXb7oOZ+Z8VgL
	XrPa8bpeJL4y7U3etUhoRKrfYtGj9rgh6zIeQqDSWu9tHAr66A3/lYRrJCLdg2xZCex+
	DLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RR1/wIkM8jwgPyYEqOx2n2qOlzIBTlxwkV6fpo6PmyY=;
	b=djE+zmqm6QfixrcgXR6fiSnRLCPx47ow7VWqYNduqxxoOMHGFS/RW6wlJOskq8fbDF
	T17CLLtAWyP1MbJkaJbNeh4QPU3l3tjzGmRyoTBM0dnRqI0mCRCBkT0yBfIzit7EFWND
	crTJJ1QVQfLgjPJlZyfjSaZFiP7wI/WR+BaD8/dtOxOuOfzcnmBMkdcjOAsn4lzsVDhO
	t5NDkXQd2Q4GJGPzOyk7UPQZPlyh1CXGtrbHGQwsB8nEAPT/GtTj5bOhBlJZEsYW1FlE
	5l+Lg+r+KQWeHyxhMzgB8IqGV+o3fWnQw1KwAIrZCaZLKDEo8og6yIqiARhYPKBh9qB0
	0Isw==
X-Gm-Message-State: AJaThX46nKaTo1qG1FviLXshl82BwovGCJh9sf22BXrO1/0GrUPJqZ0u
	BBa8p1gbbrKimiac3/72Z09xihi8Nn566WJlpy7qSA==
X-Google-Smtp-Source: AGs4zMYxdNjCh6WMArPIFm4nEPttGS9hYpnpWI1BfhyYtMvqERrtyA9n6IeZeNuWlGbkwkGX4mmLye5l08rMTCajbTA=
X-Received: by 10.107.146.195 with SMTP id u186mr28831932iod.37.1512473960301; 
	Tue, 05 Dec 2017 03:39:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 5 Dec 2017 03:38:59 -0800 (PST)
In-Reply-To: <6738f34a7fff628636b703f8534af6feb55b099d.1512383059.git.Qi.Chen@windriver.com>
References: <cover.1512383059.git.Qi.Chen@windriver.com>
	<6738f34a7fff628636b703f8534af6feb55b099d.1512383059.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Dec 2017 11:38:59 +0000
Message-ID: <CAJTo0LaWUqqkY+cv6jScjgpDoEqPttyhZnKQZOYW4=D6DEsDQA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] coreutils: upgrade to 8.28
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
X-List-Received-Date: Tue, 05 Dec 2017 11:39:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b222def2055f964963"

--94eb2c0553b222def2055f964963
Content-Type: text/plain; charset="UTF-8"

Looks like this fails on hosts with older makeinfo:

http://errors.yoctoproject.org/Errors/Details/160224/

Ross

On 4 December 2017 at 10:25, Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../coreutils/{coreutils_8.27.bb => coreutils_8.28.bb}            | 8
> ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-core/coreutils/{coreutils_8.27.bb =>
> coreutils_8.28.bb} (95%)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb
> b/meta/recipes-core/coreutils/coreutils_8.28.bb
> similarity index 95%
> rename from meta/recipes-core/coreutils/coreutils_8.27.bb
> rename to meta/recipes-core/coreutils/coreutils_8.28.bb
> index ea8740a..0543ceb 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.27.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
> @@ -23,10 +23,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball
> \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>            "
>
> -SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
> -SRC_URI[tarball.sha256sum] = "8891d349ee87b9ff7870f52b6d9312
> a9db672d2439d289bc57084771ca21656b"
> -SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
> -SRC_URI[manpages.sha256sum] = "1f615819e9167646c731636b6c5ecb
> e79837e82a18666bacc82c3fb1dfcfaea3"
> +SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
> +SRC_URI[tarball.sha256sum] = "1117b1a16039ddd84d51a992394830
> 7cfa28c2cea03d1a2438742253df0a0c65"
> +SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
> +SRC_URI[manpages.sha256sum] = "d72c3fa79ae328a4fd1107102e8946
> 755aa2e908044e1efcf1e71ef206dca042"
>
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch
> --libexecdir=${libdir}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0553b222def2055f964963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like this fails on hosts with older makeinfo:<div><b=
r></div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/16022=
4/">http://errors.yoctoproject.org/Errors/Details/160224/</a><br></div><div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 4 December 2017 at 10:25, Chen Qi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-b=
y: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.c=
om</a>&gt;<br>
---<br>
=C2=A0.../coreutils/{<a href=3D"http://coreutils_8.27.bb" rel=3D"noreferrer=
" target=3D"_blank">coreutils_8.27.<wbr>bb</a> =3D&gt; <a href=3D"http://co=
reutils_8.28.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_8.28.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-core/coreutils/{<a href=3D"http://coreutils_8.27.=
bb" rel=3D"noreferrer" target=3D"_blank">c<wbr>oreutils_8.27.bb</a> =3D&gt;=
 <a href=3D"http://coreutils_8.28.bb" rel=3D"noreferrer" target=3D"_blank">=
coreutils_8.28.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.27.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb</a> b/meta/r=
ecipes-core/coreutils/<a href=3D"http://coreutils_8.28.bb" rel=3D"noreferre=
r" target=3D"_blank"><wbr>coreutils_8.28.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.27.bb=
" rel=3D"noreferrer" target=3D"_blank">co<wbr>reutils_8.27.bb</a><br>
rename to meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.28.bb" =
rel=3D"noreferrer" target=3D"_blank">co<wbr>reutils_8.28.bb</a><br>
index ea8740a..0543ceb 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.27.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.28.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.28.bb</a><br>
@@ -23,10 +23,10 @@ SRC_URI =3D &quot;${GNU_MIRROR}/coreutils/${BP}<wbr>.ta=
r.xz;name=3Dtarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-local.mk-fix-<wbr>cro=
ss-compiling-problem.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[tarball.md5sum] =3D &quot;<wbr>502795792c212932365e077946d353<wbr>=
ae&quot;<br>
-SRC_URI[tarball.sha256sum] =3D &quot;<wbr>8891d349ee87b9ff7870f52b6d9312<w=
br>a9db672d2439d289bc57084771ca21<wbr>656b&quot;<br>
-SRC_URI[manpages.md5sum] =3D &quot;<wbr>1b31a688d06764e0e94aa20b7ea082<wbr=
>22&quot;<br>
-SRC_URI[manpages.sha256sum] =3D &quot;<wbr>1f615819e9167646c731636b6c5ecb<=
wbr>e79837e82a18666bacc82c3fb1dfcf<wbr>aea3&quot;<br>
+SRC_URI[tarball.md5sum] =3D &quot;<wbr>e7cb20d0572cc40d9f47ede6454406<wbr>=
d1&quot;<br>
+SRC_URI[tarball.sha256sum] =3D &quot;<wbr>1117b1a16039ddd84d51a992394830<w=
br>7cfa28c2cea03d1a2438742253df0a<wbr>0c65&quot;<br>
+SRC_URI[manpages.md5sum] =3D &quot;<wbr>3a7c626aad1c9077f254e5c2553a2f<wbr=
>60&quot;<br>
+SRC_URI[manpages.sha256sum] =3D &quot;<wbr>d72c3fa79ae328a4fd1107102e8946<=
wbr>755aa2e908044e1efcf1e71ef206dc<wbr>a042&quot;<br>
<br>
=C2=A0EXTRA_OECONF_class-native =3D &quot;--without-gmp&quot;<br>
=C2=A0EXTRA_OECONF_class-target =3D &quot;--enable-install-program=3Darch -=
-libexecdir=3D${libdir}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--94eb2c0553b222def2055f964963--
