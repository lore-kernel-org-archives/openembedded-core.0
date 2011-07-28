Received: from na3sys009aog116.obsmtp.com ([74.125.149.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmRIt-0001E8-AY
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 16:11:11 +0200
Received: from mail-vx0-f179.google.com ([209.85.220.179]) (using TLSv1) by
	na3sys009aob116.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjFtANr9Cn8UHsCwuxm+9p6FhXtE/MgU@postini.com;
	Thu, 28 Jul 2011 07:06:58 PDT
Received: by mail-vx0-f179.google.com with SMTP id 32so2093076vxi.10
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9J22MEGpo8FR8VEuPWWWoFwkmDJI+RJUIfAblrkLajs=;
	b=LQ4atGNhDjqBka2ejotIvECDyqtoJs/nybBXwEd5Ytd9r5UmVNYa7c3pLFYkmaAsCX
	IPT3wlW25i5hS9NEFQXvAm1E5k+w6vOBPNVGJ3V6rsjzM+Q8qggDH8HSZrolgVfGnrqo
	KZL6bgkyIwjSYeK7F2Mb/PSjrwCUqwpoGd80Q=
MIME-Version: 1.0
Received: by 10.52.22.49 with SMTP id a17mr67810vdf.170.1311862016460; Thu, 28
	Jul 2011 07:06:56 -0700 (PDT)
Received: by 10.52.165.200 with HTTP; Thu, 28 Jul 2011 07:06:56 -0700 (PDT)
In-Reply-To: <CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
Date: Thu, 28 Jul 2011 10:06:56 -0400
Message-ID: <CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 14:11:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Frans,

On Thu, Jul 28, 2011 at 9:52 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
>
> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> Hi Koen, Frans,
>>
>> On Thu, Jul 28, 2011 at 6:48 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>> >
>> > Op 28 jul. 2011, om 05:38 heeft Ben Gardiner het volgende geschreven:
>> >
>> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> >> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>> >> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> >>
>> >> This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
>> >> git://git.openembedded.org/openembedded, commits
>> >> 01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
>> >> f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS=
'
>> >
>> > Why does this need to be in OE-core and not in some other layer? It
>> > doesn't look so core to me, especially since nothing in oe-core (or
>> > meta-oe/efl/gnome for that matter) depends on it
>>
>> Because oe-core's meta/recipes-support (naively) seemed like a
>> reasonable place for it. I would be happy to re-spin the patch for
>> locating it in any layer. Please advise me.
>
> oe-core is only for core recipes. Not sure about the exact definition, bu=
t I
> suspect it is something like "recipes that (virtually) everybody needs".
> I'm not sure about layer policies, but maybe this could go to meta-oe.

Ok -- I suppose not everybody needs to parse RDF in various serialized
representations :)

V2 will be targetted to meta-oe, thanks.

>>
>> It's true that nothing depends on it. As Frans mentions later it's
>> only dependent in oe.dev is flickrcurl. Raptor is both a library and a
>> utility; we use the latter so raptor itself is a dependency of our
>> images.
>>
>> >>
>> >> The recipe was modified by adding a LIC_FILES_CHKSUM assignment.
>> >>
>> >> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>> >>
>> >> ---
>> >>
>> >> Not tested in the oe-core + meta-openembedded et. al. layers.
>>
>> I'm sorry for the confusion -- this recipe is/was tested in oe.dev and
>> 2011.03-maintenance branches.
>
> I'd say that before submitting you should as a minimum test that it build=
s
> properly in the layer you are submitting it (so e.g. we're sure all depen=
ds
> are there).
>>
>> > So why are you sending it if it isn't tested?
>> >
>> >> We are not
>> >> ready yet to migrate from the 2011.03-maintenance branch. This patch =
is
>> >> proposed for inclusion in oe-core so that we can meet the new policy
>> >> requirements for inclusion in the 2011.03-maintenance branch
>> >
>> > Where does it say it's OK to do a pull request for untested recipes? A=
nd
>> > where does it say it needs to be in OE-core first?
>>
>> My understanding of Tom's post to the oe.dev mailing list is that
>> commits in pull-requests for 2011.03 need to first be oe-core or one
>> of its layers.
>
> No idea here.
> But why would add a patch for LIC_FILES_CHECKSUM in the maintenance tree.
> If I recall correctly those are not needed in 2011.03 (but if it is and i=
t
> is missing from the recipe, I think it should be added, if not, probably
> leave the recipe as is).

Well, I would not submit _this_ patch for pull-request. I was hoping
to get this version of raptor included and then submit a pull-request
for a cherry-pick of the patch to add libxml2 to DEPENDS.

On Wed, Jul 27, 2011 at 11:38 PM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
> This patch is
> proposed for inclusion in oe-core so that we can meet the new policy
> requirements for inclusion in the 2011.03-maintenance branch and submit
> a subsequent pull-request for commit
> f1d24b5a986233f869364eb109476f5184e76d10 raptor: add libxml2 DEPENDS


>>
>> In Message-ID: <4DFA7108.5020103@mentor.com> On Thu, Jun 16, 2011 at
>> 5:09 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > Hi all,
>> >
>> > As part of this weeks TSC meeting, an agenda item was brought up about
>> > the 2011.03-maintenance branch and oe-core / etc. =A0I have now update=
d
>> > the policy about where changes need to be before they can be included =
in
>> > 2011.03-maintenance to include being in oe-core / meta-oe or other
>> > relevant public layer instead of being only in the oe.dev master branc=
h.
>> > =A0This is not a policy change, but a clarification of what was there
>> > previously. =A0Thanks all!
>> >
>>
>> On Thu, Jul 28, 2011 at 7:29 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> >
>> >
>> > 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>> >>
>> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> >
>> > Eh, yes and no.
>> >
>> > I did write the original recipe and commited it on 14 aug 2010 with a
>> > sign-off message.
>> > As such this got my signoff, but I am not sure the signoff should be
>> > repeated if this moved to oe-core.
>>
>> Fair enough. It is your Sign-off to give or take.
>>
>> I was following the patch message guidelines. "Example: Importaing
>> from Elsewhere Modified" in particular:
>>
>>
>> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#E=
xample:_Importing_from_Elsewhere_Modified
>
> Ah ok, Those guidelines are fairly new and I was not too aware of them. I=
f
> it is in accordance with the guidelines it is fine with me to keep them.
> I was mainly triggered by the signed-off lines at the beginning of your
> message (which I don't think are in accordance to the above mentioned
> guidelines).

Oh. I thought they were [in accordance]. I guess there would usually
be a commit body before the initial Signed-off-by:'s ; however, there
was no original commit body to preserve.

> The only concern I have is that the sign-off would be interpreted as my
> blessing for this patch in oe-core.

Your blessing is not mine to give. I never intended to give it.

> If it only is used as an indicator of
> the origin or as a statement that I released and was entitled to release =
the
> original stuff, that is ok (as that is still appropriate).

Yes, the sign-offs at the beginning are preservations of the
provenance of the patch only.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


