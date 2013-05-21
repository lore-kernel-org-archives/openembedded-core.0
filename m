Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC2060897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 18:13:36 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 59246F811E8; Tue, 21 May 2013 12:13:36 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BF8D5F811E8;
	Tue, 21 May 2013 12:13:35 -0600 (MDT)
Message-ID: <519BB951.2040502@mlbassoc.com>
Date: Tue, 21 May 2013 12:13:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <51962FFE.3040202@mlbassoc.com> <1369127448.11013.16.camel@ted>
In-Reply-To: <1369127448.11013.16.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
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
X-List-Received-Date: Tue, 21 May 2013 18:13:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-21 03:10, Richard Purdie wrote:
> On Fri, 2013-05-17 at 07:26 -0600, Gary Thomas wrote:
>> I just tried to run Poky/Yocto on a fresh Ubuntu 12.04 system.  I knew there would
>> be missing bits and have seen the "sanity" messages in the past, so I thought I'd
>> just carry on.  Today's experience was not pretty and would it not for my experience
>> with this, I would have been very perplexed...
>
> There are two issues there, firstly the scripts/bitbake binary is doing
> a really bad job, secondly, one of the improved debugging patches I
> added to bitbake, regressed things in this case.
>
> I posted a patch to bitbake last night, I've just posted a fix for
> scripts/bitbake now. These two together should improve this. I agree
> that particular error would create a poor first impression, thanks for
> reporting it.

With this patch, no 'git' and a fresh build I still get this:

Traceback (most recent call last):
   File "/home/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
     ret = main()
   File "/home/local/poky-multi/bitbake/bin/bitbake", line 260, in main
     event = server.event_queue.get(block=False)
   File "/usr/lib/python2.6/multiprocessing/queues.py", line 104, in get
     raise Empty
Empty
Pseudo is not present but is required, building this first before the main build
Traceback (most recent call last):
   File "/home/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
     ret = main()
   File "/home/local/poky-multi/bitbake/bin/bitbake", line 260, in main
     event = server.event_queue.get(block=False)
   File "/usr/lib/python2.6/multiprocessing/queues.py", line 104, in get
     raise Empty
Empty
ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:

     Please install the following missing utilities: git

Still not very pretty.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

