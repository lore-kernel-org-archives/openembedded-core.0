Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBB977025
	for <openembedded-core@openembedded.org>;
	Thu,  4 Aug 2016 20:06:07 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l69so189379463lfg.1
	for <openembedded-core@openembedded.org>;
	Thu, 04 Aug 2016 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KZjjPhvJ/nDAj1kMoZLRKPbtcyL3x/BgBUlqg6nnRdc=;
	b=aysoUz+nk55nh2LOX8hBtKxFsSoFyxQ0YU8KeJ11FARN1FJtWYEmEdzr7DPlp7i1mX
	Pps4LVZCoxAiCVNMn8XTftH7CxtBTdjDPBjaneqUNc6kqRzUHQpGKWK18x8JkaVQfISq
	TyklckhKZq/vsdtP6yg8/DBZgwfhumLp+txtVU6rFoC5RWUkIWcjEXIC+xqFOVkOJI02
	S1mvQcEGC7QIQEKuNIpTo2BDmCavkt/z3sWe0AO75uhDx6ZYm5QMtc5OzOPepc7XPlA2
	FAVESJ8i8s1E5RLCwkmS7Q90XdmHfRlj8ljBgBejxCrHnD93bkG1jfoA9Ce6b8jKsS1j
	ktTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KZjjPhvJ/nDAj1kMoZLRKPbtcyL3x/BgBUlqg6nnRdc=;
	b=m6TNqmMPUQfIodNL2gRXDor29Z7I44fm5j3pJDsH5fv28J8jVxCJmiXDxyasDFz8vO
	fUmhHCu3Rg2Z31GQHRJTybFYorqoThvMK7WIQw4GDc1XcRgXa2TrufXEoy8aLwpJkW1q
	DFhRDJi4/zwFoLATKcQOKp7zuUHIbAKUCf1vkbW8YPDmRb9gX12DGXoA8ygLggdEF/CS
	rQudGMEmFWdq34eQmq8UzcWP+JakdWXOgqLPOa/uX9rgZP1l/wy341SVmjOzNW36mMzu
	DVuN/AqK2Ctkw15mcXZ31/fvoOSWCogn7QuNn+7eGZgmGMtSnpQWCl2w94Cb9Lo+o4g+
	KJFg==
X-Gm-Message-State: AEkoousJB5Gc2mkUlpGxpwa1FItf7FGQhYkkU2lFlBQRfD5WRLP7kMcPE1jLWn/ceMj6JoS/6cuki8gaUAex+Q==
X-Received: by 10.46.1.195 with SMTP id f64mr22091844lji.24.1470341167776;
	Thu, 04 Aug 2016 13:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 4 Aug 2016 13:06:07 -0700 (PDT)
In-Reply-To: <20160804195640.1105.71618@opal.openembedded.org>
References: <20160804195640.1105.71618@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Aug 2016 22:06:07 +0200
Message-ID: <CA+chaQc2YTwHbDTG6ABTfVq1Qrv3T9m8SMHPDv2qjL_gEknu=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@openembedded.org
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated: Revert "packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput"
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
X-List-Received-Date: Thu, 04 Aug 2016 20:06:09 -0000
Content-Type: multipart/alternative; boundary=001a1142bee80108550539447b83

--001a1142bee80108550539447b83
Content-Type: text/plain; charset=UTF-8

I think it shouldn't be merged at all.

xinput-calibrator already RRECOMMENDS pointercal-xinput

And empty pointercal-xinput (with Ross's ALLOW_EMPTY patch) is as useless
as pointercal-xinput without xinput-calibrator.

On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> The following commit(s) were added to refs/heads/master by this push:
>        new  c4dda05   Revert "packagegroup-core-x11-base.bb: replace
> pointercal with pointercal-xinput"
> c4dda05 is described below
>
> commit c4dda05cb9755cb865c1d1bd142196f8a9f45d3d
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Thu Aug 4 20:54:57 2016 +0100
>
>     Revert "packagegroup-core-x11-base.bb: replace pointercal with
> pointercal-xinput"
>
>     This reverts commit a93c45fa77eb7ea31b91d5bad3c64634bd1476ee until we
> merge
>     the rest of the pointercal patches.
> ---
>  meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-
> core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-
> core-x11-base.bb
> index 6e8e50d..db3dfe3 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> @@ -10,7 +10,7 @@ RDEPENDS_${PN} = "\
>      packagegroup-core-x11-xserver \
>      packagegroup-core-x11-utils \
>      dbus \
> -    pointercal-xinput \
> +    pointercal \
>      matchbox-terminal \
>      matchbox-wm \
>      mini-x-session \
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a1142bee80108550539447b83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think it shouldn&#39;t be merged at all.<div><br></div><=
div>xinput-calibrator already RRECOMMENDS pointercal-xinput</div><div><br><=
/div><div>And empty pointercal-xinput (with Ross&#39;s ALLOW_EMPTY patch) i=
s as useless as pointercal-xinput without xinput-calibrator.</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 4, 2016 =
at 9:56 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.o=
rg" target=3D"_blank">git@git.openembedded.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
The following commit(s) were added to refs/heads/master by this push:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0new=C2=A0 c4dda05=C2=A0 =C2=A0Revert &quot;<a hr=
ef=3D"http://packagegroup-core-x11-base.bb" rel=3D"noreferrer" target=3D"_b=
lank">packagegroup-core-x11-base.bb</a><wbr>: replace pointercal with point=
ercal-xinput&quot;<br>
c4dda05 is described below<br>
<br>
commit c4dda05cb9755cb865c1d1bd142196<wbr>f8a9f45d3d<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
AuthorDate: Thu Aug 4 20:54:57 2016 +0100<br>
<br>
=C2=A0 =C2=A0 Revert &quot;<a href=3D"http://packagegroup-core-x11-base.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-core-x11-base.bb</a><wbr=
>: replace pointercal with pointercal-xinput&quot;<br>
<br>
=C2=A0 =C2=A0 This reverts commit a93c45fa77eb7ea31b91d5bad3c646<wbr>34bd14=
76ee until we merge<br>
=C2=A0 =C2=A0 the rest of the pointercal patches.<br>
---<br>
=C2=A0meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://pac=
kagegroup-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegro=
up-<wbr>core-x11-base.bb</a> b/meta/recipes-graphics/<wbr>packagegroups/<a =
href=3D"http://packagegroup-core-x11-base.bb" rel=3D"noreferrer" target=3D"=
_blank">packagegroup-<wbr>core-x11-base.bb</a><br>
index 6e8e50d..db3dfe3 100644<br>
--- a/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>packagegroups/<a href=3D"http://packagegro=
up-core-x11-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr=
>core-x11-base.bb</a><br>
@@ -10,7 +10,7 @@ RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-core-x11-xserver \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-core-x11-utils \<br>
=C2=A0 =C2=A0 =C2=A0dbus \<br>
-=C2=A0 =C2=A0 pointercal-xinput \<br>
+=C2=A0 =C2=A0 pointercal \<br>
=C2=A0 =C2=A0 =C2=A0matchbox-terminal \<br>
=C2=A0 =C2=A0 =C2=A0matchbox-wm \<br>
=C2=A0 =C2=A0 =C2=A0mini-x-session \<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--001a1142bee80108550539447b83--
