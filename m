Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E70696BF85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 23:45:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 24940F811DB; Tue, 14 Jan 2014 16:45:35 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BEBD8F81199;
	Tue, 14 Jan 2014 16:45:32 -0700 (MST)
Message-ID: <52D5CC1F.2080009@mlbassoc.com>
Date: Tue, 14 Jan 2014 16:45:35 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAHQALceZv29NspjAzN5TEcOV8kiJ9YNyTD8acph-sJTnyfOyVg@mail.gmail.com>
In-Reply-To: <CAHQALceZv29NspjAzN5TEcOV8kiJ9YNyTD8acph-sJTnyfOyVg@mail.gmail.com>
Subject: Re: bitbake error
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
X-List-Received-Date: Tue, 14 Jan 2014 23:45:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-01-14 10:24, johan wadefalk wrote:
> Hi
>
> My target HW is a Wandboard-quad and I have followed this tutorial (http://wiki.wandboard.org/index.php/Getting_started_with_Yocto_on_Wandboard).
>
>
> My host system is gentoo which isn't a validated system for yocto but if someone can help me anyway I would be very happy.
> I have downgraded make from 3.82 to 3.81 because I couldn't find a patch for 3.82.
>
> When I try to bitbake the 1.5 DORA branch it fails on eglibc(shlib.lds:150).
>
>
> Here is the log: http://tny.cz/766db2d2

This email probably belongs on the Yocto list since it's more user-oriented.

Anyway, I just ran this same scenario with no problems on the master branch.
You might try that.

One thing that might be different - I used the Yocto toolchain package from
   http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/toolchain/
to get the right version of make, etc.  That also might help you.

>
>
> I work as a software developer but I have very little Linux experience.

I wonder why you are using gentoo which is not validated for Yocto?  Ubuntu
and Fedora are much friendlier and are known to work.

I wouldn't wish that (gentoo) on my worst enemy, let alone a Linux novice!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

