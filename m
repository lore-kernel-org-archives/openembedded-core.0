Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web09.24283.1612127711587556505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 13:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cA01zXjU;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id d13so15274982ioy.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 13:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=iZrwALbPbOrIfT/Fb+QE+kftuDoYEqrQ7lfk8x7Q/Ms=;
        b=cA01zXjUqzX5O0BjKuQHgKl85weDL+Ub/p/zVIemRifJLsqhiP6FVhLzg3lKWwCIs5
         LNux+gkjXHqrebjFIIpLnShf+8egIwSXYNxLsJaLAmg6GqrTUQfdqSxLafKU0HUOO/9D
         jbYYgFwJghXTmsmtOeSLoCRYu7KuCVhHYCOBu8Ydgtmt08WbRK8eT1dPvuAtRQxiS6De
         bfZYhTF0dF/1JEPag4833b2kgMz4kH0NzzLmLO6xaBbFfHAo5cU3dK+oaQ6voFOEVWgw
         bQ86kLNg8D1EicLwLystpTGjPuH6YLTFZaOb2SuqtuTcscAkYU4CzUm6n34BrpuMhWWg
         vcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=iZrwALbPbOrIfT/Fb+QE+kftuDoYEqrQ7lfk8x7Q/Ms=;
        b=QBM239IvS9/o32whxvW8pMvureuevlmcSC6FrmZoT6AqgkBdB1lJM3+Vd0mWybCyuD
         GgcVdDCQScn3wGau+oSMQhfPa9VxX2b0LYtg1z3JCa123hmCs57ysdo8OAENvbspUe0X
         dGdchhHBv5U5S3AyqpXrsjPRHRSHb8H3k+Jwum/t4s0qZDwZbbsDBQYL5f2UCGZRHm1W
         wbM6JGfHE01ix5dp3vkgRxV7NqruyA63Pt/4KQRDRj6Bo7Z5wWS9UtRPjN035J3/9ZpO
         XOFcerqs0RRz4wp0Jq5KFBXezXMvYkDto8pN9SUlulK69kLes+tAQ7aNyCiyA4Vx5blT
         Y/aA==
X-Gm-Message-State: AOAM533gUfdvRfHeJwBkdzwp+GRroxt2Rqo9zehkWd1TW/ZmQ2qyKkLg
	1AkcON7XvzxIcy0CH16fGNMr+BCw4ERZ1VZjxGI=
X-Google-Smtp-Source: ABdhPJzew+VNUZPYf6s+VxKO/zYQuSBs0hKpMYkad7Lnoey8w332IhsgiMAu20NOV5uYQ2OzvNTfYQMxwn0horM44Fs=
X-Received: by 2002:a05:6638:22c5:: with SMTP id j5mr11885698jat.89.1612127711054;
 Sun, 31 Jan 2021 13:15:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Sun, 31 Jan 2021 13:15:10
 -0800 (PST)
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Sun, 31 Jan 2021 13:15:10
 -0800 (PST)
In-Reply-To: <509abad9152214d2cb073912e89518082bb92857.camel@linuxfoundation.org>
References: <20210128195108.5247-1-dorindabassey@gmail.com> <509abad9152214d2cb073912e89518082bb92857.camel@linuxfoundation.org>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Sun, 31 Jan 2021 16:15:10 -0500
Message-ID: <CAJSnhzszhvySJQizqP4HtWyDh2kZCAnDrRtA5TFm1a80ekQuCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Qi.Chen@windriver.com
Content-Type: multipart/alternative; boundary="0000000000008ccf1e05ba38bba7"

--0000000000008ccf1e05ba38bba7
Content-Type: text/plain; charset="UTF-8"

Alright, I understand Thanks.
I've added the directories under pseudo control and sent a v3 patch to the
list.

Thanks,
Dorinda.


On Jan 30, 2021 12:01, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

