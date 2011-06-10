Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QV2qP-0006bV-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:37:53 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QV2n9-00068O-Qb from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 07:34:31 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 10 Jun 2011 07:30:13 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 10 Jun 2011 07:34:30 -0700
Message-ID: <4DF22B70.2090002@mentor.com>
Date: Fri, 10 Jun 2011 07:34:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DE850E8.2050701@windriver.com>
	<4DF14BE9.7080704@intel.com>	<4DF15C93.7090606@mentor.com>
	<4DF18783.6050303@gmail.com>
In-Reply-To: <4DF18783.6050303@gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 Jun 2011 14:30:13.0594 (UTC)
	FILETIME=[E906EBA0:01CC277A]
Subject: Re: [Yocto] The design document for ccache-native
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
X-List-Received-Date: Fri, 10 Jun 2011 14:37:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/09/2011 07:54 PM, Khem Raj wrote:
> On 06/09/2011 04:51 PM, Tom Rini wrote:
>> On 06/09/2011 03:40 PM, Saul Wold wrote:
>>> On 06/02/2011 08:11 PM, wenzong fan wrote:
>>>> Hi Folks,
>>>>
>>>> Please help me to review the design document for ccache-native, and
>>>> I also have two questions about it, any answers or suggestions are
>>>> appreciated.
>>>>
>>>> * Feature name: ccache-native
>>>>      Priority: P3; M2
>>>>      Owner: Wenzong Fan
>>>>      Summary: Integrate ccache-native to yocto
>>>>
>>>> * Description:
>>>> Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
>>>> included by poky/yocto, just add it as a native tool.
>>>>
>>>> * Usage:
>>>> Build ccache as a native tool by default and enable it for speeding
>>>> target packages build.
>>>>
>>>> * Implementation:
>>>> 1) Copy bb file from OE upstream to:
>>>>        meta/recipes-devtools/ccache/
>>>>
>>>> 2) Update bb file to get the latest ccache_3.1.5 and split the single
>>>> bb file to:
>>>>        'ccache_3.1.5.bb', 'ccache.inc'
>>>>
>>>> 3) Enable ccache in the native tools building.
>>>>
>>> You will need to have it be a dependency pretty early on in the build.
>>> Additionally, this is a bit a new part to this task, we want to have the
>>> default CCACHE_DIR for the build default to a directory in TMPDIR
>>> instead of the user's home directory.  This will mean setting an
>>> environment variable somewhere early also.
>>
>> Can we instead veto ccache and remove it from the bitbake docs?  I can't
>> count the number of times I've run into what I can only imagine are
>> ccache conflicts to explain why a random build failure with ccache in
>> use.
> 
> It works on some hosts somewhat reliably and is unpredictable on some as
> you say. I think keeping it optional is probably the right thing but
> making it default may not be a good thing.

I'm pretty sure it's not reliable so much as lucky, but shoving the
cache somewhere else and making it per-recipe makes me less worried.

-- 
Tom Rini
Mentor Graphics Corporation


