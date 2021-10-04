Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A1DC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 13:44:40 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.9568.1633355078897371522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GVmO/VMl;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id t200so7685111vkt.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ad3RH67bLf7GJaXXLN6IlJbUNUY9nhw1zrlRoWteBic=;
        b=GVmO/VMlv590y9p7EONz9ot8kJp32+TaC1mG62NbND0M9CZ0a52u9F1p2Ye0Ko5CMR
         icXLm4iUBFjiFGFu0D0fC2YJVjhAGX8TOZuUibXCtOBo4Z2oPJkujMAe61ksSjYUztKs
         jfbnYwt4E/mtz01oBwPTEb6EHE7wulSqtvmuhVGRrMJQ6S5LjL5PAnsONyIM/Bo7f0/8
         x+oA3ga3UFAqwh5MwOepd4uT0yhT5ZpNn3rWHfsFe9qbiHvJEKBAPnGd3vKe7yNBQE5Z
         CMckOR12hQdNO4Dy+GBdqpWUWgZII+jxnqWjYbBVrDLLFcmp1a0yS877V4U3fk+OVsB6
         3vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ad3RH67bLf7GJaXXLN6IlJbUNUY9nhw1zrlRoWteBic=;
        b=GbS5mIBOMfwoLFHnFq2bPeiMreGZmbGv+FgLsILuI4VccPYF4pDOW27GzKKplxIFwP
         nqqX5FvlJeQtIEuyRtCGHXSsiXS+kiJgAoRSdlYYoOCz+7RKh80alIdP/QCmrQ7rf6zJ
         xHWIBz2tp1BN/1rBliFVEuHLmapu7pFrB1M2etxh7aIhcBiIMzFi+YTg81WznEkWsucI
         f2syRnr8tutFxqKzG/PYAGAWnqdT9PJK6OD0yjO3ArIRgiuw+L07RwLxO3KJZI7FOKWy
         Mf6ahH/3jWVJ98nEx1a6aed8ZXrF8eFCxhSPit6cVttW4svnOUKA+rc3JgATuAgLuj6i
         LwCw==
X-Gm-Message-State: AOAM5316Gdtx1JnH7aXNgDGCzh8XQZdpnLRQwQzMRnZ95tO5FD6FgqZe
	WaDlCtC07HXucP+3bHL6iXIkHMkrFNl3CKCkcBk=
X-Google-Smtp-Source: 
 ABdhPJwcms93MdN9KqO6comfKX1McST5D3He+NaMSRfvso8fU8IsY0jcVjsYGKlCODQ+yl53WAqkYZjWAuzoFzhqe4E=
X-Received: by 2002:a1f:3093:: with SMTP id
 w141mr15304773vkw.24.1633355075675;
 Mon, 04 Oct 2021 06:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211004105937.1535306-1-hkleynhans@fb.com>
 <20211004105937.1535306-2-hkleynhans@fb.com>
 <CANNYZj9zhiHsra5QPGWx+8aBdLCAyKei96GAxasPFuupR+JhsA@mail.gmail.com>
 <BY5PR15MB3572F4F406FCB05FE766BDF0B8AE9@BY5PR15MB3572.namprd15.prod.outlook.com>
In-Reply-To: 
 <BY5PR15MB3572F4F406FCB05FE766BDF0B8AE9@BY5PR15MB3572.namprd15.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Oct 2021 15:44:23 +0200
Message-ID: 
 <CANNYZj9pkh=Hvdo1J5ui3W1aF3F=uXdvYZMW3qxmMU57kpbxcQ@mail.gmail.com>
Subject: Re: [poky] [PATCH] sstate: Switch to ZStandard compressor support
To: Henry Kleynhans <hkleynhans@fb.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>,
 Michael van der Westhuizen <rmikey@fb.com>
Content-Type: multipart/alternative; boundary="00000000000014578205cd871d3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 13:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156591

--00000000000014578205cd871d3d
Content-Type: text/plain; charset="UTF-8"

Yes, it's here:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abelloni/kirkstone-next

Alex

On Mon, 4 Oct 2021 at 14:26, Henry Kleynhans <hkleynhans@fb.com> wrote:

