Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.4760.1591215588838735391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=obUAaant;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id q8so3776547iow.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvKHsn5Ndz8MGhLDXw4/xlN3vM+QgZsTHqbHumg3bME=;
        b=obUAaantabMvVgMsSPHDBy37BLWGQPmUh1TOSQRU7Ta743mblBYvrBOopvyJO0wspR
         rBwWoijtc5c0t3heVG7CzlQmjS7Rr84M2uZKPybiMh1JhSSCSSgu82lYiyilchLTwBc9
         4k4XuDy6gH5jQZ9dPrWvACoBu2WVShDiVjGkiyw3eCuIunJ1Zdcw9EEkTqN7eIMPeWBe
         5kdPFPcsVbT0qsfpakjnfKZ/mxMrFRVSOLb3cSli7tdxuSg3AGHALCAM17q+8LmxpegW
         4xJtdkFrfuHmthXNYnSv9ycJGsg/qunPHxaC+n+Bu1IzfJJ5QIlkoKQel8ZYOeW/FnkZ
         JDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvKHsn5Ndz8MGhLDXw4/xlN3vM+QgZsTHqbHumg3bME=;
        b=ikFrYnuNAdwFfu+4lrnFSt8WTdWGviC0DhtohopzhE9euDwU4t2Q9EJiJnvBodjyXo
         pCB0uq9ZW5o77Dws6c+TLcigV+7vje6wvlNjlh5L5mZltKLfXW0iadjR+hPX2LKiKZa+
         tCNsbBxBMRmNJBZ0bAT+GA9xqe9GGyhX/26xKJpqjzWgEaGyuZOLuz5CRcviX/TMtVU4
         mPuec2rFUSJHwmQ+tsR6lkW42RTlQZOzh6bChKbm4HvuJL2d9OfPPehRak0zUiMdfNmJ
         1Vj+bm3r1wH85r7JU64Lnm3gtcormN1EcOOCjBKmV0+E2EVpxl/Rw7ubWTBwWlzOkV1S
         6tXQ==
X-Gm-Message-State: AOAM530Mdw+R3+KXfcSdxgJ12yNQzIxWPCAe2v0SxkENOqJEdV/NXeE+
	oTiXd1YIp4+TTpmpbSzkHQ8GlGnSG/vDPQwssRw=
X-Google-Smtp-Source: ABdhPJwGGxT7ijR3x2XNE3tuquTE0CkAAsxWvClTAO57EZyKdqsal87Uhnq8uw1olDIPUCYZilNf5HYUbGSmkjmRyaI=
X-Received: by 2002:a02:1a08:: with SMTP id 8mr1466071jai.124.1591215588325;
 Wed, 03 Jun 2020 13:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200603034306.19886-1-yi.zhao@windriver.com>
In-Reply-To: <20200603034306.19886-1-yi.zhao@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 3 Jun 2020 22:19:36 +0200
Message-ID: <CALbNGRT8SCw8Fwb_gjGgrYgpqf3pkiFkzAo8T9SMZ2LSfFU5-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: add missing runtime dependency for vte-prompt
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 3, 2020 at 5:43 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The /etc/profile.d/vte.sh in vte-prompt package requires
> vte-urlencode-cwd command which is from vte package.
Think this is addressed by [1] already

[1] https://lists.openembedded.org/g/openembedded-core/message/139110

Andreas
