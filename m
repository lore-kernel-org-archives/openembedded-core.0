Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RpkfS-00013I-VE; Tue, 24 Jan 2012 19:00:27 +0100
Received: by iabz21 with SMTP id z21so7131237iab.6
	for <multiple recipients>; Tue, 24 Jan 2012 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1vi7s3f037JgtEGvbgPovdpERsv5kbOmzz4N7LVGt4Q=;
	b=YxmyVPaq41TFv+Hr3jlENJSp5M8gE8ETkmPBpRy8xU6cIHVrM2eMTewy86Wr7PNZXG
	mYr/RJQ5RmY9xi1P7QQJT73mlaJfYT6+EapxKkevJObgr4LB3RsDi5roYU5vt8s7Frp1
	8y+gi0LjS9RNuAsyZdA2ksfuZAG+7KuIbrcZo=
MIME-Version: 1.0
Received: by 10.50.202.105 with SMTP id kh9mr3214690igc.3.1327427560670; Tue,
	24 Jan 2012 09:52:40 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.203.1 with HTTP; Tue, 24 Jan 2012 09:52:40 -0800 (PST)
Date: Tue, 24 Jan 2012 09:52:40 -0800
X-Google-Sender-Auth: 7amTLNSqpJ_AaQJuTsdHR2udYFw
Message-ID: <CA+YB3rYjxo4+S56zSbjv_89Snaie5eocFM=YvcFr3u-L+bvcmg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
Subject: OE-TSC Minutes: 17-Jan-2012
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
X-List-Received-Date: Tue, 24 Jan 2012 18:00:27 -0000
Content-Type: multipart/alternative; boundary=f46d044787d938084504b749d01a

--f46d044787d938084504b749d01a
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
17 January, 2012

Attending: Paul, Richard, Tom, Mark
Apologies: Khem
Notes: Jefro

Agenda & results, action items marked with =>

pick a chair
->Jefro

new issues
  elections
->fray is next
=>RP will tickle board

  distro features
