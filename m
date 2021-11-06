Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5FCC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:09:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.22108.1636222151888411239
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H4dAgHEG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bi35so25742139lfb.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIgMvOdumnfd0+tttsoooUUwCIiVWWvBsw2xWwQxn/g=;
        b=H4dAgHEGTYdFeBM3FdqFFMlRK+WgN/5tgDx0iWjypJ/lNqPZ5i8HWUPBaQPyXevnra
         6ZvQK2Tdv6dzO6wA0rBND/iUJQzMwpizguXK3y1xO2f2S7FbVrc2GSdoBHcdIRkp3qFf
         ZYcxwd8VUHGozwcgp2KuIqPrEpydaRQb2LDu6OU29nLM9U7mdecs9nFR3NlZFMTNzIZZ
         83z5oJp/HYBwwP9PG+qM3e4Jo88MZDLROmXtR9FwfnN66M/gtMIMNBwSoms/HGp51YQH
         f5D2ptnIPY8p/qdML/+6CPcprBvDXbKrqTYpC6bo7nXd5volPb4mBjxTif04hVtxvON5
         vIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIgMvOdumnfd0+tttsoooUUwCIiVWWvBsw2xWwQxn/g=;
        b=HKoKOpeaD39GFc8eNkYFtxFSQ0XKywQhcfnKmqvEdt4yZ0veJYobBOAp2zySBzvXBz
         nO9jahG8FLDv9LSV4Ky3el/lnLagt0TS2PibWWdqA0R9uu1FzXSsnofaNuiS19Qt6zP5
         MEB4jiEe305z5zoODvPVuvbZWjZK9oiuci26N8hrOGQqvBjPhT6o6qQNDw7DizfOmhqk
         MOhufMRFthHpof9nGtFwz7oRzvK6EJgKndC6Xh0jOoFAQk9Uu4P3l4MyaiJ8swzNVbVL
         xgBuN5wVnPJtFmkgV0svmGiy8NWTKSnSZ2xPWjUxdXdF/hDF4gvVO+4/eNz6OweIVN+5
         mAAQ==
X-Gm-Message-State: AOAM530UZFwpafkJFxcuBaAI8Xt7BdXkVXhCpZGtZYrK/OZTbAEVwIyC
	zO0pfg3TPzv7ulEG/36qpD3U80+VRzhrkTsut4w=
X-Google-Smtp-Source: 
 ABdhPJzo1QIzwg1FjWY2BUaD+kFp2BG5XlayxZ8FmFCah7XeqUUzSenvAB+AxtPOuETsYTE8GiAmUTgrMsHuELE0++c=
X-Received: by 2002:a19:ad0d:: with SMTP id
 t13mr62260878lfc.161.1636222150112;
 Sat, 06 Nov 2021 11:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <16B46DC051798307.25609@lists.openembedded.org>
In-Reply-To: <16B46DC051798307.25609@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sat, 6 Nov 2021 18:09:00 +0000
Message-ID: 
 <CANPvuRkNsLegEXwZBzjx6OHSwb36RHAhN8qH2HTZgBBFrE0_TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate: another fix for touching files
 inside pseudo
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000007f93705d022a87d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 18:09:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157943

--00000000000007f93705d022a87d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Can this patch be backported to dunfell branch to land in the next release
3.1.12?

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quinta, 4/11/2021 =C3=A0(=
s)
19:14:

> This patch is a fixup for 676757f "sstate: fix touching files inside
> pseudo"
>
> running the 'id' command inside the sstate_unpack_package
> function shows that this funcion run inside the pseudo:
>
>  uid=3D0(root) gid=3D0(root) groups=3D0(root)
>
> The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
> will always return true and the touch can fail when the real user
> don't have permission or in readonly filesystem.
>
> As the documentation refers:
> - the file test operator "-w" check if the file has write permission
> (for the user running the test).
> - the file test operator "-O" check if you are owner of file
>
> We can avoid this test running the touch and mask any return errors
> that we have.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>
> V2: match the original code
>
>  meta/classes/sstate.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 8182010047..849723d4dc 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -900,12 +900,12 @@ sstate_unpack_package () {
>         fi
>
>         tar -I "$ZSTD" -xvf ${SSTATE_PKG}
> -       # update .siginfo atime on local/NFS mirror
> -       [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [
> -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> -       # Use "! -w ||" to return true for read only files
> -       [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
> -       [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch
> --no-dereference ${SSTATE_PKG}.sig
> -       [ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ]
> || touch --no-dereference ${SSTATE_PKG}.siginfo
> +       # update .siginfo atime on local/NFS mirror if it is a symbolic
> link
> +       [ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo
> 2>/dev/null || true
> +       # update each symbolic link instead of any referenced file
> +       touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
> +       [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference
> ${SSTATE_PKG}.sig 2>/dev/null || true
> +       [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference
> ${SSTATE_PKG}.siginfo 2>/dev/null || true
>  }
>
>  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157858):
> https://lists.openembedded.org/g/openembedded-core/message/157858
> Mute This Topic: https://lists.openembedded.org/mt/86824160/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000007f93705d022a87d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Steve,</div><div><br></div>Can this patch be =
backported=C2=A0to dunfell=C2=A0branch to land in the next release 3.1.12?<=
div><br></div><div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>=
&gt; escreveu no dia quinta, 4/11/2021 =C3=A0(s) 19:14:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">This patch is a fixup for 676757f &=
quot;sstate: fix touching files inside pseudo&quot;<br>
<br>
running the &#39;id&#39; command inside the sstate_unpack_package<br>
function shows that this funcion run inside the pseudo:<br>
<br>
=C2=A0uid=3D0(root) gid=3D0(root) groups=3D0(root)<br>
<br>
The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]<br>
will always return true and the touch can fail when the real user<br>
don&#39;t have permission or in readonly filesystem.<br>
<br>
As the documentation refers:<br>
- the file test operator &quot;-w&quot; check if the file has write permiss=
ion<br>
(for the user running the test).<br>
- the file test operator &quot;-O&quot; check if you are owner of file<br>
<br>
We can avoid this test running the touch and mask any return errors<br>
that we have.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
<br>
V2: match the original code<br>
<br>
=C2=A0meta/classes/sstate.bbclass | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 8182010047..849723d4dc 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -900,12 +900,12 @@ sstate_unpack_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tar -I &quot;$ZSTD&quot; -xvf ${SSTATE_PKG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -O ${SSTATE_PKG}.siginfo ] &amp;&amp; [ -w ${=
SSTATE_PKG}.siginfo ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; to=
uch -a ${SSTATE_PKG}.siginfo<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use &quot;! -w ||&quot; to return true for re=
ad only files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} ] || touch --no-dereferenc=
e ${SSTATE_PKG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_P=
KG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTA=
TE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror if =
it is a symbolic link<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SS=
TATE_PKG}.siginfo 2&gt;/dev/null || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# update each symbolic link instead of any refe=
renced file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch --no-dereference ${SSTATE_PKG} 2&gt;/dev/=
null || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -e ${SSTATE_PKG}.sig ] || touch --no-derefe=
rence ${SSTATE_PKG}.sig 2&gt;/dev/null || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-de=
reference ${SSTATE_PKG}.siginfo 2&gt;/dev/null || true<br>
=C2=A0}<br>
<br>
=C2=A0BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quot;<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157858): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157858" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157858</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86824160/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86824160/5052612</a><br>
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

--00000000000007f93705d022a87d--

