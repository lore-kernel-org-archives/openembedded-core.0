Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7DC70246
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 14:02:43 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 1D2D4664B8;
	Sun,  3 Aug 2014 16:02:44 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP;
	Sun,  3 Aug 2014 16:02:44 +0200 (CEST)
Message-ID: <53DE4103.5090906@topic.nl>
Date: Sun, 03 Aug 2014 16:02:43 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
References: <53DE3841.2000305@topic.nl> <53DE3E5C.5020303@dynamicdevices.co.uk>
In-Reply-To: <53DE3E5C.5020303@dynamicdevices.co.uk>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Cc: OE <openembedded-core@lists.openembedded.org>
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 14:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2014 03:51 PM, Alex J Lennon wrote:
>
> On 03/08/2014 14:25, Mike Looijmans wrote:
>> I'm getting lots of warnings like this:
>>
>> """
>> WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends
>> on wireless-tools but its not a build dependency? [build-deps]
>> """
>>
>> What does it actually mean? What does it want me to provide here?
>>
>> The message in itself is correct. The package only has a runtime
>> dependency. It does not require the wireless-tools package to be built
>> or otherwise present on the build system. But what is the QA issue
>> here and how do I get rid of the message?
>>
>
> Surely if package B has a non-optional runtime dependency on package A
> then package A must be built and present on the target ?

Yes, I agree.

But that does not help me understand the message. What does it want me 
to do here?

The message seems to suggest that package A must be in the DEPENDS list 
for package B, which is definitely not the case here. Package B contains 
some scripts and config files, and has an architecture of "all" and can 
be built even way before the compiler and C libraries are present on the 
build host. Package A however needs lots of other things, and will 
likely start building much later than that.


-- 
Mike Looijmans

