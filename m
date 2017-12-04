Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E31571D97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 12:37:01 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f190so6208466ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AwwWt0ihEzntjJikB8csepnSiUn5CZOOap3OUiUZ56Y=;
	b=OwrWY2Ko+JdysJbG5njLlX17mG/O/RsqB5UJOlUJWKvU6PhcJ7L7kPK9H2j5L/jwh0
	42YBAL1pqeqd1CmkvpGFasNm3uEZEWSmrz+JgEyQ4ZP6KQcLAfTWFbqun1rKAUPi+U1J
	wM+jKGWL+muIirgy3eHlEYguVZ/GAPxJJxnDxI2kz7Z9Uz2Y3VhcwxqyvEH0JCi5i2lH
	ynsBahDyUjemokZcypIP8pEJQHDL08fFVyS6yWSu96rue9vqNVhX7S0HrPEGgSK7ovbg
	BcVuCfV2u8/0dYOXJOELPfj7KWX9lNO8UpwEWmhHpXgPtJVzC8AwVuywdcdXTo1P0BzH
	hBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AwwWt0ihEzntjJikB8csepnSiUn5CZOOap3OUiUZ56Y=;
	b=ADRER5mCVmU9anrNdgelEEjUudWEmyynry2eDRyEb1s+xdQGeuGVMW9vbeASySnlVj
	QIANvQnuw1FVzL8/4Kpdla5cfA/1GGY0L7VoPUUyFJTQXhhy2q7CnX1/5Q+rkrT2yPnH
	VDTgdUnFfYMZcJ0Qqxjxwi4a8zP6qQ8BA/16Sq73OaYMWcvVWgiziWEWTlpzPlZk1rEt
	Vd/9mz4L4Uh1S27ohZL5VjBLsMhjwyFCLn6XJiOKmqhP+WAbXDzRNi+LNyQR6ZCT10RG
	sAmKVmlO2mJYzzcuKFvqhvYzoebG+9CI6n+Hj4cYITGKKosLuBxJ89yo5fcsYPvC//Ks
	RaIg==
X-Gm-Message-State: AKGB3mIVxMDlcLPoZHDpaQUZen41Sj3I37HYc7WZbad2EAdaD5PY64tm
	LrQ6x80KRVG7w0diyTMzjju0pOeT66XcDMS5ZklxVQ==
X-Google-Smtp-Source: AGs4zMZnLQda+VlOQ2UlICMajZarmfedWY4UOj43tGMOKbZ+ayeu597KHTO/lAObAMzNFBCTENCNq8KSxKwKrYTvMlk=
X-Received: by 10.36.93.5 with SMTP id w5mr13170150ita.124.1512391022671; Mon,
	04 Dec 2017 04:37:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 4 Dec 2017 04:36:42 -0800 (PST)
In-Reply-To: <20171201155024.3002-6-olofjn@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Dec 2017 12:36:42 +0000
Message-ID: <CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Olof Johansson <olofjn@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 04 Dec 2017 12:37:01 -0000
Content-Type: multipart/alternative; boundary="001a1143f14cab1493055f82f9f9"

--001a1143f14cab1493055f82f9f9
Content-Type: text/plain; charset="UTF-8"

You might be interested in some of the patches I've got sitting in
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mutb
specifically around "Add new ELF parser".  This adds a fully-featured
Python ELF parser to lib/oe which could be used to inspect the binaries the
way file does, but without having to call and parse the output of file.

Ross

On 1 December 2017 at 15:50, Olof Johansson <olof.johansson@axis.com> wrote:

> Avoid matching substrings that are picked up from paths, for instance.
> Do this by anchoring the tokens we look for (e.g "executable" or "not
> stripped") with whitespace and punctuation.
>
> Submitted with this patch series is a change that adds the use of
> --brief to file. This removes the path prefix to the output, but the
> path can still be included in shebang lines (which file will report as
> something like "a /foo/bar/baz.py script").
>
> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>  meta/lib/oe/package.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 976d2ef36c..2bd771cfc5 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -84,17 +84,17 @@ def is_elf(path, on_error=_is_elf_error):
>          error_cb('"file %s" failed')
>          return
>
> -    if not "ELF" in result:
> +    if not result.startswith("ELF "):
>          return 0
>
>      exec_type = 1
> -    if "not stripped" not in result:
> +    if ", not stripped" not in result:
>          exec_type |= 2
> -    if "executable" in result:
> +    if " executable, " in result:
>          exec_type |= 4
> -    if "shared" in result:
> +    if " shared object, " in result:
>          exec_type |= 8
> -    if "relocatable" in result and is_kernel_module(path):
> +    if "relocatable, " in result and is_kernel_module(path):
>          exec_type |= 16
>      return exec_type
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143f14cab1493055f82f9f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You might be interested in some of the patches I&#39;ve go=
t sitting in=C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky=
-contrib/log/?h=3Dross/mutb">http://git.yoctoproject.org/cgit/cgit.cgi/poky=
-contrib/log/?h=3Dross/mutb</a> specifically around &quot;Add new ELF parse=
r&quot;.=C2=A0 This adds a fully-featured Python ELF parser to lib/oe which=
 could be used to inspect the binaries the way file does, but without havin=
g to call and parse the output of file.<div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 December 201=
7 at 15:50, Olof Johansson <span dir=3D"ltr">&lt;<a href=3D"mailto:olof.joh=
ansson@axis.com" target=3D"_blank">olof.johansson@axis.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Avoid matching substrings that are =
picked up from paths, for instance.<br>
Do this by anchoring the tokens we look for (e.g &quot;executable&quot; or =
&quot;not<br>
stripped&quot;) with whitespace and punctuation.<br>
<br>
Submitted with this patch series is a change that adds the use of<br>
--brief to file. This removes the path prefix to the output, but the<br>
path can still be included in shebang lines (which file will report as<br>
something like &quot;a /foo/bar/baz.py script&quot;).<br>
<br>
Signed-off-by: Olof Johansson &lt;<a href=3D"mailto:olofjn@axis.com">olofjn=
@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package.py | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index 976d2ef36c..2bd771cfc5 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -84,17 +84,17 @@ def is_elf(path, on_error=3D_is_elf_error):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_cb(&#39;&quot;file %s&quot; failed&=
#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
-=C2=A0 =C2=A0 if not &quot;ELF&quot; in result:<br>
+=C2=A0 =C2=A0 if not result.startswith(&quot;ELF &quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
=C2=A0 =C2=A0 =C2=A0exec_type =3D 1<br>
-=C2=A0 =C2=A0 if &quot;not stripped&quot; not in result:<br>
+=C2=A0 =C2=A0 if &quot;, not stripped&quot; not in result:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_type |=3D 2<br>
-=C2=A0 =C2=A0 if &quot;executable&quot; in result:<br>
+=C2=A0 =C2=A0 if &quot; executable, &quot; in result:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_type |=3D 4<br>
-=C2=A0 =C2=A0 if &quot;shared&quot; in result:<br>
+=C2=A0 =C2=A0 if &quot; shared object, &quot; in result:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_type |=3D 8<br>
-=C2=A0 =C2=A0 if &quot;relocatable&quot; in result and is_kernel_module(pa=
th):<br>
+=C2=A0 =C2=A0 if &quot;relocatable, &quot; in result and is_kernel_module(=
path):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_type |=3D 16<br>
=C2=A0 =C2=A0 =C2=A0return exec_type<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
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

--001a1143f14cab1493055f82f9f9--
