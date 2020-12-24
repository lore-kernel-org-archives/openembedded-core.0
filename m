Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.5948.1608777752754637182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 18:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RD3einDq;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id 81so929959ioc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 18:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HiZO/VS98VhB6CEbLXVPYsSBclxbfWtSuS6g4HjTlMQ=;
        b=RD3einDqVZQiRn85IZIG3WCcEjYdAUXY/BYKtS5hhDhrc0rxS6IDnYBC78VDSmQSKk
         abpZjeiM/J+iHmNUzF48nalWz9gS/78KZTYo+znLCvOQIY18FPegdYzfc/8mCMcEJUW6
         J5KkQJyftpO1QAWzV7vuuMmyVPOcJwO7sbKglWk7z+FA0ACMjvfZdsbinpP1K1s/KSiD
         HI3Q20Zg/pNJJwRmCnvufWm9spZ/VXd0DnJ/0nxOkqCVHT3o9FTcwVgrqUkOMgopJ3S0
         tWCVfHjq32XOLtSmEWlVKrJMl/qyd1fvX51Pc7jGKbPhQo6OT+HYVSyC4nODaWQGh3hT
         HL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HiZO/VS98VhB6CEbLXVPYsSBclxbfWtSuS6g4HjTlMQ=;
        b=FBBVaIR+ggk+SBB5rF/mva08IWppfM/OCEnsJOXXNagpeIYC4/nBJwIacip00BtiUU
         p7suqXoPpre0A/kaH24gDxv4wnH16qgZ6L6ZCuEdQmo2x1IypjrZ61zXD1ZWdWiRBgHT
         ZlEsdWnXSRsfjOMrbFTUYDem/g0sc8sXuYTYYsuRyvPbZ56qRpg3vM+CiE9jASUq0T0L
         wSeEIeotKV5B9cy6S0pNIsMPrR/q5+5i5hl4AwPnf+hUEAzGqYIPBH5tbijZ09W+/HXY
         SwbOqVf90SJlUT6avEH+wqUonbO5caR5wIRfPwPGIkcZslg/K5PydWNaL4G5aqmwjGDb
         6KCA==
X-Gm-Message-State: AOAM532IUcTM6cMGjqOu0aFOolTqAFNdUuUmtxongPjAUdy1NDhJyTne
	GxS7T/TQLO5H3Rf9Pad5FeY=
X-Google-Smtp-Source: ABdhPJzX7nWElQ4/LamnzKXC/36eIosP5NCnCdo39/grtOpDC7SvbDkUK5//ajaP9YK9ANdW3ZcfPg==
X-Received: by 2002:a02:c804:: with SMTP id p4mr25695941jao.110.1608777752091;
        Wed, 23 Dec 2020 18:42:32 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id k15sm17083002ilo.88.2020.12.23.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 18:42:31 -0800 (PST)
Date: Wed, 23 Dec 2020 21:42:29 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] sysvinit/rc: show text progress
Message-ID: <20201224024228.GA6983@localhost>
References: <20201222070029.40230-1-twoerner@gmail.com>
 <CAMKF1so1E7Dw8Uwy8epT0UanOv0QcdcPqzobSV+tOMURHPK5uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so1E7Dw8Uwy8epT0UanOv0QcdcPqzobSV+tOMURHPK5uQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-12-23 @ 03:27:50 PM, Khem Raj wrote:
> On Mon, Dec 21, 2020 at 11:00 PM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > In addition to the progress bar, show which startup routine is running by
> > using the "MSG" facility of psplash.
> >
> 
> This is ok but lets make it optional and controlled via some knob. End
> products usually want clean graphics

Okay, not a problem.

I've already submitted an "improvement" (i.e. a fix) for this patch since the
module that is reported is always one behind after this code. Should I work on
adding a knob after my patch that fixes the message reporting, or assuming
this patch hasn't been added yet?