=>all to reply to paul's email
->subject: Re: [OE-core] [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE

  TSC meetup at ELC
=> jefro to set up breakfast Thurs morning 8am

  Status report on oe-core
  stabilized, then a load of changes
  qemuppc somewhat unstable, being worked on
=>stabilisation release cycle for April release
=>communicate to oe-core list in late Feb, agendize
->plan is to watch situation, open up for M3 if stab trends better

Further discussion - trivial patches
-> watch and adapt as necessary

Infrastructure
-> servers a bit slow

Action Review:
   Khem/Fray: Flagging on wiki for OE version
-> deferred to next meeting
   Fray: Yocto non-gplv3 testing
-> WR test team said that it is in their test plan, but something was
blocking their tests, should be fixed now
   Khem: OE default source mirror
-> deferred to next meeting

Raw Transcript:

(8:57:08 AM) ***RP__ notes meeting in 5 mins
(8:57:12 AM) Jefro: morning all
(8:57:25 AM) RP__: hi Jefro!!!
(8:57:30 AM) RP__: We've missed you :)
(8:58:14 AM) bluelightning [~paul@pdpc/supporter/professional/bluelightning]
entered the room.
(8:58:21 AM) Jefro: aww, that's sweet :)
(8:58:21 AM) bluelightning: hi folks
(8:58:34 AM) RP__: hi bluelightning
(8:58:43 AM) RP__: fray: awake? :)
(9:02:02 AM) RP__: Jefro: do we have an agenda?
(9:02:26 AM) Jefro: gah - I never sent out minutes from last meeting,
though I did get acks - will send now
(9:02:34 AM) Jefro: yes, we have several items left over from last time
(9:03:12 AM) Jefro: http://pastebin.com/NPwpchVf
(9:03:51 AM) RP__: Jefro: I was just wondering why I couldn't find that
list :/
(9:04:34 AM) ***Jefro is :S
(9:04:36 AM) Tartarus [trini@pixelshelf.com] entered the room.
(9:04:37 AM) mode (+v Tartarus) by ChanServ
(9:05:04 AM) RP__: ok, just khem missing
(9:05:14 AM) RP__: Jefro: best add elections to the agenda
(9:05:28 AM) RP__: We're no doubt overdue another one :/
(9:05:51 AM) Jefro: isn't it every 2 months for those?
(9:05:54 AM) RP__: fray:  Is next iirc?
(9:06:11 AM) RP__: Jefro: two months from the start of the last election or
the end?
(9:06:24 AM) ***RP__ suspects it was from the start :/
(9:06:26 AM) Jefro: beats me - up to the board I guess, but someone should
tickle them
(9:06:31 AM) Jefro: added to agenda
(9:06:35 AM) RP__: I can do that
(9:07:14 AM) Jefro: noted
(9:07:42 AM) Jefro: Tartarus & fray, are you here or just ghosts?
(9:07:47 AM) Tartarus: here now
(9:08:01 AM) ***RP__ has pinged fray here and elsewhere :/
(9:08:13 AM) Jefro: cool - Tartarus RP__ bluelightning are here, fray is a
ghost - but we have a quorum. no koen?
(9:08:18 AM) RP__: Jefro: we should also have DISTRO feature son the agenda
from bluelightning
(9:08:26 AM) RP__: Jefro: bluelightning replaced koen
(9:08:30 AM) Jefro: ah, ok
(9:08:37 AM) RP__: we're missing khem
(9:08:51 AM) Jefro: I'll ping him
(9:10:42 AM) Jefro: pinged, no response yet
(9:10:59 AM) Jefro: I suggest starting - anyone want to chair? I haven't
done it in a while :)
(9:11:18 AM) RP__: Jefro: well volunteered ;-)
(9:11:41 AM) ***Jefro notes Jefro as chair
(9:11:58 AM) Jefro: I think elections have been covered (RP__ to ping the
board)
(9:12:03 AM) Jefro: next is distro features from bluelightning
(9:12:21 AM) fray: sorry I'm late
(9:12:39 AM) bluelightning: so, I had one response on the distro features
thing from phil, basically he likes RP__'s approach in all respects
(9:12:40 AM) RP__: so we last agreed to push discussions on the mailing list
(9:12:41 AM) Jefro: fray it will be deducted from your salary
(9:12:48 AM) fray: As for elections, I think I am next..
(9:12:57 AM) bluelightning: I was hoping for more response but I did only
ping yesterday
(9:13:13 AM) RP__: Can we all agree to reply to bluelightning's email?
(9:13:20 AM) bluelightning: that would be nice :)
(9:13:29 AM) RP__: I would like the discussion on the mailing list
(9:13:32 AM) ***Jefro notes an AR for everyone
(9:13:33 AM) RP__: bluelightning: mail subject?
(9:13:50 AM) bluelightning: one sec
(9:13:59 AM) bluelightning: Re: [OE-core] [PATCH 0/3] Make pulseaudio a
DISTRO_FEATURE
(9:14:21 AM) bluelightning: I guess the title is not exactly drawing people
in
(9:14:40 AM) bluelightning: (it's now expanded well beyond pulseaudio)
(9:14:47 AM) fray: :)
(9:14:48 AM) RP__: bluelightning: lets just get a few more replies and see
if we can get it resolved
(9:14:57 AM) bluelightning: ok, I'm happy with that
(9:14:58 AM) ***RP__ will change the subject when he replies
(9:15:11 AM) fray: (BTW I did have one additional item for the agenda --
ELC, an in person OE-TSC meeting?)
(9:15:32 AM) RP__: fray: might as well move to discuss that now
(9:15:34 AM) ***Jefro notes agenda item
(9:15:37 AM) RP__: will everyone be there?
(9:15:40 AM) ***RP__ will
(9:15:40 AM) ***Tartarus will be
(9:15:41 AM) ***bluelightning will not be at ELC, fwiw
(9:15:45 AM) fray: I am trying to be..
(9:15:58 AM) RP__: and Khem is relatively local
(9:16:09 AM) RP__: so I suspect he may be there
(9:16:41 AM) RP__: getting together in person even if its not an official
meeting might be an idea, assuming Paul doesn't object
(9:16:47 AM) Jefro: I have talked with Khem, he plans to be there (and to
speak if his talk is selected)
(9:17:07 AM) Jefro: I can arrange a phone to call Paul
(9:17:11 AM) fray: even if I don't end up going to ELC, I can likely make
it there for a face-to-face..
(9:17:13 AM) RP__: fray: anything specific you wanted to discuss?
(9:17:25 AM) ***bluelightning has no objections
(9:17:25 AM) fray: nope.. just thought it would be a good idea to get
together in person again..
(9:17:50 AM) Jefro: I have some insight into scheduling, which may make a
difference for travel
(9:17:54 AM) RP__: We could talk about future OE directions and Paul via
phone might work
(9:18:09 AM) RP__: Jefro: do you want to highlight that?
(9:18:15 AM) RP__: er, summarise that now
(9:18:17 AM) bluelightning: yep, should be OK as long as it's not
ridiculous AM UK time :)
(9:18:18 AM) Jefro: Tues 2/14 will be a Yocto Project Developer Conference
from 9am until probably 5pm
(9:18:26 AM) fray: a "year in review" might not be a bad idea either..
(9:18:31 AM) RP__: bluelightning: its two geo so should be managable
(9:18:32 AM) fray: based on what we discussed last year in person
(9:19:04 AM) Tartarus: elc itself is like 15-17 or something, yes?
(9:19:16 AM) RP__: Tartarus: yes
(9:19:19 AM) Tartarus: i'm doing morning in, evening out on the dates itself
(9:19:20 AM) Tartarus: fwiw
(9:19:21 AM) Jefro: Weds - Fri is regular ELC. Thurs 10am-1pm is Yocto AB
meeting, Fri 10am-2pm is another meeting that RP__ and I will likely be
rquired to attend, and fray if he is there
(9:19:25 AM) ***RP__ is flying in on Monday, back on Sunday
(9:20:10 AM) Jefro: Weds evening is probably a LF social event
(9:20:40 AM) Jefro: (schedule should be announced end of this week or
beginning of next - I'm on the program committee)
(9:21:01 AM) Jefro: is breakfast too early?  it is for me, but I could make
an exception (once)
(9:21:01 AM) RP__: Tartarus: would you change plans to attend the Yocto
Developer conference on the 14th ?
(9:21:20 AM) RP__: Jefro: that might be the best option, maybe on Thurs
(9:21:30 AM) ***RP__ will be jetlagged and have no clue about time anyway
(9:21:30 AM) Tartarus: RP__: Hard to say, I'm doing SCaLE this week so I'll
see how the family survives with me gone for 3 days
(9:21:35 AM) Tartarus: and then see what I can do from there
(9:21:37 AM) Jefro: early PST would enable us to call Paul at a decent time
also
(9:21:50 AM) RP__: Jefro: indeed
(9:22:40 AM) RP__: Jefro: so maybe 8am Thurs, make it a working breakfast?
(9:22:52 AM) fray: fine with me
(9:22:53 AM) RP__: and if we need extra time we can run into what will
likely be the keynote
(9:23:00 AM) Jefro: worst that can happen is skipping keynotes :)
(9:23:40 AM) ***RP__ is looking like his whole conference will be meetings
(9:23:59 AM) Jefro: I can arrange a room & food, or transportation to a
good breakfast place
(9:24:16 AM) RP__: Jefro: given the phone issue, might need to be a room
(9:24:40 AM) Jefro: probably so - although I have a speakerphone for
cellphone if necessary
(9:24:53 AM) RP__: Jefro: I propose we delegate the details to you ;-)
(9:25:30 AM) ***Jefro notes AR
(9:25:57 AM) RP__: Jefro: thanks :)
(9:26:08 AM) RP__: we can quickly touch OE-Core status next?
(9:26:29 AM) RP__: Basically, we stablised a bit, then today a load of
changes have gone in
(9:26:47 AM) RP__: There are some stability issues with these, particularly
the qemuppc machine change but they are being worked upon
(9:27:04 AM) RP__: hopefully the qemuppc machine change will benefit longer
term
(9:27:19 AM) RP__: biggest pending change would be to change to eglibc 2.15
(9:27:34 AM) RP__: any questions?
(9:27:37 AM) fray: with the stability issue -- are we planning to have a
release cycle any time soon?  i.e. a stabilise and hold off on patches for
a week type thing?
(9:27:57 AM) RP__: fray: well, we just did that for M2
(9:27:59 AM) fray: I haven't heard anyone asking for such at this point..
but time wise it'll be close to 6 months
(9:28:16 AM) RP__: fray: next release is April
(9:28:17 AM) fray: RP__, but not officially on the oe-core...  I'm thinking
back to late last year
(9:28:30 AM) RP__: fray: so the stabilisation will be after M3
(9:28:42 AM) RP__: i.e. we've about six weeks of development left
(9:28:43 AM) fray: ok.. that is what I expected -- we'll want to
communicate that to the oe-core list at some point.. late February?
(9:29:01 AM) RP__: Yes, lets note that on the meeting ARs
(9:29:07 AM) ***Jefro notes
(9:29:12 AM) RP__: send out a warning in 1 or 2 meetings time?
(9:29:25 AM) fray: sounds good to me
(9:30:10 AM) RP__: my immediate plan is to watch the situation but open up
for M3, assuming stability trends to better, not worse
(9:30:23 AM) fray: (ohh and I agree the qemuppc change is worth a little
pain.. it's way better then the previous "machine")
(9:30:39 AM) RP__: fray: totally, I'm just being realistic about the impact
(9:31:23 AM) RP__: If no other comments we can more to trivial patches
discussion?
(9:31:28 AM) RP__: *move*
(9:31:36 AM) Tartarus: k
(9:31:44 AM) ***Jefro time check is ok, 1/2 hr left
(9:32:58 AM) Jefro: whose issue is trivial patches?
(9:33:20 AM) RP__: Jefro: well, its a discussion about how patches get
taken in and over what timeframes
(9:33:42 AM) RP__: I've been experimenting a little taking obvious fixes
faster whilst letting more complicated changes sit for longer for review
(9:33:57 AM) RP__: To me, it seems to be working reasonably, I'm not seeing
complaints
(9:34:09 AM) RP__: but I'm open to other representations
(9:34:26 AM) fray: RP__, I think what you are doing is working
(9:34:55 AM) RP__: We ran out of time at a previous meeting discussing this
(9:35:37 AM) RP__: I'd suggest we continue, see if any issues arise and
deal with them as appropriate
(9:36:00 AM) fray: What I've been looking for is things going in that
people object to.. so far I havn't observed anything out of the ordinary
there..
(9:36:06 AM) fray: if anything it's getting even better
(9:36:56 AM) RP__: Its partly a question of reacting when there are
problems too
(9:37:11 AM) RP__: e.g. we did revert the recent pango fix when problems
arose
(9:37:34 AM) fray: yes, exactly..
(9:37:45 AM) fray: I don't believe this is affecting stability in a
negative way either..
(9:37:50 AM) fray: as you said, we watch and adapt
(9:38:23 AM) RP__: Ok to move on?
(9:38:33 AM) RP__: Not sure we have much to discuss re: infrastructure
(9:38:47 AM) RP__: We have Michael Halsted as a full time sysadmin for Yocto
(9:39:08 AM) RP__: this should enable Yocto to really up its game
infrastructure wise
(9:40:03 AM) RP__: doesn't change OE's situation but probably can help with
knowledge of best practise etc.
(9:40:23 AM) Jefro: were there any lingering issues after the OE server
changes?
(9:40:23 AM) RP__: Which brings us to action review if no other comments
(9:40:34 AM) RP__: Jefro: I do find them slow :/
(9:40:53 AM) bluelightning: I'm getting the impression linuxtogo's servers
are still really struggling, but I don't know that it always affects OE
services
(9:40:54 AM) RP__: Jefro: but I don't have anything to help with that
(9:41:10 AM) RP__: bluelightning: which parts are struggling?
(9:41:15 AM) RP__: bluelightning: repos? emails?
(9:41:27 AM) bluelightning: RP__: their website and wiki are often slow or
unresponsive
(9:41:43 AM) fray: I haven't seen that here in the last couple of days..
(9:41:45 AM) bluelightning: I don't know if they are hosted on the same
servers as OE's website, probably not
(9:42:03 AM) RP__: bluelightning: OE's website and wiki are different
machine
(9:42:10 AM) RP__: OE only uses their email services iirc
(9:42:13 AM) bluelightning: ok
(9:42:32 AM) bluelightning: I've seen some minor delays in bitbake-devel
mails lately but nothing too alarming
(9:42:53 AM) fray: my patches to the oe-core list are coming back within a
minute or so..
(9:43:03 AM) fray: but I haven't been sending out a lot of patche
srecently..
(9:44:01 AM) Tartarus: I have an infra Q, would it be hard to get access
restrictions on branches in oe-classic?
(9:44:53 AM) RP__: Tartarus: depends if OE is using gitolite or gitosis iirc
(9:45:10 AM) Tartarus: too bad khem didn't make it today :(
(9:45:12 AM) RP__: Tartarus: If the latter, it shouldn't be that hard
assuming the hooks are correctly installed
(9:45:52 AM) RP__: Tartarus: its using gitolite :(
(9:46:19 AM) RP__: Tartarus: so a switch to gitosis would be needed
(9:46:23 AM) Tartarus: alright
(9:46:29 AM) Tartarus: lets just hope there's no further accidents then
(9:52:08 AM) RP__: so, action review
(9:52:08 AM) Jefro: recursion loop! everyone out of the boat
(9:52:12 AM) RP__: fray: you're up
(9:52:27 AM) fray: ?
(9:52:28 AM) RP__: (in the absence of Khem)
(9:52:33 AM) fray: ohh gotcha.. sorry
(9:52:34 AM) RP__: Action Review:
(9:52:34 AM) RP__:    Khem/Fray: Flagging on wiki for OE version
(9:52:34 AM) RP__:    Fray: Yocto non-gplv3 testing
(9:52:34 AM) RP__:    Khem: OE default source mirror
(9:52:48 AM) fray: Nothing has progressed on that.. I was held up with a
work project, which is now over..
(9:53:01 AM) RP__: that was simple then
(9:53:01 AM) fray: I'll try to sync w/ Khem today or tomorrow and then go
from there..
(9:53:08 AM) RP__: fray: thanks :)
(9:53:31 AM) RP__: we do need to sort that stuff but its not urgent
(9:53:39 AM) RP__: Any other business?
(9:53:40 AM) Jefro: fray: yocto non-gplv3 testing
(9:54:22 AM) Tartarus: Real quick
(9:54:26 AM) Tartarus: Anyone else going to SCaLE?
(9:54:33 AM) Tartarus: khem isn't, business trip, iirc
(9:54:34 AM) ***RP__ is not
(9:54:36 AM) ***bluelightning is not
(9:54:37 AM) fray: is not
(9:54:49 AM) ***Jefro is not (yocto doesn't have a presence there, sadly)
(9:54:54 AM) Tartarus: OE has a booth
(9:55:01 AM) fray: re non-gplv3 testing.. the WR test team said that it is
in their test plan, but something was blocking their tests (this was a
couple of weeks ago)..
(9:55:01 AM) Tartarus: But I'm not sure if it'll be more than ka6sox and I
(9:55:12 AM) fray: I have not followed up since then to see fi they've been
unblocked..
(9:55:25 AM) RP__: fray: it would be good to understand the block
(9:55:35 AM) RP__: if its related to the codebase anyway
(9:55:48 AM) fray: it was a filed bug (which I don't remember offhand).. I
believe it's been resolved now
(9:56:09 AM) fray: I'll check with them..
(9:56:43 AM) Jefro: last item is khem, can cover next time
(9:56:46 AM) Jefro: any final issues?
(9:57:23 AM) Jefro: sold - next meeting is Jan 31, minutes should be out
today
(9:57:35 AM) RP__: thanks all!
(9:57:47 AM) RP__: and even finished on time :)
(9:57:54 AM) Tartarus: yay, later all :)
(9:57:58 AM) fray: :)  later
(9:58:13 AM) Tartarus: Oh, wait,
(9:58:21 AM) The account has disconnected and you are no longer in this
chat. You will be automatically rejoined in the chat when the account
reconnects.

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--f46d044787d938084504b749d01a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse:collapse;color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px"><div>OpenEmbedded =
Technical Steering Committee</div><div>17 January, 2012</div><div><br></div=
>
<div><div>Attending: Paul, Richard, Tom, Mark</div><div>Apologies: Khem</di=
v><div>Notes: Jefro</div><div><br></div><div>Agenda &amp; results, action i=
tems marked with =3D&gt;</div><div><br></div><div>pick a chair</div><div>
-&gt;Jefro</div><div><br></div><div>new issues</div><div>=A0 elections</div=
><div>-&gt;fray is next</div><div>=3D&gt;RP will tickle board</div><div><br=
></div><div>=A0 distro features</div><div>=3D&gt;all to reply to paul&#39;s=
 email</div>
