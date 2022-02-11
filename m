Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286A3C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 23:24:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3161.1644621840022051226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 15:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RegYBqbr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v12so17662571wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 15:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VV+dwXxTyhYAgtKbfWod8p4ajYAeUDwS2W8hlBkt5n8=;
        b=RegYBqbrfAq1FL+1gMVtGH/cZ+IZzHoC3aIl4TLib5ab/jp1OQ5/2rjPSfc99a241a
         GG8Xg6jpNaA+xORP9+FXbC7wc6euewA8BVtJ2WW7igY8U5JR9Bk1aJ2G7eDGk5pBUeCE
         wHjz5nSv6aZkvlcetWDyJGShLGx83SIVuEL3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VV+dwXxTyhYAgtKbfWod8p4ajYAeUDwS2W8hlBkt5n8=;
        b=N21hUbKCiO8slCSa4oXV3KXFYWiHWi2yozgb2MF7WUMta+jzHXjZ1xq5Eio56ok3WV
         xDu8hv0vLELXnelgAr5zMphddjv5JzjNALf8mWT/RzemdKFx33OmhzWv/JOmNjYSZxcw
         zx3uHWwf8jyOFL5zvpTokKavQE3Q+jwvK8y6vCtEzFNIR5HvFx55lZEIFJtgCltZMwO8
         QlLxLibjsOMXNovs8LaF46rkmOYjrHHJnaIHvm7rGXzAD9XZwSi6oFiFWenxTWJfDIqb
         T1dQb84ymBdZbr44iBnWC01YVe7wlc6uLAbqN3TZR6f2PISsfNvjIA/k9SSo02SAdJMb
         jY5Q==
X-Gm-Message-State: AOAM532xovnD73Gz0dM0E2KWHEgo92sfgCyCqToG9BWolDLFemF+CSe+
	TvqAnhAB0XVZf6Xbnwkxv3t+Pg==
X-Google-Smtp-Source: 
 ABdhPJxyg3UjkUNiju5s8w3G7Z38FCiE2RLrYRqoleD/LoTNn44yJtoo3W3imxT1kO+nQbq76UDfaA==
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr3063540wrd.593.1644621838548;
        Fri, 11 Feb 2022 15:23:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ec5:268f:bfc7:dcae?
 ([2001:8b0:aba:5f3c:8ec5:268f:bfc7:dcae])
        by smtp.gmail.com with ESMTPSA id
 s7sm6033368wrw.71.2022.02.11.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 15:23:57 -0800 (PST)
Message-ID: 
 <cc48a1cbe0f346f6cb1857ff71269315ccaa54fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] gio-querymodules: error while loading shared
 libraries: libffi.so.6: cannot open shared object file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bryan Evenson <bevenson@melinkcorp.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Feb 2022 23:23:56 +0000
In-Reply-To: 
 <CH0PR20MB3948B7386896646FACB9798EBB309@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
	<CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
	 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
	 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
	 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
	 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
	 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
	 <CH0PR20MB39483D12D0719FB606E87560BB309@CH0PR20MB3948.namprd20.prod.outlook.com>
	 <CANNYZj9zbHH7oef1KeVk+TRBbm6kyur9Ao+hkqTJycv5UcxEzA@mail.gmail.com>
	 <CH0PR20MB3948B7386896646FACB9798EBB309@CH0PR20MB3948.namprd20.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 23:24:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161664

On Fri, 2022-02-11 at 15:41 +0000, Bryan Evenson wrote:
> Alex,
> 
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Friday, February 11, 2022 10:06 AM
> > To: Bryan Evenson <bevenson@melinkcorp.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] gio-querymodules: error while loading shared
> > libraries: libffi.so.6: cannot open shared object file
> > 
> > On Fri, 11 Feb 2022 at 14:46, Bryan Evenson <bevenson@melinkcorp.com>
> > wrote:
> > 
> > > However, I still think that a package upgrade should have a way to exit
> > gracefully for something that is an optimization and not required for
> > operation.  In my case, my device isn't even using the GIO library and the gio-
> > querymodules serves no purpose.  I don't know enough about the entire
> > Glib package to know If there is a way to make this functionality optional or
> > not.  If there isn't, then I will continue with my own out-of-tree changes to fix
> > the operational problems I am seeing on my device.
> > 
> > Thanks, does rpm do something similar to debian? This does look as a
> > shortcoming in opkg design; what would help you is perhaps a comman line
> > option for opkg, --ignore-scriptlet-failures or similar.
> 
> From what I have read, it appears RPM functions very similar to Debian.  The
> new package files are installed prior to postrm, with the old files
> temporarily backed up and removed later.  I'll look at some of the other opkg
> options to see if there are some ignore options that I haven't tried yet.

I think this would be worth raising with the opkg maintainer as this does sound
like an issue with opkg :/.

Cheers,

Richard


