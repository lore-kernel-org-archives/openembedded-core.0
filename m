Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 70BA17887F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 15:14:00 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id s206so23590255wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eycLXmPP2WO3AMhHM4EwMUcOQKDv0EHw0qXRP0Mlu3w=;
	b=g9WoSE+fnJRcpzGMCPf1luQ/Ff2SxX/Ks0oSTo3r/MUt77QaQDUmg21kdAND17ziWh
	diYmI5+uMENK9PRYDp9FF8JIE7TcYxybxQW96n7KNhFCuAIe+V4xvf13uh3qxkwcWoy3
	MnELRYfVzKSoGn9KkwhZCQu784vRlOlEl9oU6lJOw7hJ6PdOWzJT3mv0O3ZLJyABktzr
	KVJr+ISgvNgLdwFMvlBiDIfNTdRuiYr8qaBfqA2LnQumnV9kMzQUkoELOOm7EWshF5+T
	oanzv4qv7eZJd9vrzkKp0OSqGWUDzjagH3i7u4ZYy8hU3omrIdezPSzDP5PelEEScJYE
	IhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eycLXmPP2WO3AMhHM4EwMUcOQKDv0EHw0qXRP0Mlu3w=;
	b=XBH3X6icThVSon0MHmokfXBmrTov1XceGSvUJ5DsxY0/X4h8QctOMdsCs6o7wX/cYD
	im9kYVkGuasygO6LrCGolCn1qM9f3ecJUA3D0jwleI87em7B/2gFtp+qLen6ED92eoxW
	2tKu6K/aIGyoQBzpopOaIAQqFpvpxu291WUfSaM4KFNLzxNAXQ8mLv2ubwRT2xL2g+ur
	ryifmkE6CL1tvfDYebvbHCuxTsDhsyo7HanNDUggB9hYtDkDK4ZyuJpM9uhesfTGTPMv
	YtTEHMEebpSAg5hCCKNT9AmhpQRpt9mkSJSxpY/kym68YmHGvn2LIKW3Rb9L3bTvq5c4
	g+vQ==
X-Gm-Message-State: AElRT7FGymkci896OQCAxPafFpHo59Lzhfb85GKOC5SXuXbsDik3k7MI
	G2E1QEEguSozff5OkVvZxtcSMVczCUauMbRjrxSt5A==
X-Google-Smtp-Source: AG47ELsbYgCLlckRdjny54bwEw2gaPtKDukXPvBlvFA0KjbSNkVHshS5jFFi8qykMTp6SVLQrOAsvHxT2WsdkAw7TjM=
X-Received: by 10.28.212.141 with SMTP id l135mr4601298wmg.122.1521126832468; 
	Thu, 15 Mar 2018 08:13:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Thu, 15 Mar 2018 08:13:51 -0700 (PDT)
In-Reply-To: <20180312164944.39923-4-alexander.kanavin@linux.intel.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
	<20180312164944.39923-4-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Mar 2018 16:13:51 +0100
Message-ID: <CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Thu, 15 Mar 2018 15:14:04 -0000
Content-Type: multipart/alternative; boundary="001a1146959481f907056774f065"

--001a1146959481f907056774f065
Content-Type: text/plain; charset="UTF-8"

Now when more people will use devtool to refresh patches, would it make
sense for devtool to use --no-signature when refreshing patches?

I think git version is not important in this context and causes extra
changes in .patch files (when refreshed by different people with different
git version) or extra work removing that chunk from resulting diff.


