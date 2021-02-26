Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.10995.1614353746172547585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 07:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhtkMzUa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n4so6737923wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=y0ISZfq87c9TzNeYsAVj9ElpOwFIKiMzJHBvtMjZgis=;
        b=XhtkMzUaCwFO/fftOpFGXQbTOt0iQQu940Qv62SL1KK4F6v4vNRKzMFI/TcNtMFK3v
         UK608okrQTLZa18TLUfSEpaUiG4NDxlvF1sM//NvdKSo9hSb9QJPG4TaKJgzeTYa6YWU
         f5KleYsRRE/N494dCbWNlbbRafBwYsQ0OuotQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=y0ISZfq87c9TzNeYsAVj9ElpOwFIKiMzJHBvtMjZgis=;
        b=aKdXRgeOGX/sfO5nfFL/RqKGtNg8jIT+Wu6zCup7LMHW3m2AcB15VIM9tOgzBKKDq3
         Fo/BeMpBlrkpMeJ7GNFglWCH20so8iagb5CQa/CedHOeeF4oZm3jCu+9avN5dRC7z13L
         1KZCRMi2cX5AYFxil3MDZPDj3d4r89yvYOyFBlyOrpyF/+BM0gbwjMNiXnKsU9iq5BcU
         Rm02b2cOTnz0P4vbm89i9rNJNu9G9W9fNAZSFC57YwkXjoNZI+sYanNPHHy5X8lZQXL/
         NciZVNAkJcQg0vL2upcM2zcGWE2FH6yByuJ6GBxV8Ou5J0NWaHmFCvgtZGbRm33MM4+X
         XgGw==
X-Gm-Message-State: AOAM532KrfwVqkIhnebM2OtOZ25rj+INamF11HVpMTPXuiOGmGpYikky
	Y/NpODWu6bbq/44z/6PViwkMtdY1a02qIQ==
X-Google-Smtp-Source: ABdhPJz09YdVEaLy76C6TdWOnKtCIc7vbk3QJYBlbBx8xDHgidQlRTs3KxvwyR9Q1HZF/k/bYxwQCg==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr3493180wmh.177.1614353744424;
        Fri, 26 Feb 2021 07:35:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id z9sm13504824wrv.56.2021.02.26.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:35:44 -0800 (PST)
Message-ID: <bf929b0cc9adbaef4ef5c85f87c103559413c7c2.camel@linuxfoundation.org>
Subject: Re: [OE-core] Pseudo Abort errors
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Phil Reid <preid@electromag.com.au>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2021 15:35:43 +0000
In-Reply-To: <7598c82d-f65c-d2e1-828b-a1956c6e84f8@electromag.com.au>
References: <6b813e24-a48e-5b92-fd26-4f1bd31a8bbd@electromag.com.au>
	 <f6d954124581f233baba17e076d8a848ab998da2.camel@linuxfoundation.org>
	 <166722EB8505D42E.14505@lists.openembedded.org>
	 <7598c82d-f65c-d2e1-828b-a1956c6e84f8@electromag.com.au>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-02-26 at 15:01 +0800, Phil Reid wrote:
> On 26/02/2021 07:56, Phil Reid wrote:
> > On 25/02/2021 18:29, Richard Purdie wrote:
> > > On Thu, 2021-02-25 at 08:28 +0800, Phil Reid wrote:
> > > > G'day,
> > > > 
> > > > Not really sure where to look for this. But started to get random build failures
> > > > with the pseudo client.
> > > > 
> > > > Failures are contained to populate_sdk
> > > > 
> > > > Not always the same file reported in the log and removing tmp-glibc before the build solves the problem.
> > > > 
> > > > I've also tried a psudeo_git.bbappend with:
> > > > SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
> > > > 
> > > > Which looks to be a pending commit on the list.
> > > > Unfortunately it didn't help.
> > > > 
> > > > Here's what I think are the relevant parts of the log are below.
> > > > 
> > > > "rm -rf tmp-glibc" and a rebuild resolves the problem.
> > > > 
> > > > 
> > > > Any thoughts?
> > > 
> > > Which branch and which packaging backend are you using?
> > > 
> > > There is a bitbake.conf patch on the list changing PSEUDO_IGNORE_PATHS
> > > which would probably help but I need to understand that doesn't have
> > > side effects and I don't have enough data to do that yet.
> > 
> > G'day Richard,
> > 
> > I'm on the dunfell branch, using package_ipk.
> > 
> > I found the patch for bitbake.conf and I'll give that a go here.
> > 
> 
> With the following applied, so far today there's been no pseudo aborts.

Thanks for confirming. I've added some changes in master-next which should
have the same effect. Those should make it through the stable queue to dunfell
but we need to get them into master to start with!

Cheers,

Richard