<div>-&gt;subject: Re: [OE-core] [PATCH 0/3] Make pulseaudio a DISTRO_FEATU=
RE</div><div><br></div><div>=A0 TSC meetup at ELC</div><div>=3D&gt; jefro t=
o set up breakfast Thurs morning 8am</div><div><br></div><div>=A0 Status re=
port on oe-core</div>
<div>=A0 stabilized, then a load of changes=A0</div><div>=A0 qemuppc somewh=
at unstable, being worked on</div><div>=3D&gt;stabilisation release cycle f=
or April release</div><div>=3D&gt;communicate to oe-core list in late Feb, =
agendize</div>
<div>-&gt;plan is to watch situation, open up for M3 if stab trends better<=
/div><div><br></div><div>Further discussion - trivial patches</div><div>-&g=
t; watch and adapt as necessary</div><div><br></div><div>Infrastructure</di=
v>
<div>-&gt; servers a bit slow</div><div><br></div><div>Action Review:</div>=
<div>=A0 =A0Khem/Fray: Flagging on wiki for OE version</div><div>-&gt; defe=
rred to next meeting</div><div>=A0 =A0Fray: Yocto non-gplv3 testing</div><d=
iv>-&gt;=A0WR test team said that it is in their test plan, but something w=
as blocking their tests, should be fixed now</div>
<div>=A0 =A0Khem: OE default source mirror</div><div><div>-&gt; deferred=A0=
to next meeting</div></div><div><br></div><div>Raw Transcript:</div><div><b=
r></div><div>(8:57:08 AM) ***RP__ notes meeting in 5 mins</div><div>(8:57:1=
2 AM) Jefro: morning all</div>
<div>(8:57:25 AM) RP__: hi Jefro!!!</div><div>(8:57:30 AM) RP__: We&#39;ve =
missed you :)</div><div>(8:58:14 AM) bluelightning [~paul@pdpc/supporter/pr=
ofessional/bluelightning] entered the room.</div><div>(8:58:21 AM) Jefro: a=
ww, that&#39;s sweet :)</div>
<div>(8:58:21 AM) bluelightning: hi folks</div><div>(8:58:34 AM) RP__: hi b=
luelightning</div><div>(8:58:43 AM) RP__: fray: awake? :)</div><div>(9:02:0=
2 AM) RP__: Jefro: do we have an agenda?</div><div>(9:02:26 AM) Jefro: gah =
- I never sent out minutes from last meeting, though I did get acks - will =
send now</div>
<div>(9:02:34 AM) Jefro: yes, we have several items left over from last tim=
e</div><div>(9:03:12 AM) Jefro:=A0<a href=3D"http://pastebin.com/NPwpchVf" =
target=3D"_blank" style=3D"color:rgb(17,85,204)">http://pastebin.com/NPwpch=
Vf</a></div>
<div>(9:03:51 AM) RP__: Jefro: I was just wondering why I couldn&#39;t find=
 that list :/</div><div>(9:04:34 AM) ***Jefro is :S</div><div>(9:04:36 AM) =
