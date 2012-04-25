Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SN4r5-0001rm-Hl
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 18:14:11 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 25 Apr 2012 09:04:33 -0700
Received: by lbbgi4 with SMTP id gi4so190493lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 09:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=HbE7CgzywALwNVX4XzgKjaNmQ9n1NdMJ1DzgCAyBMOI=;
	b=R1s26+kXfCrYxoiBZmeuuUfjmeoHAkvtYRVrHES4oNvztZkY7Wdo5vyE3g1fKGg+Md
	js5Q8YZqsFxrA7tSl4iozHWoQ9E3oWNqyi6kZ3tEEmaffmOWn26zjEyy4pHv3j1adu1W
	I7S91xo/bdblFi8TqkhuJ7pk5FiuOBL2rM4qg7RZzxvy1dOPTV6IRARWxp7MerYDy4Kq
	nBXSkJHzC3mFyQVUbALt+aOVVrT8nb1H91ldt8S9N4apeBurfwx96g6L/NohlJw2Gqlf
	56SoxoV+nHxdklKQh3sCBV/Z/QOiDzKmXhY8xArage4iMS4xu8x4JREpZTvJSOpuD4RK
	bbGw==
MIME-Version: 1.0
Received: by 10.152.106.9 with SMTP id gq9mr3200242lab.14.1335369871587; Wed,
	25 Apr 2012 09:04:31 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Wed, 25 Apr 2012 09:04:31 -0700 (PDT)
In-Reply-To: <1335341824.21409.55.camel@ted>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
	<CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
	<CABcZANnyFDurr+B6nW5nJz+3kq2RXp4403Eqhcahkt53ififeA@mail.gmail.com>
	<CAPhnLPDfjVWLKSDTwiZDCBNpHE7CKXuWfzTMccAuq-ruPtsW9w@mail.gmail.com>
	<1335341824.21409.55.camel@ted>
Date: Wed, 25 Apr 2012 09:04:31 -0700
Message-ID: <CAPhnLPDoJx02jGCn+4CzbGzZJD2R1Yi8o=MMzzidx-ufpwo3EA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnJBRnt8H701nL4ShXy8UAWuSFw4de6MQLybLNxwgi/HBodrtT3tZsS9aVJPKm+oXJcKFQB
Subject: Re: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Wed, 25 Apr 2012 16:14:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 25, 2012 at 1:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-04-24 at 16:13 -0700, Flanagan, Elizabeth wrote:
>> On Tue, Apr 24, 2012 at 3:53 PM, Chris Larson <clarson@kergoth.com> wrote:
>> > On Tue, Apr 24, 2012 at 3:38 PM, Flanagan, Elizabeth
>> > <elizabeth.flanagan@intel.com> wrote:
>> >> The rest of the packages in the bb should be inheriting LICENSE if no
>> >> PN level license is set. Which obviously causes problems for the above
>> >> example.
>> >>
>> >> In a case like above you'd want to do either of the following:
>> >>
>> >> a. Call out each package's license individually (better but can be
>> >> painful for recipes with lots of packages)
>> >> b. Leave GPLv3 out of LICENSE (easier but not technically accurate) so
>> >> undefined package level licensing inherits the correct LICENSE.
>> >
>> > I wonder if a partially specified set of individual package settings
>> > should be identified by some sanity check (an explicit, rather than
>> > implicit, one, like recipe_sanity) as a potential bug / source of
>> > confusion.
>>
>> It's something I've been thinking heavily about how over the past few
>> month. How to implement full package level license support without
>> requiring too many recipe changes. The current setup licensing moves
>> us in the right direction, without having to do too many recipe
>> changes, but there are some inadequacies in it and we may have to
>> address them sooner or later.
>
> I like the idea that LICENSE is the default and is used where no other
> LICENSE is set. If our LICENSE field building code is clever enough to
> be able to find any LICENSE_xxx variables that are set now, we could
> just define LICENSE to be the default LICENSE unless something else is
> set. It would then be up to the license handling code to create the xxx
> & xxx expressions where needed.
>
> This keeps things simpler for the recipes but still gets us where we
> need to be. I don't think forcing users to set LICENSE for every
> subpackage will be particularly useful, nor is having the top LICENSE
> field being a complete summary when we could calculate that.
>

I don't necessarily disagree, however, it is a change to how that
field has been historically used from my understanding. If people are
fine with using it that way, let's document it, let everyone know
about it and start looking at which recipes need to be updated to do
it correctly.

>> > I suspect most of the time it should be one or the other,
>> > either no individual package LICENSEs are defined, or they all should
>> > be.
>>
>> I would tend to agree. One thing I think we may want to start
>> considering (even if it does make me cringe a bit) is that if we go
>> this route, we may want to support LIC_SRC_URI_${PN} as well. It means
>> quite a few recipe changes, but it yet another step in more accurate
>> license auditing.
>
> Please, no ;-). Do something like the SRC_URI checksums (name the urls,
> then apply extra information to them, or use parameters in the urls.

Ahhh, yes. That's a much better idea. :)

-b

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


