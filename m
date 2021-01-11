Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.31917.1610361351075252427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BbbxpXm2;
 spf=pass (domain: konsulko.com, ip: 209.85.210.52, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f52.google.com with SMTP id i6so16437085otr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j274EAbpsSyBu28fEaePc4eGS+Xri16S7aiPNsqbALk=;
        b=BbbxpXm2LDlnmbAM7Pe5RrkvIM2lI8/vL+M1BtBIR4ZQNDSorSMUpTgl30MKiI0q39
         tebDbrGNj40wJkHBSdjSRdZ1cH+A8pxCt2+A1o1tqyAw7OcSsan+W+Em7gm1v6KIRxgc
         2hT0Dvaw0ainajKdFjTM8oAxPXqYSL8zVz19U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j274EAbpsSyBu28fEaePc4eGS+Xri16S7aiPNsqbALk=;
        b=ArZ2amJRo00wTo056iIJyCyRNb1J/84UyKl1WsjBB+OtEtJBtWv/eQm24K1BbeEorn
         vyJUqw3+pgmKo+KzGmEHOj2krpEAmrVBH0JeQSaOi9ObCGbe+I1DVy3NdNIwEL7LytcA
         8kSNRaHmNA1Lzo+KMtN9Tdl2s6RKdyY5hn2wh1tkHCB8cI7QoEqFmTuz0dINXeVYFQRL
         Gtd1qtecdkh7eiDpvQLDtXYHL6hcUTIgaiyE7aCdAEZ8/ISI58jL+e2sLnmFCR8LuzNR
         PyziY7V5glJBrrfOaBWFkzuc/YfKx5JyzCbQjypm3e0ZgOJBztxre8+kO18KC98xxGyo
         nMMQ==
X-Gm-Message-State: AOAM5315XbkRRDmsOI5YoaVJJ8GLE5p6R89swRkNfhctI07y8rjrfsEl
	6X6m/2pG2hCs8ZfCo7QLQXzDnHuJUeo0GCy2uzDVxg==
X-Google-Smtp-Source: ABdhPJylVC1FyOG5czwFiLYRuKDPSB3q0My57Apsq+8QgqQtnzti2RG2oQTq5O19aXO3iEZkY+5kzWPAcJL5b2eePjA=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr10524334otm.305.1610361350420;
 Mon, 11 Jan 2021 02:35:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610325804.git.steve@sakoman.com> <51fa76c699517ad63f8d6c4db4b6938d894f5c6c.1610325804.git.steve@sakoman.com>
In-Reply-To: <51fa76c699517ad63f8d6c4db4b6938d894f5c6c.1610325804.git.steve@sakoman.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 11 Jan 2021 10:35:41 +0000
Message-ID: <CAM9ZRVu5a_tR9=NcJGPQYOk8zeQoOtgrwSmzCLwjTL-SqH=LPQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 11/12] selftest: Add argument to keep build dir
To: Steve Sakoman <steve@sakoman.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 00:46, Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Paul Barker <pbarker@konsulko.com>
>
> The oe-selftest code already keeps the selftest build directory in place
> if any tests failed. By default the build directory is deleted if all
> tests pass but there may be cases where it's desirable to keep this
> directory around, for example to compare intermediate files between
> passing and failing test runs.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 67aa7069dbe8f5f5f186eb67708ece5c4bd42976)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

I was going to suggest backporting this one even though it is not
explicitly a bugfix as it's low risk and helps with testing. Thanks
for picking this up.

Anuj, could we also get this backported to gatesgarth?

Thanks,

-- 
Paul Barker
Konsulko Group
