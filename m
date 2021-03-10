Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.8673.1615383455466542305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 05:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZAG1fSTk;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id b7so28107123edz.8
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 05:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VZbUwo+ZaFPTiQGEsgOCB/DjNya111NONU3EJcWJci0=;
        b=ZAG1fSTkWSwEXI7cmQI994NYIi2Fi9g2js2fuMkglnH0Yxu50chrF1DZR18e/+59iB
         0yka2g2XoT75crn72Y3gw4UsDi/oGDqofFhdZnjReAJJbKZmKzNvEN79A5KjcHBpWzPe
         KvstrJ5DR8dJ6n3Mj4omkdiUKgIfjYE81wYBk7ejWJl2wmR+lmBt2tGxl7jN8B51aC8v
         HV152BcZUPtiTRhJl2k+VNo7YtyWzi+QOizjBThKBh04D3SwjgYCLuNo6JslamBERUB+
         n0Mowd8tHYAkRJQPu5dh3X2Ndwruhb6QtfjKvganWq5hFN+X+HnV+ng1zykOIQQfjiDt
         SoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VZbUwo+ZaFPTiQGEsgOCB/DjNya111NONU3EJcWJci0=;
        b=nthujkbGIWW3DJQh/13xeE37SjuRkdfX8UTBVHM77NUPfABBuqMKqGURJuDiYvGE81
         ZonSTvRH//8mCXRpinbdUXj/PyKbpolmOn4oDBf9awPZhh5ha+Hu5kce3dmM3ioEW4qk
         eGOeBjaQCJPWoms2TILiPssYqbeLboMFrjm0T9TTr4ZO7TSyCSHLsUZjRySfvey47o6K
         3Kvij9QqJEXi8AeoxBmdtIkoFNycpnQMGHjSrvTWLQrOmeTnQ5JnnHAGQcAXU/KbRIMt
         xllKOrEDFXH+HMt9ot4B0miCe9WnwKRW7I2unvB++D5z/3gNebMuELqu3lNGckr8NlDJ
         hihA==
X-Gm-Message-State: AOAM5326xcg/DTVyQHiwBhDmVvyYyAO3gdIpks1s/dgr9jtWogav/b7R
	d9ykSo8B9GiCmwuhxuCBgIFjIPFSBZX9pcBkpcU=
X-Google-Smtp-Source: ABdhPJx8O+cmE+K1ddGuysKbqEVS0mTFa0cCT/QWqR8MgUIm2WwwG4feuFBsawSfZJ4tsmcZQZBMkITYPdX+8Yv/I30=
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3405959eds.352.1615383453834;
 Wed, 10 Mar 2021 05:37:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
 <0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
 <20210310114234.1b838cd8@kmaincent-XPS-13-7390>
In-Reply-To: <20210310114234.1b838cd8@kmaincent-XPS-13-7390>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 10 Mar 2021 08:37:22 -0500
Message-ID: <CADkTA4PFwiJM+TBiC3457jNa-GOtiGYa3-g9iy7DKCAcsfyK8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] perf: fix reproducibility issues
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm unfortunately out of time on this, so obviously this can be
dropped and I'll work on it again for next release.

bruce

On Wed, Mar 10, 2021 at 5:42 AM K=C3=B6ry Maincent <kory.maincent@bootlin.c=
om> wrote:
>
> Hello Bruce,
>
> On Tue,  9 Mar 2021 14:23:36 -0500
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > perf has been failing our reproducible testing due to multiple symbols
> > containg build paths.
>
> There is still reproducible issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/89/ste=
ps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/84/ste=
ps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/86/ste=
ps/13/logs/stdio
>
> Here is the diffoscope log:
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210310-pc9v=
zt2k/packages/diff-html/
>
> Regards,
>
> K=C3=B6ry



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
