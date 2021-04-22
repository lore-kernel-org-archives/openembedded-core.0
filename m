Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.21.1619108300781792419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 09:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bNCBFk5b;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id j5so44419890wrn.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=XaAlEq6S8KUQdwpZDnWE3cEi92Wd0uSTo1T55PXav8s=;
        b=bNCBFk5bFWSgxb6s0fVnZSW0bAL01y9UGNMGZzXan4y52DEedsGVy4WVCmg/VE2onj
         EIDYfkObSG9qk4L2qeyTuf6EuugQdvzzquWbYZaCcmd19SbnEnPD3ZMKwZ+yzCr2FPF+
         ksnNxO4erEaMGM19knOZBPxvkvpAa1gGNr8ybC3ZSo2FTxpq8R5Hll7zeWb6iCgdybS+
         ZsMuGU4erRGhyPdHGzWzH5VDqMvse61F3mu1tDULCi4t/WzMgos4I67YxQTrW3HC1hrX
         tt+rfKylWj4haN5y8CPjTn0XCfM6Xt4pZgQguk/sd7HyYeHBiHQJ2vP9+GwTzTPKKCLt
         tNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XaAlEq6S8KUQdwpZDnWE3cEi92Wd0uSTo1T55PXav8s=;
        b=SMxXndns5Ur7Bj3Bsw5AchJrsWYnkQY58U3w2N+zeMM2XuwWqSTpeAHbHPTk/TetlH
         riSTX9UDSp6pxUSpfQOs+W/QygfcPbI/IO0Ph0JhAqsfGsws5jNzLjyHOmBx4sSrZjlA
         LAZiJ4XOSXMwLgL7RdVz3kXGFyT85ur03VIeFQkQ5rCiSplwrsyMVIUBCpoNF3IV3oTg
         SZGwmw/wRupHM/bxoMdssQGp7ln1nvtsFqWt5kgjSXDR6nlQzz/PyWyU6AfHCrLlDH8K
         maSYInVieII3Mll9pbdhVXe6Cf3jxS4+1j0a4hgqRjkTliPfuEtygYBfhNuTG8udk/tJ
         zTMg==
X-Gm-Message-State: AOAM533+PWyqlJtM/ntfheElJZKxgn/11DXxWcX+DoMZ1YdQ47O9Z2Gl
	xe/+rUoq3Z0AhCUi4w6eOQpVYO0Zvrj1KUuX3oPO3gIQv1iDZtIp
X-Google-Smtp-Source: ABdhPJy1tMEi1pW6iCdFQvZA47zGYYUabvZYBaKjaQhj74plE0dQBkNmx7FvyRRQxOMUVbx8xUBhee4/FU9/eNvTnV0=
X-Received: by 2002:a05:6000:120b:: with SMTP id e11mr5052598wrx.299.1619108298671;
 Thu, 22 Apr 2021 09:18:18 -0700 (PDT)
MIME-Version: 1.0
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 22 Apr 2021 06:18:07 -1000
Message-ID: <CAOSpxdbUdiAU4Eq-6Ogzudm70ieGhzuop0_zCiOBYvczYKi+cQ@mail.gmail.com>
Subject: Dunfell support for Fedora 33
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I'd like to work toward getting Fedora 33 as a supported distro for
the next dunfell release (3.1.8).

Initial autobuilder testing looks fairly good, but I'd like to get
some feedback from people who are already doing dunfell builds on
Fedora 33.  Have you run into any issues?  If including
meta-openembedded in your builds, any issues there?

Thanks!

Steve
