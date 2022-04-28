Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182BBC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:50:55 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.7189.1651132253119928278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRpOiRfT;
 spf=pass (domain: gmail.com, ip: 209.85.166.176,
 mailfrom: rybczynska@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id b5so1475631ile.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qaN2vNAxM0Httec2Zu0G88OKHdieif1obP5RVJaL6xY=;
        b=kRpOiRfTsoiv3HgHCbdRapq7hBlNxWi18HEWgnRY0uFMnAIu0FpkgonaKyH2hodu4d
         Ea7UgfnQwl5jSO47MjXQn8Heye1eAsSBoI4sFT0OyhLgNzVjp45HEn1D9b9zIykqhZtP
         z4McKP5KmLvZsbSrzldmw5I5fKe68NoqctIRGz+y0Qmhk+IJz0LmzIMSvWU9olRvMbPg
         seWCNKvMgs6PUI1z3dzYt6mQiY2qVez9R1jW54F7ZYCdjToMnAul1vv41BfheYtzoHRS
         uIXahYXRCV2UxwYQAgVLY5BFz0RnBEz2KGAnNNiRJGhrqm/bbj6yXciHNhv5+TV8iMTZ
         13QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qaN2vNAxM0Httec2Zu0G88OKHdieif1obP5RVJaL6xY=;
        b=Fo1XQ2gCQw14YQbfjdVcyOQy/QcUmIshflrbbWasAToU2KOKza4N4mTSXGp81zSynN
         nr2ZgYIm8m1Xn61vpBlgolSXpjblITuX7GdpAZ0fw/HQeZjCj6mim+G3Yn8yi1ykpFuA
         FbtCYo8SDtGtmx2tp96q1lN+PmLONndqv9k2/hLK4ttB9HUn5nhICWssNwUP4WlF0AIK
         JKXN0yVlHp62LhDDDmyEhRjJLO818R3/njSrpDMbUW6ux9M1LMZU16cKY7HCZ5NttM7M
         MlZUj8M/sZdoh3LnssAhQyt7s9oF+bUatu/HL+dRFtuBC31IPe8Cd5vdbrjbQB1LVklL
         Z6Lw==
X-Gm-Message-State: AOAM532ie8Ozc6pKAJ2Y5hQk3HMvcX/6Fa/b+Q3tecyD6l7g5k7HxM2f
	KTHeHg0FHCNE4xem2K9qVh6NV/YP6ECx2Yo2HwQ=
X-Google-Smtp-Source: 
 ABdhPJzBCa4cxL0BZSgFPgt/6T+spi0nBxkWmhUG0pXa+F+dR1zuuN17BhEz2udABLffrSknYTtPz/OGRglXQEPYBQE=
X-Received: by 2002:a05:6e02:216b:b0:2cc:1f5f:207a with SMTP id
 s11-20020a056e02216b00b002cc1f5f207amr12137939ilv.225.1651132252483; Thu, 28
 Apr 2022 00:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220427114339.1174686-1-ross.burton@arm.com>
In-Reply-To: <20220427114339.1174686-1-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Apr 2022 09:50:41 +0200
Message-ID: 
 <CAApg2=S-j36jH19Jjtn7ha2GPKS+0zLmSWYHzXrF9SV_QX5p2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve_check: skip remote patches that haven't
 been fetched when searching for CVE tags
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000062f3ec05ddb22ffd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 07:50:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164934

--00000000000062f3ec05ddb22ffd
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 1:43 PM Ross Burton <ross.burton@arm.com> wrote:

> If a remote patch is compressed we need to have run the unpack task for
> the file to exist locally.  Currently cve_check only depends on fetch so
> instead of erroring out, emit a warning that this file won't be scanned
> for CVE references.
>
> Typically, remote compressed patches won't contain our custom tags, so
> this is unlikely to be an issue.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oe/cve_check.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index e445b7a6ae..dc7d2e2826 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -89,9 +89,10 @@ def get_patched_cves(d):
>      for url in oe.patch.src_patches(d):
>          patch_file = bb.fetch.decodeurl(url)[2]
>
> +        # Remote compressed patches may not be unpacked, so silently
> ignore them
>          if not os.path.isfile(patch_file):
> -            bb.error("File Not found: %s" % patch_file)
> -            raise FileNotFoundError
> +            bb.warn("%s does not exist, cannot extract CVE list" %
> patch_file)
> +            continue
>
>          # Check patch file name for CVE ID
>          fname_match = cve_file_name_match.search(patch_file)
> --
> 2.25.1
>
> Tested-by: Marta Rybczynska <marta.rybczynska@huawei.com>

--00000000000062f3ec05ddb22ffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 1:43 PM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If a r=
emote patch is compressed we need to have run the unpack task for<br>
the file to exist locally.=C2=A0 Currently cve_check only depends on fetch =
so<br>
instead of erroring out, emit a warning that this file won&#39;t be scanned=
<br>
for CVE references.<br>
<br>
Typically, remote compressed patches won&#39;t contain our custom tags, so<=
br>
this is unlikely to be an issue.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/cve_check.py | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py<br>
index e445b7a6ae..dc7d2e2826 100644<br>
--- a/meta/lib/oe/cve_check.py<br>
+++ b/meta/lib/oe/cve_check.py<br>
@@ -89,9 +89,10 @@ def get_patched_cves(d):<br>
=C2=A0 =C2=A0 =C2=A0for url in oe.patch.src_patches(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch_file =3D bb.fetch.decodeurl(url)[2]=
<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remote compressed patches may not be unpacke=
d, so silently ignore them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isfile(patch_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;File Not found: %=
s&quot; % patch_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise FileNotFoundError<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s does not exist,=
 cannot extract CVE list&quot; % patch_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check patch file name for CVE ID<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fname_match =3D cve_file_name_match.searc=
h(patch_file)<br>
-- <br>
2.25.1<br>
<br></blockquote><div>Tested-by: Marta Rybczynska &lt;<a href=3D"mailto:mar=
ta.rybczynska@huawei.com">marta.rybczynska@huawei.com</a>&gt;</div><div> <b=
r></div></div></div>

--00000000000062f3ec05ddb22ffd--

