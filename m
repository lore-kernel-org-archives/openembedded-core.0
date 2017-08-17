Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A264178549
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 16:14:45 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id r9so1172188uad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S7G+m84pixZiJXw+tBAdp8ywrfIUz23ZUHvRo6s2Qdk=;
	b=N+BlJd3RQYLKEwonTrQYWYR8vJXlxSuZtDxAznlo0hATspSxRrw/lEXWp61AL3O/Yk
	CilPvfQJ3YGlvJc9We6B82Bu7SAho6BTi/GA4ZJXTVQcCNZkypNqdsvVbLQ3iwHF+BFl
	gkz8bsQhOC6kMn5sZcrdGCBNVRO3YmQt7rp3t/MlijId951XrjnwJ0KMD/QP2ui0LFuP
	Fp8J1VqcCb9RU18bEZexWXWbTFBK/vdDQL0NYJsCoJZSqFOhS4obTOFtL4xYMMw2giT/
	g2Pokcu1iL/VlVi3fcBnIGa0H3zKRy36L29wkwa0JQ3iOBhvkW0j3GenpzOlzDt0SF40
	HPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S7G+m84pixZiJXw+tBAdp8ywrfIUz23ZUHvRo6s2Qdk=;
	b=E0ien93ZBXfDtgkUpsHCp65YfPy3gamldKScIqH+vVk7h886yREf6snYzxBerr+/SA
	WISibz4Qt08TZt9voh5DjhgqHrZiYRoAv7tVXzFWVp9SvnZs3tBy8dviHG5mUQADvYfT
	37wPWcCv8B4uNa34wdraLGILofl1RwhPHKXgf7+1tIgdzkkodWhNgvv4FVGkOLVBpP1n
	ah1bHi7LPu6Rl1EJ/Fzt6V9jlmOHMtR3K7MZ1JGVUlDifWfAc3BH8TPSF8dA3o+2Yar5
	ehyQ3zBUxvHvlsqIl7P3NZqavhQ0OLDjaiHEbCdoW8ViwMAFCtRoAwysC2A1vSMZN8F/
	790A==
X-Gm-Message-State: AHYfb5gVFqWim69UOPZyDl2qS1Fu3TH9mGR64e/z5f11NcpqbsV97aGf
	EQAQM6oDlWkXX2N4r6D9fIuxRfP1qA==
X-Received: by 10.176.28.71 with SMTP id o7mr3458248uaj.38.1502986486431; Thu,
	17 Aug 2017 09:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.84.146 with HTTP; Thu, 17 Aug 2017 09:14:26 -0700 (PDT)
In-Reply-To: <1502300913-40295-11-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-11-git-send-email-juro.bystricky@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 17 Aug 2017 09:14:26 -0700
Message-ID: <CABcZANk_PWQQTgFvVaSBJ-vGFMeF=LfGRdqcETFNHn-A_3osEA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 10/11] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Thu, 17 Aug 2017 16:14:45 -0000
Content-Type: multipart/alternative; boundary="f403043e7a08a045b30556f54f2a"

