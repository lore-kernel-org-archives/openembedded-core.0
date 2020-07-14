Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web12.6715.1594761776704614148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 14:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O0sjoyWc;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id t187so4027581vke.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=do6LV9nDf3zE9FCwPVs5DuMlpAkYSL7N46FgEyLKEYE=;
        b=O0sjoyWcx5RvMfCCJpfcGqVxe1uzsDy5/2Ts0/gmnEGm6lhPBEaLu+zRCJUPeAII8N
         vfYtEqPQaexnfQ+r2Qs8ZSkadHeFC2J3q2O7hRy6IY3Zk+E2iXCCk6dWezmXQdhoyLZ2
         fcdGghLs8lxtNxFb1opSANFgSLlgsF9Q2loODxef+2jrCA3jn24hZDeF6l9OZU/wKJgQ
         NiXCbxwt1gr6RCwIJkfhoB/YoX5hdKYqRfA3oQnVi4DnfGDDM5VTgKAO/So0R1cvlOlp
         jHzxQhQMInxv2J2T7iTFL5wYZ/Bplpm8fqMDBYy9uj1KBjdXsIyU5rVJ0vzGESESfZGW
         jikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=do6LV9nDf3zE9FCwPVs5DuMlpAkYSL7N46FgEyLKEYE=;
        b=W63AxG4T1AcTwWpQTJPTU43Sv+peuetH2OpIA6C65CkNxD+w3BGvMaOaXnilfYfodt
         YhTP1rvD/0n1/yBD7zz9RpQd5EnjqK0B1Dit5j9jupqJD4/LU6yzrs2NLdBhBEbFvqas
         cqdgUKMYiNjDHa+yD0vdZNRAXbusg60VbMcgMwPOU7OS/45WOnzi9JZDSaOCwK4ugwdp
         yX80HtSAN2JmK0Dan/8fKNO8fnLnOdQ43LnKX13Ot5Tde389fDrIZ1oL2jiDKnD3I0OK
         0UYR/lC3YpRCdSCYpbALrgXMGVtK/5jOs79Pkp+nMUeTc6Ht3qC+3Lams46b17i9b+3+
         e42A==
X-Gm-Message-State: AOAM533IV6MCyWzVY3cHig7zoudYK+jgIyJuoy8LtAQQBEVKWgn7M6Et
	lXjv+yzkDbLNeNUfMpAbyjHA4/9wJI4TW2I2pG4=
X-Google-Smtp-Source: ABdhPJw+DN9Ljt+n3TwoaXNXBTqw6sks8ZIhIMrdYhls5eBweNwscy7BctGj81NxfkfEPlUzSMaxstuBLtdEG/RUOmo=
X-Received: by 2002:ac5:cdf5:: with SMTP id v21mr5349756vkn.1.1594761775925;
 Tue, 14 Jul 2020 14:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5OMZ8KP=CriR-gsRsiq223_r-N7+yT6Y9_AvPddQb3Fbuscw@mail.gmail.com>
In-Reply-To: <CAA5OMZ8KP=CriR-gsRsiq223_r-N7+yT6Y9_AvPddQb3Fbuscw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2020 23:22:44 +0200
Message-ID: <CANNYZj_fsrhc02Ox9HZ0npEyU4Wa+2tzWUp7OmADctMaH4o8fg@mail.gmail.com>
Subject: Re: [OE-core] tinymembench: fix patch fuzz
To: mircea.carausu@broadcom.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027cbff05aa6d69c5"

--00000000000027cbff05aa6d69c5
Content-Type: text/plain; charset="UTF-8"

You can start here:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Alex

On Tue, 14 Jul 2020 at 20:50, Mircea Carausu via lists.openembedded.org
<mircea.carausu=broadcom.com@lists.openembedded.org> wrote:

> Hello,
> I am new to the list and up-streaming activities.
> Could you please kindly guide me how to submit a fix for the existing
> tinymembench.patch
>
> (meta-openembedded/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch)
> Problem:
>
> tinymembench patch does not apply cleanly (it succeeds with warnings -
> fuzz detected). Used devtool to fix:
>
> devtool modify tinymembench devtool finish --force-patch-refresh
> tinymembench ../meta-openembedded/meta-oe
>
> I already generated the new patch.
>
> What are the next steps (other than local verification).
>
> Should I just upload it here for review once I consider it ready for
> review?
>
> Sorry for asking such basic questions....
>
> Many thanks,
>
> Mircea
>
>
> 
>

--00000000000027cbff05aa6d69c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can start here:</div><div><a href=3D"https://www.=
openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.op=
enembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></div><div><br=
></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, 14 Jul 2020 at 20:50, Mircea Carausu via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;mi=
rcea.carausu=3D<a href=3D"mailto:broadcom.com@lists.openembedded.org">broad=
com.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">Hello,<div>I am new to the l=
ist and up-streaming activities.</div><div>Could you please kindly guide me=
 how to submit a fix for the existing tinymembench.patch</div><div>(meta-op=
enembedded/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Del=
ete-.func-.endfunc-directives.patch)</div><div>Problem:</div><div><p style=
=3D"white-space:pre-wrap;color:rgb(53,53,53);font-family:sans-serif">tinym=
embench patch does not apply cleanly (it succeeds with warnings - fuzz dete=
cted).
Used devtool to fix:</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,5=
3);font-family:sans-serif">  devtool modify tinymembench
  devtool finish --force-patch-refresh tinymembench ../meta-openembedded/m=
eta-oe</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53);font-family:=
sans-serif">I already generated the new patch. <br></p><p style=3D"white-sp=
ace:pre-wrap;color:rgb(53,53,53);font-family:sans-serif">What are the next =
steps (other than local verification). </p><p style=3D"white-space:pre-wrap=
;color:rgb(53,53,53);font-family:sans-serif">Should I just upload it here f=
or review once I consider it ready for review?</p><p style=3D"white-space:p=
re-wrap;color:rgb(53,53,53);font-family:sans-serif">Sorry for asking such b=
asic questions.... </p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53)=
;font-family:sans-serif">Many thanks,</p><p style=3D"white-space:pre-wrap;c=
olor:rgb(53,53,53);font-family:sans-serif">Mircea<br></p><p style=3D"white-=
space:pre-wrap;color:rgb(53,53,53);font-family:sans-serif"><br></p></div></=
div>
<br>
</blockquote></div>

--00000000000027cbff05aa6d69c5--
