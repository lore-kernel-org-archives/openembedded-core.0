Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 79CB67488E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 15:55:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l1-v6so27515326wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=yKZUpBsYYJS1wSpomnSzHMtDEbjMkwxy6EUAihBx2Bc=;
	b=KjbqPxQ7IDt8Dt1vWfSPyjeN5QawrSUm6EMpde4rCusm+wTr9jb9OM8phC3hmLyNfo
	jNoE8KWcWYQJDWVSGQLlhgcw6hvTqZYGHnCj0G8GEVbyM+RkcMYk71wYCLjgy5laE3iW
	BaWT7wjke+1VIKiXQ5z05L4zgluuaq+QHg9oNF6ZWif6UtnU08Dcd8KPqm0oqwfd9iI2
	4rkuGUe6WzrNojX6gC81sZJj1L2WvCh+aHi71mDpmg/bxCfjNv5KfWywm5E02EVgPpAy
	RK24kF3YphB+XILQIfbgWmKSn/ZPaX28zWapvFGATbJHwpQamyUuFQwOo44L2brVN4p7
	EkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=yKZUpBsYYJS1wSpomnSzHMtDEbjMkwxy6EUAihBx2Bc=;
	b=YQYIttN4G4/QuDwyDCKcGMdv5Ol8X6VHsqMWmGQ7CRn96ZfhP2R1DfvVvoARsvZRCV
	KFc3+xd2Uv8CQlfqF9Syo1cQifzyawx1ydWCl+JMHQ1wV1C99XMJ6jZ5s1g8+o1IPWQC
	ilrxTGub+ISzVcdv8DEqc7hAmhje4Mwo0wJTsVYDlhc1hhFMygNL4yZNucv3mkyCUgsc
	3rOEUT2aQRL/5Q9l3c1FJVcvtl4o+XXVDTl74H3/luQLnEMxJQ7V7O/OcrSemANdqSjp
	2sfYFtwOwfNy6EekrDqnEtNG7AjpbhXUUK/GDD5X3S1VT8v7+b4c56F1ciqpBVLBBypZ
	jpDw==
X-Gm-Message-State: ALKqPwfm2ssa8CqFouQ1KboBUuEtQKizcisYtSwV61S00u9Spmn1I6o4
	Qs+7COWtXBRoOZwYr2ZccHiipfXU
X-Google-Smtp-Source: AB8JxZrUbC64PxX/1tRsdohr7g83Qh1U6bjqCeji7lpda2sUrjFJi4PirMUdXWictjLe5xjyAB2sUg==
X-Received: by 2002:a1c:8583:: with SMTP id
	h125-v6mr10547711wmd.98.1526918113337; 
	Mon, 21 May 2018 08:55:13 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	h10-v6sm24070325wrf.83.2018.05.21.08.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 08:55:12 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
Date: Mon, 21 May 2018 17:55:11 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Mon, 21 May 2018 15:55:13 -0000
X-Groupsio-MsgNum: 111565
Content-Type: multipart/signed;
	boundary="Apple-Mail=_70ED304C-8A2D-4293-BD73-AB8BE09EC4D0";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_70ED304C-8A2D-4293-BD73-AB8BE09EC4D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Move scripts/bashrc from meta-jens/scripts to oe-core to share =
user-friendly
oe builddir management with community. Using this script will help =
manage
multiple BSPs and targets like perl developers using perlbrew.

Add few missed features as list contained repositories, used layers or =
other
builddir (in this BSP).

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 scripts/oe-init-bashrc | 497 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 497 insertions(+)
 create mode 100644 scripts/oe-init-bashrc

