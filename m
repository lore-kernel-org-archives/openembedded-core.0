Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pvakn-0000JF-CJ
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:33:33 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PvajN-0001av-2f from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 11:32:05 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 4 Mar 2011 11:32:04 -0800
Received: from [172.30.80.235] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Fri, 4 Mar 2011 11:32:04 -0800
Message-ID: <4D713E31.30501@mentor.com>
Date: Fri, 4 Mar 2011 12:32:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>	<4D71175D.4050307@gmail.com>	<4D71192E.3050706@windriver.com>	<B4A135D2-3DE3-4432-9C06-ADAE52BE1209@dominion.thruhere.net>	<4D713485.90507@mentor.com>
	<4D713714.8030706@windriver.com>
In-Reply-To: <4D713714.8030706@windriver.com>
X-OriginalArrivalTime: 04 Mar 2011 19:32:04.0884 (UTC)
	FILETIME=[D7B6F540:01CBDAA2]
Subject: Re: Gst-plugin dependencies
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
X-List-Received-Date: Fri, 04 Mar 2011 19:33:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2011 12:01 PM, Mark Hatle wrote:
> On 3/4/11 12:50 PM, Tom Rini wrote:
>> On 03/04/2011 10:12 AM, Koen Kooi wrote:
>>>
>>> Op 4 mrt 2011, om 17:54 heeft Mark Hatle het volgende geschreven:
>>>
>>>> On 3/4/11 10:46 AM, Khem Raj wrote:
>>>>> On 3/4/2011 7:58 AM, Koen Kooi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> The current gst-plguin-<foo>    in oe-core is a bit anemic and the ones in OE are really full featured. How do we want to handle this going forward? I'm a big fan of shifting the pain to buildtime so people can install any plugin they want at runtime instead of needing to rebuild it.
>>>>>> At TI we have cut-down versions of the recipes to save buildtime[1], but it's a pain to maintain those and keep them up to date. It would be nice to come with a way to say you want full featured gstreamer or not. With my angstrom hat on, I would like the full feature set :)
>>>>>>
>>>>>
>>>>> May be controlling it with distro features
>>>>
>>>> Due to the licensing issues in the gst-plugins..  I'd be inclined to say they're
>>>> out of the core myself.  Move it to the distro specific layers.
>>>
>>> Even outside of licensing issues with things like MP3, I would like to have some kind of framework in OE (-core) for gst-plugins that layers can extend to their liking. Having dealt with the recipes over the years, too many things change between versions. It takes someone familiar with gst to maintain those recipes, and there aren't a lot of such people in OE :(
>>
>> I agree with Koen, gstreamer is pretty core to doing a lot of stuff in
>> real world applications.  We just need a way to handle in a good way the
>> use flag type requirements this brings up.
>>
>> Is the TSC ready to talk about USE flags again yet?  I think that could
>> help with the Angstrom hat vs TI hat problem Koen describes too, at
>> least in good part.
>>
>
> In some ways I think it's a bit more fundamental then that.
>
> I think we need to have a discussion on what's a "distribution" feature, what's
> a "FEATURE" and whats a "USE_FLAG" or other things.. and define some of these terms.
>
> I know I get confused as to the purpose of these various names and what they are
> used for already -- (I'm not even sure everyone is talking about the same thing
> when they say these things)
>
> Let me suggest some:
>
> A "distribution" feature is one that affects an entire distribution and how it's
> assembled.  Something like "LSB", "PAM", or "SeLinux" support is a distribution
> feature to me.
>
> A "feature" is something specific to a package or subsystem within a
> distribution.  It will enable or disable an optional component that is local to
> that area.  (This allows most of the components, not affected by the feature, to
> be reused.)

Yes, talking about this will also need to agree on terminology for what 
should be a distribution feature, a machine feature, a "feature feature" 
and when they intersect, and what's still outside of that.  But I do 
agree with what you've said so far.

-- 
Tom Rini
Mentor Graphics Corporation


