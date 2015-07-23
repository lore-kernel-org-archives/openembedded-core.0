Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 9142373CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:38:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8C92AF811D7; Thu, 23 Jul 2015 16:38:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id CBCD1F811D7;
	Thu, 23 Jul 2015 16:38:36 -0600 (MDT)
Message-ID: <55B16CF0.80405@mlbassoc.com>
Date: Thu, 23 Jul 2015 16:38:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 22:38:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-23 16:33, Burton, Ross wrote:
>
> On 23 July 2015 at 01:22, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     This recipe needs python3.  This patch arranges to use the bitbake-built
>     version, not the host version (which may be missing or not work...)
>
>
> Needs is a strong word.  The configure script does this:
>
> AC_CHECK_PROGS([PYTHON], [python3 python2 python])
>
>
> What's actually happening as a patch to simply remove python3 from that list will also solve most problems - we obviously depend on a fully working host python 2.

Well for me, the configure script ended up chosing python3,
even when I used 'pythonnative' (i.e. python2) in the recipe.
I could not get it to build any other way.

Since python3-native will most likely already be built, what's
the harm in doing it this way?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

