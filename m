Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FDDECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 12:14:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.11298.1662034456480715877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPV2TfQS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p7so12970981lfu.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mb7NHTp2dlxs3sw5VI7XEw3YatdTMe3w+nZZGQDFWFk=;
        b=OPV2TfQSMe7p8XAB9lHIVEFcm48FNqZ/3GHL0f2bpytY/NRzIcvugghgg7DUHdJbU+
         +/z/XouJDntf7y2BkcyEH8va0QQ5khV6hxKhwuGMWmby6JoEM3LIM+0qc8nJ5xwZ+/c+
         eDxG82FjDTOi63znznJWVveWVBajAm1PKdPsI/Fg2qykLIcy3r/jCwESNevqag8XNCxE
         Bk5dYc60lxJbz7gjdsKmDh6DNVVJgjWhWOChiN/oSAhOTON8AJFWcjX/UlSERHRjcFLF
         +lIL/1MpIotFgH7gJzPNeZg5GJ0+K8Fm9k4nL4l5VGM/Di0246W/SZECB0NT0yYnLrnS
         NR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mb7NHTp2dlxs3sw5VI7XEw3YatdTMe3w+nZZGQDFWFk=;
        b=jAISsC76fpqldMBeiLYGSw8Osy19vKunbxHX9emRRv01G0Gd/nO/Jd2MHWdWHh7qNe
         qrWF0MSBjcXjlt+a1AnaZTTtFsvFkU4+i4gISIBboIcBfVI5WZUabhpOVpRihZ8CcxnB
         +eE0hvFp7Cucg4mq6rWkCouvQakEhIJG2yNIaXqHObxauyAFvhze0ci5BQS0DULpo1wr
         9NrOyvR1iMJiEq5scBMiU9zvtkcn4KnfEyKKnsZY99/ZbMq/lmp8Ij2Jrx49HeNp0I9/
         yACr1ON0xYfjNyvrrfUdf9t6x/jKWOzHroM1yzC3CfxwdoXwWP/tAR4foOo6xAlGte+T
         Tsug==
X-Gm-Message-State: ACgBeo2pDLDh3rpgopnH+bgzXowlrb01vjfex4VN8Bm0qOCnZS+b3GVk
	l3sTpPMcNASMZbPiUvGuE1K03gJU8vM2eVvz80Tx2d5k0x0=
X-Google-Smtp-Source: 
 AA6agR4AJzxtMTU+RS+FViwyEg11KSmtTRYARsva2zzU5qM6Mg3WjNIoZC8hiab4j3+m0lK+73ImDC6WzNbbYgbabeY=
X-Received: by 2002:ac2:519c:0:b0:494:9f3e:3c5 with SMTP id
 u28-20020ac2519c000000b004949f3e03c5mr577148lfi.665.1662034454612; Thu, 01
 Sep 2022 05:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <1710BA34037FD8E9.1438@lists.openembedded.org>
 <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
In-Reply-To: <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Sep 2022 14:14:02 +0200
Message-ID: 
 <CANNYZj9wiX4MPLwqrtMXtPqwMMWrQPmrDZ186vahPcDpmZk9pA@mail.gmail.com>
Subject: Re: [OE-core] Error with TEMPLATECONF value
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 12:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170162

On Thu, 1 Sept 2022 at 14:11, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 9/1/22 13:49, Jacob Kroon via lists.openembedded.org wrote:
> > Hi,
> >
> > After updating to master branches I'm getting:
> >
> >> Error: TEMPLATECONF value (which is
> >> /home/jkroon/Projects/codab-linux/openembedded-core/meta/conf) must
> >> point to meta-some-layer/conf/templates/template-name
> >
> > What is the proper solution to this ?
> >
>
> After wiping build/conf/* and rerunning bitbake the problem seems to
> have resolved itself.

You can also adjust build/conf/templateconf.cfg without wiping, just
append /templates/default to what is in there. I have moved the
default templates to meta[-poky]/conf/templates/default/ and added a
check that enforces the location. This does break existing builds.

Alex

