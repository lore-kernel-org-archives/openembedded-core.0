Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3586D728;
	Tue, 22 Oct 2019 03:37:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 20:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="397540877"
Received: from letran2-mobl1.ccr.corp.intel.com (HELO shodan.localnet)
	([10.255.188.9])
	by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2019 20:37:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: tsc@openembedded.org
Date: Tue, 22 Oct 2019 15:58:01 +1300
Message-ID: <2219983.xumYRnS6VQ@shodan>
Organization: Intel Corporation
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: OpenEmbedded TSC Meeting Minutes 2019-10-21
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
X-List-Received-Date: Tue, 22 Oct 2019 03:37:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

OpenEmbedded Technical Steering Committee (TSC) Meeting Minutes 2019-10-21
==========================================================================

Meeting was held in #oe-tsc on Freenode; channel access public.

Present:
- Richard Purdie (RP)
- Joshua Watt (JPEW)
- Martin Jansa (JaMa)
- Bruce Ashfield (zeddii)
- Paul Eggleton (bluelightning)

Summary:
- yocto-X.Y tags will be added to the bitbake and openembedded-core repos (after the upcoming 3.0 release) to make release revisions easier to find
- YYYY-MM.X-CODENAME tags will replace YYYY-MM tags going forward in the openembedded-core repo (again, after the 3.0 release)
- Brief discussion of how to better deal with compatibility issues when upgrading to new releases [further discussion/thought probably needed, feedback welcome]



Full meeting log
----------------

