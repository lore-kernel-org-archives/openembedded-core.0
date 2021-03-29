Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.18318.1617005312979566834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 01:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:48298 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lQmwo-00APmb-KR; Mon, 29 Mar 2021 04:08:31 -0400
Date: Mon, 29 Mar 2021 04:08:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] some trivial(?) questions about packagegroups
In-Reply-To: <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com>
Message-ID: <233e2887-28df-4231-5cbb-6dea4d63fa@crashcourse.ca>
References: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca> <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Fri, 26 Mar 2021, Andre McCurdy wrote:

... snip ...

> PROVIDES sets up a name which can be used as DEPENDS (ie a build
> time dependency) in other recipes. If PROVIDES contains more than
> one name, they all just become aliases for each other.
>
> Since packagegroup recipes only define run time dependencies,
> nothing should have a build time dependency on a packagegroup
> recipe... and so there's no obvious reason to set PROVIDES to
> anything. Leaving the default will be fine (although it won't be
> used for anything).

  can someone verify that packagegroup recipe files indeed do not need
a PROVIDES line? if not, i can submit a patch to toss them from
meta-openembedded as well. it seems(?) fairly obvious that those lines
are superfluous, but i've been surprised before.

rday
