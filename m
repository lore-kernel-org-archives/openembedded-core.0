Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRonv-0003Pi-7u
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:01:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51GwlI8027657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jun 2011 09:58:47 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 09:58:47 -0700
Message-ID: <4DE66FC6.4030607@windriver.com>
Date: Wed, 1 Jun 2011 11:58:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306944074.2529.107.camel@phil-desktop>	<1306944235.2529.109.camel@phil-desktop>	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	<1306945014.2529.113.camel@phil-desktop>
	<4DE66D53.30505@windriver.com>
	<1306947245.2529.148.camel@phil-desktop>
In-Reply-To: <1306947245.2529.148.camel@phil-desktop>
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 17:01:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/1/11 11:54 AM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 11:48 -0500, Mark Hatle wrote:
>> So in the above, perl and python are really the only items that could be disabled.
> 
> Just to be clear, in the list you mentioned, were you talking about the
> usage of rpm-native for rpmdeps, or the usage by package_rpm.bbclass
> itself?

I was talking about rpm-native recipe in general, and how it's used.

rpmdeps requires a good chunk of the rpm infrastructure (even if we don't end up
using rpmbuild or rpm commands during the build..)

> If we can avoid building perl-native and python-native then that
> certainly sounds like a win on its own, though :-)

It "should" be as simple and adding --without-perl and --without-python to the
configuration line...  but I haven't tried it.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



