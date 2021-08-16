Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.21731.1629104795785975978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 02:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=iD6ma9a8;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id q6so10989690wrv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slKvfs+f9pdfEPH1ePC3gtGrOh43gTm/QROn142zsYI=;
        b=iD6ma9a86zgS6dgImxB3wEQvfgXcMYOqjZavfgCd6wnrO47blw5fiYVbt5QjzBGvlM
         nXyR+E/UDuRzp/AKq9SVW0nB5PkqGHyWXoYCWArAuxobBYjHrSZu3qSPtFye3EEbhJZZ
         XvRQGzzTjyUkgXamCPulgWaXv8Vyprohm9rZ692AFuVpkphSmeqxrpyqNTFvoZwH96CT
         jj49r0J9FmcmabwdA4RK6ng6VFIJiv+n8r1J4FM4iPyBtL7cfC9R3nXVBo+Zr1lPpYO/
         ZyjByzLy4Tv3WfongwzRQoboTqTm6P5kPGzVzD11bXFw+NpeLCE5L9axGagHLO35eD57
         nNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slKvfs+f9pdfEPH1ePC3gtGrOh43gTm/QROn142zsYI=;
        b=Engi4Ce+llT5FLVfSf+qXVYl/CSRcc8zOk94izhYiCts3XYSObHqQMsm63rq984/cm
         D1n8dyrMkwGvFuw7HA5fBnkBCDioUaxLC6CoKnIo5U1MefFsUEzedY2VeBy6FzwiB5Ix
         jZHEJ0O05wP5IbQuzpXzMmzy0AODmepi66YUMDdJ+IE2oXJ+c58V9XjurL8T025fnnsH
         DF0xvXBY/q1F6DqqN7/wY7o0zFTvUiAIPyazlOAexVeF0aOcxKM9Ch6XwI3RmsPiO0pt
         cP4EjILNEzQ1pp8keGAMm1eZvAne1xJ/Un7gS5SjNBSBwl9SBlpw+KJ76zeG9Qi+sXDT
         BbDA==
X-Gm-Message-State: AOAM531qI54LFokDscB9854Hr9iuDhUxYzCx+eNABRK/kN+U4KnuQfOM
	JM+hGd3C+rheXBNt4Z+yS6twbVK7Jy+wksn/JNlqXX+PTYVNww==
X-Google-Smtp-Source: ABdhPJyP9DS2V/833I95NR7wVXEcd0MBW+ATYcbxwpqC9ZblNCzPCtkyWW6PFa4dAQznyYSsv1124DGJKKo81iJoSw0=
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr17463816wrs.395.1629104793944;
 Mon, 16 Aug 2021 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210815140330.317FC960346@nuc.router0800d9.com>
In-Reply-To: <20210815140330.317FC960346@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 16 Aug 2021 10:06:23 +0100
Message-ID: <CAAnfSTuMS7YUyZp-V2RHbBqsc=dpV+YLXsaaVEyN-181CXrRRA@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 15 Aug 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Aug 2021 at 15:03, Steve Sakoman <steve@sakoman.com> wrote:
> New this week: 3 CVEs
> CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
> CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *

These are both node-tar specific, patch sent (and is good for all
stable branches).

Ross
