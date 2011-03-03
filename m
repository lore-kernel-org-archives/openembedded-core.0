Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pv9sD-0002lU-G1
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:51:26 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pv9qo-00031s-KW from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 06:49:58 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Mar 2011 06:49:58 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 3 Mar 2011 06:49:57 -0800
Message-ID: <4D6FAA81.1020306@mentor.com>
Date: Thu, 3 Mar 2011 07:49:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4D6E7EB1.5080602@windriver.com>	<1299088802.26736.10715.camel@rex>	<BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>	<1299093521.26736.10877.camel@rex>	<4D6EE7A6.20603@mentor.com>	<A0E1CD11-8650-4AAD-BE14-278241E67042@dominion.thruhere.net>	<1299154222.26736.12921.camel@rex>
	<4D6FA92C.5010507@windriver.com>
In-Reply-To: <4D6FA92C.5010507@windriver.com>
X-OriginalArrivalTime: 03 Mar 2011 14:49:58.0488 (UTC)
	FILETIME=[44622580:01CBD9B2]
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:51:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2011 07:43 AM, Mark Hatle wrote:
> On 3/3/11 6:10 AM, Richard Purdie wrote:
>> I'd really at least like the TSC members to comment on those different
>> pieces. I've already seen Chris comment that "poky-init-build-env"
>> shouldn't be in the core for example. What about the rest of the scripts
>> directory?
>
> I think they should be in oe-core, and specifically labeled as self-contained
> examples for oe-core itself.
>
> There must be a simple way for people to setup the environment and run a build
> so they can test the oe-core itself.  But there should be nothing in the system
> that requires all of the components to exist, if there is, it should be clearly
> documented that it's not an example component.  (Even putting the word "example"
> in the name would be fine with me.  i.e. replacing "poky" with "example".)

I agree.  I'd like to see us provide example scripts for running qemu, 
setting up the build env and so forth.  And I expect that distros will 
still provide their own version as they see fit.

-- 
Tom Rini
Mentor Graphics Corporation


