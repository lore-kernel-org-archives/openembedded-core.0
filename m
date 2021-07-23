Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.8624.1627048714746197634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 06:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:41706 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1m6vhC-008AhF-7q; Fri, 23 Jul 2021 09:58:33 -0400
Date: Fri, 23 Jul 2021 09:58:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: update YP docs and OE URLs
In-Reply-To: <20210723135348.87531-1-michael.opdenacker@bootlin.com>
Message-ID: <befe9966-d855-8df5-c293-5d91393cc930@crashcourse.ca>
References: <20210723135348.87531-1-michael.opdenacker@bootlin.com>
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

On Fri, 23 Jul 2021, Michael Opdenacker wrote:

> This updates the link to the YP docs
> and proposes to access the OE website through https
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/oe-setup-builddir | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 30eaa8efbe..75f63f5680 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -113,10 +113,10 @@ if [ ! -z "$SHOWYPDOC" ]; then
>      cat <<EOM
>  The Yocto Project has extensive documentation about OE including a reference
>  manual which can be found at:
> -    http://yoctoproject.org/documentation
> +    https://docs.yoctoproject.org
>
>  For more information about OpenEmbedded see their website:
> -    http://www.openembedded.org/
> +    https//www.openembedded.org/

   missing colon.

rday
