Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.9459.1588690607593193336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 07:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=tA7lGePB;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id b1so2166317qtt.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=V1Xb+3MOJf3r13XxOl3/LzRp6Tlu8tEX6uvdm/jiR7c=;
        b=tA7lGePB7wk2vg9yH1r3bsvx071ILCxiGsWo5hALTsLtvzdL5nzpbCATJSqgK+8hgd
         LVGZERB7jPJTsepfI7LkkRnC9aop9Ef5NL+093gxbJRT5JcLDRyXnQzKexi6kZohM78V
         HpkiSL60NBicgNx//djs+NkGhvBwzmI9Q+Z/qdSlIECqEDIMRWjUWHWH3fDKxYAHLOnR
         6Irti/TEzWfbZ6L4ZYCMJrFRMGL1rnFVzfD1GpmFjhlpLwdxoCDrIlSQNUP1I7la4Z2O
         ePWWGXy82m/70zDKu+7Y8wH50A6E36a9mWw+A3uR1jyu1EfJLJrpVoI5f7A4aZOqPVYT
         /elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=V1Xb+3MOJf3r13XxOl3/LzRp6Tlu8tEX6uvdm/jiR7c=;
        b=X30xlYjArEYw8b6bSvJTuSeegHTbSCbBBCDzIXGVvUS8gLHJUkK6746kvXvUGUB0rd
         k+4Qp+RicuPXUcdaIdNcROim2nu8kvG9EZk3YBmff4qKasefXJwVuxMeZALJbNVPNpcB
         4INZaL/IQfVAiF+tRs88zDzKKfu0T9fwHGtUbWzAuIDZYQ2an2Ru5UHP3c4+AsqSZQqZ
         dNHPVpHDoJ9yweVRFj06Cx8BZwu2nb+/g3vz9NhBOwW21CgnAjh8+qMauOItR8abpYZW
         IJMfEbi+pj0e9RWCDFpzFt9rs9qHfcPTinYFkHB8utSLbGi4idBhV4IkNsR2cYVVkwND
         SmBQ==
X-Gm-Message-State: AGi0PuZQyPCLkOgF3kI70HmVOvUmMEJs3Nl8p4duZaMjvnW2/E1qDnaP
	pnsyGtqp9o8fhfIrRwD4nEZxE21ohE5hxA==
X-Google-Smtp-Source: APiQypKC2KAnnUg7wQMxLf0AP2bGL4LbDs5OVk8dDp8c0YtJRilr2n5MUbe6A+HAXIeabPEf71Bygw==
X-Received: by 2002:ac8:690c:: with SMTP id e12mr3181426qtr.357.1588690606413;
        Tue, 05 May 2020 07:56:46 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id n206sm1323552qke.20.2020.05.05.07.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 07:56:45 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f180.google.com with SMTP id g26so2105136qtv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 07:56:45 -0700 (PDT)
X-Received: by 2002:ac8:34b2:: with SMTP id w47mr3069137qtb.271.1588690604917;
 Tue, 05 May 2020 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141004.9988-1-sno@netbsd.org> <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
 <F3B50FBD-30B5-4A2E-8EB0-624B5BF304B6@netbsd.org>
In-Reply-To: <F3B50FBD-30B5-4A2E-8EB0-624B5BF304B6@netbsd.org>
Date: Tue, 5 May 2020 11:56:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqkU3YNumNOLbknsFKucMbf1Xsc=niR4MFFk1dQt23-PA@mail.gmail.com>
Message-ID: <CAP9ODKqkU3YNumNOLbknsFKucMbf1Xsc=niR4MFFk1dQt23-PA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] initscripts/init-system-helpers: fix mountnfs.sh dependency
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 5, 2020 at 10:43 AM Jens Rehsack <rehsack@gmail.com> wrote:
> > Am 04.05.2020 um 16:21 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
> >
> > On Mon, May 4, 2020 at 11:10 AM Jens Rehsack <rehsack@gmail.com> wrote:
> >>
> >> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
> >>    Author: Yue Tao <Yue.Tao@windriver.com>
> >>    Date:   Fri May 25 10:48:08 2018 +0800
> >>
> >>        initscripts: Avoid starting rpcbind daemon twice
> >>
> >>        Check the status before start it to avoid duplicates.
> >>
> >> the use of a script {/usr/sbin/}service is introduced - maybe earlier
> >> provided by systemd, nowadays mostly by init-system-helpers from
> >> debian project.
> >>
> >> For the very first shot, maybe discussions and improvements based
> >> on that script collection, use just the init-system-helpers-service
> >> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
> >> boot stage.
> >>
> >> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ...
> >> +RDEPENDS_${PN}-update-rc.d = "perl"
> >
> > Can't it be replaced? using perl here is not nice.
>
> Be careful :P

Everyone has the right to do bad choices in life ;-P

> Seriously - it uses perl only for it's update-rc.d (which I didn't ripped off
> to give community a chance to discuss it). Generally - especially with the
> runit, s6, openrc ... in mind - we have to grow from there anyway and I like
> our current update-rc.d implementation anyway.
>
> But I would like then to have a 2nd commit (for documentation purposes) to
> kill it or we just provide it and let people choose to use this one over
> meta/recipes-core/update-rc.d

Generally, I'd prefer to not give the option as it causes more
troubles for supporting it in future. I am totally fine with it being
dropped on a second commit for sure.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
