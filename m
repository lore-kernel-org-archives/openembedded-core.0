Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.3597.1630565791881555690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DsVa5Dn9;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: grembeter@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id t4so999911qkb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ibstRmg6Hpu9BQUXQCbUO2wcuRcvk21zNNnd//PpFBM=;
        b=DsVa5Dn9MXH4pPn774wUuL/l/kCByoSmmN8Ys7g57pCbLSK2oz1krSdj5f76eAO07Y
         h+U3ARvOyeku1pGt7DDXRnmI4pSVYh68Tx73tlH07FXaUTjs9HH384XdW8PayIdcL8iX
         JQkZeT0RO8bGhCpUdjPlV7YMr9N25QJiYVHxh9ged2qkz3Pz8O+HujgLtlBO8QRE1WOs
         IBonYFR33iGp7xl+V1xgs84Eh0N12IIKziuxUxw5hKhfL+dWseZGmgR7zMl1A+JracBu
         Mh35bpbom3sMuvB4Kydrj45b40lQIMgkbUE3CxBQDD50fZH9uMqJgR/Bow3lpRsoeVg7
         4/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ibstRmg6Hpu9BQUXQCbUO2wcuRcvk21zNNnd//PpFBM=;
        b=phjWqYZxM9ukQfnJ/Ikxv3VcCj+omAc3Gri1McfCPGkH1VANAs0be2QZ6yJXzlRKrV
         AeV+WG+X06izClm+U7GChnsYovUSSkX1L5ABVExt9DAsv/WD+aJVcrUZdhB/se1CHKcZ
         HoHpbXUDtDHegnbxsuQ3DR12D0aUbGqMqBRKCoJeHe46rwtcXZT1Cu7XDLlGeteAD9a7
         aYnLjb8csfs6SL+jBD88D+yY0jVsVcB9TgioaB1npWf1cXg7SBsFX8n1xJ8Q1l0P8i3J
         rbnqtjJZdu0Iv9NQAUYtOfYKmN5jLqvCSnnmLSHr4wsiKkyTx2yXoGU7KC6W8VpJ9HVv
         mV7g==
X-Gm-Message-State: AOAM531Ha34qHwEZyZfQB37qk6HvZBYWhh3A18aIP2bHSHz1MHAnSrpH
	jRzkO3mqWQfkegivxxhQfXQelut04AgE0i4Q+tk=
X-Google-Smtp-Source: ABdhPJwlE4HQly5V6mGUOxRTY7yS0SlM3Qf8paGzsy85JSza8xpz02eSP3n91+llxp24paTDYdsjYTiQ0MZcSNHt++0=
X-Received: by 2002:ae9:dd43:: with SMTP id r64mr1820234qkf.225.1630565790879;
 Wed, 01 Sep 2021 23:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210901193329.2911525-1-grembeter@outlook.com> <CAOSpxdaKcD_Rs_f9Sz2jp8hMkS2V_UhhJ5JtA9C42oz9g9Stpw@mail.gmail.com>
In-Reply-To: <CAOSpxdaKcD_Rs_f9Sz2jp8hMkS2V_UhhJ5JtA9C42oz9g9Stpw@mail.gmail.com>
From: "gr embeter" <grembeter@gmail.com>
Date: Thu, 2 Sep 2021 08:56:20 +0200
Message-ID: <CAGFuAuwQnFxQCX3s4FF9n9XVu2kDx-vLNiQiX3qrti=FnM01ZQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] Revert "sdk: fix relocate symlink failed"
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	grygorii tertychnyi <grembeter@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 12:33 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Wed, Sep 1, 2021 at 9:33 AM grygorii tertychnyi <grembeter@gmail.com> =
wrote:
> >
> > This reverts commit a155c4d4ca841ef492213a5f0b9121703c62e2b4.
> >
> > Otherwise, SDK installing fails with:
> >
> > Extracting SDK.........................................................=
..done
> > Setting it up...sed: -e expression #1, char 0: no previous regular expr=
ession
> > sed: -e expression #1, char 0: no previous regular expression
> > ... tonns of lines ...
> > sed: -e expression #1, char 0: no previous regular expression
> > done
> > SDK has been successfully set up and is ready to be used.
>
> I can confirm the above noise from sed in dunfell, though the SDK does
> seem to be set up successfully as the above message indicates. I have
> verified that I can use the resulting sdk to build a test app.

Actually, in my case all symlinks are wrong. I installed the SDK in a
non-default
path with "-y -d <path>" but all symlinks point to default path:

 =C2=BB l ./sysroots/x86_64-leicasdk-linux/bin/zcat
lrwxrwxrwx 1 gr grygorii 61 2021-09-02 08:37
./sysroots/x86_64-leicasdk-linux/bin/zcat ->
/opt/geosurv/3.1/sysroots/x86_64-leicasdk-linux/bin/zcat.gzip

instead of

 =C2=BB l ./sysroots/x86_64-leicasdk-linux/bin/zcat
lrwxrwxrwx 1 gr grygorii 67 2021-09-02 08:26
./sysroots/x86_64-leicasdk-linux/bin/zcat ->
/geo/wok/1/sdk-try/sdk/sysroots/x86_64-leicasdk-linux/bin/zcat.gzip

So, it breaks our workflow now.

> Also I can confirm that
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14444 is fixed with
> "sdk: fix relocate symlink failed" (in both master and dunfell)

Are you sure it is "sdk: fix relocate symlink failed"
https://git.openembedded.org/openembedded-core/commit/?id=3Da155c4d4ca841ef=
492213a5f0b9121703c62e2b4?
It does not look related to this bug.

> > Original commit message mentions commit bc4ee54535 ("sdk: Decouple
> > default install path from built in path"), that is not part of
> > dunfell. Hence, revert this fix.
>
> Adding "sdk: Decouple default install path from built in path" to
> dunfell eliminates the sed noise you were encountering.
>
> So I think we want both "sdk: fix relocate symlink failed" and "sdk:
> Decouple default install path from built in path" in dufell.

I confirm that adding "sdk: Decouple default install path from built in pat=
h"
to dunfell fixes "sed" issues.

So, most probably instead of reverting "sdk: fix relocate symlink failed"
we need to add "sdk: Decouple default install path from built in path"
to dunfell.

And handknott : )

> Thoughts Richard?  I know you were worrying about this.
>
> Steve
>
>
> > Signed-off-by: grygorii tertychnyi <grembeter@outlook.com>
> > ---
> >  meta/files/toolchain-shar-relocate.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolcha=
in-shar-relocate.sh
> > index ba873373e29e..54337412966c 100644
> > --- a/meta/files/toolchain-shar-relocate.sh
> > +++ b/meta/files/toolchain-shar-relocate.sh
> > @@ -72,7 +72,7 @@ fi
> >
> >  # change all symlinks pointing to @SDKPATH@
> >  for l in $($SUDO_EXEC find $native_sysroot -type l); do
> > -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUIL=
D_PATH:$target_sdk_dir:") $l
> > +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_=
INSTALL_DIR:$target_sdk_dir:") $l
> >         if [ $? -ne 0 ]; then
> >                 echo "Failed to setup symlinks. Relocate script failed.=
 Abort!"
> >                 exit 1
> > --
> > 2.30.2
> >
