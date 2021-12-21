Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA59DC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 00:04:56 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.81.1640045095258018330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 16:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jtfWP16e;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id bn20so18568512ljb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 16:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+XRwKO98UNafvyDGpqnK+ZzTvY7xoGGrWxAd1VAJ2cs=;
        b=jtfWP16eOZpLtZhkGI9JpjWRDyoXUJmzNWmcpCHUzTKfRdZq7QfSXZ1Ow2AqT1Mrjo
         sgOeIXVMHfQ+6NLzzSezoN6Gb9yQBnUAy7GqGfgBI6SRQIJwgWN95TX1T85z6eS43hvJ
         l9HiXzwXrQC508kIvKKf0CVUzXLp0AOE+v9uXrXUFFND6DyOmGdjb9huOuN5E4bB2YJt
         LVPDp5uHMgQct1v9iEJ7oIwoz7dM9aB1MIBUwmgRxA8TCNsG4oXDeJDuW25JRS9aWWww
         iwV1cw9euCYwUo2VWZ9RUQrdYnu9ISJiyVsjVnyvZpbA3XJW4mMcTfgtoEgNs5pZYHAr
         XheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+XRwKO98UNafvyDGpqnK+ZzTvY7xoGGrWxAd1VAJ2cs=;
        b=Uv3pcCkEF99HC6ao1vdUUAxa18bn/Dff+AF5fOcf+rKVHECmMm+wX0wlnb3R6sVmLd
         WvIXhSwnGdoZfhYS1BaSFJU38L+7jht8tYbwhIHRLxqoMUgIZGmzZOU/1W8E7pnhYc70
         kA/gAa0GIBgaVWdD2eLu+xjvyjOsefYVONYuMJOH45F8P0zDJYtYy8KFnjIRtLV9sZ+S
         FefcTUFryJMp3DTi52I1QFNxYg4xdM67Nqe8IwaQzN6TNmOsieBOPiYsj4W591z/I2Mj
         JgekehAtreEkleuqMYwwF0tvbjMfaAjL7ySG2N4IanP+fJVjHL0uAljpPdSK/Nc9kBJ1
         T00Q==
X-Gm-Message-State: AOAM532BAyYh/ITC1U6cgGcl8pDBRpKELI78404h57RFbr/mk03BZ/31
	EZSoU+CPYU4XPz+nwJrQQETHg+W9vKGdXHAlEM4=
X-Google-Smtp-Source: 
 ABdhPJz4HZVfePGaqZgyPcAlk70+uep1fu0K69rtaYdrNTzZ00iSHaGX+woX/XqYL2T61nvqr0Ig96GhXk8sL35skHY=
X-Received: by 2002:a2e:9e83:: with SMTP id f3mr408260ljk.530.1640045093396;
 Mon, 20 Dec 2021 16:04:53 -0800 (PST)
MIME-Version: 1.0
References: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
 <3ab3fab5a6355a247b9f539e5db6a5a7187a2909.camel@pengutronix.de>
 <CA+chaQcxg=XXk1jf7L999MCoh=hZ6+0wFF6gioVjF85vOSexxg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcxg=XXk1jf7L999MCoh=hZ6+0wFF6gioVjF85vOSexxg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Dec 2021 16:04:37 -0800
Message-ID: 
 <CAJ86T=XMAgngkbik9qcif66FLLEf9Amt-mYWw3XKomr8zOuW7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] busybox: refresh the defconfig from 1.33.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 00:04:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159905

On Mon, Dec 20, 2021 at 5:08 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> Hi,
>
> I don't remember the details, but looks like not intended. I guess I was =
running with default SRC_URI which contains syslog.cfg and other optional f=
ragments, can you please refresh it again with all .cfg files removed from =
SRC_URI?

Yes, when refreshing the defconfig you need to do it first with all
config fragments disabled and then review and manually update the
fragments as required as a second step.

> Regards,
>
> On Thu, Dec 16, 2021 at 6:26 PM Jan L=C3=BCbbe <jlu@pengutronix.de> wrote=
:
>>
>> Hi Martin,
>>
>> I just noticed that since this change, syslogd is compiled in by default=
, even I
>> have SRC_URI:remove =3D "file://syslog.cfg" in a bbappend. Is this inten=
tional?
>> Otherwise, I'd prefer change the back to disabled by default (SRC_URI st=
ill
>> contains syslog.cfg by default).
>>
>> Regards,
>> Jan
>>
>> On Wed, 2021-03-10 at 14:37 +0100, Martin Jansa wrote:
>> > -# CONFIG_LOGREAD is not set
>> > -# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
>> > -# CONFIG_SYSLOGD is not set
>> > -# CONFIG_FEATURE_ROTATE_LOGFILE is not set
>> > -# CONFIG_FEATURE_REMOTE_LOG is not set
>> > -# CONFIG_FEATURE_SYSLOGD_DUP is not set
>> > -# CONFIG_FEATURE_SYSLOGD_CFG is not set
>> > -CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D0
>> > -# CONFIG_FEATURE_IPC_SYSLOG is not set
>> > -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D0
>> > -# CONFIG_FEATURE_KMSG_SYSLOG is not set
>> > +CONFIG_LOGREAD=3Dy
>> > +CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
>> > +CONFIG_SYSLOGD=3Dy
>> > +CONFIG_FEATURE_ROTATE_LOGFILE=3Dy
>> > +CONFIG_FEATURE_REMOTE_LOG=3Dy
>> > +CONFIG_FEATURE_SYSLOGD_DUP=3Dy
>> > +CONFIG_FEATURE_SYSLOGD_CFG=3Dy
>> > +# CONFIG_FEATURE_SYSLOGD_PRECISE_TIMESTAMPS is not set
>> > +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D256
>> > +CONFIG_FEATURE_IPC_SYSLOG=3Dy
>> > +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D64
>> > +CONFIG_FEATURE_KMSG_SYSLOG=3Dy
>>
>> --
>> Pengutronix e.K.                           |                            =
 |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/ =
 |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0   =
 |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555=
 |
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159865): https://lists.openembedded.org/g/openembedde=
d-core/message/159865
> Mute This Topic: https://lists.openembedded.org/mt/81226966/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ar=
mccurdy@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

