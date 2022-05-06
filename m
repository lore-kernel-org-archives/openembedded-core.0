Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50712C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:43:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.6420.1651819384626867124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9fSPqOQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id j4so10992786lfh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vz5ETIxvLDLqpgTaklhiXiydC2E9qX/Oz8vpEf8Xmz0=;
        b=Q9fSPqOQ90wfE/pcMrhZ10A9xnX4yenC8MTWp80xP0u3e8U6SUJCS+k+yTUy+RbQMh
         Mj+Q94B4jeMY8GyiYAScwLPKFNTknTKoA3aZy/vEkW7hlVhh5rIqmUhEz4/lUUadx1Bk
         0Ib1NkTbPFYA0QmitjxgYbtoM03uFG0SeahgyVzOGTzAKbmR1F1VmJUFF04KhRznoe+3
         9pcY1mGhswKlYsclyuXNBUTqdiMMXLm05j2c60t/j3hU14kF8YoX0Upo7lHRgVhOxQPA
         0AfWwxKfiwn2l/GHIjYd2ndVjvYQoAVk9BCJwE3NEj0EqDxyeivlZZ9Yj8MIAs5nvxLP
         3KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vz5ETIxvLDLqpgTaklhiXiydC2E9qX/Oz8vpEf8Xmz0=;
        b=5Rk2F1oR5GVMfcW6J7lND/nR2a6KfF446PTgWmOVcv17bhC2hI4ncpgRXMLcgEInGW
         wT2CLOHcMEAFHrQqsPkcEctNTBjpP1qHHhUiMnbJSwfCwyvrGd/d8Dlqa5eyAgTgPwO+
         Uifl2fLs2LNkw+C8ItSLZ3JDWih3i/zRoI+9sUJ+GGCHqQyW/BBtsoe+3lWv65EXq//A
         g1GElLmgYG1G7x8v5T1gq+Cg5B1qqLDtPyJKu7tR1gtkKmVMsR3FEOHS3Wmirz9RzpFs
         JJz6enb8ZiVFLJj8DjSBNLfMGg9OVrMc7ZM30UEippVAquEYcps7/K3DRaDQ1dxww63W
         /Xnw==
X-Gm-Message-State: AOAM530eP+8pAyRyb50Z8LtunhM2IfctMUD/3F3GfIB4xj1Yz+VEKUMF
	Ll7MMJlw//S10HVqBZs7PIRqENlq7Jd3jVBMuI4=
X-Google-Smtp-Source: 
 ABdhPJz2ls2JXkVUSmOIg0zhdeVfguVxIYfvfWTyCm5tRA980jEcTdAXa0tc4FN/cUuIfEpUjsf0MmUzlAR+Mw+JfkM=
X-Received: by 2002:a05:6512:2353:b0:473:d801:6e3c with SMTP id
 p19-20020a056512235300b00473d8016e3cmr1524962lfu.26.1651819382866; Thu, 05
 May 2022 23:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220505050544.651895-1-alex@linutronix.de>
 <20220505050544.651895-50-alex@linutronix.de>
 <CAMKF1spvL6JVKXnfW9aw7m3ZYVesBHgmpqqNYofXQzZpy9U06Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spvL6JVKXnfW9aw7m3ZYVesBHgmpqqNYofXQzZpy9U06Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 08:42:51 +0200
Message-ID: 
 <CANNYZj9RM5VcXy5Z+u0+1eUoHogNw8cqS5WGQWyFyou5TO=fVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 50/61] coreutils: update 9.0 -> 9.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 06:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165322

On Thu, 5 May 2022 at 20:54, Khem Raj <raj.khem@gmail.com> wrote:
> https://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commitdiff;h=v8.24-7-g6d67649
> has marked uname -p and -i as non-portable options. So dropping this
> patch is fine.Perhaps
> using that as an argument in the commit message will be better than
> saying it is difficult to rebase.

I resent with a corrected commit message.

Alex

