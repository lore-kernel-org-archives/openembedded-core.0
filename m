Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28824C433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 20:31:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.14039.1651955461024508367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 13:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MkJsJTmw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e24so14349079wrc.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=o5qsxqp2+ityvXTDEbRVqsCHc7bY64YsZwU5dxJxCXI=;
        b=MkJsJTmw80dMbIQcLMQXXtW9tmwieqhGTEa9xLPh3S2lY00bmrWV5J1czaR6lDmNLr
         bCB8KcDwCYNSt8VpTIUpcoPRtIjGwMX8mjvX3Q0bwdJ113pOL+XN7pBOaayL2cpgLWM1
         8wFz0Ava+8i2i8E4vP0pDFIxteXQHEE8NXw1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=o5qsxqp2+ityvXTDEbRVqsCHc7bY64YsZwU5dxJxCXI=;
        b=E+bZH2WS5ZODVmUUlPV7Y7H+6OTaL2dpaiGdNON6n+dd8xqvKY+JqaoR+Ns3G/N/3a
         pKJmeMKvJJxAA0knzCPS/oY7IxK79A5pIa5U6H2qb7xU9xoijRiazLBd4xwAV6YxbOLb
         RYMU8P7/FuTS58zhvU2r28u9ZuYHCF4DbedSnxXpYGQplBtC0mOOA41+FlI1fIW8oxnb
         Tc+VT28becbhMJZAN4tLIzi4gozshF/ca8uKkW3f6YbWfVpU8gyV+MztRXHjC2qU8Cyu
         De5OOmctlDo0Qw/0I7KxwwR/6wvJ2/V84pMy4+AKhIrWaJsLdMixtcdvW+84ld7d3tL+
         VSIg==
X-Gm-Message-State: AOAM531JvwdA8wk7dIoYsQXzJ6V5D6TjWQv9X48N0g3ke/abtn4cjOca
	Cefx9mPhHY8Mk7abLnRJDG4QTWqkVYAVlQOI
X-Google-Smtp-Source: 
 ABdhPJwmzeZu/FJVAaLRF8lTkJqXNlV4wXFnZtkvYdF2F36DRhKabSeSKYCSn685VBL+qSdjcLrygg==
X-Received: by 2002:adf:ebd2:0:b0:20a:9c10:ab29 with SMTP id
 v18-20020adfebd2000000b0020a9c10ab29mr7766263wrn.212.1651955459122;
        Sat, 07 May 2022 13:30:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7637:badc:40a6:4c9c?
 ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c064300b003942a244f31sm12189816wmm.10.2022.05.07.13.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 13:30:58 -0700 (PDT)
Message-ID: 
 <dce5e5a759e1d74916572b8fe131f801ffea6c17.camel@linuxfoundation.org>
Subject: Status of master - rather slow atm
From: richard.purdie@linuxfoundation.org
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat, 07 May 2022 21:30:54 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 20:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165364

It isn't any secret that I am trying to take things a little easier
post kirkstone release. I have also been trying to keep the patches
moving, relying more on others. Sadly it isn't going so well.

For the git issues we're been having I took Ross' solution without too
much testing on my part as it all sounded right. Unfortunately it
didn't work out due to the way some distros are backporting partial
changes and we've had reproducible builds failing for the last week as
a result.=C2=A0We're going to have to fall back on the solution I'd been
working on which I don't really like but can't find anything better.

Ross has been trying to get a patchset to work based on my approach but
I suspect I never posted a later tweaked variant of it to the list as
even the current proposed series didn't quite work. I think I have that
fixed in -next now.

Unfortunately that exposed the issue that whilst we were "ignoring" the
reproducibility issues, two more crept in through various other
changes.

As a result I'm now scrambling to try and sort this out before patches
start to backlog. I could start reverting things but I'd prefer not to
and right now I know one cause but not the other. I'm still not sure
one of the issues is exactly as something weird is going on in the
debug code :(.

Anyhow, please just keep in mind these issues do slow everything down
unfortunately.

Cheers,

Richard

