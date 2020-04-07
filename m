Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.2998.1586288293364852558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:45246 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLu32-001ouI-1i; Tue, 07 Apr 2020 15:38:12 -0400
Date: Tue, 7 Apr 2020 15:38:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] clarify use of "$D" in pkg_postinst routines?
In-Reply-To: <CANNYZj8_5_eKPnUn3Ckv0X9upaQGBe7ZcnyAysv=G6zF-+_Kyw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004071532260.11485@localhost.localdomain>
References: <alpine.LFD.2.21.2004071503180.10456@localhost.localdomain> <CANNYZj8_5_eKPnUn3Ckv0X9upaQGBe7ZcnyAysv=G6zF-+_Kyw@mail.gmail.com>
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
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Apr 2020, Alexander Kanavin wrote:

> These run

> - at image creation time in the context of package manager
>   (dnf/apt/opkg) installing packages into the image rootfs
>   directory. The code that executes the package manager specifically
>   exports $D into the environment before launching it.

> - at runtime when packages are installed or updated through the same
>   package manager.  Then, $D is absent.

  ah, that's very much what i'd guessed. i also just noted sec 4.7.7
in ref manual, one of the QA checks:

"An additional QA check has been added to detect usage of ${D} in
FILES values where D values should not be used at all. The same check
ensures that $D is used in
pkg_preinst/pkg_postinst/pkg_prerm/pkg_postrm functions instead of
${D}."

> The scripts are written into the package files when the packages
> gets created; they become 'post-install scriptlets' that every
> package manager supports and executes if they are present.

  so far, so good, i'm still going to expand on that section since
it definitely could use some fleshing out.

rday
