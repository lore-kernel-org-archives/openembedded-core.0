Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.7851.1603357984546950692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 02:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gumonaZg;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id h7so1275449wre.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MiIWmv3QPsT0mGqvL65iBntPUe5P/HAah53pYZMVIrY=;
        b=gumonaZgQuzRXhQH53kZJlSYIUkYKWWN6dGlgCZSQtLy6Vtcfo+g39W5JuHB9H2igZ
         /ps6Wtg35IyXqp/dp6S3yEFNV0UYOCMGBCTNYqTV4AJk8OGRPb382HNZaEAoywOgKRnF
         kqDfUqN+Ynwz8jVF2vjNkcTko2EBRmZU/KU+F2CUa/qVKdLjhfrD/lJ1uxDz5neJAYCy
         GqiZiCvW2ZImyaggzSyQUQl1otZwxdftLXZZcGqzJMuFg8lR4P1kePkQPWpq32ZuEoo8
         S+EcoiSwsejPY7eZ7tROdp5RZrNqwKDrEQmIKGhGKpNXacYIKIKUqHfjxisZ6DLbLrn0
         6jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MiIWmv3QPsT0mGqvL65iBntPUe5P/HAah53pYZMVIrY=;
        b=JP16MdCMyAu3ry4eU6GREtfL9sn/4rnSjBE97x2YubZK6Z52SU/YfPHVYGbDn2vAR5
         Ri35MyhfbqrQrJwLgPKQKVHCMLIzbvpfnjzxcKmnFOHB1qJRl9JUuEMxXHDHgx1/2bF3
         D2tPs9x5aLUYc18KzJn4jI+0m9nl/Qzkj61sReCNF9QRZlv3anH8XOd+H0j1HHrmnF3Q
         tABPnTOcyFgVsfBp+4/VkrYfkO8Y1B0baTcMLviSrjVEcJgSgxrwQXfSGUxYenqDT+FR
         tOm3dPfD0NC+qzY+JX3HtVqs37vOIN73+Z3E/L5AzPG46tI0scgkMwXi0Bk+E6M/1EjK
         YerQ==
X-Gm-Message-State: AOAM532B2geSGQsHmCAz3Ukz16OFlkVqmOj0U1atpTW0P+FJBoIaNRvG
	gW+oyG0VXE4aEKZbwh/2pFA=
X-Google-Smtp-Source: ABdhPJwvdItVOFFuG3l/5Zohl4Z39Ck4f7x/2Ij7Cs4zMynDolT/XEoutd1WnmR3z6L2rHBIfwskZw==
X-Received: by 2002:adf:f103:: with SMTP id r3mr1742439wro.153.1603357983095;
        Thu, 22 Oct 2020 02:13:03 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s11sm2359921wrm.56.2020.10.22.02.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 02:13:02 -0700 (PDT)
Message-ID: <fe0fdbecda63255e6b15ff90df677989b5f4a579.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Oct 2020 10:13:01 +0100
In-Reply-To: <CAMKF1sqeeYnhu_677KdPLeSa_D3mMJO6oPADEpxS0hVsaLH_Nw@mail.gmail.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
	 <5d383a0d9c3aa724fc1aaac4fcd6d75fe5f2dec2.camel@linuxfoundation.org>
	 <CAMKF1sqeeYnhu_677KdPLeSa_D3mMJO6oPADEpxS0hVsaLH_Nw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 19:21 -0700, Khem Raj wrote:
> On Wed, Oct 21, 2020 at 12:02 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2020-10-21 at 16:58 +0100, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > The main difference with squashfs-tools is the availability
> > > of a shared library and a programmatic interface, rather
> > > than just command-line tools.
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > >  .../squashfs-tools-ng_git.bb                  | 37
> > > +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-
> > > tools-ng_git.bb
> > 
> > Should we be switching over to squashfs-tools-ng and removing squashfs-
> > tools? I'm not sure we want to support both versions?
> 
> I am not sure if we want to switch to ng yet as on option its good to
> have. Perhaps in meta-oe or some other place.

Yeah the command line interface is not a one-to-one mapping, so
probably best to keep both around.

-- 
Kind regards,
Luca Boccassi