On Thu, 2021-01-28 at 20:51 +0100, Dorinda wrote:
> added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to
avoid random failures generated.
>
> [YOCTO #14193]
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> added a condition for when {WORKDIR}={S}
>
>  meta/classes/sanity.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c6842ff549..63284b7917 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
>          if i and workdir.startswith(i):
>              status.addresult("You are building in a path included in
PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this
path.\n")
>
>
>
>
> +    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
expand=True).split(",")
> +    workdir = d.getVar('WORKDIR')
> +    sourcefile = d.getVar('S')
> +    if (workdir == sourcefile):
> +        for i in pseudoignorepaths:
> +            if i and sourcefile:
> +                if sourcefile.startswith(i) or i.startswith(sourcefile):
> +                    status.addresult("a path included in
PSEUDO_IGNORE_PATHS " + str(i) + " and ${S} (source files) path " +
str(sourcefile) + " are overlapping each other, please set ${S} in your
recipe to point to a different directory. \n")
> +
>      # Some third-party software apparently relies on chmod etc. being
suid root (!!)
>      import stat
>      suid_check_bins = "chown chmod mknod".split()


This isn't quite solving the problem in bug 14193. In that bug lets
say:

S = "${WORKDIR}/pack"

and this overlaps with ${WORKDIR}/package (PKGD) and
${WORKDIR}/packages-split (PKGDEST) which are set in package.bbclass.

So the sanity test we need here is to test whether any element of
PSEUDO_IGNORE_PATHS overlaps with directories we know need to be under
pseudo control. Qi already had a list of these in a different patch:

${D},${PKGD},${PKGDEST},${IMAGE_ROOTFS},${SDK_OUTPUT}

Cheers,

Richard

--0000000000008ccf1e05ba38bba7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Alright, I understand Thanks.<div dir=3D"auto">I&#39=
;ve added the directories under pseudo control and sent a v3 patch to the l=
ist.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div d=
ir=3D"auto">Dorinda.</div><br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Jan 30, 2021 12:01, &quot;Richard Purdie&quot; &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"elided-text">On Thu, 2021-01-28 at 20:51 +0100, Dorinda wrote:<br=
>
&gt; added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to =
avoid random failures generated.<br>
&gt; <br>
&gt; [YOCTO #14193]<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmai=
l.com">dorindabassey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt; added a condition for when {WORKDIR}=3D{S}<br>
&gt; <br>
&gt; =C2=A0meta/classes/sanity.bbclass | 10 ++++++++++<br>
&gt; =C2=A01 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass=
<br>
&gt; index c6842ff549..63284b7917 100644<br>
&gt; --- a/meta/classes/sanity.bbclass<br>
&gt; +++ b/meta/classes/sanity.bbclass<br>
&gt; @@ -710,6 +710,16 @@ def check_sanity_version_change(<wbr>status, d):<=
br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if i and workdir=
.startswith(i):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0status.addresult(<wbr>&quot;You are building in a path included in=
 PSEUDO_IGNORE_PATHS &quot; + str(i) + &quot; please locate the build outsi=
de this path.\n&quot;)<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 # Check if PSEUDO_IGNORE_PATHS and ${S} overlap<br>
&gt; +=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS=
&#39;<wbr>, expand=3DTrue).split(&quot;,&quot;)<br>
&gt; +=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
&gt; +=C2=A0 =C2=A0 sourcefile =3D d.getVar(&#39;S&#39;)<br>
&gt; +=C2=A0 =C2=A0 if (workdir =3D=3D sourcefile):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and sourcefile:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sourcefile=
.startswith(i) or i.startswith(sourcefile):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 status.addresult(&quot;a path included in PSEUDO_IGNORE_PATHS &quot; + str=
(i) + &quot; and ${S} (source files) path &quot; + str(sourcefile) + &quot;=
 are overlapping each other, please set ${S} in your recipe to point to a d=
ifferent directory. \n&quot;)<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Some third-party software apparently r=
elies on chmod etc. being suid root (!!)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0import stat<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0suid_check_bins =3D &quot;chown chmod mk=
nod&quot;.split()<br>
<br>
<br>
</div>This isn&#39;t quite solving the problem in bug 14193. In that bug le=
ts<br>
say:<br>
<br>
S =3D &quot;${WORKDIR}/pack&quot;<br>
<br>
and this overlaps with ${WORKDIR}/package (PKGD) and<br>
${WORKDIR}/packages-split (PKGDEST) which are set in package.bbclass.<br>
<br>
So the sanity test we need here is to test whether any element of<br>
PSEUDO_IGNORE_PATHS overlaps with directories we know need to be under<br>
pseudo control. Qi already had a list of these in a different patch:<br>
<br>
${D},${PKGD},${PKGDEST},${<wbr>IMAGE_ROOTFS},${SDK_OUTPUT}<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br></div></div></div>

--0000000000008ccf1e05ba38bba7--
