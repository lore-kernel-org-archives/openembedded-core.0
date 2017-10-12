Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9777B60268;
	Thu, 12 Oct 2017 09:15:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u138so11481184wmu.4;
	Thu, 12 Oct 2017 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bw5UZALloNnlasGPZyCFIdMMhnovyMVaQ5t/jiHXGs4=;
	b=EXB5czdvhA0vyKbs90flxi9JhgFeaU2tthbdNhgLBdWpZPCp0mAHoFb6pmQ8bPJQ5V
	7eNqz3SNdH7ACfmdN+fyAp+CiQE4LlXu4P8Bz8NEnMyqA6ktfNdZIigBSlSnPsBClcWl
	ZSS3yOuYDdmcXuqgzgEX5wdJ5sTVSV+F0zD8quAba8ZxKCFZmqeLuO5pExSE4TEMIKvD
	IB+4UkZIn8FrheZWWS1Z06f/MsYL4CTSTBcbqi0h0V6Y2n4CjQml10NVl6Sb+dPyBA/T
	LozVDCWNfyAGzVhiZUTW+RWB+GqVODeVe3mWbuNbVED7pgx827hScPloJ18MVljV/xuk
	WZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bw5UZALloNnlasGPZyCFIdMMhnovyMVaQ5t/jiHXGs4=;
	b=NUsIWeqfr412UK9K4k/D2mmE86LAgZDpcC/nCPZ/2bXZhP74qSQHrQrxX7ltvBrKEO
	dPbTK4FUXxlaqL2r1ijwDJ1xNZ5ZR4E2gq6PD6oL4FYgavPDChhmHhkEMtWE5cRGVoe6
	Fh4wHmmrKLUPxZEEGx4wCK4EeHah9A/zrfCJ/1zV5v5nCq3L3GuVUQVXhsxEbtaUFhd2
	hwRE/p4uqf8AeH96uKdIKJBOQ+ICGLWl9AaSID3gxpqfQBMEKz2zqPBBJ2kGL/x5DJWo
	jmDqPYjeIjpTfXZvfC25WJCnOs2gi0qGCEqq8Xw5AX//GXh3tUwoGHOIzAPGkOcSrokg
	YiAA==
X-Gm-Message-State: AMCzsaWvWglm8MFRamTiAmcz+7ShWrNTW6l82RFZ0ro/cWatpNSwk8I/
	r//10Oyv881n/Iq9X7L/59gqtm3VQlaF9UiNRRU=
X-Google-Smtp-Source: AOwi7QCEIjMMLcKI0EwQ8S0WOkQtXZshAJYMPj+XbWaXi6nT21MlzXLEQ3aTAJLzLevoee1aXmHSkXhvy+gueF5Y1RQ=
X-Received: by 10.28.58.81 with SMTP id h78mr1387068wma.10.1507799760155; Thu,
	12 Oct 2017 02:16:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Thu, 12 Oct 2017 02:15:59 -0700 (PDT)
In-Reply-To: <20171006112506.A402E234923@git.openembedded.org>
References: <150728910597.4740.17294021018410386238@git.openembedded.org>
	<20171006112506.A402E234923@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Oct 2017 11:15:59 +0200
Message-ID: <CA+chaQe23AkavW6qDkb19ANoGc5J5jak45SMCkug3xoeyRuAfA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 10/10: bash-ptest: install additional locales
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
X-List-Received-Date: Thu, 12 Oct 2017 09:16:00 -0000
Content-Type: multipart/alternative; boundary="001a1148d70818ba44055b55fde9"

--001a1148d70818ba44055b55fde9
Content-Type: text/plain; charset="UTF-8"

This seems to be causing:

NOTE: recipe bash-4.4-r0: task do_package_qa: Started
ERROR: bash-4.4-r0 do_package_qa: QA Issue: bash-ptest rdepends on
locale-base-de-de, but it isn't a build dependency? [build-deps]
ERROR: bash-4.4-r0 do_package_qa: QA Issue: bash-ptest rdepends on
locale-base-fr-fr, but it isn't a build dependency? [build-deps]
ERROR: bash-4.4-r0 do_package_qa: QA run found fatal errors. Please
consider fixing them.
ERROR: bash-4.4-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/bash/4.4-r0/temp/log.do_package_qa.14124
NOTE: recipe bash-4.4-r0: task do_package_qa: Failed
ERROR: Task
(/OE/build/oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.4.bb:do_package_qa)
failed with exit code '1'

