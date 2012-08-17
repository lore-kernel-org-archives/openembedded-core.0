Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2IIQ-0006Wh-RK
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 10:52:46 +0200
Received: from localhost ([127.0.0.1]:52053 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2I6q-0002Sd-MW
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 08:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=Khq6rV3MFy/FD9Ur5E5eCI8yBdM=; b=CEpPkBhZi9Ci4PDv7Kpk4rlqsCyy
	ZDSTF2e0wn4DCJizQRbi9CePF2AM9rO813liG1rcO12x9HrwzXjvaWsVJi/WCi9y
	hB5DsjVv2XX3//ruryC3i55FPGoAsjF09/5XvQeGCfwOHvjezcK716LcmdrSoIuM
	z0mTydHJsxIV3T8=
Received: from [195.171.99.130] (port=20720 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2I6q-0002Sa-K7
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 08:40:48 +0000
Message-ID: <502E03E4.2030009@communistcode.co.uk>
Date: Fri, 17 Aug 2012 09:42:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345162235-23835-1-git-send-email-marc@cpdesign.com.au>
In-Reply-To: <1345162235-23835-1-git-send-email-marc@cpdesign.com.au>
Subject: Re: [PATCH] avahi: fix packaging of avahi-autoipd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Aug 2012 08:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/12 01:10, Marc Reilly wrote:
> - Avahi's "avahi-autoipd" file is in the dhcp/ folder, not dhcp3/
> - udhcpc files were being installed but not being shipped in avahi-autoipd
> - do_install override for avahi-autoipd was not being called and is not
>    required, so join it into regular do_install.
> - While at it, fixup string quoting in description.
>
> This makes avahi-autoipd work with simple ifup/down scripts.
>
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |   11 +++++------
>   1 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 37ff70d..f0c043b 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -1,10 +1,10 @@
>   SUMMARY = "Avahi IPv4LL network address configuration daemon"
> -DESCRIPTION = "Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
> +DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
>   allows programs to publish and discover services and hosts running on a local network \
>   with no specific configuration. This tool implements IPv4LL, "Dynamic Configuration of \
>   IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
>   configuration from the link-local 169.254.0.0/16 range without the need for a central \
> -server."
> +server."'

I might be being daft but is there an extra quote in here?

+server."'

should be:

+server.'

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