--f403043e7a08a045b30556f54f2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2017 at 10:48 AM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Several tweaks to improve reproducibility:
>
> 1. If BUILD_REPRODUCIBLE_BINARIES =3D=3D 1, set KBUILD_BUILD_TIMESTAMP
> to a reproducible value. This is either a non-zero SOURCE_DATE_EPOCH, or
> the
> value obtained from top entry of GIT repo, or (if there is no GIT repo)
> fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as the last resort.
> Also export KCONFIG_NOTIMESTAMP=3D1.
>
> 2. When compressing vmlinux.gz, use gzip "-n" option
>
> 3. Kernel and kernel modules contain hard coded paths referencing the hos=
t
> build system. This is usually because the source code contains __FILE__
> at some place. This prevents binary reproducibility. However, some
> compilers
> allow remapping of the __FILE__ value. If we detect the compiler is capab=
le
> of doing this, we replace the source path $(S) part of __FILE__ by a
> string "/kernel-source".
> For example:
>
> =E2=80=8B/data/master/build/tmp/work-shared/qemux86/kernel-source/
> drivers/media/v4l2-core/videobuf2-core.=E2=80=8Bc
>
> will be replaced by a reproducible value:
>
> /kernel-source/drivers/media/v4l2-core/videobuf2-core.c.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/kernel.bbclass | 39 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce2cab6..2a76554 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -255,8 +255,39 @@ python do_devshell_prepend () {
>
>  addtask bundle_initramfs after do_install before do_deploy
>
> +get_cc_option () {
> +               # Check if KERNEL_CC supports the option "file-prefix-map=
".
> +               # This option allows us to build images with __FILE__
> values that do not
> +               # contain the host build path.
> +               cc_option_supported=3D`${KERNEL_CC} -Q --help=3Djoined | =
grep
> ffile-prefix-map`
>

This fails the do_compile task if ffile-prefix-map isn=E2=80=99t found in t=
he help
output, resulting in build failures with an external toolchain, for
example. This function doesn=E2=80=99t work the way you intended at all. It=
 also
fails to quote things properly, uses the old `` syntax rather than $(), and
relies on grep output rather than grep exit codes.

At a minimum we need a =E2=80=9C|| true=E2=80=9D or =E2=80=9C|| :=E2=80=9D =
on the end of the
cc_option_supported=3D line. I don=E2=80=99t see why this doesn=E2=80=99t j=
ust do this,
instead, though:

    if ${KERNEL_CC} -Q =E2=80=94help=3Djoined | grep -q
=E2=80=9C\-ffile-prefix-map=3D<old=3Dnew>=E2=80=9D; then
        echo =E2=80=9C\-ffile-prefix-map=3D${S}=3D/kernel-source/=E2=80=9C
    fi
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--f403043e7a08a045b30556f54f2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 9, 2017 at 10:48 AM, Juro Bystricky <span dir=3D"ltr">&lt;<=
a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">Several tweaks to impr=
ove reproducibility:<br>
<br>
1. If BUILD_REPRODUCIBLE_BINARIES =3D=3D 1, set KBUILD_BUILD_TIMESTAMP<br>
to a reproducible value. This is either a non-zero SOURCE_DATE_EPOCH, or th=
e<br>
value obtained from top entry of GIT repo, or (if there is no GIT repo)<br>
fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as the last resort.<br>
Also export KCONFIG_NOTIMESTAMP=3D1.<br>
<br>
2. When compressing vmlinux.gz, use gzip &quot;-n&quot; option<br>
<br>
3. Kernel and kernel modules contain hard coded paths referencing the host<=
br>
build system. This is usually because the source code contains __FILE__<br>
at some place. This prevents binary reproducibility. However, some compiler=
s<br>
allow remapping of the __FILE__ value. If we detect the compiler is capable=
<br>
of doing this, we replace the source path $(S) part of __FILE__ by a string=
 &quot;/kernel-source&quot;.<br>
For example:<br>
<br>
=E2=80=8B/data/master/build/tmp/work-<wbr>shared/qemux86/kernel-source/<wbr=
>drivers/media/v4l2-core/<wbr>videobuf2-core.=E2=80=8Bc<br>
<br>
will be replaced by a reproducible value:<br>
<br>
/kernel-source/drivers/media/<wbr>v4l2-core/videobuf2-core.c.<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 39 ++++++++++++++++++++++++++++++<wbr>+=
+++++---<br>
=C2=A01 file changed, 36 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index ce2cab6..2a76554 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -255,8 +255,39 @@ python do_devshell_prepend () {<br>
<br>
=C2=A0addtask bundle_initramfs after do_install before do_deploy<br>
<br>
+get_cc_option () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if KERNEL_C=
C supports the option &quot;file-prefix-map&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This option allow=
s us to build images with __FILE__ values that do not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# contain the host =
build path.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc_option_supported=
=3D`${KERNEL_<wbr>CC} -Q --help=3Djoined | grep ffile-prefix-map`<br></bloc=
kquote><div><br></div><div>This fails the do_compile task if ffile-prefix-m=
ap isn=E2=80=99t found in the help output, resulting in build failures with=
 an external toolchain, for example. This function doesn=E2=80=99t work the=
 way you intended at all. It also fails to quote things properly, uses the =
old `` syntax rather than $(), and relies on grep output rather than grep e=
xit codes.</div><div><br></div><div>At a minimum we need a =E2=80=9C|| true=
=E2=80=9D or =E2=80=9C|| :=E2=80=9D on the end of the cc_option_supported=
=3D line. I don=E2=80=99t see why this doesn=E2=80=99t just do this, instea=
d, though:</div><div><br></div><div>=C2=A0 =C2=A0 if ${KERNEL_CC} -Q =E2=80=
=94help=3Djoined | grep -q =E2=80=9C\-ffile-prefix-map=3D&lt;old=3Dnew&gt;=
=E2=80=9D; then</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo =E2=80=9C\-ffile=
-prefix-map=3D${<wbr>S}=3D/kernel-source/=E2=80=9C</div><div>=C2=A0 =C2=A0 =
fi</div></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr"><div><=
div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder -=
 BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Grap=
hics</div></div></div></div>
</div></div>

--f403043e7a08a045b30556f54f2a--
