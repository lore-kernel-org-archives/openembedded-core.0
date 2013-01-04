Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tr9eH-00026X-8F
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 16:57:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2013 07:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,411,1355126400"; d="scan'208";a="242089799"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2013 07:42:26 -0800
Message-ID: <50E6F9D8.9090306@intel.com>
Date: Fri, 04 Jan 2013 17:48:40 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D8FDBE.4030203@linux.intel.com> <50E53E76.1080801@intel.com>
	<50E5BE7E.6040201@linux.intel.com> <50E6F919.5070105@intel.com>
In-Reply-To: <50E6F919.5070105@intel.com>
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Fri, 04 Jan 2013 15:57:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/04/2013 05:45 PM, Radu Moisan wrote:
>
> On 01/03/2013 07:23 PM, Saul Wold wrote:
>> On 01/03/2013 12:16 AM, Radu Moisan wrote:
>>>
>>> On 12/25/2012 03:13 AM, Saul Wold wrote:
>>>>
>>>> Please be sure to build this with the INCOMPATIBLE_LICENSE = "GPLv3"
>>>> settig, I saw the following issues on the Autobuilder.
>>>>
>>>
>>> I've rebuilt systemd without xz dependency and now I can build
>>> core-image-minimal with INCOMPATIBLE_LICENSE = "GPLv3", however
>>> core-image-sato would not build. Do we want sato to build with GPLv3
>>> incompatibility flag set? I couldn't build sato this way on master
>>> either, but I didn't try a clean build so I'm not 100% sure about that.
>>>
>> Sato will not build with non-GPLv3. The other image that can build 
>> non-GPLv3 is core-image-basic, it pulls in much more LSB full 
>> commands, non-busybox.
>>
> I tried to build core-image-basic with incompatible license flag set 
> to GPLv3. It crashes in bash (3.2.48) complaining about undefined 
> reference to `xopen' and 'xread'. I tried to dig a little bit into 
> this but got nowhere. There are no references in code for xopen & 
> xread. I don't understand why the linker is looking for these 
> functions while in the code open & read are called.
>
Forgot to mention that this is happening also on master branch.

Radu


