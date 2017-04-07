Return-Path: <avery.brian@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF58C77D60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 02:48:06 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id 21so52742898pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7zTRWdAuExYiMp7FDRdO5OXEBdUEsr056N62fK9IQQU=;
	b=h79ZQ9N979nC7LJSvbId8lv4LszncJte2CzZblVto0EE98FtlGQ5fDO2TkYDPhRGYB
	PAk7Q0aLT14B6T8uNleYu7/+sMFnDR8fjxr6arEo2Bw162OkqLW0JbaBEqhWQAu58hA3
	BuT9GzXNxDErfC81h6nU1QGJY7vdy8kkmS/jFxRYlfjYOux2hNzQMuIOLmaH9aycF7ZY
	w5luxkFvEy3Iquu1EOGwEkemSMDGrQZSBysGuXiKfZUsGqGAmQgXXO+RkNcXQ4A2J9Sk
	5QwA5EJtH3ei5L42OYA0EgEltB8Uh3yJlRzachN/z6OcT7mGqXmDFUnzuwINXj+5SLR/
	xKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7zTRWdAuExYiMp7FDRdO5OXEBdUEsr056N62fK9IQQU=;
	b=Xw2egBAygbbIqaRSRaRU3H+AVmAuMKRkr34y6z+MK5oFIXy5S8pe2KCTzGrFE31SK7
	LCkIiV6JylupfH8wDykouor95csp3ei6uO1N5KHOZILFg1D5lq+R/EfFuJ4odj9L7wxo
	G85L/OuK2UjZg9pUBV2zjYhEcRnfv35srkqFmNVDcyTgH3lXsz+6ZeikDjmMseXwKKWT
	5EVYeewhMiWFEhCoxeKcZf3thpYME3m69A+e2KEIXIhprd78v6ddktdSq6czsqEW+Qgd
	STNmzbrqx0Gyz7oZhfjcgZ3dktJ8y/YPhNYC7lJi0jaTjY1Ej7BQfXdNMxDYhfWuESfc
	OLGQ==
X-Gm-Message-State: AFeK/H27sdwTPDT8AZYwKBrJKeyzE7VM+u77n8As4rmyj/gSobdeVK7gDEn7i6Vv0DQnr3nM7rG1pe/KIJfLtQ==
X-Received: by 10.98.156.23 with SMTP id f23mr37677771pfe.3.1491533287740;
	Thu, 06 Apr 2017 19:48:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.164.164 with HTTP; Thu, 6 Apr 2017 19:48:07 -0700 (PDT)
In-Reply-To: <d9a240d6-4539-dba8-2d09-eba0270a4269@windriver.com>
References: <cover.1491344268.git.brian.avery@intel.com>
	<c9e2f951c2e2bc367fa6bff0daf039f00503c846.1491344268.git.brian.avery@intel.com>
	<d9a240d6-4539-dba8-2d09-eba0270a4269@windriver.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Thu, 6 Apr 2017 19:48:07 -0700
Message-ID: <CAKV_0eiiZXz+kXe+p3+TGWif+jaEkhvoa9J4pbvfBGejS8roRQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts: change way we find native tools (pseudo)
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
X-List-Received-Date: Fri, 07 Apr 2017 02:48:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c0df846c95ebd054c8aa7c9

--94eb2c0df846c95ebd054c8aa7c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Robert,

I was definitely looking at only the extract-rootfs issue and didn't
remember seeing your above patch.  I agree that we need a broader solution
than the one I did. I tried applying yours but had some issues. Your patch
did fix the runqemu-extract-rootfs, but not when I had INHERIT+=3D " rm_wor=
k
".  Also, I had trouble running the oe-run-native script. It seems like the
help is reversed from what order it is expecting?  I may be missing
something, it's getting late; but I'll look at it tomoro and see if I can't
expand on your patch for a more generic solution. Issues from the run below=
.
ty,
b
an intel employee


$ bitbake bmap-tools-native -caddto_recipe_sysroot

$ oe-run-native bmap-tools-native bmaptool

Running bitbake -e bmaptool

ERROR: Nothing PROVIDES 'bmaptool'. Close matches:

  bmap-tools

  mtools

There was an error running bitbake to determine STAGING_DIR_NATIVE

Here is the output from bitbake -e bmaptool

WARNING: Host distribution "ubuntu-14.04" has not been validated with this
version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution. Loading
cache...done. Loaded 1299 entries from dependency cache. Summary: There was
1 WARNING message shown. Summary: There was 1 ERROR message shown,
returning a non-zero exit code.

$ oe-run-native bmaptool bmap-tools-native

Running bitbake -e bmap-tools-native

PSEUDO
=E2=80=A6/tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-nat=
ive/usr/bin/pseudo
is not found.

Error: Unable to find '' in
.../tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-native/us=
r/bin:.../tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-nat=
ive/bin:.../tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-n=
ative/usr/sbin:.../tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sy=
sroot-native/sbin

