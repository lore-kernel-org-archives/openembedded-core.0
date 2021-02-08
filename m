Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web12.28563.1612742578398760882
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 16:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ff9cK5Oc;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id n201so13181408iod.12
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 16:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=PYGA1jXs7vjPXq3z1hd4hyOnH2szbrFAWQYqnHpm4lE=;
        b=ff9cK5Oc12lUvhbXhK4vaAd+7tr7W7eyxaS545H9jx/jP4MuHV2yGdatOeyihqYM+U
         bMYijTaeuoz9WPznem+R2F/427et44/RBS10kvsGz2av8NCIUHPMRvuOQxIMkWvwbQ0s
         2jO1Jt6WmkjmKdNb8dpBsToVzPQMJhY2+Doyf9Ne6OzmjkX5IxHU0B6psiZqqBEuNwgp
         nSncPpcnzBuL1kHqnyWaqaC+/kTCRCUrBbS3Uwvjslz7DCELRpxHimllWUPqO4WilmLq
         Aa5CSevn+RU70t01xLfCdzHhB85Y21EswpKsysJnHujT3LEPjf2m1YyEp7WGtRjlEKsx
         qP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=PYGA1jXs7vjPXq3z1hd4hyOnH2szbrFAWQYqnHpm4lE=;
        b=Lfc/h5lJbLtF/P2f9+udnajpbLiDBWlBYeVh9VEbOuU28V3FSN44LKLVKAzT1pwKht
         o8gkgHHKzqqS1e0p8D8yBMM7XzsVxHlbMEyyHUYOnIiZijEmkSxM2MPv1u9PWqL71V4s
         aBICP6zXGZFFWgzkA9yy68V4FE0YdC1hmpyW1WC6dHpqfmQDFINUoIGbsi/lmvXSv7fT
         R2K99v0HMpjbSltLRkht1yPyG/uQT9wUGh+IVzt4DohzLAUglz4C6l6bM/zA4P18xoUP
         rbGhEOQRgPHyJl7Jgr28tzxYYsvCk54lZxNiMSqGw1sJZFF3KM2xrbT7m2t2o8L0YIGo
         5+PQ==
X-Gm-Message-State: AOAM533vGfy3+dnNxTB5A/+Yu92IsiKPxGfJRneOE4Z684pEyATFC0Ld
	42SemozGCmqaxFNkuJigRKc4D7rhdQR5Kme2n8NPgSrpnFM=
X-Google-Smtp-Source: ABdhPJyyeBEp/Hq2cX4dH6Wh7npCjFl9882u4WQ33piuMt8pD93Gglhjqz84eS7/EzgFo/dClqujZQGIkFAgamiA6Ic=
X-Received: by 2002:a02:6014:: with SMTP id i20mr14897946jac.101.1612742577547;
 Sun, 07 Feb 2021 16:02:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Sun, 7 Feb 2021 16:02:57
 -0800 (PST)
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Sun, 7 Feb 2021 16:02:57
 -0800 (PST)
In-Reply-To: <20210201144638.15582-1-dorindabassey@gmail.com>
References: <20210201144638.15582-1-dorindabassey@gmail.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Sun, 7 Feb 2021 19:02:57 -0500
Message-ID: <CAJSnhztAzUkS_kc2zbmoALzD9Y+pN2j9prGjxFoxYxd3iJEGqA@mail.gmail.com>
Subject: Re: [PATCH v2] oe-pkgdata-util: Check if environment script is initialized
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000072eba805bac7e44a"

--00000000000072eba805bac7e44a
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,
Just a friendly reminder to review this patch.

Thanks,
Dorinda.

On Feb 1, 2021 3:46 PM, "dorindabassey" <dorindabassey@gmail.com> wrote:

> Tinfoil doesn't behave well if environment is not initialized, this check
> ensures a proper error log if environment is not initialized.
>
> [YOCTO #12096]
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> -Positioned check under a condition when it cannot determine the
> pkgdata_dir
>
>  scripts/oe-pkgdata-util | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 93220e3617..75dd23efa3 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -598,6 +598,9 @@ def main():
>              logger.error("Unable to find bitbake by searching parent
> directory of this script or PATH")
>              sys.exit(1)
>          logger.debug('Found bitbake path: %s' % bitbakepath)
> +        if not os.environ.get('BUILDDIR', ''):
> +            logger.error("This script can only be run after initialising
> the build environment (e.g. by using oe-init-build-env)")
> +            sys.exit(1)
>          tinfoil = tinfoil_init()
>          try:
>              args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
> --
> 2.17.1
>
>

--00000000000072eba805bac7e44a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Everyone,<div dir=3D"auto">Just a friendly reminder to=
 review this patch.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Than=
ks,</div><div dir=3D"auto">Dorinda.</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Feb 1, 2021 3:46 PM, &quot;dorindabassey&q=
uot; &lt;<a href=3D"mailto:dorindabassey@gmail.com" target=3D"_blank">dorin=
dabassey@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Tinfoil doesn&#39;t behave well if environment is not initial=
ized, this check ensures a proper error log if environment is not initializ=
ed.<br>
<br>
[YOCTO #12096]<br>
<br>
Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmail.com=
">dorindabassey@gmail.com</a>&gt;<br>
---<br>
v2:<br>
-Positioned check under a condition when it cannot determine the pkgdata_di=
r<br>
<br>
=C2=A0scripts/oe-pkgdata-util | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util<br>
index 93220e3617..75dd23efa3 100755<br>
--- a/scripts/oe-pkgdata-util<br>
+++ b/scripts/oe-pkgdata-util<br>
@@ -598,6 +598,9 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Unable t=
o find bitbake by searching parent directory of this script or PATH&quot;)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#39;Found bitbake path: %s&=
#39; % bitbakepath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.environ.get(&#39;BUILDDIR&#39;, &#39=
;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;This script c=
an only be run after initialising the build environment (e.g. by using oe-i=
nit-build-env)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfoil =3D tinfoil_init()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.pkgdata_dir =3D tinfoi=
l.config_data.getVar(&#39;<wbr>PKGDATA_DIR&#39;)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000072eba805bac7e44a--
