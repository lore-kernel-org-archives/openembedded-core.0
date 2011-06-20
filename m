Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QYf0T-0001VB-5S
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:59:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5KDte1a003140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 06:55:40 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 20 Jun 2011 06:55:40 -0700
Message-ID: <4DFF515B.1040202@windriver.com>
Date: Mon, 20 Jun 2011 08:55:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>	<4DFF49B8.9050908@windriver.com>	<1308576583.25285.12093.camel@phil-desktop>
	<90AD0E19-73AB-4443-AAC5-D1069E260D2C@dominion.thruhere.net>
In-Reply-To: <90AD0E19-73AB-4443-AAC5-D1069E260D2C@dominion.thruhere.net>
Subject: Re: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 13:59:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/20/11 8:31 AM, Koen Kooi wrote:
> 
> Op 20 jun 2011, om 15:29 heeft Phil Blundell het volgende geschreven:
> 
>> On Mon, 2011-06-20 at 08:23 -0500, Mark Hatle wrote:
>>> (The minor cases are primarily firmware loaded into off-board cards in PCI
>>> chasis and such.. occasionally these firmware are ELF and of an architecture not
>>> the same as the host..  it's rare, but I have seen it before.)
>>
>> Shouldn't those firmware images just go in a separate package?

Depends on how the system is configured..  Often I see them packaged with the
firmware loader -- which is the proper arch, etc..

> If we do that we can use INSANE_SKIP_firmwarepackage = True, which seems like a good solution.

Ya, as long as we can skip -- or change it to a warning instead of an error.. I
think we're good.  Like I said, this is rare and unlikely to be an issue in
anything in oe-core, meta-oe or even the distributions based on oe-core.. but I
have seen it in customer production environments before.

--Mark

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



