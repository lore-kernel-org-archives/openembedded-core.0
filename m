Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.2578.1617616774426334833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:44852 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTM16-007soL-E9; Mon, 05 Apr 2021 05:59:32 -0400
Date: Mon, 5 Apr 2021 05:59:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] couple questions about IMAGE_BASENAME usage
In-Reply-To: <7aa5c545-5359-890a-3bb9-c687a7a9e3ce@linux.microsoft.com>
Message-ID: <43fc86f2-932-98e0-cff8-1760d7c8d498@crashcourse.ca>
References: <e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca> <7aa5c545-5359-890a-3bb9-c687a7a9e3ce@linux.microsoft.com>
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

On Sun, 4 Apr 2021, Alejandro Hernandez Samaniego wrote:

> On 4/2/2021 12:13 PM, Robert P. J. Day wrote:
>
>   also, i'm curious about the difference between these two image
> recipes:
>
> core-image-minimal-initramfs.bb:export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
> core-image-tiny-initramfs.bb:export IMAGE_BASENAME = "core-image-tiny-initramfs"
>
> why does the first accommodate the multilib prefix MLPREFIX, while
> the second does not?
>
> The recipe for core-image-tiny-initramfs is based on
> core-image-minimal-initramfs, going throught the git log it seems
> that a bug was found and it was only fixed for
> core-image-minimal-initramfs and not for the tiny one at
> e18b7e77ed7, I encourage you to send patches for these kind of
> findings, after doing some digging if something is still not making
> sense, then theres a chance it needs to be fixed (like tihs one)

  mucking around with git log and blame, i note that MLPREFIX was
added to that first image along with this line in image-live.bbclass:

INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"

  so my initial reaction was to simply add ${MLPREFIX} to the second
image mentioned above, but now i'm not so sure -- i'm open to
suggestions.

rday
