Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web08.20038.1629087881852689205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 21:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lX8TwQS7;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id a93so30501996ybi.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ZMc3u6Bc+7/ansl7QqIVQ0c/31RBJekvTJjnBr1NhFg=;
        b=lX8TwQS7YHJAHy3RQM3v6UcpwRohGZSuWaPO345VxkwP2k4BzrUsx4U05PiWZWmgVE
         /3jSE+Q04lId2PB7kbW+NJZN1Y4OvpRqTdhEcdythf2wYqeg3/TP8PjHZ33a2Qu/1iD8
         6Fl1rdinvePVA83yQ0mCN81+p5F95hRmrj/BsXwToS4VsNzWLRwRkX09wsjGph8Lhxyw
         YPgXhAPzTndUeK2RK1W1nxSH+8DMVyuV2qv5LeMS57hm2zMe6FePBLNpIzEuSiy5hW4H
         QKzFMXVp/Gd/gfr/HcWjvqbaJPzOHcgW5na2qX87/lmsdMcVhB8A+oeYCMrVj06iVaLH
         KtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ZMc3u6Bc+7/ansl7QqIVQ0c/31RBJekvTJjnBr1NhFg=;
        b=KvFz3luZX+aNSHUji7SIMwLYkRlXG5SbHeE049lNbq4PQQ3NbFB4mHJ1HdxzYqtFhr
         vx2MgFMHkUWamBkYK5FJes9ijLXHxJG3TxtsZt5mrIOk+OhU2UcsRIKbCsm/td62v2X7
         qQBCgD9onLASR5nahdemnRZvJNGC8/I/zq9CofYZs6ynT9p5QwzsUuAEKZTNol0qGTJ9
         dPtSGob1Lv5HU9lrLKmj7GmR6VobBpdsWeqYtXjGz6lQuYe1oq0a3UTFhyZgfhfWkmzS
         ZKqDbvECM9xInzvfgvKiTc50OW/zx/MmQ+g0ini9KTjFbvhRI2GjcycTc22WmBtfDyFH
         zhcA==
X-Gm-Message-State: AOAM5313CZiTfXpw/xOoaJvJ63uMMJenE6ufVvGXOpGOcpdc663kAMqu
	aV4a8yK6tkRyO0P3UyUME5n/y7xSgvEt1JarEp8=
X-Google-Smtp-Source: ABdhPJwo72hIvGSeqpsk+vuPOn2HlBUPx90pbZBCpYg07q62z2QVsMVY/9TmLe+H19pw3StMrVJhrZgvvsPIy4Ta0yE=
X-Received: by 2002:a25:4114:: with SMTP id o20mr19062712yba.330.1629087881045;
 Sun, 15 Aug 2021 21:24:41 -0700 (PDT)
MIME-Version: 1.0
From: "JH" <jupiter.hce@gmail.com>
Date: Mon, 16 Aug 2021 14:24:05 +1000
Message-ID: <CAA=hcWQ==cXXBygi+DGkx0D=sVs7hsZnZ3zDs_6d392oHhaqmA@mail.gmail.com>
Subject: Failed to boot kernel 5 after upgrading to Hardknott
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I upgrade Zeus to Hardknott, the kernel version is 5.10.4
(oe-user@oe-host) (arm-oe-linux-gnueabi-gcc (GCC) 10.2.0, GNU ld (GNU
Binutils) 2.36.1.20210209), it was failed to boot the kernel :

---------------

[    9.418302] systemd[1]: Failed to mount tmpfs at /sys/fs/cgroup: No
such file or directory
[    9.431805] systemd[1]: Failed to mount cgroup at
/sys/fs/cgroup/systemd: No such file or directory
[!!!!!!] Failed to mount API filesystems.
[    9.463151] systemd[1]: Freezing execution.

What could I be missing?

Thank you.

Kind regards,

- jh
