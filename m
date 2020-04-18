Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.7574.1587248381568264859
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 15:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:52980 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPvoJ-004GGU-M9; Sat, 18 Apr 2020 18:19:40 -0400
Date: Sat, 18 Apr 2020 18:19:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <kergoth@gmail.com>
cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
    "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
    Richard Purdie <richard.purdie@linuxfoundation.org>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
In-Reply-To: <d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark>
Message-ID: <alpine.LFD.2.21.2004181818270.571354@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain> <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org> <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain> <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
 <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain> <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com> <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain> <d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.3
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
Content-Type: multipart/mixed; boundary="8323328-259416807-1587248379=:571354"

--8323328-259416807-1587248379=:571354
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sat, 18 Apr 2020, Christopher Larson wrote:

> I don’t think this is out of date. It’s allowing the user to specify
> the path to bitbake (which I’ve done in unusual layouts or just to
> be explicit), falling back to either under OEROOT (poky-style) or in
> its parent (more typical).
>
> It’s also worth noting that oe-init-build-env and
> oe-buildenv-internal are not just used directly, but many other
> setup scripts build on top of them, so this particular flexibility
> is useful. BDIR still seems like it can be dropped regardless of the
> BITBAKEDIR logic.

  so if BBEXTRA is still valid, should it be documented, perhaps in
the variable glossary?

rday

--8323328-259416807-1587248379=:571354--
