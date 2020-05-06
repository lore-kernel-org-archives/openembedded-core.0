Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web11.2284.1588752568149722994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IrhTcjxQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id a16so155923uaq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jeqF1YDcdDugQaua8z9xPKrOyC1rDbGM+h9s3T9N1DY=;
        b=IrhTcjxQSxuy3OL0NV/FweNII2XIOrj3LYthN21k0ZYc5RtpCc8h7OfF3qGpxgx3sd
         8L+AirXaeC12ti7n6vlLG2VRNJXQ4gMse8J+KexoBiluX3QigGMkBxkaLV6ryIUrmOeJ
         u9n42a2W160XKLNFnNArYzNanuxvHTgL/kWt+TxdV4//ZbCOefdIVMKM4eHkCzu2qsDK
         KSGjy0/QxUqbpaRYvkUlB1YI20r+0fZzAKW+FoKytCpzTlyq9CjfbrVluMayeBBrm+U9
         kosO9os11+7uWhhkYsTEQJiO/hIMhXi/zA9DxTeglsIPPEX0U7HymaXv2ZKaA06wgqxv
         OPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jeqF1YDcdDugQaua8z9xPKrOyC1rDbGM+h9s3T9N1DY=;
        b=Xwhe6wLOhVwx1/vpZbt27JWFkmYQ0jxO37HpEpQ5V0ACYC80N2ER1Tkfp3AFghoVIG
         cOChKqM73fhfNTmHaYbuY0wRA4vS4rKr/UAbfQhCvIuGk7fgMk3NhO1X+lF0Bw5v7UKl
         g6ragcj4M5+Xgw2Hj500NZCzuBZDAgvC/0mffuSj8KKp5N3GwIg4yiIP5MasClxbaxSI
         1DpDVpmkkkptKMTY2/ylJMHJ5A8gs0kzEvTkCwnbQXLWmovL7b9ZVO0wmaZSPZCGJfhS
         P4Bv0gk9MRwdCiUtQZeLvsr6vihbK0aBotzOXOqaOUA+pozkxupqLxqEJ8eeAu+GrLDn
         aDUQ==
X-Gm-Message-State: AGi0PuYtEMGXDVMao4N91VOhIPVEmnpxIIQ1EeLkvYFRl0VMsQjB+wfl
	N9JiqI6GYY6lxuz3djf5ivMuolzjbix5JB5fHZI=
X-Google-Smtp-Source: APiQypKSuY/+2kooMkzB+w1AFKk27VHBd7GS+3vgZazroD3qt3IgH1q2MPBXsfQBcFWVITTqk8jb+Xsfngz01lbf9yc=
X-Received: by 2002:ab0:650f:: with SMTP id w15mr5518268uam.93.1588752567284;
 Wed, 06 May 2020 01:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <160A7D8AF7F6BE8C.17748@lists.openembedded.org> <c3e5a4dc-c4a7-d398-4821-085777710c74@windriver.com>
In-Reply-To: <c3e5a4dc-c4a7-d398-4821-085777710c74@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 6 May 2020 10:09:15 +0200
Message-ID: <CANNYZj8KHOLPO6XeDrUJQMQ3+PmtFX2qteV-9z3z5S4ye-e3Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/package_manager: update default rpm config %_prefer_color
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000068b93d05a4f6483b"

--00000000000068b93d05a4f6483b
Content-Type: text/plain; charset="UTF-8"

There was a response from RP:

This causes a failure on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1867

Alex

On Wed, 6 May 2020 at 04:39, Changqing Li <changqing.li@windriver.com>
wrote:

> ping
> On 4/30/20 12:10 PM, Changqing Li wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.com>
>
> * %_prefer_color is used by rpm to determine which color's ELF file
> is preferred to be installed.
>
> Here are file colors:
> 0 is unknown or other
> 1 is Elf32
> 2 is Elf64
> 3 is (contains) both
>
> if default value set to 7, both 32 and 64 bits's ELF will be installed,
> in this condition, when we have 64bits python3 installed first,
> then install lib32-python3 later, 64bits python3 will be overwrited,
>
> file /usr/bin/python3 will be 32bits ELF
> and sys.path will point to /usr/lib, not /usr/lib64, this may cause
> some python3 modules not work. so fixed by remove setting of default
> value 7, and use default value 2 of rpm.
>
> * other distro like fedora also use the default %_prefer_color 2
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index b066041..c055d2b 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -805,8 +805,6 @@ class RpmPM(PackageManager):
>          open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
>          if self.d.getVar('RPM_PREFER_ELF_ARCH'):
>              open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
> -        else:
> -            open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
>
>          if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
>              signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
>
>
> 
>

--00000000000068b93d05a4f6483b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There was a response from RP:</div><div><br></div><di=
v>This causes a failure on the autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/44/buil=
ds/1867" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/44/builds/1867</a></div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 6 May 2020 at 04:39, Changqing Li &lt;<a href=3D"mailto:c=
hangqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">

  
  <div bgcolor=3D"#FFFFFF">
    <p>ping<br>
    </p>
    <div>On 4/30/20 12:10 PM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com=
" target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

* %_prefer_color is used by rpm to determine which color&#39;s ELF file
is preferred to be installed.

Here are file colors:
0 is unknown or other
1 is Elf32
2 is Elf64
3 is (contains) both

if default value set to 7, both 32 and 64 bits&#39;s ELF will be installed=
,
in this condition, when we have 64bits python3 installed first,
then install lib32-python3 later, 64bits python3 will be overwrited,

file /usr/bin/python3 will be 32bits ELF
and sys.path will point to /usr/lib, not /usr/lib64, this may cause
some python3 modules not work. so fixed by remove setting of default
value 7, and use default value 2 of rpm.

* other distro like fedora also use the default %_prefer_color 2

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/lib/oe/package_manager.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.=
py
index b066041..c055d2b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -805,8 +805,6 @@ class RpmPM(PackageManager):
         open(platformconfdir + &quot;macros&quot;, &#39;w&#39;).write(&qu=
ot;%_transaction_color 7\n&quot;)
         if self.d.getVar(&#39;RPM_PREFER_ELF_ARCH&#39;):
             open(platformconfdir + &quot;macros&quot;, &#39;a&#39;).write=
(&quot;%%_prefer_color %s&quot; % (self.d.getVar(&#39;RPM_PREFER_ELF_ARCH&#=
39;)))
-        else:
-            open(platformconfdir + &quot;macros&quot;, &#39;a&#39;).write=
(&quot;%_prefer_color 7&quot;)
=20
         if self.d.getVar(&#39;RPM_SIGN_PACKAGES&#39;) =3D=3D &#39;1&#39;:
             signer =3D get_signer(self.d, self.d.getVar(&#39;RPM_GPG_BACK=
END&#39;))
</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
</blockquote></div>

--00000000000068b93d05a4f6483b--
