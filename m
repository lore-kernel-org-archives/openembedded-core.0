Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.1195.1615584747153674029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 13:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jSePc+Fv;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id 81so27256214iou.11
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 13:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VomiJ1Z1xed8r4VEML0BGPjzxTUEEDFDLCLpXNCGPHQ=;
        b=jSePc+Fvad5tZA4vtETdYDR9V8UpmVQR89PJdri+LKXImUSa11ROnBohkS/BYSZtOK
         20eMPWjP41aFswvYr8RRA2C0sVgnJPJh+FC3bgTCkRL4KwcCPeAcLWtERQcKf2xhR0GD
         WgwEh4czOvZAJxxjfHi7CUgdse974MNx3XqPmxdX3Px1D8jTYaUVSDnj5tvIbJx9dR2K
         TPvlBXslWtyGTS6qefR4klUg+UeBdhzpmFWnujh4beiZeG65U2smpkYD8C0vR8zyBzWq
         YLL2GJeQNTtl4WFKJjQwze4eomwBsyqIbRB/uJT1lyy4ZpR9O6ARnDKQcs+3FCSPvBUA
         Vtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VomiJ1Z1xed8r4VEML0BGPjzxTUEEDFDLCLpXNCGPHQ=;
        b=dTxezRv7Vf40clddR0XUIR4U0nWghQs24+D+vJ4I3gXPpP7B33VM84a0RHWiOnUW83
         IaGc7sscCorqGZ3O6gHVC3jYDjUGuZ0kUQsWdtJkoqcKVl6RYfoLhvQTlWjYspAR8GE2
         r1wANHe+zc+EADIsy3/OkWMTGEOxvxn+arcPeDjLfZY+r6Kx5if43TOimCAr97d5MIr9
         cJvf0H4FxCxufxVc5MOt2RhwpW8cXttcnILcMeWLNR0SWhfX/zi6aoT8uHeqTb4xMb1T
         D46k9k85JbSigEyGRxq0JruZ1AvYfcmhoscQr8BJFIg4fV1lYhTRh5/gLijO5dkN7Brg
         7s3A==
X-Gm-Message-State: AOAM533TuiFBa9EkFFi+QPYZA0VG++zW+gBOiQrF15tPOc9seQ+OjaBC
	620HF4lXc1Y/QPwQsqcyrbC6VfCE0LFAvCJeltI=
X-Google-Smtp-Source: ABdhPJx0hGmEXY0GNaHfeRGQ56Nsw95S/cKj0XtWI6r6Vr//1rJnSq10KIxI7Nv6sm839Q8SxzDKoKF0yTmz8DXACGw=
X-Received: by 2002:a05:6602:14cb:: with SMTP id b11mr886567iow.175.1615584746594;
 Fri, 12 Mar 2021 13:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20210312013626.44204-1-raj.khem@gmail.com>
In-Reply-To: <20210312013626.44204-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 12 Mar 2021 16:30:52 -0500
Message-ID: <CAKmqyKNDbdwbRbfkSfsco2R4TiJonjNo--vmTGC5MugcW4MuHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Remove libunwind for rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 8:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> libunwind is not yet ported to RISCV32
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index c7653e523c..edb1335154 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -32,6 +32,7 @@ PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
>  # libunwind is not yet ported for some architectures
>  PACKAGECONFIG_remove_arc = "libunwind"
>  PACKAGECONFIG_remove_riscv64 = "libunwind"
> +PACKAGECONFIG_remove_riscv32 = "libunwind"
>
>  DEPENDS = " \
>      virtual/${MLPREFIX}libc \
> --
> 2.30.2
>
>
> 
>
