Return-Path: <belen.barros.pena@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 39DB36067D;
	Wed,  2 Dec 2015 10:54:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2015 02:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,372,1444719600"; d="scan'208";a="611214311"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2015 02:54:50 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.163]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.236]) with mapi id
	14.03.0248.002; Wed, 2 Dec 2015 10:54:48 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] Patchwork & patch handling improvements
Thread-Index: AQHRLNnW1sSqAErXnUuHUaQDB1Le9J63hgSA
Date: Wed, 2 Dec 2015 10:54:48 +0000
Message-ID: <D2847D54.6BF8A%belen.barros.pena@intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
In-Reply-To: <20151202081713.GA2248@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.5.8.151023
x-originating-ip: [10.237.224.34]
MIME-Version: 1.0
Cc: "Lespiau, Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 10:54:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B5BB727137B2A41B990F4CBFDA47780@intel.com>
Content-Transfer-Encoding: quoted-printable



On 02/12/2015 08:17, "openembedded-core-bounces@lists.openembedded.org on
behalf of Martin Jansa" <openembedded-core-bounces@lists.openembedded.org
on behalf of martin.jansa@gmail.com> wrote:

>On Wed, Dec 02, 2015 at 04:01:40PM +1300, Paul Eggleton wrote:
>> On Tue, 01 Dec 2015 11:47:20 Martin Jansa wrote:
>> > On Tue, Dec 01, 2015 at 07:49:50AM +1300, Paul Eggleton wrote:
>> > > Hi Trevor,
>> > >=20
>> > > On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
>> > > > On 11/26/15 16:00, Paul Eggleton wrote:
>> > > > > I'm also
>> > > > > trying to ensure that the patch validation is generic enough so
>>it can
>> > > > > live in OE-Core, and thus we can easily update and refine it
>>over time
>> > > > > in
>> > > > > line with the code itself as well as encourage submitters to
>>use the
>> > > > > script on their own changes before sending.
>> > > >=20
>> > > > This all sounds like an improvement and is therefore a step in
>>the right
>> > > > direction :-)
>> > > >=20
>> > > > A while back I had the idea of "porting" the kernel's
>>"checkpatch.pl" to
>> > > > The Yocto Project (it was around the same time that I was trying
>>to
>> > > > float the whole "Maintainers File" idea too, since I was also
>>trying to
>> > > > re-purpose "get-maintainer.pl" as well). About one minute into
>>that
>> > > > effort I realized the existing *.bb files were all over the place
>>in
>> > > > terms of the order of statements and the order of the blocks of
>> > > > statements. At that time I found one recipe style guide from OE,
>>and
>> > > > another one from The Yocto Project, each of which described a
>>slightly
>> > > > different preference. So I asked on the mailing list and quickly
>> > > > discovered that both groups prefer a different style.
>> > > >=20
>> > > > I'm not saying this job isn't worth doing, but I am pointing out
>>there's
>> > > > the potential for feathers to be ruffled on both sides if someone
>>tries
>> > > > to produce a definitive style guide for recipe files and then
>>enforces
>> > > > it in an automated way. Since it is the OpenEmbedded Project's
>>job to
>> > > > provide the recipes for The Yocto Project, I'm guessing this
>>question
>> > > > needs to be decided by them? If that sounds reasonable, then
>>maybe The
>> > > > Yocto Project needs to acquiesce to OE's decision?
>> > >=20
>> > > I don't think there's that much of a division. I don't recall if it
>>was
>> > > you
>> > > that raised it at the time but the issue of having two style guides
>>did
>> > > get
>> > > rectified - I changed the one on the Yocto Project wiki to simply
>>be a
>> > > link to the OE style guide in June last year. It certainly didn't
>>come
>> > > about through a conscious decision to have a different style.
>> > >=20
>> > > However there is a minor disagreement over indentation for shell
>>functions
>> > > between OE-Core and other layers - this persists because of the
>> > > backporting
>> > > pain a blanket replacement would potentially lead to. As I recall
>>this did
>> > > get discussed at the OE TSC level. I think that's one thing we
>>could just
>> > > not evaluate (or make an option) until such time as we resolve the
>> > > difference - and I do mean to see it resolved at some point in the
>> > > future.
>> >=20
>> > Using consistent indentation (4 spaces) at least for new metadata
>>would
>> > be step in right direction.
>> >=20
>> > With the amount of changes which are backported to older releases I
>> > still don't see this "backporting pain" argument. Doing it just before
>> > the release is of course useful, because e.g. now more changes will be
>> > backported to Jethro than to Fido or Dizzy. So having consistent
>> > indentation in Jethro and master would prevent 95% of "backporting
>> > pain". Maybe some Yocto 10.0 will finally get the meaning of
>> > "consistent" indentation.
>>=20
>> I agree it's not ideal. I said above, I do want to see it resolved.
>>=20
>> Leaving indentation aside for a moment do you have any comments on my
>> proposal?
>
>I'm not familiar with FDO fork, so I don't know how it looks and
>behaves,

This is how it looks like currently

http://patchwork.freedesktop.org/project/intel-gfx/patches/

> but any improvement on patchwork side is definitely welcome and
>I appreciate it.
>
>Does it support e.g. moving the patches to given bundle based on some
>substring in subject? To sort e.g. meta-networking, meta-java,
>meta-browser, .. patches automatically?

Mmm, you might not like this, but we are thinking of getting rid of
bundles. Basically, we assumed bundles were a manual way of creating patch
series. The new Patchwork can identify series, so we thought: great!
Bundles no longer needed.

There are other features been considered that might be an alternative to
bundles, like tagging


>
>I don't expect FDO fork to provide other features I'm used to from
>gerrit like cherry-picking to selected branch from the UI or doing the
>review there. But still if we're stuck with patchwork forever (because
>some people hate gerrit), then any improvement is really appreciated,
>thanks for looking into it.
>
>My only concern is about migrating current database, do you know if the
>migration will keep the database including bundles as they are or do you
>plan to set FDO version in parallel at least for some transition period?
>Currently I have many patches in flight, because jenkins is running full
>test-dependencies job for last 11 and based on progress it will take
>14-21 more days to finish.
>
>Regards,
>
>--=20
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


