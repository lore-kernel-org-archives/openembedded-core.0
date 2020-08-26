Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.11870.1598447229440670262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=E3oEXo6B;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id w25so2239607ljo.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V9Tj/qVEZ5Kd+ebiTOJiBemVpnCtfMIz5JQnViRBfyY=;
        b=E3oEXo6Bl4goC36+24a1Uh1ncChp0jNj6gJbeJYXRn5igo/J0IGbFR5Z74MgwAwtTf
         gFKEa3YRX68HazKhEG/ZVGk4agwE7p25zWCSIwXdkaDTEF7hR05vQRtVFCkm2sJ/QIBl
         0dB1P1+co2KN+VwvhPFVeuQWo83VqEcbCKxbyoODv7rzVEiDydLIzPWXJASPdnFWRIqp
         9evgleEHj7gBjXOZZIMnk6a7e5nT5e0RpjpwBt1Uy4Xt6B8sTt31vga87TTCf4f8kMVv
         x/AepiAUStmA1zMzzJ+BIRU0u2DsKTJM0M09lbh0h2LLAjumukthzaPq5aZaflZzOwBL
         9TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V9Tj/qVEZ5Kd+ebiTOJiBemVpnCtfMIz5JQnViRBfyY=;
        b=IhfvYdUIWnqzRcHYke9Rztki5fa5ONuqMFh95WBrBP8ZDYcEFnmQVKOiC6jOhiKZiR
         XF3Z9dfHVKRB9Xbv6XrHHmzTiG4nAWvb0aQKSr2InFzgz8/fv0ZhSsf/lcdHJ7FOaVGH
         GuS8BjLkkXhNEZdlSyH/geQf8sffJWNT8QksjZgI4q9muK/tKARggJCuDoGiD0aXdpaw
         AgxmGuFA1ApoSpza3mc54NztupHF5NjKe3fRo+wfIBcS7045ZfzIRDAKXjDZGSZrAPVu
         dKNxb8FVr3uhsEHcV+UeKE9lyiYF6USk7G4oEDmYCEndxjPsJxYgTKnMy/KpjhzEQuUA
         Pftw==
X-Gm-Message-State: AOAM531njSCw+hhnPNzYMVlcq/HW+gFjdyz4utp7h0tIgune5tKAmMTt
	GLdfMiVkbIxqe8Fl3EJb9r5douPu253F9xqmPcuKng==
X-Google-Smtp-Source: ABdhPJyZgcw5mGITf6Sm7qfG0Z3EMxdQVBU6zGasF73ydQxF1UtwmtXzbu5cE/bLGZCnt9q6tznixX1FIXbA+DcVeBI=
X-Received: by 2002:a2e:a369:: with SMTP id i9mr664464ljn.397.1598447227362;
 Wed, 26 Aug 2020 06:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <1597978383-189322-1-git-send-email-li.zhou@windriver.com> <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
In-Reply-To: <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 26 Aug 2020 14:06:55 +0100
Message-ID: <CAAnfSTt8c=fiQkXCDqMKZ4ibbKCBSFCmxPenH+CFhLJoyu_0iQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Li Zhou <li.zhou@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Aug 2020 at 09:07, Martin Jansa <Martin.Jansa@gmail.com> wrote:
> We're using connman-conf to configure networking on various target machin=
es - not only on qemu*. If this is merged I'll just undo this in our layer =
- and that's fine, but if there are more people using connman-conf like thi=
s, then we should re-consider this commit (or at least better explain why i=
t's needed in commit message).

Same here, please don't do this.

Concrete use-case: building for a real machine (say, intel-corei7-64)
that is supported by runqemu.  If you want testimage to work, you need
the networking configuration from connman-conf.

Ross
