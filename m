Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRu6H-0002UD-KX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 00:41:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51Mc5xQ009054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 15:38:05 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 15:38:05 -0700
Message-ID: <4DE6BF4C.4060906@windriver.com>
Date: Wed, 1 Jun 2011 17:38:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1306944074.2529.107.camel@phil-desktop>	<1306944235.2529.109.camel@phil-desktop>	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	<1306945014.2529.113.camel@phil-desktop>	<4DE66D53.30505@windriver.com>	<1306947245.2529.148.camel@phil-desktop>	<4DE66FC6.4030607@windriver.com>	<1306959728.3119.5.camel@lenovo.internal.reciva.com>	<4DE6B685.6060501@mentor.com>	<20110601220659.GA4601@rhein.zuhause.netz>
	<4DE6BBC2.5070509@mentor.com>
In-Reply-To: <4DE6BBC2.5070509@mentor.com>
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
X-List-Received-Date: Wed, 01 Jun 2011 22:41:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/1/11 5:22 PM, Tom Rini wrote:
> On 06/01/2011 03:07 PM, Henning Heinold wrote:
>> On Wed, Jun 01, 2011 at 03:00:37PM -0700, Tom Rini wrote:
>>> On 06/01/2011 01:22 PM, Phil Blundell wrote:
>>>> On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
>>>>> It "should" be as simple and adding --without-perl and --without-python to the
>>>>> configuration line...  but I haven't tried it.
>>>>
>>>> Turns out that rpm-native already does this, but (like the dbus case)
>>>> there is no matching logic to get the DEPENDS right.
>>>>
>>>> Another instance of a similar thing appears to be sqlite3-native, which
>>>> DEPENDS on tcl-native even though it's configured --without-tcl.
>>>
>>> Since this keeps coming up, maybe it needs a comment.  sqlite3 needs
>>> tcl-native (tclsh) to generate a header file.  No tclsh, no sqlite3.
>>
>> I thought that is diffrent with 3.7.x version of sqlite3.
> 
> Nope.  That's what I checked this against.  In oe.dev
> a2c3af2d608b1b713018d688b00e03873a538993 is where we set all of this right.
> 

Someone needs to go in and document the recipe.  It's clear there is confusion
and a quick comment in the recipe can likely stop future discussion.

--Mark


