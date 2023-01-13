Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BEBC3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:06:26 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.93572.1673629583619900569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QUqq+8uF;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id u8so11080385ilg.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyPASVxNlWCtPkYeVXFr4prPvoWXqNmzTgoGjeOZrOY=;
        b=QUqq+8uFJ0wKT9Zl45TqRa41BpYgG3Nxd8JAvAnLeUZ1jX8mo/rqSnfvmhVb9nNZrL
         YwwXPDTM0eoRbS0alXp+vN+KQc6zMR6SjRme0yQfr/hiS9iqGQWmoKB/V0PefQJ6zIW/
         PAOhsVF94uA3YUE4I1/gMH1eHqZXXULG9dnfr9bsN4jSdMW0SL7/shqXA0S4UqVk/nSS
         +5kyNOQLumkMxcg8eImJN0TXsUxSGK9MjS0VYa8C9Gz0gWNrBB0tkE78g66UbRtdZXSF
         naBPfXWRtdGgt+9Eay94zV9khPhUlanAjMUtYUqJigCCU9u7THgyh2lH6BBmEMeTGd8n
         UuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyPASVxNlWCtPkYeVXFr4prPvoWXqNmzTgoGjeOZrOY=;
        b=zKUelm3FooIWiRT99MyJLh95bg77Nak/j303OetquU9mc2465uCPyYH+SFNqBARNve
         IPhLS8XshS2VEJNhLqaB2aBMG4tNrJ5SQrVrAsSikdT185OgzIcqtyoWIqoQBbqmMkSy
         korHTw353/XpldWSuZxpGuyW1YYPFQA0HHcEzkrKgpUM/GdcGlxFftae3GcKX0tmwWlT
         rxU9AEWhng7eRIBskrS36Xz7J79u2E7nQhAFztHmkB8bZ4R3MPUqkTP35Tdb+Bo8JP3l
         djPCiWpm5yci8ziuTAd71HrA2z9qzvWeOGVpxEVdmjTzPuuJRwZoeO41wHrC0haFSz/q
         00mA==
X-Gm-Message-State: AFqh2kow3dOGch2V7UN74sdoRJ4VJW6L6Og1nKHvkojJp6p2JIftJEDo
	Hww5c/ronzuV38ZCkVXjcWy8kifHUQMgpXZQt4w=
X-Google-Smtp-Source: AMrXdXtOI7vyY3EuJbuH8ktyuA1Nt6l+AnNSL0aoOF8RjZw4PSCOPh9D1FUkbNh/NnTQz6zCP457cLtWzguS2HZSGFs=
X-Received: by 2002:a92:cda9:0:b0:30e:e796:23b7 with SMTP id
 g9-20020a92cda9000000b0030ee79623b7mr131906ild.23.1673629582877; Fri, 13 Jan
 2023 09:06:22 -0800 (PST)
MIME-Version: 1.0
References: <da703100-dd85-8ede-3a3d-f7e57d6a4ee7@bootlin.com>
In-Reply-To: <da703100-dd85-8ede-3a3d-f7e57d6a4ee7@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 13 Jan 2023 17:06:11 +0000
Message-ID: <CAO5Uq5T3Mc5pEFK+4GODftM4kzwkJo8RnpgrQvFX-ewskpAWbA@mail.gmail.com>
Subject: Re: [OE-core] Is rust-bin.bbclass still in use?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 17:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175842

Nothing I know of - I suspect it wants deleting.

On Fri, Jan 13, 2023 at 4:55 PM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> Greetings,
>
> I can't find any use of the rust-bin class, neither in oe-core, nor in
> Poky, nor in meta-oe?
>
> Is it still in use anywhere?
>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175839): https://lists.openembedded.org/g/openembedded-core/message/175839
> Mute This Topic: https://lists.openembedded.org/mt/96250144/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

