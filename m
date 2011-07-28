Received: from na3sys009aog102.obsmtp.com ([74.125.149.69])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmRht-0001hy-EB
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 16:37:01 +0200
Received: from mail-vw0-f42.google.com ([209.85.212.42]) (using TLSv1) by
	na3sys009aob102.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjFzDqamcQvp0h0PzgFxq0OpPv3bP1KT@postini.com;
	Thu, 28 Jul 2011 07:32:48 PDT
Received: by mail-vw0-f42.google.com with SMTP id 1so2359183vwl.15
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=uPn/gcpLUiafr5Wa7/sH31X/Sl3x35H6bXcgEqiyvVk=;
	b=WqdWBqQJ95YhziqKih8qRenbYxgQQRBh/XrrDHoTxJM+UMdmrf9lXir50xZWEZysMg
	q1mpJZCXtBk85nC6plEV5A+bvzscwQAtLKFoHixpOPlY2k+KTd/08+AEIv+5xtkQtW7u
	BCWr2VXJacSvtgQYiFhcK+gIln+dPe4HptkUg=
MIME-Version: 1.0
Received: by 10.52.29.42 with SMTP id g10mr955vdh.36.1311857541558; Thu, 28
	Jul 2011 05:52:21 -0700 (PDT)
Received: by 10.52.165.200 with HTTP; Thu, 28 Jul 2011 05:52:21 -0700 (PDT)
In-Reply-To: <CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
Date: Thu, 28 Jul 2011 08:52:21 -0400
Message-ID: <CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Koen Kooi <koen@dominion.thruhere.net>, 
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Cc: openembedded-core@openembedded.org
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
X-List-Received-Date: Thu, 28 Jul 2011 14:37:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen, Frans,

On Thu, Jul 28, 2011 at 6:48 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 28 jul. 2011, om 05:38 heeft Ben Gardiner het volgende geschreven:
>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>>
>> This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
>> git://git.openembedded.org/openembedded, commits
>> 01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
>> f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS'
>
> Why does this need to be in OE-core and not in some other layer? It doesn=
't look so core to me, especially since nothing in oe-core (or meta-oe/efl/=
gnome for that matter) depends on it

Because oe-core's meta/recipes-support (naively) seemed like a
reasonable place for it. I would be happy to re-spin the patch for
locating it in any layer. Please advise me.

It's true that nothing depends on it. As Frans mentions later it's
only dependent in oe.dev is flickrcurl. Raptor is both a library and a
utility; we use the latter so raptor itself is a dependency of our
images.

>>
>> The recipe was modified by adding a LIC_FILES_CHKSUM assignment.
>>
>> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> ---
>>
>> Not tested in the oe-core + meta-openembedded et. al. layers.

I'm sorry for the confusion -- this recipe is/was tested in oe.dev and
2011.03-maintenance branches.

> So why are you sending it if it isn't tested?
>
>> We are not
>> ready yet to migrate from the 2011.03-maintenance branch. This patch is
>> proposed for inclusion in oe-core so that we can meet the new policy
>> requirements for inclusion in the 2011.03-maintenance branch
>
> Where does it say it's OK to do a pull request for untested recipes? And =
where does it say it needs to be in OE-core first?

My understanding of Tom's post to the oe.dev mailing list is that
commits in pull-requests for 2011.03 need to first be oe-core or one
of its layers.

In Message-ID: <4DFA7108.5020103@mentor.com> On Thu, Jun 16, 2011 at
5:09 PM, Tom Rini <tom_rini@mentor.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi all,
>
> As part of this weeks TSC meeting, an agenda item was brought up about
> the 2011.03-maintenance branch and oe-core / etc. =A0I have now updated
> the policy about where changes need to be before they can be included in
> 2011.03-maintenance to include being in oe-core / meta-oe or other
> relevant public layer instead of being only in the oe.dev master branch.
> =A0This is not a policy change, but a clarification of what was there
> previously. =A0Thanks all!
>

On Thu, Jul 28, 2011 at 7:29 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
>
> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Eh, yes and no.
>
> I did write the original recipe and commited it on 14 aug 2010 with a
> sign-off message.
> As such this got my signoff, but I am not sure the signoff should be
> repeated if this moved to oe-core.

Fair enough. It is your Sign-off to give or take.

I was following the patch message guidelines. "Example: Importaing
from Elsewhere Modified" in particular:

http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Exam=
ple:_Importing_from_Elsewhere_Modified

I will remove your Sign-off in v2.

> My sign-off at that time is definitely not to be used as a suggestion it =
is
> ok for oe-core (actually I feel this is not something for oe-core)

Understood -- I am happy to re-spin for inclusion in any layer. Please advi=
se.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


