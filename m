Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F88D60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 12:39:01 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l102so9917783lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ikP4RIfmjLC31GloRZI0abeU4EsW28yi6HQ/F7l6EAU=;
	b=zQ1TNbGQLIvNMF+WzFsdWecX5CJEs3e0bp14U4MpH4Gbw5bzpaQTxmPgAX9CyxtsLL
	r35FjADU9UcZr1z6ZDkCG5oxWDcjEVhDMfidcItk+eDJWkYdsORNY7L4v/WQmaF9epKd
	G9TUZW7jG3FXmN05URAGu4jm6MyhChAtl94/SzR+hQIzHm3KHZcq5cM8pZ/aAONR65EM
	wxPzpEHDSblHBw4aBsV91z2N5gzQli32lzsBzyvEUKCX/kPnwk5F1Bt0wktar6uevRPM
	e+NQmBiyAJz9bMOIVewhu7UIDowoDP5nCXv3OQTRwiPqM5ziBdYxIoOmcTcxmzyGb8LG
	yG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ikP4RIfmjLC31GloRZI0abeU4EsW28yi6HQ/F7l6EAU=;
	b=Av6gISmRsXqrQUMitBLj83P5WxXGgDxr2glYamSybP19ZFZ/ycded0a92viUDwbwqs
	Soc/T5jIIRNcGzcAMaIDQ3pxUvUAVcgRO+SfXttthAmVkwxXaIFpBeg8k7SM4k0gHEEb
	xWM6+hpyFY6JECrNltpMp6WthMMJuZQCCLuNo6M6QgmbxkYRGpcaDhuEBMPQvyni3s9A
	onCdTqc3SSRwBtmOnotm7kl/0VyEHJLxrNaMUHiEBTX/07uLQ5dytbPQp6eaaC/Swmj3
	BhcIcsII+VNlzfeLMTVLjfJd7gOI0CN2TV3n5w5TB5/eEtknP9B5RH4ieh5Cju9RTa7k
	F1fQ==
X-Gm-Message-State: ALyK8tLNoy5az3qkF7qJVna0o7fDibgjVMf/P0UfERN5G2p+96lTiBORcMT0WsQ98jdHPGEPgckQYLG1EO5RJA==
X-Received: by 10.25.15.213 with SMTP id 82mr4783034lfp.126.1467808741656;
	Wed, 06 Jul 2016 05:39:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Wed, 6 Jul 2016 05:38:31 -0700 (PDT)
X-Originating-IP: [177.100.227.79]
In-Reply-To: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 6 Jul 2016 09:38:31 -0300
Message-ID: <CAAPZna3qZAF=TL+s6VNmhObPqLd80qtS9UO01PGRzZDfoESrFQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [krogoth][wic][PATCH] wic: rawcopy: make source filenames unique
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
X-List-Received-Date: Wed, 06 Jul 2016 12:39:04 -0000
Content-Type: multipart/alternative; boundary=001a113fb78aa51fb10536f6dadc

--001a113fb78aa51fb10536f6dadc
Content-Type: text/plain; charset=UTF-8

Hi Ed,

This patch was already tested, can be applied to krogoth?

Regards,

Fabio

On Fri, Jul 1, 2016 at 5:05 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Rawcopy plugin copies source files to build folder before using them
> to assemble result image. After assembling the image wic renames
> source files to <image>.p<partition number>. If the same source file
> is used in multiple partitions wic breaks trying to rename file that
> doesn't exist.
>
> Added <line number> suffix to the files when copying them to the
> build dir. This should make filename unique even if the same source
> file is used for multiple partitions.
>
> [YOCTO #9826]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py
> b/scripts/lib/wic/plugins/source/rawcopy.py
> index 0472f53..7ce0cc4 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -67,7 +67,7 @@ class RawCopyPlugin(SourcePlugin):
>              return
>
>          src = os.path.join(bootimg_dir, source_params['file'])
> -        dst = os.path.join(cr_workdir, source_params['file'])
> +        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'],
> part.lineno))
>
>          if 'skip' in source_params:
>              dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fb78aa51fb10536f6dadc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Ed,<br><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:monospace,monospace;font-size:small">This patch was=
 already tested, can be applied to krogoth?<br><br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace;font-size:small">Regard=
s,<br><br></div><div class=3D"gmail_default" style=3D"font-family:monospace=
,monospace;font-size:small">Fabio<br></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Fri, Jul 1, 2016 at 5:05 AM, Ed Bartosh =
<span dir=3D"ltr">&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=
=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Rawcopy plugin copies source files to build folder befo=
re using them<br>
to assemble result image. After assembling the image wic renames<br>
source files to &lt;image&gt;.p&lt;partition number&gt;. If the same source=
 file<br>
is used in multiple partitions wic breaks trying to rename file that<br>
doesn&#39;t exist.<br>
<br>
Added &lt;line number&gt; suffix to the files when copying them to the<br>
build dir. This should make filename unique even if the same source<br>
file is used for multiple partitions.<br>
<br>
[YOCTO #9826]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/plugins/source/rawcopy.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py<br>
index 0472f53..7ce0cc4 100644<br>
--- a/scripts/lib/wic/plugins/source/rawcopy.py<br>
+++ b/scripts/lib/wic/plugins/source/rawcopy.py<br>
@@ -67,7 +67,7 @@ class RawCopyPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D os.path.join(bootimg_dir, source_=
params[&#39;file&#39;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(cr_workdir, source_params=
[&#39;file&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(cr_workdir, &quot;%s.%s&q=
uot; % (source_params[&#39;file&#39;], part.lineno))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;skip&#39; in source_params:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dd_cmd =3D &quot;dd if=3D%s=
 of=3D%s ibs=3D%s skip=3D1 conv=3Dnotrunc&quot; % \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a113fb78aa51fb10536f6dadc--
