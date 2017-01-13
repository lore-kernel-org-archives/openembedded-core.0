Return-Path: <sveinse@seldal.com>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Jan 2017 01:12:23 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by mail.openembedded.org (Postfix) with ESMTP id 8380B608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 01:12:23 +0000 (UTC)
Received: from 156.92-221-160.customer.lyse.net ([92.221.160.156]:53922
	helo=[10.5.5.172]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <sveinse@seldal.com>) id 1cRqJA-0004pH-7L
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2017 02:05:32 +0100
To: openembedded-core@lists.openembedded.org
From: Svein Seldal <sveinse@seldal.com>
Message-ID: <bc6b43d0-edd2-fec7-b54b-9261cc0e9027@seldal.com>
Date: Fri, 13 Jan 2017 02:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: uim recipe errors?
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
X-List-Received-Date: Fri, 13 Jan 2017 01:12:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

When looking at the uim recipe:

meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb

I see that it defines quite many packages that end up empty, e.g. 
uim-anthy. The files the FILES_uim-anthy does exist in the installation, 
but they are gobbled up by the FILES_${PN} rule in package splitting.

Can I assume that is unintentional?

While I'm at it, FYI, we have experienced that this recipe is often 
failing installation when doing massive parallel builds, so we had to 
add PARALLEL_MAKEINST = "" to it.


Best regards,
Svein

