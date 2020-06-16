Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.9003.1592309014196934457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 05:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33990 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jlAJQ-001f5T-B2
	for openembedded-core@lists.openembedded.org; Tue, 16 Jun 2020 08:03:33 -0400
Date: Tue, 16 Jun 2020 08:03:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pypi.bbclass: update HOMEPAGE to point to actual pypi page
In-Reply-To: <alpine.LFD.2.21.2006151807020.13592@localhost.localdomain>
Message-ID: <alpine.LFD.2.21.2006160801100.11703@localhost.localdomain>
References: <alpine.LFD.2.21.2006151807020.13592@localhost.localdomain>
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

On Mon, 15 Jun 2020, Robert P. J. Day wrote:

>
> The current setting for the HOMEPAGE is a redirection, so might as
> well update it.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index 87b4c85fc0..73aca77ef6 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -17,10 +17,10 @@ def pypi_src_uri(d):
>
>  PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>
> -HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> +HOMEPAGE ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
>  SECTION = "devel/python"
>  SRC_URI += "${PYPI_SRC_URI}"
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
> -UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
> +UPSTREAM_CHECK_URI ?= "${HOMEPAGE}"
>  UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"

  ignore this patch, it's a stupid idea given that, as i now see, the
HOMEPAGE for a python recipe will typically *not* match the pypi.org
project page. will ponder further on the best way to standardize this.

rday
