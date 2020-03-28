Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.10465.1585415866900209373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2020 10:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=tLiF/M94;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id z12so11501632qtq.5
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2020 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=b6GRCsUgoeBFNdfj4GWlduN+aH8YgSARjXCDqywjy1c=;
        b=tLiF/M94P/PE0plbuwMUKGPPjgPxHukYCMullvG6X7AX8ObI8lyYKXEHj5uVzqlKgw
         bO7Z6Qflx0OHMGwP8/eZaxWH3fvB0lyv38A0IlQ1IXIgDW1DZfUwtnqNNhM9SIVm79BQ
         QMRYQveeNXhZ1EVZypJQHklbOAAgoPxbO0HRe+xt4T28DfJinh/9P7BAxO5REeJkVyAt
         WMLvwc8paaEzWtf5tF3XfbfBDuk0NmxO3Vs3oTFDBYUdkGL9xhEkVHKqtwchGEbHV1UQ
         zrzapw/50B3shmspSQ6SoKmXppdX7HTaUqoiLYd5dxgXRkvy1zdlE2uDeltUOv5Dzpzb
         Mong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=b6GRCsUgoeBFNdfj4GWlduN+aH8YgSARjXCDqywjy1c=;
        b=P30l2vBuzzd/kOoAOivuMP8WvmGm3yEtAsmlWS9zX2J+SUwAjsW4TYAkXKF4CnI1NH
         Wm/qeDsyDtlxUXW8xpG1ZP0stS5/KePlrHkVPh/SWJa/5x+3gsWO6HqIrahRwfRRB/MC
         7HRdV+6v5/im0GCaHnDQa+IgnSXVNPEorimqPVoWwXnrORZitf+oE+Zj7z9U+JTQJIv6
         IIvyE6MTmpEHLfujlOjykTYZ0VREXpDU5pVotRExZJrJH5dsRW8PNSSjfSI55QPHR5GU
         gm326qELO5SGd1KI4IMuu0jV1dFiUkvs5et6CrmoFspOk2VIkSdB6w2Eh+mOLjGySOsS
         /15w==
X-Gm-Message-State: ANhLgQ2YfrWYggT0KL2Ls5Fk4h0JJ13CEVo8sxg+FRxnBmXJFXJcV+MB
	6+dlmJ6Q5kLlILaNOnHiO2IuZ1RTFXysZQ==
X-Google-Smtp-Source: ADFU+vuSP4u78RPFITsnuuhwX8xnoMzwINHKylQZV8T3yvwwMu542wBAp43i6PafUVbJd9J+LxBDAw==
X-Received: by 2002:ac8:51c5:: with SMTP id d5mr4897772qtn.23.1585415865737;
        Sat, 28 Mar 2020 10:17:45 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id q24sm6824563qtk.45.2020.03.28.10.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2020 10:17:44 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f176.google.com with SMTP id c145so14422632qke.12
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2020 10:17:44 -0700 (PDT)
X-Received: by 2002:a37:ef11:: with SMTP id j17mr4730205qkk.46.1585415864340;
 Sat, 28 Mar 2020 10:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200327172520.62888-1-alex.kiernan@gmail.com> <20200327172520.62888-7-alex.kiernan@gmail.com>
In-Reply-To: <20200327172520.62888-7-alex.kiernan@gmail.com>
Date: Sat, 28 Mar 2020 14:17:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
Message-ID: <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>, Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Alex,

On Fri, Mar 27, 2020 at 2:25 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Add sysvinit PACKAGECONFIG which disables all sysvinit handling in
> systemd if it isn't present.
>
> Consolidate sysvinit handling so that when it's disabled we exclude all
> sysvinit features.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

This address the comments from Adrian and I'd like to mention that
/run/lock is not being created if sysvinit is removed from
PACKAGECONFIG.

This patch is good to go as is, if possible Alex, take a look at the
/run/lock creation issue without sysvinit support.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
