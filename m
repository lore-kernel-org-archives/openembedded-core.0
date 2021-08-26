Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.27646.1629967267624545447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 01:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:54138 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJAwb-0003Dp-7a; Thu, 26 Aug 2021 04:41:05 -0400
Date: Thu, 26 Aug 2021 04:41:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: Phil Blundell <pb@pbcl.net>, 
    OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
In-Reply-To: <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com>
Message-ID: <5e243b44-f466-78ec-b037-361a3befde0@crashcourse.ca>
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca> <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com> <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca> <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
 <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca> <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com>
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

On Thu, 26 Aug 2021, Alexander Kanavin wrote:

> It used to be that 'exit 1' was the way to defer to boot time, but
> that was changed long time ago to not be ambiguous like that and
> cause a real failure at build time. Deferring to first boot needs to
> be explicitly requested with _ontarget() (you can read the
> definition for it to see what really happens, how $D is used and how
> request to defer is made).
>
> Alex

  and that's sort of what i thought, despite what the docs currently
say:

https://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-recipe-post-installation-scripts

"If you do not use this variable, the tools might be missing and
execution of the post-installation script is deferred until first
boot."

  i'll put together some enhanced docs that clear this up, and submit
to docs list.

rday
