Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.52836.1595847173031079398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 03:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=CC5HR1H3;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id r19so16657489ljn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K2v/Z2/MK0iffzVR0IYki9ILbdaV0Sp+oyAc9ZhF2I8=;
        b=CC5HR1H3SsbUFMbWDNVfVSL0tXSO16wAucVqjytqm7gPBF5winzGpDSRt48RIw87bv
         n6OUKGA8snrMeeTqnHqy6TOgg0V4eOIuIwpDmOgZMSEULUgCMcakH8b+s90M4XHIRiEi
         wFSHLpg4vO8+9WGB9Xb0XX+qCgHNpbUBHTrNzeUdog7tllgjL0r78zOQJBRH5KjZW5Ox
         G4SdM3JYBEYP+ijUu5wyRPeoW9KXHeRM5wjk55q+puYg4uxAeCLSMkCSZ51YZEp+/98O
         UsnEbBOhPgRfPLO30DIrZSKvVzGcKeQ5t2xzGHtq1ZURB0Bz/BZe9JqoKz5OhiIqmqAZ
         Ccsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K2v/Z2/MK0iffzVR0IYki9ILbdaV0Sp+oyAc9ZhF2I8=;
        b=CdCy/fgMN0Q1YQw8jbawyrM9jrNgp4gX9HOWxjSgq11JIH5VbUVQHTnusyHtN4x7I+
         aQnJ1/GVH/St0OCJVB3YREFUw5clqiviLbPzmeOWd6fMEBNulUUDjSCyFqfSl920gZ9n
         C4cBx+NyeCPpzUnKRlyIIG2eS0wUSMAEKJXsp8Hq1IkTgvVwuJu7iUpWL7KHQjfVysjc
         2yJSpXfmTWJxseoEuWzCgI8w0DEf/SiZc4hN8WKmkR02zU5Bkd0rEnvFR6FacuD703Bm
         lW9RBFvp1FgKhTpC79MsY2bXDMMpRxa8GUUBtO0wXbjE9GV6nkFflBi/pyu8VNTZxYXw
         im6w==
X-Gm-Message-State: AOAM533Ie8T0f1FIuXZ6o/sHLKvD233jX3WGPr7A0JCsQo5j1zuR1VxT
	8tY+gr2yEQ9lBYdnZFl3hMxZGOHunI1msOP2F+fwqA==
X-Google-Smtp-Source: ABdhPJyGBA4iy3OSceoq2aE9DH/QbL8AC42S26L6QFXZDSdTuRvxqWC/KU4tDQdausURppSl2b7J1TOX10pgdxQMm/Y=
X-Received: by 2002:a2e:9908:: with SMTP id v8mr9634100lji.186.1595847171027;
 Mon, 27 Jul 2020 03:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200726015614.2875-1-ruslan@babayev.com>
In-Reply-To: <20200726015614.2875-1-ruslan@babayev.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 27 Jul 2020 11:52:40 +0100
Message-ID: <CAAnfSTvFPFsSzimALDEGWQCrMRszViYWT7kqBbs3UrgRrfAN3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
To: Ruslan Babayev <ruslan@babayev.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jul 2020 at 02:56, Ruslan Babayev <ruslan@babayev.com> wrote:
> 'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.

Can you elaborate here some more?

Ross
