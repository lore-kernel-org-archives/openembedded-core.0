Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1SIeLw-0006jU-IV
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 13:07:44 +0200
Received: by wgbdr12 with SMTP id dr12so2443160wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=X+eoaSoD0X3fZldOMif3YMRpCI4QLk1mdJPqIc+uMyA=;
	b=oJg5Ut8Zs1x8eBXy5sADV5r8sWmPageNPuBW/v3kc/b7hWGN/VECWhQ0eFM0uwXbRh
	1Bpo97GrsljcAC0Q6ZQWbYDm3omR/5KpKG4jH5rvHZmtL9T1M2asv/FPX2SCOZeR7Z6v
	cZ/PwIPd23iIZZgA1e26Dmrtzy27Ec2bgVIL+w439rbvKnkUxFpqwO56QsFdiksK/Gj5
	SRoFRz0Evaa6yop8o7azzHd94XKIMdj07GMbe067kNXVc0pIpW47h6xF28TZLS9esm8/
	pUSFeCuPlLHMWPvn5FZUqJ5ZoM1cY3HHnG5zAdUkoR/1Dx1mcNc6DaopweAffuheZGon
	NsUw==
MIME-Version: 1.0
Received: by 10.180.76.240 with SMTP id n16mr2807955wiw.10.1334314703612; Fri,
	13 Apr 2012 03:58:23 -0700 (PDT)
Received: by 10.223.62.6 with HTTP; Fri, 13 Apr 2012 03:58:23 -0700 (PDT)
In-Reply-To: <4F873102.6020603@balister.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted> <4F873102.6020603@balister.org>
Date: Fri, 13 Apr 2012 12:58:23 +0200
Message-ID: <CAE4k238FK0SgSXpsP-eeZQVEQdHnpJ+G7cz2_dO-MBHgxNJH5A@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Fri, 13 Apr 2012 11:07:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 12, 2012 at 21:46, Philip Balister <philip@balister.org> wrote:
> On 04/12/2012 11:40 AM, Richard Purdie wrote:
>> On Thu, 2012-04-12 at 14:32 -0300, Otavio Salvador wrote:
>>> On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> You just volunteered to handle all the "Does it work with yocto 1.2?" questions :)
>>>>
>>>> Simply put: people are stupid, they need explicit PHB compliant names in tags, even if it isn't 100% politically correct to say "yocto" when we actually mean "oe-core".
>>>>
>>>> Unless the yocto 1.2 release note state that it's based on oe-core "foo" and all layers compatible with "foo" use "foo" in tags/branches.
>>>
>>> I think layers ought to have tags for both ...
>>>
>>> <layer>-oe-core-<tag>
>>> <layer>-yocto-<tag>
>>
>> This would be rather sad if it were necessary. The whole point is we're
>> trying to build things which are compatible with each other. If that
>> turns out not to be the case I want to fix it, not encourage it.
>
> We need a coherent tag name to use across layers. The Yocto Project is
> the umbrella project, so using the yocto-project in the tag name is a
> good way to show this coordination among projects to people not familiar
> with how things are working. (As Koen notes, this makes communication
> with people whose primary exposure to the Yocto Project is watching
> youtube videos)

I'm also in favor of a yocto-project-1.2 tag, for the same reason as
Koen and Philip mention. That would make it easier communicating with
customers and PHB's that has heard of Yocto Project...

> I do not want to see table containing Yocto Project release information
> and they relate to a set of seemingly random tags in other layers.

The risk for this is definitely somewhat higher with a strict YYYY-XX
release tag (which also might collide with other projects/layer more
easily). Thus, I'm advocating a 'yocto-project'-prefix for the tags in
question.

/Anders


