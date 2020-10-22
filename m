Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web09.8439.1603361810499305041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 03:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gFDQGKdx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id y12so1543433wrp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UBusXDjVRgUADQCba+l2wMJS7TOq5uHBmWK/iHp2cTM=;
        b=gFDQGKdxO3+fIZm9WfJEiFbV4EXyuV3FMSrCWip6c87Pc4cbT3SiwNez33MeetV7v+
         HRvCQ6O7ItdGKHFfu0QpNGEXI8RMhP3A/Z04gzmej6SbRSTD0kIMI0TLxar7mLdRu97G
         8tJYRSdRu8t++wGdjiNyAPQAXn0v8gv9l4Ncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UBusXDjVRgUADQCba+l2wMJS7TOq5uHBmWK/iHp2cTM=;
        b=XVRE0CP33hUpqjnmo3jCvLekNLgd/xXd5DT8b/BjhscGogb0mOJvJR7RrE0jwAAvDD
         aBe1iBZNKgmy+dc2qwDpp0AaHwTIDa5MW9PMKYTXjQ526orcoG4/kDExjXtCvkJ33RmO
         91St0uYvccfl5DqBjv6vmSwmvs0zf+9R2ROAhT1HeH2d+1UzDw3B08vkKk06vGi4pV+7
         ZiRn6MjwSsCQjmGSCrECYLT4JLZ77fg9e4FJOZd18zkVhO175CPL6/E0UqbQL+urk/hd
         flOMEZEJQbGXSiOhkaWPTGJi6qYUwCNvuJSa/yi8sGwFLmqTzwbuft6m2+cBqujEP58B
         qM0Q==
X-Gm-Message-State: AOAM533e2L78aGohG6L9i16ok08MVS+9OlvrANR7VO5OiujEA0fichw1
	2ex+3LcSC1Ug+pe/fVzhkFErhQ==
X-Google-Smtp-Source: ABdhPJw2TeYemzdNwgVLqTwht1OZ6C53SpuDtqJXy4qYpBzsUdNfPX07Hoi3OQG7gGRq+EY39mo9iA==
X-Received: by 2002:adf:eb04:: with SMTP id s4mr2024853wrn.81.1603361808988;
        Thu, 22 Oct 2020 03:16:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d2f:b755:7bf1:d36a])
        by smtp.gmail.com with ESMTPSA id q6sm2899795wma.0.2020.10.22.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 03:16:48 -0700 (PDT)
Message-ID: <63688d349ae0d710cf2f139c22df4dc76c3aac3b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Fix install path since S doesnt have a trailing slash
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Alejandro
	Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2020 11:16:46 +0100
In-Reply-To: <20201022083612.kourjuijorkmw26a@qschulz>
References: <20201022083222.1506844-1-alejandro@enedino.org>
	 <20201022083612.kourjuijorkmw26a@qschulz>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 10:36 +0200, Quentin Schulz wrote:
> Hi Alejandro,
> 
> On Thu, Oct 22, 2020 at 02:32:22AM -0600, Alejandro Hernandez Samaniego wrote:
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> > ---
> >  .../baremetal-examples/baremetal-helloworld_git.bb            | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> > index 7a580bd885..946a12d0a5 100644
> > --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> > +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> > @@ -40,8 +40,8 @@ EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
> >  # Install binaries on the proper location for baremetal-image to fetch and deploy
> >  do_install(){
> >      install -d ${D}/${base_libdir}/firmware
> > -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> > -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> > +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> > +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> 
> I'm almost certain do_install is being run under the ${B} directory by
> default:
> https://docs.yoctoproject.org/ref-manual/ref-tasks.html#do-install
> 
> So I'd actually just remove ${B} (or ${B}/) from the path?

Personally, I think it makes it more obvious what is going on...

Cheers,

Richard

