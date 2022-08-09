Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC90C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 09:14:46 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.9695.1660036485415259617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 02:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9Y4RbWK;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id l10so7776434lje.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=b7c74iW0J5TWQ+ujJHrd28z7bOD6bpZNYviaIy4A24M=;
        b=J9Y4RbWK7xYt4CTLVfHro5zfqXaesmnzcsFxCL3LavQBQ8sdxzIGydfHY7PwADvXkM
         MULcBZZeAoh37bNyQgpaOHqbEpHRuml9a8bv9k37iBmSxOCIkgddr+soZ8t1tBm+5Ack
         f0RKNyJsADMyz5IIohhOJW2MpVeFxOkV05Yyvj8msuf+E+LGAJGz9TD4GUcaL9nWYiFF
         rzhgUtoavybNbYQ8z5eCI+FP1wKVmfnjWjw6Nnaa3g1fr6pK3S+s2umc+ptpOnEcMH0H
         04IVYdPbaukFxbi6YbObxC6ZIgIqDUyxtipl0tAz/X97TwX58Ncyln9vykiYx6N/jcRW
         JE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=b7c74iW0J5TWQ+ujJHrd28z7bOD6bpZNYviaIy4A24M=;
        b=P+3E5RwYjuimQ4cV5/4scaQLur0CciCGISaXpOvUWqVbI2dJJfjl0wryY9cW33OLm6
         tuwCloGPEzekfHqqPIAkVhcy8UqXw9oigo6PDCMadn04ts/fgtXqvgJX+dV82RdDwkeW
         gfCpVKnZ4QtJ+bjLhV9tG902H8iDVmxyIjZNXhmwK1Gt7AUXcWwsarq4pTxbb1dItBwh
         zgZeKeXS9KIfqL2/VYj/Zbl964elM1novk/tmgQqSk3g5IrPRHrwqZlz3ZmtJ4dPv414
         jJakf+Uv++cgTxKMmUYBW0rMbn2BbTkVYuFSjqG0mjRltmsUrLzG/g6UiBX41hgUJ+os
         g/NQ==
X-Gm-Message-State: ACgBeo2gXbGg6rC6B19ynCNsiDnSq9e1PZvD6lhiEhXY8Pl0sCfb1IHj
	SAEAvuVP5vdc6T+TqNwFhXQ/fCwZcJeuhivHVj4=
X-Google-Smtp-Source: 
 AA6agR6t2XqMWuo1u+rkkcdTXMDOe0SsM3d9+T5cMAddbDywXgNGQvEuXLZX0rDDbLLdVdKTcX4v7epRaIZr5WUpJKw=
X-Received: by 2002:a2e:309:0:b0:25e:a57:8337 with SMTP id
 9-20020a2e0309000000b0025e0a578337mr7165714ljd.50.1660036483436;
 Tue, 09 Aug 2022 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220809083527.1221635-1-alban.bedel@aerq.com>
In-Reply-To: <20220809083527.1221635-1-alban.bedel@aerq.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 10:14:32 +0100
Message-ID: 
 <CANPvuRkBL1HaxhTnOFzCM0PZ-fSU2_xMLGa8amGndNggCT9Dew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
To: alban.bedel@aerq.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e8d50605e5cb5cd4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 09:14:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169143

--000000000000e8d50605e5cb5cd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alban,

Alban Bedel via lists.openembedded.org <alban.bedel=3D
aerq.com@lists.openembedded.org> escreveu no dia ter=C3=A7a, 9/08/2022 =C3=
=A0(s)
09:36:

> Currently if the installation of a sstate package fails the whole
> build is aborted although bitbake could just fallback on running the
> real task.
>
> To fix this issue we replace the call to bb.fatal() in
> sstate_setscene() with a simple sys.exit() to pass the error to bitbake
> without aborting the build. The error message that was passed to
> bb.fatal() is just removed as all error path already contains a
> warning or note.
>
> Then to further improve the build resilience we add a try block around
> the sstate package unpacking. If it fails, for example because the
> package was corrupted, we now print a warning and optionally remove
> the broken package to allow it to be rebuilt. The cleaning of broken
> packages can be disabled be setting the SSTATE_CLEAN_BROKEN_PACKAGES
> variable to 0.
>

