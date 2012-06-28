Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sk7yq-0006ie-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 08:13:28 +0200
Received: by obcva7 with SMTP id va7so2632329obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9kqB5mUnSCR3aTNm0zvbOQcdrbrwUTa05UrBSBOqULo=;
	b=ngPNzGMZaLrcIRs++uHYbCFMpkH5DIjGGYeUHykM+jWWNcg+Q6RSyFWgAFUM8cJpxX
	R7CaRPE2LftCq4sHCt1QB0LgY8QTeQYAHivMAsoPD15F3JLiIQeqbnckpA9CV2RuWBIP
	8pwpH/8s7UCtfPwYzLfBL+OLgijWwdfmAjiCu8rfmbfkjy2kkUW3HzcxXYV0tDerFNyi
	aJYAbccPY7VILcU0e2XhtKb+lpuUYamqG2qBN804m5jrdNYppygAFE/aUqoR6Yleh1Sf
	a73ngWd6vAsoGoP5Ao5qcPCzsarTnoD0EeozJ9AD2/qWkjQ62GB0xM2G+zhDdlBGgKlG
	QoRw==
MIME-Version: 1.0
Received: by 10.60.20.233 with SMTP id q9mr573582oee.57.1340863353436; Wed, 27
	Jun 2012 23:02:33 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 23:02:33 -0700 (PDT)
In-Reply-To: <1340859395-13638-1-git-send-email-dennis.lan@actions-semi.com>
References: <1340859395-13638-1-git-send-email-dennis.lan@actions-semi.com>
Date: Thu, 28 Jun 2012 14:02:33 +0800
Message-ID: <CAF1ZMEd_6HNgsXF3wWB4L_Bz0Db1+P+ARa5mY4dW8DeJ87fyEQ@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: floppym@gentoo.org
Subject: Re: [PATCH v2] openjade-native: fix undefined Getopts error, use std namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 06:13:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ALL:
  Since Mike "floppym" Gilbert is the original author of this patch,
so I add "CC-" to him here
  Thanks

Dennis

On Thu, Jun 28, 2012 at 12:56 PM, dennis lan <dennis.yxun@gmail.com> wrote:
> From: Dennis Lan <dennis.yxun@gmail.com>
>
> Using Gentoo Linux as the build host, it fails without this patch
> Use Getopt::Std in place of getopts.pl.
>
> https://bugs.gentoo.org/show_bug.cgi?id=3D420083
>
> which following error:
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [InterpreterMessages.h] Error 2
> make[2]: *** Waiting for unfinished jobs....
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [DssslAppMessages.h] Error 2
>
> Upstream-Status: Submitted [openjade-devel@lists.sourceforge.net]
>
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
> =C2=A0.../openjade/openjade-1.3.2/msggen.pl.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 32 ++++++++++++++++++++
> =C2=A0.../openjade/openjade-native_1.3.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A02 files changed, 33 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/ms=
ggen.pl.patch
>
> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patc=
h b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> new file mode 100644
> index 0000000..1afe68b
> --- /dev/null
> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> @@ -0,0 +1,32 @@
> +Use Getopt::Std in place of getopts.pl.
> +https://bugs.gentoo.org/show_bug.cgi?id=3D420083
> +
> +--- a/msggen.pl
> ++++ b/msggen.pl
> +@@ -4,6 +4,7 @@
> + # See the file COPYING for copying permission.
> +
> + use POSIX;
> ++use Getopt::Std;
> +
> + # Package and version.
> + $package =3D 'openjade';
> +@@ -18,8 +19,7 @@
> + undef $opt_l;
> + undef $opt_p;
> + undef $opt_t;
> +-do 'getopts.pl';
> +-&Getopts('l:p:t:');
> ++getopts('l:p:t:');
> + $module =3D $opt_l;
> + $pot_file =3D $opt_p;
> +
> +@@ -72,7 +72,7 @@
> + =C2=A0 =C2=A0 else {
> + =C2=A0 =C2=A0 =C2=A0 $field[0] =3D~ /^[IWQXE][0-9]$/ || &error("invalid=
 first field");;
> + =C2=A0 =C2=A0 =C2=A0 $type[$num] =3D substr($field[0], 0, 1);
> +- =C2=A0 =C2=A0 =C2=A0$argc =3D int(substr($field[0], 1, 1));
> ++ =C2=A0 =C2=A0 =C2=A0$argc =3D substr($field[0], 1, 1);
> + =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 $nargs[$num] =3D $argc;
> + =C2=A0 =C2=A0 $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("inva=
lid tag");
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/me=
ta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 5b29c1f..efd1e11 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://makefile.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://msggen.pl.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reautoconf.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://user-declared-default-construct=
or.patch"
>
> --
> 1.7.8.6
>


