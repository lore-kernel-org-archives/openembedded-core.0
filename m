Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.1364.1587680211972011622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 15:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57998 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jRk9J-003t65-R9; Thu, 23 Apr 2020 18:16:50 -0400
Date: Thu, 23 Apr 2020 18:16:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <kergoth@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] any value in a single variable setting for "don't use busybox"?
In-Reply-To: <CABcZANkMLE8aif1TK_gK80KMXo9R-9QaubyvKcdd+jWiH_Upqw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004231814480.1393687@localhost.localdomain>
References: <alpine.LFD.2.21.2004231348560.3238810@localhost.localdomain> <CABcZANkMLE8aif1TK_gK80KMXo9R-9QaubyvKcdd+jWiH_Upqw@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-730874156-1587680209=:1393687"

--8323328-730874156-1587680209=:1393687
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Apr 2020, Christopher Larson wrote:

> This seems like something best kept in the distro .conf rather than
> local.conf, in which case brevity is much less of an issue.
>
> On Thu, Apr 23, 2020 at 10:53 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         in the vein of the recently-introduced INIT_MANAGER variable, is
>       there any value in introducing a variable that is short for "i don't
>       want a hint of busybox in my image"?
>
>         i see the equivalent in the same file i mentioned in an earlier
>       post: meta/lib/oeqa/selftest/cases/imagefeatures.py, with the
>       corresponding settings:
>
>       # Replace busybox
>       PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
>       VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
>       VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
>       VIRTUAL-RUNTIME_base-utils-syslog = ""
>
>       # Blacklist busybox
>       PNBLACKLIST[busybox] = "Don't build this"

  sure, that's logical. can i at least verify that the above does
indeed represent the entirety of saying, "i want no busybox"?

rday

--8323328-730874156-1587680209=:1393687--
