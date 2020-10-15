Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.12641.1602769933621880759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 06:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=LmqVMkFr;
 spf=pass (domain: burtonini.com, ip: 209.85.208.177, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f177.google.com with SMTP id a4so3201291lji.12
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzZ89nOXjSr4bmrDMTkce7Mxqm2AffZQhR7CSJQLOgg=;
        b=LmqVMkFrhRLn6rvJ12fqrI/S7iMfv2eeCktS2Ct7hK8QA/tD6mnNYDCq/aH1lwKrsP
         rPe0ZIml8JvRL4QsN4ayaFUopyDOdoWf5g5d+jnursRP9zmJln77woVa6/qhT51OD57b
         NQ+CCAe3T4q92np53nWlidL4zz3/eg8eMuXeUlXN2YIuSOQa3cMPGxYKuUzNK82v2I9o
         LiVpkcRP656TQKzM31kEevLWREFLRNxBRqHPYTbv3zobtD2viiaYl0xkdzUUOq05wPdc
         /THWy3hEzFvdkP+qOIp+404hV6gusmd06U5KlnuocmDrOvQaoIyPkUnABeCiD60ZtrDi
         rY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzZ89nOXjSr4bmrDMTkce7Mxqm2AffZQhR7CSJQLOgg=;
        b=LLZCAtvoqVuOkeanPHrd9903XG/BdguenFyTlXBfoDZeL8oKywXWd4Y9FPN0Gpf1nu
         CYoJ6kfyeEwdAECPTwpvScqqaVuZhekXdPIFH9lWHcGjgxos1px1byY5fZ2+jp0C518q
         58D8ExrcD29fSLJfHXm+Dbx+8pQluA3Itza7S29ulkt+aVx5B4h61vEe5gwTBV8D9tIi
         Kz0dYngjVzzDaXWM8wFaQGyTCYQb+iClv0aAjJjjDXiFSuIZtImWx7GKN2QReaPNmVUi
         z5FaTITNTz/wqCO8u7JSG9QWYDejpoeiwKn/4FeCsClh7Dv4WO5gpiFpYbgwtd+dOXss
         FEFA==
X-Gm-Message-State: AOAM531AOeraa7TGOj2AStUE0/PEYCBNvja0Axg0PTHiVBal4sV8uhYf
	iGtH6NxTjBLEho3cMdm0Nlup/B3uJMvDcRhDGWCvng==
X-Google-Smtp-Source: ABdhPJy7CA+h3rltHI5L01yvaWkb5HK9CCT3VWSLVSu3WHrDgmiu6YQb4hIjLEXjJv5nWBZv7RUOv0zTklKp+meKi4Y=
X-Received: by 2002:a2e:995a:: with SMTP id r26mr1238332ljj.329.1602769931525;
 Thu, 15 Oct 2020 06:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201014112620.2244199-1-ross.burton@arm.com> <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
 <0c555406c8db939a1e35bc7621166bb2b832fa84.camel@linuxfoundation.org>
In-Reply-To: <0c555406c8db939a1e35bc7621166bb2b832fa84.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 15 Oct 2020 14:52:00 +0100
Message-ID: <CAAnfSTv1dOJpQ5mmj5ogfNA_OkT0+2pz+P=uTW1KFA9dvCt4Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2020 at 13:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Might I suggest this is parameterised as something like:
>
> WAFPYTHON = "python3"
>
> then OE-Core can continue on and improve but people with legacy can
> handle it better?

This was the patch I originally had months ago ;)

v2 incoming.

Ross
