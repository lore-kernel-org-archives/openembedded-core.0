Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED5A73E20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IABRQg030467; Tue, 18 Aug 2015 11:11:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RAL0bceo9kVL; Tue, 18 Aug 2015 11:11:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IABBqk030464
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 18 Aug 2015 11:11:23 +0100
Message-ID: <1439892671.12105.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Aug 2015 11:11:11 +0100
In-Reply-To: <20150818090328.GG2458@jama>
References: <55C477AE.8030308@balister.org>
	<55C4A405.6050209@linux.intel.com> <55C637DB.9010106@balister.org>
	<55C8956D.9080508@linux.intel.com> <55C8F83F.4010003@balister.org>
	<55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
	<55CC588E.6030200@balister.org> <20150818090328.GG2458@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 18 Aug 2015 10:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-18 at 11:03 +0200, Martin Jansa wrote:
> On Thu, Aug 13, 2015 at 10:42:54AM +0200, Philip Balister wrote:
> > On 08/11/2015 10:46 PM, Otavio Salvador wrote:
> > > On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > >>
> > >> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
> > >>>
> > >>> can we freeze this thread please.
> > >>
> > >>
> > >> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
> > >> someone on this list asks what Poky is, 99% of the time they're trolling.
> > >> :)
> > >>
> > >> The original and unanswered question was "should oe-core continue to
> > >> maintain GPLv2 recipes where upstream has moved to GPLv3 or should those
> > >> recipes move to a standalone layer" with various implied questions:
> > >>
> > >> - If the v2 recipes move to a separate layer, who own/maintains/tests it?
> > >> - Should there be v2 recipes for every recipe that has moved to v3, or only
> > >> (as is now) the "more-core" recipes (currently YP tests that core-image-base
> > >> builds without GPLv3, nothing else more complicated)
> > >> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If
> > >> other layers decide to hold both v3 and v2 recipes (not that I'm aware any
> > >> have), what makes oe-core special?
> > >>
> > >> I'm torn, Richard is torn.  Neither of those are useful to forming a
> > >> decision.  Does anyone else have any *useful* feedback?
> > > 
> > > I think it is a matter of resource usage.
> > > 
> > > Up to now, the GPLv2 maintenance has not been so hard and thus I would
> > > say for us to stay as is for now. We should revisit this for every
> > > release and review if it is time for split it or not.
> > > 
> > 
> > This would be a good time to remind us who the audience is for the gplv2
> > recipes so we understand the amount of manpower behind their maintenance.
> > 
> > My concern keeping then in core is that the commnunity who uses them
> > will reduce over time and they will bitrot. If that happens, we should
> > create a layer for them and remove them from core.
> 
> It's still better to let them bitrot collectively in central layer than
> every OE user with this requirement maintaining old GPLv2 recipes in own
> layers and re-inventing the workarounds needed to build the rest of the
> system with latest upstream layers.

I don't think anyone is suggesting we just abandon the idea and force
everyone to do this individually. The question is more about whether it
still makes sense to have the GPLv2 recipes in OE-Core or a separate
layer. It does also raise questions of scope, there are GPLv2 recipes
which OE-Core doesn't have and are not part of its stated policy (e.g.
screen being the current example).

I do think its right to ask these questions although I'm still undecided
about what the best solution is...

Cheers,

Richard



