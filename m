Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4BC73217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:15:34 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BDF6FF811DE; Thu, 23 Jul 2015 17:15:34 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 29973F811D7;
	Thu, 23 Jul 2015 17:15:34 -0600 (MDT)
Message-ID: <55B17599.1000608@mlbassoc.com>
Date: Thu, 23 Jul 2015 17:15:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>	
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>	
	<55B16CF0.80405@mlbassoc.com>	
	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>	
	<55B171F3.4010009@mlbassoc.com>
	<1437692801.821.140.camel@linuxfoundation.org>
In-Reply-To: <1437692801.821.140.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Thu, 23 Jul 2015 23:15:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-23 17:06, Richard Purdie wrote:
> On Thu, 2015-07-23 at 17:00 -0600, Gary Thomas wrote:
>> It's an old host (Fedora 13) that I am unable to upgrade, but it still
>> works quite well.  I get around most of the Yocto/bitbake worries by
>> using a Yocto-built meta-toolchain to fill in the blanks (correct make,
>> python2, etc), but python3 is not part of the meta-toolchain :-(
>
> You could likely build a customised meta-toolchain which did contain
> python3 though?

Do you know how I would make that happen?  For me, meta-toolchain is
a black box - I know very little of the internals.

Question about policy: it seems that a good many "native" packages
are built, many just to "level the playing field".   I just checked
and one of my average builds has 148 native packages sitting there.
For example, why build bison-native when my host's bison is even the
same vintage and hence just as adequate?  Why then, draw the line
over python3 in this one recipe?  (Just asking, I'll figure out how
to fix this anyway)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

