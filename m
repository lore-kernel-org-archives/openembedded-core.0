Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1479462110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:31:03 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 25426F811F4; Thu, 23 May 2013 17:31:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 718B2F811F2;
	Thu, 23 May 2013 17:31:02 -0600 (MDT)
Message-ID: <519EA6BC.3050102@mlbassoc.com>
Date: Thu, 23 May 2013 17:31:08 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <519E359B.2010203@mlbassoc.com> <1369349549.14887.47.camel@ted>
In-Reply-To: <1369349549.14887.47.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Shortened git hashes causing pain
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
X-List-Received-Date: Thu, 23 May 2013 23:31:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-23 16:52, Richard Purdie wrote:
> On Thu, 2013-05-23 at 09:28 -0600, Gary Thomas wrote:
>> The shortening of the git hashes in this commit
>>     commit 77fc40a0f843e2488b356d90b64ef436c11c9973
>>     Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>     Date:   Sun May 19 13:21:55 2013 +0300
>>       bitbake: fetch2: Shorten long srcrevs
>> is causing some problems.
>>
>> I have a simple .bbappend for gtk-sato-engine (attached) which
>> just applies a one-line patch.  When I build this recipe, I
>> get two different work trees (this is from scratch):
>> $ ls -l tmp/work/cobra4430p82-amltd-linux-gnueabi/gtk-sato-engine
>> total 8
>> drwxrwxr-x  3 gthomas gthomas 4096 May 23 09:12 0.3.3+gitAUTOINC+4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc-r0
>> drwxrwxr-x 11 gthomas gthomas 4096 May 23 09:13 0.3.3+gitAUTOINC+4740ad8d53-r0
>>
>> Note: it doesn't seem to happen for the virgin gtk-sato-engine
>> recipe, only when my patch is applied.
>
> Try moving the cache directory in tmp/ out the way. I suspect some kind
> of caching issue since there should not be two work directories. What is
> the contents of each?

Wow, that caused a boatload of other packages to be rebuilt, including
qemu-native, which took forever :-(

This did remove the problem - there is now only the build tree with
the short hash name.  Sadly, it's also now forcing me to basically
rebuild everything to get back to being able to build my image, just
what I didn't want to happen.

Oh well, once this finished I'm sure all will be fine again.  At least
my pain may help others that might experience this, although I don't
know how many folks do very long term development/builds in a single
tree.  This one has been one of my main projects and was started in
early March with more than 500 builds (entries in tmp/log/cooker)!

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

