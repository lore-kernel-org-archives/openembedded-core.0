Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.34391.1595235864301683724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 02:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=sppV79cv;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2AC935C09AE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 11:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1595235862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKonJL5o3QjUh50v2mkO9xjOz3Yu3ImOY6KfUQSAp9g=;
	b=sppV79cvxlnRtY6wdMEv64M/+7EtsFFQzOZ5eU0d7RDHHLGLaCioYy77l0WDrVXjAsPYD+
	ENvfrRIlvfE0MfQD51mVXE+kWmSVUcGKOdbgWTwDgoam9R9Ohqsi/+ahGPWejg+cDB5FCo
	ioX+k5PrEMTeszPiqTw+w57qHXlAkxo=
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 11:04:22 +0200
From: "Stefan Agner" <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEhhbmRsZSBPRkQgbG9jayBmbGFncyAocmV2Mik=?=
In-Reply-To: <20200720090229.2264.54478@do>
References: <20200720083743.12097-1-stefan@agner.ch>
 <20200720090229.2264.54478@do>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <82f41b74c0636369bef2cec9a2e36b4b@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I guess I should have prefixed that one with [pseudo].

--
Stefan

On 2020-07-20 11:02, Patchwork wrote:
> == Series Details ==
> 
> Series: Handle OFD lock flags (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/15665/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 532ae127c5)
> 
> * Patch            [v2] Handle OFD lock flags
>  Issue             Shortlog does not follow expected format
> [test_shortlog_format]
>   Suggested fix    Commit shortlog (first line of commit message)
> should follow the format "<target>: <summary>"
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:    
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
