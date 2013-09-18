Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5E31C610F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 20:52:22 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ha12so5985803vcb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7kvQyfDADeaai/epPUI10ZEdXVl5cDA3KBrhCsbf2yo=;
	b=AeXnmEjRx8iULbyk6tXTDXOHL6ijLOjQrf4uL7zrQZK4shFVuZ2VUU/7BeiS8GMjE6
	8i+Pbnka0zvFS4piAlAedNQwk75YFUoOKFPrZ4ZaIQNDD/7gIWkwj9nAwRBKp2pCFEmz
	ugLB66lYEtNmchDrfm0HiFt4NUtO7qi3WhB3M5xK/Ttc4Js+8U/QoEslXvq1ZFlOPxMU
	bXZ/q5azbSe6hYeHYpzZFEpzYDcySxJ2j1rT+QKX6QJDlbVBgxUDmkByfA3acgKSW8H0
	7jFPZjyB+JAnHKgdX/YBv4odCERMAqDiz102TeRuU6eVVN9LA6Ghr09tUZO9rM8BIDVh
	65jA==
X-Received: by 10.52.24.4 with SMTP id q4mr1653735vdf.34.1379537543454; Wed,
	18 Sep 2013 13:52:23 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Wed, 18 Sep 2013 13:51:43 -0700 (PDT)
In-Reply-To: <1379536390.18603.61.camel@ted>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
	<CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
	<1379522909.18603.52.camel@ted>
	<CANyK_8fotVWZMkFO5kMJ_GFjGT2O79TsOWrCQV5Xez+rgdKbMg@mail.gmail.com>
	<1379536390.18603.61.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 21:51:43 +0100
X-Google-Sender-Auth: b_FnxsqM17dglLiSsbdagJutfpo
Message-ID: <CANyK_8c+nA-=Pk3QD-QQfoJ8GwqFOmfyzZMPy0Z3nO9_mshHJw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2013 20:52:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 September 2013 21:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-18 at 18:24 +0100, Paul Barker wrote:
>> On 18 September 2013 17:48, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> I'd rather have opkg and opkg-utils merged together or next to each
>> other on the same server if/when I move opkg to git. I think
>> OpenEmbedded/Yocto is probably the main user of opkg but there are
>> others and they'd also benefit from opkg-utils, so having everything
>> in one place would make them easier to find.
>>
>> My personal preference would be to move opkg and opkg-utils to
>> Bitbucket/Github/similar, probably merged together, with at least one
>> of the core developers from the Yocto Project having admin access to
>> the repositories so that the bus factor is greater than 1.
>
> FWIW, personally I dislike some of those services as they can be
> temperamental and with some of them, I can't actually get a view of the
> code in the repos as well as when I'm used to with cgit. I know others
> have different preferences, its just life...

I've not had much problems myself but I'll take your word on that. I'm
used to both bitbucket and cgit, don't really have a preference
between the two.

>
>>  I know I
>> could probably ask for opkg to be hosted on git.yoctoproject.org but I
>> think that would make non-Yocto Project users feel a little bit too
>> much like second-class citizens.
>
> The Yocto Project is there to be an umbrella for projects serving the
> needs of embedded users. Pseudo is an example of something which can be
> used standalone, yet it is hosted on the YP servers.
>
> I'd say that opkg would fit under the umbrella and that we'd be more
> than happy to host the repo if that was appropriate so the offer is
> there.
>
> Having more varied projects in the umbrella would actually help people
> understand what the Yocto Project is verses OpenEmbedded (the build
> system/architecture) and Poky (reference distro). We already have others
> like eglibc in there but that should be merging back with glibc,
> thankfully! :)

I'll admit to not fully realising that distinction myself as I've
mostly been looking at OpenEmbedded. If the Yocto Project is more of
an umbrella then yes, opkg probably would fit well within that. I'll
have a think what opkg would need and then get back to you. It would
certainly alleviate the question of what happens to the repository if
I were to disappear. None of us even have full 'owner' access to the
google group opkg-devel as I haven't been able to get hold of the
original opkg creator!

>
>> I want to avoid flag days where possible, at least one will be needed
>> for the libopkg API but hopefully not for the command line interface
>> or package format.
>
> The API has the .so version and can be managed. The package format  in
> particular need most careful attention.
>

Agreed.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

