Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWvns-0002vv-TV
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 22:35:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MKPQOC004448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 13:25:26 -0700 (PDT)
Received: from msp-dhcp32.wrs.com (172.25.34.32) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 May 2012 13:25:25 -0700
Message-ID: <4FBBF633.1010306@windriver.com>
Date: Tue, 22 May 2012 15:25:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337714416.git.mark.hatle@windriver.com>
	<abbc4037f2e4206a877be42be6ca5c132dbfef01.1337714416.git.mark.hatle@windriver.com>
	<6CD637A1-63A6-44D7-B744-1C03442FCA03@dominion.thruhere.net>
In-Reply-To: <6CD637A1-63A6-44D7-B744-1C03442FCA03@dominion.thruhere.net>
Subject: Re: [PATCH 01/30] update-alternatives.bbclass: Refactor the implementation
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
X-List-Received-Date: Tue, 22 May 2012 20:35:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/12 3:11 PM, Koen Kooi wrote:
>
> Op 22 mei 2012, om 21:30 heeft Mark Hatle het volgende geschreven:
>
>> Refactor in order to:
>>   * Deprecate the old interfaces, but keep them for compatibility
>>   * Provide a new, interface -- capable of working with split packages
>>   * Each update-alternative will not set proper "per-file" provides
>
> 'now' or 'not'?

One typo.. ;)  yes it should be 'now'.

I'll fix it in the repository and branch.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



