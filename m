Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10272.1792461972050595520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 19:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PKeoDU+/;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab38a051aaso23110457b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792461971; cv=none;
        d=google.com; s=arc-20260327;
        b=MED9rr2ZORZjjIC3ErLlR+MhqUBMm0UL9EtkT0Sq7MWbBIk7aABdgS5Qs9/4/BYW/O
         FvyCOeSrlESuF41XoYOW6xvbxfNLSvk0JYI+flrAPMxMfQpNMkGEZFmz3E5h8ZWa+8Vd
         7/7779bY7AEbslO2nflu7EPtcEjMDxeIdq4SpvHqfJiJIwYzUZFIKYy5f7CZyRVegGU9
         bK/FCaAJckOk63V69mdqPdiAIBFRg/XePHmNKY2j3zbhABPgyCkJsVmABXSSyAKfr6gs
         ZSyI74x3u8b2gX6RHaRyKInc2E9IyVZ0ws19Qvp2IDnu5GqwecVycFCLiclNqU3AHl9q
         98Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rsen4/Ve/sGLnbOxCzyL+k+TgQ1qEEPj/jqX1g6+Vcc=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=lQE9nmalzuvzHKbnf+VXVA2vfgvcJE7qGCun/qeNZxZmfcNk0n48ym4OxHEZ1cMiMC
         cqZcTm/DYcck711f0Mwo0Z/OmesSwpDgNyJ1h4brch/kuWZG+qUxeVJzLTL7JJ015/Ul
         kJ2JKvkvNwwtLR64C1cdBsaPjhqoQ54GD4TrwubYNWNJHUt+LrY6ubHuZ8mRO4pD33cV
         GnOA7XXnk8QVyTqjVulkAIFDLoFjSI578ahSM8SLP/6kfthhd4DjBZfI1eJDHswRMVKz
         nWivBBvs//ZthQVPD2h5h7PYaaOjrsyLYXFkuN7dgWk30jn/4nVdaIlyeNTF/LVlH7YW
         Czzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461971; x=1793066771; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsen4/Ve/sGLnbOxCzyL+k+TgQ1qEEPj/jqX1g6+Vcc=;
        b=PKeoDU+/F6mi/ltprbpHtqlBN84T7mGTA+53DDproaQdyu37FW6OeCeCZ/4SEjvPM+
         LnHf35uWoTVUgiqqiaALtP2fGshY4T/FBHE0R/jBdlPY8ADTnhavkeQQmkV9ZXIO4LyP
         p4bwFIzIn9tRr8qqHd6aNcqmprrerldXPppDOIOHDWr2CKzN+xwXcs0BSMd2hHTwHzeT
         nx81HjCo8ECc5B1gkSGzsOau8hvm26mv3855RWxf6Kqo73rcS/y8OvrB4XO/BtFBCBX0
         W8cPmOBGyJGzHlCJrC4IdlaEaFjHb3svLgNgc+trPaUyWhNHyIo/KuwF0JJq4d1NjWPq
         TfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461971; x=1793066771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rsen4/Ve/sGLnbOxCzyL+k+TgQ1qEEPj/jqX1g6+Vcc=;
        b=x4QaX6hheDeKuuKVMlNexZOOXbL/y/eHueyS2DFHSxHiXvaQg/YLBMppqFiL3Up+jM
         6tr+Vr/6UngLQNgWhx2lnGkU5pbAhYOqijmOXw1FsBBFBRyKrHvkuM7sAVtyeOeHjNCr
         zawnfyoJTfrhMg3HWosc9v2VT3URebP6lv5M1yPxFBrKay9ZyOm/MCk5bqvfoDBmmChr
         d5APfmGHcGxHUjMec11L7pa4fISE915J0JtFDO//JBVRoh6QD1fpl0K34nNpb3JB4f2Z
         2AG90fL9q84rLiZyz+uJdYRWImTlc0XGzh33aAY3CBRaCoUolzGpFat/2uIgTsGADjvO
         vVaA==
X-Gm-Message-State: AFq9FYKPRHNXR+Jbya40OVhCCVUXKFuZLJTCv6X+kaThz0S5TqMhQLHQ
	WwHpSBhFP2W6owPVhfn5c7Nrbq7Pwg7/s5j8pbfbMrJkyP8Mxgh8KbPBgP/gCnzL4BCeCbc4TCN
	rUYp4UoyNh3HzdlgXsLUrpVwoUoqFc7s=
