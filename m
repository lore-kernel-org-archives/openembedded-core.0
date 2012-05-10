Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=47094b4ea=rich.pixley@palm.com>)
	id 1SSGz1-0003mO-Ez for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:11:51 +0200
X-IronPort-AV: E=Sophos;i="4.75,560,1330934400"; d="scan'208";a="13415649"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 09 May 2012 17:00:53 -0700
Received: from fuji-land.noir.com ([10.100.2.2])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q4A00qDj030167;
	Wed, 9 May 2012 17:00:53 -0700
Message-ID: <4FAB0534.5070205@palm.com>
Date: Wed, 09 May 2012 17:00:52 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
	<1336595524.2494.77.camel@ted> <4FAAFBB5.10004@palm.com>
	<1336606329.2494.105.camel@ted>
In-Reply-To: <1336606329.2494.105.camel@ted>
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Thu, 10 May 2012 00:11:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 16:32 , Richard Purdie wrote:
> On Wed, 2012-05-09 at 16:20 -0700, Rich Pixley wrote:
>> My rebuild completed in 5 seconds.
>>
>> Thank you very much!
>>
>> I'd rather not fork bitbake locally.  Can I expect this patch to show up
>> in git://git.openembedded.org/bitbake sometime soon?
> Yes, I just wanted to confirm we were fixing the right problem...
>
> I'll post it to the bitbake list and merge in a day or two assuming no
> negative feedback.
I'm running more thorough tests as I type.
> I still wonder if that stamp mode is useful but that is a different
> discussion.
If I'm understanding your other message, then no, it's probably not.

My only concern is that in the A depends on B depends on C case, 
changing C forces a rebuild of A.  I don't really care which mechanism 
makes that happen.

--rich