And also don't use append together with +=, you already have the leading
space in the value, so this is just confusing people, use normal assignment.

On Fri, Oct 6, 2017 at 1:25 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit 70e544452b6825686f06484d994936ded677825f
> Author: Juro Bystricky <juro.bystricky@intel.com>
> AuthorDate: Thu Oct 5 16:28:12 2017 -0700
>
>     bash-ptest: install additional locales
>
>     bash-ptest fails several tests. This patch fixes:
>
>     FAIL: run-intl
>
>     The test used to fail because of missing locales (fr_FR, de_DE)
>
>     [YOCTO #12145]
>
>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> index f6cb7e4..f8a92b5 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -24,6 +24,7 @@ ALTERNATIVE_PRIORITY = "100"
>  RDEPENDS_${PN} += "base-files"
>  RDEPENDS_${PN}_class-nativesdk = ""
>  RDEPENDS_${PN}-ptest += "make"
> +RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr
> locale-base-de-de"
>
>  USERADD_PACKAGES = "${PN}-ptest"
>  USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
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

--001a1148d70818ba44055b55fde9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be causing:<div><br></div><div><div>NOTE: re=
cipe bash-4.4-r0: task do_package_qa: Started</div><div>ERROR: bash-4.4-r0 =
do_package_qa: QA Issue: bash-ptest rdepends on locale-base-de-de, but it i=
sn&#39;t a build dependency? [build-deps]</div><div>ERROR: bash-4.4-r0 do_p=
ackage_qa: QA Issue: bash-ptest rdepends on locale-base-fr-fr, but it isn&#=
39;t a build dependency? [build-deps]</div><div>ERROR: bash-4.4-r0 do_packa=
ge_qa: QA run found fatal errors. Please consider fixing them.</div><div>ER=
ROR: bash-4.4-r0 do_package_qa: Function failed: do_package_qa</div><div>ER=
ROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/cortexa=
7t2hf-neon-vfpv4-oe-linux-gnueabi/bash/4.4-r0/temp/log.do_package_qa.14124<=
/div><div>NOTE: recipe bash-4.4-r0: task do_package_qa: Failed</div><div>ER=
ROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-extended/bash/b=
ash_4.4.bb:do_package_qa) failed with exit code &#39;1&#39;</div></div><div=
><br></div><div>And also don&#39;t use append together with +=3D, you alrea=
dy have the leading space in the value, so this is just confusing people, u=
se normal assignment.</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Oct 6, 2017 at 1:25 PM,  <span dir=3D"ltr">&lt;<a =
href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@git.openembe=
dded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is =
an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit 70e544452b6825686f06484d994936<wbr>ded677825f<br>
Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro=
.bystricky@intel.com</a>&gt;<br>
AuthorDate: Thu Oct 5 16:28:12 2017 -0700<br>
<br>
=C2=A0 =C2=A0 bash-ptest: install additional locales<br>
<br>
=C2=A0 =C2=A0 bash-ptest fails several tests. This patch fixes:<br>
<br>
=C2=A0 =C2=A0 FAIL: run-intl<br>
<br>
=C2=A0 =C2=A0 The test used to fail because of missing locales (fr_FR, de_D=
E)<br>
<br>
=C2=A0 =C2=A0 [YOCTO #12145]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.byst=
ricky@intel.com">juro.bystricky@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/bash/<wbr>bash.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-extended/bash/<wbr>bash.inc b/meta/recipes-extend=
ed/bash/<wbr>bash.inc<br>
index f6cb7e4..f8a92b5 100644<br>
--- a/meta/recipes-extended/bash/<wbr>bash.inc<br>
+++ b/meta/recipes-extended/bash/<wbr>bash.inc<br>
@@ -24,6 +24,7 @@ ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;base-files&quot;<br>
=C2=A0RDEPENDS_${PN}_class-nativesdk =3D &quot;&quot;<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
+RDEPENDS_${PN}-ptest_append_<wbr>libc-glibc +=3D &quot; locale-base-fr-fr =
locale-base-de-de&quot;<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}-ptest&quot;<br>
=C2=A0USERADD_PARAM_${PN}-ptest =3D &quot;--create-home --user-group test&q=
uot;<br>
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

--001a1148d70818ba44055b55fde9--
