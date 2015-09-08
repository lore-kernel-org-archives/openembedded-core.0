Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Sep 2015 18:28:23 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id BEFB565CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1E758315A631
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 20:21:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6FHwvqx2MSDd
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 20:21:10 +0200 (CEST)
Received: from [172.22.22.61] (55d46d8b.access.ecotel.net [85.212.109.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 00BCB315A62F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 20:21:09 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1441729207-22458-1-git-send-email-jslater@windriver.com>
	<1441729207-22458-2-git-send-email-jslater@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <55EF2714.1090801@opendreambox.org>
Date: Tue, 8 Sep 2015 20:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441729207-22458-2-git-send-email-jslater@windriver.com>
Subject: Re: [PATCH 1/1] dpkg: put start-stop-daemon in its own package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 18:28:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Joe,

On 08.09.2015 18:20, Joe Slater wrote:
> @@ -67,6 +73,18 @@ PROV_class-native = ""
>  
>  PROVIDES += "${PROV}"
>  
> +# split out start-stop-daemon to its own package
> +#
> +PACKAGES =+ "${PN}-start-stop"
> +FILES_${PN}-start-stop = "${base_sbindir}/start-stop-daemon.dpkg"
> +
> +ALTERNATIVE_PRIORITY="100"
> +ALTERNATIVE_${PN}-start-stop = "start-stop-daemon"
> +ALTERNATIVE_LINK_NAME[start-stop-daemon]="${base_sbindir}/start-stop-daemon"
> +
> +RDEPENDS_${PN} += "${PN}-start-stop"
> +#
> +

I think you should omit the comment, because it only describes the obvious.

How about using ${PN}-start-stop-daemon?

Regards,
Andreas

