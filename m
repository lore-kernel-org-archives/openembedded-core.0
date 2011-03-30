Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q4xaw-0005D9-Kv
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 17:46:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UFi3Ev010760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2011 08:44:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Mar 2011 08:44:02 -0700
Message-ID: <4D934FBC.40802@windriver.com>
Date: Wed, 30 Mar 2011 10:43:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1301496447.24596.100.camel@rex>
In-Reply-To: <1301496447.24596.100.camel@rex>
X-Originating-IP: [172.25.36.234]
Subject: Re: lconfig-native is not endian safe
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
X-List-Received-Date: Wed, 30 Mar 2011 15:46:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/30/11 9:47 AM, Richard Purdie wrote:
> Hi,
> 
> Poky has had a ldconfig-native recipe in for a while. Back in the times
> our RPATHS were totally broken adding in an ld.so.cache was useful. In
> modern times I'm having trouble working out when this would be useful on
> a standard system as libraries are pretty much always in one of the two
> default search locations.
> 
> ldconfig-native is 32/64 bit safe. I've just been looking at PPC and it
> is certainly not endian safe though. The endianess of the target system
> need to match that of the build system for it to work. It wouldn't be
> much work to make it endian safe though although the codebase will
> diverge further from that in (e)glibc though.
> 
> Short term we need to disable it at least for ppc, longer term what
> should we do?

On ARM, are the structures packed in the same way as the target system?

I know I prefer to NOT use ldconfig in the systems I design, but I understand
why people want it.

I suggest we disable it on PPC for now, and work on updating endian support,
(packing if necessary) and make sure that it supports the latest ldconfig
features of being able to use referenced directories and such.

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



