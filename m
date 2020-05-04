Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9145.1588607626361818392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 08:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IrvPuG//;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l18so10829123wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/zxG0TWpP7xhvQ3pU6el0cY4z0zztrWjVUASSaJAI1w=;
        b=IrvPuG//FQBCU1wHQYwolU5kvyAvv0HqioOGFviLzliJ0YObY9/Zyply0qRxXUz19T
         CvMFToDGYK6pNtrODRBwdOXzRDNVebvNESiC07xx3889Rc58+c9vHhUrHe2ochefq8mS
         5CSwFPXJIW3iqua9Q6P74D4z3fEce0UVJnemM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/zxG0TWpP7xhvQ3pU6el0cY4z0zztrWjVUASSaJAI1w=;
        b=qrCqIgKBxhzyiIXtnvd7pK0dg+4/Pgn52FcZRHLOtgf7M/g268s98Y1eio/c+p6Gvc
         iP1f8QGaNP84oNZdfXlKLEl9TE3S8L8tbKz4xAusb0y3uUmJjIpZF5gZHU/nyGghBkWn
         5UD4rqeCsaP2Cakr9DgEG6+OHd4gM6h/0o6h1x2L3FFpVm99Tvg0zNrChCG+3JfQIy/h
         AL1U7NqV6FCl2aCoNzM0+jLnE/0rPNfVpWaYuUoQdGTrF2FeqpDuM93Hprv+2BPRZPQt
         F4+Lq/qlawGZOdPPvrUGnx93g/KLeDMgYeucZS/xv+qIcUZBEBA1OC4o4TDRAzP4kijH
         lIRA==
X-Gm-Message-State: AGi0Pub3rvVXDLDTIgTi4M8dcaWvV3xY/WKYIL4elK8bKD7dpQcC9MlV
	Z6Zsn65bF03nF8Qnnm3Ej6DzCl/Eg8s=
X-Google-Smtp-Source: APiQypLdBhuCK1YTtjR2d4cM6T5MFvCGYgM7kq1aDqHe3khbM7x0az24M/PzGWiJWoKZR/0Sfx8Uug==
X-Received: by 2002:a5d:5309:: with SMTP id e9mr6801276wrv.311.1588607624767;
        Mon, 04 May 2020 08:53:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a13sm12190236wrv.67.2020.05.04.08.53.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 08:53:44 -0700 (PDT)
Message-ID: <bdccbf3d0baa5252b9738cca6b6b93b7c06eee53.camel@linuxfoundation.org>
Subject: Re: [OE-core] is there any value to FILESPATHPKG?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 May 2020 16:53:43 +0100
In-Reply-To: <e9cb896b5db64c9bbb464cd66ec2e344@XBOX03.axis.com>
References: <alpine.LFD.2.21.2005040611490.6242@localhost.localdomain>
	 <e9cb896b5db64c9bbb464cd66ec2e344@XBOX03.axis.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-05-04 at 13:29 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> > Sent: den 4 maj 2020 12:14
> > To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > Subject: [OE-core] is there any value to FILESPATHPKG?
> > 
> >   not sure where i read this (YP overview manual?), but i recall
> > something about the FILESPATHPKG variable being deprecated, and i
> > see
> > its only references are:
> > 
> > $ grep -irw filespathpkg *
> > meta/classes/utils.bbclass:    filespathpkg =
> > d.getVar("FILESPATHPKG").split(":")
> > meta/classes/utils.bbclass:        for pkgpath in filespathpkg:
> > $
> > 
> > so i'll leave it to someone else to decide if it still has value.
> > 
> > rday
> 
> A quick grep through the Git logs for Poky and Openembedded 
> indicates that the only functions that depend on FILESPATHPKG, 
> is_machine_specific() and machine_paths(), have never been used 
> since their introduction. So I'd say it should be safe to remove 
> them.

Agreed, I started thinking they'd be fine simplified, but I think it
does make most sense to remove them entirely.

Cheers,

Richard

