Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD4C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:29:34 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.33679.1655821773267664971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hSmEfaZW;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id p14so2588917ile.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BujbPtyzHBS1vv5JdBEo4cLfR6Svi3iVx16QpuU5gaA=;
        b=hSmEfaZW8I8ch8DGCmMu3frJRAvMYympEBrb/O8VuvbKKsJRHxl7A+1jfri7oo0wtR
         LiDhZoQGCTABvED8guIqBWcMbj+aK35zKXfAiRQ8r3HuyJiTi04wgjvhGUgm9ku+3p6x
         6F3NZ6wMSFWgx/EgucDo+LMUS24hXhhdTzK2c2JbdzdXK4dFglRYm2XmAB1yHVY30VsI
         54X0ad0FBnxjk5AXgnXH3zUZlnRLfaxrZZ8FUXalkmr/60QFPx8TudjrZrfnTBFdnuih
         t4V5G5sKU4F+oBQtlbB2m5GYKTEZRowylV0rfYVYkIjipO9d+o2KliySLMiKMz64naTK
         OyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BujbPtyzHBS1vv5JdBEo4cLfR6Svi3iVx16QpuU5gaA=;
        b=V4VaIl91adw+oVWsKs87t+5K2nccfrLb/vFnSZD1vK/rQ4+oSZHwxDX/O7YP8teh+C
         W+mkQ+xmflE4JU3wsYREvcgfH4DP7w2Gyx/reraQead2hCltTI2/ov+hjp4Hzbf5ig4u
         IQ1ZBzc2dQ4gU9UElL7X5aPGqovDSdc1fA+OW/SdnstNvXp7pTv5XwDBHQZWgmiYrloO
         DJ8psGd1g6izq1qnUDGAUJLxL3AkQp1yaDwQkLBwNXWJ4y0B+X6811zM2sNHnP/7Mepn
         EhZbDW9XcIVfMce6tnkuwthJE6mZp+G+Eq0h5BQLIqu6hYvqpdL4ZI85K/gyG/E5xott
         IgrQ==
X-Gm-Message-State: AJIora+B2WSOi/YVUTBR9bNisjy/Shaipwo6WLnH5yHnYHg7fVQmXQRH
	vEIceBCHjeDuiGdn3lXYAXoy9aAqARVbCg1cxTpYsNKD
X-Google-Smtp-Source: 
 AGRyM1uUS+rkolWa1B0VARiWBDTxI0ZA4ykaKuQvQDR6ti5hubfjncMQ6jkee4B64L+AvhmE2YClsIB3oxFwzAAxRcM=
X-Received: by 2002:a05:6e02:16cc:b0:2d1:9a4c:db79 with SMTP id
 12-20020a056e0216cc00b002d19a4cdb79mr17078367ilx.175.1655821772594; Tue, 21
 Jun 2022 07:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220619123357.C1442962583@nuc.router0800d9.com>
 <8FC54CD7-3243-424C-AF67-4BB0BF53B5BB@redrectangle.org>
In-Reply-To: <8FC54CD7-3243-424C-AF67-4BB0BF53B5BB@redrectangle.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 21 Jun 2022 04:29:21 -1000
Message-ID: 
 <CAGDS+nnec4x6+Wpd1O7LOqoetBmbWBH323avx_S-sBmQdSE+4Q@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 19 Jun 2022
 02:30:01 AM HST
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:29:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167160

On Mon, Jun 20, 2022 at 4:27 AM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
>
>
> > On Jun 19, 2022, at 5:33 AM, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Branch: dunfell
> >
> > New this week: 3 CVEs
> > CVE-2022-27779 (CVSS3: 5.3 MEDIUM): curl:curl-native https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-27779 *
> > CVE-2022-27780 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-27780 *
> > CVE-2022-30115 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-30115 *
> Same as last week, these three do not apply to the version in dunfell. I=
=E2=80=99ll email to get the NVD updated with the correct version ranges.

Thanks for your help on CVEs Robert!

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167115): https://lists.openembedded.org/g/openembedde=
d-core/message/167115
> Mute This Topic: https://lists.openembedded.org/mt/91857110/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

