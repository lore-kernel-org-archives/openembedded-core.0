Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.15640.1617366640522468137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:46986 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lSIwf-00BmH4-QA; Fri, 02 Apr 2021 08:30:38 -0400
Date: Fri, 2 Apr 2021 08:30:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: Steve Sakoman <steve@sakoman.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 13/15] packagegroups: delete useless "PROVIDES" lines
In-Reply-To: <CAJ86T=VowO_dOjSw-hSs2B+dnHwhnKcEiRoywhBwa_E7tWkMcQ@mail.gmail.com>
Message-ID: <9b71cdff-2c58-1df0-a7a0-78e4f79c88d4@crashcourse.ca>
References: <cover.1617290309.git.steve@sakoman.com> <cd4f70f47c82377d65c51a7c9a9759188dfbb5b1.1617290310.git.steve@sakoman.com> <CAJ86T=VowO_dOjSw-hSs2B+dnHwhnKcEiRoywhBwa_E7tWkMcQ@mail.gmail.com>
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

On Thu, 1 Apr 2021, Andre McCurdy wrote:

> On Thu, Apr 1, 2021 at 8:29 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> >
> > There is apparently no functional value to "PROVIDES" lines
> > anymore in packagegroup recipe files, so remove the lonely couple
> > of examples left.
>
> Seems questionable for backporting to a stable release. The bogus
> PROVIDES lines have been there for more than a decade without
> causing any issues (ie removing them isn't fixing a bug).

  i agree that this is probably not worth backporting, but i'm a
minimalist in the sense of, if something has no value, it should be
removed in the *current* code base. backport? nah, i'm not *that*
pedantic.

rday
