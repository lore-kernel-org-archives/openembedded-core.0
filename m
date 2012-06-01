Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SaY7H-0000Zp-RK; Fri, 01 Jun 2012 22:06:36 +0200
Received: by ggnp4 with SMTP id p4so2133642ggn.6
	for <multiple recipients>; Fri, 01 Jun 2012 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=U2t9KPH/j72xUjYtD3kcWPHrMji+cc1XmdPywv81zLY=;
	b=0ABBHdvZ1JDSM3u++nqkz9Zv/kt78Pqh3w5QsfXlrsDEA40wNrgaeVsnkLJCcpV042
	JybANOAgS9jLh+ukzBUeDYP1dREp3zv9V7RcHdMfnTpzmNBRvAzKd66mZ22xLVYExX40
	OEpnAZeh7jvo6uAWxj7Zf1wiJen+aggurIDonp3fsH/e3AVZ2x/UNeEbBqtrV1lS2RvU
	oeSAmJqgy4w7VlEgdsbmsayNFoN9zNxQne8NLb9Q9248iegdSjipAftz8fYZNeBiVfX8
	K1QrXliBjNIcIoRXPe7OqPYU2uBUkHtzoGZYJeVKsH+wVQCAPsyJOZlZM0a8PCF5zRzK
	EOsA==
MIME-Version: 1.0
Received: by 10.42.41.11 with SMTP id n11mr2807481ice.13.1338580573588; Fri,
	01 Jun 2012 12:56:13 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.15.70 with HTTP; Fri, 1 Jun 2012 12:56:13 -0700 (PDT)
Date: Fri, 1 Jun 2012 12:56:13 -0700
X-Google-Sender-Auth: Q0DBU475t3HASgDSg12dBo-bx3M
Message-ID: <CA+YB3rYsA1W_K6oo0s_yrKKyePDqU01LoPRBiRBgdP_t8PMQhg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 22 May 2012
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
X-List-Received-Date: Fri, 01 Jun 2012 20:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
22 May 2012

Attending:
 Richard Purdie (RP)
 Paul Eggleton (bluelightning)
 Mark Hatle (fray)
 Koen Kooi (koen)
 Khem (khem)

Minutes: Jefro (Jefro)

________________________________________________
Agenda & Summary

1. pick a chair
 -> khem

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
   goal to have initial janitor communication with OE list end of May
 => still on Mark's to-do list

 b. discuss communication with OE community about release-oriented phases
    fray willing to manage page as TSC activity, create wiki when appropriate
    future agenda: document release process

 c. pre/post install scripting (fray)
    long term goal, lower priority
        fray working on update-alternatives

3. new issues

 a. build history
   repo master log at http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/
       people to run before and after with buildhistory as part of the QA
for the change
         for changes to the core classes or bitbake.conf
       Paul wrote wiki page at https://wiki.yoctoproject.org/wiki/Buildhistory
 => Paul to announce to mailing list

 b. systemd
       addition of systemd to meta-oe problematic
       suggest learn from this and ensure that such features are
developed in layers
         or against the core in a branch in future
       need patches to improve situation, not who-did-what
       on the agenda for the Yocto Project to look at it in the 1.3 timeframe
   from OE-Core, make initscripts virtuals (like C library) so plug & play
         exact mechanism TBD
       Paul suggests an "init" class which conditionally pulls in systemd /
init.d classes
         distro flag
         provide stop gap and meanwhile its worked out to live in OE-Core
 =>       discuss on mailing list (RP)

4. status

   Should we still support separation of / and /usr?
     reference http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge
     watch oe-core users, osvs, community in general
   devshell to re-run or debug python run file chunks
     fray: would be nice addition
 =>   khem to file enhancement request for python devshell
   code to account for the checksums of file:// urls in sstate checksums
     landing soon, nice improvement (RP), running tests on it (Paul)
   switch back to glibc once eglibc changes merged in (khem)
       update-alternatives (fray)

 a. oe-core release
       Scott is aware of the issues and trying to figure out a review
process for the stable branch
       there will be discussion on the list about that and how to
review the patches

 b. elections
 => remove from this list, put back when needed - Jefro to find out when that is

 c. infrastructure
       Tom K needs to upgrade servers to 12.04 LTS, some downtime coming soon
       mailing list issue (koen) - board is coping with it, keep on agenda