What do you mean by package was corrupted?
If it fails when extracting the archive is because your filesystem is
corrupted and what needs to be fixed is the file system.

Jose


>
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  meta/classes/sstate.bbclass | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index de6e7fa9608a..069901483bb2 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -108,6 +108,9 @@ SSTATE_SIG_PASSPHRASE ?=3D ""
>  # Whether to verify the GnUPG signatures when extracting sstate archives
>  SSTATE_VERIFY_SIG ?=3D "0"
>
> +# Whether to remove broken sstate packages
> +SSTATE_CLEAN_BROKEN_PACKAGES ?=3D "1"
> +
>  SSTATE_HASHEQUIV_METHOD ?=3D "oe.sstatesig.OEOuthashBasic"
>  SSTATE_HASHEQUIV_METHOD[doc] =3D "The fully-qualified function used to
> calculate \
>      the output hash for a task, which in turn is used to determine
> equivalency. \
> @@ -375,9 +378,18 @@ def sstate_installpkg(ss, d):
>      sstateinst =3D d.getVar("SSTATE_INSTDIR")
>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>
> -    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() +
> ['sstate_unpack_package']:
> -        # All hooks should run in the SSTATE_INSTDIR
> -        bb.build.exec_func(f, d, (sstateinst,))
> +    try:
> +        for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() +
> ['sstate_unpack_package']:
> +            # All hooks should run in the SSTATE_INSTDIR
> +            bb.build.exec_func(f, d, (sstateinst,))
> +    except bb.process.ExecutionError:
> +        bb.warn("Failed to install sstate package %s, skipping
> acceleration..." % sstatepkg)
> +        oe.path.remove(sstateinst)
> +        if bb.utils.to_boolean(d.getVar("SSTATE_CLEAN_BROKEN_PACKAGES"),
> True):
> +            bb.warn("Removing broken sstate package %s" % sstatepkg)
> +            oe.path.remove(sstatepkg)
> +            oe.path.remove(sstatepkg + '.*')
> +        return False
>
>      return sstate_installpkgdir(ss, d)
>
> @@ -763,7 +775,7 @@ def sstate_setscene(d):
>      shared_state =3D sstate_state_fromvars(d)
>      accelerate =3D sstate_installpkg(shared_state, d)
>      if not accelerate:
> -        bb.fatal("No suitable staging package found")
> +        sys.exit(1)
>
>  python sstate_task_prefunc () {
>      shared_state =3D sstate_state_fromvars(d)
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169140):
> https://lists.openembedded.org/g/openembedded-core/message/169140
> Mute This Topic: https://lists.openembedded.org/mt/92911047/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e8d50605e5cb5cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alban,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Alban Bedel via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;alban.bedel=3D<a href=3D"mailt=
o:aerq.com@lists.openembedded.org">aerq.com@lists.openembedded.org</a>&gt; =
escreveu no dia ter=C3=A7a, 9/08/2022 =C3=A0(s) 09:36:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Currently if the installation of a s=
state package fails the whole<br>
build is aborted although bitbake could just fallback on running the<br>
real task.<br>
<br>
To fix this issue we replace the call to bb.fatal() in<br>
sstate_setscene() with a simple sys.exit() to pass the error to bitbake<br>
without aborting the build. The error message that was passed to<br>
bb.fatal() is just removed as all error path already contains a<br>
warning or note.<br>
<br>
Then to further improve the build resilience we add a try block around<br>
the sstate package unpacking. If it fails, for example because the<br>
package was corrupted, we now print a warning and optionally remove<br>
the broken package to allow it to be rebuilt. The cleaning of broken<br>
packages can be disabled be setting the SSTATE_CLEAN_BROKEN_PACKAGES<br>
variable to 0.<br></blockquote><div><br></div><div>What do you mean by pack=
age was corrupted?<br>If it fails when=C2=A0extracting=C2=A0the archive is =
because your filesystem is corrupted and what needs to be=C2=A0fixed is the=
 file system.<font color=3D"#000000"><br></font><br>Jose<br>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Alban Bedel &lt;<a href=3D"mailto:alban.bedel@aerq.com" targ=
et=3D"_blank">alban.bedel@aerq.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass | 20 ++++++++++++++++----<br>
=C2=A01 file changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index de6e7fa9608a..069901483bb2 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -108,6 +108,9 @@ SSTATE_SIG_PASSPHRASE ?=3D &quot;&quot;<br>
=C2=A0# Whether to verify the GnUPG signatures when extracting sstate archi=
ves<br>
=C2=A0SSTATE_VERIFY_SIG ?=3D &quot;0&quot;<br>
<br>
+# Whether to remove broken sstate packages<br>
+SSTATE_CLEAN_BROKEN_PACKAGES ?=3D &quot;1&quot;<br>
+<br>
=C2=A0SSTATE_HASHEQUIV_METHOD ?=3D &quot;oe.sstatesig.OEOuthashBasic&quot;<=
br>
=C2=A0SSTATE_HASHEQUIV_METHOD[doc] =3D &quot;The fully-qualified function u=
sed to calculate \<br>
=C2=A0 =C2=A0 =C2=A0the output hash for a task, which in turn is used to de=
termine equivalency. \<br>
@@ -375,9 +378,18 @@ def sstate_installpkg(ss, d):<br>
=C2=A0 =C2=A0 =C2=A0sstateinst =3D d.getVar(&quot;SSTATE_INSTDIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&#39;SSTATE_FIXMEDIR&#39;, ss[&#39;fixmedir&#3=
9;])<br>
<br>
-=C2=A0 =C2=A0 for f in (d.getVar(&#39;SSTATEPREINSTFUNCS&#39;) or &#39;&#3=
9;).split() + [&#39;sstate_unpack_package&#39;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # All hooks should run in the SSTATE_INSTDIR<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(f, d, (sstateinst,))<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in (d.getVar(&#39;SSTATEPREINSTFUNCS&#39=
;) or &#39;&#39;).split() + [&#39;sstate_unpack_package&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # All hooks should run in the SS=
TATE_INSTDIR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(f, d, (sstate=
inst,))<br>
+=C2=A0 =C2=A0 except bb.process.ExecutionError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Failed to install sstate package=
 %s, skipping acceleration...&quot; % sstatepkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.remove(sstateinst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.to_boolean(d.getVar(&quot;SSTATE_C=
LEAN_BROKEN_PACKAGES&quot;), True):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Removing broken ss=
tate package %s&quot; % sstatepkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.remove(sstatepkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.remove(sstatepkg + &#39;=
.*&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0return sstate_installpkgdir(ss, d)<br>
<br>
@@ -763,7 +775,7 @@ def sstate_setscene(d):<br>
=C2=A0 =C2=A0 =C2=A0shared_state =3D sstate_state_fromvars(d)<br>
=C2=A0 =C2=A0 =C2=A0accelerate =3D sstate_installpkg(shared_state, d)<br>
=C2=A0 =C2=A0 =C2=A0if not accelerate:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;No suitable staging package fou=
nd&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
<br>
=C2=A0python sstate_task_prefunc () {<br>
=C2=A0 =C2=A0 =C2=A0shared_state =3D sstate_state_fromvars(d)<br>
-- <br>
2.34.1<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169140): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169140" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169140</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92911047/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92911047/5052612</a><br>
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
 Quaresma</div></div></div></div>

--000000000000e8d50605e5cb5cd4--

