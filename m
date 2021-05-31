Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.42523.1622456710489946931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 03:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-42-70-30-23-118.dsl.bell.ca ([70.30.23.118]:60582 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lnf6b-0076Li-Dp; Mon, 31 May 2021 06:25:09 -0400
Date: Mon, 31 May 2021 06:25:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
In-Reply-To: <20210531085655.tdj73iny3mxhz22a@qschulz>
Message-ID: <f611ec98-b6b-45f-be50-4997597af7b2@crashcourse.ca>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca> <20210528130557.zr762og6uvyv577b@qschulz> <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca> <20210528141615.klk5hwfmo4gwqfbg@qschulz> <3c62eb6a-ed4c-881f-ded6-625cc4b726da@crashcourse.ca>
 <20210528150703.mueernohsx4wlgry@qschulz> <57954bd8-dd61-ded9-83b1-61cbbc129d8b@crashcourse.ca> <20210528152626.aihuhwh5p5jbfl2d@qschulz> <8fbd5dac-a514-48b-bc14-54b3db5411b6@crashcourse.ca> <20210531085655.tdj73iny3mxhz22a@qschulz>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 May 2021, Quentin Schulz wrote:

> >   LICENSE = "CLOSED"
> >   LIC_FILES_CHKSUM = ""
> >   FILESEXTRAPATHS_prepend := "${THISDIR}:"
> >   SRC_URI := "file://src"
>
> No need for := here, a simple = should suffice?
>
> >   S = "${WORKDIR}/src"
> >
>
> Why not put the sources in:
> meta-mylayer/recipes-test/test/my-test-0.1/src/
> meta-mylayer/recipes-test/test/my-test_0.1.bb
>
> and have SRC_URI = "file://src/" without needing to add
> FILESEXTRAPATHS_prepend := "${THISDIR}:" so that it follows what almost
> every recipe does?
>
> S will be as you wrote above.

  ah, i misread what you were suggesting here, yes, your idea is
cleaner.

rday
