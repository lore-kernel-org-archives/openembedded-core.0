Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QrnWb-0006oS-25
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 10:55:29 +0200
Received: by qyk9 with SMTP id 9so2069501qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FLCYd1vML8FwVP+BCyNqmQBh8wjwYBQw2bH1geJCV/Q=;
	b=wXDhZXlVzhj/2GCCvKGMomXFIcL/otZYsKwu4GP4YT4Xf0jz0VbZlyi/b1isztzVTh
	SHmCUkH6rdC9c/eeJAInSz/doB8dvVrmZnZT/WuozhpJQEFCZyWW0WxU7xGW4tGscAjf
	81OPmU/QGMk9yHE9VB9Fe6IfpHJyGLqBtZZik=
MIME-Version: 1.0
Received: by 10.224.211.66 with SMTP id gn2mr412114qab.390.1313139056014; Fri,
	12 Aug 2011 01:50:56 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Fri, 12 Aug 2011 01:50:55 -0700 (PDT)
In-Reply-To: <4F2F68E2-0969-41CA-8959-CF4DDA5D0CA4@dominion.thruhere.net>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<20110812062739.GC13857@denix.org>
	<CAGiJk9c39t_yvDXbT-ODOXv88hSNkKZyGbXhVouLpHU5j6TgKQ@mail.gmail.com>
	<4F2F68E2-0969-41CA-8959-CF4DDA5D0CA4@dominion.thruhere.net>
Date: Fri, 12 Aug 2011 10:50:55 +0200
Message-ID: <CAGiJk9fx7NXF=fB67Q-t+DF25ow+TUBRJ3XT+X5o9-=6WzNpGg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 08:55:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/12 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 12 aug. 2011, om 09:30 heeft Samuel Stirtzel het volgende geschreven:
>
>> 2011/8/12 Denys Dmytriyenko <denis@denix.org>:
>>> On Fri, Aug 12, 2011 at 08:17:52AM +0200, Samuel Stirtzel wrote:
>>>> Hi,
>>>> lately I looked a bit into the structure of OE-Core and found pages
>>>> like: http://www.yoctoproject.org/projects/openembedded-core, and
>>>> http://openembedded.org/index.php/LayerIndex
>>>>
>>>> 1. question: Are these informations reliable (the layer index page
>>>> seems outdated). From the information I found, this graphic was
>>>> created as conclusion:
>>>> http://imageshack.us/photo/my-images/155/openembeddedlayers.png/
>>>>
>>>> 2.: Currently the "UI layer" seems to be contained in
>>>> meta-openembedded, so is this _the_ layer for UI and windowmanager
>>>> recipes or is this a subject to change?
>>>>
>>>> 3.: The commercial layer is nowhere found, what are the plans for this
>>>> layer, or was this just an idea?
>>>
>>> Commercial layers are what envisioned to be provided by OSVs, such as Mentor,
>>> MontaVista, TimeSys etc...
>>>
>> Missed out that OSV means Open Source Vendor.
>> Would recipes for software like the Qt framework or Java fit in this
>
> Qt is already in OE-core
This was meant as an example for an already existing recipe, however I
undestood what could go in the commercial layer.
>
>> layer, or is it more for additional recipes to these packages like
>> mysql or postgresql plugins for Qt?
>
> And those plugins are already in meta-oe
>
Thanks, it's good to know about this.

>>>> 5.: Is something important missing / wrong in my graphic (other than
>>>> the distro stuff)?

Ok questions 3 and 4 answered, maybe anyone would like to answer the
question about the "UI layer"?


Regards
Samuel


