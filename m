Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.6230.1623743142107185138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 00:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GjDaWdXr;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id x8so9280338vso.5
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GbZWfh3eEcog4f8TqC70lAx6BYrye/OgHTh9hZ9Lw4w=;
        b=GjDaWdXrSUgVfAbP8OOpi6mS5DTu8BhIn/UKEUIJkOTORuUE3KrIbWSoK5S7BQVVXi
         kVt8Gwc6Vt8QREqZ5TnuYaZ18kD27dTGf+1Nv8O8EsImxbzVggSV9V3q03FfLqsdNzFq
         uC2Ww6G7TH11GqdjXhCDk8o46M7999YqposzozGQP5dgFqsfu1w6+rT1ldh0MyJxo+sK
         DpCuoNTT8nah5jCOtyRTxJ02UXkPtyPN53iDWcx55ML2GbGtMKs6hL5JVrIucQ9ORsKf
         iKHr/iMvyQqoZID8vzJu0LZExPqSIX8IZ6Hh4T4EUXsRvgqo9ObWbKv8g+2plTeYxp3B
         15Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbZWfh3eEcog4f8TqC70lAx6BYrye/OgHTh9hZ9Lw4w=;
        b=QNfprpRS2qbJ12My/wl482QwRfjz5ecnqTOzEcO9UHJvXBO8T4Ab9O2BM4SkDaHVe1
         27L4kU+aSNEFD7PesWKHfLadJgWTmc1DVJ6yag1VOVT3nwzbuyypcZHOZNFSkS7tXG3i
         UxNFEQUV4MUaB6hGVmy656O1XgRTEPXpw7f0slTzhidTTFtWu4rpHPMUlpTipKVpjwya
         WFcoR0Q7f1qqbba6zkP0IzuOB8EfkPdrm0zh4R3+Wy9q7sFqR0r8xNPqIBed5YnFbFRW
         NTEclRgQcYjOg4IPciMYDVErMEKM195wy+ipwwBVA6GcHbFqQ/qmemYyho2E0nhl/QTC
         In3Q==
X-Gm-Message-State: AOAM531EVuWw7JUrQ+hSyNhnpZrlkXar1ve6McqybLICQ5b/FHXweAcQ
	Txc8yAz2TVRAGfK+yOXRhMZLG39PONo5FogEfW8=
X-Google-Smtp-Source: ABdhPJwoY3NN0E+Ntt4hFW20FMTkjoQGkQzM9voRwLktrZRL0M538XhkvtezcUfmLMfYhE/Ip/+uP+mPMbU2ipzQdc8=
X-Received: by 2002:a67:1005:: with SMTP id 5mr3152547vsq.51.1623743141220;
 Tue, 15 Jun 2021 00:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
 <1622704403-26153-4-git-send-email-wangmy@fujitsu.com> <25117a5d416119bb7432e250b9d5377d073c4251.camel@linuxfoundation.org>
 <CANNYZj89iHOP5mw2FLbt1Rqss=UE+E2C3KtXdzUswOaXSYwCiw@mail.gmail.com> <TY1PR01MB1852BE1DC0AE0339F6C588B5DC309@TY1PR01MB1852.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1852BE1DC0AE0339F6C588B5DC309@TY1PR01MB1852.jpnprd01.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 15 Jun 2021 09:45:29 +0200
Message-ID: <CANNYZj_kF4SoMgeB_HZZZB+dC5ZDwRGFTFJP-t7MRid9RVTnEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: upgrade 2.36.2 -> 2.37
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000023949505c4c929ff"

--00000000000023949505c4c929ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jun 2021 at 03:42, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:

> I used devtool upgrade util-linux and generated the directory of
> util-linux under the build directory.
>
> However, because it=E2=80=99s failed to apply the patch, it only modified
> SRC_URI[sha256sum] in the final recipe.
>
> Therefore, when I encounter OSS that cannot be automatically updated, I
> modify the patch manually.
>
> Is my usage of devtool upgrade wrong?
>
>
The workflow actually consists of three or four steps:
1. 'devtool upgrade util-linux'
2. If devtool tells you it couldn't rebase the patches, you need to
complete the job. Change to workspace/source/util-linux, and resolve the
conflicts by editing the files where they happened (git rebase leaves
conflict markers in the files), then 'git rebase --continue' until rebase
completes.
3. At this point you might want to run 'bitbake util-linux' to quickly
check that the new version builds correctly out of that external source
tree.
4. This is the important step you've been missing: 'devtool finish
util-linux path/to/poky/meta'. This puts the updated recipe and patches
back into the layer, and you can then make a commit out of it, if it looks
ok.

Please try this now.

Alex

--00000000000023949505c4c929ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 15 Jun 2021 at 03:42, <a href=3D"mailto:wangmy@fujitsu.com">=
wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fuj=
itsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"ZH-CN">
<div class=3D"gmail-m_261500896696147115WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:=E7=AD=
=89=E7=BA=BF" lang=3D"EN-US">I used devtool upgrade util-linux and generate=
d the directory of util-linux under the build directory.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:=E7=AD=
=89=E7=BA=BF" lang=3D"EN-US">However, because it=E2=80=99s failed to apply =
the patch, it only modified SRC_URI[sha256sum] in the final recipe.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:=E7=AD=
=89=E7=BA=BF" lang=3D"EN-US">Therefore, when I encounter OSS that cannot be=
 automatically updated, I modify the patch manually.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:=E7=AD=
=89=E7=BA=BF" lang=3D"EN-US">Is my usage of devtool upgrade wrong?<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:=E7=AD=
=89=E7=BA=BF" lang=3D"EN-US"></span><span lang=3D"EN-US"></span></p></div><=
/div></blockquote><div><br></div><div>The workflow actually consists of thr=
ee or four steps:</div><div>1. &#39;devtool upgrade util-linux&#39;</div><d=
iv>2. If devtool tells you it couldn&#39;t rebase the patches, you need to =
complete the job. Change to workspace/source/util-linux, and resolve the co=
nflicts by editing the files where they happened (git rebase leaves conflic=
t markers in the files), then &#39;git rebase --continue&#39; until rebase =
completes.</div><div>3. At this point you might want to run &#39;bitbake ut=
il-linux&#39; to quickly check that the new version builds correctly out of=
 that external source tree.</div><div>4. This is the important step you&#39=
;ve been missing: &#39;devtool finish util-linux path/to/poky/meta&#39;. Th=
is puts the updated recipe and patches back into the layer, and you can the=
n make a commit out of it, if it looks ok.</div><div><br></div><div>Please =
try this now.<br></div><div><br></div><div>Alex<br></div><div><br></div></d=
iv></div>

--00000000000023949505c4c929ff--
