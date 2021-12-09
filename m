Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6893FC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 14:50:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.12549.1639061404045166313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D+d4cVMU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so6723721wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ifhYQP6XV/SrjokENoMcj59tuZumwcXXrGRZ3E3xdZ0=;
        b=D+d4cVMU8rmlLCNdpTFG0vLz4j4bDsW+ilOk3nm7fw9nWobHKVdpncfOXF6E8GTajp
         43j6LcsiIMuyFpudAElGsJXMBe36oCCZ07bvjwtQ7Zx52UndBY7SIH/Ym1oHkrnHTM2S
         JX757VX1e6va/Mq5SU9XpR8YCzGQ22sQEqpsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ifhYQP6XV/SrjokENoMcj59tuZumwcXXrGRZ3E3xdZ0=;
        b=uAtKWZQ+Mps1ZYW1m6pf/8OnjEnHalsCIszSwlV1+SQtdBA5AiD82wIz0qmb0CUEt6
         MSEnECvXyHQPBcYl2dtULsGubMsyKwhqRGgmHx237Ji1Uz5OyhXl/MX0r/1Q8mISpFYK
         /ZQY4fGeijUIgrI5B0LuALiz0LSLxFiM98FmuI+DDeJzne5ZAs1uR2mazqjBon+oLfTs
         k3qaHSRaH3TP17fuP3GZw6dl059LMnX4dkorBIU58+NvIqaI5/LFgDvfZKCXmCfsbET7
         vOzdOTUtoQncW+hgCmt2SLUPBrzKQtFWxha/PKFWXY5/DLSginj/ARjddyxzkd8vtwVk
         gQxQ==
X-Gm-Message-State: AOAM532Qx3E3DUszfObnW7MJBZBfUvmT6DWj+bnXEddZJy3zDxKGspH3
	jvcmmADmZ3rkrCLUcPYmhUEdIg==
X-Google-Smtp-Source: 
 ABdhPJwquh/VU6dp3TaDZNZThOpuNn1y/HbnFs5gXcCOuei0ciyEWtinVzIs0sOQKMab6Hn0wBzMAA==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr7717124wmj.15.1639061402458;
        Thu, 09 Dec 2021 06:50:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb2b:2e37:1385:897e?
 ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id p27sm26564wmi.28.2021.12.09.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 06:50:01 -0800 (PST)
Message-ID: 
 <1d8642264b9bd1886caa20937b3f7ffe731d6be6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH] gcc: Add CVE-2021-37322 to the list
 of CVEs to ignore
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Tim Orling <tim.orling@konsulko.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, Tim Orling
 <ticotimo@gmail.com>,  OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Dec 2021 14:49:58 +0000
In-Reply-To: 
 <CAOSpxdZfzDQ7m15hfDPehLEBdvvHAWk83t0B3Pmdkz9z4ZXBpA@mail.gmail.com>
References: <20211209065335.2999735-1-timothy.t.orling@intel.com>
	 <CAApg2=S+t867iCm7e4+JaJLStP1KX2F2NtCeLMLS7EVgfbTV=Q@mail.gmail.com>
	 <CAOyo-84-u5dFSfFOK2tcLbpyHffA9NanU00LJEyVZ5pbTr+uPA@mail.gmail.com>
	 <CAOSpxdZfzDQ7m15hfDPehLEBdvvHAWk83t0B3Pmdkz9z4ZXBpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 14:50:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159453

On Thu, 2021-12-09 at 04:43 -1000, Steve Sakoman wrote:
> On Thu, Dec 9, 2021 at 4:36 AM Tim Orling <tim.orling@konsulko.com> wrote:
> > 
> > 
> > 
> > On Thu, Dec 9, 2021 at 4:12 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
> > > 
> > > On Thu, Dec 9, 2021 at 7:53 AM Tim Orling <ticotimo@gmail.com> wrote:
> > > > 
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > 
> > > > The CVE applies to binutils 2.26 and not to gcc so ignore there.
> > > > 
> > > 
> > > Tim,
> > > Have you requested a NVD database change on this one? Or you prefer me to do it?
> > > 
> > I have not. I was simply back-porting the patch from Richard.
> 
> It's always preferable to request a change to the database when it is
> wrong.  They are usually pretty responsive.
> 
> I'll take the patch for now, and if/when they accept the update we can
> remove the exception in master/dunfell.

This one is a little fuzzy. There is an entry for binutils there too and I
didn't understand why there was an unversioned gcc entry there with it. It could
be our CPE parsing isn't quite right. I may also be referring to gcc the project
rather than the component. Regardless, I wanted it off our CVE list! 

Cheers,

Richard


