Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRspy-00013f-Cx
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:20:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51LHAgV020276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jun 2011 14:17:11 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 14:17:10 -0700
Message-ID: <4DE6AC56.7010308@windriver.com>
Date: Wed, 1 Jun 2011 16:17:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1306944074.2529.107.camel@phil-desktop>	
	<1306944235.2529.109.camel@phil-desktop>	
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	
	<1306945014.2529.113.camel@phil-desktop>
	<4DE66D53.30505@windriver.com>	
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>	
	<1306948134.2529.158.camel@phil-desktop>
	<4DE68B24.8060503@windriver.com>
	<1306958566.3119.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1306958566.3119.1.camel@lenovo.internal.reciva.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: rpmdeps, was Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 21:20:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/1/11 3:02 PM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 13:55 -0500, Mark Hatle wrote:
>> The issue is that it uses the librpm, librpmdb, librpmio, and librpmmisc
>> libraries.  These libraries provide and use all of the rest of the components.
> 
> Right, but would rpmdeps still be able to do what it needs to if rpm was
> built --without-openssl etc?  The output from ldd isn't especially
> enlightening in itself because all that tells us is which libraries
> librpm was built against.
> 
> p.
> 
> 

I'm not sure if the libraries that RPM uses would even be able to link w/o
openssl.  (I never tried it.)  But that will affect people who are using RPM
packages as signing and validation routines come from openssl.

--Mark


