Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web09.10706.1608817096646222005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 05:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfroq5l0;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id g1so2026080ilk.7
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Uhqy1DeUIs0IRvxQlVFoLmgWnZ6TOuDSnC9Bk6YZkY=;
        b=bfroq5l0AcM0XXGb/i2T5/OkA1IBl9/qh8zih8iq8CDMafnH6jdd8Vym0AXZvz/G95
         98vqXJ+cEu4FA9IiDu+WbFVIsOM4vM7SrfbXTjGTEBucdXHm+YOFzCIvrAA9mGaGO5Yq
         C33+8M4UCxWoEk4dR0F2kjvKRmoxshbfvyv2MvRwhySDrzJa13zxVZfl9AY45ESuRv/p
         0J7y/D1ZAlI/5OwS2YuhuFcRPc9awxHK3+fRZiL4inmy01WMTDEIff9862Fz3ePu4Gg7
         7VDCd6kXKY8xRGHxjd/Aq8AHXC40f1H3xTmZlXk9AKKQKrlQF75mj1Z7Y3oGqXe2T888
         PHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Uhqy1DeUIs0IRvxQlVFoLmgWnZ6TOuDSnC9Bk6YZkY=;
        b=hdQzL/FUn3obagmClkwUc/hQgquCCccVGUS5tQGR9ZWKTf76kvns7tDIkdDWQvbFic
         3GwW/Z7/AyyYhV8CrqLeE4jH06hnMUWWscGjsEd7cX+pyojZRnVfYfWDGaIXenABjV14
         LddJBoiEjFijPdGm51obHepMzd2NmSIfoAsJ8QcIhX3zy0YVhD04yyWodfN4n95uDkYv
         Lo/5VhJfvscTWpXHulUcvYZvPQEARbWj8J9/C9iaDdOcSDn4hiNc8zyEcEDg/jTF56m2
         wE/4qdqGERRgd1UjGvZgqJ0X/MHm4dP70DdFPJKXJT2KfPJc4xv/MHp4SQyqixjCvPb2
         LLBw==
X-Gm-Message-State: AOAM531APetACw7a09xTQcNH6fl/soxU+v12V8RRcsrVUIPibzYrT8HZ
	5AXDw/AhBFBaUVsz0otc5yI=
X-Google-Smtp-Source: ABdhPJyYtyfT6zKHyrFqrW0gL1uH3VLshRQ3ztCw8KhzYngRP+YYu64AtB4p2p1x6bgGKTa2RSlQWA==
X-Received: by 2002:a92:c052:: with SMTP id o18mr29655548ilf.245.1608817096113;
        Thu, 24 Dec 2020 05:38:16 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id e89sm20263722ill.44.2020.12.24.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 05:38:15 -0800 (PST)
Date: Thu, 24 Dec 2020 08:38:13 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] sysvinit/rc: show text progress
Message-ID: <20201224133813.GA3039@localhost>
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

I'll add it with a knob, default off.

I'm not sure what you mean by "clean graphics". To clarify: there's a hidden
text box already built into the psplash application just above the progress
bar, any MSG text sent via the fifo appears centred above the progress bar.
I'm displaying the text-name of the currently-running bootup script (e.g.
postinsts, networking, sshd, etc) as a means of feedback. As the device boots
the user is not looking at a slowing moving progress bar and wondering which
service is taking so long to startup.

For example, on first boot, the sshd service takes a while to startup since it
may need to generate a bunch of keys. With this enabled the user will see the
progress bar stop (momentarily), but they'll also know that it's due to sshd
running. Or if you're using dhcp and there's no dhcp server on your network,
the user will see the progress bar stop (momentarily) and the text above the
progress bar will say "network" so they know that's the cause of the pause.

This doesn't mess up the logo/graphics at all. I could make a video of it, or
you could try giving it a whirl once it's added. I think it should be default
on :-)