bavery@bavery-WS-DESK:...$ oe-run-native

oe-run-native: error: the following arguments are required: <native recipe>
<native tool>

Usage: oe-run-native native-recipe tool [parameters]


OpenEmbedded run-native - runs native tools


arguments:

  native-recipe       The recipe which provoides tool

  tool                Native tool to run




On Thu, Apr 6, 2017 at 3:26 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi Brian and RP,
>
> This patch can't fix the problem of scripts/oe-run-native, it only can
> run the native tools which is depended by meta-ide-support, for example:
>
> $ bitbake bmap-tools-native meta-ide-support
> $ oe-run-native bmaptool --help # exmaple from dev-manual-start.xml
>
> Error: Unable to find 'bmaptool' in native sysroot
>
> I think that we need consider the patch that I had sent before:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/rssfix
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Drbt/rss=
fix
>
> Robert Yang (1):
>   oe-find-native-sysroot: work with RSS
>
>
> Subject: [PATCH 1/1] oe-find-native-sysroot: work with RSS
>
> The generic STAGING_DIR_NATIVE is gone since RSS, so when find
> OECORE_NATIVE_SYSROOT, the user has to specify which recipe's
> STAGING_DIR_NATIVE will be used as OECORE_NATIVE_SYSROOT.
>
> * The usage is changed from ". oe-find-native-sysroot" to
>   ". oe-find-native-sysroot <recipe>".
> * The oe-run-native's usage has changed from
>   "oe-run-native tool" to "oe-run-native native-recipe tool".
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/oe-find-native-sysroot | 56 ++++++++++++++++++++++++++++--
> ------------
>  scripts/oe-run-native          | 15 +++++++----
>  scripts/runqemu-export-rootfs  |  2 +-
>  scripts/runqemu-extract-sdk    |  2 +-
>  4 files changed, 49 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysr=
o
> ot
> index 3f4c29da8a..59fe3f3118 100755
> --- a/scripts/oe-find-native-sysroot
> +++ b/scripts/oe-find-native-sysroot
> @@ -9,7 +9,7 @@
>  # it, e.g:
>  #
>  # SYSROOT_SETUP_SCRIPT=3D`which oe-find-native-sysroot`
> -# . $SYSROOT_SETUP_SCRIPT
> +# . $SYSROOT_SETUP_SCRIPT <recipe>
>  #
>  # This script will terminate execution of your calling program unless
>  # you set a variable $SKIP_STRICT_SYSROOT_CHECK to a non-empty string
> @@ -30,8 +30,8 @@
>  # with this program; if not, write to the Free Software Foundation, Inc.=
,
>  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>
> -if [ "$1" =3D '--help' -o "$1" =3D '-h' ] ; then
> -    echo 'Usage: oe-find-native-sysroot [-h|--help]'
> +if [ "$1" =3D '--help' -o "$1" =3D '-h' -o $# -ne 1 ] ; then
> +    echo 'Usage: oe-find-native-sysroot <recipe> [-h|--help]'
>      echo ''
>      echo 'OpenEmbedded find-native-sysroot - helper script to set'
>      echo 'environment variables OECORE_NATIVE_SYSROOT and PSEUDO'
> @@ -39,11 +39,31 @@ if [ "$1" =3D '--help' -o "$1" =3D '-h' ] ; then
>      echo 'executable binary'
>      echo ''
>      echo 'options:'
> +    echo '  recipe              its STAGING_DIR_NATIVE is used as native
> sysroot'
>      echo '  -h, --help          show this help message and exit'
>      echo ''
>      exit 2
>  fi
>
> +# Global vars
> +BITBAKE_E=3D""
> +OECORE_NATIVE_SYSROOT=3D""
> +
> +set_oe_native_sysroot(){
> +    echo "Running bitbake -e $1"
> +    BITBAKE_E=3D"`bitbake -e $1`"
> +    OECORE_NATIVE_SYSROOT=3D`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIV=
E |
> cut -d '"' -f2`
> +
> +    if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
> +        # This indicates that there was an error running bitbake -e that
> +        # the user needs to be informed of
> +        echo "There was an error running bitbake to determine
> STAGING_DIR_NATIVE"
> +        echo "Here is the output from bitbake -e $1"
> +        echo "$BITBAKE_E"
> +        exit 1
> +    fi
> +}
> +
>  if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
>      BITBAKE=3D`which bitbake 2> /dev/null`
>      if [ "x$BITBAKE" !=3D "x" ]; then
> @@ -54,10 +74,10 @@ if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
>                  exit 1
>              fi
>              touch conf/sanity.conf
> -            OECORE_NATIVE_SYSROOT=3D`bitbake -e meta-ide-support | grep
> ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
> +            set_oe_native_sysroot $1
>              rm -f conf/sanity.conf
>          else
> -            OECORE_NATIVE_SYSROOT=3D`bitbake -e meta-ide-support | grep
> ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
> +            set_oe_native_sysroot $1
>          fi
>      else
>          echo "Error: Unable to locate bitbake command."
> @@ -69,21 +89,11 @@ if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
>      fi
>  fi
>
> -if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
> -    # This indicates that there was an error running bitbake -e that
> -    # the user needs to be informed of
> -    echo "There was an error running bitbake to determine
> RECIPE_SYSROOT_NATIVE"
> -    echo "Here is the output from bitbake -e"
> -    bitbake -e
> -    exit 1
> -fi
> -
> -# Set up pseudo command
> -if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
> -    echo "Error: Unable to find pseudo binary in
> $OECORE_NATIVE_SYSROOT/usr/bin/"
> +if [ ! -e "$OECORE_NATIVE_SYSROOT/" ]; then
> +    echo "Error: $OECORE_NATIVE_SYSROOT doesn't exist."
>
>      if [ "x$OECORE_DISTRO_VERSION" =3D "x" ]; then
> -        echo "Have you run 'bitbake meta-ide-support'?"
> +        echo "Have you run 'bitbake $1 -caddto_recipe_sysroot'?"
>      else
>          echo "This shouldn't happen - something is wrong with your
> toolchain installation"
>      fi
> @@ -92,4 +102,12 @@ if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ];
> then
>          exit 1
>      fi
>  fi
> -PSEUDO=3D"$OECORE_NATIVE_SYSROOT/usr/bin/pseudo"
> +
> +# Set up pseudo command
> +pseudo=3D"$OECORE_NATIVE_SYSROOT/usr/bin/pseudo"
> +if [ -e "$pseudo" ]; then
> +    echo "PSEUDO=3D$pseudo"
> +    PSEUDO=3D"$pseudo"
> +else
> +    echo "PSEUDO $pseudo is not found."
> +fi
> diff --git a/scripts/oe-run-native b/scripts/oe-run-native
> index f2453e705a..de3c02ed34 100755
> --- a/scripts/oe-run-native
> +++ b/scripts/oe-run-native
> @@ -22,34 +22,39 @@
>  #
>
>  if [ $# -lt 1 -o "$1" =3D '--help' -o "$1" =3D '-h' ] ; then
> -    echo 'oe-run-native: error: the following arguments are required:
> <native tool>'
> -    echo 'Usage: oe-run-native tool [parameters]'
> +    echo 'oe-run-native: error: the following arguments are required:
> <native recipe> <native tool>'
> +    echo 'Usage: oe-run-native native-recipe tool [parameters]'
>      echo ''
>      echo 'OpenEmbedded run-native - runs native tools'
>      echo ''
>      echo 'arguments:'
> +    echo '  native-recipe       The recipe which provoides tool'
>      echo '  tool                Native tool to run'
>      echo ''
>      exit 2
>  fi
>
> +native_recipe=3D"$1"
> +tool=3D"$2"
> +shift
> +
>  SYSROOT_SETUP_SCRIPT=3D`which oe-find-native-sysroot 2> /dev/null`
>  if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
>          echo "Error: Unable to find oe-find-native-sysroot script"
>          exit 1
>  fi
> -. $SYSROOT_SETUP_SCRIPT
> +. $SYSROOT_SETUP_SCRIPT $native_recipe
>
>  OLD_PATH=3D$PATH
>
>  # look for a tool only in native sysroot
>
> PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/
> bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
> -tool=3D`/usr/bin/which $1 2>/dev/null`
> +tool=3D`/usr/bin/which $tool 2>/dev/null`
>
>  if [ -n "$tool" ] ; then
>      # add old path to allow usage of host tools
>      PATH=3D$PATH:$OLD_PATH $@
>  else
> -    echo "Error: Unable to find '$1' in native sysroot"
> +    echo "Error: Unable to find '$tool' in $PATH"
>      exit 1
>  fi
> diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootf=
s
> index 7ebc07194d..c7992d8223 100755
> --- a/scripts/runqemu-export-rootfs
> +++ b/scripts/runqemu-export-rootfs
> @@ -44,7 +44,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
>         echo "Did you forget to source your build environment setup
> script?"
>         exit 1
>  fi
> -. $SYSROOT_SETUP_SCRIPT
> +. $SYSROOT_SETUP_SCRIPT meta-ide-support
>
>  if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
>         echo "Error: Unable to find unfsd binary in
> $OECORE_NATIVE_SYSROOT/usr/bin/"
> diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
> index 32ddd485b6..2a0dd50e0e 100755
> --- a/scripts/runqemu-extract-sdk
> +++ b/scripts/runqemu-extract-sdk
> @@ -35,7 +35,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
>      echo "Did you forget to source your build system environment setup
> script?"
>      exit 1
>  fi
> -. $SYSROOT_SETUP_SCRIPT
> +. $SYSROOT_SETUP_SCRIPT meta-ide-support
>  PSEUDO_OPTS=3D"-P $OECORE_NATIVE_SYSROOT/usr"
>
>  ROOTFS_TARBALL=3D$1
>
>
> // Robert
>
>
> On 04/05/2017 06:22 AM, brian avery wrote:
>
>> oe-find-native-sysroot: Recipe Specific Sysroots have eliminated the
>> large STAGING_DIR_NATIVE. Now, we will rely on the meta-ide-support
>> sysroot that is what was populating the large STAGING_DIR_NATIVE in
>> previous versions anyway. We now look for RECIPE_SYSROOT_NATIVE.
>>
>> [YOCTO #11119]
>>
>> Signed-off-by: brian avery <brian.avery@intel.com>
>> ---
>>  scripts/oe-find-native-sysroot | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/oe-find-native-sysroot
>> b/scripts/oe-find-native-sysroot
>> index 13a5c46..3f4c29d 100755
>> --- a/scripts/oe-find-native-sysroot
>> +++ b/scripts/oe-find-native-sysroot
>> @@ -2,7 +2,7 @@
>>  #
>>  # Find a native sysroot to use - either from an in-tree OE build or
>>  # from a toolchain installation. It then ensures the variable
>> -# $OECORE_NATIVE_SYSROOT is set to the sysroot's base directory, and se=
ts
>> +# $OECORE_NATIVE_SYSROOT is set to the sysroot's base directory, and se=
ts
>>  # $PSEUDO to the path of the pseudo binary.
>>  #
>>  # This script is intended to be run within other scripts by source'ing
>> @@ -54,10 +54,10 @@ if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
>>                  exit 1
>>              fi
>>              touch conf/sanity.conf
>> -            OECORE_NATIVE_SYSROOT=3D`bitbake -e | grep ^STAGING_DIR_NAT=
IVE
>> | cut -d '"' -f2`
>> +            OECORE_NATIVE_SYSROOT=3D`bitbake -e meta-ide-support | grep
>> ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
>>              rm -f conf/sanity.conf
>>          else
>> -            OECORE_NATIVE_SYSROOT=3D`bitbake -e | grep ^STAGING_DIR_NAT=
IVE
>> | cut -d '"' -f2`
>> +            OECORE_NATIVE_SYSROOT=3D`bitbake -e meta-ide-support | grep
>> ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
>>          fi
>>      else
>>          echo "Error: Unable to locate bitbake command."
>> @@ -72,7 +72,7 @@ fi
>>  if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
>>      # This indicates that there was an error running bitbake -e that
>>      # the user needs to be informed of
>> -    echo "There was an error running bitbake to determine
>> STAGING_DIR_NATIVE"
>> +    echo "There was an error running bitbake to determine
>> RECIPE_SYSROOT_NATIVE"
>>      echo "Here is the output from bitbake -e"
>>      bitbake -e
>>      exit 1
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0df846c95ebd054c8aa7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,=C2=A0<div><br></div><div>I was definitely looki=
ng at only the extract-rootfs issue and didn&#39;t remember seeing your abo=
ve patch.=C2=A0 I agree that we need a broader solution than the one I did.=
 I tried applying yours but had some issues. Your patch did fix the runqemu=
-extract-rootfs, but not when I had INHERIT+=3D &quot; rm_work &quot;.=C2=
=A0 Also, I had trouble running the oe-run-native script. It seems like the=
 help is reversed from what order it is expecting?=C2=A0 I may be missing s=
omething, it&#39;s getting late; but I&#39;ll look at it tomoro and see if =
I can&#39;t expand on your patch for a more generic solution. Issues from t=
he run below.</div><div>ty,</div><div>b</div><div>an intel employee =C2=A0<=
/div><div><br></div><div><br></div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">$ bitbake bmap-tools-native =
-caddto_recipe_sysroot=C2=A0</span></p><p class=3D"gmail-p1"><span class=3D=
"gmail-s1">$ oe-run-native bmap-tools-native bmaptool =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></p><p class=
=3D"gmail-p1"><span class=3D"gmail-s1">Running bitbake -e bmaptool</span></=
p><p class=3D"gmail-p1"><span class=3D"gmail-s1">ERROR: Nothing PROVIDES &#=
39;bmaptool&#39;. Close matches:</span></p><p class=3D"gmail-p1"><span clas=
s=3D"gmail-s1">=C2=A0 bmap-tools</span></p><p class=3D"gmail-p1"><span clas=
s=3D"gmail-s1">=C2=A0 mtools</span></p><p class=3D"gmail-p1"><span class=3D=
"gmail-s1">There was an error running bitbake to determine STAGING_DIR_NATI=
VE</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">Here is the out=
put from bitbake -e bmaptool</span></p><p class=3D"gmail-p1"><span class=3D=
"gmail-s1">WARNING: Host distribution &quot;ubuntu-14.04&quot; has not been=
 validated with this version of the build system; you may possibly experien=
ce unexpected failures. It is recommended that you use a tested distributio=
n. Loading cache...done. Loaded 1299 entries from dependency cache. Summary=
: There was 1 WARNING message shown. Summary: There was 1 ERROR message sho=
wn, returning a non-zero exit code.</span></p><p class=3D"gmail-p1"><span c=
lass=3D"gmail-s1">$ oe-run-native bmaptool bmap-tools-native=C2=A0</span></=
p><p class=3D"gmail-p1"><span class=3D"gmail-s1">Running bitbake -e bmap-to=
ols-native</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">PSEUDO =
=E2=80=A6/tmp/work/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-nat=
ive/usr/bin/pseudo is not found.</span></p><p class=3D"gmail-p1"><span clas=
s=3D"gmail-s1">Error: Unable to find &#39;&#39; in .../tmp/work/x86_64-linu=
x/bmap-tools-native/3.2-r0/recipe-sysroot-native/usr/bin:.../tmp/work/x86_6=
4-linux/bmap-tools-native/3.2-r0/recipe-sysroot-native/bin:.../tmp/work/x86=
_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-native/usr/sbin:.../tmp/w=
ork/x86_64-linux/bmap-tools-native/3.2-r0/recipe-sysroot-native/sbin</span>=
</p><p class=3D"gmail-p1"><span class=3D"gmail-s1">bavery@bavery-WS-DESK:..=
.$ oe-run-native=C2=A0</span></p><p class=3D"gmail-p1"><span class=3D"gmail=
-s1">oe-run-native: error: the following arguments are required: &lt;native=
 recipe&gt; &lt;native tool&gt;</span></p><p class=3D"gmail-p1"><span class=
=3D"gmail-s1">Usage: oe-run-native native-recipe tool [parameters]</span></=
p><p class=3D"gmail-p2"><span class=3D"gmail-s1"></span><br></p><p class=3D=
"gmail-p1"><span class=3D"gmail-s1">OpenEmbedded run-native - runs native t=
ools</span></p><p class=3D"gmail-p2"><span class=3D"gmail-s1"></span><br></=
p><p class=3D"gmail-p1"><span class=3D"gmail-s1">arguments:</span></p><p cl=
ass=3D"gmail-p1"><span class=3D"gmail-s1">=C2=A0 native-recipe =C2=A0 =C2=
=A0 =C2=A0 The recipe which provoides tool</span></p><p class=3D"gmail-p1">=
<span class=3D"gmail-s1">=C2=A0 tool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Native tool to run</span></p><p class=3D"gmail-p2"><span =
class=3D"gmail-s1"></span><br></p><p class=3D"gmail-p1"><span class=3D"gmai=
l-s1">





























</span></p><p class=3D"gmail-p2"><span class=3D"gmail-s1"></span><br></p></=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu,=
 Apr 6, 2017 at 3:26 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Brian and RP,<br>
<br>
This patch can&#39;t fix the problem of scripts/oe-run-native, it only can<=
br>
run the native tools which is depended by meta-ide-support, for example:<br=
>
<br>
$ bitbake bmap-tools-native meta-ide-support<br>
$ oe-run-native bmaptool --help # exmaple from dev-manual-start.xml<br>
<br>
Error: Unable to find &#39;bmaptool&#39; in native sysroot<br>
<br>
I think that we need consider the patch that I had sent before:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/ope<wbr>nembe=
dded-core-contrib</a> rbt/rssfix<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Drbt/rssfix" rel=3D"noreferrer" target=3D"_blank">http://cgit.openemb=
edded.org/o<wbr>penembedded-core-contrib/log/?<wbr>h=3Drbt/rssfix</a><br>
<br>
Robert Yang (1):<br>
=C2=A0 oe-find-native-sysroot: work with RSS<br>
<br>
<br>
Subject: [PATCH 1/1] oe-find-native-sysroot: work with RSS<br>
<br>
The generic STAGING_DIR_NATIVE is gone since RSS, so when find<br>
OECORE_NATIVE_SYSROOT, the user has to specify which recipe&#39;s<br>
STAGING_DIR_NATIVE will be used as OECORE_NATIVE_SYSROOT.<br>
<br>
* The usage is changed from &quot;. oe-find-native-sysroot&quot; to<br>
=C2=A0 &quot;. oe-find-native-sysroot &lt;recipe&gt;&quot;.<br>
* The oe-run-native&#39;s usage has changed from<br>
=C2=A0 &quot;oe-run-native tool&quot; to &quot;oe-run-native native-recipe =
tool&quot;.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-find-native-<wbr>sysroot | 56 ++++++++++++++++++++++++++++=
--<wbr>------------<br>
=C2=A0scripts/oe-run-native=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++-=
---<br>
=C2=A0scripts/runqemu-export-<wbr>rootfs=C2=A0 |=C2=A0 2 +-<br>
=C2=A0scripts/runqemu-extract-sdk=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 49 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/scripts/oe-find-native-sysro<wbr>ot b/scripts/oe-find-native-s=
ysro<wbr>ot<br>
index 3f4c29da8a..59fe3f3118 100755<br>
--- a/scripts/oe-find-native-sysro<wbr>ot<br>
+++ b/scripts/oe-find-native-sysro<wbr>ot<br>
@@ -9,7 +9,7 @@<br>
=C2=A0# it, e.g:<br>
=C2=A0#<br>
=C2=A0# SYSROOT_SETUP_SCRIPT=3D`which oe-find-native-sysroot`<br>
-# . $SYSROOT_SETUP_SCRIPT<br>
+# . $SYSROOT_SETUP_SCRIPT &lt;recipe&gt;<br>
=C2=A0#<br>
=C2=A0# This script will terminate execution of your calling program unless=
<br>
=C2=A0# you set a variable $SKIP_STRICT_SYSROOT_CHECK to a non-empty string=
<br>
@@ -30,8 +30,8 @@<br>
=C2=A0# with this program; if not, write to the Free Software Foundation, I=
nc.,<br>
=C2=A0# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
<br>
-if [ &quot;$1&quot; =3D &#39;--help&#39; -o &quot;$1&quot; =3D &#39;-h&#39=
; ] ; then<br>
-=C2=A0 =C2=A0 echo &#39;Usage: oe-find-native-sysroot [-h|--help]&#39;<br>
+if [ &quot;$1&quot; =3D &#39;--help&#39; -o &quot;$1&quot; =3D &#39;-h&#39=
; -o $# -ne 1 ] ; then<br>
+=C2=A0 =C2=A0 echo &#39;Usage: oe-find-native-sysroot &lt;recipe&gt; [-h|-=
-help]&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;OpenEmbedded find-native-sysroot - helper scr=
ipt to set&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;environment variables OECORE_NATIVE_SYSROOT a=
nd PSEUDO&#39;<br>
@@ -39,11 +39,31 @@ if [ &quot;$1&quot; =3D &#39;--help&#39; -o &quot;$1&qu=
ot; =3D &#39;-h&#39; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;executable binary&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;options:&#39;<br>
+=C2=A0 =C2=A0 echo &#39;=C2=A0 recipe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 its STAGING_DIR_NATIVE is used as native sysroot&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;=C2=A0 -h, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 show this help message and exit&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0exit 2<br>
=C2=A0fi<br>
<br>
+# Global vars<br>
+BITBAKE_E=3D&quot;&quot;<br>
+OECORE_NATIVE_SYSROOT=3D&quot;&quot;<br>
+<br>
+set_oe_native_sysroot(){<br>
+=C2=A0 =C2=A0 echo &quot;Running bitbake -e $1&quot;<br>
+=C2=A0 =C2=A0 BITBAKE_E=3D&quot;`bitbake -e $1`&quot;<br>
+=C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`echo &quot;$BITBAKE_E&quot; | grep =
^STAGING_DIR_NATIVE | cut -d &#39;&quot;&#39; -f2`<br>
+<br>
+=C2=A0 =C2=A0 if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This indicates that there was an error runni=
ng bitbake -e that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the user needs to be informed of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;There was an error running bitbake =
to determine STAGING_DIR_NATIVE&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Here is the output from bitbake -e =
$1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$BITBAKE_E&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<span class=3D""><br>
=C2=A0if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]; then<br=
></span>
=C2=A0 =C2=A0 =C2=A0BITBAKE=3D`which bitbake 2&gt; /dev/null`<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x$BITBAKE&quot; !=3D &quot;x&quot; ]; then<b=
r>
@@ -54,10 +74,10 @@ if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&qu=
ot; ]; then<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch conf/sanity.conf<br><=
/span>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d &#39;&quot;&#39=
; -f2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_oe_native_sysroot $1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f conf/sanity.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d &#39;&quot;&#39=
; -f2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_oe_native_sysroot $1<span cl=
ass=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Error: Unable to locate bitbak=
e command.&quot;<br></span>
@@ -69,21 +89,11 @@ if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&qu=
ot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]; then<br>
-=C2=A0 =C2=A0 # This indicates that there was an error running bitbake -e =
that<br>
-=C2=A0 =C2=A0 # the user needs to be informed of<br>
-=C2=A0 =C2=A0 echo &quot;There was an error running bitbake to determine R=
ECIPE_SYSROOT_NATIVE&quot;<br>
-=C2=A0 =C2=A0 echo &quot;Here is the output from bitbake -e&quot;<br>
-=C2=A0 =C2=A0 bitbake -e<br>
-=C2=A0 =C2=A0 exit 1<br>
-fi<br>
-<br>
-# Set up pseudo command<br>
-if [ ! -e &quot;$OECORE_NATIVE_SYSROOT/usr/bi<wbr>n/pseudo&quot; ]; then<b=
r>
-=C2=A0 =C2=A0 echo &quot;Error: Unable to find pseudo binary in $OECORE_NA=
TIVE_SYSROOT/usr/bin<wbr>/&quot;<br>
+if [ ! -e &quot;$OECORE_NATIVE_SYSROOT/&quot; ]; then<br>
+=C2=A0 =C2=A0 echo &quot;Error: $OECORE_NATIVE_SYSROOT doesn&#39;t exist.&=
quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x$OECORE_DISTRO_VERSION&quot; =3D &quot;x&qu=
ot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Have you run &#39;bitbake meta-ide-=
support&#39;?&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Have you run &#39;bitbake $1 -caddt=
o_recipe_sysroot&#39;?&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;This shouldn&#39;t happen - so=
mething is wrong with your toolchain installation&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
@@ -92,4 +102,12 @@ if [ ! -e &quot;$OECORE_NATIVE_SYSROOT/usr/bi<wbr>n/pse=
udo&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
-PSEUDO=3D&quot;$OECORE_NATIVE_SYSROO<wbr>T/usr/bin/pseudo&quot;<br>
+<br>
+# Set up pseudo command<br>
+pseudo=3D&quot;$OECORE_NATIVE_SYSROO<wbr>T/usr/bin/pseudo&quot;<br>
+if [ -e &quot;$pseudo&quot; ]; then<br>
+=C2=A0 =C2=A0 echo &quot;PSEUDO=3D$pseudo&quot;<br>
+=C2=A0 =C2=A0 PSEUDO=3D&quot;$pseudo&quot;<br>
+else<br>
+=C2=A0 =C2=A0 echo &quot;PSEUDO $pseudo is not found.&quot;<br>
+fi<br>
diff --git a/scripts/oe-run-native b/scripts/oe-run-native<br>
index f2453e705a..de3c02ed34 100755<br>
--- a/scripts/oe-run-native<br>
+++ b/scripts/oe-run-native<br>
@@ -22,34 +22,39 @@<br>
=C2=A0#<br>
<br>
=C2=A0if [ $# -lt 1 -o &quot;$1&quot; =3D &#39;--help&#39; -o &quot;$1&quot=
; =3D &#39;-h&#39; ] ; then<br>
-=C2=A0 =C2=A0 echo &#39;oe-run-native: error: the following arguments are =
required: &lt;native tool&gt;&#39;<br>
-=C2=A0 =C2=A0 echo &#39;Usage: oe-run-native tool [parameters]&#39;<br>
+=C2=A0 =C2=A0 echo &#39;oe-run-native: error: the following arguments are =
required: &lt;native recipe&gt; &lt;native tool&gt;&#39;<br>
+=C2=A0 =C2=A0 echo &#39;Usage: oe-run-native native-recipe tool [parameter=
s]&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;OpenEmbedded run-native - runs native tools&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;arguments:&#39;<br>
+=C2=A0 =C2=A0 echo &#39;=C2=A0 native-recipe=C2=A0 =C2=A0 =C2=A0 =C2=A0The=
 recipe which provoides tool&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;=C2=A0 tool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Native tool to run&#39;<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0exit 2<br>
=C2=A0fi<br>
<br>
+native_recipe=3D&quot;$1&quot;<br>
+tool=3D&quot;$2&quot;<br>
+shift<br>
+<br>
=C2=A0SYSROOT_SETUP_SCRIPT=3D`which oe-find-native-sysroot 2&gt; /dev/null`=
<br>
=C2=A0if [ -z &quot;$SYSROOT_SETUP_SCRIPT&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Error: Unable to find oe-find-=
native-sysroot script&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
-. $SYSROOT_SETUP_SCRIPT<br>
+. $SYSROOT_SETUP_SCRIPT $native_recipe<br>
<br>
=C2=A0OLD_PATH=3D$PATH<br>
<br>
=C2=A0# look for a tool only in native sysroot<br>
<br>
PATH=3D$OECORE_NATIVE_SYSROOT/us<wbr>r/bin:$OECORE_NATIVE_SYSROOT/<wbr>bin:=
$OECORE_NATIVE_SYSROOT/<wbr>usr/sbin:$OECORE_NATIVE_<wbr>SYSROOT/sbin<br>
-tool=3D`/usr/bin/which $1 2&gt;/dev/null`<br>
+tool=3D`/usr/bin/which $tool 2&gt;/dev/null`<br>
<br>
=C2=A0if [ -n &quot;$tool&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0# add old path to allow usage of host tools<br>
=C2=A0 =C2=A0 =C2=A0PATH=3D$PATH:$OLD_PATH $@<br>
=C2=A0else<br>
-=C2=A0 =C2=A0 echo &quot;Error: Unable to find &#39;$1&#39; in native sysr=
oot&quot;<br>
+=C2=A0 =C2=A0 echo &quot;Error: Unable to find &#39;$tool&#39; in $PATH&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
diff --git a/scripts/runqemu-export-rootf<wbr>s b/scripts/runqemu-export-ro=
otf<wbr>s<br>
index 7ebc07194d..c7992d8223 100755<br>
--- a/scripts/runqemu-export-rootf<wbr>s<br>
+++ b/scripts/runqemu-export-rootf<wbr>s<br>
@@ -44,7 +44,7 @@ if [ -z &quot;$SYSROOT_SETUP_SCRIPT&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Did you forget to source your build =
environment setup script?&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0fi<br>
-. $SYSROOT_SETUP_SCRIPT<br>
+. $SYSROOT_SETUP_SCRIPT meta-ide-support<br>
<br>
=C2=A0if [ ! -e &quot;$OECORE_NATIVE_SYSROOT/usr/bi<wbr>n/unfsd&quot; ]; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Error: Unable to find unfsd binary i=
n $OECORE_NATIVE_SYSROOT/usr/bin<wbr>/&quot;<br>
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk<br>
index 32ddd485b6..2a0dd50e0e 100755<br>
--- a/scripts/runqemu-extract-sdk<br>
+++ b/scripts/runqemu-extract-sdk<br>
@@ -35,7 +35,7 @@ if [ -z &quot;$SYSROOT_SETUP_SCRIPT&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;Did you forget to source your build system e=
nvironment setup script?&quot;<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
-. $SYSROOT_SETUP_SCRIPT<br>
+. $SYSROOT_SETUP_SCRIPT meta-ide-support<br>
=C2=A0PSEUDO_OPTS=3D&quot;-P $OECORE_NATIVE_SYSROOT/usr&quot;<br>
<br>
=C2=A0ROOTFS_TARBALL=3D$1<span class=3D"HOEnZb"><font color=3D"#888888"><br=
>
<br>
<br>
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 04/05/2017 06:22 AM, brian avery wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
oe-find-native-sysroot: Recipe Specific Sysroots have eliminated the<br>
large STAGING_DIR_NATIVE. Now, we will rely on the meta-ide-support<br>
sysroot that is what was populating the large STAGING_DIR_NATIVE in<br>
previous versions anyway. We now look for RECIPE_SYSROOT_NATIVE.<br>
<br>
[YOCTO #11119]<br>
<br>
Signed-off-by: brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" tar=
get=3D"_blank">brian.avery@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-find-native-<wbr>sysroot | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/oe-find-native-sysro<wbr>ot b/scripts/oe-find-native-s=
ysro<wbr>ot<br>
index 13a5c46..3f4c29d 100755<br>
--- a/scripts/oe-find-native-sysro<wbr>ot<br>
+++ b/scripts/oe-find-native-sysro<wbr>ot<br>
@@ -2,7 +2,7 @@<br>
=C2=A0#<br>
=C2=A0# Find a native sysroot to use - either from an in-tree OE build or<b=
r>
=C2=A0# from a toolchain installation. It then ensures the variable<br>
-# $OECORE_NATIVE_SYSROOT is set to the sysroot&#39;s base directory, and s=
ets<br>
+# $OECORE_NATIVE_SYSROOT is set to the sysroot&#39;s base directory, and s=
ets<br>
=C2=A0# $PSEUDO to the path of the pseudo binary.<br>
=C2=A0#<br>
=C2=A0# This script is intended to be run within other scripts by source&#3=
9;ing<br>
@@ -54,10 +54,10 @@ if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&qu=
ot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch conf/sanity.conf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e | grep ^STAGING_DIR_NATIVE | cut -d &#39;&quot;&#39; -f2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d &#39;&quot;&#39=
; -f2`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f conf/sanity.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e | grep ^STAGING_DIR_NATIVE | cut -d &#39;&quot;&#39; -f2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`bitbake=
 -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d &#39;&quot;&#39=
; -f2`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Error: Unable to locate bitbak=
e command.&quot;<br>
@@ -72,7 +72,7 @@ fi<br>
=C2=A0if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0# This indicates that there was an error running bitbak=
e -e that<br>
=C2=A0 =C2=A0 =C2=A0# the user needs to be informed of<br>
-=C2=A0 =C2=A0 echo &quot;There was an error running bitbake to determine S=
TAGING_DIR_NATIVE&quot;<br>
+=C2=A0 =C2=A0 echo &quot;There was an error running bitbake to determine R=
ECIPE_SYSROOT_NATIVE&quot;<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;Here is the output from bitbake -e&quot;<br>
=C2=A0 =C2=A0 =C2=A0bitbake -e<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
<br>
</blockquote>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0df846c95ebd054c8aa7c9--