On Mon, Mar 12, 2018 at 5:49 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Ignoring patch context increases the chances of patches being
> applied incorrectly. Depending on what code is being patched, this can go
> completely unnoticed and create subtle bugs, sometimes with security
> implications.
>
> Please see here for a specific example:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
>
> On the other hand, we cannot simply force all patch context to match
> exactly:
> doing this would break a lot of recipes suddenly, across all layers.
>
> So let's try a softer approach: issue a warning, and gently update
> patches over a longer span of time. When most of the warnings are
> eliminated,
> we can start enforcing a strict patch application policy.
>
> I do understand that this patch creates a lot of warnings all of a sudden,
> however
> I believe the problem does need to be addressed. All of oe-core recipes
> have their
> context already fixed.
>
> Sample warning:
>
> WARNING: vulkan-1.0.61.1-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored).
> Details:
> Applying patch demos-Don-t-build-tri-or-cube.patch
> patching file demos/CMakeLists.txt
> Hunk #1 succeeded at 63 (offset 2 lines).
> Hunk #2 succeeded at 76 with fuzz 1 (offset 2 lines).
>
> [YOCTO #10450]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/lib/oe/patch.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index f02dee8d27d..bfa7d218792 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -36,6 +36,22 @@ def runcmd(args, dir = None):
>          (exitstatus, output) = oe.utils.getstatusoutput(cmd)
>          if exitstatus != 0:
>              raise CmdError(cmd, exitstatus >> 8, output)
> +        if " fuzz " in output:
> +            bb.warn("""
> +Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> +The context lines in the patches can be updated with devtool:
> +
> +    devtool modify <recipe>
> +    devtool finish --force-patch-refresh <recipe> <layer_path>
> +
> +Then the updated patches and the source tree (in devtool's workspace)
> +should be reviewed to make sure the patches apply in the correct place
> +and don't introduce duplicate lines (which can, and does happen
> +when some of the context is ignored). Further information:
> +http://lists.openembedded.org/pipermail/openembedded-
> core/2018-March/148675.html
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> +Details:
> +{}""".format(output))
>          return output
>
>      finally:
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1146959481f907056774f065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Now when more people will use devtool to refresh patc=
hes, would it make sense for devtool to use --no-signature when refreshing =
patches?</div><div><br></div><div>I think git version is not important in t=
his context and causes extra changes in .patch files (when refreshed by dif=
ferent people with different git version) or extra work removing that chunk=
 from resulting diff.</div><div><br></div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Mon, Mar 12, 2018 at 5:49 PM, Alexander K=
anavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.inte=
l.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Ignoring patch context increases th=
e chances of patches being<br>
applied incorrectly. Depending on what code is being patched, this can go<b=
r>
completely unnoticed and create subtle bugs, sometimes with security implic=
ations.<br>
<br>
Please see here for a specific example:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10450</a><br>
<br>
On the other hand, we cannot simply force all patch context to match exactl=
y:<br>
doing this would break a lot of recipes suddenly, across all layers.<br>
<br>
So let&#39;s try a softer approach: issue a warning, and gently update<br>
patches over a longer span of time. When most of the warnings are eliminate=
d,<br>
we can start enforcing a strict patch application policy.<br>
<br>
I do understand that this patch creates a lot of warnings all of a sudden, =
however<br>
I believe the problem does need to be addressed. All of oe-core recipes hav=
e their<br>
context already fixed.<br>
<br>
Sample warning:<br>
<br>
WARNING: vulkan-1.0.61.1-r0 do_patch:<br>
Some of the context lines in patches were ignored. This can lead to incorre=
ctly applied patches.<br>
The context lines in the patches can be updated with devtool:<br>
<br>
=C2=A0 =C2=A0 devtool modify &lt;recipe&gt;<br>
=C2=A0 =C2=A0 devtool finish --force-patch-refresh &lt;recipe&gt; &lt;layer=
_path&gt;<br>
<br>
Then the updated patches and the source tree (in devtool&#39;s workspace)<b=
r>
should be reviewed to make sure the patches apply in the correct place<br>
and don&#39;t introduce duplicate lines (which can, and does happen<br>
when some of the context is ignored).<br>
Details:<br>
Applying patch demos-Don-t-build-tri-or-cube.<wbr>patch<br>
patching file demos/CMakeLists.txt<br>
Hunk #1 succeeded at 63 (offset 2 lines).<br>
Hunk #2 succeeded at 76 with fuzz 1 (offset 2 lines).<br>
<br>
[YOCTO #10450]<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/patch.py | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
index f02dee8d27d..bfa7d218792 100644<br>
--- a/meta/lib/oe/patch.py<br>
+++ b/meta/lib/oe/patch.py<br>
@@ -36,6 +36,22 @@ def runcmd(args, dir =3D None):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(exitstatus, output) =3D oe.utils.getstat=
usoutput(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if exitstatus !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise CmdError(cmd, exitsta=
tus &gt;&gt; 8, output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot; fuzz &quot; in output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;&quot;&quot;<br>
+Some of the context lines in patches were ignored. This can lead to incorr=
ectly applied patches.<br>
+The context lines in the patches can be updated with devtool:<br>
+<br>
+=C2=A0 =C2=A0 devtool modify &lt;recipe&gt;<br>
+=C2=A0 =C2=A0 devtool finish --force-patch-refresh &lt;recipe&gt; &lt;laye=
r_path&gt;<br>
+<br>
+Then the updated patches and the source tree (in devtool&#39;s workspace)<=
br>
+should be reviewed to make sure the patches apply in the correct place<br>
+and don&#39;t introduce duplicate lines (which can, and does happen<br>
+when some of the context is ignored). Further information:<br>
+<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-=
March/148675.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openem=
bedded.<wbr>org/pipermail/openembedded-<wbr>core/2018-March/148675.html</a>=
<br>
+<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.<wbr>yoctoproject.org/sh=
ow_bug.cgi?<wbr>id=3D10450</a><br>
+Details:<br>
+{}&quot;&quot;&quot;.format(output))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return output<br>
<br>
=C2=A0 =C2=A0 =C2=A0finally:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.1<br>
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

--001a1146959481f907056774f065--
