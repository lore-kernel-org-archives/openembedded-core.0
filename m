Return-Path: <mike.looijmans@topic.nl>
Received: from smtp09.online.nl (smtp09.online.nl [194.134.42.54])
	by mail.openembedded.org (Postfix) with ESMTP id A5E40727AB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 10:52:26 +0000 (UTC)
Received: from smtp09.online.nl (localhost [127.0.0.1])
	by smtp09.online.nl (Postfix) with ESMTP id 08ECE1E8BC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 11:52:25 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp09.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 11:52:24 +0100 (CET)
Message-ID: <54A7C9E8.4020808@topic.nl>
Date: Sat, 03 Jan 2015 11:52:24 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54A2C3B2.9010006@topic.nl>	<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl>
In-Reply-To: <54A44ADC.3010000@topic.nl>
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
X-List-Received-Date: Sat, 03 Jan 2015 10:52:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/2014 08:13 PM, Mike Looijmans wrote:
> On 30-12-2014 18:59, Paul Barker wrote:
>> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
>>> What if the architecture of a package was accidentally left at its
>>> default, but it should have been "all" for example?
>>>
>>> Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the
>>> recipe is not enough. You get stuck with a "more specific" older
>>> version, so that no device wants to upgrade to the newer version
>>> that's "all" architecture compatible.
>>>
>>
>> What package manager are you using on the device? If you're using opkg
>> it should
>> prioritise by version not arch unless the command line option
>> '--prefer-arch-to-version' is passed. If you're using opkg and it's
>> not doing
>> that, let me know and I'll look into it when I get chance to.
>
> It's opkg.
>
> But on closer inspection I noticed that the "git" version is also
> mysteriously reset to 0, so that the package also gets a lower version
> number instead of a higher one. Seems to be the PR server borking things
> again or so, I'll have to investigate that next year...

Well, changing the architecture will always fail because of a bug in the 
PR server. It resets the number to "0" when PACKAGE_ARCH changes, and 
thus breaks the upgrade path.

-- 
Mike Looijmans

