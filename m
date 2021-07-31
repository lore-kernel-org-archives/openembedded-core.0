Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.3451.1627737256203652626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 06:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TGXbElaI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k4so4277070wrc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2j78xaSxOAkiKwz86IZ6GMlVtX8vUQSIZWbHs82ToeE=;
        b=TGXbElaIhuCKUT+wEbsIHbXkz2cmcdr0i1rLmZ68Gr6SxRvk6K4Oz3ijtceVqV68kD
         ZtSnQCMJ1QEOVWt+mRUj7JTR7raxCmH9uuKlA7EEBbOyjVe1d1u+vrruWqdJwyf+Rs84
         q//PGfBzDriHMo/dspCG2Ov0UkSms93aTqBnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2j78xaSxOAkiKwz86IZ6GMlVtX8vUQSIZWbHs82ToeE=;
        b=c28C/NWok4UdEmp9iujDkPWX5va6NU1dXRzhe34kYQckGIUT+TEn4OBQu6aeu15q1Y
         QZ9dpt6ctcEkyH1Ch9K3yjxkOCEjUF4tkrxzszFd4yUegcMdT+qoBvtJ9Wg93DZglNE1
         qj2yqyVl4AHDwXCuMhdYMkYYN87q2rxWkNJ+lg6BEBZDPlZO+jxaCAyP8wxmH9HMO0xo
         Gqp2OIcryChZFJowkGC4gR3a7ZYA0ty4Ph3SYS0Ji2IhYSQv/ocG4FG0UOIF/aL8oPyi
         ryQ+e9lwbb/mbsAhV0Id8IFtsIP2OXJqPGisFsZhT99Le7vh5xeN4gAoCrh/0fc84hUd
         lbcw==
X-Gm-Message-State: AOAM5309u73PMjco/JKS2AL3L5sFVl5lRg5+rpW/lYntf5HsmnuXK6ef
	GL4FFrRWUQOHRU03oPysV4tYag==
X-Google-Smtp-Source: ABdhPJxZMA1ZJeYNgiHFgtWcxHO8JcLdy9buIzXZl6NTWOWm9wUzi+e5+XgBTVvtvQfgZhIhc3Yd2w==
X-Received: by 2002:a5d:4f82:: with SMTP id d2mr8294068wru.257.1627737254581;
        Sat, 31 Jul 2021 06:14:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c6ef:507a:8269:d07b? ([2001:8b0:aba:5f3c:c6ef:507a:8269:d07b])
        by smtp.gmail.com with ESMTPSA id h8sm4856599wmb.35.2021.07.31.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 06:14:14 -0700 (PDT)
Message-ID: <1b4ebc0e442ccb7be375247300986d826c79279c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] scripts/contrib: Add override conversion script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Berger <oecore.mailinglist@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 31 Jul 2021 14:14:11 +0100
In-Reply-To: <0d8f3595-8738-4fa6-ac43-4844f06268cc@gmail.com>
References: <1695F9FE617EA75A.5172@lists.openembedded.org>
	 <f147b797e6dff3358dde45fde9e911c01e420c86.camel@linuxfoundation.org>
	 <0d8f3595-8738-4fa6-ac43-4844f06268cc@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-07-31 at 15:55 +0300, Robert Berger wrote:
> Not sure this is the right list and mail I am replying to ;)
> 
> I was wondering what's happening with backwards compatibility.
> 
> It looks like it will not be possible to have a layer with new syntax 
> fixes which will also work for some older versions (hardknott and older).

That isn't correct. There are patches backported to the bitbake 1.50, 1.48 
and 1.46 branches which mean the older bitbake will accept the new syntax.

This means that converted layers will work with older releases, as long
as someone has updated to the new version of bitbake for that stable series
(and the later worked with that release in the first place!).

Cheers,

Richard

