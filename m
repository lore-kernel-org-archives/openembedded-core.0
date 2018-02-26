Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9126C60602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 13:09:42 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id k79so7969506ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BMeWdj2xB9XfTEBfQgHWcqHGQLIv86YIZ4zdnlgE9A4=;
	b=v7Zlg8fBkgLitCYUPvEMy+qt7E0+gbNP41a1k8k0ZuUhyXvQWWtC5rZplcYFcBn9v/
	Qd91ayUVjYAjE/ezdug6Y/pCUwZf9pxmbwBjvvv8ImIOsEN+kp83nDJKzZu2/PbgEdYm
	ZQZ0pL4qoyq7FY1slCf4DZYFs8dp6GrpcMj0KNNiTrXGj7dvITw1QCvUeHuHqNP4uwFc
	1G5Jdi0TBX4dmmX5owK/NQ/Qn/jXAc7sKzOWtbSRmzjtY5sDxwhogv98EISVq65iVS2m
	mHGYq+ryAC/se/9W6DuOD4YWRqXLatK2L1p9kXsWdWOzEBdPIpwLBu/PK3ev4VK/XGCj
	vKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BMeWdj2xB9XfTEBfQgHWcqHGQLIv86YIZ4zdnlgE9A4=;
	b=WbqhHICcLTTjtsWdAQa/0gtbRQ0pqOABb7wx6h2QPTlghWQUbdIOwXCYHGjyK6izv7
	Ejf5Yn9WMw4PpRwLPGKEla+SNTv/q8fpxFdhxqx+qyArqzk2Fv58qgCYSNiJ1mDD6MGW
	l1pUJBqRD0FdZJ+BsBUKJfQHqiqFaM4G/hZNSVfg0+QFL7NraLwwGZfAU2VN7kPYtBag
	+Lz6Fprw+BdObpg94WgUwrz6bCcJNVxr4Zr9pblhNIjBOmkELHkeYOURu0ceud16x7i5
	a+bF+fsUH/O4Kr61Tjig5+Xuthz9PA+HRw0BiehDztC+0ooMPTAn0GhjXp6ErLL8duHq
	JHeg==
X-Gm-Message-State: APf1xPCMihRDQ2FjBwypZHDEmdUeSlfsOiRwr4mpIA4MXULd4VtLMyoS
	86te+Z+yOXjFf6futyFFMm/8lJUGBZmAiI3nXGyHAg==
X-Google-Smtp-Source: AG47ELsQjcaG7iOn1l4O/ctThOi/dU8Gw8LOTTSw6N2Q3/EjLdaZZC8ANkSSsg9tMnahSvzjhljvBx6rJuO8NoXBHLo=
X-Received: by 10.36.82.84 with SMTP id d81mr12321150itb.34.1519650584405;
	Mon, 26 Feb 2018 05:09:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 26 Feb 2018 05:09:23 -0800 (PST)
In-Reply-To: <20180223151159.11743-1-raj.khem@gmail.com>
References: <20180223151159.11743-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Feb 2018 13:09:24 +0000
Message-ID: <CAJTo0LYB7dkFNV434YpwXFuh+7k5eiFY6N7kOf0FdnpJq9dWVA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.19 release point
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
X-List-Received-Date: Mon, 26 Feb 2018 13:09:43 -0000
Content-Type: multipart/alternative; boundary="001a1144924844424505661d398e"

--001a1144924844424505661d398e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: musl-1.1.19+gitAUTOINC+55df09bfcc-r0 do_populate_lic: QA Issue:
musl: The LIC_FILES_CHKSUM does not match for
file://COPYRIGHT;md5=3D7928b7ad32ceda04932478e330e52f7f
musl: The new md5 checksum is 2b9032093c4765e49ae85ddeba29afff
musl: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
musl as a whole is licensed under the following standard MIT license:

----------------------------------------------------------------------
Copyright =C2=A9 2005-2014 Rich Felker, et al.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
...
Szabolcs Nagy

all of whom have explicitly granted such permission.

This file previously contained text expressing a belief that most of
the files covered by the above exception were sufficiently trivial not
to be subject to copyright, resulting in confusion over whether it
negated the permissions granted in the license. In the spirit of
permissive licensing, and of not having licensing issues being an
obstacle to adoption, that text has been removed.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
musl: Check if the license information has changed in
/data/poky-tmp/master-musl/build/work/corei7-64-poky-linux-musl/musl/1.1.19=
+gitAUTOINC+55df09bfcc-r0/git/COPYRIGHT
to verify that the LICENSE value "MIT" remains valid [license-checksum]
ERROR: musl-1.1.19+gitAUTOINC+55df09bfcc-r0 do_populate_lic: Fatal QA
errors found, failing task.
ERROR: musl-1.1.19+gitAUTOINC+55df09bfcc-r0 do_populate_lic: Function
failed: populate_lic_qa_checksum
ERROR: Logfile of failure stored in:
/data/poky-tmp/master-musl/build/work/corei7-64-poky-linux-musl/musl/1.1.19=
+gitAUTOINC+55df09bfcc-r0/temp/log.do_populate_lic.27493
ERROR: Task (/home/ross/Yocto/poky/meta/recipes-core/musl/musl_git.bb:do_po=
pulate_lic)
failed with exit code '1'

On 23 February 2018 at 15:11, Khem Raj <raj.khem@gmail.com> wrote:

> Changes from the current commit
>
> https://git.musl-libc.org/cgit/musl/log/?qt=3Drange&q=3D
> 628cf979b249fa76a80962e2eefe05073216a4db..55df09bfccbfe21fc9dd7d8f94550c
> 0ff25ace04
>
> Summary of this release
> http://www.openwall.com/lists/musl/2018/02/22/2
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
> musl_git.bb
> index 8b2cb4d49d..8906ac6beb 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,9 +3,9 @@
>
>  require musl.inc
>
> -SRCREV =3D "628cf979b249fa76a80962e2eefe05073216a4db"
> +SRCREV =3D "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
>
> -PV =3D "1.1.18+git${SRCPV}"
> +PV =3D "1.1.19+git${SRCPV}"
>
>  # mirror is at git://github.com/kraj/musl.git
>
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144924844424505661d398e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ERROR: musl-1.1.19+gitAUTOINC+55df09bfcc-r0 do_popula=
te_lic: QA Issue: musl: The LIC_FILES_CHKSUM does not match for file://COPY=
RIGHT;md5=3D7928b7ad32ceda04932478e330e52f7f</div><div>musl: The new md5 ch=
ecksum is 2b9032093c4765e49ae85ddeba29afff</div><div>musl: Here is the sele=
cted license text:</div><div>vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv=
vvvvvvvvvvvvvvvvvvvvvvvv</div><div>musl as a whole is licensed under the fo=
llowing standard MIT license:</div><div><br></div><div>--------------------=
--------------------------------------------------</div><div>Copyright =C2=
=A9 2005-2014 Rich Felker, et al.</div><div><br></div><div>Permission is he=
reby granted, free of charge, to any person obtaining</div><div>a copy of t=
his software and associated documentation files (the</div><div>&quot;Softwa=
re&quot;), to deal in the Software without restriction, including</div><div=
>without limitation the rights to use, copy, modify, merge, publish,</div><=
div>distribute, sublicense, and/or sell copies of the Software, and to</div=
><div>...</div><div>Szabolcs Nagy</div><div><br></div><div>all of whom have=
 explicitly granted such permission.</div><div><br></div><div>This file pre=
viously contained text expressing a belief that most of</div><div>the files=
 covered by the above exception were sufficiently trivial not</div><div>to =
be subject to copyright, resulting in confusion over whether it</div><div>n=
egated the permissions granted in the license. In the spirit of</div><div>p=
ermissive licensing, and of not having licensing issues being an</div><div>=
obstacle to adoption, that text has been removed.</div><div>^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</div><div>musl: Che=
ck if the license information has changed in /data/poky-tmp/master-musl/bui=
ld/work/corei7-64-poky-linux-musl/musl/1.1.19+gitAUTOINC+55df09bfcc-r0/git/=
COPYRIGHT to verify that the LICENSE value &quot;MIT&quot; remains valid [l=
icense-checksum]</div><div>ERROR: musl-1.1.19+gitAUTOINC+55df09bfcc-r0 do_p=
opulate_lic: Fatal QA errors found, failing task.</div><div>ERROR: musl-1.1=
.19+gitAUTOINC+55df09bfcc-r0 do_populate_lic: Function failed: populate_lic=
_qa_checksum</div><div>ERROR: Logfile of failure stored in: /data/poky-tmp/=
master-musl/build/work/corei7-64-poky-linux-musl/musl/1.1.19+gitAUTOINC+55d=
f09bfcc-r0/temp/log.do_populate_lic.27493</div><div>ERROR: Task (/home/ross=
/Yocto/poky/meta/recipes-core/musl/musl_git.bb:do_populate_lic) failed with=
 exit code &#39;1&#39;</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 23 February 2018 at 15:11, Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Changes from the=
 current commit<br>
<br>
<a href=3D"https://git.musl-libc.org/cgit/musl/log/?qt=3Drange&amp;q=3D628c=
f979b249fa76a80962e2eefe05073216a4db..55df09bfccbfe21fc9dd7d8f94550c0ff25ac=
e04" rel=3D"noreferrer" target=3D"_blank">https://git.musl-libc.org/<wbr>cg=
it/musl/log/?qt=3Drange&amp;q=3D<wbr>628cf979b249fa76a80962e2eefe05<wbr>073=
216a4db..<wbr>55df09bfccbfe21fc9dd7d8f94550c<wbr>0ff25ace04</a><br>
<br>
Summary of this release<br>
<a href=3D"http://www.openwall.com/lists/musl/2018/02/22/2" rel=3D"noreferr=
er" target=3D"_blank">http://www.openwall.com/lists/<wbr>musl/2018/02/22/2<=
/a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_<wbr>git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">musl_<wbr>git.bb</a> b/meta/recipes-core/musl/=
<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_<w=
br>git.bb</a><br>
index 8b2cb4d49d..8906ac6beb 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_<wbr>git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_<wbr>git.bb</a><br>
@@ -3,9 +3,9 @@<br>
<br>
=C2=A0require musl.inc<br>
<br>
-SRCREV =3D &quot;<wbr>628cf979b249fa76a80962e2eefe05<wbr>073216a4db&quot;<=
br>
+SRCREV =3D &quot;<wbr>55df09bfccbfe21fc9dd7d8f94550c<wbr>0ff25ace04&quot;<=
br>
<br>
-PV =3D &quot;1.1.18+git${SRCPV}&quot;<br>
+PV =3D &quot;1.1.19+git${SRCPV}&quot;<br>
<br>
=C2=A0# mirror is at git://<a href=3D"http://github.com/kraj/musl.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/kraj/musl.git</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.16.2<br>
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

--001a1144924844424505661d398e--
