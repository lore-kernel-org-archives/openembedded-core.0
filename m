Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7.1623163849793187063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sXLAdetQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id f2so21862682wri.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=zreZRnpgNVvuSCc53OsrarBFWYijQZ7WyLrqUrM0FRI=;
        b=sXLAdetQKuLwvtEmGde152Pp4Omg4osTse9DuQ2JPHeFqYr5YN8LSMhZYG/ZhnLq8h
         In2JmCNepdinfrRUGF95cYtUKRhPe4jK3UvU8ShEZPm4B/PztmQXkolwmIKS1wY7mMUB
         PGj5srwfWeQ6chJr+/C0RF2kgv94veXdzkg6JaSFIplOfb8uuH0VisPisAGzvoWYgi33
         4jD4xosyp35v/647uul/Rch5XOroLxybx+ouegnA98N7LXOWi7gYsgoDGaE7xuQxfUqP
         PNfEQzh0YInrSIPe2IH3K1ReNyPi4uRp5Ww5siJlW1oZo4+PW9bvE6kSFInJlQYKNvJg
         N8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zreZRnpgNVvuSCc53OsrarBFWYijQZ7WyLrqUrM0FRI=;
        b=P6ansPg6RtpMKtup/LUoOT4vhMgGOyf9w7rmX2qWGdXfR3SA4E4atk3rvmQD/YWjXy
         5hGSnh3Aj3I2fEaMzPCVV2lGxwr6h2ZcX+HcLxKQuD3C2oLwZ2GvZ3EYUDmo8E4+PvDE
         XbWSNyDAbFBzB3krIMKRf6e53w2UxtPvTwBc+VxUzDpjoWzGCLqZS4PRzsL06Ck4qfIi
         Zys0+60Y/xbbIb6gTUBGfwi8rXYF/bJ2b7hdvGbS1ya+qi27QhwiGiYeGDud4C9TqPbK
         1bboWE2x8YAp3GhthOe5+Utx91F0K1rbyZmy3hxQkPLLNalG1t5G3dBiwIo2aHywdNPE
         7rYw==
X-Gm-Message-State: AOAM533oCUTNFQG1zglrDaQv4/wjigXi1eDVjQERg8lMniT5/Hm6pS0f
	Q+2heTE1fKkXdFeiaclhFHFO/+wkCGpnBJCNAs7LpgT+3eWxXrzhgbA=
X-Google-Smtp-Source: ABdhPJy5ahq/ZhDy6xLKQQZfxjtWUelpLoF4bY0EZnHLKdo1s1tzf4nnAsZTBlBsCXqPCo5GZnXtOY+4XAi5liIm8hc=
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr22753902wrf.299.1623163847591;
 Tue, 08 Jun 2021 07:50:47 -0700 (PDT)
MIME-Version: 1.0
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 8 Jun 2021 04:50:35 -1000
Message-ID: <CAOSpxdZF30Kmab=WfDm8gbRajUikXzfX5khbtZmBJcPf66hi2A@mail.gmail.com>
Subject: openSUSE 15.2 support on dunfell
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I'd like to work toward getting openSUSE 15.2 as a supported distro for
the next dunfell release (3.1.9).

Initial autobuilder testing looks fairly good, but I'd like to get
some feedback from people who are already doing dunfell builds on
openSUSE 15.2.  Have you run into any issues?  If including
meta-openembedded in your builds, any issues there?

Thanks!

Steve
