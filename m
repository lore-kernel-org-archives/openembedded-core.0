Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF7861C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 13:24:06 +0000 (UTC)
Received: from [127.0.0.1] (port=56018 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jCNok-004DR1-Gk; Thu, 12 Mar 2020 09:24:07 -0400
Received: from [66.129.241.14] ([66.129.241.14]) by crashcourse.ca (Horde
	Framework) with HTTPS; Thu, 12 Mar 2020 09:24:06 -0400
Date: Thu, 12 Mar 2020 09:24:06 -0400
Message-ID: <20200312092406.Horde.dKGE_j40Nb1uLkJiJ77C4ZG@crashcourse.ca>
From: rpjday@crashcourse.ca
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
	<CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
In-Reply-To: <CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: simplest command to display which layers are applying the same patch?
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
X-List-Received-Date: Thu, 12 Mar 2020 13:24:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline

Ah, I was just playing with a build of my own (which works so I can't
replicate the error), but if I "bitbake -e openssl", then I can obviously
see all the operations that go into constructing the SRC_URI, along with
the layers that contribute to that expansion, so I am assuming that,
even if more than one layer tries to apply the same patch, all those
SRC_URI values will be properly appended, in the sense of a duplicate
patch will occur twice in the final value of SRC_URI, yes?

And only when do_patch() kicks in will the duplicate patch generate a
patch error, correct? That seems pretty straightforward, as long as
I'm understanding the process here.

Thanks again.

rday

Quoting Alexander Kanavin <alex.kanavin@gmail.com>:

> I think 'bitbake -e recipe', and then searching for SRC_URI in it should
> show which layer applies which patch.
>
> Alex
>
> On Thu, 12 Mar 2020 at 13:56, <rpjday@crashcourse.ca> wrote:
>
>>    just got from colleague a miniscule snippet of build output:
>>
>> ERROR: openssl-1.0.2u-r0 do_patch: Command Error: 'quilt --quiltrc ...
>> snip ...
>> Output: Patch Use-SHA256-not-MD5-as-default-digest.patch is already
>> applied; check your series file
>>
>> the problem seems obvious ... more than one layer being pulled
>> into the build is trying to apply the same patch to that version
>> of openssl.
>>
>> i don't have access to that build system, but i'm not surprised
>> as it appears that at least three layers (oe-core, vendor, and
>> wind river linux fixes layer) all supply that very patch.
>>
>> what is the simplest command from way back in "morty" that
>> could display something as clear as, "layer A already applied
>> this patch, now layer B is trying to apply it as well?"
>>
>> if it's in the log file, i can just point the person at that,
>> short of getting access to the build system and finding it
>> myself.  thank you kindly.
>>
>> rday
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>




