Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C84AC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 11:23:16 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.11298.1699442588081413172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 03:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mx0p8HMP;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-45d9389fca5so2359110137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699442587; x=1700047387; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sCmtvUbM1vL65eH1vpa85uaD4MGZw1zglFrtoRSOaNc=;
        b=mx0p8HMPdEVk9uW/fMlDFbu0pPbL3aTFfmzijqATt876C/42nMlRDJRU/BigRfbxbp
         eja7F18uanqisCnY7ENskvp3/vH/TkzGLTZsGrKoszDjCngoI7MPDe2l/KKky5h1ZCar
         AszIRJaS8YCCXMZXg0w83a4WuKpGJzBajb+w8vHPa0JwGdV4BuYo4N3MRXYo2yXRqoKx
         sZeWnBOboyy62YC85ioPyAIL0XmssDiKHle1iBnVIiTocf3K9sg/rXGbIvNPPHh9PmxJ
         tPUNDCjhdJSbQvFik7YrP9v1HnbQKYXKsTiG1mg3mC14BIKxGC3UcvaRXYJqvknXRyqH
         +XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699442587; x=1700047387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCmtvUbM1vL65eH1vpa85uaD4MGZw1zglFrtoRSOaNc=;
        b=R9UdQa8x/sMtuRGuIBFsmOmtY5gpDz6+7bhRL+0eVkXwYEJpImlSVd1mkt/biY6lZe
         naoKcxn4tzHrWL1SveaEDb3D5918rwOpCYccSIFhX5BcsufSn6yNaj2BdOU7AN5lr5dS
         r2pRe7tPlsaTW77Y2fzU7LNDJZZru07isw6lmdq3ldDK4Jk+/uVPzJGZNEXHxpD/1tJj
         Qa8oH8l+Vd/m5ReENuBfuQLvlTL75RUsnUEtXCeL7bzanBNecfN8jtHfdINpYihZAkhF
         7ed+hZ+7xSwb+bhoc1iw3wXaJBx3tXQ8SZgHLgw4NEoDupxJdwEnY6iHPgB8WJnMs/Gt
         kYVg==
X-Gm-Message-State: AOJu0Yw3LAG8A846Oesh2xxOn7jw3HHik5mkeDZwRFD1gDdrMgS0NLZY
	k0fwiCaaQ4F4hnmowDTbfEiixAuQpWY/uh74XHQ=
X-Google-Smtp-Source: AGHT+IHyMf4jD/15llhbjqh4dzv81HIgDrFyQvztDTbw/T+DhC1ldGeEthdsxPvcLvqHhqr0iRUPJGDixTNNoC+EMJo=
X-Received: by 2002:a67:ef45:0:b0:45d:b3a9:84c5 with SMTP id
 k5-20020a67ef45000000b0045db3a984c5mr1264411vsr.34.1699442587030; Wed, 08 Nov
 2023 03:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20231108105644.2884585-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20231108105644.2884585-1-joakim.tjernlund@infinera.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 8 Nov 2023 11:22:56 +0000
Message-ID: <CANPvuRkdZ6fUwgQjA_u=kGBVjv-EQDJ+J0=nsV+voZhaA0RxQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [meta classes] sed -i destroys symlinks
To: Joakim.Tjernlund@infinera.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b75a6e0609a24fda"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 11:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190317

--000000000000b75a6e0609a24fda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joakim,

Joakim Tjernlund via lists.openembedded.org <Joakim.Tjernlund=3D
infinera.com@lists.openembedded.org> escreveu no dia quarta, 8/11/2023 =C3=
=A0(s)
10:56:

> If /etc/passwd is a symlink, sed -i on same file will replace the
> symlink with a new file. Prevent that by expanding the file with realpath
> before giving it to sed.
>

The sed follow-symlinks argument looks more appropriate for this imo.

--follow-symlinks
This option is available only on platforms that support symbolic links and
has an effect only if option -i is specified. In this case, if the file
that is specified on the command line is a symbolic link, sed will follow
the link and edit the ultimate destination of the link. The default
behavior is to break the symbolic link, so that the link destination will
not be modified.

https://www.gnu.org/software/sed/manual/html_node/Command_002dLine-Options.=
html

Jose


> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>
>  - I have patches which moves shadow/passwd files to an subdir in order t=
o
>    have passwd mgmt on a RO RFS. Is there a interest to have that oprion
> in OE?
>
>  meta/classes/rootfs-postcommands.bbclass | 4 ++--
>  meta/classes/useradd_base.bbclass        | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index 5c0b3ec37c..55cc863dbf 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -148,10 +148,10 @@ read_only_rootfs_hook () {
>  #
>  zap_empty_root_password () {
>         if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
> -               sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
> +               sed -i 's%^root::%root:*:%' $(realpath
> ${IMAGE_ROOTFS}/etc/shadow)
>          fi
>         if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
> -               sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
> +               sed -i 's%^root::%root:*:%' $(realpath
> ${IMAGE_ROOTFS}/etc/passwd)
>         fi
>  }
>
> diff --git a/meta/classes/useradd_base.bbclass
> b/meta/classes/useradd_base.bbclass
> index 7f5b9b7219..72732a4d57 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -154,7 +154,7 @@ perform_passwd_expire () {
>         local username=3D`echo "$opts" | awk '{ print $NF }'`
>         local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd ||
> true`"
>         if test "x$user_exists" !=3D "x"; then
> -               eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i
> \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || tr=
ue
> +               eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i
> \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $(realpath
> $rootdir/etc/shadow) \" || true
>                 local passwd_lastchanged=3D"`grep "^$username:"
> $rootdir/etc/shadow | cut -d: -f3`"
>                 if test "x$passwd_lastchanged" !=3D "x0"; then
>                         bbfatal "${PN}: passwd --expire operation did not
> succeed."
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190315):
> https://lists.openembedded.org/g/openembedded-core/message/190315
> Mute This Topic: https://lists.openembedded.org/mt/102461303/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b75a6e0609a24fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joakim,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Joakim Tjernlund via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;Joakim.Tjernlund=3D<a hr=
ef=3D"mailto:infinera.com@lists.openembedded.org">infinera.com@lists.openem=
bedded.org</a>&gt; escreveu no dia quarta, 8/11/2023 =C3=A0(s) 10:56:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">If /etc/passwd is a s=
ymlink, sed -i on same file will replace the<br>
symlink with a new file. Prevent that by expanding the file with realpath<b=
r>
before giving it to sed.<br></blockquote><div><br></div><div>The sed follow=
-symlinks argument looks more appropriate=C2=A0for this imo.<br><br>--follo=
w-symlinks<br>This option is available only on platforms that support symbo=
lic links and has an effect only if option -i is specified. In this case, i=
f the file that is specified on the command line is a symbolic link, sed wi=
ll follow the link and edit the ultimate destination of the link. The defau=
lt behavior is to break the symbolic link, so that the link destination wil=
l not be modified.<br><br><a href=3D"https://www.gnu.org/software/sed/manua=
l/html_node/Command_002dLine-Options.html">https://www.gnu.org/software/sed=
/manual/html_node/Command_002dLine-Options.html</a><br><br>Jose</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Joakim Tjernlund &lt;<a href=3D"mailto:joakim.tjernlund@infi=
nera.com" target=3D"_blank">joakim.tjernlund@infinera.com</a>&gt;<br>
---<br>
<br>
=C2=A0- I have patches which moves shadow/passwd files to an subdir in orde=
r to<br>
=C2=A0 =C2=A0have passwd mgmt on a RO RFS. Is there a interest to have that=
 oprion in OE?<br>
<br>
=C2=A0meta/classes/rootfs-postcommands.bbclass | 4 ++--<br>
=C2=A0meta/classes/useradd_base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass<br>
index 5c0b3ec37c..55cc863dbf 100644<br>
--- a/meta/classes/rootfs-postcommands.bbclass<br>
+++ b/meta/classes/rootfs-postcommands.bbclass<br>
@@ -148,10 +148,10 @@ read_only_rootfs_hook () {<br>
=C2=A0#<br>
=C2=A0zap_empty_root_password () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; ${IMAGE_ROOTFS}/etc/shadow<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; $(realpath ${IMAGE_ROOTFS}/etc/shadow)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; ${IMAGE_ROOTFS}/etc/passwd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; $(realpath ${IMAGE_ROOTFS}/etc/passwd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass<br>
index 7f5b9b7219..72732a4d57 100644<br>
--- a/meta/classes/useradd_base.bbclass<br>
+++ b/meta/classes/useradd_base.bbclass<br>
@@ -154,7 +154,7 @@ perform_passwd_expire () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local username=3D`echo &quot;$opts&quot; | awk =
&#39;{ print $NF }&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local user_exists=3D&quot;`grep &quot;^$usernam=
e:&quot; $rootdir/etc/passwd || true`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$user_exists&quot; !=3D &quot;x&=
quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval flock -x $root=
dir${sysconfdir} -c \&quot;$PSEUDO sed -i \&#39;&#39;s/^\(&#39;$username&#3=
9;:[^:]*\):[^:]*:/\1:0:/&#39;\&#39; $rootdir/etc/shadow \&quot; || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval flock -x $root=
dir${sysconfdir} -c \&quot;$PSEUDO sed -i \&#39;&#39;s/^\(&#39;$username&#3=
9;:[^:]*\):[^:]*:/\1:0:/&#39;\&#39; $(realpath $rootdir/etc/shadow) \&quot;=
 || true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local passwd_lastch=
anged=3D&quot;`grep &quot;^$username:&quot; $rootdir/etc/shadow | cut -d: -=
f3`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$pas=
swd_lastchanged&quot; !=3D &quot;x0&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbfatal &quot;${PN}: passwd --expire operation did not succeed.&=
quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190315): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190315" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190315</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102461303/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102461303/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000b75a6e0609a24fda--

