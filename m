Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S38eM-0002cp-JB
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 17:14:38 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 49D9DF812EF; Thu,  1 Mar 2012 09:06:10 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E4674F812EE;
	Thu,  1 Mar 2012 09:06:08 -0700 (MST)
Message-ID: <4F4F9E70.7010807@mlbassoc.com>
Date: Thu, 01 Mar 2012 09:06:08 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted> <4F4F918B.4010404@mlbassoc.com>
	<4F4F9552.8040107@mlbassoc.com> <1330616672.31767.23.camel@ted>
	<4F4F9B21.3000407@mlbassoc.com>
	<CAP9ODKqmYL2QPDJk8AdDOxoL+EZ+B4y7OwLbsZ-+NDRLjxz3+Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqmYL2QPDJk8AdDOxoL+EZ+B4y7OwLbsZ-+NDRLjxz3+Q@mail.gmail.com>
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 16:14:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-01 09:04, Otavio Salvador wrote:
> On Thu, Mar 1, 2012 at 12:52, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 2012-03-01 08:44, Richard Purdie wrote:
>>> Is this going to cause us a problem in real world usage? I'd hope in the
>>> general case we use standard formatting?
>>>
>>> I have to admit I'm getting more than a little frustrated with what
>>> seems like a continual set of changes bouncing this format around in
>>> different directions :(.
>>
>> I agree and I'm sorry I missed this in my first change - I was just
>> trying to make the time stamps be consistent.
>>
>> As far as I can recall (which is a really long time), 'date' has always
>> wanted the format MMDDHHmm[YYYY], so I think that's what we should expect.
>> That format doesn't compare easily which is why the timestamp was changed
>> (not by me) to a more ISO standard YYYYMMDDHHmm.  If busybox has 64-bit
>> math enabled, then this can be compared with no problems, it just has
>> to be munged into the format 'date' wants.
>
> So we can have compat and 64-bit math and have it properly behaving?

Yes, I believe so.  I'll work up the patch and test it now.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


