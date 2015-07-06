Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2F95075D62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 11:35:11 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <5596A293.8020606@communistcode.co.uk>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <559A67FE.4050000@communistcode.co.uk>
Date: Mon, 6 Jul 2015 12:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <5596A293.8020606@communistcode.co.uk>
Subject: Re: SDK extract errors on master
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
X-List-Received-Date: Mon, 06 Jul 2015 11:35:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/15 15:56, Jack Mitchell wrote:
> Built an SDK today on 7eb0abc5f4d971d9a511c93cfb2eb52b72e6f228 and 
> when I tried to install it I got the following error:
>
> Setting it up...ls: cannot access 
> /home/jack/Work/build/openembedded/sdk/1/x86_64/environment-setup-*: 
> No such file or directory
>
> I have been messing about with the SDK install path and at one point 
> it did spew out a load of files installed vs shipped warnings I assume 
> due to a change of path and it getting upset about it, but since then 
> I deleted the tmp directory and rebuilt a new SDK without warnings. 
> However, both acted in the same way.
>
> The SDK then sits without installing, seemingly stuck on: grep 
> OECORE_NATIVE_SYSROOT, which I assume means it's looking for the 
> (non-existant) environment file.
>
> Any clues? Is this broken for anyone else?
>
> Cheers,
> Jack.

Ok, I figured out how I broke it; I used a relative path in SDKPATH. i.e.

SDKPATH=/path/to/sdk/../rel-sdk

So, first off; should this be supported? Secondly, the use-case I was 
trying to get at was to position an SDK relative to the build dir, i.e.

SDKPATH=${TOPDIR}/../sdk

Is there a better way to do this. I guess this problem could be solved 
somewhere in an SDK class by changing the relative path to an absolute 
path. Ideas?

Cheers,
Jack.

