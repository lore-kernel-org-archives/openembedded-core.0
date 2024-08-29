Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39536C83010
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 08:52:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8324.1724921523046158096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 01:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hULpagq4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-371c5187198so248390f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724921521; x=1725526321; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TESMCcTdFl8BpVuI6spYSVFdkIBfqx68egJognooI90=;
        b=hULpagq4Nb3GsQcdM+o4LQVkF65b7p0bF53gotH38Mn4U2f8bG/hRLOPTxCZGIEfOu
         8tmwuthZhZziJxeaw2boDNu9Tte22H+fjnsKa4sGQnSgF5tQcsS5rTMIVi+a6TcK2Wca
         XuAKW+oUOznFIohV/sKdB0smLNIS/zEVCi91o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921521; x=1725526321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TESMCcTdFl8BpVuI6spYSVFdkIBfqx68egJognooI90=;
        b=NGNr18pmMvI3ukm5Hfo8yeJyseZV99K4iRlyt6/53zKgVWqjlgOlI1mh7tUMOE9xSI
         tjcKB46HhdYncYHw+A93POl2lmVTUk3bQO+3jE+W3bCzGLCjsjA7h+ijwWdAKMZsx/R2
         6W29dYglp58dnrq6BalxC6MwzQJtN65tjvyFwj/t6QXmbQ7vWqKW09byuYCgxzAchAMQ
         FMNttoPgJ32mm5hfwslkj4JT75KuMFILjBvwkJq/UMODIaZn4GdbsaTT+r1tJA08fy3i
         DQom2CTHl9YqkyPa6IbJs+o0i9VafVIINjpeX1rwS6bqAM6ausgQlwI5Nmgue9qJA5t/
         jMxA==
X-Forwarded-Encrypted: i=1; AJvYcCW4nIVLP1OxJe9sLZbNLtX2rvhsMBG6Bitp1Iy5YvIEZoJZc2X0laAq5giX83eLgdGNRZFG2TTROT2tVdZhkLxGlw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfpwQLCCXHJmJXGwnyExcq7xXJ/SKwmenjcf9tax8vM5ZLzj8C
	690NS/9YpCwzB7BmAsqdCCrHRPS0nlFrXEolhGLY2mc9gzL0gxVL5noUwwND/w0=
X-Google-Smtp-Source: AGHT+IFfKT+dECNbWbdNmLvgk1AV2g28IVsZH6PR/ZLvxrkJVlfeCqvDBtX+ksjiNnfY8fhGFf5lrw==
X-Received: by 2002:a05:6000:1545:b0:371:7c83:12e5 with SMTP id ffacd0b85a97d-3749b544876mr1803341f8f.19.1724921521068;
        Thu, 29 Aug 2024 01:52:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:19db:d42a:7902:cfcf? ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee71ba8sm851319f8f.39.2024.08.29.01.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:52:00 -0700 (PDT)
Message-ID: <9f118764c6f9f2a5361356312b696b6eecad6c56.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mr.name@web.de, openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2024 09:51:59 +0100
In-Reply-To: <6670.1724698895497804544@lists.openembedded.org>
References: 
	<CANNYZj-D+XgSFDNWnJ9LNdRe=RgLq-c5v8AP48s4T18TJ2pDZQ@mail.gmail.com>
	 <6670.1724698895497804544@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 08:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203905

On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
lists.openembedded.org wrote:
> Hi Alex and Alexandre,
> =C2=A0
> sorry for the delay.
> I've created a PR on Github on top of your latest changes:
> https://github.com/Nanowires/oe-core-clone/pull/1

I did try this on our automated testing and there were some issues:

musl build failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9440/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9456/step=
s/11/logs/stdio


systemd+sysvinit build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/step=
s/25/logs/stdio

Cheers,

Richard


