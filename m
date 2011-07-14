Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QhBJA-0001rP-LR
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 04:05:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6E21jrO023546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:01:45 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 13 Jul 2011 19:01:44 -0700
Message-ID: <4E1E4E08.8040802@windriver.com>
Date: Wed, 13 Jul 2011 21:01:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1E18AA.2050808@mentor.com> <4E1E447A.2060703@windriver.com>
	<4E1E49FD.3020500@mentor.com>
In-Reply-To: <4E1E49FD.3020500@mentor.com>
Subject: Re: siteinfo for recipes oe-core lacks?
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
X-List-Received-Date: Thu, 14 Jul 2011 02:05:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/13/11 8:44 PM, Tom Rini wrote:
> On 07/13/2011 06:20 PM, Mark Hatle wrote:
>> On 7/13/11 5:14 PM, Tom Rini wrote:
>>> Hey all,
>>>
>>> Do we have an opinion on siteinfo for recipes that oe-core lacks?  I
>>> have two easy examples:
>>> - mono: neither meta-oe nor oe-core have a recipe, we have siteinfo
>>> stuff specific to it.  Ignore it? drop it?  update it with what meta-oe has?
>>> - postgresql: meta-oe has it, oe-core lacks it.  Keep in meta-oe only?
>>>
>>
>> For both of them, I'd keep them as local to the recipe as possible.. no recipe,
>> no siteinfo listed.
> 
> Well, I think we're missing the forest for the trees.  But that's not
> really a workable idea since it's sizeof this and that stuff.
> 
> To give you a third example, I've ported this commit over to oe-core:
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=bb12cd9c0a757e6ef696d57923821829f00ace79
> 

I think I wasn't clear.  What I meant was that the siteinfo stuff should be as
close to the recipe as possible.  But that doesn't preclude it from being in a
layer specific siteinfo file.

For the samba example, it makes sense to me if we could put these values local
to the recipe -- this assumes nothing else is known to use those configuration
settings.  Once we have multiple packages using the configuration settings they
move up to the layer site file...  once recipes move into the oe-core layer then
the siteinfo moves with them.

Keeping the information as local to recipe as possible helps with maintenance
IMHO.  There is nothing worse then after a few years looking over a siteinfo
file and seeing 100 entries and having no idea if they are still relevant, or
how someone came to specific results.

--Mark