Tartarus [<a href=3D"mailto:trini@pixelshelf.com" target=3D"_blank" style=
=3D"color:rgb(17,85,204)">trini@pixelshelf.com</a>] entered the room.</div>
<div>(9:04:37 AM) mode (+v Tartarus) by ChanServ</div><div>(9:05:04 AM) RP_=
_: ok, just khem missing</div><div>(9:05:14 AM) RP__: Jefro: best add elect=
ions to the agenda</div><div>(9:05:28 AM) RP__: We&#39;re no doubt overdue =
another one :/</div>
<div>(9:05:51 AM) Jefro: isn&#39;t it every 2 months for those?</div><div>(=
9:05:54 AM) RP__: fray: =A0Is next iirc?</div><div>(9:06:11 AM) RP__: Jefro=
: two months from the start of the last election or the end?</div><div>(9:0=
6:24 AM) ***RP__ suspects it was from the start :/</div>
<div>(9:06:26 AM) Jefro: beats me - up to the board I guess, but someone sh=
ould tickle them</div><div>(9:06:31 AM) Jefro: added to agenda</div><div>(9=
:06:35 AM) RP__: I can do that</div><div>(9:07:14 AM) Jefro: noted</div>
<div>(9:07:42 AM) Jefro: Tartarus &amp; fray, are you here or just ghosts?<=
/div><div>(9:07:47 AM) Tartarus: here now</div><div>(9:08:01 AM) ***RP__ ha=
s pinged fray here and elsewhere :/</div><div>(9:08:13 AM) Jefro: cool - Ta=
rtarus RP__ bluelightning are here, fray is a ghost - but we have a quorum.=
 no koen?</div>
