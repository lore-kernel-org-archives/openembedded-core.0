Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.36519.1629188411040148750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 01:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IUtTGtpB;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id 75so8685909uav.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eiVR4Z6wbFKKMolA/JgMLTpJLnaZfbUKJnJmYjDIuu4=;
        b=IUtTGtpBwxblvlN8fdCNJt/818io9at0p/VNT8deGDVTAPoZxz/SVJ6jl6l0Aj2SG2
         Y5OjITJ1HWsQBs7MTsnhGzMev/bj9T2H4O7aEfM3uLxO7uq2IqC6fzU1vmUDe7FBt0M7
         R8BDKkEwy9dD6b26sQY9LGkKWsfxdqcvpo7sMKohNG/1Zu371v7WL19mKtMGU7bH0XDc
         oBBv4k0v0GTiD+32WYjncgxWc0HArEzl5//PSHcYr4jNbyaWiWrCezqQog+SQqGZjNw6
         XVq5sIzeuyQ0uEmNIPbD0azYMt4OXb1JLKBrVqqRxVZo6xAo03eX0uz/AtB3BqrhhOD6
         Kmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eiVR4Z6wbFKKMolA/JgMLTpJLnaZfbUKJnJmYjDIuu4=;
        b=ON1/F/9pjfb7/CuzpxGoIS36VnAsBolBuG8Z4xHiVhHnugNES5bzIrqGWO1c+ZGDWo
         eljucHXJcqZeRno43VLpo77ALA3NIHzfq5yxQ2APWl7cOV6dhS0DFtrrdv05tIX2SYMS
         MXDMc2TWeXHnsEhKJY+X4BRllAMtokjVz/gvVE07kt3Y3ZGCwyObA5WChLD2+Zbhf1Lp
         CvH4p/7gfckuHdHLLEPi/sI6EJ8Z642bY32bJKRhA/rHcLs0M48gAUW7VDhRMvAOKlvL
         2206ao9On3rhQ7DFRv17Jp61xqMmRoJg3jAOzhYgzPWYcGb0N7maxP9dU/vAan2SxWOB
         vSAA==
X-Gm-Message-State: AOAM5314MKPqafnFWbzrVjfLFJnOz9MUfFNCnZ/a8ykOP8Xa0TKbQTXw
	OWDSd6ORgjH5l6zuDUSQQAm/r46XpWbHfXd7Zp2GWsKl
X-Google-Smtp-Source: ABdhPJycm8mPhgOmByApwRjnvZm8bLk0/gRCYddT5bnBDuJ4OUIGjpM7WlPh7CajRtYO+jcr255SYdTzT3vQ+1szz7A=
X-Received: by 2002:ab0:b91:: with SMTP id c17mr1194503uak.71.1629188409607;
 Tue, 17 Aug 2021 01:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210817081717.41280-1-yi.zhao@windriver.com>
In-Reply-To: <20210817081717.41280-1-yi.zhao@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Aug 2021 10:19:58 +0200
Message-ID: <CANNYZj8j+wWJPwDTCQoikf=G_pCR=hCUdNFV2k9KOR2jHgb-nQ@mail.gmail.com>
Subject: Re: [PATCH V2] shadow: add /etc/default/useradd
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d48ee05c9bcfcbf"

--0000000000006d48ee05c9bcfcbf
Content-Type: text/plain; charset="UTF-8"

Thanks, this should work fine :)

Alex

On Tue, 17 Aug 2021 at 10:17, Yi Zhao <yi.zhao@windriver.com> wrote:

> The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
> settings by default. Some settings are not consistent with previous
> shadow 4.8.1 in oe-core. e.g. The default shell is /bin/bash rather than
> /bin/sh. Per shadow 4.8.1 settings, add /etc/default/useradd back to
> update useradd settings.
>
> [1]
> https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-extended/shadow/files/useradd | 8 ++++++++
>  meta/recipes-extended/shadow/shadow.inc    | 3 +++
>  2 files changed, 11 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/useradd
>
> diff --git a/meta/recipes-extended/shadow/files/useradd
> b/meta/recipes-extended/shadow/files/useradd
> new file mode 100644
> index 0000000000..782aeef418
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/useradd
> @@ -0,0 +1,8 @@
> +# useradd defaults file
> +GROUP=100
> +HOME=/home
> +INACTIVE=-1
> +EXPIRE=
> +SHELL=/bin/sh
> +SKEL=/etc/skel
> +CREATE_MAIL_SPOOL=no
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 97ffae978a..44b9898897 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI = "
> https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
>             file://shadow-relaxed-usernames.patch \
>
> file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
>             file://0001-libsubid-link-to-PAM-libraries.patch \
> +           file://useradd \
>             "
>
>  SRC_URI:append:class-target = " \
> @@ -115,6 +116,8 @@ do_install() {
>         # Use proper encryption for passwords
>         sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/'
> ${D}${sysconfdir}/login.defs
>
> +       install -d ${D}${sysconfdir}/default
> +       install -m 0644 ${WORKDIR}/useradd ${D}${sysconfdir}/default
>  }
>
>  do_install:append() {
> --
> 2.25.1
>
>

--0000000000006d48ee05c9bcfcbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this should work fine :)</div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, 17 Aug 2021 at 10:17, Yi Zhao &lt;<a href=3D"mai=
lto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The shadow 4.9 stops shipin=
g /etc/default/useradd[1] and uses built-in<br>
settings by default. Some settings are not consistent with previous<br>
shadow 4.8.1 in oe-core. e.g. The default shell is /bin/bash rather than<br=
>
/bin/sh. Per shadow 4.8.1 settings, add /etc/default/useradd back to<br>
update useradd settings.<br>
<br>
[1] <a href=3D"https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1=
826eb41f6629669ef0b647267b" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267=
b</a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/shadow/files/useradd | 8 ++++++++<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 | 3 +++<br>
=C2=A02 files changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/shadow/files/useradd<br>
<br>
diff --git a/meta/recipes-extended/shadow/files/useradd b/meta/recipes-exte=
nded/shadow/files/useradd<br>
new file mode 100644<br>
index 0000000000..782aeef418<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/shadow/files/useradd<br>
@@ -0,0 +1,8 @@<br>
+# useradd defaults file<br>
+GROUP=3D100<br>
+HOME=3D/home<br>
+INACTIVE=3D-1<br>
+EXPIRE=3D<br>
+SHELL=3D/bin/sh<br>
+SKEL=3D/etc/skel<br>
+CREATE_MAIL_SPOOL=3Dno<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index 97ffae978a..44b9898897 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/shadow-ma=
int/shadow/releases/download/v$%7BPV%7D/$%7BBP%7D" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/shadow-maint/shadow/releases/download/v${PV=
}/${BP}</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://shadow-relaxed-usernames.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-out-of-tree-build=
s-with-respect-to-libsubid-incl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libsubid-link-to-PAM-=
libraries.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://useradd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
@@ -115,6 +116,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use proper encryption for passwords<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^#ENCRYPT_METHOD.*$/ENCRYPT_METHO=
D SHA512/&#39; ${D}${sysconfdir}/login.defs<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/useradd ${D}${syscon=
fdir}/default<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append() {<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000006d48ee05c9bcfcbf--
