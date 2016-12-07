Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A27960589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 10:10:58 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id x190so408506899qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 02:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QRFq2DgipzIYXKOGSmApB5MLiQaT2wqBJMSqa+IgGEA=;
	b=SzdINM94DAQJ7848DKZ+9MEOnExeAUq0oBDDPIvqgV9IuXHC2WbVc4mGCFUf3HlBZo
	EQ540RfMvB6A03y1RTvD2zR7IfHD9NM4EFEMMBp6pAMyeEtrrkUagDFfYcIwff81nggU
	3v9bCN81e/PFoRSr8lYpcR++R2XTpM3E/hCePypAtQJLWE9lkEjTEkBwNTDaEXv6gMmf
	5P5LkLTGunDZABTLItJzEVSCK4vvM/nJMgg5ealM1CxfSU9U+nL8YT+w8LymcnpLzFU2
	8pYazx5HIXf113777Zm69v/+644ydfGLBfiHt/vNDQsKO4qhy/HYzFo91UuvmAPQcVAZ
	q8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QRFq2DgipzIYXKOGSmApB5MLiQaT2wqBJMSqa+IgGEA=;
	b=iritMONbNco+3Yg5rGCpSHKMOGxBIj7x8d5OXJfZTodB7gv7H6ojn3K9YFXTl9m5pM
	+GYBFIclFkl0Dzi/2lBGXf6cjX21EuYq4InALd8aM9w8ys/4zDNbqgvN0TPqeNRfM6KO
	Zddh3b2RhozCWcBGTCWB0GY23XhaEtYjg5AmaK2cG4VDfTbRGp7qfo7+E2fMlva4CpFJ
	4Oy4C4tecC83JeRsFs1LttB2obj85ZL+UQHvI6KC3ro3xwocKT1w9v2xkfAWO0lE76+8
	y/ZzrIb1xKNO0Ic6uYuBkLFJfFR36Pj7ow9EjSrLvjtfGkOeorLXI8B905EEmbNtoX8a
	mU0w==
X-Gm-Message-State: AKaTC00H+EGFfpT3F5jvZw6FdXxWO9jePzMAjBC+2oJy8vAzkXorrmWHHx886aIjKvVNy+Bc7rqyCmWpJ9JeWfxk
X-Received: by 10.55.75.17 with SMTP id y17mr50767203qka.26.1481105460126;
	Wed, 07 Dec 2016 02:11:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 7 Dec 2016 02:10:39 -0800 (PST)
In-Reply-To: <1481104213-12403-1-git-send-email-awais_belal@mentor.com>
References: <1481104213-12403-1-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Dec 2016 10:10:39 +0000
Message-ID: <CAJTo0LbfrEcfyz+Sd7yyASJQkVzJuzVUzQgGevMthaEXsPXWSA@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kern-tools: update to avoid kernel_metadata failures
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
X-List-Received-Date: Wed, 07 Dec 2016 10:10:59 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8d398e605430ebcef

--001a114a88c8d398e605430ebcef
Content-Type: text/plain; charset=UTF-8

Bruce already sent this, and it's in staging now.

Ross

On 7 December 2016 at 09:50, Awais Belal <awais_belal@mentor.com> wrote:

> Update kernel native tools to avoid do_kernel_metadata
> failures. This is mainly to bring in
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/commit/?id=
> a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
> but we should pick up whatever enhancements are currently
> available. Without this builds with no specific metadata
> branches fail.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 88b1aee..0f8a786 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;
> beginline=5;endline=9;md5=a6c2fa8aef1b
>
>  DEPENDS = "git-native"
>
> -SRCREV = "b36f6f9a5695f2084b83823393e13ca42284bed9"
> +SRCREV = "bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a88c8d398e605430ebcef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bruce already sent this, and it&#39;s in staging now.<div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 7 December 2016 at 09:50, Awais Belal <span dir=3D"ltr">&l=
t;<a href=3D"mailto:awais_belal@mentor.com" target=3D"_blank">awais_belal@m=
entor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Update k=
ernel native tools to avoid do_kernel_metadata<br>
failures. This is mainly to bring in<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/co=
mmit/?id=3Da287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.yoctoproject.org/<wbr>cgit/cgit.cgi/yocto-kernel=
-<wbr>tools/commit/?id=3D<wbr>a287da4bfe0b4acb8f2b0627bd8e7a<wbr>bd1a1dde26=
</a><br>
but we should pick up whatever enhancements are currently<br>
available. Without this builds with no specific metadata<br>
branches fail.<br>
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">aw=
ais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-too=
ls-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_gi=
t.bb</a> b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
index 88b1aee..0f8a786 100644<br>
--- a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
+++ b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://git/tools/kgit;<wbr>begin=
line=3D5;endline=3D9;md5=3D<wbr>a6c2fa8aef1b<br>
<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>b36f6f9a5695f2084b83823393e13c<wbr>a42284bed9&quot;<=
br>
+SRCREV =3D &quot;<wbr>bd9e1d6c9b0a34ff3e19a06999aaf5<wbr>7ffadfd04c&quot;<=
br>
=C2=A0PR =3D &quot;r12&quot;<br>
=C2=A0PV =3D &quot;0.2+git${SRCPV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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

--001a114a88c8d398e605430ebcef--
