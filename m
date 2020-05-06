Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.3986.1588797761941074857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 13:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XKmokiv9;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id y4so3752596wrm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0N09TGlr5MG9tq7DuKnZ1Eug/JMjYZ/PJ0AYklSJmYY=;
        b=XKmokiv9k5jxkdA1gG0QZp8WnTki2mR7oGds+NDBzgAmYCUsp0mY+F4YwCerF+Vz+s
         FEsTTysP30g+PDXszKY8ogGKzeuJIArKFJv3BA9Ch7+21lyZvr5u47fVjEk+AmZ+hwMo
         5bRNTCwgWz2NS04nkHGDTPD7oLbxk8RFDBFNiQn71gx6R54PAR7xtju3ixY3awOwOcKR
         ojkubJf5WPAJl3VOO61M7wGtiiAK2HGQmJtTvIAzxdosfjs0Uwn4eY4dSA5b4cOGTzsW
         pC6rrjQf3A8BTQsZU70IUfKWI8CByAiD9HfJgo+TwdDjHGd8TntYSwZ4s+EK54F4UEJy
         f6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0N09TGlr5MG9tq7DuKnZ1Eug/JMjYZ/PJ0AYklSJmYY=;
        b=LeaNlqWV5/k1Zw/GojezBLuBc8eCE9DH8ph4D9uYvif01gD8DLWQuGlKuYqEWrwjtO
         3gOLBuozRuGsJ+K4tVymM/TzAePms03bMwznjYq+rZaachlS/slnarFB+B6lbQHxPdq3
         3C8yWW6cP7FhmrmNeBsyUMNReXOwYJa/ilPEXcjY/qeJDvTuReocoSNNcz2wjI7TWsAW
         3Ai1Div3NkucK4C+ap/3D946oLZj/Fh1NmhO0M8oCB6yAazFeOMLx/XrdI+Y/yE/Ir6x
         Fw3xOEsN87rtCAbgyG/featmpU4rVC0d/cjJnW0nOsN/i8Pp1YDhBNvfwWkVlIn3omqc
         aXeg==
X-Gm-Message-State: AGi0PuZhAqqeXe/Q8CV79+CkEPAq9Jh9cRAquM3Ot/qz0qq96LkLWnSv
	aIetmwYG0ZFPzk2h0IuDAMXeKnfUiy++Dwjeeww=
X-Google-Smtp-Source: APiQypIgInFfGBSBOUuPjmexw0vsPCagYscqeIXrB4t8JdT6aGRdddL7murPh0UFiyzu08EfRUWyfvnPBLZz6JPxqHM=
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr12325515wrv.73.1588797760404;
 Wed, 06 May 2020 13:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 6 May 2020 22:42:29 +0200
Message-ID: <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com>
Subject: Re: [OE-core] Cannot disable weston
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "Patches and discussions about the oe-core layer (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 6, 2020 at 10:29 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> We are no longer able to disable weston service with standard `systemctl disable weston@root.service`.

I've faced similar issues a while back, and also found out that weston
has been actually started twice: once from udev, and once from
systemd. At that time, I removed the udev locally on the EVK and
didn't look further into it.

> On boot the service is started again. It seems likely this started with the introduction of a starting udev rule:
>
> https://github.com/openembedded/openembedded-core/commit/aa3bced2e1de2f4ba507aa014835b06edccc138a#diff-d92aa97566c1bd0dd1eb817bb4511cda
>
> Is this behaving correctly? Can the rule be made to honor the service disablement?

Or the other way around: can the systemd service be disabled? Or in
general: is it possible to leave only one of those mechanisms, and
which one is the correct one?

>
> Tom
>
> 

-- 
Regards,
Andrey.
