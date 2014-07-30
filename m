Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 22F7970884
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:57:38 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 749BAF811FA; Wed, 30 Jul 2014 11:57:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 12E2AF811F9;
	Wed, 30 Jul 2014 11:57:37 -0600 (MDT)
Message-ID: <53D93220.4030901@mlbassoc.com>
Date: Wed, 30 Jul 2014 11:57:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53D91F3C.3050107@mlbassoc.com>
	<CAMKF1srm+0up4YsN2u6UQrmO948NHqk1YZAwhx_kaX22e-h=zQ@mail.gmail.com>
In-Reply-To: <CAMKF1srm+0up4YsN2u6UQrmO948NHqk1YZAwhx_kaX22e-h=zQ@mail.gmail.com>
Subject: Re: freetype-config broken?
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
X-List-Received-Date: Wed, 30 Jul 2014 17:57:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-30 11:32, Khem Raj wrote:
> On Wed, Jul 30, 2014 at 9:37 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> The behaviour of 'freetype-config' (from freetype-native) has
>> changed since this commit:
>>    commit 3476a49b10093c58b2f89e3d9a8527224f1bd7f6
>>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>    Date:   Thu May 22 10:59:33 2014 +0100
>>      binconfig-disabled: Add class and use
>>
>> This is breaking my build of mplayer which uses freetype-config
>> to determine how to use the freetype library (in ./configure)
>>
>> The comment in the commit indicates that this is an improvement
>> and the path forward, but I don't see how to change the recipes
>> (and scripts, etc) that rely on this functionality to work in
>> this new mode.
>>
>> Any suggestions?
>>
> add AM_INIT_AUTOMAKE([foreign]) to the configure.in or configure.ac

I don't see how your suggestion helps.  This package (mplayer) doesn't
use autotools - it has a hand coded configure script, so there is
no configure.{in,ac}

I also looked through the logs and didn't see any recipe which uses
a package that is now marked as binconfig-disabled as to how it
solves the problem.  A pointer/example would really be appreciated.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

