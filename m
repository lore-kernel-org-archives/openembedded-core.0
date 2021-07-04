Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.7763.1625393078001554866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 03:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aB5kY+xx;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id x125so2736892vkf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5puKwI2DKYxWVAuYX9viyH4qGZnzybGxhJkW6kVuG4=;
        b=aB5kY+xx+TYgwiAui9ccy51bTzydIMRSmc/odr+bhed+NXeQefh38WPYexWKqv1GJw
         es0Jzrh+UDmJTeW2YIHr8JAcpQC5eiFl2n35UVkQCErlqbdV8PzNby4Yuu8OAq32SdV2
         v2qga7Tk7pY7kfWcyncNpfXS68ipLSuqPAY7Qr6J+LRGoZIytBoX20sdbeIo/PsybEWi
         QgsmNacseaZIeI0dF0EgKLdL/i0LcqBpDE/61HumLdx/qrM2zF28Pmx2/lPiTLb4ByNr
         cdX33KPPEmE53swxyVrZXXW50ZZP83uooFMHpPC3cFc4AwWeAJJX8boNTlVQW99jX6i/
         lM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5puKwI2DKYxWVAuYX9viyH4qGZnzybGxhJkW6kVuG4=;
        b=OeMO6e0E/UPbAV0DRSEFXKenCiPFPtXd1A3+I2aVsFHWV5/p/lt8NMj9h7x14Vr26p
         FDKTo3pb2h15Te6WGhtbmdxrevpIxxUtFyxwdj6AUFXGpe88j27781o+penJ6aga8njb
         DX93si9iy23gChTfNuiHi/YnG5rwbBWpK40JhYRSCOQgaD+CvgP/fFYrpIagPGZLHiFt
         GjlT8VVimHQMkS7E+JfBPfbHBoPFM+eBQWK/CCepzimFSOufRxCJiPGGJaFPvz2DTUKv
         ey+RHk3+/rXA/owVAfHu7+DBBiCOEg3k4bHm/yxDFG0zt5/J+aD83174/K+Gbry+iRs4
         5Fgg==
X-Gm-Message-State: AOAM530ht6lhHshz2R+gMSBD9CBJdUdIVPMnf2P7vdkJtVRi6reWegeR
	M1Ns/3OAEuQiNU+En49Gzo57VIVf5xoXK7uWWW234P4DhAw=
X-Google-Smtp-Source: ABdhPJx9ehK44GgXtGSiOrNyERrq4PLrgai0hiRyCXxkMgmkjFfc0E5uTMLRx2W4VvSbYbYFuXrMAoazZuF7y6jwN78=
X-Received: by 2002:a1f:9303:: with SMTP id v3mr5584959vkd.16.1625393077136;
 Sun, 04 Jul 2021 03:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <MADEUP.168E8D48A1A5BDBD.5985@lists.openembedded.org>
In-Reply-To: <MADEUP.168E8D48A1A5BDBD.5985@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 4 Jul 2021 12:04:25 +0200
Message-ID: <CANNYZj89A2Sq6cRRd2=AqfNJMWVe-jUps9wfy7bs9dgp_LQMZQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] iputils: upgrading to s20200821 SUCCEEDED
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fbae7405c6495066"

--000000000000fbae7405c6495066
Content-Type: text/plain; charset="UTF-8"

Bogus update to an earlier version, please ignore. I sent a patch to
correct version check.

Alex

On Sun, 4 Jul 2021 at 11:45, <auh@auh.yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *iputils* to *s20200821*
> has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-iputils-upgrade-20210202-s20200821.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> 
>
>

--000000000000fbae7405c6495066
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Bogus update to an earlier version, please ignore. I =
sent a patch to correct version check.</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, 4 Jul 2021 at 11:45, &lt;<a href=3D"mailto:auh@auh.yoctoproject.=
org">auh@auh.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *iputils* to *s20200821* =
has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-iputils-upgrade-20210202-s202=
00821.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them i=
n the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-aut=
hor --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this ti=
me,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update =
failures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.=
org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer=
" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000fbae7405c6495066--
