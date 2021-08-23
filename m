Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.31639.1629758025107551589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 15:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XFdLANwG;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id i8so37141818ybt.7
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FJYv6LW6gKmj5w9bnMazQsN/Y7QEak9G3g5RHezr6w0=;
        b=XFdLANwGVSbXEiUCvu0lqWdbH53Y52FVRuNp46xMIW+UbfZNmOFTHf6Z6a7a6ZsI3k
         uts6K/sYnG1JBxp5u1wj85tPNdPuarELSXENoSff0MWk9/9qqyK+ChAjb10QWdINlYwD
         XfAP4KVG1KyAufMbCcCU2cCeEGtCRoE9O6uZxu0jiI/DFtlrbI+9lqj3TlBvuduSApHf
         uJOTtFGCIdqTJSTBMX4JanU50vv6psZkBjZctB/kKDeQnszYvjuXJwX1sMZ4J34hxDzJ
         4KYT9uqWbvYoqqT96V5JJcsteqLZzV2dsKWdZMZNPMNqg8p4hp19EALOMVOTFwJPFUyz
         TKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FJYv6LW6gKmj5w9bnMazQsN/Y7QEak9G3g5RHezr6w0=;
        b=gknF42UV8a8BB+OLJ4t6DwFubAlNO8+ZeKG2pW9PaFb+1sp9wlP2jHaW/un6qbfQGn
         kHoo3bjpdy8FLZiw4SJogVhVXnKs6yRYNHd1STfYSQCqo7SYf21gCR9vx3PnuLwHteoV
         SvbZ3kTwMJFY0nwEfzyZzkUhLRHpyas/0Aed2hG4jNgq4mfZP3TgwGUlgopdm4zx659f
         VzdMisgnwL/yWX7TqztKiQ7J8bD6Gy41bAUuMqADyryu+Ts4yRTWcDwkNXcOEhXiGKCP
         i/qHsyvxkrmsqb268MjIRPMkyQ0vNBgTfzcb28ZenrnnQ6tXjhGw6xIdBRfVm02jxzq4
         h04Q==
X-Gm-Message-State: AOAM5319075Yl8YJeAooeL8URbX2UMqCF3Ez3zyKi14IwcHl/3Frz0bg
	/OSYaviZcq+NVZgUATf3Nlfvey/hLfAC6C4cI1dYeuZem3k=
X-Google-Smtp-Source: ABdhPJwBY0iDUZmT0IhGScqIpzbgk4eXDW63zwIAs86civKysGTdPITyKzjnQBM0FO6SvAyZoCoxCWtrsP0/YgGkE2g=
X-Received: by 2002:a25:9ac6:: with SMTP id t6mr46053563ybo.190.1629758024230;
 Mon, 23 Aug 2021 15:33:44 -0700 (PDT)
MIME-Version: 1.0
From: "JH" <jupiter.hce@gmail.com>
Date: Tue, 24 Aug 2021 08:33:08 +1000
Message-ID: <CAA=hcWTLNgEgKhsthziTyTShb6VFVKyy6JXzZBWr+nCLreGW-g@mail.gmail.com>
Subject: Update bitbake broken build
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I updated the bitbake to run git pull in master branch, now it is
broken, what does the following error message mean, how to fix it?

$ bitbake-layers show-layers

NOTE: Starting bitbake server...
ERROR: Variable PROVIDES_prepend contains an operation using the old
override syntax. Please convert this layer/metadata before attempting
to use with a newer bitbake.

Thank you.

Kind regards,

- jupiter
