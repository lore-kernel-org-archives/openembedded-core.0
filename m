Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RuW9N-0005DQ-DQ
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:31:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q16LMx5i005461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:22:59 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Feb 2012 13:22:58 -0800
Message-ID: <4F3044B1.1000705@windriver.com>
Date: Mon, 6 Feb 2012 15:22:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
	<2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
In-Reply-To: <2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Mon, 06 Feb 2012 21:31:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/12 3:17 PM, Koen Kooi wrote:
>
> Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende geschreven:
>
>> Hello,
>>
>> do we already have support for the ARM "armhf" ABI in OpenEmbedded?  (A quick search on the ML didn't get me hits).
>>
>> Basically,"armhf" is built with -mfloat-abi=hard, and tuned for armv7-a CPUs.
>
> Yes, we've had it for ages in OE-classic and Marks tune overhaul made it easy to use in OE-core as well. Also note that armhf has practically no adavantage over softfp in real world applications. The only things getting a decent speedup in proper benchmarks was povray.

I strongly discourage people from using it.  If you don't care about ABI 
compatibility it might be a few cycles faster.. but it does limit your ability 
to draw from existing EABI software.  (Be it commercial or open source.)

(And yes, I realize this is a minor concern for most embedded systems.. but it 
is an issue.)

--Mark

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



