Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE1636D2B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:30:32 +0000 (UTC)
Message-ID: <526E9F31.2040305@communistcode.co.uk>
Date: Mon, 28 Oct 2013 17:30:25 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<5266E3C2.6040502@linux.intel.com>
In-Reply-To: <5266E3C2.6040502@linux.intel.com>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2013 17:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/13 21:44, Saul Wold wrote:
> On 10/21/2013 01:56 AM, Jack Mitchell wrote:
>> From: Jack Mitchell <jmitchell@cbnl.com>
>>
>> libjson is now known as json-c, it keeps support for the old
>> libjson namespace so it shouldn't break anything. Built without
>> parallel make as it would fail when it tries to link to link back
>> to itself, which is odd, but the official word is: don't build in
>> parallel.
>>
>
> Jack,
>
> Not sure what's going on yet, but I found a configure failure, see the
> attached log file.
>
> Patch review is going to be a little slower this week as RP and a
> bunch of the Yocto Project community are at Yocto Project Dev Day and
> ELC-E the rest of this week.
>
> Sau!
>

I have rebuilt this package multiple times now and have still not
managed to break it. I believe it will just be a dirty build directory,
but that shouldn't be an excuse for it not building.

Does anyone have any suggestions on how to overcome this?


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


