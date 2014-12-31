Return-Path: <mike.looijmans@topic.nl>
Received: from smtp09.online.nl (smtp09.online.nl [194.134.42.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9D1601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:13:34 +0000 (UTC)
Received: from smtp09.online.nl (localhost [127.0.0.1])
	by smtp09.online.nl (Postfix) with ESMTP id E48721E6C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 20:13:32 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp09.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 20:13:32 +0100 (CET)
Message-ID: <54A44ADC.3010000@topic.nl>
Date: Wed, 31 Dec 2014 20:13:32 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54A2C3B2.9010006@topic.nl>
	<20141230175915.GB18678@crash.betafive.co.uk>
In-Reply-To: <20141230175915.GB18678@crash.betafive.co.uk>
X-Online-Scanned: by Cloudmark authority (on smtp09.online.nl)
Subject: Re: How do I change the "Architecture" of a package?
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
X-List-Received-Date: Wed, 31 Dec 2014 19:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 30-12-2014 18:59, Paul Barker wrote:
> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
>> What if the architecture of a package was accidentally left at its
>> default, but it should have been "all" for example?
>>
>> Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the
>> recipe is not enough. You get stuck with a "more specific" older
>> version, so that no device wants to upgrade to the newer version
>> that's "all" architecture compatible.
>>
>
> What package manager are you using on the device? If you're using opkg it should
> prioritise by version not arch unless the command line option
> '--prefer-arch-to-version' is passed. If you're using opkg and it's not doing
> that, let me know and I'll look into it when I get chance to.

It's opkg.

But on closer inspection I noticed that the "git" version is also 
mysteriously reset to 0, so that the package also gets a lower version 
number instead of a higher one. Seems to be the PR server borking things 
again or so, I'll have to investigate that next year...

>> Only way to fix this was to manually remove the old version from the
>> feeds and also manually remove it from the device, and then
>> reinstall it. This works for me personally, but what if I want to
>> apply this to about a million devices that are already in the field?
>>
>> What can I do to get them to upgrade from the (in this case)
>> "mipsel32" to "all" package?
>
> As an absolute hack, you could rename the package and set it to
> replace/conflict/provide the old package name. I think there should be better
> solutions though.

I don't think so, I've never seen one in the wild. I'll send a free 
Linux TV satellite settopbox to whomever provides a solution ;)

