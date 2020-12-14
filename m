Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.35387.1607955117982685793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=17AtPq3I;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id y19so30335875lfa.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pDWKgtGd2SKE4DUfPHV8vPDkINp/qwiCejRZ/bhyOk=;
        b=17AtPq3ISPASRytI+o21iP0bZF4bWru7ZH+3Bk8V0DLnVHr1oyM3gMDfnewvgIvex/
         V2rzChsmFqtSromVpO5/8dWZW7/45nD1sjXfJkdG4z/tsKlGjertSqr7aEVxL4DfMq6r
         Dar/W9s/dfFuJweRrIhlypGtKlnWtKPFEGFPlQpBYCUk7tswx0ybuOR8YX7tJTxMlmfQ
         99oBZQ93csYh4gzIu4QKwiM1HRC4RbFblSEK2zOjtcIfhriiw/UOHLOApY2IHQLa2naE
         PLZ2CuqCWPC9SDDTeOu4dA5ET1k3dFSWSN9PEHAzpO91/Hcvt6EzN346RrCy5R7WOQAp
         RypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pDWKgtGd2SKE4DUfPHV8vPDkINp/qwiCejRZ/bhyOk=;
        b=Vf2rg5poAPHmswS1sFUkU97tD/S85PS2YrfVZlTgXB4zkk8StWa7JWW0XDpPh16J4F
         qQqhzZx/sRraWGfsOvqDfsLI/CgDMEb9F/cqWla0wrpLMuklVFcS1IVn0GCDYV+eRj0c
         6kKHQZKPdXsl79L/zVjYgVdXxybTlWHKEDlHbhh2R+pfk2xdgfENXtPVsgK3wfIKUMQW
         qJ6mbMAxz+zp8qVVfsKuRCcEOmnmxPQabZ6HAgsHEM/O5LYjBrjvnavr8oqhNzXE65d4
         /3PoG+ywugHy3dZzaewHb1xDq6yMr3sKxySH2s4c4P5pD2o1va/hMacvLFCzK4ZNiw0u
         dxZA==
X-Gm-Message-State: AOAM533auKHA7zWN2kS/5lH3NZx4qby8D9+TN+6YIkSG+Klx8fVowfXj
	PrNXo67YLFJnHdxjnGm1ix5QQCZvZGHIrv4EKbu/xA==
X-Google-Smtp-Source: ABdhPJw/QYMc2s+gMppU6IJbxKz7AMxvRdbh+L0+POqiEIL+fh/o9VhXocZ+YiQ05vyRBNOgN8656QyZJEUqi378JHQ=
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr10177049lfr.180.1607955115842;
 Mon, 14 Dec 2020 06:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20201210163242.3329917-1-ross.burton@arm.com> <732073f5112c4d4ff8d2e6d72832bb53823e81f4.camel@intel.com>
In-Reply-To: <732073f5112c4d4ff8d2e6d72832bb53823e81f4.camel@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Dec 2020 14:11:44 +0000
Message-ID: <CAAnfSTtMRjAJx4d7KHP4eMa5YO3=uCf0_RpjToDT8bUPLcwGQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Dec 2020 at 04:26, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-12-10 at 16:32 +0000, Ross Burton wrote:
> >
> > Remove the SYSTEMD_BOOT_EFI_ARCH assignments, as they're never used.
>
> It's used by meta-intel. If it's not fixing any problems, can we keep
> it here?

Ah, didn't expect to find a do_install_append using it.

Can we just move the contents of that append into core?

Ross