X-Gm-Gg: AYBFou0HtXQJLU3wQ3sMcLnHBBKY2OWGpyC+g9tKTz6FHDs/d86coLjCAC0tVJav8Q8
	pxM+YwDSzeHJRG6CTLgDyVrDGWytpVy6ViMGLU2DzZG0DkC6wKHaGZOFq8jTA1fdsrrmvZUbS+f
	kz4klWIQz5GbAXP0NjHIic1jJ/RgeRGggSN72K4B89zR2Rd1sLkF3mOYpU0RzUn0LGsnyQ1QNJU
	mjOSZ5cxR0hEh0gKr3b9kyjF3IJbBUxHvpQJ8txTropHXhsAGWQEG3IqHc828+aLV8oZrIWEpIl
	72Io5UEdxw/TCSoQKdgpaoIWoIykSdkXLpkagvwVYomfOiDi5ppWuuqN0WbkiyRB8Bmh15SMw0E
	rkSaU/nNil9m9iPO5GF0wA7dNGrpcxuhaVyqbim8PQQ0igiEnuHxJdAKBIO8f8W7EbCzml10gd8
	UKFqiWbeQD0ckunkCXSI/mHnAQyD+2V9/vISnPMvOJmtELkwEdT9ZmCYRB008PfR8Nqlqx7pXBJ
	r3n0vCdi1JZuBXz0m0Kb6V5Oq0fTgePom0cGKMYwYXRiqS9xNDp//ymgwRB//HJ5DYgLGPutX6y
	VohDT0fasSRBlvu9l+lKZjenxGt3V/8130fG1Ij2R2eDY2X9wg==
X-Received: by 2002:a05:690c:6f83:b0:8b0:c5fe:db0f with SMTP id
 00721157ae682-8b0f21ae895mr31817117b3.23.1792461971133; Mon, 19 Oct 2026
 19:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261019145837.2487873-1-ross.burton@arm.com> <20261019145837.2487873-5-ross.burton@arm.com>
In-Reply-To: <20261019145837.2487873-5-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Oct 2026 19:05:43 -0700
X-Gm-Features: AclHuK-jgUfOg5hM4xR9sLDMTcmZYMBL6uZRrE7dvBGVtQxpttykYZtEr1Hdd7w
Message-ID: <CAMKF1sqsb4DZKk49wj7+z34PWA67huhLAz7R-1btDWhz4+Wbvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] lib/oe/package: use elfutils instead of
 objdump to extract SONAME etc
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000101f66065e3c13d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248211

--000000000000101f66065e3c13d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a neat change. How closely does elfutils follow standards compared
to binutils I wonder, so we know to be aware when new stuff gets added to
ELF files

On Mon, Oct 19, 2026 at 7:58=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Currently the process_shlibs() function uses OBJDUMP (typically, objdump
> from binutils) to extract the NEEDED/SONAME/RPATH values from the ELF.
>
> However, there is no explicit dependency on binutils in do_package,
> instead it comes into the sysroot via the default toolchain dependencies
> in do_configure, so a recipe that does INHIBIT_DEFAULT_DEPS and also
> packages an executable file will try and then fail to run objdump.
>
> Currently this error is silently ignored, which is acceptable if the
> executable is a script, but if the recipe contains ELFs without ever
> depending on binutils (precompiled, or a different toolchain) then the
> shlibs code won't actually run correctly.
>
> do_package() already depends on elfutils-native for eu-srcfiles, so
> switch the code to use eu-readelf instead.
>
> Also use subprocess.run() with a command list instead of a string to
> os.popen().  The os.popen() code didn't have any error handling meaning
> it silently ignored both "objdump not found" and "file is not ELF", we
> can assume that eu-readelf exists but we still need to absorb errors
> from not passing a valid ELF.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oe/package.py | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 8ecb2555f3a..e706e359cc3 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1654,23 +1654,24 @@ def process_shlibs(pkgfiles, d):
>          needed =3D set()
>          sonames =3D set()
>          ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
> -        cmd =3D d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + "
> 2>/dev/null"
> -        fd =3D os.popen(cmd)
> -        lines =3D fd.readlines()
> -        fd.close()
>          rpath =3D tuple()
> +        cmd =3D ["eu-readelf", "--dynamic", file]
> +        # Don't check for errors as we may be passed non-ELF
> +        ret =3D subprocess.run(cmd, capture_output=3DTrue, text=3DTrue)
> +
> +        lines =3D ret.stdout.splitlines()
>          for l in lines:
> -            m =3D re.match(r"\s+RPATH\s+([^\s]*)", l)
> +            m =3D re.match(r"\s+RPATH\s+.+\[(.+)\]", l)
>              if m:
>                  rpaths =3D m.group(1).replace("$ORIGIN", ldir).split(":"=
)
>                  rpath =3D tuple(map(os.path.normpath, rpaths))
>          for l in lines:
> -            m =3D re.match(r"\s+NEEDED\s+([^\s]*)", l)
> +            m =3D re.match(r"\s+NEEDED\s+.+\[(.+)\]", l)
>              if m:
>                  dep =3D m.group(1)
>                  if dep not in needed:
>                      needed.add((dep, file, rpath))
> -            m =3D re.match(r"\s+SONAME\s+([^\s]*)", l)
> +            m =3D re.match(r"\s+SONAME\s+.+\[(.+)\]", l)
>              if m:
>                  this_soname =3D m.group(1)
>                  prov =3D (this_soname, ldir, pkgver)
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248187):
> https://lists.openembedded.org/g/openembedded-core/message/248187
> Mute This Topic: https://lists.openembedded.org/mt/121833072/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000101f66065e3c13d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a neat change. How closely does elfutils follow st=
andards compared to binutils=C2=A0I wonder, so we know to be aware when new=
 stuff gets added to ELF files=C2=A0</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19, 2=
