Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8A51D77EFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 12:22:00 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id i2so22604116qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uGKR+Tvz+pWdjsOV32Q6Ioqx8EpDpVcZACyqm4Ge1j8=;
	b=1uunAlgOVVherusUbi+tACrPDD688TFIYCJXgWPQvdV7+Q047yv9QBGt/31zGZi/Jl
	Tj3Esrw1CVR0IZopl0a79qE2/3I/gHd2zgji8cBFNemnL170uA3JwjqR/JjmkzgZ9wih
	NI6SFlVXqfctu5n2EJWDx77uywq6JDMgiaVYfQ80A9onF146wFGuJzi4HyrcqfzxzfLa
	9szAu9qwX0VyapN97tMS7UFWPEnsHNZuzioG8BlkWXj/DvNNmxXvtTwN+WNi0zgCItRo
	j1xrCJbxxzf1ltsmgZVysLasT2xgBV8TNxEn8HgNloB3giI+r5q9UnuMnck9RpUd2Df0
	RgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uGKR+Tvz+pWdjsOV32Q6Ioqx8EpDpVcZACyqm4Ge1j8=;
	b=DBA/CSvJllf/rWaFLd9nhzUN5R7gHfGhOrGfuGsMaIm+ybIKZNY9gYr3X6rcdLOfYm
	ZXVpFlMGrY/v9xQWuIgkjibJLI0G1bHrdf6d3EkoDQ6uuvbQP6TY/q876YD5rsibShFX
	W3ZE0vAUiPMUoWeYKhp/Uyf/o9UgD9+uhBEgQw4XGKTl153jPuqc5mU08RQwLIsc52fB
	g21LEcsQKqdRRmaPUFLozoAuJ04lvtyfCSN4CBGXIeyQtw1v/6/FcPcORu84tMxlqRl2
	XNKxNIIPOqcxAM9nsOwaRj2pkhzITdl6K3pkH6xtXriGXxr0+rRJ47Y4UjYvB6R/j/+J
	fjQg==
X-Gm-Message-State: AKS2vOwBAOTKs/E0rNZJo6or4rX22+qcdTkyRM6cdWyNVcXq1EqSMhzi
	cflWxkeyraBoB/e3aailDMXpTtVoc7Wu
X-Received: by 10.200.43.105 with SMTP id 38mr6424204qtv.6.1498566121908; Tue,
	27 Jun 2017 05:22:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 27 Jun 2017 05:21:41 -0700 (PDT)
In-Reply-To: <edaa061285116e1d87c27d76adb356352a83e9ef.1498557396.git.ed.bartosh@linux.intel.com>
References: <cover.1498557396.git.ed.bartosh@linux.intel.com>
	<edaa061285116e1d87c27d76adb356352a83e9ef.1498557396.git.ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jun 2017 13:21:41 +0100
Message-ID: <CAJTo0LaOHMuAiw1Rsm2AA-01cCuG2gqD0WhM+qisWpiQD0Ar9g@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] wic: rootfs: make copied rootfs unique
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
X-List-Received-Date: Tue, 27 Jun 2017 12:22:02 -0000
Content-Type: multipart/alternative; boundary="001a113d00a65ea93e0552f01d78"

--001a113d00a65ea93e0552f01d78
Content-Type: text/plain; charset="UTF-8"

Can you squash stuff like this into the first patch, the history doesn't
need to see your working.

Also, does the hardlink copy get cleaned up?

Ross

On 27 June 2017 at 10:57, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Used unique suffix (line number from .wks file) for the
> copied rootfs directory to avoid possible conflicts.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py
> b/scripts/lib/wic/plugins/source/rootfs.py
> index e438158..aec720f 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -88,7 +88,7 @@ class RootfsPlugin(SourcePlugin):
>          if part.exclude_path is not None:
>              # We need a new rootfs directory we can delete files from.
> Copy to
>              # workdir.
> -            new_rootfs = os.path.realpath(os.path.join(cr_workdir,
> "rootfs"))
> +            new_rootfs = os.path.realpath(os.path.join(cr_workdir,
> "rootfs%d" % part.lineno))
>
>              if os.path.lexists(new_rootfs):
>                  shutil.rmtree(os.path.join(new_rootfs))
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113d00a65ea93e0552f01d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you squash stuff like this into the first patch, the h=
istory doesn&#39;t need to see your working.<div><br></div><div>Also, does =
the hardlink copy get cleaned up?</div><div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27 June 2017 a=
t 10:57, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.bartosh@linu=
x.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Used unique suffix (line number from=
 .wks file) for the<br>
copied rootfs directory to avoid possible conflicts.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/plugins/<wbr>source/rootfs.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/<wbr>source/rootfs.py b/scripts/lib/wi=
c/plugins/<wbr>source/rootfs.py<br>
index e438158..aec720f 100644<br>
--- a/scripts/lib/wic/plugins/<wbr>source/rootfs.py<br>
+++ b/scripts/lib/wic/plugins/<wbr>source/rootfs.py<br>
@@ -88,7 +88,7 @@ class RootfsPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if part.exclude_path is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We need a new rootfs dire=
ctory we can delete files from. Copy to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# workdir.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_rootfs =3D os.path.realpath(=
os.path.join(<wbr>cr_workdir, &quot;rootfs&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_rootfs =3D os.path.realpath(=
os.path.join(<wbr>cr_workdir, &quot;rootfs%d&quot; % part.lineno))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.lexists(new_root=
fs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree=
(os.path.join(<wbr>new_rootfs))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--001a113d00a65ea93e0552f01d78--
