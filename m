Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.4621.1595654058597497640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 22:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQWiZUh7;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id h7so10661449qkk.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hk0i3K7EF2IQAsSo76yHHDiFzHn98Nl9risQhvJE7VY=;
        b=eQWiZUh71xNPmuqPv1nQVx8lTRLG1OZhLpkKqnUEaes9rccj4AaqlM24w9R8q21u2G
         WmCiFUedttJMe2gkYX8Y0cLPX27k/+ndehjnoXETwcXyaX9GzH3g4oAitMMyclzQ+W2g
         5e0KLyw7eE9fKQq48nKwjqcpMOybEnXXrddm/j+v9oEbP84DEsX7cxymxLOGJFbIOnbH
         1LowiayN3HLnzvwSCoYQw/8xb+9HDHsGYftYd0lQmKJ6XIQN8VGBIGfOH1PAZNmhRoCW
         eS6kSmyihwES8GMHr3+38UgAfdkM+74ZBxPuUXpyavuKqIHYIcM5A+tZCf3ZTtB3h/MO
         tG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hk0i3K7EF2IQAsSo76yHHDiFzHn98Nl9risQhvJE7VY=;
        b=Y5m3zfjctrT+uWscBE91PQaRj8Iaxs1dH0wjj9L/OoU8rhxTHqfNIT8xDCG3KVkYj9
         x4JiF84d3puehbs4FBDS5ieWamy7wBl7bazw0rEWlkxW77dz6IMC5MMrA87n0sjutJbW
         wbfe2YZF68YPhdZhaoSybZGoGLd/DR7ylanB7Jo8392HzrxLt0rTPVTPfjRHzBSl+FKz
         So5fjumWiB1GLa2DtJrTEJH+nqrTl+1KafffJhZCFDXXCbZWGNx/nI+yEL9rr0XISWZ3
         LxiQOzyGnOoS9f5kB9OTkaUWSwoCCSFa8uHrohYVyFGoPBm9Vv0Ci1EK63Ewz8e23S/u
         ILPA==
X-Gm-Message-State: AOAM5309zgkbj4DUdHeES3ZfbAr+qi2fC0I3SdszXBeR2RHx3rtdL+n7
	V75YHOBNdKT5Aiv3goZRrhxKkaH7Zt+LJr+IEwCdUMyw
X-Google-Smtp-Source: ABdhPJz7hoYZ/kpkRBAUX+WQHNi0vRPxQkdq0L4E5LrsmvxQYY5ZwDL4P9mGVf3fbD1uUcwCFRxl7t7WAWoD5oX8hFY=
X-Received: by 2002:a37:8d85:: with SMTP id p127mr13848938qkd.225.1595654057548;
 Fri, 24 Jul 2020 22:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200724171205.9871-1-andrei@gherzan.ro>
In-Reply-To: <20200724171205.9871-1-andrei@gherzan.ro>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 24 Jul 2020 22:14:06 -0700
Message-ID: <CAMKF1sohCE3ez-r8xssCvsmTk_2WHGe+UiX_uqzrD28z7r4+uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] initscripts: Fix various shellcheck warnings in populate-volatile.sh
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000048dfab05ab3d2903"

--00000000000048dfab05ab3d2903
Content-Type: text/plain; charset="UTF-8"

What all shells has it been tested for ?

