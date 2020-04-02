Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web12.6867.1585834762615773277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 06:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojpVIEIx;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id t6so3568709ilj.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2EnMVuCCETM64PruYZzzO7B4P8bEnYj4Fclu3n/ezSU=;
        b=ojpVIEIxs4hkKe2AmB0lAtqBydRp1sMvPdzClwpOxmB6mEJu7Yh+xsVwoG6Z/JVOSf
         zc4yiH46gnIzlX6hVv/X2jsqS8MajwtMGZ2jtwRnye06e77Y3VBsoLU5RiqJxN0PxO1J
         fD8vSAwAAAjaw02cHHt8cbW/gM302SOiNX88+Q9POmDKBY7Tj3RBDGHJhzHyni+JyMEK
         +fXKjdk2VL4l0EYJqbk3XTU10TGWcJdO4KbQdxlVpyYA9oYaZuPc9L9SK1vilgQDJOSf
         W0ibx7/w/FpKbMC+WOGScba4zG/zk1nqop+uW9ZAbNjbqJdYO0n0S5/58hwFI4esO62W
         +CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2EnMVuCCETM64PruYZzzO7B4P8bEnYj4Fclu3n/ezSU=;
        b=jFggTj6CiiSIfurvFZKeY+xgT2wVJw1T0kXURSlOSiUEFM1s1XHGQDjeGaq36cEY3O
         VumsWqCCEKpmevIWb/ZKSY1f1axXRNUiyr4BpJJZMFy1JNUUDf0soaFBkJbT0USC2/IZ
         InhPs2OP2wc664TaGgJjwUSCh1FO8ilAm1fDoUXnAaJo8Hv7al3YLyX8Acjpiq/Dqfcm
         AZdHkRsFc/eO8TTc+sYQszqY/hWjLOHWl1seYpnD6d1DYrrHHB8WHqBDYop9k3VPUnkd
         kOqs1zcLtcAwm9Ykqd02bHZLtPGqcSfrmARaxmS1sWnQn/z1E1KxWcQ5FfF0J5aUvLkr
         GNVA==
X-Gm-Message-State: AGi0Pua7MmoT6csOS+EwSDNFTKkfQolH3/zvktehaZ6NK+Ob2zMYxEmR
	39N0n+k3/K4Qge0IgMBBVio5f/uf4r3v6tIlwUlEKZ5HMHM=
X-Google-Smtp-Source: APiQypJ3KAgvLFYqRHohg4juDWfDVzE5NHJ9edmjjv12Wlt3iV4HgmOSwpW406rBcboQZ2OciqyR/nGH7wA8RejnJ+0=
X-Received: by 2002:a92:15da:: with SMTP id 87mr3255060ilv.144.1585834762028;
 Thu, 02 Apr 2020 06:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAM15ne=BtZqVdByS9VxHPSyDk+uAMVEWL6cQAaP8KXC_HX_DPA@mail.gmail.com>
In-Reply-To: <CAM15ne=BtZqVdByS9VxHPSyDk+uAMVEWL6cQAaP8KXC_HX_DPA@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 2 Apr 2020 14:39:10 +0100
Message-ID: <CAO5Uq5QYE9Cn1DQxUtnKptqwyzpbUyY8dMaYMdwAm55yHj4mLQ@mail.gmail.com>
Subject: Re: [OE-core] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Arnaud Pecoraro <arnaud.pecoraro@externs.easymile.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 10:09 AM Arnaud Pecoraro
<arnaud.pecoraro@externs.easymile.com> wrote:
>
> Hello,
>
> We are having the same issue as described in the link below :
>
> https://lists.openembedded.org/g/openembedded-core/message?id=162040285
>
> WARNING: Paths in the rootfs are owned by the same user or group as the user running bitbake. See the logfile for the specific paths.
> /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
>
> Any update on the patch?
>

If you've not pulled in the rootfs_check_host_user_contaminated check
(and it's not in master) then you shouldn't see this. Is it coming in
through another layer?

-- 
Alex Kiernan
