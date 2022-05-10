Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA83BC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:02:35 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.11202.1652194946888127162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=obSwTkb9;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2371694pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3eBHjFf347awy66KJuxJcaLkKLoNHG/j9+k11EtATCk=;
        b=obSwTkb9Y3uSr1tHRJeQNPPESRiEkNeSbmclMXs8N0EgxGKuWt/hUaW24SupsusisP
         FDSDxidMj2QkqHEYOH9efgnljbyxQw4CoH7u/r3rmVgS1EvYMf1ZosJ48+PQeBh1oDSX
         uXECenk7XsU7YJsa22nZNtCkoBPl+Nuue5hp1jFlHrHkSzE1OVxgLM1uUuNACuNl+b0M
         IRE3H1c1HV3BeBH1Fpq0PKFVz7RosZcGmXTwtqe3T77m2cWjb5697XIs48ojyMg/tEPR
         xy76IqKI39wynkp7QzFxoL8Knxcbuz6YQj+65e/vg0c07RuOwuMw4DDr4gh4UwcMBgBT
         xh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3eBHjFf347awy66KJuxJcaLkKLoNHG/j9+k11EtATCk=;
        b=LCwOXzSX2wGkWC/JmluqlK2EGCJ2Fk7oxoiDkDiLOgd47KvIxq3VQR/YpeKI6UtjmX
         EcrXiwvMOL9Lywf/5CW8e0D2RFAiKRSByvw9rXr8KiCXUXZMzGJdT/XstCC/uDCM2/zN
         3rJF5UiS1N5kcuxtTL7kLT0ZoAVvjS3K5flg86qvORZVnZuASTdRinkEpPGgHtcF84TY
         BiZrAlpnTYKM3NdjzRCgHx0YZwDaAtFyX+DjKkDKonikcim9vqPp93QqeNiE2nJaihdu
         5vFLF0xDPJcDck6jgxO4DzSpJUC2tgu3CtTV/Sbm9aQLe6wxh17PyOtgxLCYM2xjdCt3
         eR3Q==
X-Gm-Message-State: AOAM532RIzCovdUMamYuUDpcqt1jGmrMDUYIOfc86ILqm9ov7/O4Fp7z
	YsMzePkeztb2YIAx+WlPa2yLDrVMZOmjeF1UTNg=
X-Google-Smtp-Source: 
 ABdhPJx8CUPrzjLwk61OpgIqV6Y/Y+DsDwXpnG+kUjeW6WS0sDi1WFWFQv8iqrYwW2QlcKbySlVKGyk9Bmkl0d56alo=
X-Received: by 2002:a17:903:40cb:b0:15f:c1f:5f87 with SMTP id
 t11-20020a17090340cb00b0015f0c1f5f87mr11020633pld.83.1652194946212; Tue, 10
 May 2022 08:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
 <16ED214F51D113CA.5869@lists.openembedded.org>
 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
 <CAApg2=TNtVc1Zb4_1pD2Vd53338++wPa+Lwj4QUVJaBdMwkjiQ@mail.gmail.com>
 <16ED76DCD3B51CA1.18911@lists.openembedded.org>
In-Reply-To: <16ED76DCD3B51CA1.18911@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 10 May 2022 17:02:14 +0200
Message-ID: 
 <CAApg2=Tx+WXk4U16j61GHLb6KFwfOdXxyrsXLVUQAwN2nePOxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000de685e05dea99ced"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 15:02:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165458

--000000000000de685e05dea99ced
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 4:42 PM Marta Rybczynska via lists.openembedded.org
<rybczynska=gmail.com@lists.openembedded.org> wrote:

>
>
> On Mon, May 9, 2022 at 12:40 PM Marta Rybczynska <rybczynska@gmail.com>
> wrote:
>
>>
>>
>> On Sun, May 8, 2022 at 6:45 PM Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie via
>>> lists.openembedded.org wrote:
>>> > Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.
>>> >
>>> >
>>>
>>> I'm amending this to "Include fix for CVE-2022-27404" since CVE-2022-
>>> 27405 and CVE-2022-27406 were already in 2.12.0.
>>>
>>> I don't think the CVE checker is going to like these as they're using
>>> dates for these for reasons I don't understand.
>>>
>>>
>> They also include versions in the NVD, but there is no version "
>> non-afected"
>> as of today for CVE-2022-27404. I'll figure out the exact versions for
>> those
>> CVEs and update the NVD in the next hours.
>>
>> Kind regards,
>> Marta
>>
>
> Update: the message to NVD has been sent. According to my analysis all
> three
> CVEs have been fixed in 2.12.0.
>

The change is up in NVD. The next run of the cve-check should see it.

Regards,
Marta

--000000000000de685e05dea99ced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 9, 2022 at 4:42 PM Marta =
Rybczynska via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, May 9, 2022 at 12:40 PM Marta Rybczynska &lt;<a href=3D"mailto:rybczy=
nska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, May 8, 2022 at 6:45 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie v=
ia<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.<br>
&gt; <br>
&gt; <br>
<br>
I&#39;m amending this to &quot;Include fix for CVE-2022-27404&quot; since C=
VE-2022-<br>
27405 and CVE-2022-27406 were already in 2.12.0.<br>
<br>
I don&#39;t think the CVE checker is going to like these as they&#39;re usi=
ng<br>
dates for these for reasons I don&#39;t understand.<br>
<br></blockquote><div><br></div><div>They also include versions in the NVD,=
 but there is no version &quot;<span style=3D"background:rgba(0,0,0,0) none=
 repeat scroll 0% 0%">non-afected</span>&quot;</div><div>as of today for CV=
E-2022-27404. I&#39;ll figure out the exact versions for those</div><div>CV=
Es and update the NVD in the next hours.</div><div><br></div><div>Kind rega=
rds,</div><div>Marta<br></div></div></div></blockquote><div><br></div><div>=
Update: the message to NVD has been sent. According to my analysis all thre=
e</div><div>CVEs have been fixed in 2.12.0.</div></div></div></blockquote><=
div><br></div><div>The change is up in NVD. The next run of the cve-check s=
hould see it.</div><div><br></div><div>Regards,</div><div>Marta<br></div></=
div></div>

--000000000000de685e05dea99ced--

