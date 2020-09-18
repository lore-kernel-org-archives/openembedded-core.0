Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.8832.1600420357661378474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=pILsX4YL;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id b19so4455498lji.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTT2iJwDTZBSaZM7QXrl1BBzYp5Cn5IvgFfFJJDSCQY=;
        b=pILsX4YLfQtpFSZvpUqP/PUEKl76ssYXGDWG4Mlme4mHIF5KKJ0TAQnZJ3ooUeaXQf
         e94oSOurhvGR977Du8wyUsDhwcJTJjHn8Gwc+wGTfQAYbEVNTvvMRNnsC9YTvdR6Bqtz
         +pzP+W0a3/VDRn6GBy+LleAsfZHheWksCGoO51FW0f9/Gy2WsdfDSXUWsBubNHnEKGDa
         1hlrXuH7r+LaEaRMS32nHq2nVTm5bg30KFyw0w2fGZgsVdnsrK9KkBemB2c/alv4kLde
         x/HVARHARkGv0q1nZsiJiNqYiAiwuy7ZyK6VJDZORej8YCw0TA/+bX990U7HOAaDekhq
         s7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTT2iJwDTZBSaZM7QXrl1BBzYp5Cn5IvgFfFJJDSCQY=;
        b=HDqB27DpEvWoWpH42h9TBXmjH3FkiKzw1yWXD5hqDsAIXZYwLpuAmVl2aUb73EgliT
         y/a8AFy4JwLkSpHhYY/VgtcrUZGFI/sY/vodXOfUUVJeHWWBU/LOjyj9JVXfKOVKJXiy
         za2bKBMNXdQUfDpSsMTGa+CEcfwsJDAFN3eqa+VJRzUPbRm4wm7CvTyrUFa7PcZUzbIN
         5K5VkN3qyzHPZ1hlOzwCPiBSdyQ1sNiBfAIm+2jC1bRRnf41lcCsFO9NWar0Be1+WsWm
         BiqaKD53MWDAOxHkO/6F0i/ftPaYdvtWd9FFjIN2LV0fc70+C1aivEE0x5EroSQt3ZYP
         ZBTg==
X-Gm-Message-State: AOAM530isz2fv48Fk5dgto/qrc+rbfBKpSQksrhmTg7uS4/yDKOezBZq
	5qhnfz7t8XL1X0hsk25YpWef6AfkTP03yIJ5kII3yQ==
X-Google-Smtp-Source: ABdhPJwNOaYzmU5MrdZVZRhj1b3VssegDEEt5/FuCaFV+foMop1Cbowwt/EheQvZRkxIkpH3HWd+Y84y2NWexcLcqIE=
X-Received: by 2002:a2e:b704:: with SMTP id j4mr10674528ljo.329.1600420355433;
 Fri, 18 Sep 2020 02:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200915091523.31005-1-yi.zhao@windriver.com>
In-Reply-To: <20200915091523.31005-1-yi.zhao@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 18 Sep 2020 10:12:24 +0100
Message-ID: <CAAnfSTvAdEas2SRJwW=qSqrkby=GoObZyrqY3zVf-SJDs_6T+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: add --dbdir and --disable-privesp to EXTRA_OECONF
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2020 at 10:15, Yi Zhao <yi.zhao@windriver.com> wrote:
> * Disable service start at boot time. This may conflict with connman.

Maybe we should just stop people installing multiple DHCP clients at
the same time.

> * Pass --disable-privsep to configure to eliminate dhcpcd start warning:
>   no such user dhcpcd.

Create the user instead please.

Ross
