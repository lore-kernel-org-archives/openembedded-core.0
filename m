Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D9C8B70101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:37:37 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id m9so48221133ige.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i9bwvpGCbTD1n8eAiAZljoGZSKPaOjCa3v0iYhhvAYA=;
	b=GX6RmuEz5OnSTDnOun7Iw6a7028YhbTrOqMm+73hMtPS+UfhG9/qoESAs8nOLU5GxA
	ZoAa7kfyJhf9AJka9jDqO3Lf47MS/NTa/IuYoMLPdHuV86hpA8EI5oTr1u6Ihx37PPbT
	QOT7YACB8oJI/cYNr4QCa7WZHa4R9zMCYyfw2qC0cBhTQvr3smiz+N1dI5z9uzhbOlU0
	R8OzxDI+Z/rzOOMRSOGGfK1iWge7F1cKuMoayBtnz11nzxCQbs3peNXoipl+CeUZCSFA
	fkrSDK0Syc5VvRgmrbNsBFJVnGD+2KX5QTw11jYUcK9yE7NwOswGReDg72yVfNi6nJ6q
	QPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i9bwvpGCbTD1n8eAiAZljoGZSKPaOjCa3v0iYhhvAYA=;
	b=cxLuGf1cZU9keDdWsk1Kp5HqhaLcUCdv/3+bwyjg4zVJqxCq9OeDex/iCNvERdUkHl
	d88RcXTblTguYrbjrLlNEm1r5MMgic0uepvFxZ1P3lAXz+r932hGRTK0Zye8AzIdqlu8
	RDzO5holkhAMLaXvz9FCWU6GwdegWbIkphiCqZXG8cpcQujDScattZf+ChgDgiMRZtEE
	ELwoXJV5rKSuEWTFcUnpCZIGgPf4gDLFSO0rA1buUiX9rw1ZOAEL0CC8ZH5lBttx6ptJ
	AhyYxRCIkO9y1yZwu11Qs+544AMRz5VWfXLJMgh/smyTLgnEHy8XHCOTmKGcBgndKgKM
	9vjg==
X-Gm-Message-State: AOPr4FUzHPb9Z3MSMQCYGNEcOB03InArMZeKPUtuLBDgQrITUOx4NPDhnka3vpY2jL5WDQMdI6u5gQWk7mK/7o65
X-Received: by 10.50.233.40 with SMTP id tt8mr6205334igc.78.1461184658045;
	Wed, 20 Apr 2016 13:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 20 Apr 2016 13:37:18 -0700 (PDT)
In-Reply-To: <f4e17cb499c3e83333d197a65363587a5e5c2e51.1460971725.git.liezhi.yang@windriver.com>
References: <cover.1460971725.git.liezhi.yang@windriver.com>
	<f4e17cb499c3e83333d197a65363587a5e5c2e51.1460971725.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Apr 2016 21:37:18 +0100
Message-ID: <CAJTo0LatBdHwJXAMSbh4HRoUtOyo_5SzkuSYrbaxC8D0Ah3fVQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub_git: set COMPATIBLE_HOST_armv7a to null
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
X-List-Received-Date: Wed, 20 Apr 2016 20:37:41 -0000
Content-Type: multipart/alternative; boundary=f46d042875717ea7030530f09075

--f46d042875717ea7030530f09075
Content-Type: text/plain; charset=UTF-8

Andre's comment from the last time you submitted this is still valid:

Unless you have verified that armv4, armv5, armv6 and armv7ve all work
> correctly then blacklisting only armv7a is probably not the correct
> approach.


Have you tested all the other architectures?

Ross

On 18 April 2016 at 10:29, Robert Yang <liezhi.yang@windriver.com> wrote:

> It doesn't work with armv7a:
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [reboot.mod] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [halt.mod] Error 1
> | make[3]: *** [cat.mod] Error 1
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | build-grub-module-verifier: error: unsupported relocation 0x2b.
> | make[3]: *** [disk.mod] Error 1
> | make[3]: *** [gptsync.mod] Error 1
> | make[3]: *** [eval.mod] Error 1
> | build-grub-module-verifier: error:build-grub-module-verifier: error:
> unsupported relocation 0x2bunsupported relocation 0x2b.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-bsp/grub/grub_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/
> grub_git.bb
> index 6919c9a..8f8c5ed 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -18,6 +18,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
>  S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST_armv7a = 'null'
>
>  inherit autotools gettext texinfo
>
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d042875717ea7030530f09075
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Andre&#39;s comment from the last time you submitted this =
is still valid:<div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><span style=3D"font-size:13p=
x">Unless you have verified that armv4, armv5, armv6 and armv7ve all work<b=
r></span><span style=3D"font-size:13px">correctly then blacklisting only ar=
mv7a is probably not the correct<br></span><span style=3D"font-size:13px">a=
pproach.</span></blockquote><div><span style=3D"font-size:13px"><br></span>=
</div><div><span style=3D"font-size:13px">Have you tested all the other arc=
hitectures?</span></div><div><span style=3D"font-size:13px"><br></span></di=
v><div><span style=3D"font-size:13px">Ross</span></div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 18 April 2016 at 10:29, Robe=
rt Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" =
target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">It doesn&#39;t work with armv7a:<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| make[3]: *** [reboot.mod] Error 1<br>
| make[3]: *** Waiting for unfinished jobs....<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| make[3]: *** [halt.mod] Error 1<br>
| make[3]: *** [cat.mod] Error 1<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| build-grub-module-verifier: error: unsupported relocation 0x2b.<br>
| make[3]: *** [disk.mod] Error 1<br>
| make[3]: *** [gptsync.mod] Error 1<br>
| make[3]: *** [eval.mod] Error 1<br>
| build-grub-module-verifier: error:build-grub-module-verifier: error:=C2=
=A0 unsupported relocation 0x2bunsupported relocation 0x2b.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"no=
referrer" target=3D"_blank">grub_git.bb</a> b/meta/recipes-bsp/grub/<a href=
=3D"http://grub_git.bb" rel=3D"noreferrer" target=3D"_blank">grub_git.bb</a=
><br>
index 6919c9a..8f8c5ed 100644<br>
--- a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_git.bb</a><br>
+++ b/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_git.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gn=
u.org/grub.git" rel=3D"noreferrer" target=3D"_blank">git.savannah.gnu.org/g=
rub.git</a> \<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|f=
reebsd.*)&#39;<br>
+COMPATIBLE_HOST_armv7a =3D &#39;null&#39;<br>
<br>
=C2=A0inherit autotools gettext texinfo<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.0<br>
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

--f46d042875717ea7030530f09075--
