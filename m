Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF45C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 11:11:32 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.11041.1643195490808779581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 03:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dABBdbq+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id a28so32214379lfl.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 03:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wQy92vVfJSTGZkNvuQcLWeCkITLUkjYyzY2LI7rX414=;
        b=dABBdbq+UucSJDNda23BoP/nYwSaJthyqmjl9/q93dZExe/sALDTsI/6fb2vuF2eIZ
         pOlDLX9bI3OX5+4AGD9p0yhGYi2MEqD9itAxlTwrwO44jUSK0kvkZn/rVRrJh7WhaoLb
         ClsjJPNZdGRKRbclIJfy4ovzkfSmSUWKTHReSGGjnxckhJu10Rc/MkTTADjn86yW1/TC
         fiiRLZ1ntNJjhGIZfqo8Tfdh7lwbcu0F5yJcXk+qjUmKLbt2AdV+5MSj2VTUKdc8JYoQ
         ej3TFmZryatClzqjQV7uRPDVlI4H6Tu0W+xVXUWJEMtvfVMpTQQtcotJwP+98WhbZTLB
         ujJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wQy92vVfJSTGZkNvuQcLWeCkITLUkjYyzY2LI7rX414=;
        b=ROfZzteiN6lo5i9jt+PR1dZ27/geNGedxPZn8Fc5ydVks6QqqMMxfEcwFYYDZMA4vr
         fieVb2IUGBlV0BZMPSFjjzHo2wGRy9qIszMG1ve9hS9OCfLdMJ9yneI+l3j8g8lM4TG6
         lrxSUg0vGXBLl/vTEU6aJq6tT4ujyS5TsRYIBAhE6OiDuuxc0pQj/QnRHWC6AIZeFqds
         PI15Ev+OUEPEfkfSSRr2rTKR2jcYibip7woMBQfitTY42lw8zc2LMpyi9Ysl8ejvFcQY
         JuhiadojtkKCe5yDV0G8R+BiA/BBFf+/H2QNDN360Lb/0sOkCZZpI3Z/1ty5c66gzSlj
         bvrA==
X-Gm-Message-State: AOAM5303Jh/iihWmLbkYGYs6Z/PIWvQu/tRoNO2Pvx7/CRg/rH7u1Rwg
	FhHWl1B83nSQXwdCOmXHEkeOM3bLnzzMLTfMbMY=
X-Google-Smtp-Source: 
 ABdhPJwoVYE1K+hHn+CXhf49V0jBL72A3qjZDevfAqVvkxvFM+q/UFwGQj+MmsfQNQ4inZLoVrZSE+V+2mEufYpGETM=
X-Received: by 2002:ac2:538b:: with SMTP id g11mr659801lfh.94.1643195488681;
 Wed, 26 Jan 2022 03:11:28 -0800 (PST)
MIME-Version: 1.0
References: <16CBCE984F8CE156.26997@lists.openembedded.org>
In-Reply-To: <16CBCE984F8CE156.26997@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Jan 2022 11:11:18 +0000
Message-ID: 
 <CANPvuR=xAYpZKOAVH9SRRzZsWcVZFgSgvN98ieA67VNPSn=2GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icecc.bbclass: replace deprecated bash command
 substitution
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006646aa05d67a43e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 11:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160981

--0000000000006646aa05d67a43e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 19/01/2022 =C3=A0=
(s)
23:07:

