Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 5163D7F8AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:35:21 +0000 (UTC)
Received: from [192.168.178.37] (i59F77ED2.versanet.de [89.247.126.210])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 6D7BB11A05AE;
	Fri, 25 Oct 2019 10:35:21 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<20191024153740.GB9707@localhost>
	<b15dc7e214c76e710446b6dd634f669658d5a577.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <a83142c2-9106-f996-d1d9-380cbf8d2b97@herbrechtsmeier.net>
Date: Fri, 25 Oct 2019 10:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b15dc7e214c76e710446b6dd634f669658d5a577.camel@linuxfoundation.org>
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 08:35:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 24.10.19 um 17:59 schrieb Richard Purdie:
> On Thu, 2019-10-24 at 18:37 +0300, Adrian Bunk wrote:
>> On Thu, Oct 24, 2019 at 02:12:43PM +0200, Alexander Kanavin wrote:
>>> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
>>> stefan@herbrechtsmeier.net> wrote:
>>>
>>>> @Richard: What is your opinion about the per recipe dependency?
>>>> Typically OE use one recipe per project. The NPM based solution
>>>> handle a
>>>> project and all dependencies via one recipe.
>>>
>>> I don't think it's at all realistic to stick to the 'one recipe per
>>> component' in node.js world. A typical 'npm install' can pull down
>>> hundreds, or over a thousand dependencies, it's not feasible to
>>> have a
>>> recipe for each.
>>
>> Debian has for the perl/python/node/go/rust/haskell ecosystems
>> one recipe per component, with ~ 1k recipes each.
> 
> I think we'll have to end up having a smaller number of recipes which
> generate multiple packages. That gives a reasonable parsing time at the
> expense of having to pre-generate some of the recipe, a bit like the
> core perl and python recipes work today. The exact split will depend on
> the ecosystems and the "blocks" people tend to build in as its a
> compromise between building too much and parsing time.

How should this work? Node.js consist of multiple independent packages 
and every package define its own dependencies. Thereby the dependencies 
is defined with a version range which often reference a single version.

Regards
   Stefan

