Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA2878412
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:02:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d125so33844849qkc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aikQDefitTapA+WFU+fZ31fGQJWb90aoRDAzLjCnan0=;
	b=JW3L37zH34h0ELD08sJAiDyp087uBUgxyJUwcY5jWwsAEqN9FxOl8YP5aQJeQsU686
	gQJaiYFJ7pzllA0DxPfWW0YTP8PWrDOnXuGkpsfTbiAs53XdEa/dMuQmwuN3SYFklETX
	TsJBE1tIlc3Wx8gNGYIg3uq1IA1v9v34q8rFD+EqLFEhvtICZ+fVKn4sxi1er9GTgOIH
	v9umDTraatv1CIprTt6RsrihC9JsvJefDON+WpfIXp3WlpobvbzEQta1EBpTQltd2rK4
	vHT4Escxb8YduB5VXSNZag4EkVXSZcypYVJ6eQQkApDjxmpkLbk596r+B1PABGUT6s1Q
	EGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aikQDefitTapA+WFU+fZ31fGQJWb90aoRDAzLjCnan0=;
	b=uQOSoBV2ViS4fO/IzKXOvNAOq9Y5K/4nibzWEqOwS6mK3d+ybv6nitDbxtgbyLQ9AS
	cMsIjYu/2ZMSvF0H3ccMLPyyeIX/wiOx5f99aVh8rhqk2s60gtKEt8cu6Wk3wGeqEnSf
	M4fJ2FtCY6RxAO+DZj5zdMB7r4o/cyhq+K+cj1JhFkbU8WRiZOqpJb28S8+bkDKnDOO1
	w1ESg5ivRMGKT+0JVQ+2paGvkDisnmgNaVUerVFHMfKOWi6D6OOhBXNzChE7ANMI9keK
	v1qrvCxuvwq5AYbxFEDZe9hb96j1aFF54uomyfMr6ZCtNZQ4NEX7BGgNyEzap593rktb
	mhhA==
X-Gm-Message-State: AJaThX6x6ub7n9R7EzDwXBQpTaknFMuRiw8MN5eDYICVICCjjxGX2mJI
	DRnTivNjUqnQnDxLtgNcfgOKUSR+HQfs3KWdRHM=
X-Google-Smtp-Source: AGs4zMYzes9fhFX9J58sKWzDVnYOWFdTItjcKcyhtHgjJHPqgpRqmdsZZc6W/KGtJ3ExLx1ymE3yPoh3NyBwz93saLk=
X-Received: by 10.55.15.90 with SMTP id z87mr56805072qkg.141.1511809379045;
	Mon, 27 Nov 2017 11:02:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 27 Nov 2017 11:02:58 -0800 (PST)
In-Reply-To: <20171127190154.19351-1-sgw@linux.intel.com>
References: <20171127190154.19351-1-sgw@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2017 14:02:58 -0500
Message-ID: <CADkTA4OB7M6S-z0K+b1ZmQCzhGoQELGEQ59atyqVd13-pL7nsw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Mon, 27 Nov 2017 19:02:58 -0000
Content-Type: multipart/alternative; boundary="001a113ad2760197a6055efb8d6d"

--001a113ad2760197a6055efb8d6d
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 27, 2017 at 2:01 PM, Saul Wold <sgw@linux.intel.com> wrote:

> We add the kernel-build-artifacts to the cleandirs list to ensure
> that there are no remaining artificats in the kernel-build-artifacts
> directory which is STAGING_KERNEL_BUILDDIR. Without this change
> multiple System.map files are visiable in the STAGING_KERNEL_BUILDDIR,
> which could cause problems for some tools.
>

Looks good!

Cheers,

Bruce


>
> [YOCTO #11880]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 756707a3c25..7ef4f47981c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
>
>  PACKAGEFUNCS += "emit_depmod_pkgdata"
>
> +do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
>  do_shared_workdir () {
>         cd ${B}
>
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113ad2760197a6055efb8d6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 27, 2017 at 2:01 PM, Saul Wold <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We add the kernel-build=
-artifacts to the cleandirs list to ensure<br>
that there are no remaining artificats in the kernel-build-artifacts<br>
directory which is STAGING_KERNEL_BUILDDIR. Without this change<br>
multiple System.map files are visiable in the STAGING_KERNEL_BUILDDIR,<br>
which could cause problems for some tools.<br></blockquote><div><br></div><=
div>Looks good!</div><div><br></div><div>Cheers,</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
[YOCTO #11880]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
</span>=C2=A0meta/classes/kernel.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 756707a3c25..7ef4f47981c 100644<br>
<span class=3D"im HOEnZb">--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -400,6 +400,7 @@ emit_depmod_pkgdata() {<br>
<br>
=C2=A0PACKAGEFUNCS +=3D &quot;emit_depmod_pkgdata&quot;<br>
<br>
+do_shared_workdir[cleandirs] +=3D &quot; ${STAGING_KERNEL_BUILDDIR}&quot;<=
br>
=C2=A0do_shared_workdir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
<br>
</span><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.6<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a113ad2760197a6055efb8d6d--
