Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C94CC6FCEA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 12:22:19 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id at1so4159iec.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+dfWo+XnjS8L1pXNmvUd49OahuD8viMf66bAurMiJns=;
	b=ta562LtIf7JtuIp5FV+SfZp0sojjaV2NUboY7kcvfbYggQx8NUSjaljftoZSLlMs+7
	PGps5zKimJaIc9uxn63AnqOz6ZueE1CyMQw87GBtD/pXW8AU8AzaguFiCNj1/OJN5bYd
	hqD0NRCRlDfPNTiNTqI+mIvM7cJmIikSZUdJ5dZfNeUUzjEBKXHYzql+8YJlx/PINNhM
	HD1MSBQ3s3c+9CQ08jNp9yVNjvHNAVmr4K32QBFeJKPqFw/5BgOa42wLeZBJnZOm68FJ
	7nkCEi3rV0/Ndi1W55HFX/x3rvbYvHjf612gxBlJA5T85UVWpvQr0u0k4moAghksBleB
	A8fw==
MIME-Version: 1.0
X-Received: by 10.50.43.136 with SMTP id w8mr5209751igl.20.1402057340404; Fri,
	06 Jun 2014 05:22:20 -0700 (PDT)
Received: by 10.50.6.197 with HTTP; Fri, 6 Jun 2014 05:22:20 -0700 (PDT)
In-Reply-To: <1402039028-17192-1-git-send-email-rongqing.li@windriver.com>
References: <1402039028-17192-1-git-send-email-rongqing.li@windriver.com>
Date: Fri, 6 Jun 2014 05:22:20 -0700
Message-ID: <CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] relocate_sdk.py: fix lib path error
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
X-List-Received-Date: Fri, 06 Jun 2014 12:22:26 -0000
Content-Type: multipart/alternative; boundary=089e011602a8bac93404fb29e933

--089e011602a8bac93404fb29e933
Content-Type: text/plain; charset=UTF-8

On Friday, June 6, 2014, <rongqing.li@windriver.com> wrote:

> From: yzhu1 <yanjun.zhu@windriver.com <javascript:;>>
>
> In centos 5.9 32bit, ld lib does not contain some flags, so ld
> lib is not parsed. So correct lib path is not got from ld lib.


Can you explain with examples what's going on here ?

>
> Signed-off-by: yzhu1 <yanjun.zhu@windriver.com <javascript:;>>
> ---
>  scripts/relocate_sdk.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index 05d9fd6..a05a7fa 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -201,7 +201,7 @@ else:
>      new_prefix = sys.argv[1].encode()
>      new_dl_path = sys.argv[2].encode()
>
> -executables_list = sys.argv[3:]
> +executables_list = sys.argv[2:]
>
>  for e in executables_list:
>      perms = os.stat(e)[stat.ST_MODE]
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e011602a8bac93404fb29e933
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 6, 2014,  &lt;<a href=3D"mailto:rongqing.li@windriv=
er.com">rongqing.li@windriver.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
From: yzhu1 &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39=
;, &#39;yanjun.zhu@windriver.com&#39;)">yanjun.zhu@windriver.com</a>&gt;<br=
>
<br>
In centos 5.9 32bit, ld lib does not contain some flags, so ld<br>
lib is not parsed. So correct lib path is not got from ld lib.</blockquote>=
<div><br></div><div>Can you explain with examples what&#39;s going on here =
?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">

<br>
Signed-off-by: yzhu1 &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39=
;cvml&#39;, &#39;yanjun.zhu@windriver.com&#39;)">yanjun.zhu@windriver.com</=
a>&gt;<br>
---<br>
=C2=A0scripts/relocate_sdk.py | =C2=A0 =C2=A02 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py<br>
index 05d9fd6..a05a7fa 100755<br>
--- a/scripts/relocate_sdk.py<br>
+++ b/scripts/relocate_sdk.py<br>
@@ -201,7 +201,7 @@ else:<br>
=C2=A0 =C2=A0 =C2=A0new_prefix =3D sys.argv[1].encode()<br>
=C2=A0 =C2=A0 =C2=A0new_dl_path =3D sys.argv[2].encode()<br>
<br>
-executables_list =3D sys.argv[3:]<br>
+executables_list =3D sys.argv[2:]<br>
<br>
=C2=A0for e in executables_list:<br>
=C2=A0 =C2=A0 =C2=A0perms =3D os.stat(e)[stat.ST_MODE]<br>
--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--089e011602a8bac93404fb29e933--
