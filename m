Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D79987FEFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 18:37:11 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 21so3762295qky.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 10:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KLlKkRXowQeCfl20DYOgvRlLcOl17kdxtK+i09R2AoY=;
	b=bC757s3ztvg3DCNob5q3hKYBvds2IY/iC6PzLBQODh8ChgwM9DHhdC8S2PO9Oq5q5x
	8wu5WPEb2KKH6IRFu8GNrRx0QQKcwg1Y1Fdg6Xs4xNb3VdGJh+TK4dCV5hrJUATIhzSI
	Q3cnLsOUomAwssPCi5ucTtes/RuXuujGTv9D9sKcxGQBSJHJHc6YU1j+UqabkU7vrHt6
	TX92aFzs6Q76866yqer3lwUBMJ+DJ3ujF1RT6k7F5ewVj2i6TgrBr+TqbimcEGetXnCM
	p0c/REogiZ9oqN3GZoyEWJODmVD9KvHBqEGVAo9AGDR3CoLQcITHGZ6Y1y5ZSoK+fb62
	hXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KLlKkRXowQeCfl20DYOgvRlLcOl17kdxtK+i09R2AoY=;
	b=pwTBsu3iyEkShqsYKnsmKmb6J3UTGjHsPQ72hZR7J5XgFO4Z3qBwH5eU4GYsd4j8hA
	WDDe5QVprUBRybLQcegaZ9b9evs6rO8ApqIXj0Qou3vBpQq1k0rT4w5DhZPCqoKq5fHs
	qECsDgO1XIyFrVLsLLxNfWedZUC4FzwVHgA6txqtCasir187e9VGd7q9NADj1vgjtlPL
	URs5+/74G24uHq3T/Ow3bWtXLb9UiAVXMknZL+5U1h33PfH51K4jBqShpmiyqw5gS2JB
	7ijqflsi3Ii40aq9F84A4rPemF0A0tWsoig80iHtD2gkK71qCWFSbJXmrkvyIWAXaYoL
	qi+g==
X-Gm-Message-State: APjAAAXKOiHdhKQBieNQuRpCEgdP2AFznIgEcp6RgErMi6dxZgrJhmh0
	WT+4WEO7+nhHqGlgBMaq68HaBABr5yyraA+tMZc=
X-Google-Smtp-Source: APXvYqwWw1pJKIF3cw37+TM0xHf7mXuILbMswV/+KAejTxkGJUx8wuFnx+j/k8hOrA5ZaR96HleM0pYDeG0+pWYLcFI=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr6147999qkh.9.1579631832423; 
	Tue, 21 Jan 2020 10:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20200121071906.1102-1-mingli.yu@windriver.com>
In-Reply-To: <20200121071906.1102-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 10:36:52 -0800
Message-ID: <CAMKF1sr6vSk8U5pVhgnwFW8HTsA7VGKc0trS=2t7XLuoJZXcaQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-common.inc: disable orc on mips
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
X-List-Received-Date: Tue, 21 Jan 2020 18:37:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 11:19 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> After transiton to meson build for gstreamer series,
> for gstreamer1.0-plugins-base, with below two commits
> introduced:
> 238080ed89 gstreamer: Remove unused common files and patches
> 20614408dc gstreamer1.0-plugins-base: Transition to meson based builds
>
> With below config in local.conf
> MACHINE ??=3D "qemumips64"
> require conf/multilib.conf
> MULTILIB_GLOBAL_VARIANTS_append =3D " libn32"
> MULTILIBS ?=3D "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?=3D "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?=3D "mips64-n32"
>
> there comes below failure:
> $ bitbake lib32-gstreamer1.0-plugins-base
> [snip]
> mips-pokymllib32-linux-gcc -meb -mabi=3D32 -mhard-float -fstack-protector=
-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-s=
ecurity --sysroot=3D/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreame=
r1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot -Itests/check/7d01337@@orc=
_video@exe -Itests/check -I../gst-plugins-base-1.16.1/tests/check -I/mybuil=
d/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0=
/lib32-recipe-sysroot/usr/include/orc-0.4 -fdiagnostics-color=3Dalways -pip=
e -D_FILE_OFFSET_BITS=3D64 -fvisibility=3Dhidden -fno-strict-aliasing -DG_D=
ISABLE_CAST_CHECKS -Wmissing-declarations -Wredundant-decls -Wundef -Wwrite=
-strings -Wformat -Wformat-nonliteral -Wformat-security -Winit-self -Wmissi=
ng-include-dirs -Waddress -Wno-multichar -Wvla -Wpointer-arith -Wmissing-pr=
ototypes -Wdeclaration-after-statement -O2 -g -feliminate-unused-debug-type=
s -fmacro-prefix-map=3D/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstre=
amer1.0-plugins-base/1.16.1-r0=3D/u
>  sr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fdebug-prefix-ma=
p=3D/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-bas=
e/1.16.1-r0=3D/usr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fde=
bug-prefix-map=3D/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.=
0-plugins-base/1.16.1-r0/lib32-recipe-sysroot=3D -fdebug-prefix-map=3D/mybu=
ild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-=
r0/recipe-sysroot-native=3D -MD -MQ 'tests/check/7d01337@@orc_video@exe/mes=
on-generated_.._orc_video.c.o' -MF 'tests/check/7d01337@@orc_video@exe/meso=
n-generated_.._orc_video.c.o.d' -o 'tests/check/7d01337@@orc_video@exe/meso=
n-generated_.._orc_video.c.o' -c tests/check/orc_video.c
> FAILED: tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c=
.o
> {standard input}: Assembler messages:
> {standard input}:46587: Error: branch out of range
> {standard input}:46613: Error: branch out of range
> [snip]
>
> BTW, gstreamer1.0-plugins-good also occurs
> the same build failure as above.

I think there is some difference in behavior that meson migration has
brought. It will be good to see compiler cmdline for same file on zeus
e.g. perhaps we missed some flags

>
> Disable orc as workaround to fix the above issue
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../findutils/{findutils_4.6.0.bb =3D> findutils_4.7.0.bb}     | 0
>  .../gstreamer/gstreamer1.0-plugins-common.inc                | 5 ++++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  rename meta/recipes-extended/findutils/{findutils_4.6.0.bb =3D> findutil=
s_4.7.0.bb} (100%)
>
> diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/re=
cipes-extended/findutils/findutils_4.7.0.bb
> similarity index 100%
> rename from meta/recipes-extended/findutils/findutils_4.6.0.bb
> rename to meta/recipes-extended/findutils/findutils_4.7.0.bb
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-commo=
n.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> index ccf55500a9..3896424b2d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> @@ -18,7 +18,10 @@ require gstreamer1.0-plugins-packaging.inc
>  # This value is used in the PACKAGECONFIG values for each plugin set rec=
ipe.
>  # By modifying it, Orc can be enabled/disabled in all of these recipes a=
t once.
>  GSTREAMER_ORC ?=3D "orc"
> -
> +# workaround to disable orc on mips to fix the build failure
> +# {standard input}: Assembler messages:
> +# {standard input}:46587: Error: branch out of range
> +GSTREAMER_ORC_remove_mips =3D "orc"

No need to remove set it
GSTREAMER_ORC_mips =3D ""

>  PACKAGECONFIG[orc] =3D "-Dorc=3Denabled,-Dorc=3Ddisabled,orc orc-native"
>
>  # TODO: put this in a gettext.bbclass patch (with variables to allow for
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

