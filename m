Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6376DF75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:13:51 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so11042868eak.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 16:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S/Fiflqd19cUySQpY49qVxqNhmzdVj4L9PYcw0VIkag=;
	b=vrmy2ecFOq66FD23GDglpXm4ph8LB2dY+kyWauukDJN+gUnIypRlQD8uMDOVDBmHWS
	B0sim9XtD+JAe3zZTU7Quogh07sL4BJDCOiSQtOoUjdlvm83gi9N3A2cHKcPiQf0GzQO
	lUMEiut1cS73OV82LNAH87vVmIathSDKLsSptvLnlFCF0A5t4bS3klgHFZUUxEOjJ0TT
	DRet5ccoj03S+icEInmYCBUFgQZ4I9ofnNgflM84DzEws30paEft9wTZbHmcpkX/+TKv
	N8bdSpGDANIP+pfr+OEZGg90/mxfOq2TPpDhRL9W7EjDyRYLTyC6iyeT5P1M/jT4MZaV
	cIjg==
X-Received: by 10.15.61.134 with SMTP id i6mr13261780eex.48.1386202430189;
	Wed, 04 Dec 2013 16:13:50 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm99749144eeh.8.2013.12.04.16.13.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 16:13:49 -0800 (PST)
Date: Thu, 5 Dec 2013 01:14:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Iyad Qumei <iyadkq@gmail.com>
Message-ID: <20131205001401.GA3724@jama>
References: <1386176874-4286-1-git-send-email-iyadkq@gmail.com>
	<1386176874-4286-2-git-send-email-iyadkq@gmail.com>
	<20131204174349.GI3714@jama>
	<CADL+O9su6+2_COr7J5eHWZjPD1Vwh6NjoMT-Ga1hjabvb7icgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADL+O9su6+2_COr7J5eHWZjPD1Vwh6NjoMT-Ga1hjabvb7icgw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icecc-create-env: Upgrade script
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
X-List-Received-Date: Thu, 05 Dec 2013 00:13:52 -0000
X-Groupsio-MsgNum: 47905
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 02:39:41PM -0800, Iyad Qumei wrote:
> On Wed, Dec 4, 2013 at 9:43 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Wed, Dec 04, 2013 at 09:07:54AM -0800, Iyad Qumei wrote:
> > > The original icecc script does not handle toolchain content
> > > properly, resulting in build failures, such as
> > >
> > >    gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not fo=
und
> > >
> > > This patch brings in the latest script form the icecream source, and
> > > modifies it for use in the OE build environment.  The change was test=
ed
> > > with OE-Core built toolchain, and external toolchain.
> > >
> > > Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
> > > ---
> > >  .../icecc-create-env-native/icecc-create-env       |  266
> > +++++++++++++++-----
> > >  ...ive_0.1.bb =3D> icecc-create-env-native_1.0.1.bb} |    5 +-
> > >  2 files changed, 209 insertions(+), 62 deletions(-)
> > >  rename meta/recipes-devtools/icecc-create-env/{
> > icecc-create-env-native_0.1.bb =3D> icecc-create-env-native_1.0.1.bb} (=
89%)
> >
> > NACK
> >
> > What are you trying to say?

http://en.wikipedia.org/wiki/NAK_(protocol_message)

> This patch was created per instructions on how submit patches.

That doesn't make it correct functionality-wise.

> > >
> > > diff --git
> > a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env
> > b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env
> > > index 7e4dbc4..0eb2217 100755
> > > ---
> > a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env
> > > +++
> > b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env
> > > @@ -24,12 +24,12 @@ add_file ()
> > >    fi
> > >    test -z "$name" && return
> > >    # ls -H isn't really the same as readlink, but
> > > -  # readlink is not portable enough.
> > > +  # readlink is not portable enough.
> >
> > Don't introduce trailing whitespaces
> >
>=20
> There is no space problems here, I checked it in vi, and indentation looks
> consistent in the context.

Then there is something wrong with your vi.

You can even see it by highlighting the line with mouse in patchwork

