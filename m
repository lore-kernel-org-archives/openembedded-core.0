Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.14151.1609771116538387377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 06:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ydNYHfno;
 spf=pass (domain: burtonini.com, ip: 209.85.167.50, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f50.google.com with SMTP id b26so64832604lff.9
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00OvuFzPCZqj1HK12o8vTrU7WMJBeHlxAxnaIb9XFWE=;
        b=ydNYHfnoYXZqaPTxTUfwCIx8/xPt4dGOFmx/1O1r2ApcekR9Bi6g3Do2cjix1Njg7m
         WQOMNSzygtsx2pZNCtaYjCfnGTbmoTnPVVFmV0zVbTGVHVSw41ra/Di2RsHcv24v8OFB
         /jRSnzGxrp32a4vHMcy3PDIK9trL9bOPoUD5ASJofIUzF43JL/gGeOjmT3ht0Dl5lzOl
         SCHqnX/gGTQdSYclRwY08XUgYtqcOrC5ej8s02kmiDizXvxWqtTSn6RyTI9IoYIOjL4D
         /iaUly//KwNZGpx+ly6fGDJh2Jqt76yskWiBCdHEtNC8cycUc5ge5Y2fzZN6Fc3Vl1oE
         4ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00OvuFzPCZqj1HK12o8vTrU7WMJBeHlxAxnaIb9XFWE=;
        b=Wy0ie1ckXV5U62ju5ST0E9tOxHSqlBPY95JClhfEXbiHu4Azo5cQREpWK4OYjGF5TG
         MRGlUmpmec1DhDI334LT1lJj2Z9gMHPzOIejIFpqBS/H6rb3PgTqOzuW6KKZzUtCnzRh
         kdKhWF5ieQAsOcpY4myVHHn9VTtJdyvcqXeNHMYT6ofL/KtJ3yMkl0w1YzFJQjJFqYZx
         9z6VCS2repoUQTX/nGNzWYKF/ZG549LJ91eb/L2Kq+ORRfDQKCdzZx7lW68XLf0MSEvU
         /7F15tRBs6x1NrkLc8OOe8JSis90vfIDYMBVSQ5FbZMyjM9JX6Y/aqmDowW7U8rchTKl
         Csfw==
X-Gm-Message-State: AOAM532Tavv/fJ9p422tcY5aKW1gzDyCmtXJhg8F9+Ehg2KmOKpeoJu4
	QfJh8kTUCj7igkaaFGdRimc890NOKXp91N7H6/3FCg==
X-Google-Smtp-Source: ABdhPJxSts7hdxMTiWtsGCAMV985+JD1T/yveotW+NkZkupr7MO0z03zDYkk4SntmshTn6xDFKJoAIc2dx5UbRoeGXw=
X-Received: by 2002:a2e:8844:: with SMTP id z4mr33259364ljj.412.1609771114870;
 Mon, 04 Jan 2021 06:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20201224074354.18751-1-twoerner@gmail.com> <20201224074354.18751-2-twoerner@gmail.com>
In-Reply-To: <20201224074354.18751-2-twoerner@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 4 Jan 2021 14:38:22 +0000
Message-ID: <CAAnfSTtDYnVKC7qSXnJ3+AXbbL+O3ozgARhBLf3W58braPKr1g@mail.gmail.com>
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: add fifo to initial image (sysvinit)
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Dec 2020 at 07:44, Trevor Woerner <twoerner@gmail.com> wrote:
> -DEPENDS = "gdk-pixbuf-native"
> +DEPENDS = "gdk-pixbuf-native coreutils-native"

For reasons that I'm still digging into, using coreutils-native's cp
causes pseudo to crash.

Can we just add mkfifo to HOSTTOOLS?

Ross
