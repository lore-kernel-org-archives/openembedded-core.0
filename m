Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKXo5-0005n1-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 18:32:37 +0200
Received: by qcso7 with SMTP id o7so4665001qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=A6zfrcF5UrtamuqqWJFyrrENeDA+71q4KQ16FIEie6A=;
	b=BfY3UzknmKdy9r4mUymrwF7q6LvIRv3k/jrFFE4uRyPmDKK+jZEiyHMDpVwsF5hBsr
	InhK7PJguJA46rhm6jCMbuWbL3BUar3nPz4kReyNY7wleCBSE4mt/gqC844oWHZTPO7i
	/7vznfR0DivzlBMLpAY1W5A7xvN4gC2QGfDcNZDXb9hNbE/QXBjfwN6arGvlcBuL9Dao
	+ax/cFLaCPlAp5zOFXKbIdVFUR1sNZkysZl4LzNH0R1DCoc6jhE06HOOdvdvotvByFNS
	UBR7/r/kSCd/B/LZZzDzMO7wEST0lmBb0Lx7rPvs7TYJGhm8rCqnqgCArb9rwLFJqQlV
	vX7Q==
Received: by 10.224.180.1 with SMTP id bs1mr4618847qab.2.1334766189190; Wed,
	18 Apr 2012 09:23:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Wed, 18 Apr 2012 09:22:48 -0700 (PDT)
In-Reply-To: <1334762445.24091.110.camel@ted>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
	<1334762445.24091.110.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 18 Apr 2012 09:22:48 -0700
X-Google-Sender-Auth: ZFisvaJIjM4UBc5P1oT0CFiHX6Q
Message-ID: <CABcZANkaABCKZ+WmhhGTZEvFnHYwrP7uNSSvNTxxKxfun4JaPA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 16:32:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 18, 2012 at 8:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-04-18 at 16:53 +0200, Martin Jansa wrote:
>> On Wed, Apr 18, 2012 at 03:47:47PM +0100, Richard Purdie wrote:
>> > I thought I'd update everyone with the current 1.2 status.
>> >
>> > I'm going to branch master for release at this point. We've fixed a lot
>> > of issues, I'm hoping the -rc4 build will be a good one. There are signs
>> > there are some more minor issues around and bugs do keep getting opened.
>> > These are still being investigated so we'll continue to let that happen.
>> > Once we have a QA report for -rc4, we'll be in a better position to make
>> > a call on how things are looking.
>>
>> Does it mean that after creating branch, master will be open for
>> postponed patches from ML and master-next or do you want to keep master
>> as close to release branch as possible for some time (e.g. for those
>> 1.2.1 fixes)?
>
> I have hoped people would work more on the stabilisation and testing but
> I don't think I'll be able to hold off the pressure to start master
> rolling again at some point relatively soon.

Just because people have things to push or are pushing things which
aren't bugfixes doesn't mean their time is being taken up by anything
but stabilization right now. Your statement implies that everything
being pushed is being currently worked on, which is incorrect. I'm
sure Mentor isn't the only company with a backlog of already complete
local changes to get upstream..
-- 
Christopher Larson


