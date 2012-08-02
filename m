Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwyDj-0005BR-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:25:55 +0200
Received: by ghbz2 with SMTP id z2so8025636ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bu0JFcI+0PY9navwZYeNfCVxbvmYQvrFoyyp2xvQBM4=;
	b=Qfzo1SAbE6lARB966PNTiiKcDSJiggcsKEKUGcJib44gnQsmOTj6g7lyRqcJ3b1OKf
	w93VpZiWundubL7f9mcKJbwbz/au8rHGtVPcaeuqE0Oib1ojPSTRAzuh1cdQcJFtPBBx
	IXNjni0Qx8G2KV568n69DsFWaL/dglqvywe9n2TwhHqCgnhrarabkj3bod1HeIU02hmi
	mKGgIZXVq0Qu7z5kKFkXQH9hdd6Sw8n4OaYpIisi3sjKrmT63pf4308vwM6a3A53XT/T
	3ammtpsIzbAg1Zzb846gIAY7Ab/meMXi8hJDaadbI7fQXeKAUDcwj7AGw8qeITCqlWza
	tHzQ==
MIME-Version: 1.0
Received: by 10.50.191.227 with SMTP id hb3mr4671854igc.45.1343924054682; Thu,
	02 Aug 2012 09:14:14 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Thu, 2 Aug 2012 09:14:14 -0700 (PDT)
In-Reply-To: <20120802125846.GP16306@jama.jama.net>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
	<CAJTo0LY4e_Boi-RU4iyu+_2gRvuvLO40b2Pu8FsCRnXqSdACvQ@mail.gmail.com>
	<20120802125846.GP16306@jama.jama.net>
Date: Thu, 2 Aug 2012 18:14:14 +0200
Message-ID: <CALbNGRSg-OGp-H+5gjvaAtHNbtujS4ZmeDjNcMFNLEYtH=kAaQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] buildhistory improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 16:25:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 2:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 02, 2012 at 12:27:05PM +0100, Burton, Ross wrote:
>> On 2 August 2012 10:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> > A bunch of improvements for buildhistory, implementing some feature
>> > requests and todo items of my own, as well as tidying up some of the
>> > code.
>>
>> I've been using this branch for an hour or so whilst reviewing
>> changes, the new features are useful and it didn't break.
>>
>> Acked-by: Ross Burton <ross.burton@intel.com>
>
> My tests also look good, some interesting (expected) changes recorded
> here
>
> http://git.shr-project.org/git/?p=buildhistory.git;a=commitdiff;h=2fe33b15dcec9eb69f9075f138cea2405c061b00
>
> Thanks!
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
Although I have no time for testing at the moment: thanks for doing this

Andreas


