Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AF6C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 10:27:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.134206.1672050425358846400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 02:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=drvsSBzo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id bx10so9757183wrb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 02:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9/hwJNDrkVEKwv2ESJ4nYE6ucQ9pFguVgS3J2AwwjY=;
        b=drvsSBzoD/a7E62vIky7Ao/Fsm11ARTg4/VkNq5+cD4IglB1swH5+GU9qNNsr5/NJ1
         6GkV80eZwM7ES9oUETMcEwwotEfMe+2VPfC37MMu9SghQ/tlSx3zJjOrInQ7UaruZX5e
         TknXuGJG0yliW1ZQKjSvfDyCnbPK/1IolrHhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9/hwJNDrkVEKwv2ESJ4nYE6ucQ9pFguVgS3J2AwwjY=;
        b=zY5uSl9MYYDJMCkIAGV/qaxy90ufXZrzQij3h25m+Uairsa4JfUZScCEc7QG2iXX80
         CNNSwIjwdmL4aoCXCm4bXlVL+26yPPBqH0Jz9GHK1kdQQ1t5RHsggR6Pm7NPNd2m2/jn
         HhERqUKw2Hjev8zQbyDiMjg6BbtZsO7njkP3FY0U+spkDeP5udbt3Gkd7mAoxubCljmT
         DVIfFcdjemhndmYqbbVZzy7hDoqQqknsmw3KV+w+hsm01IEbe6mnQUM5kz6DJxYGy4SI
         /TeKVPwE/RUGE5sot3Ghn1dT4wAMnXwzX0YVHSBbe3kbWPq6NBSmnksXIYacAEftvtKw
         +QLA==
X-Gm-Message-State: AFqh2krLihws563WEk/26ytWuOWmClwXnjkMcen6An08kC2gPLO2syvs
	tZA3E4zwcBr1biAKbwDG1ApmtQ==
X-Google-Smtp-Source: AMrXdXsS5uvdc4hm2+/TVMiwkaL+4XKhVhtn1+uCAX4CwLWIFKD/JO+cbUCW1EF2JFW/Ey9kNOowWQ==
X-Received: by 2002:adf:f305:0:b0:277:2e27:61f6 with SMTP id i5-20020adff305000000b002772e2761f6mr4967071wro.31.1672050423628;
        Mon, 26 Dec 2022 02:27:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee94:6910:509:b9e2? ([2001:8b0:aba:5f3c:ee94:6910:509:b9e2])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d4f8c000000b002421a8f4fa6sm9629471wru.92.2022.12.26.02.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 02:27:03 -0800 (PST)
Message-ID: <bd340a0b68a4f747103cdd1fc015d2236f839f5f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2022 10:27:02 +0000
In-Reply-To: <CAO5Uq5SqpQyL8PQHsFYDn8B7rios5EvpCni_5-JmzksAKWP0tw@mail.gmail.com>
References: <17342835AC830076.27785@lists.openembedded.org>
	 <CAO5Uq5SqpQyL8PQHsFYDn8B7rios5EvpCni_5-JmzksAKWP0tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 10:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175019

On Mon, 2022-12-26 at 09:41 +0000, Alex Kiernan wrote:
> There's something odd happened here. Three of the patches in the
> previous version I posted look to have been merged in poky, but not
> oe-core? I thought the flow was from oe-core into poky.

I'd attempted to take three of them into master-next to try and move
things along a little with testing. It looks like I've messed something
up. I'll try and reconcile things, thanks for pointing it out. Not sure
how I managed this!

Cheers,

Richard