<div>(9:08:18 AM) RP__: Jefro: we should also have DISTRO feature son the a=
genda from bluelightning</div><div>(9:08:26 AM) RP__: Jefro: bluelightning =
replaced koen</div><div>(9:08:30 AM) Jefro: ah, ok</div><div>(9:08:37 AM) R=
P__: we&#39;re missing khem</div>
<div>(9:08:51 AM) Jefro: I&#39;ll ping him</div><div>(9:10:42 AM) Jefro: pi=
nged, no response yet</div><div>(9:10:59 AM) Jefro: I suggest starting - an=
yone want to chair? I haven&#39;t done it in a while :)</div><div>(9:11:18 =
AM) RP__: Jefro: well volunteered ;-)</div>
<div>(9:11:41 AM) ***Jefro notes Jefro as chair</div><div>(9:11:58 AM) Jefr=
o: I think elections have been covered (RP__ to ping the board)</div><div>(=
9:12:03 AM) Jefro: next is distro features from bluelightning</div><div>
(9:12:21 AM) fray: sorry I&#39;m late</div><div>(9:12:39 AM) bluelightning:=
 so, I had one response on the distro features thing from phil, basically h=
e likes RP__&#39;s approach in all respects</div><div>(9:12:40 AM) RP__: so=
 we last agreed to push discussions on the mailing list</div>
<div>(9:12:41 AM) Jefro: fray it will be deducted from your salary</div><di=
v>(9:12:48 AM) fray: As for elections, I think I am next..</div><div>(9:12:=
57 AM) bluelightning: I was hoping for more response but I did only ping ye=
sterday</div>
<div>(9:13:13 AM) RP__: Can we all agree to reply to bluelightning&#39;s em=
ail?</div><div>(9:13:20 AM) bluelightning: that would be nice :)</div><div>=
(9:13:29 AM) RP__: I would like the discussion on the mailing list</div>
<div>(9:13:32 AM) ***Jefro notes an AR for everyone</div><div>(9:13:33 AM) =
RP__: bluelightning: mail subject?</div><div>(9:13:50 AM) bluelightning: on=
e sec</div><div>(9:13:59 AM) bluelightning: Re: [OE-core] [PATCH 0/3] Make =
pulseaudio a DISTRO_FEATURE</div>
<div>(9:14:21 AM) bluelightning: I guess the title is not exactly drawing p=
eople in</div><div>(9:14:40 AM) bluelightning: (it&#39;s now expanded well =
beyond pulseaudio)</div><div>(9:14:47 AM) fray: :)</div><div>(9:14:48 AM) R=
P__: bluelightning: lets just get a few more replies and see if we can get =
it resolved</div>
<div>(9:14:57 AM) bluelightning: ok, I&#39;m happy with that</div><div>(9:1=
4:58 AM) ***RP__ will change the subject when he replies</div><div>(9:15:11=
 AM) fray: (BTW I did have one additional item for the agenda -- ELC, an in=
 person OE-TSC meeting?)</div>