> Hi Alex,
>
> I cannot see abelloni/kirkstone-next here:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/refs/heads
>
> Do I need to get them somewhere else?
>
> Kind regards, Henry
> ------------------------------
> *From:* poky@lists.yoctoproject.org <poky@lists.yoctoproject.org> on
> behalf of Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* 04 October 2021 12:10
> *To:* Henry Kleynhans <hkleynhans@fb.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>;
> poky@lists.yoctoproject.org <poky@lists.yoctoproject.org>; Michael van
> der Westhuizen <rmikey@fb.com>
> *Subject:* Re: [poky] [PATCH] sstate: Switch to ZStandard compressor
> support
>
> ZSTD_THREADS is already defined in bitbake.conf, you do not need to
> redefine it.
> (please use abelloni/kirkstone-next for testing, it is there)
>
> Alex
>
> On Mon, 4 Oct 2021 at 13:00, Henry Kleynhans via lists.yoctoproject.org
> <hkleynhans=fb.com@lists.yoctoproject.org> wrote:
>
> This patch switches the compressor from Gzip to ZStandard for ssate cache
> files.
>
> Zstandard compression provides a significant improvement in
> decompression speed as well as improvement in compression speed and disk
> usage over the 'tgz' format in use.  Furthermore, its configurable
> compression level offers a trade-off between time spent compressing
> sstate cache files and disk space used by those files.  The reduced disk
> usage also contributes to saving network traffic for those sharing their
> sstate cache with others.
>
> Zstandard should therefore be a good choice when:
> * disk space is at a premium
> * network speed / resources are limited
> * the CI server can sstate packages can be created at high compression
> * less CPU on the build server should be used for sstate decompression
>
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  meta/classes/sstate.bbclass        | 30 ++++++++++++++--------
>  meta/conf/bitbake.conf             |  2 +-
>  scripts/sstate-cache-management.sh | 40 +++++++++++++++---------------
>  3 files changed, 41 insertions(+), 31 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 92a73114bb..9d40c8ebe4 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1,17 +1,20 @@
>  SSTATE_VERSION = "3"
>
> +ZSTD_THREADS ?= "${BB_NUMBER_THREADS}"
> +SSTATE_ZSTD_CLEVEL = "8"
> +
>  SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEPREFIX =
> "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
>
>  def generate_sstatefn(spec, hash, taskname, siginfo, d):
>      if taskname is None:
>         return ""
> -    extension = ".tgz"
> +    extension = ".tar.zst"
>      # 8 chars reserved for siginfo
>      limit = 254 - 8
>      if siginfo:
>          limit = 254
> -        extension = ".tgz.siginfo"
> +        extension = ".tar.zst.siginfo"
>      if not hash:
>          hash = "INVALID"
>      fn = spec + hash + "_" + taskname + extension
> @@ -37,7 +40,7 @@ SSTATE_PKGNAME    =
> "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
>  SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   = ""
>  SSTATE_EXTRAPATHWILDCARD = ""
> -SSTATE_PATHSPEC   =
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*"
> +SSTATE_PATHSPEC   =
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
>
>  # explicitly make PV to depend on evaluated value of PV variable
>  PV[vardepvalue] = "${PV}"
> @@ -825,23 +828,24 @@ sstate_create_package () {
>         mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
>         TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
> -       # Use pigz if available
> -       OPT="-czS"
> -       if [ -x "$(command -v pigz)" ]; then
> -               OPT="-I pigz -cS"
> +       OPT="-cS"
> +       ZSTD="zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
> +       # Use pzstd if available
> +       if [ -x "$(command -v pzstd)" ]; then
> +               ZSTD="pzstd -${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}"
>         fi
>
>         # Need to handle empty directories
>         if [ "$(ls -A)" ]; then
>                 set +e
> -               tar $OPT -f $TFILE *
> +               tar -I "$ZSTD" $OPT -f $TFILE *
>                 ret=$?
>                 if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>                         exit 1
>                 fi
>                 set -e
>         else
> -               tar $OPT --file=$TFILE --files-from=/dev/null
> +               tar -I "$ZSTD" $OPT --file=$TFILE --files-from=/dev/null
>         fi
>         chmod 0664 $TFILE
>         # Skip if it was already created by some other process
> @@ -880,7 +884,13 @@ python sstate_report_unihash() {
>  # Will be run from within SSTATE_INSTDIR.
>  #
>  sstate_unpack_package () {
> -       tar -xvzf ${SSTATE_PKG}
> +       ZSTD="zstd -T${ZSTD_THREADS}"
> +       # Use pzstd if available
> +       if [ -x "$(command -v pzstd)" ]; then
> +               ZSTD="pzstd -p ${ZSTD_THREADS}"
> +       fi
> +
> +       tar -I "$ZSTD" -xvf ${SSTATE_PKG}
>         # update .siginfo atime on local/NFS mirror
>         [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [
> -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>         # Use "! -w ||" to return true for read only files
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e25d632dc1..ed746bdf99 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -498,7 +498,7 @@ HOSTTOOLS += " \
>  HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
> (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False,
> d) or any(x in (d.getVar("BBINCLUDED") or "") for x in
> ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
>
>  # Link to these if present
> -HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat
> ssh sudo"
> +HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz pzstd sftp
> socat ssh sudo"
>
>  # Temporary add few more detected in bitbake world
>  HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> diff --git a/scripts/sstate-cache-management.sh
> b/scripts/sstate-cache-management.sh
> index f1706a2229..d39671f7c6 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -114,7 +114,7 @@ echo_error () {
>  # * Add .done/.siginfo to the remove list
>  # * Add destination of symlink to the remove list
>  #
> -# $1: output file, others: sstate cache file (.tgz)
> +# $1: output file, others: sstate cache file (.tar.zst)
>  gen_rmlist (){
>    local rmlist_file="$1"
>    shift
> @@ -131,13 +131,13 @@ gen_rmlist (){
>                dest="`readlink -e $i`"
>                if [ -n "$dest" ]; then
>                    echo $dest >> $rmlist_file
> -                  # Remove the .siginfo when .tgz is removed
> +                  # Remove the .siginfo when .tar.zst is removed
>                    if [ -f "$dest.siginfo" ]; then
>                        echo $dest.siginfo >> $rmlist_file
>                    fi
>                fi
>            fi
> -          # Add the ".tgz.done" and ".siginfo.done" (may exist in the
> future)
> +          # Add the ".tar.zst.done" and ".siginfo.done" (may exist in the
> future)
>            base_fn="${i##/*/}"
>            t_fn="$base_fn.done"
>            s_fn="$base_fn.siginfo.done"
> @@ -188,10 +188,10 @@ remove_duplicated () {
>    total_files=`find $cache_dir -name 'sstate*' | wc -l`
>    # Save all the sstate files in a file
>    sstate_files_list=`mktemp` || exit 1
> -  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
> +  find $cache_dir -iname 'sstate:*:*:*:*:*:*:*.tar.zst*'
> >$sstate_files_list
>
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  sstate_suffixes="`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g'
> $sstate_files_list | sort -u`"
> +  sstate_suffixes="`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g'
> $sstate_files_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> @@ -200,10 +200,10 @@ remove_duplicated () {
>    # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
>    # SSTATE_PKGSPEC    =
> "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
>    for arch in $all_archs; do
> -      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$"
> $sstate_files_list
> +      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tar\.zst$"
> $sstate_files_list
>        [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
>        # ${builder_arch}_$arch used by toolchain sstate
> -      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$"
> $sstate_files_list
> +      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tar\.zst$"
> $sstate_files_list
>        [ $? -eq 0 ] && ava_archs="$ava_archs ${builder_arch}_$arch"
>    done
>    echo "Done"
> @@ -219,13 +219,13 @@ remove_duplicated () {
>            continue
>        fi
>        # Total number of files including .siginfo and .done files
> -      total_files_suffix=`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*"
> $sstate_files_list | wc -l 2>/dev/null`
> -      total_tgz_suffix=`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$"
> $sstate_files_list | wc -l 2>/dev/null`
> +      total_files_suffix=`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*"
> $sstate_files_list | wc -l 2>/dev/null`
> +      total_archive_suffix=`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$"
> $sstate_files_list | wc -l 2>/dev/null`
>        # Save the file list to a file, some suffix's file may not exist
> -      grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*"
> $sstate_files_list >$list_suffix 2>/dev/null
> -      local deleted_tgz=0
> +      grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*"
> $sstate_files_list >$list_suffix 2>/dev/null
> +      local deleted_archives=0
>        local deleted_files=0
> -      for ext in tgz tgz.siginfo tgz.done; do
> +      for ext in tar.zst tar.zst.siginfo tar.zst.done; do
>            echo "Figuring out the sstate:xxx_$suffix.$ext ... "
>            # Uniq BPNs
>            file_names=`for arch in $ava_archs ""; do
> @@ -268,19 +268,19 @@ remove_duplicated () {
>                done
>            done
>        done
> -      deleted_tgz=`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
> +      deleted_archives=`cat $rm_list.* 2>/dev/null | grep "\.tar\.zst$" |
> wc -l`
>        deleted_files=`cat $rm_list.* 2>/dev/null | wc -l`
>        [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
> -      echo "($deleted_tgz out of $total_tgz_suffix .tgz files for $suffix
> suffix will be removed or $deleted_files out of $total_files_suffix when
> counting also .siginfo and .done files)"
> +      echo "($deleted_archives out of $total_archives_suffix .tar.zst
> files for $suffix suffix will be removed or $deleted_files out of
> $total_files_suffix when counting also .siginfo and .done files)"
>        let total_deleted=$total_deleted+$deleted_files
>    done
> -  deleted_tgz=0
> +  deleted_archives=0
>    rm_old_list=$remove_listdir/sstate-old-filenames
> -  find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
> -  [ -s "$rm_old_list" ] && deleted_tgz=`cat $rm_old_list | grep ".tgz$" |
> wc -l`
> +  find $cache_dir -name 'sstate-*.tar.zst' >$rm_old_list
> +  [ -s "$rm_old_list" ] && deleted_archives=`cat $rm_old_list | grep
> "\.tar\.zst$" | wc -l`
>    [ -s "$rm_old_list" ] && deleted_files=`cat $rm_old_list | wc -l`
>    [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
> -  echo "($deleted_tgz .tgz files with old sstate-* filenames will be
> removed or $deleted_files when counting also .siginfo and .done files)"
> +  echo "($deleted_archives or .tar.zst files with old sstate-* filenames
> will be removed or $deleted_files when counting also .siginfo and .done
> files)"
>    let total_deleted=$total_deleted+$deleted_files
>
>    rm -f $list_suffix
> @@ -289,7 +289,7 @@ remove_duplicated () {
>        read_confirm
>        if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
>            for list in `ls $remove_listdir/`; do
> -              echo "Removing $list.tgz (`cat $remove_listdir/$list | wc
> -w` files) ... "
> +              echo "Removing $list.tar.zst archive (`cat
> $remove_listdir/$list | wc -w` files) ... "
>                # Remove them one by one to avoid the argument list too
> long error
>                for i in `cat $remove_listdir/$list`; do
>                    rm -f $verbose $i
> @@ -322,7 +322,7 @@ rm_by_stamps (){
>    find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
>
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  local sstate_suffixes="`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g'
> $cache_list | sort -u`"
> +  local sstate_suffixes="`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g'
> $cache_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> --
> 2.30.2
>
>
>
>
>

--00000000000014578205cd871d3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, it&#39;s here:</div><div><a href=3D"http://git.y=
octoproject.org/cgit.cgi/poky-contrib/log/?h=3Dabelloni/kirkstone-next">htt=
p://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dabelloni/kirkstone-=
next</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 4 Oct 2021 at 14:26=
, Henry Kleynhans &lt;<a href=3D"mailto:hkleynhans@fb.com">hkleynhans@fb.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Alex,<br>
<br>
I cannot see abelloni/kirkstone-next here:=C2=A0<a href=3D"http://git.yocto=
project.org/cgit/cgit.cgi/poky/refs/heads" id=3D"gmail-m_800536138232630615=
3LPlnk845323" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky/refs/heads</a><br>
<br>
Do I need to get them somewhere else?<br>
<br>
Kind regards, Henry</div>
<div id=3D"gmail-m_8005361382326306153appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_8005361382326306153divRplyFwdMsg" dir=3D"ltr"><font styl=
e=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From=
:</b> <a href=3D"mailto:poky@lists.yoctoproject.org" target=3D"_blank">poky=
@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:poky@lists.yoctoproject.o=
rg" target=3D"_blank">poky@lists.yoctoproject.org</a>&gt; on behalf of Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blan=
k">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> 04 October 2021 12:10<br>
<b>To:</b> Henry Kleynhans &lt;<a href=3D"mailto:hkleynhans@fb.com" target=
=3D"_blank">hkleynhans@fb.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;;=
 <a href=3D"mailto:poky@lists.yoctoproject.org" target=3D"_blank">poky@list=
s.yoctoproject.org</a> &lt;<a href=3D"mailto:poky@lists.yoctoproject.org" t=
arget=3D"_blank">poky@lists.yoctoproject.org</a>&gt;; Michael van der Westh=
uizen &lt;<a href=3D"mailto:rmikey@fb.com" target=3D"_blank">rmikey@fb.com<=
/a>&gt;<br>
<b>Subject:</b> Re: [poky] [PATCH] sstate: Switch to ZStandard compressor s=
upport</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div>ZSTD_THREADS is already defined in bitbake.conf, you do not need to re=
define it.</div>
<div>(please use abelloni/kirkstone-next for testing, it is there)<br>
</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Mon, 4 Oct 2021 at 13:00, Henry Kleynhans via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a> &lt;hkleynhans=3D<a href=3D"mailto:fb.com@lists.yoctoproject.or=
g" target=3D"_blank">fb.com@lists.yoctoproject.org</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
This patch switches the compressor from Gzip to ZStandard for ssate cache<b=
r>
files.<br>
<br>
Zstandard compression provides a significant improvement in<br>
decompression speed as well as improvement in compression speed and disk<br=
>
usage over the &#39;tgz&#39; format in use.=C2=A0 Furthermore, its configur=
able<br>
compression level offers a trade-off between time spent compressing<br>
sstate cache files and disk space used by those files.=C2=A0 The reduced di=
sk<br>
usage also contributes to saving network traffic for those sharing their<br=
>
sstate cache with others.<br>
<br>
Zstandard should therefore be a good choice when:<br>
* disk space is at a premium<br>
* network speed / resources are limited<br>
* the CI server can sstate packages can be created at high compression<br>
* less CPU on the build server should be used for sstate decompression<br>
<br>
Signed-off-by: Henry Kleynhans &lt;<a href=3D"mailto:hkleynhans@fb.com" tar=
get=3D"_blank">hkleynhans@fb.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 +++++++++=
+++++--------<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0scripts/sstate-cache-management.sh | 40 +++++++++++++++--------------=
-<br>
=C2=A03 files changed, 41 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 92a73114bb..9d40c8ebe4 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -1,17 +1,20 @@<br>
=C2=A0SSTATE_VERSION =3D &quot;3&quot;<br>
<br>
+ZSTD_THREADS ?=3D &quot;${BB_NUMBER_THREADS}&quot;<br>
+SSTATE_ZSTD_CLEVEL =3D &quot;8&quot;<br>
+<br>
=C2=A0SSTATE_MANIFESTS ?=3D &quot;${TMPDIR}/sstate-control&quot;<br>
=C2=A0SSTATE_MANFILEPREFIX =3D &quot;${SSTATE_MANIFESTS}/manifest-${SSTATE_=
MANMACH}-${PN}&quot;<br>
<br>
=C2=A0def generate_sstatefn(spec, hash, taskname, siginfo, d):<br>
=C2=A0 =C2=A0 =C2=A0if taskname is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
-=C2=A0 =C2=A0 extension =3D &quot;.tgz&quot;<br>
+=C2=A0 =C2=A0 extension =3D &quot;.tar.zst&quot;<br>
=C2=A0 =C2=A0 =C2=A0# 8 chars reserved for siginfo<br>
=C2=A0 =C2=A0 =C2=A0limit =3D 254 - 8<br>
=C2=A0 =C2=A0 =C2=A0if siginfo:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0limit =3D 254<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extension =3D &quot;.tgz.siginfo&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extension =3D &quot;.tar.zst.siginfo&quot;<br>
=C2=A0 =C2=A0 =C2=A0if not hash:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hash =3D &quot;INVALID&quot;<br>
=C2=A0 =C2=A0 =C2=A0fn =3D spec + hash + &quot;_&quot; + taskname + extensi=
on<br>
@@ -37,7 +40,7 @@ SSTATE_PKGNAME=C2=A0 =C2=A0 =3D &quot;${SSTATE_EXTRAPATH}=
${@generate_sstatefn(d.getVar(&#39;SSTATE_PK<br>
=C2=A0SSTATE_PKG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${SSTATE_DIR}/${SSTAT=
E_PKGNAME}&quot;<br>
=C2=A0SSTATE_EXTRAPATH=C2=A0 =C2=A0=3D &quot;&quot;<br>
=C2=A0SSTATE_EXTRAPATHWILDCARD =3D &quot;&quot;<br>
-SSTATE_PATHSPEC=C2=A0 =C2=A0=3D &quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILD=
CARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*&quot;<br>
+SSTATE_PATHSPEC=C2=A0 =C2=A0=3D &quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILD=
CARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
<br>
=C2=A0# explicitly make PV to depend on evaluated value of PV variable<br>
=C2=A0PV[vardepvalue] =3D &quot;${PV}&quot;<br>
@@ -825,23 +828,24 @@ sstate_create_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pigz if available<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-czS&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pigz)&quot; ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-I pigz=
 -cS&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-cS&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;zstd -${SSTATE_ZSTD_CLEVEL} -T${ZS=
TD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pzstd if available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pzstd)&quot; ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;pzstd =
-${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Need to handle empty directories<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$(ls -A)&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set +e<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar $OPT -f $TFILE =
*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&=
quot; $OPT -f $TFILE *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $ret -ne 0 ] &=
amp;&amp; [ $ret -ne 1 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set -e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar $OPT --file=3D$=
TFILE --files-from=3D/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&=
quot; $OPT --file=3D$TFILE --files-from=3D/dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0664 $TFILE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip if it was already created by some other =
process<br>
@@ -880,7 +884,13 @@ python sstate_report_unihash() {<br>
=C2=A0# Will be run from within SSTATE_INSTDIR.<br>
=C2=A0#<br>
=C2=A0sstate_unpack_package () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xvzf ${SSTATE_PKG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;zstd -T${ZSTD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pzstd if available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pzstd)&quot; ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;pzstd =
-p ${ZSTD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; -xvf ${SSTATE_PKG}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # update .siginfo atime on local/NFS mirror<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -O ${SSTATE_PKG}.siginfo ] &amp;&amp; [ -w ${=
SSTATE_PKG}.siginfo ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; to=
uch -a ${SSTATE_PKG}.siginfo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use &quot;! -w ||&quot; to return true for re=
ad only files<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index e25d632dc1..ed746bdf99 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -498,7 +498,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0HOSTTOOLS +=3D &quot;${@&#39;ip ping ps scp ssh stty&#39; if (bb.util=
s.contains_any(&#39;IMAGE_CLASSES&#39;, &#39;testimage testsdk&#39;, True, =
False, d) or any(x in (d.getVar(&quot;BBINCLUDED&quot;) or &quot;&quot;) fo=
r x in [&quot;testimage.bbclass&quot;, &quot;testsdk.bbclass&quot;])) else =
&#39;&#39;}&quot;<br>
<br>
=C2=A0# Link to these if present<br>
-HOSTTOOLS_NONFATAL +=3D &quot;aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp s=
ocat ssh sudo&quot;<br>
+HOSTTOOLS_NONFATAL +=3D &quot;aws gcc-ar gpg ld.bfd ld.gold nc pigz pzstd =
sftp socat ssh sudo&quot;<br>
<br>
=C2=A0# Temporary add few more detected in bitbake world<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;join nl size yes zcat&quot;<br>
diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-mana=
gement.sh<br>
index f1706a2229..d39671f7c6 100755<br>
--- a/scripts/sstate-cache-management.sh<br>
+++ b/scripts/sstate-cache-management.sh<br>
@@ -114,7 +114,7 @@ echo_error () {<br>
=C2=A0# * Add .done/.siginfo to the remove list<br>
=C2=A0# * Add destination of symlink to the remove list<br>
=C2=A0#<br>
-# $1: output file, others: sstate cache file (.tgz)<br>
+# $1: output file, others: sstate cache file (.tar.zst)<br>
=C2=A0gen_rmlist (){<br>
=C2=A0 =C2=A0local rmlist_file=3D&quot;$1&quot;<br>
=C2=A0 =C2=A0shift<br>
@@ -131,13 +131,13 @@ gen_rmlist (){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D&quot;`readli=
nk -e $i`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$dest&=
quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $=
dest &gt;&gt; $rmlist_file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove th=
e .siginfo when .tgz is removed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove th=
e .siginfo when .tar.zst is removed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -=
f &quot;$dest.siginfo&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo $dest.siginfo &gt;&gt; $rmlist_file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the &quot;.tgz.done&quot; and &qu=
ot;.siginfo.done&quot; (may exist in the future)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the &quot;.tar.zst.done&quot; and=
 &quot;.siginfo.done&quot; (may exist in the future)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_fn=3D&quot;${i##/*/}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t_fn=3D&quot;$base_fn.done&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_fn=3D&quot;$base_fn.siginfo.done=
&quot;<br>
@@ -188,10 +188,10 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0total_files=3D`find $cache_dir -name &#39;sstate*&#39; | wc -l=
`<br>
=C2=A0 =C2=A0# Save all the sstate files in a file<br>
=C2=A0 =C2=A0sstate_files_list=3D`mktemp` || exit 1<br>
-=C2=A0 find $cache_dir -name &#39;sstate:*:*:*:*:*:*:*.tgz*&#39; &gt;$ssta=
te_files_list<br>
+=C2=A0 find $cache_dir -iname &#39;sstate:*:*:*:*:*:*:*.tar.zst*&#39; &gt;=
$sstate_files_list<br>
<br>
=C2=A0 =C2=A0echo &quot;Figuring out the suffixes in the sstate cache dir .=
.. &quot;<br>
-=C2=A0 sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g&#39; $sstate_files_list | sort -=
u`&quot;<br>
+=C2=A0 sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g&#39; $sstate_files_list | s=
ort -u`&quot;<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
=C2=A0 =C2=A0echo &quot;The following suffixes have been found in the cache=
 dir:&quot;<br>
=C2=A0 =C2=A0echo $sstate_suffixes<br>
@@ -200,10 +200,10 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0# Using this SSTATE_PKGSPEC definition it&#39;s 6th colon sepa=
rated field<br>
=C2=A0 =C2=A0# SSTATE_PKGSPEC=C2=A0 =C2=A0 =3D &quot;sstate:${PN}:${PACKAGE=
_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_=
VERSION}:&quot;<br>
=C2=A0 =C2=A0for arch in $all_archs; do<br>
-=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch=
:[^:]*:[^:]*\.tgz$&quot; $sstate_files_list<br>
+=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch=
:[^:]*:[^:]*\.tar\.zst$&quot; $sstate_files_list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $? -eq 0 ] &amp;&amp; ava_archs=3D&quot;$ava_a=
rchs $arch&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# ${builder_arch}_$arch used by toolchain sstate=
<br>
-=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${bui=
lder_arch}_$arch:[^:]*:[^:]*\.tgz$&quot; $sstate_files_list<br>
+=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${bui=
lder_arch}_$arch:[^:]*:[^:]*\.tar\.zst$&quot; $sstate_files_list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $? -eq 0 ] &amp;&amp; ava_archs=3D&quot;$ava_a=
rchs ${builder_arch}_$arch&quot;<br>
=C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
@@ -219,13 +219,13 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# Total number of files including .siginfo and .=
done files<br>
-=C2=A0 =C2=A0 =C2=A0 total_files_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]=
*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*&quot; $sstate_files_list | =
wc -l 2&gt;/dev/null`<br>
-=C2=A0 =C2=A0 =C2=A0 total_tgz_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]*:=
[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$&quot; $sstate_files_list | wc =
-l 2&gt;/dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 total_files_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]=
*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*&quot; $sstate_files_li=
st | wc -l 2&gt;/dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 total_archive_suffix=3D`grep &quot;.*/sstate:[^:]*:[^=
:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$&quot; $sstate_files_l=
ist | wc -l 2&gt;/dev/null`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# Save the file list to a file, some suffix&#39;=
s file may not exist<br>
-=C2=A0 =C2=A0 =C2=A0 grep &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^=
:]*:[^:_]*_$suffix\.tgz.*&quot; $sstate_files_list &gt;$list_suffix 2&gt;/d=
ev/null<br>
-=C2=A0 =C2=A0 =C2=A0 local deleted_tgz=3D0<br>
+=C2=A0 =C2=A0 =C2=A0 grep &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^=
:]*:[^:_]*_$suffix\.tar\.zst.*&quot; $sstate_files_list &gt;$list_suffix 2&=
gt;/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 local deleted_archives=3D0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0local deleted_files=3D0<br>
-=C2=A0 =C2=A0 =C2=A0 for ext in tgz tgz.siginfo tgz.done; do<br>
+=C2=A0 =C2=A0 =C2=A0 for ext in tar.zst tar.zst.siginfo tar.zst.done; do<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Figuring out the sstate=
:xxx_$suffix.$ext ... &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uniq BPNs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_names=3D`for arch in $ava_arc=
hs &quot;&quot;; do<br>
@@ -268,19 +268,19 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 deleted_tgz=3D`cat $rm_list.* 2&gt;/dev/null | grep &=
quot;.tgz$&quot; | wc -l`<br>
+=C2=A0 =C2=A0 =C2=A0 deleted_archives=3D`cat $rm_list.* 2&gt;/dev/null | g=
rep &quot;\.tar\.zst$&quot; | wc -l`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0deleted_files=3D`cat $rm_list.* 2&gt;/dev/null |=
 wc -l`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;$deleted_files&quot; -gt 0 -a $debug -gt=
 0 ] &amp;&amp; cat $rm_list.*<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;($deleted_tgz out of $total_tgz_suffix .tg=
z files for $suffix suffix will be removed or $deleted_files out of $total_=
files_suffix when counting also .siginfo and .done files)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;($deleted_archives out of $total_archives_=
suffix .tar.zst files for $suffix suffix will be removed or $deleted_files =
out of $total_files_suffix when counting also .siginfo and .done files)&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0let total_deleted=3D$total_deleted+$deleted_file=
s<br>
=C2=A0 =C2=A0done<br>
-=C2=A0 deleted_tgz=3D0<br>
+=C2=A0 deleted_archives=3D0<br>
=C2=A0 =C2=A0rm_old_list=3D$remove_listdir/sstate-old-filenames<br>
-=C2=A0 find $cache_dir -name &#39;sstate-*.tgz&#39; &gt;$rm_old_list<br>
-=C2=A0 [ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_tgz=3D`cat $rm_o=
ld_list | grep &quot;.tgz$&quot; | wc -l`<br>
+=C2=A0 find $cache_dir -name &#39;sstate-*.tar.zst&#39; &gt;$rm_old_list<b=
r>
+=C2=A0 [ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_archives=3D`cat =
$rm_old_list | grep &quot;\.tar\.zst$&quot; | wc -l`<br>
=C2=A0 =C2=A0[ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_files=3D`ca=
t $rm_old_list | wc -l`<br>
=C2=A0 =C2=A0[ -s &quot;$rm_old_list&quot; -a $debug -gt 0 ] &amp;&amp; cat=
 $rm_old_list<br>
-=C2=A0 echo &quot;($deleted_tgz .tgz files with old sstate-* filenames wil=
l be removed or $deleted_files when counting also .siginfo and .done files)=
&quot;<br>
+=C2=A0 echo &quot;($deleted_archives or .tar.zst files with old sstate-* f=
ilenames will be removed or $deleted_files when counting also .siginfo and =
.done files)&quot;<br>
=C2=A0 =C2=A0let total_deleted=3D$total_deleted+$deleted_files<br>
<br>
=C2=A0 =C2=A0rm -f $list_suffix<br>
@@ -289,7 +289,7 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0read_confirm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$confirm&quot; =3D &quot;y&quot; -o &=
quot;$confirm&quot; =3D &quot;Y&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for list in `ls $remove_listdir/`;=
 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Removing $list=
.tgz (`cat $remove_listdir/$list | wc -w` files) ... &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Removing $list=
.tar.zst archive (`cat $remove_listdir/$list | wc -w` files) ... &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove them one by=
 one to avoid the argument list too long error<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `cat $remov=
e_listdir/$list`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f =
$verbose $i<br>
@@ -322,7 +322,7 @@ rm_by_stamps (){<br>
=C2=A0 =C2=A0find $cache_dir -type f -name &#39;sstate*&#39; | sort -u -o $=
cache_list<br>
<br>
=C2=A0 =C2=A0echo &quot;Figuring out the suffixes in the sstate cache dir .=
.. &quot;<br>
-=C2=A0 local sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g&#39; $cache_list | sort -u=
`&quot;<br>
+=C2=A0 local sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g&#39; $cache_list | so=
rt -u`&quot;<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
=C2=A0 =C2=A0echo &quot;The following suffixes have been found in the cache=
 dir:&quot;<br>
=C2=A0 =C2=A0echo $sstate_suffixes<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--00000000000014578205cd871d3d--

