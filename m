Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5CD70362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 121B5314D0E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:42:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jHsnhMHnJ-Vz
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:42:03 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.118.48])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2DEEF314D0E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:42:03 +0200 (CEST)
Message-ID: <53C63ADA.5010903@opendreambox.org>
Date: Wed, 16 Jul 2014 10:42:02 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>	<1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>	<53C55932.2050206@opendreambox.org>	<8672BB614B4CCA40A6B3BDD6FD82050BA8B27F6E@COSNADEXC13.usr.ingenico.loc>
	<53C63845.2060407@opendreambox.org>
In-Reply-To: <53C63845.2060407@opendreambox.org>
Subject: Re: [PATCH v3] libav: set LICENSE and LICENSE_FLAGS according to PACKAGECONFIG options
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
X-List-Received-Date: Wed, 16 Jul 2014 08:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.07.2014 10:31, Andreas Oberritter wrote:
> On 16.07.2014 08:43, Matthieu CRAPET wrote:
>> Giving --enable-gpl to configure does not convert pure 100% LGPL licensed library to GPL license. Am I wrong?
> 
> If you combine GPL'ed and LGPL'ed code, the resulting binary will be GPL'ed.
> 
> https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License#Compatibility

Sorry, I misunderstood that part of your question. If libavutils
contains LGPL'ed code only, then there's no technical reason to
automatically convert the license of libavutils to GPL, just because
--enable-gpl was given on the comand-line. However, the libav 'LICENSE'
clearly states that it's still the case anyway, but for non-technical
reasons.

Regards,
Andreas