<div>(9:15:32 AM) RP__: fray: might as well move to discuss that now</div><=
div>(9:15:34 AM) ***Jefro notes agenda item</div><div>(9:15:37 AM) RP__: wi=
ll everyone be there?</div><div>(9:15:40 AM) ***RP__ will</div><div>(9:15:4=
0 AM) ***Tartarus will be</div>
<div>(9:15:41 AM) ***bluelightning will not be at ELC, fwiw</div><div>(9:15=
:45 AM) fray: I am trying to be..</div><div>(9:15:58 AM) RP__: and Khem is =
relatively local</div><div>(9:16:09 AM) RP__: so I suspect he may be there<=
/div>
<div>(9:16:41 AM) RP__: getting together in person even if its not an offic=
ial meeting might be an idea, assuming Paul doesn&#39;t object</div><div>(9=
:16:47 AM) Jefro: I have talked with Khem, he plans to be there (and to spe=
ak if his talk is selected)</div>
<div>(9:17:07 AM) Jefro: I can arrange a phone to call Paul=A0</div><div>(9=
:17:11 AM) fray: even if I don&#39;t end up going to ELC, I can likely make=
 it there for a face-to-face..</div><div>(9:17:13 AM) RP__: fray: anything =
specific you wanted to discuss?</div>
<div>(9:17:25 AM) ***bluelightning has no objections</div><div>(9:17:25 AM)=
 fray: nope.. just thought it would be a good idea to get together in perso=
n again..</div><div>(9:17:50 AM) Jefro: I have some insight into scheduling=
, which may make a difference for travel</div>
<div>(9:17:54 AM) RP__: We could talk about future OE directions and Paul v=
ia phone might work</div><div>(9:18:09 AM) RP__: Jefro: do you want to high=
light that?</div><div>(9:18:15 AM) RP__: er, summarise that now</div><div>
(9:18:17 AM) bluelightning: yep, should be OK as long as it&#39;s not ridic=
ulous AM UK time :)</div><div>(9:18:18 AM) Jefro: Tues 2/14 will be a Yocto=
 Project Developer Conference from 9am until probably 5pm</div><div>(9:18:2=
6 AM) fray: a &quot;year in review&quot; might not be a bad idea either..</=
div>
<div>(9:18:31 AM) RP__: bluelightning: its two geo so should be managable</=
div><div>(9:18:32 AM) fray: based on what we discussed last year in person<=
/div><div>(9:19:04 AM) Tartarus: elc itself is like 15-17 or something, yes=
?</div>
<div>(9:19:16 AM) RP__: Tartarus: yes</div><div>(9:19:19 AM) Tartarus: i&#3=
9;m doing morning in, evening out on the dates itself</div><div>(9:19:20 AM=
) Tartarus: fwiw</div><div>(9:19:21 AM) Jefro: Weds - Fri is regular ELC. T=
hurs 10am-1pm is Yocto AB meeting, Fri 10am-2pm is another meeting that RP_=
_ and I will likely be rquired to attend, and fray if he is there</div>
<div>(9:19:25 AM) ***RP__ is flying in on Monday, back on Sunday</div><div>=
(9:20:10 AM) Jefro: Weds evening is probably a LF social event</div><div>(9=
:20:40 AM) Jefro: (schedule should be announced end of this week or beginni=
ng of next - I&#39;m on the program committee)</div>
<div>(9:21:01 AM) Jefro: is breakfast too early? =A0it is for me, but I cou=
ld make an exception (once)</div><div>(9:21:01 AM) RP__: Tartarus: would yo=
u change plans to attend the Yocto Developer conference on the 14th ?</div>
<div>(9:21:20 AM) RP__: Jefro: that might be the best option, maybe on Thur=
s</div><div>(9:21:30 AM) ***RP__ will be jetlagged and have no clue about t=
ime anyway</div><div>(9:21:30 AM) Tartarus: RP__: Hard to say, I&#39;m doin=
g SCaLE this week so I&#39;ll see how the family survives with me gone for =
3 days</div>
<div>(9:21:35 AM) Tartarus: and then see what I can do from there</div><div=
>(9:21:37 AM) Jefro: early PST would enable us to call Paul at a decent tim=
e also</div><div>(9:21:50 AM) RP__: Jefro: indeed</div><div>(9:22:40 AM) RP=
__: Jefro: so maybe 8am Thurs, make it a working breakfast?</div>
<div>(9:22:52 AM) fray: fine with me</div><div>(9:22:53 AM) RP__: and if we=
 need extra time we can run into what will likely be the keynote</div><div>=
(9:23:00 AM) Jefro: worst that can happen is skipping keynotes :)</div>
<div>(9:23:40 AM) ***RP__ is looking like his whole conference will be meet=
ings</div><div>(9:23:59 AM) Jefro: I can arrange a room &amp; food, or tran=
sportation to a good breakfast place</div><div>(9:24:16 AM) RP__: Jefro: gi=
ven the phone issue, might need to be a room</div>
<div>(9:24:40 AM) Jefro: probably so - although I have a speakerphone for c=
ellphone if necessary</div><div>(9:24:53 AM) RP__: Jefro: I propose we dele=
gate the details to you ;-)</div><div>(9:25:30 AM) ***Jefro notes AR</div>
<div>(9:25:57 AM) RP__: Jefro: thanks :)</div><div>(9:26:08 AM) RP__: we ca=
n quickly touch OE-Core status next?</div><div>(9:26:29 AM) RP__: Basically=
, we stablised a bit, then today a load of changes have gone in</div><div>
(9:26:47 AM) RP__: There are some stability issues with these, particularly=
 the qemuppc machine change but they are being worked upon</div><div>(9:27:=
04 AM) RP__: hopefully the qemuppc machine change will benefit longer term<=
/div>
<div>(9:27:19 AM) RP__: biggest pending change would be to change to eglibc=
 2.15</div><div>(9:27:34 AM) RP__: any questions?</div><div>(9:27:37 AM) fr=
