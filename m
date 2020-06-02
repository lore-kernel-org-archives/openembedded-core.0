Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.9215.1591100266003931293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N4kLmyi8;
 spf=pass (domain: konsulko.com, ip: 209.85.210.44, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f44.google.com with SMTP id h7so10741508otr.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VP45gbURkAFtYKnhZaY8fncPFJmjXOXVmZ8wN31WO+Y=;
        b=N4kLmyi8DYwb6lYFxYwdbgRlgUXFaCbOURsUztF+aV4Q3vFLI1zC2LPibbXBSWyHvs
         mNIX8zb0GpDE0mpZpSyy7oV0h6EFs5D9IWrHe4F0J6djro9/suLysuNJQjIywsgXYhP/
         ojQ4/T1N41RDMU+qegNigaTfGIvUGPeAQI0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VP45gbURkAFtYKnhZaY8fncPFJmjXOXVmZ8wN31WO+Y=;
        b=ri8lnwJfQvZi3vcjBTVd+RBFmp/TrBZPNYfJ40USSUP5XrGPYJFGOqgmCgRmUGF/YD
         l+04LSC6MA7r5SeMHf7sSqotBAT9q30dyd2nQpiownygDpf191oFZyzqeTtvhmaw5avR
         UwZyI6PmytNul/wLqifASKiC6U5yu6rU6WBlWmRRx54MaXlhap6UA92Eg2uMyP0B0wgt
         u5+VIUaf/4gZnrfKpjzBjuv/sCWNRYo2Lniu6UK1rumMe97xZmNWThRUMvriZva2Pkox
         SXe3l5vFWSZF8GTqwOc/6c6WZ/hV4aUtLKJxnx6KoJSclKPvC1nnLR8cfJ7of64k66Bf
         s0OQ==
X-Gm-Message-State: AOAM530gmp4ZFbriEgwBkOVObXXppoAl48DKeOSrtEUkQYCyuF0i7336
	bafJkBiMMGvWy6gyGC6gyDj/a9wgeuUuSxaph2HRG6eJR0I=
X-Google-Smtp-Source: ABdhPJyTMqHi2UtpfSCoGWe01koJn4OTdS2NBYk6pLCCNDjC5romy55T+JZ6JVx+75jYGx33+/bKIvcgbrJ0HGwWbqs=
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr3874931otc.92.1591100265260;
 Tue, 02 Jun 2020 05:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <25Tw.1591097911764956513.5rNg@lists.openembedded.org>
In-Reply-To: <25Tw.1591097911764956513.5rNg@lists.openembedded.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 2 Jun 2020 13:17:34 +0100
Message-ID: <CAM9ZRVvXyTKRzUSR3atE97A+47So=GYDZ0K4aAACV4g3Uj4WuA@mail.gmail.com>
Subject: Re: [OE-core] error while adding meta-python layer
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2020 at 12:38, Pankaj Vinadrao Joshi
<pankaj.vj@exaleapsemi.com> wrote:
>
>  i have cloned meta-openembedded layer and from that i am trying to add meta-python layer but i am getting following error i am adding this to my poky
>
>
> pankaj@exaleap-Inspiron-3584:~/raspberrypi4_image$ bitbake-layers add-layer /home/pankaj/meta-openembedded/meta-python/
> NOTE: Starting bitbake server...
> Traceback (most recent call last):
>   File "/home/pankaj/Yocto-practice/poky/bitbake/bin/bitbake-layers", line 95, in <module>
>     ret = main()
>   File "/home/pankaj/Yocto-practice/poky/bitbake/bin/bitbake-layers", line 63, in main
>     tinfoil.prepare(True)
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/tinfoil.py", line 414, in prepare
>     self.run_command('parseConfiguration')
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/tinfoil.py", line 470, in run_command
>     raise TinfoilCommandFailed(result[1])
> bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/command.py", line 74, in runCommand
>     result = command_method(self, commandline)
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/command.py", line 275, in parseConfiguration
>     command.cooker.parseConfiguration()
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/cooker.py", line 433, in parseConfiguration
>     self.handleCollections(self.data.getVar("BBFILE_COLLECTIONS"))
>   File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/cooker.py", line 1225, in handleCollections
>     raise CollectionError("Errors during parsing layer configuration")
> bb.cooker.CollectionError: Errors during parsing layer configuration
>
> this is bblayer.conf
> my  bblayer.conf is as following
>
>  POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> POKY_BBLAYERS_CONF_VERSION = "2"
>
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
>
> BBLAYERS ?= " \
>   /home/pankajjoshi/Yocto_practice/poky/meta \
>   /home/pankajjoshi/Yocto_practice/poky/meta-poky \
>   /home/pankajjoshi/Yocto_practice/poky/meta-yocto-bsp \
>   /home/pankajjoshi/source_meta/meta-raspberrypi \
>   /home/pankajjoshi/source_meta/meta-openembedded/meta-oe \
>   /home/pankajjoshi/source_meta/meta-openembedded/meta-filesystems \
>   /home/pankajjoshi/source_meta/meta-openembedded/meta-networking \
>   "
> i am doing anything wrong???why i am getting this error??

Are those paths in BBLAYERS correct? I see
/home/pankaj/Yocto-practice/poky in the bitbake output vs
/home/pankajjoshi/Yocto_practice/poky in BBLAYERS.

-- 
Paul Barker
Konsulko Group
