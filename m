Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGZb9-0006dD-5V
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 19:06:35 +0200
Received: by ywm39 with SMTP id 39so1832525ywm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=eAMaaP3aK0B0Nya4Dxf0SCBDj55hyzyfcJ31Gp/mpmY=;
	b=c+8os/nVqLLjrtyqbHrBvT/ePNMMuqvTO2mJkptCD7ByS4QtM33fhuZF2xpKPz2NDk
	C9oyIPvFb247LOjqaE7TwSEkNOTsbV6k3rrEohBwF0soYhDZycDN767M0/YEEkv1jsiP
	eF1yzdVMLkOm7iZrJEwpKKpaA8DbPjZLuUhBw=
Received: by 10.68.17.225 with SMTP id r1mr13790277pbd.64.1319043642126; Wed,
	19 Oct 2011 10:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Wed, 19 Oct 2011 10:00:12 -0700 (PDT)
In-Reply-To: <4E9F018D.7030703@intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop> <4E9F018D.7030703@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2011 10:00:12 -0700
Message-ID: <CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 17:06:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 9:57 AM, Saul Wold <saul.wold@intel.com> wrote:
> On 10/19/2011 09:49 AM, Phil Blundell wrote:
>>
>> On Wed, 2011-10-19 at 18:37 +0200, Koen Kooi wrote:
>>>
>>> Op 19 okt. 2011, om 18:24 heeft Kamble, Nitin A het volgende geschreven=
:
>>>>
>>>> It will be too many recipes to list on one line, shall I split the
>>>> commit into multiple one for each recipe whose data is changed?
>>>
>>> Or per group, but saying "some toolchain recipes" is way too vague.
>>
>> Why do we have this distro tracking data in oe-core git anyway? =C2=A0I'=
m not
>> entirely clear on what it's used by.
>>
> Phil:
>
> It's used by the tools that build http://packages.yoctoproject.org and to
> help recipe manage maintainer-ship and track what needs updating.

This could be managed via meta-data in packages I believe all that
information is there.

>
> Many upstreams we can't track if updates are required automagically, so w=
e
> need a place to record when the last manual check was, also possible reas=
ons
> why we should not update to newer versions, ...
>
> Sau!
>
>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


