Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B85ED6AC82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 29DCD314D0E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:31:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id irBJKoipbVFs
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:31:02 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.118.48])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 25565314D0DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:31:02 +0200 (CEST)
Message-ID: <53C63845.2060407@opendreambox.org>
Date: Wed, 16 Jul 2014 10:31:01 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>	<1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>	<53C55932.2050206@opendreambox.org>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B27F6E@COSNADEXC13.usr.ingenico.loc>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27F6E@COSNADEXC13.usr.ingenico.loc>
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
X-List-Received-Date: Wed, 16 Jul 2014 08:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.07.2014 08:43, Matthieu CRAPET wrote:
> Hi again,
> 
>> Some optional parts of Libav are licensed under the GNU General Public License version 2 or later (GPL v2+). See the file COPYING.GPLv2 for details. 
>> None of these parts are used by default, you have to explicitly pass --enable-gpl to configure to activate them. In this case, Libav's license changes to GPL v2+."
> 
> I may misunderstood something here.
> 
> For example:
> - libavfiler. It contains yadif code which is GPLv2+ and frei0r code is LGPLv2.1+. Libavfiler is clearly contaminated: 

Yadif needs to be enabled explicitly with --enable-gpl. frei0r is 
disabled by default. If enabled, it's linked at runtime using dlopen. 
At least, this is what the 'configure' script suggests.

> LICENSE_libavfilter = "GPLv2+"
> - libavutils is 100% LGPL
> LICENSE_libavutils = " LGPLv2.1+"
> 
> Giving --enable-gpl to configure does not convert pure 100% LGPL licensed library to GPL license. Am I wrong?

If you combine GPL'ed and LGPL'ed code, the resulting binary will be GPL'ed.

https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License#Compatibility

Regards,
Andreas


