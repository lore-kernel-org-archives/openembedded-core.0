Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 9C56473217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:00:00 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 683BAF811E0; Thu, 23 Jul 2015 17:00:00 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B3A33F811D7;
	Thu, 23 Jul 2015 16:59:59 -0600 (MDT)
Message-ID: <55B171F3.4010009@mlbassoc.com>
Date: Thu, 23 Jul 2015 17:00:03 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
	<55B16CF0.80405@mlbassoc.com>
	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>
In-Reply-To: <CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 23:00:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-23 16:42, Burton, Ross wrote:
>
> On 23 July 2015 at 23:38, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Well for me, the configure script ended up chosing python3,
>     even when I used 'pythonnative' (i.e. python2) in the recipe.
>     I could not get it to build any other way.
>
>     Since python3-native will most likely already be built, what's
>     the harm in doing it this way?
>
>
> Why will it be build?  I certainly don't have a python3 build here.

I almost always seem to end up with it being built...

>
> Inheriting pythonnative is also the wrong thing to do - the pythonnative classes are solely for when you need to run Python and use non-standard classes that you've already built
> natively.  If you just want to run the host Python, let it find the host python.
>
> Why was the configure script choosing python3 on your host the wrong thing to do?

It seems that my host python3 is broken and doesn't have a working 'argparse'
   $ python3
   Python 3.1.2 (r312:79147, Aug 23 2010, 05:17:13)
   [GCC 4.4.4 20100630 (Red Hat 4.4.4-10)] on linux2
   Type "help", "copyright", "credits" or "license" for more information.
   >>> import argparse
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   ImportError: No module named argparse
It's an old host (Fedora 13) that I am unable to upgrade, but it still
works quite well.  I get around most of the Yocto/bitbake worries by
using a Yocto-built meta-toolchain to fill in the blanks (correct make,
python2, etc), but python3 is not part of the meta-toolchain :-(

If this is not the correct way to get libepoxy to build, fair enough,
I'll figure out how to make my host "functional".

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

