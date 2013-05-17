Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UdQCk-0007QF-S5
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 21:20:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 35193F8126B; Fri, 17 May 2013 13:02:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4F0DCF81269;
	Fri, 17 May 2013 13:02:21 -0600 (MDT)
Message-ID: <51967EC1.1030509@mlbassoc.com>
Date: Fri, 17 May 2013 13:02:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "William M.A. Traynor" <wmat@alphatroop.com>
References: <51954B2C.4060900@mlbassoc.com>
	<CAGfZjq7xwYGgxx2nyAbuutzNe4kPNUhJ5cbKBfG1PF2cBHU7gw@mail.gmail.com>
In-Reply-To: <CAGfZjq7xwYGgxx2nyAbuutzNe4kPNUhJ5cbKBfG1PF2cBHU7gw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why doesn't my package rebuild
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 19:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-17 09:29, William M.A. Traynor wrote:
> On Thu, May 16, 2013 at 5:10 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> Sort of as a follow up to my problem of yesterday, I've run into
>> a problem - I have a simple recipe which only unpacks a source tarball
>> and then installs it - no other steps are listed or required.  The recipe
>> also does not have an explicit PR value and I'm not running a PR server.
>>
>> If I have the package built, then change the tarball and the checksums
>> in the recipe itself, it does not get rebuilt :-(  I have to force it
>> using cleansstate.
>>
>> This setup seems to work fine for my other recipes.  I just tried it
>> with two nearly identical recipes.  I made similar changes in both
>> recipes/files - one was rebuilt, the other not.
>>
>> How can I diagnose this?  It's a private recipe (no use to anyone but me)
>> so I'm not going to send it to the list but I can gladly share it with
>> anyone who might be able to help.
>
> Hi Gary,
>
> You can increase the Debug level for your build with bitbake -D.  You
> can specify this more than once for additional output, example: -DDD.
> This may help you to diagnose what's going on.

Thanks, that was the hint I was looking for.

Of course, today the recipe behaves...  At least I'll know what to
do the next time I have problems.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


