Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UGzOo-0008Nz-E4
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Mar 2013 23:16:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CD28231E7716
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 22:52:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 99PEb9Schm2E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 22:52:12 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.40.42])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BD0DF31E7717
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 22:52:11 +0100 (CET)
Message-ID: <5144E98B.50105@opendreambox.org>
Date: Sat, 16 Mar 2013 22:52:11 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363434559-12940-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1363434559-12940-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] default-providers: fix PREFERRED_PROVIDER_udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Mar 2013 22:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.03.2013 12:49, Andreas Oberritter wrote:
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -38,4 +38,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
>  PREFERRED_PROVIDER_console-tools ?= "kbd"
>  PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
>  PREFERRED_PROVIDER_make ?= "make"
> -PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> +PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"

Please ignore this patch. Ross already did this is his hybrid
sysvinit/systemd branch.

Regards,
Andreas



