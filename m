Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B1FC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 00:06:29 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.4791.1642723588742952931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhOsn8k4;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id y4so14002645uad.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rYaTqC3PwTZ5Mk2Z8dpaXcSW6JOuao3La7kfr0oXL2A=;
        b=NhOsn8k4/gIvjodV3yyOJlXOam5Fh9UGTHu8nhFGMnYnpERhEjwpdqGUtJajazWKRs
         4Pz3+bEMhKXujkQCp50dYz4ykhTnElSHLJEKq/P+FwHK1WmzjyblLqFUwWMuiExUIgWK
         B3pXb5rBt9liJAYlVyqkjZJ20+zq4BykS544PGbnKZpCEKeQvtOEoo6o3Ne/vdcZtQHX
         t4IK93ckJiuIvy0zIetiOHPumbnfu7ACOgZUHPsAKrTlay8xSeaINCTzE91gJguqzMNp
         HDZRRg2VqiAkNbYUGrM1tflfiKIy+cWllc87eMmkMVj0JH04NJpDaOycJVtM6GBmLm9B
         aVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rYaTqC3PwTZ5Mk2Z8dpaXcSW6JOuao3La7kfr0oXL2A=;
        b=TVjTUcjY1z4qSmNFl7fjSWXd1YwAGX5n1QLKb7yiGS6rQBo/QjvvHejH4yXqiJeL5f
         bVbx7mVgmS4e/aN2xNtQ4WVtA7iR/f8E43oJUUT7LKtWwhWmGQwLDuy4CNVPa2OI5SYh
         2Z5XU4BkFUWUgwjvLYDx8WMywu1/c4Ukaa3tlF92bWRrQdBXEfXNt0PMfjFS9qytoc4b
         Oo2pM2hMpuslhVsLg5lRdifZYjBWPAKHqJJmvEenZR0p57AmOz6o5Rj70jEG0BDmpn7B
         KfTBmeN9QxB23urLJoByETRjmbHxX9ZlyZYjVc5gBZ/dvTV9I/JDJSE4vlX1tJh60iJ6
         gulw==
X-Gm-Message-State: AOAM530mVDJ35Jfotibs3N3DI96/zJfLt7+RRnZQ8MsKzzUKxPm6dpfI
	PO301QbDASQpW9oCPj8VpiE3lBQced04oKB3TFg=
X-Google-Smtp-Source: 
 ABdhPJyWV6IIWuJUptqb9gHZRg81L1T1gHvXWdHhhdb7hsDrC5BB+PeWJZl837AZa6kg2YqQSQ+cvG0JDgQIqdfMGGY=
X-Received: by 2002:a67:e95a:: with SMTP id p26mr730751vso.38.1642723587907;
 Thu, 20 Jan 2022 16:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20220120234129.4160546-1-f_l_k@t-online.de>
 <20220120234129.4160546-2-f_l_k@t-online.de>
 <CANNYZj-f-NSn-TD0vkRetUVTPdu560TyFjNfboR0-rfCjd=sVg@mail.gmail.com>
 <b355f7bd-4572-9d06-717b-0f2bdcbda7cf@t-online.de>
In-Reply-To: <b355f7bd-4572-9d06-717b-0f2bdcbda7cf@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 01:06:16 +0100
Message-ID: 
 <CANNYZj9=uqk0NTxAgLaB+HWe1-Q3D3uKwpxV5L7ys2_O2=PcbQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] libical: build gobject and vala
 introspection
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ebe24705d60c634a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 00:06:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160809

--000000000000ebe24705d60c634a
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jan 2022 at 01:01, Markus Volk <f_l_k@t-online.de> wrote:

> This needs to be conditionally enabled similar to webkitgtk recipe:
>                 ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>
> Most Gnome Projects meanwhile consider gobject-introspection to be
> mandatory. Are you sure this needs to be optional. The generated files are
> really small in size and you just cant build the complete Gnome Code if you
> allow to make it optional.
>

Absolutely. Gobject introspection in cross-compile requires running a
target executable through qemu usermode, and that is not guaranteed to
work. If qemu errors out, then the whole recipe build breaks.

Alex

--000000000000ebe24705d60c634a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 21 Jan 2022 at 01:01, Markus Volk &lt;<a href=3D"mailto:f_l_=
k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>
      </p><blockquote type=3D"cite">
        <div>This needs to be conditionally enabled similar to webkitgtk
          recipe:</div>
        <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.=
utils.contains(&#39;GI_DATA_ENABLED&#39;,
          &#39;True&#39;, &#39;-DENABLE_INTROSPECTION=3DON&#39;,
          &#39;-DENABLE_INTROSPECTION=3DOFF&#39;, d)} \</div>
      </blockquote>
   =20
    <p>Most Gnome Projects meanwhile consider gobject-introspection to
      be mandatory. Are you sure this needs to be optional. The
      generated files are really small in size and you just cant build
      the complete Gnome Code if you allow to make it optional.
      </p></div></blockquote><div><br></div><div>Absolutely. Gobject intros=
pection in cross-compile requires running a target executable through qemu =
usermode, and that is not guaranteed to work. If qemu errors out, then the =
whole recipe build breaks.</div></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Alex<br></div></div>

--000000000000ebe24705d60c634a--