On Fri, Jul 24, 2020 at 10:12 AM Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../initscripts-1.0/populate-volatile.sh      | 58 +++++++++----------
>  1 file changed, 29 insertions(+), 29 deletions(-)
>
> diff --git
> a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 1c525b71bd..3a265329f0 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -9,10 +9,10 @@
>  ### END INIT INFO
>
>  # Get ROOT_DIR
> -DIRNAME=`dirname $0`
> -ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
> +DIRNAME="$(dirname "$0")"
> +ROOT_DIR="$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')"
>
> -[ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
> +[ -e "${ROOT_DIR}/etc/default/rcS" ] && . "${ROOT_DIR}/etc/default/rcS"
>  # When running populate-volatile.sh at rootfs time, disable cache.
>  [ -n "$ROOT_DIR" ] && VOLATILE_ENABLE_CACHE=no
>  # If rootfs is read-only, disable cache.
> @@ -46,13 +46,13 @@ create_file() {
>                 [ "${VERBOSE}" != "no" ] && echo "Target already exists.
> Skipping."
>         } || {
>                 if [ -z "$ROOT_DIR" ]; then
> -                       eval $EXEC
> +                       eval "$EXEC"
>                 else
>                         # Creating some files at rootfs time may fail and
> should fail,
>                         # but these failures should not be logged to make
> sure the do_rootfs
>                         # process doesn't fail. This does no harm, as this
> script will
>                         # run on target to set up the correct files and
> directories.
> -                       eval $EXEC > /dev/null 2>&1
> +                       eval "$EXEC" > /dev/null 2>&1
>                 fi
>         }
>  }
> @@ -68,11 +68,11 @@ mk_dir() {
>                 [ "${VERBOSE}" != "no" ] && echo "Target already exists.
> Skipping."
>         } || {
>                 if [ -z "$ROOT_DIR" ]; then
> -                       eval $EXEC
> +                       eval "$EXEC"
>                 else
>                         # For the same reason with create_file(), failures
> should
>                         # not be logged.
> -                       eval $EXEC > /dev/null 2>&1
> +                       eval "$EXEC" > /dev/null 2>&1
>                 fi
>         }
>  }
> @@ -96,11 +96,11 @@ link_file() {
>         test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >>
> /etc/volatile.cache.build
>
>         if [ -z "$ROOT_DIR" ]; then
> -               eval $EXEC
> +               eval "$EXEC"
>         else
>                 # For the same reason with create_file(), failures should
>                 # not be logged.
> -               eval $EXEC > /dev/null 2>&1
> +               eval "$EXEC" > /dev/null 2>&1
>         fi
>  }
>
> @@ -117,11 +117,11 @@ check_requirements() {
>         TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
>         TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
>
> -       sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/passwd | sort | uniq >
> "${TMP_DEFINED}"
> -       cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 2 >
> "${TMP_INTERMED}"
> +       sed 's@\(^:\)*:.*@\1@' "${ROOT_DIR}/etc/passwd" | sort | uniq >
> "${TMP_DEFINED}"
> +       grep -v "^#" "${CFGFILE}" | cut -s -d " " -f 2 > "${TMP_INTERMED}"
>         cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq >
> "${TMP_COMBINED}"
> -       NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
> -       NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
> +       NR_DEFINED_USERS="$(wc -l < "${TMP_DEFINED}")"
> +       NR_COMBINED_USERS="$(wc -l < "${TMP_COMBINED}")"
>
>         [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
>                 echo "Undefined users:"
> @@ -131,12 +131,12 @@ check_requirements() {
>         }
>
>
> -       sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/group | sort | uniq >
> "${TMP_DEFINED}"
> -       cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 3 >
> "${TMP_INTERMED}"
> +       sed 's@\(^:\)*:.*@\1@' "${ROOT_DIR}/etc/group" | sort | uniq >
> "${TMP_DEFINED}"
> +       grep -v "^#" "${CFGFILE}" | cut -s -d " " -f 3 > "${TMP_INTERMED}"
>         cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq >
> "${TMP_COMBINED}"
>
> -       NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
> -       NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
> +       NR_DEFINED_GROUPS="$(wc -l < "${TMP_DEFINED}")"
> +       NR_COMBINED_GROUPS="$(wc -l < "${TMP_COMBINED}")"
>
>         [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
>                 echo "Undefined groups:"
> @@ -157,13 +157,13 @@ apply_cfgfile() {
>
>         [ "${VERBOSE}" != "no" ] && echo "Applying ${CFGFILE}"
>
> -       [ "${SKIP_REQUIREMENTS}" == "yes" ] || check_requirements
> "${CFGFILE}" || {
> +       [ "${SKIP_REQUIREMENTS}" = "yes" ] || check_requirements
> "${CFGFILE}" || {
>                 echo "Skipping ${CFGFILE}"
>                 return 1
>         }
>
> -       cat ${CFGFILE} | sed 's/#.*//' | \
> -       while read TTYPE TUSER TGROUP TMODE TNAME TLTARGET; do
> +       sed 's/#.*//' "${CFGFILE}" | \
> +       while read -r TTYPE TUSER TGROUP TMODE TNAME TLTARGET; do
>                 test -z "${TLTARGET}" && continue
>                 TNAME=${ROOT_DIR}${TNAME}
>                 [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
> @@ -187,9 +187,9 @@ apply_cfgfile() {
>
>                 [ -L "${TNAME}" ] && {
>                         [ "${VERBOSE}" != "no" ] && echo "Found link."
> -                       NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*->
> \(.*\)$/\1/'`
> -                       echo ${NEWNAME} | grep -v "^/" >/dev/null && {
> -                               TNAME="`echo ${TNAME} | sed -e 's@
> \(.*\)/.*@\1@'`/${NEWNAME}"
> +                       NEWNAME=$(ls -l "${TNAME}" | sed -e 's/^.*->
> \(.*\)$/\1/')
> +                       echo "${NEWNAME}" | grep -v "^/" >/dev/null && {
> +                               TNAME="$(echo "${TNAME}" | sed -e 's@
> \(.*\)/.*@\1@')/${NEWNAME}"
>                                 [ "${VERBOSE}" != "no" ] && echo
> "Converted relative linktarget to absolute path -${TNAME}-."
>                         } || {
>                                 TNAME="${NEWNAME}"
> @@ -217,7 +217,7 @@ apply_cfgfile() {
>
>  clearcache=0
>  exec 9</proc/cmdline
> -while read line <&9
> +while read -r line <&9
>  do
>         case "$line" in
>                 *clearcache*)  clearcache=1
> @@ -228,11 +228,11 @@ do
>  done
>  exec 9>&-
>
> -if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" =
> "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
> +if test -e "${ROOT_DIR}/etc/volatile.cache" -a "$VOLATILE_ENABLE_CACHE" =
> "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
>  then
> -       sh ${ROOT_DIR}/etc/volatile.cache
> +       sh "${ROOT_DIR}/etc/volatile.cache"
>  else
> -       rm -f ${ROOT_DIR}/etc/volatile.cache
> ${ROOT_DIR}/etc/volatile.cache.build
> +       rm -f "${ROOT_DIR}/etc/volatile.cache"
> "${ROOT_DIR}/etc/volatile.cache.build"
>
>         # Apply the core file with out checking requirements. ${TMPROOT} is
>         # needed by check_requirements but is setup by this file, so it
> must be
> @@ -246,7 +246,7 @@ else
>         TMP_FILE="${TMPROOT}/tmp_volatile.$$"
>         rm -f "$TMP_FILE"
>
> -       CFGFILES="`ls -1 "${CFGDIR}" | grep -v "^${COREDEF}\$" | sort`"
> +       CFGFILES="$(ls -1 "${CFGDIR}" | grep -v "^${COREDEF}\$" | sort)"
>         for file in ${CFGFILES}; do
>                 cat "${CFGDIR}/${file}" >> "$TMP_FILE"
>         done
> @@ -264,7 +264,7 @@ else
>         fi
>         rm "$TMP_FILE"
>
> -       [ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv
> ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
> +       [ -e "${ROOT_DIR}/etc/volatile.cache.build" ] && sync && mv
> "${ROOT_DIR}/etc/volatile.cache.build" "${ROOT_DIR}/etc/volatile.cache"
>  fi
>
>  if [ -z "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f
> /var/run/ld.so.cache ]
> --
> 2.17.1
>
> 
>

--00000000000048dfab05ab3d2903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">What all shells has it been tested for ?</div></div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jul 24, 2020 at 10:12 AM Andrei Gherzan &lt;<a href=3D"mailto:andrei=
@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Sig=
ned-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
---<br>
=C2=A0.../initscripts-1.0/populate-volatile.sh=C2=A0 =C2=A0 =C2=A0 | 58 ++=
+++++++----------<br>
=C2=A01 file changed, 29 insertions(+), 29 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volati=
le.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<=
br>
index 1c525b71bd..3a265329f0 100755<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<b=
r>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<b=
r>
@@ -9,10 +9,10 @@<br>
=C2=A0### END INIT INFO<br>
<br>
=C2=A0# Get ROOT_DIR<br>
-DIRNAME=3D`dirname $0`<br>
-ROOT_DIR=3D`echo $DIRNAME | sed -ne &#39;s:/etc/.*::p&#39;`<br>
+DIRNAME=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
+ROOT_DIR=3D&quot;$(echo &quot;$DIRNAME&quot; | sed -ne &#39;s:/etc/.*::p&=
#39;)&quot;<br>
<br>
-[ -e ${ROOT_DIR}/etc/default/rcS ] &amp;&amp; . ${ROOT_DIR}/etc/default/r=
cS<br>
+[ -e &quot;${ROOT_DIR}/etc/default/rcS&quot; ] &amp;&amp; . &quot;${ROOT_=
DIR}/etc/default/rcS&quot;<br>
=C2=A0# When running populate-volatile.sh at rootfs time, disable cache.<b=
r>
=C2=A0[ -n &quot;$ROOT_DIR&quot; ] &amp;&amp; VOLATILE_ENABLE_CACHE=3Dno<b=
r>
=C2=A0# If rootfs is read-only, disable cache.<br>
@@ -46,13 +46,13 @@ create_file() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${VERBOSE}=
&quot; !=3D &quot;no&quot; ] &amp;&amp; echo &quot;Target already exists. S=
kipping.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } || {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$ROO=
T_DIR&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval $EXEC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval &quot;$EXEC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Creating some files at rootfs time may fail and should fail,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # but these failures should not be logged to make sure the do_r=
ootfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # process doesn&#39;t fail. This does no harm, as this script w=
ill<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # run on target to set up the correct files and directories.<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval $EXEC &gt; /dev/null 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval &quot;$EXEC&quot; &gt; /dev/null 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -68,11 +68,11 @@ mk_dir() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${VERBOSE}=
&quot; !=3D &quot;no&quot; ] &amp;&amp; echo &quot;Target already exists. S=
kipping.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } || {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$ROO=
T_DIR&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval $EXEC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval &quot;$EXEC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # For the same reason with create_file(), failures should<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # not be logged.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval $EXEC &gt; /dev/null 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval &quot;$EXEC&quot; &gt; /dev/null 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -96,11 +96,11 @@ link_file() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;$VOLATILE_ENABLE_CACHE&quot; =3D ye=
s &amp;&amp; echo &quot;=C2=A0 =C2=A0$EXEC&quot; &gt;&gt; /etc/volatile.cac=
he.build<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$ROOT_DIR&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval $EXEC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;$EXEC&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # For the same rea=
son with create_file(), failures should<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # not be logged.<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval $EXEC &gt; /d=
ev/null 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;$EXEC&q=
uot; &gt; /dev/null 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
@@ -117,11 +117,11 @@ check_requirements() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TMP_DEFINED=3D&quot;${TMPROOT}/tmpdefined.$$&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TMP_COMBINED=3D&quot;${TMPROOT}/tmpcombined.$$=
&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s@\(^:\)*:.*@\1@&#39; ${ROOT_DIR}/etc=
/passwd | sort | uniq &gt; &quot;${TMP_DEFINED}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${CFGFILE} | grep -v &quot;^#&quot; | cut =
-s -d &quot; &quot; -f 2 &gt; &quot;${TMP_INTERMED}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s@\(^:\)*:.*@\1@&#39; &quot;${ROOT_DI=
R}/etc/passwd&quot; | sort | uniq &gt; &quot;${TMP_DEFINED}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0grep -v &quot;^#&quot; &quot;${CFGFILE}&quot; =
| cut -s -d &quot; &quot; -f 2 &gt; &quot;${TMP_INTERMED}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &quot;${TMP_DEFINED}&quot; &quot;${TMP_INT=
ERMED}&quot; | sort | uniq &gt; &quot;${TMP_COMBINED}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_DEFINED_USERS=3D&quot;`cat &quot;${TMP_DEFI=
NED}&quot; | wc -l`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_COMBINED_USERS=3D&quot;`cat &quot;${TMP_COM=
BINED}&quot; | wc -l`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_DEFINED_USERS=3D&quot;$(wc -l &lt; &quot;${=
TMP_DEFINED}&quot;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_COMBINED_USERS=3D&quot;$(wc -l &lt; &quot;$=
{TMP_COMBINED}&quot;)&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${NR_DEFINED_USERS}&quot; -ne &quot;${=
NR_COMBINED_USERS}&quot; ] &amp;&amp; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Undefin=
ed users:&quot;<br>
@@ -131,12 +131,12 @@ check_requirements() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s@\(^:\)*:.*@\1@&#39; ${ROOT_DIR}/etc=
/group | sort | uniq &gt; &quot;${TMP_DEFINED}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${CFGFILE} | grep -v &quot;^#&quot; | cut =
-s -d &quot; &quot; -f 3 &gt; &quot;${TMP_INTERMED}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s@\(^:\)*:.*@\1@&#39; &quot;${ROOT_DI=
R}/etc/group&quot; | sort | uniq &gt; &quot;${TMP_DEFINED}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0grep -v &quot;^#&quot; &quot;${CFGFILE}&quot; =
| cut -s -d &quot; &quot; -f 3 &gt; &quot;${TMP_INTERMED}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &quot;${TMP_DEFINED}&quot; &quot;${TMP_INT=
ERMED}&quot; | sort | uniq &gt; &quot;${TMP_COMBINED}&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_DEFINED_GROUPS=3D&quot;`cat &quot;${TMP_DEF=
INED}&quot; | wc -l`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_COMBINED_GROUPS=3D&quot;`cat &quot;${TMP_CO=
MBINED}&quot; | wc -l`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_DEFINED_GROUPS=3D&quot;$(wc -l &lt; &quot;$=
{TMP_DEFINED}&quot;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NR_COMBINED_GROUPS=3D&quot;$(wc -l &lt; &quot;=
${TMP_COMBINED}&quot;)&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${NR_DEFINED_GROUPS}&quot; -ne &quot;$=
{NR_COMBINED_GROUPS}&quot; ] &amp;&amp; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Undefin=
ed groups:&quot;<br>
@@ -157,13 +157,13 @@ apply_cfgfile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ]=
 &amp;&amp; echo &quot;Applying ${CFGFILE}&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${SKIP_REQUIREMENTS}&quot; =3D=3D &quo=
t;yes&quot; ] || check_requirements &quot;${CFGFILE}&quot; || {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${SKIP_REQUIREMENTS}&quot; =3D &quot;y=
es&quot; ] || check_requirements &quot;${CFGFILE}&quot; || {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Skippin=
g ${CFGFILE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${CFGFILE} | sed &#39;s/#.*//&#39; | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while read TTYPE TUSER TGROUP TMODE TNAME TLTA=
RGET; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/#.*//&#39; &quot;${CFGFILE}&quot; |=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while read -r TTYPE TUSER TGROUP TMODE TNAME T=
LTARGET; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -z &quot;${TL=
TARGET}&quot; &amp;&amp; continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TNAME=3D${ROOT_DIR=
}${TNAME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${VERBOSE}=
&quot; !=3D &quot;no&quot; ] &amp;&amp; echo &quot;Checking for -${TNAME}-.=
&quot;<br>
@@ -187,9 +187,9 @@ apply_cfgfile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -L &quot;${TNAME=
}&quot; ] &amp;&amp; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ] &amp;&amp; echo =
&quot;Found link.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0NEWNAME=3D`ls -l &quot;${TNAME}&quot; | sed -e &#39;s/^.*-&gt; \=
(.*\)$/\1/&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0echo ${NEWNAME} | grep -v &quot;^/&quot; &gt;/dev/null &amp;&amp=
; {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TNAME=3D&quot;`echo ${TNAME} | sed -=
e &#39;s@\(.*\)/.*@\1@&#39;`/${NEWNAME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0NEWNAME=3D$(ls -l &quot;${TNAME}&quot; | sed -e &#39;s/^.*-&gt; =
\(.*\)$/\1/&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0echo &quot;${NEWNAME}&quot; | grep -v &quot;^/&quot; &gt;/dev/nu=
ll &amp;&amp; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TNAME=3D&quot;$(echo &quot;${TNAME}&=
quot; | sed -e &#39;s@\(.*\)/.*@\1@&#39;)/${NEWNAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${VERBOSE}&quot; !=3D &quot=
;no&quot; ] &amp;&amp; echo &quot;Converted relative linktarget to absolute=
 path -${TNAME}-.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } || {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TNAME=3D&quot;${NEWNAME}&quot;<br>
@@ -217,7 +217,7 @@ apply_cfgfile() {<br>
<br>
=C2=A0clearcache=3D0<br>
=C2=A0exec 9&lt;/proc/cmdline<br>
-while read line &lt;&amp;9<br>
+while read -r line &lt;&amp;9<br>
=C2=A0do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$line&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clearcache*)=C2=
=A0 clearcache=3D1<br>
@@ -228,11 +228,11 @@ do<br>
=C2=A0done<br>
=C2=A0exec 9&gt;&amp;-<br>
<br>
-if test -e ${ROOT_DIR}/etc/volatile.cache -a &quot;$VOLATILE_ENABLE_CACHE=
&quot; =3D &quot;yes&quot; -a &quot;x$1&quot; !=3D &quot;xupdate&quot; -a &=
quot;x$clearcache&quot; =3D &quot;x0&quot;<br>
+if test -e &quot;${ROOT_DIR}/etc/volatile.cache&quot; -a &quot;$VOLATILE_=
ENABLE_CACHE&quot; =3D &quot;yes&quot; -a &quot;x$1&quot; !=3D &quot;xupdat=
e&quot; -a &quot;x$clearcache&quot; =3D &quot;x0&quot;<br>
=C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sh ${ROOT_DIR}/etc/volatile.cache<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sh &quot;${ROOT_DIR}/etc/volatile.cache&quot;<=
br>
=C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${ROOT_DIR}/etc/volatile.cache ${ROOT_DI=
R}/etc/volatile.cache.build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${ROOT_DIR}/etc/volatile.cache&quo=
t; &quot;${ROOT_DIR}/etc/volatile.cache.build&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Apply the core file with out checking requir=
ements. ${TMPROOT} is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # needed by check_requirements but is setup by=
 this file, so it must be<br>
@@ -246,7 +246,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TMP_FILE=3D&quot;${TMPROOT}/tmp_volatile.$$&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;$TMP_FILE&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFGFILES=3D&quot;`ls -1 &quot;${CFGDIR}&quot; =
| grep -v &quot;^${COREDEF}\$&quot; | sort`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFGFILES=3D&quot;$(ls -1 &quot;${CFGDIR}&quot;=
 | grep -v &quot;^${COREDEF}\$&quot; | sort)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in ${CFGFILES}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &quot;${CFGDIR=
}/${file}&quot; &gt;&gt; &quot;$TMP_FILE&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
@@ -264,7 +264,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm &quot;$TMP_FILE&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e ${ROOT_DIR}/etc/volatile.cache.build ] &a=
mp;&amp; sync &amp;&amp; mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR=
}/etc/volatile.cache<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e &quot;${ROOT_DIR}/etc/volatile.cache.buil=
d&quot; ] &amp;&amp; sync &amp;&amp; mv &quot;${ROOT_DIR}/etc/volatile.cach=
e.build&quot; &quot;${ROOT_DIR}/etc/volatile.cache&quot;<br>
=C2=A0fi<br>
<br>
=C2=A0if [ -z &quot;${ROOT_DIR}&quot; ] &amp;&amp; [ -f /etc/ld.so.cache ]=
 &amp;&amp; [ ! -f /var/run/ld.so.cache ]<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000048dfab05ab3d2903--