diff --git a/scripts/oe-init-bashrc b/scripts/oe-init-bashrc
new file mode 100644
index 0000000000..62ce2af84c
--- /dev/null
+++ b/scripts/oe-init-bashrc
@@ -0,0 +1,497 @@
+OECONF_BASHRC_VERSION=3D"0.1"
+#!/bin/sh
+
+# OE Build Environment Setup Script
+#
+# Copyright (C) 2006-2011 Linux Foundation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
+
+#
+# Normally this is called as '. ./oe-init-bashrc'
+#
+# This works in most shells (not dash), but not all of them pass arg1 =
when
+# being sourced.   To workaround the shell limitation use "set arg1" =
prior
+# to sourcing this script.
+#
+
+__oe_guess_oeroot() {
+    if [ -n "$BASH_SOURCE" ]; then
+       OEROOT=3D"`dirname $BASH_SOURCE`"
+    elif [ -n "$ZSH_NAME" ]; then
+       OEROOT=3D"`dirname $0`"
+    else
+       OEROOT=3D"`pwd`"
+    fi
+
+    while [ ! $(echo $OEROOT | egrep 'poky$') ]
+    do
+        test -d ${OEROOT}/poky && OEROOT=3D"${OEROOT}/poky" && break
+        OEROOT=3D`dirname "$OEROOT"`
+    done
+
+    OEROOT=3D`readlink -f "$OEROOT"`
+    export OEROOT
+}
+
+__oe_guess_bbdir() {
+    BITBAKEDIR=3D"$OEROOT/bitbake$BBEXTRA/"
+    BITBAKEDIR=3D`readlink -f "$BITBAKEDIR"`
+}
+
+#
+# Nice path functions with slight modifications from:
+#
+#   =
http://stackoverflow.com/questions/370047/what-is-the-most-elegant-way-to-=
remove-a-path-from-the-path-variable-in-bash
+#
+__oe_append_path()  { NEW=3D${1/%\//}; test -d $NEW || return; =
__oe_remove_path $NEW; export PATH=3D"$PATH:$NEW"; }
+__oe_prepend_path() { NEW=3D${1/%\//}; test -d $NEW || return; =
__oe_remove_path $NEW; export PATH=3D"$NEW:$PATH"; }
+__oe_remove_path()  {
+    # New format not supported by some old versions of awk
+    # PATH=3D`echo -n "$PATH" | awk -v RS=3D: -v ORS=3D: '$0 !=3D =
"'$1'"'`
+    PATH=3D`echo -n "$PATH" | awk  'BEGIN { RS=3D":"; ORS=3D":" } $0 !=3D=
 "'$1'" '`
+    export PATH=3D${PATH/%:/}
+}
+
+__oe_append_extrawhite() { NEW=3D${1/%\//}; __oe_remove_extrawhite =
$NEW; export BB_ENV_EXTRAWHITE=3D"$BB_ENV_EXTRAWHITE $NEW"; }
+__oe_prepend_extrawhite() { NEW=3D${1/%\//}; __oe_remove_extrawhite =
$NEW; export BB_ENV_EXTRAWHITE=3D"$NEW $BB_ENV_EXTRAWHITE"; }
+__oe_remove_extrawhite()  {
+    # New format not supported by some old versions of awk
+    BB_ENV_EXTRAWHITE=3D`echo -n "$BB_ENV_EXTRAWHITE" | awk  'BEGIN { =
RS=3D" "; ORS=3D" " } $0 !=3D "'$1'" '`
+    export BB_ENV_EXTRAWHITE=3D${BB_ENV_EXTRAWHITE/%:/}
+}
+
+__oe_guess_bspdir () {
+    if [ -r "$BUILDDIR/conf/bblayers.conf" ]; then
+        BSPDIR=3D$(readlink -f `grep -e 'BSPDIR.*=3D' =
"$BUILDDIR/conf/bblayers.conf" | sed -e 's,^.*{@,,' -e 's,)}.*$,,' \
+            -e "s:os.path.abspath(os.path.dirname(d.getVar('FILE', =
True)) + :$BUILDDIR/conf:" \
+            -e "s,',,g"`)
+        export BSPDIR
+    fi
+}
+
+declare -a _OE_BBLAYERS
+
+__oe_guess_layers () {
+    if [ -r "$BUILDDIR/conf/bblayers.conf" ]; then
+        _OE_BBLAYERS=3D()
+        test -z "$BSPDIR" && __oe_guess_bspdir
+        for layer in `sed -e 's/#.*//g' $BUILDDIR/conf/bblayers.conf | =
fgrep '${BSPDIR}' | sed -e 's,BBLAYERS[^\$]*,,g' -e 's, ["\\],,'`; do
+            layer=3D`echo ${layer} | sed -e =
"s,\\\${BSPDIR},${BSPDIR},"`
+            _OE_BBLAYERS[${#_OE_BBLAYERS[*]}]=3D"$layer"
+            export _OE_BBLAYERS
+        done
+    fi
+}
+
+declare -a _OE_GITREPOS
+
+__oe_guess_repos () {
+    test ${#_OE_BBLAYERS[*]} -eq 0 && __oe_guess_layers
+    for _li in `seq 0 $(expr ${#_OE_BBLAYERS[*]} - 1)`; do
+        layer=3D"${_OE_BBLAYERS[$_li]}"
+        while [ "${layer}" !=3D "${BSPDIR}" ]; do
+            if [ -d "${layer}/.git" ]; then
+                if ! $(echo "${_OE_GITREPOS[*]}" | grep -q "$layer"); =
then
+                    _OE_GITREPOS[${#_OE_GITREPOS[*]}]=3D"$layer"
+                fi
+                break # while
+            fi
+            layer=3D`dirname "$layer"`
+        done
+    done
+
+    if [ -n "${BUILDDIR}" -a -d "${BUILDDIR}/.git" ]; then
+        if ! $(echo "${_OE_GITREPOS[*]}" | grep -q "${BUILDDIR}"); then
+            _OE_GITREPOS[${#_OE_GITREPOS[*]}]=3D"${BUILDDIR}"
+        fi
+    fi
+
+    if [ -n "${BSPDIR}" -a -d "${BSPDIR}/.git" ]; then
+        if ! $(echo "${_OE_GITREPOS[*]}" | grep -q "${BSPDIR}"); then
+            _OE_GITREPOS[${#_OE_GITREPOS[*]}]=3D"${BSPDIR}"
+        fi
+    fi
+
+    export _OE_GITREPOS
+}
+
+__oe_init () {
+    if [ ! -n "$OE_BUILDDIR_SKIP_INIT" ]; then
+        __oe_guess_layers
+        for _li in `seq 0 $(expr ${#_OE_BBLAYERS[*]} - 1)`; do
+            if [ -f "${_OE_BBLAYERS[$_li]}/.oe-init" ]; then
+                . "${_OE_BBLAYERS[$_li]}/.oe-init"
+            fi
+        done
+        if [ -f "$OE_BUILDDIR_HOME/init" ]; then
+            . "$OE_BUILDDIR_HOME/init"
+        fi
+    fi
+
+    if [ -z "$OE_SKIP_SDK_CHECK" -a ! -z "$OECORE_SDK_VERSION" ]; then
+        echo >&2 "Error: The OE SDK/ADT was detected as already being =
present in this shell environment."
+        echo >&2 "Please use a clean shell when using this environment =
script."
+        return 1
+    fi
+
+    __oe_check_py || return 1
+
+    __oe_prepend_path "${OEROOT}/scripts"
+    __oe_prepend_path "$BITBAKEDIR/bin"
+}
+
+__oe_check_py () {
+    # Make sure we're not using python v3.x. This check can't go into
+    # sanity.bbclass because bitbake's source code doesn't even pass
+    # parsing stage when used with python v3, so we catch it here so we
+    # can offer a meaningful error message.
+    py_v3_check=3D`/usr/bin/env python --version 2>&1 | grep "Python =
3"`
+    if [ "$py_v3_check" !=3D "" ]; then
+        echo >&2 "Bitbake is not compatible with python v3"
+        echo >&2 "Please set up python v2 as your default python =
interpreter"
+        return 1
+    fi
+
+    # Similarly, we now have code that doesn't parse correctly with =
older
+    # versions of Python, and rather than fixing that and being =
eternally
+    # vigilant for any other new feature use, just check the version =
here.
+    py_v273_check=3D`python -c 'import sys; print sys.version_info >=3D =
(2,7,3)'`
+    if [ "$py_v273_check" !=3D "True" ]; then
+        echo >&2 "BitBake requires Python 2.7.3 or later"
+        return 1
+    fi
+}
+
+__oe_setup_builddir () {
+    if [ -z "$BUILDDIR" ]; then
+        echo >&2 "Error: The build directory (BUILDDIR) must be set!"
+        return 1
+    fi
+
+    mkdir -p "$BUILDDIR/conf"
+
+    if [ ! -d "$BUILDDIR" ]; then
+        echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
+        return 1
+    fi
+
+    if [ ! -w "$BUILDDIR" ]; then
+        echo >&2 "Error: Cannot write to $BUILDDIR, perhaps try using a =
writable path? i.e. . oe_builddir use ~/bsp/my_build"
+        return 1
+    fi
+
+    # Attempting removal of sticky,setuid bits from BUILDDIR, =
BUILDDIR/conf
+    chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod =
$BUILDDIR"
+    chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to =
chmod $BUILDDIR/conf"
+
+    cd "$BUILDDIR"
+
+    if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
+        TEMPLATECONF=3D$(cat "$BUILDDIR/conf/templateconf.cfg")
+    fi
+
+    . $OEROOT/.templateconf
+
+    if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
+        echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
+    fi
+
+    #
+    # $TEMPLATECONF can point to a directory for the template =
local.conf & bblayers.conf
+    #
+    if [ -n "$TEMPLATECONF" ]; then
+        if [ ! -d "$TEMPLATECONF" ]; then
+            # Allow TEMPLATECONF=3Dmeta-xyz/conf as a shortcut
+            if [ -d "$OEROOT/$TEMPLATECONF" ]; then
+                TEMPLATECONF=3D"$OEROOT/$TEMPLATECONF"
+            fi
+            if [ ! -d "$TEMPLATECONF" ]; then
+                echo >&2 "Error: '$TEMPLATECONF' must be a directory =
containing local.conf & bblayers.conf"
+                return 1
+            fi
+        fi
+        OECORELAYERCONF=3D"$TEMPLATECONF/bblayers.conf.sample"
+        OECORELOCALCONF=3D"$TEMPLATECONF/local.conf.sample"
+        OECORENOTESCONF=3D"$TEMPLATECONF/conf-notes.txt"
+    fi
+
+    unset SHOWYPDOC
+    if [ -z "$OECORELOCALCONF" ]; then
+        OECORELOCALCONF=3D"$OEROOT/meta/conf/local.conf.sample"
+    fi
+    if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
+    cat <<EOM
+You had no conf/local.conf file. This configuration file has therefore =
been
+created for you with some default values. You may wish to edit it to =
use a
+different MACHINE (target hardware) or enable parallel build options to =
take
+advantage of multiple cores for example. See the file for more =
information as
+common configuration options are commented.
+
+EOM
+        cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
+        SHOWYPDOC=3Dyes
+    fi
+
+    if [ -z "$OECORELAYERCONF" ]; then
+        OECORELAYERCONF=3D"$OEROOT/meta/conf/bblayers.conf.sample"
+    fi
+    if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
+        cat <<EOM
+You had no conf/bblayers.conf file. The configuration file has been =
created for
+you with some default values. To add additional metadata layers into =
your
+configuration please add entries to this file.
+
+EOM
+
+        # Put the abosolute path to the layers in bblayers.conf so we =
can run
+        # bitbake without the init script after the first run
+        # ##COREBASE## is deprecated as it's meaning was inconsistent, =
but continue
+        # to replace it for compatibility.
+        sed -e "s|##OEROOT##|$OEROOT|g" \
+            -e "s|##COREBASE##|$OEROOT|g" \
+            $OECORELAYERCONF > "$BUILDDIR/conf/bblayers.conf"
+        SHOWYPDOC=3Dyes
+    fi
+
+    # Prevent disturbing a new GIT clone in same console
+    unset OECORELOCALCONF
+    unset OECORELAYERCONF
+
+    # Ending the first-time run message. Show the YP Documentation =
banner.
+    if [ ! -z "$SHOWYPDOC" ]; then
+        cat <<EOM
+The Yocto Project has extensive documentation about OE including a =
reference
+manual which can be found at:
+    http://yoctoproject.org/documentation
+
+For more information about OpenEmbedded see their website:
+    http://www.openembedded.org/
+
+EOM
+#    unset SHOWYPDOC
+    fi
+
+    cat <<EOM
+
+### Shell environment set up for builds. ###
+
+You can now run 'bitbake <target>'
+
+EOM
+
+    if [ -z "$OECORENOTESCONF" ]; then
+        OECORENOTESCONF=3D"$OEROOT/meta/conf/conf-notes.txt"
+    fi
+    [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
+    unset OECORENOTESCONF
+}
+
+__oe_activate() {
+    BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY =
http_proxy \
+HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy =
ALL_PROXY \
+all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK =
BB_SRCREV_POLICY \
+SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE =
GIT_PROXY_COMMAND \
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
+    export BB_ENV_EXTRAWHITE
+
+    test -d "${BUILDDIR}/conf" || __oe_setup_builddir
+    export BUILDDIR
+    __oe_init
+
+    cd "${BUILDDIR}"
+}
+
+__oe_deactivate() {
+    # Shutdown any bitbake server if the BBSERVER variable is not set
+    if [ -z "$BBSERVER" ] && [ -f ${BUILDDIR}/bitbake.lock ] ; then
+        grep ":" ${BUILDDIR}/bitbake.lock > /dev/null && BBSERVER=3D`cat =
bitbake.lock` bitbake --status-only
+        if [ $? =3D 0 ] ; then
+            echo "Shutting down bitbake memory resident server with =
bitbake -m"
+            BBSERVER=3D`cat ${BUILDDIR}/bitbake.lock` bitbake -m
+        fi
+    fi
+
+    if [ -n "$BBSERVER" ]; then
+       unset BBSERVER
+    fi
+
+    if [ -n "$BB_ENV_EXTRAWHITE" ]; then
+       unset BB_ENV_EXTRAWHITE
+    fi
+
+    for _li in `seq 0 $(expr ${#_OE_BBLAYERS[*]} - 1)`; do
+        if [ -f "${_OE_BBLAYERS[$_li]}/.oe-down" ]; then
+            . "${_OE_BBLAYERS[$_li]}/.oe-down"
+        fi
+    done
+    if [ ! -n "$OE_BUILDDIR_SKIP_DOWN" ]; then
+        if [ -f "$OE_BUILDDIR_HOME/down" ]; then
+            . "$OE_BUILDDIR_HOME/down"
+        fi
+    fi
+
+    unset BSPDIR
+    unset _OE_BBLAYERS
+
+    __oe_remove_path "${OEROOT}/scripts"
+    __oe_remove_path "$BITBAKEDIR/bin"
+}
+
+oe_builddir () {
+    local exit_status
+    local short_option
+    export SHELL
+
+    test -z "$BITBAKEDIR" && __oe_guess_bbdir
+
+    if [[ $1 =3D=3D -* ]]; then
+        short_option=3D$1
+        shift
+    else
+        short_option=3D""
+    fi
+
+    case $1 in
+        (use)
+            if [ -z "$2" ] ; then
+                echo "oe_builddir use <path>" >&2
+                exit_status=3D1
+            else
+                BUILDDIR=3D"$2"
+                __oe_deactivate
+                __oe_activate
+            fi
+            ;;
+
+        (useres)
+            if [ -z "$2" ] ; then
+                echo "oe_builddir useres <path>" >&2
+                exit_status=3D1
+            else
+                BUILDDIR=3D"$2"
+                test -z "$OE_BBSERVER_PORT" && OE_BBSERVER_PORT=3D"-1"
+
+                __oe_deactivate
+                __oe_activate
+
+                res=3D1
+                if [ -e ${BUILDDIR}/bitbake.lock ] && grep : =
${BUILDDIR}/bitbake.lock > /dev/null ; then
+                    BBSERVER=3D`cat ${BUILDDIR}/bitbake.lock` bitbake =
--status-only
+                    res=3D$?
+                fi
+
+                if [ $res !=3D 0 ] ; then
+                    bitbake --server-only -t xmlrpc -B =
localhost:$OE_BBSERVER_PORT
+                fi
+
+                if [ $OE_BBSERVER_PORT =3D -1 ] ; then
+                    export BBSERVER=3Dlocalhost:-1
+                    echo "Bitbake server started on demand as needed, =
use bitbake -m to shut it down"
+                else
+                    export BBSERVER=3D`cat ${BUILDDIR}/bitbake.lock`
+
+                    if [ $res =3D 0 ] ; then
+                        echo "Using existing bitbake server at: =
$BBSERVER, use bitbake -m to shut it down"
+                    else
+                        echo "Bitbake server started at: $BBSERVER, use =
bitbake -m to shut it down"
+                    fi
+                    unset res
+                fi
+            fi
+            ;;
+
+        (setup)
+            if [ -z "$2" ] ; then
+                echo "oe_builddir <path>" >&2
+                exit_status=3D1
+            else
+                BUILDDIR=3D"$2"
+                __oe_setup_builddir
+            fi
+            ;;
+
+        (avail)
+            # XXX maybe start $(dirname $(dirname $OEROOT)) when no =
BSPDIR is there ...
+            if [ -n "$BSPDIR" ]; then
+                local d
+                for d in "${BSPDIR}"/*/conf/local.conf; do
+                    echo $(dirname $(dirname $d))
+                done
+            fi
+            ;;
+
+        (layers)
+            test "${#_OE_BBLAYERS[*]}" -gt 0 || __oe_guess_layers
+            for _li in `seq 0 $(expr ${#_OE_BBLAYERS[*]} - 1)`; do
+                echo "${_OE_BBLAYERS[$_li]}"
+            done
+            ;;
+
+        (repos)
+            test "${#_OE_GITREPOS[*]}" -gt 0 || __oe_guess_repos
+            for _li in `seq 0 $(expr ${#_OE_GITREPOS[*]} - 1)`; do
+                echo "${_OE_GITREPOS[$_li]}"
+            done
+            ;;
+
+        (prune)
+            test -z "$BUILDDIR" -a -n "$2" && oe_builddir use "$2"
+            if [ -z "$BUILDDIR" ] ; then
+                echo "oe_builddir use <path>; oe_builddir prune" >&2
+                echo "oe_builddir prune <path>" >&2
+                exit_status=3D1
+            else
+                rm -f package-depends.dot pn-buildlist pn-depends.dot =
task-depends.dot
+                for build_result in cache sstate-cache tmp buildhistory
+                do
+                    test -d ${BUILDDIR}/${build_result} || continue
+                    mv ${BUILDDIR}/${build_result} =
${BUILDDIR}/${build_result}.old
+                    rm -rf ${BUILDDIR}/${build_result}.old &
+                done
+
+                echo "${BUILDDIR} is ready for fresh build"
+            fi
+            ;;
+
+        (off)
+            __oe_deactivate
+            unset BBPATH
+            unset BBSERVER
+            unset BB_ENV_EXTRAWHITE
+            ;;
+
+        (*)
+        cat <<EOM
+oe_builddir <command> [argument]
+Available commands:
+    use         use specified build-dir, setup when local.conf and/or =
bblayers.conf are missing
+    setup       create default builddir
+    avail       list possible build-dir's
+    layers      list layers used in BSP
+    repos       list repositories used in BSP
+    prune       prune old builds
+    off         remove all settings from oe from shell environment
+EOM
+            exit_status=3D1
+            ;;
+
+    esac
+    hash -r
+    return ${exit_status:-0}
+}
+
+test -z "$OE_BUILDDIR_HOME" && export OE_BUILDDIR_HOME=3D"$HOME/.oe"
+test -z "$OEROOT" && __oe_guess_oeroot

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_70ED304C-8A2D-4293-BD73-AB8BE09EC4D0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsC698ACgkQRJmWrtzl
Cp1eDA//RIl067M0JTcR4isaX0K3PK5PEE3Oi2+DqwGO6zHj6ej+PLgFRkIGX18G
QqPglXQGuUkyv/xuYXEW9pT52dZClpNfRyXLE5ShB5/gNWKXWmrWp4KwyeRGe+NO
ePsIIIpke8WaKgT8xSfPWCMCczYGCSyKX2Dzt7IcyLkn2YPH8XDwJWeM9cCRbcvA
lEn13k21EoRk40wcKcAa5fuc5lhSMrN+HY0kL8DHITNOrwVFlnwfwnX3oLcWCWkB
7pk/CKq4bVSEF91/Y9NUEewMA3sck2tF3EYalrWtyTvRSlMh/a0s7ja6mqrix8N+
ExdS/s/83R8K0w63b2Rd/pQSXfTlwwi7sgBeTIycNfYJQFwW2r1iF01sWk2LjL2z
kS00b/U1G2lN/FnaANiXelvHWw11pmk+S238DZg29+7XEx2kWt89lAcV31nvHurO
xCAhm8iokBOw6LCyBVB62hpG+R/HDLyBZ1o+Ca4NA8T4+pHW+YZ2Ix7mfabZpR4j
59QddefWqPS2pj5BlwzUl20XYxBXsuhgGK8KAHxyOKU+0+sYJkmgBOenqN2cVbr4
Lbzvv+PyyU25+BgxQJ6S9XSB5KfMlpmzDHzxPW2JO1lNUCk1gYRz/oRoKELyUmaz
driGB872EmHklF3mqnJAql3SVgFyRLQfDbltvye4Y4ggr0kHPso=
=f5Zw
-----END PGP SIGNATURE-----

--Apple-Mail=_70ED304C-8A2D-4293-BD73-AB8BE09EC4D0--
