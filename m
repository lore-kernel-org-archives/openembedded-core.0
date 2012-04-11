Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SHzHj-0005ua-Me; Wed, 11 Apr 2012 17:16:39 +0200
Received: by yenm3 with SMTP id m3so512019yen.6
	for <multiple recipients>; Wed, 11 Apr 2012 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Dj3UBoTrdlr5wjsEoFbQxD+o/qtR5gmMa6ShKUMiRs0=;
	b=jppIIcFQBV16GDIxtyTipLhcFJ0aUmskNNEWsK7lZYC6JVNOuRYg0IpXV+isTp3PyT
	NomzVqbTIoG6VAG6CR1ZfXMEjQB+myCcjxQ67kTnaHKhcD5aGUajXIjf6dDDx2AeSxc/
	ILhq7xq/uXb0NwOQu6Lz9z8B431BvqkqiOEaIR7AL+Mt8/IqaZaqePXC68N3Jq5i6evc
	l/bGOUNAYpMl+MSpsKP/gZcQ7AlcEuZ3K2EJXj7abG3VfRosXVJQqtNMS1PYTZOQ5QVX
	jguVoqaYLFFUAqraoxL4RRZu2zcofB8Zz5Bo8r5Nx9tWQCz/yb3UcatwPEshiJ+2Zr2f
	ql2w==
MIME-Version: 1.0
Received: by 10.50.197.164 with SMTP id iv4mr6004263igc.73.1334156839386; Wed,
	11 Apr 2012 08:07:19 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.112.71 with HTTP; Wed, 11 Apr 2012 08:07:19 -0700 (PDT)
Date: Wed, 11 Apr 2012 08:07:19 -0700
X-Google-Sender-Auth: sgjrhK8oCaViUbygY744Fho_ryw
Message-ID: <CA+YB3rbm0DGA6rToaoTDFK=L=EuO=jU7=FYS4vB854FXNXZgUA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 10 April 2012 (date corrected)
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
X-List-Received-Date: Wed, 11 Apr 2012 15:16:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

