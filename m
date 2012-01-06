Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Riy3n-0000vH-U9
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 01:53:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1351E31577D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 01:39:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HA9xKRv60j61
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 01:39:23 +0100 (CET)
Received: from [172.22.22.61] (drms-590c57d9.pool.mediaWays.net [89.12.87.217])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9EE4931577CD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 01:39:23 +0100 (CET)
Message-ID: <4F0642B9.20104@opendreambox.org>
Date: Fri, 06 Jan 2012 01:39:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1325799041-3640-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1325799041-3640-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] wpa-supplicant: Compile without CONFIG_GNUTLS_EXTRA
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 00:53:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05.01.2012 22:30, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> 
> CONFIG_GNUTLS_EXTRA is needed as support for TLS/IA which was designed to be used
> in the EAP-TTLSv1. As we don't see any requirement for that protocol today we decided
> to remove it from wpa-supplicant .config file.

With this option removed, is there any reason to prefer GnuTLS over
OpenSSL? OpenSSL is wpa-supplicant's default, and at least Ubuntu uses
OpenSSL with it, too. I guess it's tested more thoroughly than GnuTLS.

Regards,
Andreas


