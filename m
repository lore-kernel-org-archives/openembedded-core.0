Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AF8C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 07:56:45 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.27993.1665906996605011319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 00:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cnRPuBsY;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id bs14so10612114ljb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/AORXNG3YIpX2qFhVryQtX6PvRL4p3rTFsZLVyxAfI=;
        b=cnRPuBsYWalqzDuowqj8/YmTvz9TwpsSHHyrH2/0eHTHbko9QZEaXPvEdW4eQvRRn1
         MO4l0D4A5jYa4Ez58vImR6PptJxMsxn1MSpVFSZWZgpH1c7T09H7/PyXPSygj7obwNFB
         tWdeSoOQZNirbDf4s9YIE+2qhU7vfoqhG7WiXywRH+4zRqpHqOtsaGmwe2uPnA4mT8Ii
         dO6jRTFaWvr04ytOikc88HUCdf1Nhq4uzylMLvFhYeWW63Yx5AeVmb0KYsvwwqiSagC0
         FBe5LTB5ohCf7wu5rH29qcZ5hhcVs0sfdZyKctZaPl5bbYqbEA5Fr1nmfmFtJNcbQTdX
         H23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/AORXNG3YIpX2qFhVryQtX6PvRL4p3rTFsZLVyxAfI=;
        b=2ycN7u3S1UmYKXFtc24lf00ygZHctQotOulAGVl/tVZmnJ0a+uB4e6fEqN+WHRrf+Z
         GtFGKdaJWZKq0mguFdPzla5y0GFg7NNOAnlgcIxUH729d6IOIkaSA4Pc73EVJyFRkIHN
         XnMrOtbVidqgwwV4Smwi5de89hIpkhYqNfkoScC3Da2csBbQTg5FhjWSH5G9xSLFuovH
         CLhJeE79Je00nQ8QDQJNmXacl/3+SZfGVPLX1IvlCY37rSOca9CxU3esrZ/I3IPxB58h
         muaMkNnyZq2w7lFq8VzndC+6KZefeoTevrJ0x6NGVySM8QMJ47Lft0i5V+uERumCIjjj
         DdHg==
X-Gm-Message-State: ACrzQf2644ekb7A+eEu6cpe3m2ilmsbkoKEPpcsItrTggwVKPWnWXqSj
	NqODc3C8/qKN17DLAgp+tDk=
X-Google-Smtp-Source: AMsMyM6ci068CFOumdtNJjbAPwBHwe1890Kltq9z5X0UC40GGQg9MiQ3TaTt7p+V1RGDOgHB9bz8aQ==
X-Received: by 2002:a2e:a544:0:b0:26c:6abb:866d with SMTP id e4-20020a2ea544000000b0026c6abb866dmr2054565ljn.9.1665906994751;
        Sun, 16 Oct 2022 00:56:34 -0700 (PDT)
Received: from [192.168.10.143] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id c11-20020a056512074b00b004a054efd0cdsm993004lfs.36.2022.10.16.00.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 00:56:34 -0700 (PDT)
Message-ID: <38f702d0-1b86-9612-e431-a43fcf960c4f@gmail.com>
Date: Sun, 16 Oct 2022 09:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
 <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com>
 <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 07:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171891

Hi Alex,

On 10/16/22 09:24, Alexander Kanavin wrote:
> We are asking for help here with version updates. Specifically that you 
> take at least some of these reports and act on them. If you don’t want 
> to do this, fine, but demanding that those reports are not produced 
> because deleting them inconveniences you is both unreasonable and 
> antagonizing. Keeping core updated should not be ‘Alex problem’ but it 
> de facto is.
> 

I do think it is reasonable to ask for not being mail-bombed with 
machine generated emails.

I am asking for either to:
* put them on a separate mailing list
* merge them into one email

If keeping core updated still is "Alex's problem" then the AUH emails 
are not having the intended effect *anyway*.

> Alex
> 
> On Sun 16. Oct 2022 at 8.50, Jacob Kroon <jacob.kroon@gmail.com 
> <mailto:jacob.kroon@gmail.com>> wrote:
> 
>     Another AUH mail bomb, another time where I am pressing "delete" 148
>     times in my email client. I don't review machine generated emails.
>     I would not cry if AUH mails were sent to a designated mailing list,
>     one
>     that I am not subscribed to.
> 
>     Jacob
>

Jacob