[Sorry - this was yesterday's meeting, date corrected]

OpenEmbedded Technical Steering Committee
10 April 2012

Attending:
=A0 Richard Purdie (RP)
=A0 Paul Eggleton (bluelightning)
=A0 Mark Hatle (fray)
=A0 Tom Rini (Tartarus)
=A0 Khem (khem)

Minutes: Jefro (Jefro)

________________________________________________
Agenda & Summary

1. pick a chair
=A0 =A0fray

2. lingering issues

=A0a. raise awareness of "janitor" list, QA "bugs"
=A0 =A0item to stand on agenda
=A0 =A0=3D> fray to start publicity about "janitor" bugs
=A0 =A0not done yet, waiting for things to calm down this week

3. new issues

=A0a. discuss communication with OE community about
=A0 =A0 =A0 =A0 =A0 =A0release-oriented phases
=A0 =A0=3D> fray willing to manage page as TSC activity
=A0 =A0=3D> RP to send email updates, TSC to handle in future
=A0 =A0=3D> future agenda: document release process
=A0 RP raised awareness at collab
=A0 Song sent note to oe-core & yocto lists yesterday
=A0 RP talked to Dave & Song about making info more public
=3D> =A0fray will stay in sync with Dave/RP/Song & create wiki when appropr=
iate

=A0b. mips/mips32 tuning issue
=A0 =A0the mips32 tuning has previous produced "mips" tagged packages
[package arch],
=A0 =A0 =A0and so did the default "mips" tuning. =A0This lead to two
packages with the
=A0 =A0 =A0same filenames, but very different contents
=A0 =A0fray fixed the defect.. which is leading to a concern of a
filename change at the last minute..
=3D> =A0fray will summarize to list with possible options & ask for comment=
s

4. status

=A0a. elections
=A0 =A0board would like to extend for 2 years to avoid election churn
=A0 =A0no objections

=A0b. infrastructure
=A0 =A0nothing new

=A0c. oe-core release
=A0 =A0RP is very worried about the quality of the release and number of op=
en bugs

________________________________________________
Raw Transcript

(8:58:05 AM) Jefro: agenda is at http://pastebin.com/23KsmkGJ
(8:58:45 AM) RP__: hi
(8:58:51 AM) RP__: I'm here put only partially
(8:59:09 AM) RP__: with the release and the conferences and the UK
holidays, I'm stretched today :(
(8:59:13 AM) fray: I'd like a few minutes to talk about the
mips/mips32 tuning issue.. it doesn't have to be under the official
TSC meeting though
(8:59:14 AM) Jefro: 3 1/2 members present then
(8:59:29 AM) Jefro: or is khem back online?
(8:59:52 AM) Jefro: back in 45 sec
(9:00:30 AM) fray: I can flail all I want on this.. but we need a
resolution and a technical decision (maintainer or tsc) IMHO
(9:02:28 AM) Jefro: sounds like an agenda item for tsc
(9:02:45 AM) Jefro: set as 3b
(9:02:46 AM) fray: ya..
(9:02:50 AM) RP__: fray: I was just worried about Phil's reply to your patc=
h
(9:03:06 AM) RP__: fray: Why isn't your description adding up for him?
(9:03:28 AM) fray: Phil isn't the one I'm worried aobut (unless I
missed a response)
(9:03:50 AM) fray: I agree my description is poor and needs to be
revised.. but the contents are one of many possible solutions..
(9:03:59 AM) fray: I could implement them all, but it doesn't make
sense to keep trying this..
(9:04:05 AM) fray: (until I have a specific direction)
(9:04:24 AM) fray: (what I implemented was Khem's suggestion BTW)
(9:04:56 AM) khem: mips1 is default he suggested
(9:05:22 AM) fray: I havn't seen that email then..
(9:05:46 AM) Jefro: should we begin? perhaps counting this discussion in mi=
nutes
(9:06:04 AM) fray: we should begin..
(9:06:14 AM) fray: I can quickly recap the discussion as I know it
when we get to 3b
(9:06:19 AM) Jefro: ok, thanks
(9:06:20 AM) Jefro: who wants to chair?
(9:06:28 AM) fray: I'm willing to, if requested
(9:06:33 AM) Jefro: sold
(9:06:53 AM) ***fray loads agenda
(9:06:59 AM) fray: ok.. #1 is done, I've got the honor
(9:07:08 AM) fray: @3 -- janitor list and bugs..
(9:07:11 AM) fray: 'er.. #2
(9:07:25 AM) fray: I have not yet publicised it.. I was waiting for
things to calm down hopefully this week..
(9:07:35 AM) fray: any comments? =A0or on to 3?
(9:07:41 AM) Tartarus: no comments
(9:07:43 AM) fray: (and yes, keep it on the agenda)
(9:07:49 AM) bluelightning: no comments here
(9:08:02 AM) fray: ok.. moving on..
(9:08:09 AM) fray: #3 a -- OS releaste phases..
(9:08:25 AM) fray: again, my work is pending the end of this phase..
(9:08:35 AM) fray: RP -- did you send anything out for the current?
(9:08:48 AM) Jefro: fray - should also poll for any other new business
(sorry, I should put that in the agenda template)
(9:08:57 AM) fray: yes.. sorry
(9:09:10 AM) fray: (any new issues?)
(9:09:24 AM) fray: my request is a brief discussion and resolution to
the MIPS/MIPS32 issue
(9:09:27 AM) fray: (3b)
(9:09:39 AM) bluelightning: don't think I have anything to raise atm
(9:10:02 AM) fray: ok, if anyone thinks of an additional issue, please
speak up.. otherwise back to 3a
(9:10:18 AM) fray: I suspect RP had to step away.. so we can table that par=
t..
(9:10:30 AM) fray: I agree it needs to be kept on the agenda until we
get it decided and completed
(9:10:37 AM) fray: anyone else?
(9:11:07 AM) fray: ok.. on to 3b -- the mips issue
(9:11:22 AM) fray: Let me briefly recap what happened and what the
issue is (as I see it)
(9:12:03 AM) fray: About 2-3 weeks ago, it became clear to me that
(via a PPC issue) that the tunings had become somewhat inconsistent.
So I set about looking for the inconsistencies, correcting them and
documenting the variables used in the tunings. =A0This work was merged
last week as a general cleanup/bug fix..
(9:12:13 AM) RP__: With all the travel I've not really done much with
3a other than raise awareness at collab
(9:12:20 AM) fray: An issue was raided by Andreas Oberritter about the
MIPS "cleanup"....
(9:12:23 AM) fray: RP, thanks
(9:12:43 AM) bluelightning: re 3a also, Song sent out something to the
OE-Core and yocto lists yesterday
(9:13:00 AM) RP__: fray: the issues is that the "mips" package arch
became "mips32"?
(9:13:02 AM) bluelightning: was only an immediate deadlines thing though I =
think
(9:13:04 AM) fray: ... the mips32 tuning has previous produced "mips"
tagged packages [package arch], and so did the default "mips" tuning.
This lead to two packages with the same filenames, but very different
contents..
(9:13:06 AM) fray: RP -- yes
(9:13:21 AM) RP__: right, I have talked to Dave and Song about making
information more public so Song should be doing more of this
(9:13:28 AM) fray: Andreas is concerned that the changed (near the end
of the release process) to the mips32 RPMs is a problem..
(9:13:31 AM) onoffon [d03605df@gateway/web/freenode/ip.208.54.5.223]
entered the room.
(9:13:31 AM) fray: (back to 3a)
(9:13:54 AM) onoffon is now known as Guest23807
(9:13:55 AM) fray: RP__ ok, I'll make sure I stay in sync with them,
and then publicise this via a wiki page as it comes out..
(9:14:31 AM) fray: I think, once this phase is over, we are going to
have to discuss the exact framework we document for the OE process..
even if it's similar to the Yocto process.. (I see them as
complementary, but perhaps not identical)
(9:15:23 AM) ***RP__ agrees we need to ensure more information is out there
(9:15:32 AM) fray: ok.. anything else on 3a?
(9:15:46 AM) RP__: fray: on the mips vs. mips32 issue, could you send
out a summary and ask for comments?
(9:15:57 AM) fray: I will summarize the thread and do that..
(9:15:58 AM) RP__: fray: I'm also not sure what your last patch does
to change the siutation?
(9:16:12 AM) fray: getting to that.. (if you have a couple more
minutes) I'll get to it here..
(9:16:33 AM) fray: so the defect being discussed is mips and mips32
tunings created files of the same name, but different contents..
(9:16:47 AM) fray: I fixed the defect.. which is leading to a concern
of a filename change at the last minute..
(9:17:06 AM) fray: Possible solutions, revert this part of the fix and
retain the duplicate filenames and fix that "in the future" =A0(I really
don't like that option)
(9:17:17 AM) fray: Keep it "as-is"..
(9:17:37 AM) fray: or what khem suggested, change the "mips"
definition to "mips32".
(9:18:02 AM) fray: (mips previously was using the default "mips"
compiler settings which were "mips1"... as far as we know there are no
real mips1 systems running Linux..
(9:18:21 AM) fray: mips3 or 4 may be the oldest.. but even those are
-very- old systems.. =A0everything these days is mips32 or mips32r2
AFAIK)
(9:18:37 AM) fray: so the last patch I sent was an effort to implement
Khem's suggestion
(9:18:56 AM) fray: (Phil Blundel commented that the description didn't
make sense to him, I agree.. it's poorly worded.. and I'll correct
that)
(9:19:21 AM) fray: but there is a concern now that what happens to
processors then are mips3/mips4 that someone may still be using..
there is no tune for them, and "mips" is no longer compatible.. (I
think)
(9:19:31 AM) fray: ok.. summary for the TSC.. I'll send out something
similar to the list..
(9:19:57 AM) fray: does the TSC have an opinion on this? =A0or is this a
maintainer (RP) decision, or?
(9:20:03 AM) Guest23807 left the room (quit: Ping timeout: 245 seconds).
(9:20:18 AM) Tartarus: Hmm
(9:20:20 AM) RP__: fray: So after these changes, is the package name
"mips" or "mips32" ?
(9:20:41 AM) fray: as it stands now "mips" and "mips32" both get
generated -- after the -last- change I supplied it's now just "mips"
(9:20:51 AM) fray: (last change has not been merged)
(9:21:00 AM) Tartarus: sec
(9:21:08 AM) fray: in the prior freeze, they both generated "mips"..
(9:21:18 AM) fray: only the "mips32" tune is used by oe-core, as part
of qemumips
(9:22:14 AM) Tartarus: I don't know if we really need to worry about
someone using OE on mips3 or mips4
(9:22:25 AM) fray: Tartarus I agree
(9:22:28 AM) Tartarus: We should make sure the tunes are commented
clearly about what they produce
(9:22:42 AM) Tartarus: But not having a tune file that by default is
fine with mips1/3/4 doesn't seem like a big deal
(9:22:54 AM) fray: (the other thing the latest patch did was remove
the "mips32" tune, but left the tune-mips32.inc file in place for
compatibility)
(9:23:26 AM) fray: if someone needs mips3 or mips4.. they can add such
a tune.. it just means "mips4" can't run "mips" packages.. (I don't
see this as a huge problem though)
(9:24:40 AM) Tartarus: So, wait
(9:24:47 AM) Tartarus: We drop mips32 and have 'mips' make mips32?
(9:25:00 AM) fray: yes, that was based on Khem's suggestion
(9:25:37 AM) The account has disconnected and you are no longer in
this chat. You will be automatically rejoined in the chat when the
account reconnects.
(9:26:23 AM) mode (+v Jefro) by ChanServ
(9:26:24 AM) fray: another way to summarize.. =A0in the "last" release..
=A0mips (tune) -> mips (package) and mips32 (tune) -> mips (package) ---
=A0recent change =A0mips (tune) -> mips (package) and mips32 (tune) ->
mips32 (package) -- with the changed based on Khem's suggestion =A0 mips
(tune) -> mips (package) and mips32 (goes away)
(9:26:37 AM) fray: (and mips [tune] is now mips32 based)
(9:27:12 AM) Tartarus: yeah, lemme say that back with a different notation
(9:28:05 AM) RP__: I'd suggest this get clearly documented on list and
we was for opinions
(9:28:09 AM) Tartarus: "last" release, mips (tune file) -> mips
(package suffix), mips1 ABI, mips32 (tune file) -> mips (package
suffix), mips32 ABI
(9:28:28 AM) RP__: I'd be particularly interested in Koen's viewpoint
as a distro maintainer with mips packages
(9:28:33 AM) Tartarus: But the end goal of your changes is to have
mips (tune file) -> mips (package suffix), mips32 ABI
(9:28:33 AM) Tartarus: ?
(9:28:53 AM) fray: (ABI is o32 -- the instructions and optimizations
move from mips1 to mips32)
(9:29:20 AM) fray: RP__, ok.. =A0I will write up a summary sent it out,
with possible options..
(9:30:37 AM) RP__: fray: I just think we need a clear summary for
people who've not read/understood the whole thread
(9:30:52 AM) fray: ok. =A0I'll leave it at that then..
(9:30:53 AM) fray: on to 4
(9:31:02 AM) fray: a elections?
(9:31:06 AM) RP__: Then we could make a conscious decision to change
or not. I have a slight preference for mips32 as the packagearch but
only slight
(9:31:08 AM) fray: anything we need to do?
(9:31:23 AM) RP__: I did talk to the board members at collab
(9:31:43 AM) RP__: They mentioned there was a lot of churn with 1 year
elections and they talked about extending people's terms
(9:31:56 AM) RP__: I said that was ok in principle but would really
need to be a direction given by the board
(9:32:06 AM) fray: has everyone been elected now, or is Tom still to go?
(9:32:09 AM) RP__: (people can still decide to step down)
(9:32:31 AM) RP__: Tom is still to go, I suggested they figure out the
term length before the next election
(9:32:52 AM) fray: I do not have an issue with extending the terms..
as long as each of us has gone through an election phase..
(9:33:03 AM) RP__: (term from 1 year to 2 years was the discussion)
(9:33:04 AM) fray: I think it's a disservice to the members otherwise
(9:33:23 AM) fray: RP__ that seems reasonable.. would we offset anyone?
(9:33:39 AM) RP__: fray: well, we have the current offsets
(9:33:43 AM) fray: i.e. have half the group up for election in a year,
the other half in 2.. or are we staggered enough already due to the
current offsets?
(9:33:58 AM) RP__: fray: It would just put off more elections for a
while, particularly when there aren't a queue of people wanting to
join the TSC
(9:34:08 AM) RP__: feeling was staggered enough
(9:34:09 AM) fray: ok.. =A0I see no issue then
(9:34:23 AM) RP__: and we might batch future elections (2 people at a time)
(9:34:32 AM) fray: I could see that being reasonable as well
(9:35:19 AM) fray: ok, any other comments or 4b?
(9:35:23 AM) RP__: Whilst the TSC came up with the process for its
election, I think the board is the right place to make this decision.
I didn't see anything I objected to and I think Khem was present for
the conversation too
(9:35:50 AM) RP__: So this is really just to keep people in the
picture and allow them to talk to the board if they have any concerns
(9:35:51 AM) fray: All I care is that the election process is
staggered in some way..
(9:36:11 AM) fray: ok, moving on then.. 4b =A0infrastructure..
(9:36:13 AM) fray: anything to report?
(9:37:07 AM) RP__: nothing from me
(9:37:26 AM) fray: ok.. I'll move on to 4c
(9:37:33 AM) fray: oe-core release status
(9:37:38 AM) ***Jefro back in 1 minute
(9:39:00 AM) fray: RP__ any updates beyond what Song already sent out?
=A0Are you able to keep up with the pending requests and other items?
(9:42:41 AM) fray: ok.. looks like RP had to step away..
(9:42:50 AM) fray: If there is anything he needs to report, he can do
so to Jefro..
(9:43:07 AM) fray: Any other business or I'll call the meeting over (I
have to get a few thing done in the next 15 mintues)
(9:43:27 AM) Tartarus: looks like the end to me
(9:43:41 AM) Jefro: and so I face the final curtain
(9:43:55 AM) fray: ok.. =A0meeting over -- RP please contact Jefro if
you have anything for the minutes
(9:44:08 AM) ***Jefro will ping him later
(9:45:28 AM) Tartarus: I can send 'em now Jefro if needed
(9:46:06 AM) Jefro: Tartarus sure, send over anything
(9:46:50 AM) Tartarus: sent to your gmail
(9:47:39 AM) Jefro: ah, got it, thanks - I have also been recording
(9:47:48 AM) Jefro: I'll ping RP later for any comments he had on
oe-core release status
...
(9:54:32 AM) RP__: OE-Core status was as per the technical meeting we just =
had
(9:54:44 AM) RP__: I'm very worried about the quality of the release
and number of open bugs<


--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


--=20
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