http://patchwork.openembedded.org/patch/62843/

>=20
> >
> > >    path=3D`ls -H $path`
> > >    toadd=3D"$name=3D$path"
> > >    is_contained "$toadd" && return
> > >    if test -z "$silent"; then
> > > -  echo "adding file $toadd"
> > > +    echo "adding file $toadd"
> > >    fi
> > >    target_files=3D"$target_files $toadd"
> > >    if test -x "$path"; then
> > > @@ -43,19 +43,81 @@ add_file ()
> > >               #         libc.so.6 =3D> /lib/tls/libc.so.6 (0xb7e81000)
> > >               #         /lib/ld-linux.so.2 (0xb7fe8000)
> > >               # covering both situations ( with =3D> and without )
> > > -          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^
> > ]*\).*,\1,p'`; do
> > > -         test -f "$lib" || continue
> > > -         # Check wether the same library also exists in the parent
> > directory,
> > > -         # and prefer that on the assumption that it is a more gener=
ic
> > one.
> > > -         local baselib=3D`echo "$lib" | sed
> > 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> > > -         test -f "$baselib" && lib=3D$baselib
> > > -       add_file "$lib"
> > > -        done
> > > -      fi
> > > +           for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^
> > ]*\).*,\1,p'`; do
> > > +          test -f "$lib" || continue
> > > +          # Check wether the same library also exists in the parent
> > directory,
> > > +          # and prefer that on the assumption that it is a more gene=
ric
> > one.
> > > +          local baselib=3D`echo "$lib" | sed
> > 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> > > +          test -f "$baselib" && lib=3D$baselib
> > > +             add_file "$lib"
> > > +           done
> > > +     fi
> >
> > Don't mix tabs and spaces.
> >
> > fixed.
>=20
>=20
> > >      fi
> > >    fi
> > >  }
> > >
> > > +# returns abs path to filedir
> > > +abs_path()
> > > +{
> > > +    local path=3D$1
> > > +    if test -f "$path"; then
> > > +        pushd $(dirname $path) > /dev/null 2>&1
> > > +        dir_path=3D`pwd -P`
> > > +        path=3D$dir_path/$(basename $path)
> > > +        popd > /dev/null 2>&1
> > > +    elif test -d "$path"; then
> > > +        pushd $path > /dev/null 2>&1
> > > +        path=3D`pwd -P`
> > > +        popd > /dev/null 2>&1
> > > +    fi
> > > +    echo $path
> > > +}
> > > +
> > > +# Search and add file to the tarball file.
> > > +search_addfile()
> > > +{
> > > +    local compiler=3D$1
> > > +    local file_name=3D$2
> > > +    local file_installdir=3D$3
> > > +    local file=3D""
> > > +
> > > +    file=3D$($compiler -print-prog-name=3D$file_name)
> > > +
> > > +    if test -z "$file" || test "$file" =3D "$file_name" || ! test -e
> > "$file"; then
> > > +        file=3D`$compiler -print-file-name=3D$file_name`
> > > +    fi
> > > +
> > > +    if ! test -e "$file"; then
> > > +        return 1
> > > +    fi
> > > +
> > > +    if test -z "$file_installdir"; then
> > > +        # The file is going to be added to the tarball
> > > +        # in the same path where the compiler found it.
> > > +
> > > +        file_installdir=3D$(dirname $file)
> > > +        abs_installdir=3D$(abs_path $file_installdir)
> > > +
> > > +        if test "$file_installdir" !=3D "$abs_installdir"; then
> > > +            # The path where the compiler found the file is relative!
> > > +            # If the path where the compiler found the file is relat=
ive
> > > +            # to compiler's path, we must change it to be relative to
> > > +            # /usr/bin path where the compiler is going to be instal=
led
> > > +            # in the tarball file.
> > > +            # Replacing relative path by abs path because the tar
> > command
> > > +            # used to create the tarball file doesn't work well with
> > > +            # relative path as installdir.
> > > +
> > > +            compiler_basedir=3D$(abs_path ${compiler%/*/*})
> > > +            file_installdir=3D${abs_installdir/$compiler_basedir/"/u=
sr"}
> > > +        fi
> > > +    fi
> > > +
> > > +    add_file "$file" "$file_installdir/$file_name"
> > > +
> > > +    return 0
> > > +}
> > > +
> > >  # backward compat
> > >  if test "$1" =3D "--respect-path"; then
> > >    shift
> > > @@ -67,64 +129,151 @@ if test "$1" =3D "--silent"; then
> > >   shift
> > >  fi
> > >
> > > -
> > > -added_gcc=3D$1
> > > -shift
> > > -added_gxx=3D$1
> > > -shift
> > > -added_as=3D$1
> > > -shift
> > > -archive_name=3D$1
> > > -
> > > -if test -z "$added_gcc" || test -z "$added_gxx" ; then
> > > -     echo "usage: $0 <gcc_path> <g++_path>"
> > > -     exit 1
> > > +if test "$1" !=3D "--gcc" -a "$1" !=3D "--clang"; then
> > > +    # backward compat
> > > +    added_gcc=3D$1
> > > +    shift
> > > +    added_gxx=3D$1
> > > +    shift
> > > +    added_as=3D$1
> > > +    shift
> > > +    archive_name=3D$1
> > > +    shift
> > > +    gcc=3D1
> > > +else
> > > +    if test "$1" =3D "--gcc"; then
> > > +        shift
> > > +        added_gcc=3D$1
> > > +        shift
> > > +        added_gxx=3D$1
> > > +        shift
> > > +        added_as=3D$1
> > > +        shift
> > > +        archive_name=3D$1
> > > +        shift
> > > +        gcc=3D1
> > > +    elif test "$1" =3D "--clang"; then
> > > +        shift
> > > +        added_clang=3D$1
> > > +        shift
> > > +        added_compilerwrapper=3D$1
> > > +        shift
> > > +        clang=3D1
> > > +    else
> > > +        usage
> > > +        exit 1
> > > +    fi
> > >  fi
> > >
> > > -if ! test -x "$added_gcc" ; then
> > > -  echo "'$added_gcc' is no executable."
> > > -  exit 1
> > > +if test -n "$gcc"; then
> > > +    if test -z "$added_gcc" || test -z "$added_gxx"; then
> > > +        usage
> > > +        exit 1
> > > +    fi
> > > +    if ! test -x "$added_gcc" ; then
> > > +        echo "'$added_gcc' is no executable."
> > > +        exit 1
> > > +    fi
> > > +    if ! test -x "$added_gxx" ; then
> > > +        echo "'$added_gxx' is no executable."
> > > +        exit 1
> > > +    fi
> > > +    if test -z "$added_as" ; then
> > > +      add_file /usr/bin/as /usr/bin/as
> > > +    else
> > > +      if ! test -x "$added_as" ; then
> > > +        echo "'$added_as' is no executable."
> > > +        exit 1
> > > +      fi
> > > +      add_file $added_as  /usr/bin/as
> > > +    fi
> > >  fi
> > >
> > > -if ! test -x "$added_gxx" ; then
> > > -  echo "'$added_gcc' is no executable."
> > > -  exit 1
> > > +if test -n "$clang"; then
> > > +    if ! test -x "$added_clang" ; then
> > > +        echo "'$added_clang' is no executable."
> > > +        exit 1
> > > +    fi
> > > +    if ! test -x "$added_compilerwrapper" ; then
> > > +        echo "'$added_compilerwrapper' is no executable."
> > > +        exit 1
> > > +    fi
> > >  fi
> > >
> > > +extrafiles=3D
> > > +while test "x$1" =3D "x--addfile"; do
> > > +    shift
> > > +    extrafiles=3D"$extrafiles $1"
> > > +    shift
> > > +done
> > >
> > > +tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`
> > >
> > > -add_file $added_gcc /usr/bin/gcc
> > > -add_file $added_gxx /usr/bin/g++
> > > +# for testing the environment is usable at all
> > > +add_file /bin/true
> > >
> > > -if test -z "$added_as" ; then
> > > - add_file /usr/bin/as /usr/bin/as
> > > -else
> > > - if ! test -x "$added_as" ; then
> > > -  echo "'$added_as' is no executable."
> > > -  exit 1
> > > - fi
> > > +if test -n "$gcc"; then
> > > +    # getting compilers abs path
> > > +    added_gcc=3D$(abs_path $added_gcc)
> > > +    added_gxx=3D$(abs_path $added_gxx)
> > >
> > > - add_file $added_as  /usr/bin/as
> > > -fi
> > > +    if test -z "$clang"; then
> > > +        add_file $added_gcc /usr/bin/gcc
> > > +        add_file $added_gxx /usr/bin/g++
> > > +    else
> > > +        # HACK: The clang case below will add a wrapper in place of
> > gcc, so add the real
> > > +        # gcc under a different name that the wrapper will call.
> > > +        add_file $added_gcc /usr/bin/gcc.bin
> > > +        add_file $added_gxx /usr/bin/g++.bin
> > > +    fi
> > > +    add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1
> > > +    add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus
> > > +
> > > +    gcc_as=3D$($added_gcc -print-prog-name=3Das)
> > > +    if test "$gcc_as" =3D "as"; then
> > > +      add_file /usr/bin/as
> > > +    else
> > > +      add_file "$gcc_as" /usr/bin/as
> > > +    fi
> > >
> > > -add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1
> > > -add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus
> > > -specfile=3D`$added_gcc -print-file-name=3Dspecs`
> > > -if test -n "$specfile" && test -e "$specfile"; then
> > > -  add_file "$specfile"
> > > +    search_addfile $added_gcc specs
> > > +    search_addfile $added_gcc liblto_plugin.so
> > >  fi
> > >
> > > -ltofile=3D`$added_gcc -print-prog-name=3Dlto1`
> > > -pluginfile=3D"${ltofile%lto1}liblto_plugin.so"
> > > -if test -r "$pluginfile"
> > > -then
> > > -  add_file $pluginfile  ${pluginfile#*usr}
> > > -  add_file $pluginfile  /usr${pluginfile#*usr}
> > > +if test -n "$clang"; then
> > > +    add_file $added_clang /usr/bin/clang
> > > +    # HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded
> > and wouldn't
> > > +    # call /usr/bin/clang at all. So include a wrapper binary that w=
ill
> > call gcc or clang
> > > +    # depending on an extra argument added by icecream.
> > > +    add_file $added_compilerwrapper /usr/bin/gcc
> > > +    add_file $added_compilerwrapper /usr/bin/g++
> > > +
> > > +    add_file $($added_clang -print-prog-name=3Das) /usr/bin/as
> > > +
> > > +    # clang always uses its internal .h files
> > > +    clangincludes=3D$(dirname $($added_clang
> > -print-file-name=3Dinclude/limits.h))
> > > +    clangprefix=3D$(dirname $(dirname $added_clang))
> > > +    for file in $(find $clangincludes -type f); do
> > > +      # get path without ..
> > > +      destfile=3D$(readlink -e $file)
> > > +      # and convert from <prefix> to /usr if needed
> > > +      destfile=3D$(echo $destfile | sed "s#$clangprefix#/usr#" )
> > > +      add_file "$file" "$destfile"
> > > +    done
> > >  fi
> > >
> > > -tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`
> > > +for extrafile in $extrafiles; do
> > > +    add_file $extrafile
> > > +done
> > > +
> > > +# IKLQ ?
> > > +# special case for weird multilib setups
> > > +for dir in /lib /lib64 /usr/lib /usr/lib64; do
> > > +    test -L $dir && cp -p $dir $tempdir$dir
> > > +done
> > > +
> > >  new_target_files=3D
> > > -for i in $target_files; do
> > > +for i in $target_files; do
> >
> > Don't introduce trailing whitespaces
> >
>=20
> fixed
>=20
>=20
> > >   case $i in
> > >     *=3D/*)
> > >      target=3D`echo $i | cut -d=3D -f1`
> > > @@ -151,11 +300,11 @@ target_files=3D`for i in $new_target_files; do =
echo
> > $i; done | sort`
> > >  #if not use the md5 of all files as the archive name
> > >  if test -z "$archive_name"; then
> > >    md5sum=3DNONE
> > > -  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
> > > -    if test -x $file; then
> > > -      md5sum=3D$file
> > > -      break
> > > -    fi
> > > +  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do
> > > +     if test -x $file; then
> > > +       md5sum=3D$file
> > > +       break
> > > +     fi
> >
> > Don't introduce wrong indenntation.
> >
>=20
> Checked indentation in vi, looks consistent with context.

It was using 2 spaces in most cases (tabs and 1 space in few cases).

Adding one space inside that for loop changes it to 5 which cannot be
improvement, fixing all indentation in separate patch would be nice.

Adding /sbin/md5 isn't mentioned in commit message.

>=20
> >
> > >    done
> > >
> > >    #calculate md5 and use it as the archive name
> > > @@ -190,3 +339,4 @@ tar -czhf "$mydir/$archive_name" $target_files ||=
 {
> > >  }
> > >  cd ..
> > >  rm -rf $tempdir
> > > +
> > > diff --git a/meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_1.0.1.bb
> > > similarity index 89%
> > > rename from meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_0.1.bb
> > > rename to meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_1.0.1.bb
> > > index b04474e..c03cf5a 100644
> > > --- a/meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_0.1.bb
> > > +++ b/meta/recipes-devtools/icecc-create-env/
> > icecc-create-env-native_1.0.1.bb
> > > @@ -6,16 +6,13 @@ SECTION =3D "base"
> > >  LICENSE =3D "GPLv2+"
> > >  LIC_FILES_CHKSUM =3D
> > "file://icecc-create-env;beginline=3D2;endline=3D5;md5=3Dae1df3d6a058bf=
da40b66094c5f6065f"
> > >
> > > -PR =3D "r2"
> > > +PR =3D "r0"
> >
> > drop
> >
>=20
> why, this new recipe for version 1.0.1.

drop PR variable completely, we're dropping them with every PV upgrade
for couple months now.

>=20
> >
> > >  DEPENDS =3D ""
> > >  INHIBIT_DEFAULT_DEPS =3D "1"
> > >
> > > -FILESPATH =3D "${FILE_DIRNAME}/${PN}/"
> > > -
> >
> > You cannot drop it without moving file to BPN (see
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2013-December=
/087239.html
> >
>=20
> You are actually referring us to a patch you just submitted after my
> message.  This comment must be a joke!

If you check
http://git.shr-project.org/git/?p=3Doe-core.git;a=3Dshortlog;h=3Drefs/heads=
/jansa/test
http://git.shr-project.org/git/?p=3Doe-core.git;a=3Dcommit;h=3Dfd2a9c5538ad=
5336c3822128a8880cff357754c9

you can see that I did that change 2 days ago, just haven't sent the
patch yet, but that's not the point, point is that I've noticed that
you made the same mistake as I did before, so I've sent my patch as
reference and explanation for you (and everybody else who will also try
to remove seemingly unnecessary PATCHTOOL/FILESPATH).

Sending changes not tested in master must be a joke! I believe you've
tested it in Dylan, but that's not enough.

> > )
> > >  inherit native
> > >
> > > -PATCHTOOL =3D "patch"
> >
> > You cannot drop it without causing dependency loop (see
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2013-December=
/087239.html
> >
>=20
> ditto.

ditto

>=20
>=20
> > )
> >
> > >  SRC_URI =3D "file://icecc-create-env"
> > >
> > >  S =3D "${WORKDIR}"
> > > --
> > > 1.7.10.4
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKfxUkACgkQN1Ujt2V2gBwOWACdHA54gFa2v8yxLDNzCZvfl9Pw
4YAAn03FXulm8DeG1Vvjlt2xxH8TOAgs
=esJo
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
