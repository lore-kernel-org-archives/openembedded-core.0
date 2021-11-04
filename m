Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA532C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 11:33:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.10502.1636025605514937196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=tf9LrXr2;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id d5so8118383wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=guuHHEdwttEI6r3bJzmDiohc706CfYYNKPmB7fXeQ3c=;
        b=tf9LrXr2ZtevosgaVMXo5pROkLAD4/59sBGhWYSjIKOY840AL7Pub5iaXnoSQ9noZC
         ENTAJHgD5dYV+KDsB+7iTO65QdVj9urLycIr7RM4pfRENWFucro0Z9pw18mcG/TclKKD
         3yLe/87+ShBqqhiIYvv5vDaEzkGCPjnSEco6Cujd8UCwuYJHVGOhgtDygLU6TeIyCYUx
         +ka4MdMoyumsd3PcYAkOCdMpj7pboFdfNCxo9RgiPejwYc2oSgrOyKQvT45RCVtQROHj
         UlvuC5bd8McMMBzIjQaiPTRBgRn3rUUfI5Pw8zb+iwfZfQsX9AzF+Py27zt5utAsyGEA
         PwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=guuHHEdwttEI6r3bJzmDiohc706CfYYNKPmB7fXeQ3c=;
        b=KMRJprFKttmJFQJSYgRzURVSfedPDCbXz42q/XfynXKy5q9AYxjiEGdlfmGvg0asSK
         4f4DrFaO+cnQs3q5HOwRAXygsoCk26OtVSMEMeTQSSTrAftvqgKhkGv6BPXcyEn0fY29
         Tsag/9BtM9wkLO/th8dePmxInXywJZ1eCeOtcr7YfO6hHdwn4gVZOM6xScwkaqJH0qqn
         LU6VlTAoDFbQA6kQ5CCpM7YA6WyQDFU5X8CFNifWrKO1UUx0nGBI3AvZ5NrJbgmgcFPl
         iLP+J0aUjphCqrk1a24zlW3G1cIwpncu23Marg80UZ9ytYwZYaY+j/6iJyfH7surF6tQ
         so2w==
X-Gm-Message-State: AOAM532mzzJjImNP7S0MGOxzDyveE8fzEsWXKFtRtK8BPrU7jXEkUkgj
	UNSeTPnOE36Zo+CESjq6Nc+4kRJWd+yRosQgcxdcdA==
X-Google-Smtp-Source: 
 ABdhPJxrRpfAhmUDeoVKTGaUdHX+/q+M1O2X2L9TUW3J+YJMTopd+qo56P9rfWXdEWA+5l4tPWRzV+kJqid0nYkO4gw=
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr49772606wrn.49.1636025604012;
 Thu, 04 Nov 2021 04:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210902162435.1375245-1-ross.burton@arm.com>
 <20210902162435.1375245-11-ross.burton@arm.com>
 <16B23C3CDA8BCB16.30289@lists.openembedded.org>
 <ce5f46365f6d4d38a6017b04ee1564f0@axis.com>
In-Reply-To: <ce5f46365f6d4d38a6017b04ee1564f0@axis.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 4 Nov 2021 11:33:13 +0000
Message-ID: 
 <CAAnfSTt6OZp8Kh-DT8NrPBB+DDreRpM6rzmOANak1+sNrJL-pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Joshua Watt <jpewhacker@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 11:33:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157842

Sorry, missed this email.

I copied the license from libx11, as it is the same tarball.  It was
Joshua Watt who introduced the expanded licenses in
44fd2aa731956fe0a0f74d36959c88b0b87adab5.

Ross

On Thu, 4 Nov 2021 at 11:19, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Ross: any comment to my question below?
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 28 oktober 2021 17:44
> > To: Ross Burton <ross@burtonini.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> > license
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Ross Burton
> > > Sent: den 2 september 2021 18:25
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> > > license
> > >
> > > "BSD" is ambiguous, use the precise licenses BSD-2-Clause BSD-4-Clause.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > index 7519b4c018d..e53ccc6aea8 100644
> > > --- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > @@ -8,7 +8,7 @@ python () {
> > >
> > >  require xorg-lib-common.inc
> > >
> > > -LICENSE = "MIT & MIT-style & BSD"
> > > +LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
> >
> > Why is this marked as BSD-4-Clause? Looking at the COPYING file and
> > searching the code I can find no trace of any license text with the
> > advertising clause from BSD-4-Clause. What am I missing?
> >
> > >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
> > >
> > >  SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
> > > --
> > > 2.25.1
> >
> > //Peter
>
> //Peter
>

