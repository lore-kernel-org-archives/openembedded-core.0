Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RM7B8-0004vm-01
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 00:58:38 +0100
Received: by iafj26 with SMTP id j26so1976741iaf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 16:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=D9j3G9NcQvap62BhBCtvvg4eZxKt+seFu6oN5A9Lr90=;
	b=K7sE4TH5raVj9noyaC3wG2g9mf5lYxCfaQBDGoXMW8RfN1PHbrQTx6o4/8/afQ0wjQ
	eGnfggiEtKqhWj+RD1desZHq0VuDUbIYM4fiIUYWPiGl4gbtENYnlj2RcCFltNGL/kbl
	ZBR14XmCu4l6hvG9o+TV4y8ZkRs2S2E7Ud7jY=
MIME-Version: 1.0
Received: by 10.42.147.65 with SMTP id m1mr11677683icv.27.1320364348270; Thu,
	03 Nov 2011 16:52:28 -0700 (PDT)
Received: by 10.142.231.12 with HTTP; Thu, 3 Nov 2011 16:52:28 -0700 (PDT)
In-Reply-To: <1320347755.20107.72.camel@ted>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
	<8B9E217B-2135-4E8D-9180-FAFD7E7478E0@dominion.thruhere.net>
	<CADkTA4PQspBbSFTVS9GZcGokvSR7zgyAqSq_kEE-EUqxpbfYQw@mail.gmail.com>
	<93B560B0-AFAE-4B57-B1A4-6516085B4E9E@dominion.thruhere.net>
	<CADkTA4PyZ7r7aiGpENv1RSygtj-ni53XFOBPqOhETruUqem+Ew@mail.gmail.com>
	<1320347755.20107.72.camel@ted>
Date: Thu, 3 Nov 2011 19:52:28 -0400
Message-ID: <CADkTA4PfFscYkoF_1irSz3=Ttns2tAgsj4LHf2qg_j_r-9NmfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 23:58:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2011 at 3:15 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-11-03 at 14:12 -0400, Bruce Ashfield wrote:
>> On Thu, Nov 3, 2011 at 2:07 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> >
>> > Op 3 nov. 2011, om 18:53 heeft Bruce Ashfield het volgende geschreven:
>> >
>> >> On Thu, Nov 3, 2011 at 1:22 PM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>> >>>
>> >>> Op 3 nov. 2011, om 18:11 heeft Bruce Ashfield het volgende geschreve=
n:
>> >>>
>> >>>> Richard/Saul,
>> >>>>
>> >>>> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes =
from TomZ.
>> >>>> These are destined for master and separate from any point updates t=
o the 1.1
>> >>>> release.
>> >>>>
>> >>>> In case anyone cares my -dev kernel also has these changes, and it =
will take
>> >>>> them to the latest kernel shortly.
>> >>>>
>> >>>> This also doesn't bump the preempt-rt branches, since they'll be up=
dated
>> >>>> to the new -rt first, before taking the 3.0.x stable updates.
>> >>>>
>> >>>> Built and booted for all the qemu targets.
>> >>>>
>> >>>> cc: Tom Zanussi <tom.zanussi@intel.com>
>> >>>> cc: Darren Hart <dvhart@linux.intel.com>
>> >>>>
>> >>>> Cheers,
>> >>>>
>> >>>> Bruce
>> >>>>
>> >>>> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7=
b8275470:
>> >>>>
>> >>>> =A0meta: glib-2.0: don't apply qsort_r test removable patch for nat=
ive version (2011-11-02 09:08:28 +0000)
>> >>>>
>> >>>> are available in the git repository at:
>> >>>> =A0git://git.pokylinux.org/poky-contrib zedd/kernel
>> >>>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/ker=
nel
>> >>>
>> >>> Do you also have a tree against oe-core?
>> >>
>> >> I don't have a contrib branch, I asked a few week ago, but still don'=
t have it
>> >> created. So I have a tree, but no where to push submissions.
>> >
>> > Forking https://github.com/openembedded/oe-core is easy enough :)
>>
>> Sure. But I dislike github in general (everyone has their preferences) a=
nd was
>> trying to get a contrib branch. There's a myriad of machines I could use=
 for it
>> as well, but I see no reason for a contrib branch to be hard to get,
>> so I'm waiting
>> for the moment and focusing on getting some kernel work done.
>
> I also have a dislike of github. Are you after access to
> openembedded-core-contrib? I can sort that out...

That's exactly what I'm after! Then I can effectively push my branches out =
to
where they are most useful.

Cheers,

Bruce

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
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


