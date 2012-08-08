Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sz9Tq-0001P8-L7
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 18:51:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q78Gdk6B025930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 09:39:46 -0700 (PDT)
Received: from msp-dhcp51.wrs.com (172.25.34.51) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 8 Aug 2012 09:39:46 -0700
Message-ID: <50229652.4010508@windriver.com>
Date: Wed, 8 Aug 2012 11:39:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1344422390.23275.233.camel@phil-desktop>
In-Reply-To: <1344422390.23275.233.camel@phil-desktop>
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 16:51:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/12 5:39 AM, Phil Blundell wrote:
> On Wed, 2012-08-08 at 09:41 +0100, Burton, Ross wrote:
>> As everyone who's used it can attest, Web (the optional browser in
>> Sato) is pretty rough.  Part of my plans about replacing Sato with a
>> leaner environment involves replacing it with Midori, and if there
>> isn't any disagreements I'll work on a submission to merge Midori into
>> Sato now for everyone who expects the Sato web browser to be useful.
>
> Replacing Web with Midori in Sato probably is a fine idea from the point
> of view of those folks who want to use Sato per se.  As far as oe-core
> is concerned, the point of having Sato included is apparently for
> testability and it's not entirely obvious that much extra test coverage
> would be gained by merging Midori.

We've been noticing that webkit seems to be pretty good for finding compiler 
bugs.  :P

> Indeed, it's not totally clear that having WebKit in meta-sato is really
> justified by the test coverage it brings.  I think WebKit itself might
> be a reasonable candidate for inclusion in oe-core proper, but the
> current situation of having a slightly half-baked recipe in meta-sato is
> not very satisfactory.
>
> However...
>
>> This will involve pulling a few projects from meta-oe to oe-core:
>> ca-certificates, python-docutils and vala specifically (although its
>> possible that we can drop the vala dependency).
>
> ... all three of those seem like reasonable enough things to have in
> oe-core.  Personally I would quite like to see Vala in there.  So, from
> that point of view, I don't have any objection to your proposal.
>
> But, that said, I do still think that there is going to be some
> inevitable tension between the desire to make Sato useful in itself and
> the desire to have a test environment for oe-core which doesn't add too
> many extra dependencies.  So in the longer term I continue to feel that
> Sato should probably go away into its own layer (or, at least, a layer
> that isn't oe-core) and oe-core itself should gain a dedicated test
> suite.  Anybody who wanted to go on using Sato to exercise oe-core would
> obviously be free to do so even if it was in some other layer.

I agree with the above... we want a sato or sato like environment to do coverage 
tests (primarily verify that subsystems are working together, and graphics is 
functional....)

I'm not against replacing the existing item with Midori, but if we do, it should 
be to exercise (or better exercise) the existing items -- or add the new items.

I know webkit is something that I think is valuable in oe-core, as most embedded 
browsers seem to be based on it these days.  The other items seem like though 
would be valuable as well.  And if all of those can be agreed to go in, then 
Midori seems to be reasonable -as a test case-.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