ay: with the stability issue -- are we planning to have a release cycle any=
 time soon? =A0i.e. a stabilise and hold off on patches for a week type thi=
ng?</div>
<div>(9:27:57 AM) RP__: fray: well, we just did that for M2</div><div>(9:27=
:59 AM) fray: I haven&#39;t heard anyone asking for such at this point.. bu=
t time wise it&#39;ll be close to 6 months</div><div>(9:28:16 AM) RP__: fra=
y: next release is April</div>
<div>(9:28:17 AM) fray: RP__, but not officially on the oe-core... =A0I&#39=
;m thinking back to late last year</div><div>(9:28:30 AM) RP__: fray: so th=
e stabilisation will be after M3</div><div>(9:28:42 AM) RP__: i.e. we&#39;v=
e about six weeks of development left</div>
<div>(9:28:43 AM) fray: ok.. that is what I expected -- we&#39;ll want to c=
ommunicate that to the oe-core list at some point.. late February?</div><di=
v>(9:29:01 AM) RP__: Yes, lets note that on the meeting ARs</div><div>(9:29=
:07 AM) ***Jefro notes</div>
<div>(9:29:12 AM) RP__: send out a warning in 1 or 2 meetings time?</div><d=
iv>(9:29:25 AM) fray: sounds good to me</div><div>(9:30:10 AM) RP__: my imm=
ediate plan is to watch the situation but open up for M3, assuming stabilit=
y trends to better, not worse</div>
<div>(9:30:23 AM) fray: (ohh and I agree the qemuppc change is worth a litt=
le pain.. it&#39;s way better then the previous &quot;machine&quot;)</div><=
div>(9:30:39 AM) RP__: fray: totally, I&#39;m just being realistic about th=
e impact</div>
<div>(9:31:23 AM) RP__: If no other comments we can more to trivial patches=
 discussion?</div><div>(9:31:28 AM) RP__: *move*</div><div>(9:31:36 AM) Tar=
tarus: k</div><div>(9:31:44 AM) ***Jefro time check is ok, 1/2 hr left</div=
>
<div>(9:32:58 AM) Jefro: whose issue is trivial patches?</div><div>(9:33:20=
 AM) RP__: Jefro: well, its a discussion about how patches get taken in and=
 over what timeframes</div><div>(9:33:42 AM) RP__: I&#39;ve been experiment=
ing a little taking obvious fixes faster whilst letting more complicated ch=
anges sit for longer for review</div>
<div>(9:33:57 AM) RP__: To me, it seems to be working reasonably, I&#39;m n=
ot seeing complaints</div><div>(9:34:09 AM) RP__: but I&#39;m open to other=
 representations</div><div>(9:34:26 AM) fray: RP__, I think what you are do=
ing is working</div>
<div>(9:34:55 AM) RP__: We ran out of time at a previous meeting discussing=
 this</div><div>(9:35:37 AM) RP__: I&#39;d suggest we continue, see if any =
issues arise and deal with them as appropriate</div><div>(9:36:00 AM) fray:=
 What I&#39;ve been looking for is things going in that people object to.. =
so far I havn&#39;t observed anything out of the ordinary there..</div>
<div>(9:36:06 AM) fray: if anything it&#39;s getting even better</div><div>=
(9:36:56 AM) RP__: Its partly a question of reacting when there are problem=
s too</div><div>(9:37:11 AM) RP__: e.g. we did revert the recent pango fix =
when problems arose</div>
<div>(9:37:34 AM) fray: yes, exactly..</div><div>(9:37:45 AM) fray: I don&#=
39;t believe this is affecting stability in a negative way either..</div><d=
iv>(9:37:50 AM) fray: as you said, we watch and adapt</div><div>(9:38:23 AM=
) RP__: Ok to move on?</div>
<div>(9:38:33 AM) RP__: Not sure we have much to discuss re: infrastructure=
</div><div>(9:38:47 AM) RP__: We have Michael Halsted as a full time sysadm=
in for Yocto</div><div>(9:39:08 AM) RP__: this should enable Yocto to reall=
y up its game infrastructure wise</div>
<div>(9:40:03 AM) RP__: doesn&#39;t change OE&#39;s situation but probably =
can help with knowledge of best practise etc.</div><div>(9:40:23 AM) Jefro:=
 were there any lingering issues after the OE server changes?</div><div>
(9:40:23 AM) RP__: Which brings us to action review if no other comments</d=
iv><div>(9:40:34 AM) RP__: Jefro: I do find them slow :/</div><div>(9:40:53=
 AM) bluelightning: I&#39;m getting the impression linuxtogo&#39;s servers =
are still really struggling, but I don&#39;t know that it always affects OE=
 services</div>
<div>(9:40:54 AM) RP__: Jefro: but I don&#39;t have anything to help with t=
hat</div><div>(9:41:10 AM) RP__: bluelightning: which parts are struggling?=
</div><div>(9:41:15 AM) RP__: bluelightning: repos? emails?</div><div>(9:41=
:27 AM) bluelightning: RP__: their website and wiki are often slow or unres=
ponsive</div>
<div>(9:41:43 AM) fray: I haven&#39;t seen that here in the last couple of =
days..</div><div>(9:41:45 AM) bluelightning: I don&#39;t know if they are h=
osted on the same servers as OE&#39;s website, probably not</div><div>(9:42=
:03 AM) RP__: bluelightning: OE&#39;s website and wiki are different machin=
e</div>
<div>(9:42:10 AM) RP__: OE only uses their email services iirc</div><div>(9=
:42:13 AM) bluelightning: ok</div><div>(9:42:32 AM) bluelightning: I&#39;ve=
 seen some minor delays in bitbake-devel mails lately but nothing too alarm=
