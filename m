Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id CAC1A71044;
	Fri, 29 Aug 2014 00:41:25 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id h18so8910466igc.12
	for <multiple recipients>; Thu, 28 Aug 2014 17:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IIJZjsndcDQpfWH0gLlAKI3MstS51hC0vYPN+zXJMjM=;
	b=fYie9kR1MBkgEmgWjGKm0H+iePdFrCc4DHe54aGsFUbxXzKHc+UYDEPjI54nOraG21
	gaCltTPNmN6wM4DcwXOtZEGrHjj5M94hTElkFcxobjlnErCiV5tZQhWAwux3sYXnvXK+
	nRgjR+LtWbJlnuZUj/F7XPyoITcwtKvlMefjcvsTnvRJDDjJjVr1Lz2IQ9p/uKR8TBqk
	rEXrW31hCcQikARDqfHF1N4kC0Lf8svzV65wrA9dqoJgLiisFGIySSpRAkYxOXEuohZr
	ae9nxchAnrEe3DIeVQXvAl0kVle6AOi7eMzjXB2+dnWYYZURTn7RJsp9ByZrSjgdJTzU
	blOw==
X-Received: by 10.42.26.74 with SMTP id e10mr7939384icc.25.1409272885907; Thu,
	28 Aug 2014 17:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Thu, 28 Aug 2014 17:40:55 -0700 (PDT)
In-Reply-To: <1409261727.29296.144.camel@ted>
References: <20140828064051.GA13139@haswell> <1409261727.29296.144.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 17:40:55 -0700
Message-ID: <CAMKF1sqn2Bj--Mke7SA-wONxeaRYcCa_JZ5EGkmo=phdf3EoBg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Fri, 29 Aug 2014 00:41:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 28, 2014 at 2:35 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-08-27 at 23:41 -0700, Khem Raj wrote:
>> As we all know eglibc has been merged back into glibc and 2.19 was the
>> last release, here I have put together the recipes for upcoming glibc
>> 2.20 release and removed eglibc 2.19 in favor of move.
>>
>> I also thought about leaving eglibc in there but then eglibc and glibc
>> were pretty much same as they always have been that it would be an
>> incremental change with lot more patches this time.
>>
>> The tree is here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-to-glibc-2.20
>>
>> This has not recieved much testing yet and I am looking out for helping
>> hands here, so try it out in your buid environments and machines of
>> interest and report back on issues.
>
> The one I've seen so far looks like a patch wasn't updated:
>
> http://errors.yoctoproject.org/Errors/Search/Details/3783/3/10/1fc811ecd57be21ae6ab78e15204ffa76494c6b8
>

Yes.
have forgotten the squash when I updated patches earlier today Fixed
and pushed now.

> Cheers,
>
> Richard
>
>

