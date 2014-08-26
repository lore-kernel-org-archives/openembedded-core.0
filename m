Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 7202E710E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 22:17:50 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1FDA1F811E3; Tue, 26 Aug 2014 16:17:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 15B42F811DE;
	Tue, 26 Aug 2014 16:17:51 -0600 (MDT)
Message-ID: <53FD079C.8000205@mlbassoc.com>
Date: Tue, 26 Aug 2014 16:18:04 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53FCE823.9050800@mlbassoc.com> <20140826214403.GA20524@jama>
In-Reply-To: <20140826214403.GA20524@jama>
Subject: Re: own-mirrors broken
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
X-List-Received-Date: Tue, 26 Aug 2014 22:17:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-26 15:44, Martin Jansa wrote:
> On Tue, Aug 26, 2014 at 02:03:47PM -0600, Gary Thomas wrote:
>> This commit breaks "own-mirrors"
>>
>> commit 0ae7b58060f1ee7914dd45d462e48d4b8a3751ad  (Poky/Yocto)
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Fri Aug 22 01:31:27 2014 -0700
>>
>>       sanity.bbclass: check the format of MIRRORS
>>
>> Since this change, use of "own-mirrors" produces this error:
>
> It was already reported before:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/096230.html
>
> Luckily kergoth already sent fixes for it.
>

It would be really nice if it got merged quickly...

>> WARNING: Invalid PREMIRRORS: cvs://.*/.*     file:///local/poky-cutting-edge/sources/
>> svn://.*/.*     file:///local/poky-cutting-edge/sources/
>> git://.*/.*     file:///local/poky-cutting-edge/sources/
>> gitsm://.*/.*   file:///local/poky-cutting-edge/sources/
>> hg://.*/.*      file:///local/poky-cutting-edge/sources/
>> bzr://.*/.*     file:///local/poky-cutting-edge/sources/
>> svk://.*/.*     file:///local/poky-cutting-edge/sources/
>> p4://.*/.*      file:///local/poky-cutting-edge/sources/
>> osc://.*/.*     file:///local/poky-cutting-edge/sources/
>> https?$://.*/.* file:///local/poky-cutting-edge/sources/
>> ftp://.*/.*     file:///local/poky-cutting-edge/sources/, should be 2 members, but found 22.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

