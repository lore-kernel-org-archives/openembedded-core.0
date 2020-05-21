Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.1701.1590048063211596390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 01:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vN9C13Rc;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: jupiter.hce@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id bs4so6011053edb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qzXOlH4mrdmte7BUdffahPu2WCldUALf2nZFREK06as=;
        b=vN9C13RcYr2e1A1W1XTqMGgJ1o8JcIGaD/cKGQd8gFl0On31jGhyi7edQcsiGoB29e
         2yics0vPYFX4RZG8rQMjtvP5twVoXiIL4bh8ie+6EZc71ruFTNOH03x9WWh02wgF/UO7
         CEWuu9wW+n8MClFj9d/C3lyM6xefeaWP3iavCykqgoU1+SFAX27F6pVuFvjAd/iyZaQJ
         pSSMByxOT003Q7JA89GHQ9wbnYPdap0w/ZfBaLoT2A6LrEmc9I6s+jgLs7NZuiOSVuUy
         jD1VnA0J+MAGxMtOvk48px0KxKQW1sHumeTebsprVtkX8izfizITXaHpaBNJDeOUH0OE
         Sg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qzXOlH4mrdmte7BUdffahPu2WCldUALf2nZFREK06as=;
        b=gSAVt0x/I6O31KCSZivzroAGklXeyRVKeSgsKI1c+1nO4+RHiXmtVL4waABWpNFWYH
         djtP1DJLRrUWzRomGtjD8XUMcuGbvQRpXs4Rgcss517fUV76tOEhdj8suml+kUi99unn
         xf0gB1t8EE1/vnmfks0zqQMPc9NgRROzBaVl0390royu2l44Dbw/U+q/NrnTV2+MP6er
         Dc2JikjnsgHyQObBGvNq+SBWWRHddEJLt8YilPeINUvvIpp2/JY47sxgmLLLSjv4abGI
         apblrHnbkm0XICzpQ+Uj2MeghGo40wjmEscvHad2lhhMqZM2YF7ge3+C1QF14ADy4F0n
         n12g==
X-Gm-Message-State: AOAM530sHXDsR5ua2p64VdVrPpTpzydpHLJwmL/uHefIp/u+ZC/dCsLo
	LI7QxS9WiG90PtPIk6/vP8LqcHJANkPqyQJokpL58k6o
X-Google-Smtp-Source: ABdhPJwhLKfG6yO5wt0EPkTQiKs6378Icfh+7rhPYObv79ukon2Jkp0oWW2m4TP0HKQg5Rwp5f+VbBxQ5mzznS7jPdE=
X-Received: by 2002:aa7:d44a:: with SMTP id q10mr6997130edr.386.1590048061365;
 Thu, 21 May 2020 01:01:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3344:0:0:0:0:0 with HTTP; Thu, 21 May 2020 01:01:00
 -0700 (PDT)
From: "JH" <jupiter.hce@gmail.com>
Date: Thu, 21 May 2020 18:01:00 +1000
Message-ID: <CAA=hcWRURPWfCSPoSa4PZoHSOpqBEesKGnDPT-_mjY=bRXpd0Q@mail.gmail.com>
Subject: Does OE / Yocto support dts file remove device node /delete-node/?
To: openembedded-core@lists.openembedded.org
Cc: Yocto discussion list <yocto@yoctoproject.org>, meta-freescale@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a following statement to remove a node in a DTS file:

&gpmi {
    /delete-node/ fsl,use-minimum-ecc;
};

I can build it correctly in OpenWRT build, but I cannot built it
correctly in OE / Yocto (Zeus), it did not remove the node
fsl,use-minimum-ecc. The u-boot is appended from meta-freescale
u-boot-imx_2018.03.bb. Any workarounds to fix that problem?

Thank you.

Kind regards,

- jh

-- 
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
