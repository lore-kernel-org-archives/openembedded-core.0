Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB65C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 09:36:07 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.23666.1659951366853120106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pz2KETwa;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id bx38so9164289ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+m8c09Ni0ojrlihkPgI+gZ1Du+Sv+YLfAXLBvwe5tQ=;
        b=pz2KETwaBL8/3HfZWZwDtIVnK8z68WyZ1K+zJ0TAOY5hmnF5ayi1J88xA9BLtsO11K
         Jqc1GjBrjUTa48DvHa6lFh6D570gfeXb1jKyTPlP49ZWwaGx+62MCnZKefsMXQPy65Xe
         NT5ceX++XzB/knVdOxjPHGdqL0C1RuIhd7p65YL2kEpOGBq6QZIaGHdLtGs4QDO4GwTa
         Quz7xVOLhPpFJTaIE3PJG3rNR7xjPN2vykZIzVRwKxB5fVejsimQML4Fr908cRdom4r/
         ivLokKhY7hqyHlARYnyxWiw5nRqS+0Ljb5gRlH/gYyZ6QVG++PPLRjq84N9LCWa1mToJ
         CW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+m8c09Ni0ojrlihkPgI+gZ1Du+Sv+YLfAXLBvwe5tQ=;
        b=8SBCAvUQ3fFfDzLUk29AF7KIKPJt3pf6GoWU1w+op3qohs28HN1ms+u5SI7ZiKb8Di
         o3IH8rdsNTU8derYm+e0DJmNUIPYMnP6IVLppLMnSxzK/ryPo8nNsi3WCzYQz3TRMfun
         oUJtnsihexV0Fl3/uIoUKyZ/xTcIhRFCFo4pCUlUFa+HqoGnJ8xFjXbZWyQy4b9DejVt
         zlKkclngUynHQoW5uoKctpvP+dR0/V6vN5RboYO5LXmcw7HcKNxo31p7lcQ+vQufnODZ
         fW9hKppWy6KYKZ8tk9P98LOWE9srWwb6kR5iwK9CsTrUbsOC5jzmtOp286Td2j8Ni1Ab
         D1aA==
X-Gm-Message-State: ACgBeo0xARs9T1T+alk8buEZ1g2THUl9Sk5xDeU9Y8tP/O+WIcCyGAe6
	Xr5m2i5mUnA6d54JpJ1S+NXrEB3iPMRsZKMwAvA=
X-Google-Smtp-Source: 
 AA6agR5TlJVxC8d4zWlrKSbVj/avBW6XIP3zPKtzbiF8PuVajsm5DKJu64+VJhcC5fIsv5arbJPG+aFtL2ttBRD6Mes=
X-Received: by 2002:a2e:98cd:0:b0:25e:7446:c0fe with SMTP id
 s13-20020a2e98cd000000b0025e7446c0femr5498999ljj.56.1659951364683; Mon, 08
 Aug 2022 02:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220808063843.3975130-1-alex@linutronix.de>
 <20220808063843.3975130-9-alex@linutronix.de>
 <5b490d3995e9290f4296a120870ad04c7be9d80a.camel@linuxfoundation.org>
 <170951048C08C44A.7414@lists.openembedded.org>
In-Reply-To: <170951048C08C44A.7414@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 11:35:53 +0200
Message-ID: 
 <CANNYZj_p-n8KiaLcbqXZLrZNMNv1SjGdh4HaED6G9kmVUNjx0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/45] patchelf: update 0.14.5 -> 0.15.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 09:36:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169077

On Mon, 8 Aug 2022 at 10:23, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Usage of patchelf in uninative seems to be contained in
> uninative_changeinterp, which can be tweaked
> to handle r/o files before invoking patchelf. Was it that all usages
> of it need to be tweaked similarly?

Ok, I couldnt find other usages of it that would require similar
tweaking (icecc uses host patchelf if available, rust.inc/cargo.inc
operate on only a few static filenames), so maybe it's ok to move what
the patch does into uninative_changeinterp (add +r before invocation,
restore original permissions after). Still better than carrying a
rejected patch.

Alex

