Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8BC7804A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 12:56:39 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id b2so15695327iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xiroMrY0m7RFCbpjLm/dH6FZeKgNIG1LorQtm2wMDLU=;
	b=oaaS8A9OOT3omwvi1s0We2NVpBonrmmQzHcYAdIKb4qVOOoBZNXGP3wa8O1d0cv0XF
	27FO4UjdNZ2LXaIwOz9QKAW3BS2Pw3St+HTMlFEzZbPvYA5gzJ8vgH7GzwnKjrdDgcBO
	1flrkM0ynycO7BzPwEQ/ANmsHPMeYoyFfigLBgkaN4TYa/kZL5YXJ6S6hLD4T3fCkgNm
	jRDjL2ZDfpbQzk2aC8QY9SdO1Hvn+mjgt1Kl+Gi87k7LqmHZ/AK4FSdxBeJX1vIDOVJM
	xk2LssMoLQ1UM9BPk0T4XG5gEg/wY2tWcBjJS1iUmIQ5KZ5quUR8WjegpQLA6PfKuY5H
	ywVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xiroMrY0m7RFCbpjLm/dH6FZeKgNIG1LorQtm2wMDLU=;
	b=e16Rh+jZTc77h9DPa5gvB71ZNoPVLqDCeHOyI6F7U9PFv6GhEzkcE11n6iXLnud72G
	Sg1eH6rXJoWLOUUmbMsudccgTkPAdC1zS4fvCHL/r5NhD04itXmBiTKQvZfszia1PgZ1
	b0zZ+afQcCgF1uHuAWbq6g9p+IoZLRxCYepIEuAsQC7oU0B7109Q4M3ke0TgZ3Vkri3s
	BArmouExJ9yCQkAvevbo91B3vig3zGs8vMCX9/nfFTUBOti5wmi1H8psRnEiLiI8NTO4
	niOXbs+w4DkJjppQL6TR05TCYjUHraTYXWcDVWMNpheQCUnTGv+yaSm1hMLkxDutZcKC
	ORig==
X-Gm-Message-State: AHPjjUiAbMVAjJWIuWxGQKzXQ84PZowYaOW98ZTvNrm/mYIsyy+JPXup
	92D3Wp9V6mcZHcGlMi+8A1+zmHLJeZLp
X-Google-Smtp-Source: ADKCNb4hQH9E09NCAZ6z86Z1IfRJspHKLomHlQXqh552ATubmEs/MEJ2Uo1EROXaOI8O+fB8J230WAznPWinLW373DU=
X-Received: by 10.36.143.195 with SMTP id k186mr4019823itd.88.1504616200638;
	Tue, 05 Sep 2017 05:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 05:56:20 -0700 (PDT)
In-Reply-To: <1504601799-14566-1-git-send-email-B40290@freescale.com>
References: <1504601799-14566-1-git-send-email-B40290@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 13:56:20 +0100
Message-ID: <CAJTo0LbsHMfwS=xAD1AvymTU8UT_kL-4M-nevdS97K=nAs6mdw@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: chunrong.guo@nxp.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Drop obsoleted bits/pthreadtypes-arch.h from multilibbing
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
X-List-Received-Date: Tue, 05 Sep 2017 12:56:39 -0000
Content-Type: multipart/alternative; boundary="001a1145ed8229a8f2055870c2bd"

--001a1145ed8229a8f2055870c2bd
Content-Type: text/plain; charset="UTF-8"

The patch does the exact opposite of the commit message, and doesn't
explain why it is doing what it is doing.

Ross

On 5 September 2017 at 09:56, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index a291148..df3db2c 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -138,7 +138,7 @@ do_install_append_armeb () {
>  do_install_armmultilib () {
>
>         oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h
> bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
> -       oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h
> bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
> +       oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h
> bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h
> bits/setjmp.h
>         oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h
> bits/statfs.h bits/typesizes.h
>
>         oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h
> ieee754.h
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1145ed8229a8f2055870c2bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patch does the exact opposite of the commit message, a=
nd doesn&#39;t explain why it is doing what it is doing.<div><br></div><div=
>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 September 2017 at 09:56, Chunrong Guo <span dir=3D"ltr">&lt;<a href=3D=
"mailto:B40290@freescale.com" target=3D"_blank">B40290@freescale.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chunrong Guo &lt;<a=
 href=3D"mailto:chunrong.guo@nxp.com">chunrong.guo@nxp.com</a>&gt;<br>
<br>
Signed-off-by: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chu=
nrong.guo@nxp.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-<wbr>package.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc-package.inc b/meta/recipes-=
core/glibc/<wbr>glibc-package.inc<br>
index a291148..df3db2c 100644<br>
--- a/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
@@ -138,7 +138,7 @@ do_install_append_armeb () {<br>
=C2=A0do_install_armmultilib () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header bits/endian.h bits/fcntl.h b=
its/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize=
.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header bits/local_lim.h bits/mman.h=
 bits/msq.h bits/pthreadtypes.h=C2=A0 bits/sem.h=C2=A0 bits/semaphore.h bit=
s/setjmp.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header bits/local_lim.h bits/mman.h=
 bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h=C2=A0 bits/sem.h=
=C2=A0 bits/semaphore.h bits/setjmp.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header bits/shm.h bits/sigstack.h b=
its/stat.h bits/statfs.h bits/typesizes.h<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header fpu_control.h gnu/lib-names.=
h gnu/stubs.h ieee754.h<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.0<br>
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

--001a1145ed8229a8f2055870c2bd--
