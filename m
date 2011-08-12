Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrtQv-0006UP-Hr
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:14:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7CF9Q3Y012905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 08:09:26 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 12 Aug 2011 08:09:26 -0700
Message-ID: <4E454225.40603@windriver.com>
Date: Fri, 12 Aug 2011 10:09:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1313153364.14274.486.camel@rex> <4E452F82.7060208@windriver.com>
	<1313159586.14274.494.camel@rex>
	<1313159714.6733.157.camel@phil-desktop>
In-Reply-To: <1313159714.6733.157.camel@phil-desktop>
Subject: Re: [PATCH] local.conf.sample: Cleanup and improve
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
X-List-Received-Date: Fri, 12 Aug 2011 15:14:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/12/11 9:35 AM, Phil Blundell wrote:
> On Fri, 2011-08-12 at 15:33 +0100, Richard Purdie wrote:
>>> Should patch resolution be noop by default?  (I suspect due to my above concern
>>> w/ ipkg, changing the behavior now is likely a bad idea.)
>>
>> Good question. I suspect most people prefer noop and it would make more
>> sense for unattended builds...
> 
> Agreed, I think noop is probably the best/least surprising default
> behaviour.

My suggestion then is a separate commit that sets noop as the default behavior..

(I almost always run w/ noop set.)

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