ing</div>
<div>(9:42:53 AM) fray: my patches to the oe-core list are coming back with=
in a minute or so..</div><div>(9:43:03 AM) fray: but I haven&#39;t been sen=
ding out a lot of patche srecently..</div><div>(9:44:01 AM) Tartarus: I hav=
e an infra Q, would it be hard to get access restrictions on branches in oe=
-classic?</div>
<div>(9:44:53 AM) RP__: Tartarus: depends if OE is using gitolite or gitosi=
s iirc</div><div>(9:45:10 AM) Tartarus: too bad khem didn&#39;t make it tod=
ay :(</div><div>(9:45:12 AM) RP__: Tartarus: If the latter, it shouldn&#39;=
t be that hard assuming the hooks are correctly installed</div>
<div>(9:45:52 AM) RP__: Tartarus: its using gitolite :(</div><div>(9:46:19 =
AM) RP__: Tartarus: so a switch to gitosis would be needed</div><div>(9:46:=
23 AM) Tartarus: alright</div><div>(9:46:29 AM) Tartarus: lets just hope th=
ere&#39;s no further accidents then</div>
<div>(9:52:08 AM) RP__: so, action review</div><div>(9:52:08 AM) Jefro: rec=
ursion loop! everyone out of the boat</div><div>(9:52:12 AM) RP__: fray: yo=
u&#39;re up</div><div>(9:52:27 AM) fray: ?</div><div>(9:52:28 AM) RP__: (in=
 the absence of Khem)</div>
<div>(9:52:33 AM) fray: ohh gotcha.. sorry</div><div>(9:52:34 AM) RP__: Act=
ion Review:</div><div>(9:52:34 AM) RP__: =A0 =A0Khem/Fray: Flagging on wiki=
 for OE version</div><div>(9:52:34 AM) RP__: =A0 =A0Fray: Yocto non-gplv3 t=
esting</div>
<div>(9:52:34 AM) RP__: =A0 =A0Khem: OE default source mirror</div><div>(9:=
52:48 AM) fray: Nothing has progressed on that.. I was held up with a work =
project, which is now over..</div><div>(9:53:01 AM) RP__: that was simple t=
hen</div>
<div>(9:53:01 AM) fray: I&#39;ll try to sync w/ Khem today or tomorrow and =
then go from there..</div><div>(9:53:08 AM) RP__: fray: thanks :)</div><div=
>(9:53:31 AM) RP__: we do need to sort that stuff but its not urgent</div>
<div>(9:53:39 AM) RP__: Any other business?</div><div>(9:53:40 AM) Jefro: f=
ray: yocto non-gplv3 testing</div><div>(9:54:22 AM) Tartarus: Real quick</d=
iv><div>(9:54:26 AM) Tartarus: Anyone else going to SCaLE?</div><div>(9:54:=
33 AM) Tartarus: khem isn&#39;t, business trip, iirc</div>
<div>(9:54:34 AM) ***RP__ is not</div><div>(9:54:36 AM) ***bluelightning is=
 not</div><div>(9:54:37 AM) fray: is not</div><div>(9:54:49 AM) ***Jefro is=
 not (yocto doesn&#39;t have a presence there, sadly)</div><div>(9:54:54 AM=
) Tartarus: OE has a booth</div>
<div>(9:55:01 AM) fray: re non-gplv3 testing.. the WR test team said that i=
t is in their test plan, but something was blocking their tests (this was a=
 couple of weeks ago)..</div><div>(9:55:01 AM) Tartarus: But I&#39;m not su=
re if it&#39;ll be more than ka6sox and I</div>
<div>(9:55:12 AM) fray: I have not followed up since then to see fi they&#3=
9;ve been unblocked..</div><div>(9:55:25 AM) RP__: fray: it would be good t=
o understand the block</div><div>(9:55:35 AM) RP__: if its related to the c=
odebase anyway</div>
<div>(9:55:48 AM) fray: it was a filed bug (which I don&#39;t remember offh=
and).. I believe it&#39;s been resolved now</div><div>(9:56:09 AM) fray: I&=
#39;ll check with them..</div><div>(9:56:43 AM) Jefro: last item is khem, c=
an cover next time</div>
<div>(9:56:46 AM) Jefro: any final issues?</div><div>(9:57:23 AM) Jefro: so=
ld - next meeting is Jan 31, minutes should be out today</div><div>(9:57:35=
 AM) RP__: thanks all!</div><div>(9:57:47 AM) RP__: and even finished on ti=
me :)</div>
<div>(9:57:54 AM) Tartarus: yay, later all :)</div><div>(9:57:58 AM) fray: =
:) =A0later</div><div>(9:58:13 AM) Tartarus: Oh, wait,</div><div>(9:58:21 A=
M) The account has disconnected and you are no longer in this chat. You wil=
l be automatically rejoined in the chat when the account reconnects.</div>
<div class=3D"yj6qo ajU" style=3D"outline-style:none;outline-width:initial;=
outline-color:initial;padding-top:10px;padding-right:0px;padding-bottom:10p=
x;padding-left:0px;width:22px;margin-top:2px;margin-right:0px;margin-bottom=
:0px;margin-left:0px">
</div></div></span><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http:/=
/jefro.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Proj=
ect Community Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"=
_blank">http://yoctoproject.org</a></div>
<br>

--f46d044787d938084504b749d01a--