[10:00:20] <RP>	Meeting time?
[10:00:24] <JPEW>	Yep
[10:00:27] <RP>	and zeddii appears!
[10:00:42] 	 * JaMa waves
[10:00:56] 	 * RP nudges bluelightning
[10:01:08] <RP>	hi JaMa
[10:01:42] <RP>	We've done spectacularly badly at getting started with these meetings but we might just manage it today!
[10:01:49] 	 * bluelightning waves back
[10:01:59] <RP>	All present!
[10:02:01] <bluelightning>	in keeping with history then :D
[10:02:41] <RP>	first order of business, is anyone in particular driving? How do we want to handle things like minutes and so on?
[10:02:59] <JPEW>	Is the chat history recorded?
[10:03:13] <bluelightning>	my client records it automatically
[10:03:15] <JPEW>	I think someone suggested using that as the minutes
[10:03:20] <bluelightning>	maybe I can do minutes?
[10:03:35] <JaMa>	and should we ping #oe, #yocto if anyone from community wants to join us (we don't have many topis anyway)
[10:03:46] <RP>	I'm fine with having the log, if we want to publish that?
[10:03:59] <bluelightning>	I believe we always did previously
[10:04:00] <RP>	JaMa: good question - do we want to have a public or private meeting?
[10:04:30] <JPEW>	I'm fine with public
[10:04:32] <RP>	bluelightning: fine, I guess I just want to check we're all on the same page
[10:04:45] <RP>	meeting here or switch to #oe
[10:04:53] <RP>	(?)
[10:05:05] <JaMa>	remembering my days not in TSC I would prefer public meeting
[10:05:36] <JaMa>	here might be better, so that bluelightning doesn't need to filter the minutes from random messages not related to the meeting
[10:05:44] <bluelightning>	yes, that would be preferred
[10:05:57] <RP>	ok
[10:05:59] <JPEW>	ok
[10:06:00] <bluelightning>	so I guess that means we can go and solicit others to join if they want
[10:06:41] <RP>	ok, who wants to do that?
[10:06:44] <bluelightning>	I'll do it
[10:06:59] <JaMa>	RP: is the thing you mentioned in e-mail for public discussion now?
[10:07:16] <bluelightning>	done
[10:07:31] <RP>	JaMa: no, not yet
[10:07:36] <RP>	JaMa: will be later this week
[10:07:45] <RP>	so I guess that is off the agenda now
[10:07:51] <JaMa>	ok
[10:08:10] <JPEW>	Do we want to meet regularly? I find it easier to schedule.
[10:08:41] 	 * bluelightning would like a regularly scheduled meeting, even if it's a while between each one
[10:08:43] <RP>	JPEW: this depends a lot on whether the TSC has things it needs to do
[10:09:47] 	 * JaMa agrees with RP
[10:09:55] <RP>	The geos for the TSC make timing hard and I'm struggling with the evening slots :(
[10:10:13] <RP>	I admit I had forgotten again this week but I cancelled stuff and forced this on
[10:10:36] <RP>	I have changed calendars and things to try and remind me better in future
[10:11:02] <JaMa>	we should be able to discuss at least some more urgent topics over e-mail where geos don't hurt us
[10:11:21] <RP>	I guess I've not pushed for a TSC meeting for a while as I haven't been too upset with where things have been at. We have new people and I'd like to understand what input they may want to have though
[10:11:56] <RP>	OE-Core release tagging is the one topic I'm aware of (and was asked to raise)
[10:12:19] <JaMa>	I'm interested in 3.1 codename :)
[10:12:49] <RP>	JaMa: I am torn on that. I have a proposed scheme but not sure I like it or not
[10:13:25] <JaMa>	is that only for you or Yocto TSC to decide the scheme?
[10:14:28] <RP>	JaMa: The YP structure technically means the TSC can overrule me on anything
[10:14:40] <RP>	Although OE-Core and Bitbake remain the remit of this TSC, not YP
[10:14:57] <RP>	I only serve as the maintainer of those under appointment by the OE TSC
[10:15:29] <RP>	I'd regard the scheme as a perk of the job though
[10:16:34] <JPEW>	What tags would be used in OE-core?
[10:16:40] 	 * RP feels he's doing too much talking :/
[10:17:35] <RP>	JPEW: the contentious issue is the "yocto-3.0" tags that get pushed to most repos at release time. OE-Core and Bitbake don't get these as they were never "yocto" owned
[10:18:21] <RP>	There were worries about confusing version numbers but I think that issue is present regardless
[10:18:45] <JPEW>	Whats the confusion?
[10:18:49] <RP>	Personally, I think that since the tag is namespaced to "yocto-XXXX", it should be ok
[10:19:24] <RP>	JPEW: Previously when the TSC discussed this they decided a YYYY-MM format was appropriate for OE
[10:19:32] <RP>	and bitbake has its own version number
[10:19:50] <RP>	I'd suggest we continue to have those but also add the yocto-XXX tags
[10:20:00] <RP>	tags are pretty low cost and do help users
[10:20:18] 	 * bluelightning agrees, FWIW
[10:20:20] <JaMa>	RP: I don't have issues with these tags even in "OE" repositories, I always use "Yocto X.Y Codename" when talking about releases anyway (so that people don't need to google https://wiki.yoctoproject.org/wiki/Releases to find out which one is that)
[10:20:21] <RP>	The world has changed a lot since this was last discussed
[10:20:30] <JPEW>	Ya, having tags is certainly better than not having them at all
[10:20:55] <JPEW>	I don't really have a problem with yocto- tags in OE
[10:21:42] <RP>	It was once a contentious issue, I think its probably fine now. What I didn't want to do was break TSC decisions without a discussion
[10:22:03] <RP>	Sounds like we're in agreement we should add the yocto-XXX tags and be consistent with that for user benefit
[10:22:06] <JPEW>	I think they are probably the most useful tags we could add, and adding the dated tags on top doesn't really to add a whole lot of benefit
[10:22:08] <RP>	zeddii: your view?
[10:22:39] <zeddii>	no issues with both types of tags.
[10:23:09] <RP>	What I do suggest we block is the plain 2.8_M1 tags
[10:23:21] <RP>	in fact I'd strongly recommend Yocto fix those ;-)
[10:23:31] 	 * RP notes to beat another TSC up about that
[10:23:33] <JaMa>	as we're already changing this, would it make sense to include the codename in YYYY-MM tags? e.g. "2019-10-zeus" and "yocto-3.0" tags next to each other would make it pretty clear
[10:24:04] <bluelightning>	yep, I can't see the milestone tags being useful
[10:24:46] <bluelightning>	also in favour of codename-in-OE-tag if there was no previously established reason to exclude them (can't recall)
[10:24:51] <RP>	bluelightning: in the form yocto-2.8~M1 maybe but not in their current form
[10:25:17] <RP>	bluelightning, JaMa: replacing YYYY-MM tags or in addition to?
[10:25:28] <JaMa>	RP: replacing IMHO
[10:26:23] <RP>	I did give an ack to adding 2019-10.1 and so on for point releases btw. Seemed odd not to tag point releases in OE-core
[10:26:54] <JaMa>	can we get some statistics from git server for fetching the tags (or even tarballs/zips from tags)?
[10:27:12] <RP>	JaMa: doubt it given the way the server is today :(
[10:27:16] <bluelightning>	IIRC Michael said it's really hard to get that kind of info
[10:27:42] <RP>	near impossible due to the way it works. its why github and friends have a custom server iirc
[10:27:44] <bluelightning>	in any case anyone can just check out the tag locally with no communication to the server
[10:28:37] <JaMa>	OK, I just wonder how many "users" are actually interested in these tags, I usually recommend to just use latest revisions in the compatible branches for given release, so I barely ever look at the actual tags
[10:28:49] <RP>	FWIW I've already been pushing for changes to the yocto release process/notes a bit. I can build on this with the above info
[10:29:12] <RP>	JaMa: the use we push for is exactly that, latest in the branch they're using
[10:29:30] <RP>	JaMa: Yocto release process still tries to revolve around tarballs
[10:29:38] 	 * RP buries head in hands
[10:30:51] <RP>	I guess I'm volunteering to take this decision to Vineela and release engineering to change/improve the processes there.
[10:30:59] <RP>	Any further discussion on that topic?
[10:31:14] <bluelightning>	RP: thanks
[10:31:35] <JPEW>	To summarize: There will now be YYYY-MM tags and yocto-X.Y tags in OE-core?
[10:32:02] <bluelightning>	did we agree on YYYY-MM-<codename> ?
[10:32:04] <RP>	YYYY-MM.X-CODENAME and yocto-X.Y
[10:32:08] <JaMa>	and uninative-X.Y
[10:32:17] <JPEW>	Ok, sounds good
[10:32:29] <bluelightning>	and of course yocto-X.Y in the bitbake repo as well
[10:32:33] <RP>	good point, uninative is already there and I think continues to make sense.
[10:32:56] <JaMa>	will make even more sense now as it's already using Yocto version numbers in oe-core repo
[10:33:19] <RP>	JaMa: uninative has its own numbers, its not YP numbers
[10:33:27] <RP>	just happen to be similar :/
[10:33:27] <JaMa>	aha, sorry
[10:33:39] <RP>	but they are clearly namespaced
[10:34:07] <JaMa>	should these tags be added retroactively?
[10:34:24] <RP>	If someone wanted to I'd not stop them?
[10:34:52] <JaMa>	I will check if I still have cow powers to do that and if not send you list of git commands to run?
[10:35:03] <RP>	JaMa: sounds good!
[10:35:05] <RP>	thanks
[10:35:29] <JaMa>	ok will do after tags for zeus/3.0 appear
[10:36:11] <RP>	I'll not upset the 3.0 release by trying to change this just before the release, we can sort afterwards
[10:36:11] <JaMa>	looks like 2017-04 is already missing, will find matching commit in poky and add that as well
[10:36:38] <JaMa>	ok
[10:36:40] <RP>	JaMa: easy way to find the refs is to look at the yocto releases directory on downloads btw
[10:37:14] <RP>	e.g. http://downloads.yoctoproject.org/releases/yocto/yocto-2.6.3/ has the hashes
[10:37:40] <RP>	(as do the releasenotes)
[10:37:56] <RP>	Ok, any other topics for discussion?
[10:37:59] <JaMa>	ok, I see, I'll first confirm if it matches with existing YYYY-MM tags exactly
[10:38:28] <RP>	I'd like to note that the YP TSC has put together some discussion about LTS. That should be made public sometime this week before ELC-E.
[10:39:11] <JPEW>	I don't have anything else for today (and, I only have 45 minutes in this timeslot, so I have to be done anyway).
[10:39:50] <RP>	FWIW I see it as a sign we got some things right that the OE TSC hasn't needed to meet for a while
[10:40:03] <bluelightning>	I'd be surprised if this was the only thing we needed to talk about after such a long time without a meeting...
[10:40:03] <JaMa>	we (LGE) are strugling to upgrade to new release more often (much to my displeasure), so alligning our upgrades to LTS release will definitely help
[10:40:27] <RP>	bluelightning: you have other topics?
[10:40:31] <bluelightning>	JaMa: it would be interesting to hear a summary of what the biggest pains are with upgrades (ditto for anyone else)
[10:40:37] <JaMa>	I can ask about whitespace consistency if you want some flame? :)
[10:40:46] <RP>	What I've pushed for is for general discussion to happen on the lists
[10:41:10] <bluelightning>	RP: I have a couple in mnd but one is more of a Michael/infrastructure issue and the other is probably best done over email (links to upstream changelogs)
[10:41:16] <RP>	The TSC should only really be needed as a decision maker in case we can't reach a community consensus
[10:41:31] <JPEW>	JaMa: Always use spaces to left justify at 80 columns.
[10:41:39] <JPEW>	Err, right justify :)
[10:42:01] <JaMa>	bluelightning: the biggest part are binary components from different departments or other companies which are in some cases really expensive to get rebuilt against new ABIs from new release
[10:42:16] <bluelightning>	JaMa: right
[10:42:19] <JPEW>	Ya, that bites us too
[10:42:43] <RP>	It may be useful if we could understand which ABIs are the important ones (if there are specific ones)
[10:42:49] <JaMa>	so I have all the changes for new release ready for year or 2, but waiting for someone to agree to pay for new binaries
[10:43:28] <JaMa>	e.g. openssl-1.0/1.1 is used in 90% prebuilt binaries we use
[10:43:50] <JaMa>	so now we're using Thud still with openssl-1.0
[10:44:40] <JPEW>	Alright, I have to leave. Thanks everyone.
[10:44:48] <RP>	JPEW: thanks!
[10:45:09] <JaMa>	we have various scripts which match prebuilt binaries using changed ABIs based on abi-checker scripts, but it's still very inaccurate and in the end marks most of prebuilt binaries as incompatible
[10:47:06] <RP>	JaMa: I hadn't realised this was a particular pain point so its helpful. I don't think the project could avoid moving to newer openssl and we did have a compatibility story to a point but I wonder if a compat layer for 1.0 might have helped?
[10:47:43] <Crofton|work>	fray may have done such a thing ...
[10:49:09] <JaMa>	RP: the issue was that you cannot pull both 1.1 and 1.0 into the image, so you had to select either one and stick with it for all components, otherwise you get conflicts in RSS in build time and segfaults in runtime
[10:49:50] <RP>	JaMa: only if a binary has libraries which link against both. But yes, that is a pain
[10:50:34] <JaMa>	RP: in this specific case it was even worse, because Qt 5.6 is last with LGPLv2 licensing and merging backported ssl-1.1 support to 5.6 branch was rejected by upstream and doing it on our own violates the license
[10:51:00] <RP>	JaMa: right, I was remembering your Qt issues :(
[10:51:03] <JaMa>	RP: and commercial license for newer Qt if you cannot (or don't want to) use LGPLv3 for whatever reasons is really not cheap :)
[10:51:09] <RP>	JaMa: not sure we could do much more :(
[10:51:35] <RP>	definitely something to be mindful off though
[10:52:04] <JaMa>	yes, this isn't OE/Yocto issue and there wasn't anything to do from that side (maybe other than documenting that this is an issou you might need to deal with when upgrading)
[10:52:58] <RP>	JaMa: just trying to figure out what if anything we could/shouldn't be doing in future
[10:52:59] <JaMa>	but as of today we've finally published webOS OSE with Qt 5.12 so I was able to finally upgrade openssl at least in this build :)
[10:53:13] <RP>	nice :)
[10:53:26] <RP>	ok, any other topics?
[10:53:34] <JaMa>	nothing from me
[10:54:41] <Crofton|work>	Can you guys remind the board when you have meetings
[10:54:45] <RP>	zeddii: you're very quiet :)
[10:54:47] <Crofton|work>	and feel free to mute people
[10:55:16] <RP>	Crofton|work: remind in what way?
[10:55:26] 	 * bluelightning is done, thanks
[10:55:35] <Crofton|work>	let us know when hey are
[10:55:43] <Crofton|work>	just bcc board@oe.org
[10:56:20] <RP>	Crofton|work: ok. we have enough trouble organising ourselves mind ;-)
[10:56:39] <RP>	We should perhaps agree when our next meeting is?
[10:56:49] <Crofton|work>	no worries
[10:56:49] <RP>	probably not next week given ELC-E
[10:57:03] <Crofton|work> I also wish you had looked over the OEDEM agenda
[10:57:13] <Crofton|work> and R P you should add some project update
[10:57:36] <RP> Crofton|work: yes, probably


-- 
Paul Eggleton
Intel System Software Products



