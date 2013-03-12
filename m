Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UFQrl-0006kS-KT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:11:51 +0100
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 19FDA1840E0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 15:55:12 +0100 (CET)
Message-ID: <513F41CE.2060808@herbrechtsmeier.net>
Date: Tue, 12 Mar 2013 15:55:10 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
	<513E6C46.2010909@linux.intel.com>
	<513F0149.9080708@herbrechtsmeier.net>
	<8517DA88-71D7-462E-B068-163831AB5D3C@dominion.thruhere.net>
	<513F187B.3050207@herbrechtsmeier.net>
In-Reply-To: <513F187B.3050207@herbrechtsmeier.net>
Subject: Re: [PATCH] boost: Split out bjam build tool and add real native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 15:11:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 12.03.2013 12:58, schrieb Stefan Herbrechtsmeier:
> Am 12.03.2013 11:48, schrieb Koen Kooi:
>> Op 12 mrt. 2013, om 11:19 heeft Stefan Herbrechtsmeier 
>> <stefan@herbrechtsmeier.net> het volgende geschreven:
>>
>>> Am 12.03.2013 00:44, schrieb Saul Wold:
>>>> On 03/07/2013 08:37 AM, Stefan Herbrechtsmeier wrote:
>>>>> The current boost recipe only creates the bjam build tool during
>>>>> a native run and thereby is not usable for other native programs
>>>>> that depend on a boost library. Split out the build tool into its
>>>>> own bjam recipe and add real native support to the boost recipe.
>>>>> This allows recipes to depend on native boost libraries without
>>>>> increase of the build time for other use cases.
>>>>>
>>>>> Native compilation of bzip2 isn't working and therefore disabled.
>>>>>
>>>>> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
>>>>> ---
>>>>>   meta/recipes-support/boost/bjam_1.53.0.bb   |   21 +++++++++++
>>>>>   meta/recipes-support/boost/boost-1.53.0.inc |   21 +++++++++++
>>>>>   meta/recipes-support/boost/boost.inc        |   49 
>>>>> ++-------------------------
>>>>>   meta/recipes-support/boost/boost_1.53.0.bb  |    6 +--
>>>>>   4 files changed, 47 insertions(+), 50 deletions(-)
>>>>>   create mode 100644 meta/recipes-support/boost/bjam_1.53.0.bb
>>>>>   create mode 100644 meta/recipes-support/boost/boost-1.53.0.inc
>>>>>
>>>> This change seems to have caused a failure on my test build:
>>> Sorry, I missed the no native case. I rename bjam to bjam-native and 
>>> send a new patch. Bjam make no sense on the target as it is only 
>>> used for compiling.
>> And what if you need bjam to compile something on the target?
>
> Then you need to add cross compile support to bjam which is outside of 
> the scope of this patch.
I have realised that boost always compile bjam during do_boostconfig. I 
have rework the recipe to use this bjam version as this simplify the 
recipe and the update path.