> - build some packages with icecc enabled is not supported
>   because of the folling that disables the icecc:
>
>   DEBUG: while parsing set_icecc_env, unable to handle non-literal comman=
d
> '$ICECC_CC'
>
> - it can be replicated with:
>
>  bitbake make && bitbake make -c cleansstate && bitbake make -DD
>  grep ICECC_CC tmp/log/cooker/qemux86-64/console-latest.log
>
> - bash command substitution backquote deprecated
>
>
> https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.h=
tml
>  https://mywiki.wooledge.org/BashFAQ/082
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 794e9930ad..3bbd2645af 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -309,7 +309,7 @@ wait_for_file() {
>      local TIMEOUT=3D$2
>      until [ -f "$FILE_TO_TEST" ]
>      do
> -        TIME_ELAPSED=3D`expr $TIME_ELAPSED + 1`
> +        TIME_ELAPSED=3D$(expr $TIME_ELAPSED + 1)
>          if [ $TIME_ELAPSED -gt $TIMEOUT ]
>          then
>              return 1
> @@ -362,8 +362,8 @@ set_icecc_env() {
>          return
>      fi
>
> -    ICE_VERSION=3D`$ICECC_CC -dumpversion`
> -    ICECC_VERSION=3D`echo ${ICECC_VERSION} | sed -e "s/@VERSION@
> /$ICE_VERSION/g"`
> +    ICE_VERSION=3D"$($ICECC_CC -dumpversion)"
> +    ICECC_VERSION=3D$(echo ${ICECC_VERSION} | sed -e "s/@VERSION@
> /$ICE_VERSION/g")
>      if [ ! -x "${ICECC_ENV_EXEC}" ]
>      then
>          bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
> @@ -390,18 +390,18 @@ set_icecc_env() {
>          chmod 775 $ICE_PATH/$compiler
>      done
>
> -    ICECC_AS=3D"`${ICECC_CC} -print-prog-name=3Das`"
> +    ICECC_AS=3D"$(${ICECC_CC} -print-prog-name=3Das)"
>      # for target recipes should return something like:
>      #
> /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueab=
i/gcc/arm-oe-linux-gnueabi/4.8.2/as
>      # and just "as" for native, if it returns "as" in current directory
> (for whatever reason) use "as" from PATH
> -    if [ "`dirname "${ICECC_AS}"`" =3D "." ]
> +    if [ "$(dirname "${ICECC_AS}")" =3D "." ]
>      then
>          ICECC_AS=3D"${ICECC_WHICH_AS}"
>      fi
>
>      if [ ! -f "${ICECC_VERSION}.done" ]
>      then
> -        mkdir -p "`dirname "${ICECC_VERSION}"`"
> +        mkdir -p "$(dirname "${ICECC_VERSION}")"
>
>          # the ICECC_VERSION generation step must be locked by a mutex
>          # in order to prevent race conditions
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160744):
> https://lists.openembedded.org/g/openembedded-core/message/160744
> Mute This Topic: https://lists.openembedded.org/mt/88547329/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006646aa05d67a43e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escr=
eveu no dia quarta, 19/01/2022 =C3=A0(s) 23:07:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">- build some packages with icecc enabled i=
s not supported<br>
=C2=A0 because of the folling that disables the icecc:<br>
<br>
=C2=A0 DEBUG: while parsing set_icecc_env, unable to handle non-literal com=
mand &#39;$ICECC_CC&#39;<br>
<br>
- it can be replicated with:<br>
<br>
=C2=A0bitbake make &amp;&amp; bitbake make -c cleansstate &amp;&amp; bitbak=
e make -DD<br>
=C2=A0grep ICECC_CC tmp/log/cooker/qemux86-64/console-latest.log<br>
<br>
- bash command substitution backquote deprecated<br>
<br>
=C2=A0<a href=3D"https://www.gnu.org/software/bash/manual/html_node/Command=
-Substitution.html" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.or=
g/software/bash/manual/html_node/Command-Substitution.html</a><br>
=C2=A0<a href=3D"https://mywiki.wooledge.org/BashFAQ/082" rel=3D"noreferrer=
" target=3D"_blank">https://mywiki.wooledge.org/BashFAQ/082</a><br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/icecc.bbclass | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<br>
index 794e9930ad..3bbd2645af 100644<br>
--- a/meta/classes/icecc.bbclass<br>
+++ b/meta/classes/icecc.bbclass<br>
@@ -309,7 +309,7 @@ wait_for_file() {<br>
=C2=A0 =C2=A0 =C2=A0local TIMEOUT=3D$2<br>
=C2=A0 =C2=A0 =C2=A0until [ -f &quot;$FILE_TO_TEST&quot; ]<br>
=C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIME_ELAPSED=3D`expr $TIME_ELAPSED + 1`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIME_ELAPSED=3D$(expr $TIME_ELAPSED + 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $TIME_ELAPSED -gt $TIMEOUT ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
@@ -362,8 +362,8 @@ set_icecc_env() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
-=C2=A0 =C2=A0 ICE_VERSION=3D`$ICECC_CC -dumpversion`<br>
-=C2=A0 =C2=A0 ICECC_VERSION=3D`echo ${ICECC_VERSION} | sed -e &quot;s/@VER=
SION@/$ICE_VERSION/g&quot;`<br>
+=C2=A0 =C2=A0 ICE_VERSION=3D&quot;$($ICECC_CC -dumpversion)&quot;<br>
+=C2=A0 =C2=A0 ICECC_VERSION=3D$(echo ${ICECC_VERSION} | sed -e &quot;s/@VE=
RSION@/$ICE_VERSION/g&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if [ ! -x &quot;${ICECC_ENV_EXEC}&quot; ]<br>
=C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: invalid IC=
ECC_ENV_EXEC&quot;<br>
@@ -390,18 +390,18 @@ set_icecc_env() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 775 $ICE_PATH/$compiler<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
-=C2=A0 =C2=A0 ICECC_AS=3D&quot;`${ICECC_CC} -print-prog-name=3Das`&quot;<b=
r>
+=C2=A0 =C2=A0 ICECC_AS=3D&quot;$(${ICECC_CC} -print-prog-name=3Das)&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0# for target recipes should return something like:<br>
=C2=A0 =C2=A0 =C2=A0# /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm9=
20tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as<br>
=C2=A0 =C2=A0 =C2=A0# and just &quot;as&quot; for native, if it returns &qu=
ot;as&quot; in current directory (for whatever reason) use &quot;as&quot; f=
rom PATH<br>
-=C2=A0 =C2=A0 if [ &quot;`dirname &quot;${ICECC_AS}&quot;`&quot; =3D &quot=
;.&quot; ]<br>
+=C2=A0 =C2=A0 if [ &quot;$(dirname &quot;${ICECC_AS}&quot;)&quot; =3D &quo=
t;.&quot; ]<br>
=C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ICECC_AS=3D&quot;${ICECC_WHICH_AS}&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0if [ ! -f &quot;${ICECC_VERSION}.done&quot; ]<br>
=C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;`dirname &quot;${ICECC_VERSION}=
&quot;`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;$(dirname &quot;${ICECC_VERSION=
}&quot;)&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the ICECC_VERSION generation step must =
be locked by a mutex<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# in order to prevent race conditions<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160744): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160744" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160744</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88547329/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88547329/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--0000000000006646aa05d67a43e1--