026 at 7:58=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.co=
m@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Currently the proce=
ss_shlibs() function uses OBJDUMP (typically, objdump<br>
from binutils) to extract the NEEDED/SONAME/RPATH values from the ELF.<br>
<br>
However, there is no explicit dependency on binutils in do_package,<br>
instead it comes into the sysroot via the default toolchain dependencies<br=
>
in do_configure, so a recipe that does INHIBIT_DEFAULT_DEPS and also<br>
packages an executable file will try and then fail to run objdump.<br>
<br>
Currently this error is silently ignored, which is acceptable if the<br>
executable is a script, but if the recipe contains ELFs without ever<br>
depending on binutils (precompiled, or a different toolchain) then the<br>
shlibs code won&#39;t actually run correctly.<br>
<br>
do_package() already depends on elfutils-native for eu-srcfiles, so<br>
switch the code to use eu-readelf instead.<br>
<br>
Also use subprocess.run() with a command list instead of a string to<br>
os.popen().=C2=A0 The os.popen() code didn&#39;t have any error handling me=
aning<br>
it silently ignored both &quot;objdump not found&quot; and &quot;file is no=
t ELF&quot;, we<br>
can assume that eu-readelf exists but we still need to absorb errors<br>
from not passing a valid ELF.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package.py | 15 ++++++++-------<br>
=C2=A01 file changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index 8ecb2555f3a..e706e359cc3 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -1654,23 +1654,24 @@ def process_shlibs(pkgfiles, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sonames =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldir =3D os.path.dirname(file).replace(pk=
gdest + &quot;/&quot; + pkg, &#39;&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D d.getVar(&#39;OBJDUMP&#39;) + &quot; -=
p &quot; + shlex.quote(file) + &quot; 2&gt;/dev/null&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D os.popen(cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =3D fd.readlines()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd.close()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpath =3D tuple()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [&quot;eu-readelf&quot;, &quot;--dynam=
ic&quot;, file]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Don&#39;t check for errors as we may be pass=
ed non-ELF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D subprocess.run(cmd, capture_output=3DT=
rue, text=3DTrue)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =3D ret.stdout.splitlines()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in lines:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+RPATH\s=
+([^\s]*)&quot;, l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+RPATH\s=
+.+\[(.+)\]&quot;, l)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpaths =3D m.=
group(1).replace(&quot;$ORIGIN&quot;, ldir).split(&quot;:&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpath =3D tup=
le(map(os.path.normpath, rpaths))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in lines:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+NEEDED\=
s+([^\s]*)&quot;, l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+NEEDED\=
s+.+\[(.+)\]&quot;, l)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep =3D m.gro=
up(1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep not in=
 needed:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0needed.add((dep, file, rpath))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+SONAME\=
s+([^\s]*)&quot;, l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(r&quot;\s+SONAME\=
s+.+\[(.+)\]&quot;, l)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this_soname =
=3D m.group(1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prov =3D (thi=
s_soname, ldir, pkgver)<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248187): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248187" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248187</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121833072/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121833072/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000101f66065e3c13d6--