key:
=> action item (indented = older or remaining from prior meetings)
-> note from prior meetings

________________________________________________
Raw Transcript


<Jefro> good lord everyone is here. apocalypse?
<bluelightning> hi all
<fray> Koen only one left right?
<fray> or is he lurking?
<koen> I'm here
<fray> wow.. everyone is here..
<Jefro> we should have a party
<Jefro> agenda in 1 min
<koen> can we put the oe-core release branch on there again?
<Jefro> koen ok
<Jefro> actually it is there as a status item
<fray> well, I can shortcut and mention that I havn't gotten to the
janitor task yet..  it's still on my 'todo' list..
<fray> along w/ the wiki project status..
<RP__> ok, any other agenda items
<RP__> ?
<khem> I dont have anything to add to agenda
* RP__ doesn't have much this week
<Jefro> http://pastebin.com/W9mDqgFY
<khem> ok
<Jefro> tea - back in 30 sec, please converse amongst yourselves
<khem> Jefro one for me too plz :)
<bluelightning> I'd like to add systemd to the list
<khem> yes I was thinking
<RP__> ok, who wants to chair?
<khem> I can
<RP__> khem: go for it
<koen> bluelightning: just have windriver fork it
<khem> alright here we go
<bluelightning> koen: funny
<khem> Lingering issues
<fray> well, I can shortcut and mention that I havn't gotten to the
janitor task yet..  it's still on my 'todo' list..
<fray> :)
<bluelightning> koen: it's not about systemd itself, it's how we integrate it
<khem> Janitor list,QA bugs
<fray> I expect to get to it by end of may still
<fray> same w/ 2b...
<koen> bluelightning: yes, have windriver for the layer and host that
fork on the yocto server
<khem> fray: IIRC you volunteered to some ml activity on this
<koen> bluelightning: oh wait, that already happened
<fray> khem, ya.. thats part of it..
<khem> fray: pre/post install scripts ?
<khem> that 2c.
<fray> this item was a light topic long standing.. does anyone have
any pre/post install we should be capturing and planning for
resolution on via more automated techniques..
<fray> i.e. the update-alternatives
<RP__> I think current work on things like update-alternatives is
being done which might lead to 2c
<fray> update-rc is the only other thing I've seen recently.. that
seems to be done manually in many places..
<khem> RP__: who is working on it ?
<bluelightning> koen: yes well we probably ought to find out what
those guys are doing because I have no idea
<fray> I'm working on the update-alternatives change..
<koen> bluelightning: you can see why I have zero motivation to be helpfull?
<khem> ok. So we should keep it on topic and probably obtain  more feedback ?
<khem> koen: :).
<bluelightning> koen: not really no
<khem> systemd is on agenda lets wait a while
<RP__> agreed, lets follow the agenda please
<khem> anyone likes to add anything to 2c ?
<RP__> we can behave like children when we get to systemd
* koen (~koen@cl-267.ams-05.nl.sixxs.net) has left #oe-tsc
<khem> ok, lets move on
<fray> for 3. new issues.. one minor question, does the Yocto Project
builders store buildhistory information somewhere?
<fray> I've recently started using build history and was wondering if
there is anything oe-core specific I can compare what I have against..
<RP__> fray: there is a repository master logs things into
<khem> yeah I guess adding build history info there would be nice
<RP__> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/
<bluelightning> it's getting rather large by now though :(
<fray> ok..  I found Angstroms, but I didn't find that one when I
looked earlier (via google)
<khem> bluelightning: can it be made a circular buffer
<khem> kind
<bluelightning> khem: well, it's git... so it could but hashes would change
<khem> hmm ok
<bluelightning> we're stepping off the agenda again sorry
<khem> no we are not
<RP__> khem: We can always prune off history if we wanted to
<khem> we are on 3. new issues
<fray> ya..  I'm trying to figure out for more complex changes if
there would be a benefit of asking people to run before and after with
buildhistory as part of the QA for the change
<bluelightning> oh ok sorry,
<RP__> fray: I think we're already doing that
<fray> I mean the submitters.. I haven't seen any requests for that..
but I've seen folks like you and Saul using it..
<RP__> fray: Certainly for changes to the core classes or bitbake.conf
(like the PACKAGES order change) we're asking people to do this
<fray> anyway, thats all I had in the "new"..
<khem> I think we dont have a writeup
<RP__> fray: Its something we're going to be asking more of
<khem> on buildhistory
<fray> ok...  after using it once.. it was very good and finding an
issue I didn't know I had..
<RP__> bluelightning: Did Scott write something about this?
<khem> how to use it in such a manner in day2day activities
<bluelightning> RP__: I wrote a wiki page
https://wiki.yoctoproject.org/wiki/Buildhistory and sent it to Scott
for inclusion at some point but I don't think he's got to it yet
<RP__> ok, but at least we have the wiki page :)
<RP__> bluelightning: was that mentioned on the mailing list? If not,
we should perhaps mention it (or mention it again)?
<RP__> I do think its incredibly useful
<fray> ya, good idea..
<khem> yes, I was thinking of making it so that devs use it more
regularly, how could be achieve that
<bluelightning> RP__: in passing but might be worth raising in its own thread
<fray> I knew it existed, but before yesterday I didn't know how easy
it was to work with
<RP__> bluelightning: Would you mind doing that?
<bluelightning> RP__: sure, AR taken :)
* khem sees a AR for bluelightning
<RP__> bluelightning: thanks :)
<khem> ok anything else on buildhistory
<khem> or any new issues for that matter ?
<khem> I have one and its about separation of / and /usr that we are
following some distros are actually now moving away from this theory
so I think we are having it backwards to support it
<RP__> That one is a good question
<fray> I advocate for the split for two reasons..  The first is I find
it easier to create a small bootable system if the division has
already been made, then mount the larger (remainder) of the system
later..
<fray> bootable may be initrd, may be a small partition or ....
<RP__> I've heard requests for it and there was desire to support it.
Its also not that far off working, if it doesn't basically work today
<khem> I saw that we have a lot of glue in metadata to support this
<fray> and the other is I do know of devices w/ local / and common /usr...
<fray> but I do understand, especially in light of recent comments
about kmod/udev on why people are moving away from it..
<fray> it certainly takes effort to manage...
<RP__> I think its worth trying to support, if there are people
willing to develop and maintain it
<khem> RP__: its contant maintenance it will require that I am afraid of
<RP__> If we don't have those people, it becomes a problem...
<fray> and I'm a little worried the answer to the QA warning isn't
"should we move /bin/foo to /usr/bin/foo" vs always just moving things
to /
<RP__> khem: I worry too, there are currently a number of warnings
being generated and we need to come up with a plan to address them if
we're going to continue with this
<RP__> There are a relatively small number of warnings
<fray> I see a lack of architectural guidance around the movement of
files.. but that may be because nobody understands the whole system
like they used to be able to (due to complexity)
<RP__> I also think some helper functions could simplify some of the file moves
<khem> I think as we move forward more and more packages will stop
differentiating between / and /usr
<khem> as its headed towards
<fray> well, this has always been an embedded vs "workstation" problem
in my opinion..
<khem> and this means when we upgrade packages we end up *fixing* them
all the time to meet our needs
<fray> I remember dealing with similar situations 10 years ago w/ Linux
<RP__> khem: I don't think its quite time to give up on this yet but
we need to be careful
<khem> fray: question is are we still in same situation 10 years after
<fray> khem, IMHO we're both much better and worse..
<RP__> fray: It might be worth talking to people like the udev/kmod
people and seeing if we can come up with some good patches they'd
accept
<fray> better that things seem to work way better then they used to,
but other things are now ignoring small system boot (IMHO)..
<fray> ya, I agree..
<fray> I don't want to abandone the principal yet.. but I can
certainly understand the difficulty..
<fray> (if I had time, I'd take a whack at a world build and see if I
could fix all of the existing issues.. but I don't)
<RP__> fray: we need to come up with a plan about the remaining QA warnings
<bluelightning> RP__: given that they have written at least one long
article on why it shouldn't be supported anymore I don't hold out huge
hope there
<khem> fray: yes however its something people are moving away so onus
will eventually be on us
<khem> thats what I am worried about
<fray> yes
<RP__> bluelightning: It might at least be worth trying
<RP__> bluelightning: but yes, I worry
<khem> so may be we should think more about it
<RP__> So we could conclude we have some concerns but not enough to
give up yet - something to keep watch on?
<khem> and keep it on backburner
<khem> yes
<bluelightning> for reference, the article is
http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge
<fray> yes.. we need to watch both the oe-core users, osvs and
community in general..
<khem> thx bluelightning
<RP__> bluelightning: My argument is this should be a configuration option...
<fray> if the attitude goes completely against it, we can drop it
<fray> RP__, same
<bluelightning> RP__: sure
<RP__> bluelightning: we can do combined /usr and have done long
before systemd did :)
<khem> anyone has more new issues to disucss ?
<fray> ;)
<bluelightning> RP__: indeed, I guess I was just pointing out we'll
have an uphill battle ;)
<RP__> I guess a quick poll
<khem> I think now a days people use initrd approach
<RP__> There are some changes adding variable and include tracking
into bitbake. These are being discussed on the list as they should
<RP__> They will complicate the code base but I'm leaning to taking them
<RP__> Any comments?
<khem> yes I saw the discussions
<bluelightning> RP__: it looks pretty valuable, but do we have any
idea of the speed impact?
<bluelightning> (if any)
<RP__> bluelightning: disabled by default so should be minimal unless enabled
<fray> the variable tracking is nice for the little bit I've seen it..
<khem> RP__: I think from bb pov I am more interested in adding tests
sorry its a bit tangential
<RP__> bluelightning: by default they're only used with -e
<RP__> and with -e you don't care about speed
<fray> I'm also working on a possible re-order of the temp (logging)
directory to make it easier to follow what is happening..
<khem> RP__: those patches looked good to me in general
<bluelightning> RP__: except when we call bitbake -e from scripts to
get the value of a variable (although maybe we need a better mechanism
for that anyway)
<RP__> khem: I agree, we need more of them as I'm demonstrating with
the fetcher changes which introduced regressions :(
<fray> the one complaint I've heard recently (about bb) is people
using devshell wanting to re-run or debug the python run file chunks..
<RP__> fray: I need to have a look at those patches again :)
<fray> I don't know of any way to do that.. but something there would
be a nice addition
<fray> RP__, my next task after update-alternatives.. ;)
<RP__> fray: I wonder if we could drop people to the python shell?
<RP__> In fact can someone file a bug about that - python devshell :)
<RP__> something similar to what you get when you just run "python"
<RP__> it has to be possible somehow :)
<fray> RP__, I think it would be nice if we could
<fray> anyway.. probably should move on..
<khem> I will file an enhancement request
<khem> for python devshell
<RP__> one other heads up - there is some code to account for the
checksums of file:// urls in sstate checksums
<RP__> that will likely land soon and is a really nice improvement IMO :)
<bluelightning> yes I'm just running tests on it now FYI
<khem> hmm nice
<fray> very nice when you are just having on getting a patch running right
<fray> no need to screw w/ clean or changing of the recipe's PR
<fray> BTW one limitation I noticed is that the vardeps don't cover
"flag" values..
<khem> on status. I have posted arm-hf patches and now I am working on
kconfig for eglibc
<fray> we're using more and more flag values as we do advanced things..
<RP__> fray: that is another topic we need to l;ook at and address...
<RP__> khem: I saw the patches, they seem reasonable
<khem> RP__: ok
<fray> so it's something to keep in mind.. (for the
update-alternatives I wrote something to add up the flag values and
shove it into something that is being evaluated for in vardeps)
<khem> another topic far in horizon is switch back to glibc
<khem> once eglibc changes are merged into glibc
<RP__> khem: understood, when we get there... :)
<khem> ok so anyone else has something to add to status
<khem> we talked about u-a
<khem> RP__: how is your patch and review stuff going ?
<khem> do you need help there still
<RP__> khem: I'm doing the best I can, I'm a bit behind atm and
worried about master stability
<khem> RP__: ok. I will try to help if you need some help
<RP__> khem: Help with review of code is always welcome. We've taken
in some more unstable elements recently and are suffering a little as
a result, not helped by infrastrcuture upgrades
<khem> I see yes
* RP__ was in Romania last week bring up a new team there
* khem saw the pictures with parrot
<RP__> We should get a clean build off to QA this week and know better
where we are
<RP__> khem: gah ;-)
<khem> RP__: ok, I was worried about qemu not booting into X on mips and arm
<RP__> khem: yes, these worry me too
<khem> since the kdrive->xorg is not committed yet
<khem> I wonder why
<RP__> khem: hence I want to know better where master stands before we
add more changes
<khem> RP__: ok
<khem> Release branch process
<khem> thats 4a.
<khem> Do we have something to talk about there
<RP__> So Koen asked about this but left :/
<khem> ok
<khem> I saw scott picking some patches for release branch
<RP__> I will say that Scott is aware of the issues and trying to
figure out a review process for the stable branch
<khem> ok
<RP__> so I think there will be discussion on the list about that and
how to review the patches
<RP__> So I propose giving Scott a chance to sort this out
<khem> correct
<khem> ok AR for Scott who is not here :)
<RP__> He already knows he';s doing this
<khem> Elections
<khem> Do we need to talk about it
<fray> we're election free for 6 months or did that not go through/
<khem> I think its a regular feature so lets discuss it when it comes
<khem> lets remove it from agenda
<fray> seems fine..
<Jefro> need a future reminder?
<RP__> fray: I'm pretty sure elections are not for a while now
<Jefro> or leave it up to the board?
<khem> Jefro: yes surely
<RP__> Jefro: Could you track down a date for the next election?
<RP__> Jefro: Then we can stop worrying about it until that time
<khem> yes if we can put it in calendar that way we can readd it
<Jefro> RP__ will do - I'll ask the board & will schedule it
<RP__> Jefro: thanks
<khem> AR for Jefro :)
<khem> Infrastructure
<khem> services are holding on well. I dont see any of them going down
at all these days
<khem> which is good
<RP__> khem: good news :)
<khem> Tom K needs to upgrade servers to 12.04 LTS
<khem> so there will be some downtime in coming weeks
<khem> I dont know when it is scheduled
<RP__> I did an LTS update on one of my machines and it was
surprisingly smooth...
<khem> Did we sort out the ml issue Koen reported ?
<RP__> khem: I did also talk to Philip about it and the board is
dealing with it afaik
<khem> RP__: thats a good news, it will make Tom less nervous :)
<khem> RP__: ok so we will keep it on radar for next meeting
<khem> Err. we are pretty much through the agenda
<khem> we still have 15 mins left, do we want to talk about systemd/init scripts
<RP__> So the only other topic I'm aware of is systemd
<bluelightning> I think we should
<khem> ok
<RP__> agreed
<khem> RP__: I think from OE-Core we should make initscripts virtuals
<khem> like C library
<khem> so they can be plug and play
<RP__> khem: I agree we need to do something like that. The exact
mechanism is TBD but we need to give users control to opt in or out of
the different options
<khem> I mean try to reach that
<bluelightning> my suggestion would be an "init" class which
conditionally pulls in systemd / init.d classes (since bitbake can now
do that)
<bluelightning> we can even do that right now without systemd being in OE-core
<RP__> I have to say that the addition of systemd to meta-oe is a
disaster and the fact people now have to BBMASK bits of the layer and
so on is rather sad
<bluelightning> (he says cautiously, without having tested the bitbake feature)
<bluelightning> RP__: that's what I'm trying to work around in the short term
<khem> RP__: yes it is a bit concerning
<RP__> I would suggest we learn from this and ensure that such
features are developed in layers or against the core in a branch in
future
<khem> RP__: from OE-Core pov I think if we have easy way to swap the
init systems
<khem> better it will be
<RP__> khem: agreed, but nobody seems willing to spend the time and
write these patches
<bluelightning> the blocker here would be anyone who needs to support
both without changing distro config
<fray> agree..  systemd was too wide ranging of a feature to be part
of meta-oe.. but I think we've learned now to look for things like
that
<RP__> It is on the agenda for the Yocto Project to look at it in the
1.3 timeframe and see if we can resolve things
<fray> bluelightning honestly, I'm not sure if both can be supported
on a non-distribution wide basiss
<khem> RP__: yes they are pretty nasty to write I agree
<RP__> If someone beats us to it, great...
<bluelightning> fray: I've always seen supporting both without
changing config as being a bit ambitious and not worth supporting,
yes, but in the past others disagreed
<khem> RP__: ok thats good.
<RP__> bluelightning: it would be better than what we have now
<bluelightning> so people don't think my idea is totally silly then?
<bluelightning> if so I'll give it a try
<khem> RP__: on the other hand we have to support a default in E-core
so are we going to change the default to systemd too ?
<fray> at least in my experience a distro flag -- or soething like the
tclibc flag is what we need..
<RP__> I'd also note for the record all the "who did what" type
discussions are not particularly helpful, what we need are patches to
improve the situation
<RP__> So those are the things I want to spend the time on, patches to
move things forward
<fray> as for default, I'd say keep it "as-is" today through the next
release cycle.. if systemd is working (in oe-core), then we can
discuss changing the default..
<bluelightning> so is it worth spending any time on a stopgap?
<RP__> khem: Lets figure out the mechanism, with compatibility with
what we have now, then people can think about switching and we can
discuss the default
<fray> I'd love to play with it and improve things.. but again, time.. ;)
<khem> fray: so have them both in OE-Core and as bluelightning suggested
<khem> RP__: yes sounds sane to me
<fray> what is the current implement, just raw bbappends, or distro flags, or?
<fray> khem, yes
<bluelightning> khem: that's what we should move to, but initially we
could set it up so that systemd could not be available and we won't
get parse failures
<RP__> fray: mixture of things including a bbclass which is probably
the most problematic part
<fray> (current implemention = meta-oe/angstrom)
<fray> what does the class do?
<fray> is it pre/post install scripts or more setup then that?
<khem> RP__: I think to start have bbclass in OE-Core
<bluelightning> fray:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/classes/systemd.bbclass
<RP__> khem: not in its current form its not...
<khem> that way it can be integrated better in a different layer
<khem> RP__: lets redo the needed bits
<RP__> khem: that will encourage the BBMASK problem into OE-Core
<RP__> Discussion of the implementation needs to happen on the mailing list
<khem> not if redo takes care of that
<fray> a lot of that looks like it should be merged or at least
coordinated with an update-rcd class
<RP__> khem: hence my comment "not in current form" ;-)
<bluelightning> fray: that's kind of my point
<khem> RP__: ok.
<RP__> I think we understand what needs to be done, its just a people
and time problem
<khem> so I think we all have similar thoughts on the issue
<fray> so I am on the systemd bandwagon.. we just need some help
getting it into oe-core and allowing it to be selectable..
<khem> ok. Lets provide stop gap and meanwhile its worked out to live in OE-Core
<khem> as we have with BBMASK etc. for now
<fray> A systemd development layer should allow us to create mergable elements..
<khem> fray: I think koen already created a layer IIRC
<fray> (BTW I'd not seen the meta-systemd before Koen mentioned it today)
<khem> fray: yeah I think meta-systemd will give a chance to redo the
stuff that should make
<RP__> I did look at the layer but last I looked, the bbclass wasn't in there
<fray> ahh I see the directory in meta-oe git repo
<khem> it suitable for OE-COre
<bluelightning> if there are folks in WR working on this we should try
to get them involved rather than having them working off to the side
somewhere
<khem> bluelightning: I completely agree
<khem> as a tangent same goes for raspberry pi
<RP__> The WR people needed something standalone to work with meta-ivi
so I agreed to the layer on yoctoproject.org as a stopgap
<RP__> Its not meant for anything long term, its just while we figure
out a better solution
<khem> I deal with people who dont know OE so well and this plethora
of layers scares hell out of them
<Jefro> 1 minute warning...
<fray_> so do we have a decision on leaning toward distro flag or?
<bluelightning> fray_: probably needs to be discussed on the list further
<khem> fray: a distro flag yes
<fray_> ok.. fair enough
<RP__> I think some kind of distro flag will be the end result but
lets talk on the mailing list
<khem> OK
<khem> so I think someone should send mail initialing discussion
<khem> RP__: will you do that :)
<khem> with that lets adjourn the meeting if all agree ..
<RP__> khem: I can try to, yes
<RP__> tomorrow maybe :)
<RP__> out of time today
<khem> RP__: thats fine
<fray_> fine w/ me
<khem> thanks all for joining
<khem> cu next time
<bluelightning> bye everyone
<RP__> thanks all!


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


