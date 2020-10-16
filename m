Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.6847.1602819115152866069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 20:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X9ZaQl0c;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id n142so760451ybf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 20:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=DlZpzMH3jmEh2+vhj5i150gUJGVlR4u2EhacvoSpOe0=;
        b=X9ZaQl0cLECo7vxEv0MtKRsIaDtku6dpfig7IJ3Ur1DKPW4WWwwulCgY71UJUAfEja
         zqsCgeZQksp0T0RjbZuqdmLt7kzGw8AkS3ySwg/gjrVTfAkAevYPZxNy6/13VgADuykd
         jdzS2RkBBaI9v1qpYlSdMl7G4a67dAYRdZ/RfymCy12tfXrmKXWVbwvtqPXmPJmkPxYP
         3HPbTqoap6lgrxPvK2C/yCv3pWpU1pXr9RvsFMb8RJRLHITnWG1hVg4Rq76FOFoiVKH3
         z6EEVLk9Bpi3z2lzXSQncowLatjanVN2MTpQ3XULDnXcAlTfyptu03B0suCS/nUlXCW1
         s45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=DlZpzMH3jmEh2+vhj5i150gUJGVlR4u2EhacvoSpOe0=;
        b=rCo9WtFF+dq0Ks+/FpTzGAJKu3oiDOmkFWgenrIUoxcEhQGvb11u27Y63ko/01MPbB
         qSmA3EBZza79sQ1h2A0u/qdys0ZYQw2WsXwnVsHtGS2sXCkHs7mGW8Msseq9lRLdlReo
         uXVSZ304/9QPg6Lcehk2sayQnjmzzu7KrnP93QQCPglvJpOAr5G4zVwcOKoUAYUIzqfq
         QVIbcq5dh91UdbCbsWftbz2KvG8NNkOLxFCPXdYTcO8MBjDopxhi3IC4QUj2NbI80kOT
         LVqJNa+pSPLdX0dw+Y0unG4jLkClfEaZYAm9909ZVPUMAOiweym8vnAXzc9qJS4l7TwN
         xO1A==
X-Gm-Message-State: AOAM531vV34c+S66c/7y58McLvUxgyF4iTl+fMiB7OwRYo5cvASboM0S
	Uimx3xAPRIdmgaaiVLCuK47jgMMigEg23cWsegQ=
X-Google-Smtp-Source: ABdhPJx0EnwJMcrh5rSIf0/gOxaGysbKwK5c5qmF4Hm64ieEm+xaQ6Wiu5XFKAZ1l8WkJnQvsDfgMabT4iF7YsfoGTc=
X-Received: by 2002:a25:33c4:: with SMTP id z187mr2137054ybz.340.1602819114334;
 Thu, 15 Oct 2020 20:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:1882:0:0:0:0:0 with HTTP; Thu, 15 Oct 2020 20:31:53
 -0700 (PDT)
From: "JH" <jupiter.hce@gmail.com>
Date: Fri, 16 Oct 2020 14:31:53 +1100
Message-ID: <CAA=hcWTT+EjGhk_XN-ErdXmXJeZvFfje=rL7+O84HtmvC0uJsA@mail.gmail.com>
Subject: Where to download zeus 0011-linux-user-remove-host-stime-syscall.patch?
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

My apology if I posted duplicated messages, I don't know what's wrong
with the gmail, send emails could not find in Sent Mail folder.

I failed to run zeus on Ubuntu20.04:

-- x86_64-linux/qemu-native/4.1.0-r0/qemu-4.1.0/linux-user/syscall.c:7657:
undefined reference to `stime'

Googling to find a 0011-linux-user-remove-host-stime-syscall.patch is
needed, I am not in the position to update from zeus to new versions,
a quick fix is to apply the patch.

Thank you and appreciate it.

Kind regards,

jupiter
