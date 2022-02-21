Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57148C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 08:21:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.8526.1645431676238885439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ocWtZ8pM;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y24so4752452lfg.1;
        Mon, 21 Feb 2022 00:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vY8uNJwCE6lhIE+z1u9Tn6/0SOSUl0fm4ddaQnztHME=;
        b=ocWtZ8pMGxRxZEAK3P2LvyU2ZRsd6W/563oLZeSjQOfZ/dEkcbsvb297cqGeeg8Q0J
         +BBOiwa7PPlGQ+69mW05gFlQJajCmyS8nlXmHG09ft5z6sVp9X89aHZbeLQhf3kLGKCY
         3X/92Xm+KPOwtORa1kvUo2nAl6HFGmhjfVci8uPuoXNsEJkyGORcuiLqSUmaqeeAutLv
         gyHqwHYhme2wCUxMxSigGLrvKcB519mEskx0fbHGcHbqHU5b9cqtxnWFdHA0FvsZ3bZ6
         Ar8zlNY98yF/i4kPyLvFnus0HqIfsMoeHQREtM2GAw6hkRFWUNwV7OJSAHdtngLqiCFj
         VAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vY8uNJwCE6lhIE+z1u9Tn6/0SOSUl0fm4ddaQnztHME=;
        b=vFT0q7ipjkUY7pdXaLhWmeUId5idw05qVKKHOXzJdqha52JADb5YR6tofJ+i4XYv2R
         cViMxRfc7KSiw/TFLEAr9pbd7KJU/KEkYnJVMcYzxhABPTLcfTsgjfnOcUCzcAw4SULV
         7D/rnHzKjdxMWXgKjH8YvS08ya7UMd4R5jJcA4GUG3N/DIYZ4mnXksQgBwYXNt3i3ngr
         ClNV8gOjTrjzTMnkqXn98AIDHmr/mqo/IIYJYgAeB8VliBhXIth0TLg2reoenag/oQXc
         hR/trKXSA78gzjCLJp31YnCECMyJJCEy1laEx5QuVle21YTH3DTJNk1dKhXvqIFiqcVj
         A5Jg==
X-Gm-Message-State: AOAM531kOEj/aM2hTeFZzVPGpVug2Ywfv4q1vubBLDXHcIOS9pNJxtqg
	gb4+wlhPd38Zw3HfSQ80dzWA3u+G3pHyUJ/tCTY=
X-Google-Smtp-Source: 
 ABdhPJytmBfBUha3BW/6KrluDCMqi2LKH2+/nPGtFkvjx34Fw21KtoMoB3lbreC7AeQLFMVGZcRhbI+Zs8o4ilAFxow=
X-Received: by 2002:a19:ee17:0:b0:443:5d4b:a4e4 with SMTP id
 g23-20020a19ee17000000b004435d4ba4e4mr13007508lfb.352.1645431674217; Mon, 21
 Feb 2022 00:21:14 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 21 Feb 2022 09:21:02 +0100
Message-ID: 
 <CAApg2=TxBsDcU2_YgjMVM4r_4_9K4B0=dapFfMg-EotyTLi85w@mail.gmail.com>
Subject: Re: [oe] Inclusive Language Proposal for YP/OE
To: Jon Mason <jdmason@kudzu.us>
Cc: yocto@lists.yoctoproject.org,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000071aa7705d882ea62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 08:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162018

--00000000000071aa7705d882ea62
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 24, 2022 at 5:18 PM Jon Mason <jdmason@kudzu.us> wrote:

> CVE_CHECK_PN_WHITELIST -> CVE_CHECK_SKIPRECIPE
> CVE_CHECK_WHITELIST -> CVE_CHECK_IGNORECVE
>

When running master-next I have found one missing rename, cve-check has
"CVE STATUS" result
which is still Patched, Unpatched, Whitelisted. I propose to rename
Whitelisted to Ignored to be in-line
with the variable rename.

Is there anyone using the states in scripting or other tools today?

Marta

--00000000000071aa7705d882ea62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 24, 2022 at 5:18 PM Jon M=
ason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
CVE_CHECK_PN_WHITELIST -&gt; CVE_CHECK_SKIPRECIPE<br>
CVE_CHECK_WHITELIST -&gt; CVE_CHECK_IGNORECVE<br></blockquote><div><br></di=
v><div>When running master-next I have found one missing rename, cve-check =
has &quot;CVE STATUS&quot; result</div><div>which is still Patched, Unpatch=
ed, Whitelisted. I propose to rename Whitelisted to Ignored to be in-line</=
div><div>with the variable rename.</div><div><br></div><div>Is there anyone=
 using the states in scripting or other tools today?</div><div><br></div><d=
iv>Marta<br></div></div></div>

--00000000000071aa7705d882ea62--

