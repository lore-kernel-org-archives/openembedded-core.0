Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhBQ4-0001wR-Kj
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 04:13:14 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhBKU-0002Nw-SS from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 19:07:06 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 19:07:06 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 13 Jul 2011 19:07:05 -0700
Message-ID: <4E1E4F46.8030101@mentor.com>
Date: Wed, 13 Jul 2011 19:07:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1E18AA.2050808@mentor.com>
	<4E1E447A.2060703@windriver.com>	<4E1E49FD.3020500@mentor.com>
	<4E1E4E08.8040802@windriver.com>
In-Reply-To: <4E1E4E08.8040802@windriver.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 14 Jul 2011 02:07:06.0691 (UTC)
	FILETIME=[BB34F130:01CC41CA]
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
X-List-Received-Date: Thu, 14 Jul 2011 02:13:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/13/2011 07:01 PM, Mark Hatle wrote:
> On 7/13/11 8:44 PM, Tom Rini wrote:
>> On 07/13/2011 06:20 PM, Mark Hatle wrote:
>>> On 7/13/11 5:14 PM, Tom Rini wrote:
>>>> Hey all,
>>>>
>>>> Do we have an opinion on siteinfo for recipes that oe-core lacks?  I
>>>> have two easy examples:
>>>> - mono: neither meta-oe nor oe-core have a recipe, we have siteinfo
>>>> stuff specific to it.  Ignore it? drop it?  update it with what meta-oe has?
>>>> - postgresql: meta-oe has it, oe-core lacks it.  Keep in meta-oe only?
>>>>
>>>
>>> For both of them, I'd keep them as local to the recipe as possible.. no recipe,
>>> no siteinfo listed.
>>
>> Well, I think we're missing the forest for the trees.  But that's not
>> really a workable idea since it's sizeof this and that stuff.
>>
>> To give you a third example, I've ported this commit over to oe-core:
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=bb12cd9c0a757e6ef696d57923821829f00ace79
>>
> 
> I think I wasn't clear.  What I meant was that the siteinfo stuff should be as
> close to the recipe as possible.  But that doesn't preclude it from being in a
> layer specific siteinfo file.

When you say close do you mean layer/site/ or
layer/recipes-foo/app/something/ ?  I saw oe-core had some sort of hook
for site files in yet another place but I also couldn't find anything
using it (in addition to the sitecache stuff).

> Keeping the information as local to recipe as possible helps with maintenance
> IMHO.  There is nothing worse then after a few years looking over a siteinfo
> file and seeing 100 entries and having no idea if they are still relevant, or
> how someone came to specific results.

Agreed, I'm toying with tossing all of the files out and seeing what's
needed now (since also there's useless stuff, and probably a few more
bugs lurking).

-- 
Tom Rini
Mentor Graphics Corporation


