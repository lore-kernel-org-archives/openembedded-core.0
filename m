Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RU3Zm-00009F-49; Fri, 25 Nov 2011 22:44:55 +0100
Received: by iahk25 with SMTP id k25so5122274iah.6
	for <multiple recipients>; Fri, 25 Nov 2011 13:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=pudKeJM6H+aPNKkb5c4qK4qiaedoWQ9rUylgsbMXwQU=;
	b=geQaXBOmlkGED9cql58b/MsgK1PPfAbH52mbJ6wxnvKWeu+degf7+mIJO4VsnCB9no
	TiLtBtwX83tL9IDjO/2xMpwd/sGBtObCHyQ3CEp9uQX1nzTxCzHDTdHK4JGiyceYYzcy
	rumTGFQ7tT1qC5BzMIuJSykZU+gIPtyhONkB8=
MIME-Version: 1.0
Received: by 10.42.72.135 with SMTP id o7mr14821903icj.45.1322257096924; Fri,
	25 Nov 2011 13:38:16 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.187.225 with HTTP; Fri, 25 Nov 2011 13:38:16 -0800 (PST)
Date: Fri, 25 Nov 2011 13:38:16 -0800
X-Google-Sender-Auth: pWSzeGieFz2_N0a60nGlymqexLk
Message-ID: <CA+YB3rb-c8bN=foq9kswhx1M5d+-VSjUxD_irr=Dq3TC9_oUiA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE-TSC Meeting 22-Nov-2011
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
X-List-Received-Date: Fri, 25 Nov 2011 21:44:56 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e87d0905e9804b295f801

--90e6ba6e87d0905e9804b295f801
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC Meeting 22-Nov-2011
_________________________________________________________________
Attending: Mark, Koen, Richard, Khem, Tom
Apologies: Jefro
_________________________________________________________________
Agenda & Results

*) Select a chair...
Tom

*) Other issues?
intralayer dependencies

*) Revise the TSC's normal meeting time
meetings now set for Tuesday 9amPST = 11amCST = 5pmGMT
Jefro will attempt to alter schedule, otherwise will create minutes from
logs

*) Discuss the PACKAGECONFIG policy
Using PACKAGECONFIG needs to get evaluated on a per recipe basis, there is
no one right way. The rule of thumb:

       Investigate if there is a need to support multiple parallel configs
       If there isn't, use PACKAGECONFIG

Since PACKAGECONFIG is a distro-wide choice, it nearly always is coupled to
a matching DISTRO_FEATURE. The current syntax for triggering PACKAGECONFIG
of DISTRO_FEATURE is clunky and needs improvement.

Adding PACKAGECONFIG options to recipes is ok, as long as the defaults
preserve the current settings. The intent is that people should have to
opt in to changes unless discussion reflects otherwise.

The overriding concern is that functionality shouldn't disappear on
people unless they've made a conscious choice to embrace that change. It
should also be stressed that changing PACKAGECONFIG is a distro
incompatibility, i.e. distros should use one consistent set of
PACKAGECONFIG options only.

*) Other misc items...
-- WR Review template?
not discussed, out of time

next meeting scheduled 6-Dec-2011
_________________________________________________________________
Raw Transcript

09:06 < fray> ok.. it's time.. anyone else here/
09:06 *** koen waves
09:06 *** RP__ is
09:07 < fray> Is anyone logging this?
09:08 *** RP__ is logging
09:08 < fray> 'k..
09:08 < fray> Does anyone have an agenda to go over?
09:08 < RP__> well, the question is whether the three of us can be
productive
09:08 <+khem> I am here guys
09:08 <+khem> gm
09:08 < RP__> cool, hi khem
09:08 < fray> Tartarus the only one missing?
09:09 < RP__> fray: yes
09:09 < RP__> and Jefro but that is expected
09:09 <+koen> I'll poke tartarus on our work channel
09:11 -!- Tartarus trini@pixelshelf.com has joined #oe-tsc
09:11 -!- mode/#oe-tsc [+v Tartarus] by ChanServ
09:11 < RP__> koen: Did you read the last meeting's logs?
09:11 <+koen> RP__: I did
09:11 < RP__> hi Tartarus
09:11 <+Tartarus> sorry all, had to put daughter down for a nap
09:11 < RP__> koen: any questions/concerns?
09:11 <+koen> although is was at 3AM
09:11 <+koen> AIUI you guys says "postpone till next meeting"
09:11 < RP__> koen: on that specific topic, yes
09:12 < RP__> so we're all here
09:12 < fray> http://pastebin.com/LN5SX1bk
09:12 < RP__> volunteer to chair?
09:12 < fray> that is what I have for an agenda
09:12 < RP__> I can volunteer
09:13 < RP__> but jefro complains I always do ;-)
09:13 < fray> hey I did it last week.. ;)
09:13 < RP__> fray: I know :)
09:13 <+khem> ok let me volunteer this time
09:13 <+Tartarus> i'll do it this week
09:13 <+Tartarus> heh
09:13 < fray> :)
09:13 <+khem> ok Tartarus it is
09:13 < RP__> Tartarus: go for it
09:13 <+Tartarus> Someone logging?
09:14 < fray> RP is
09:14 *** khem is
09:14 <+Tartarus> k
09:14 < RP__> Tartarus: yes, I'll get jefro the logs
09:14 <+Tartarus> So, other issues?
09:14 < RP__> I think those are the main ones
09:14 <+Tartarus> OK, so meeting time
09:14 <+Tartarus> Um, does this time work for everyone normally, aside from
Jefro?
09:14 < RP__> Tartarus: yes
09:14 <+khem> I dont have any issues other than we should think of
ways/process for intra layer deps
09:14 < fray> Works for me
09:14 < RP__> much better for me
09:15 < fray> ohh actually wait.. I do have another issue -- but it can
wait until next week..
09:15 <+khem> It works for me
09:15 <+Tartarus> koen, this time works for you as well?
09:15 <+koen> this time works for me as well
09:15 < fray> someone was asking me about meta-oe vs oe-core.. policy on
when things go where and who monitors it's being followed
09:15 <+khem> 2 hrs early would be ok too
09:15 <+Tartarus> -2h from now is a bit too early for me
09:16 <+khem> ok lets pin on this time then
09:16 <+Tartarus> So, I think we should try and keep to this time and
either ask Jefro if he can re-arrange or we'll just live with getting him
the logs to make minutes from?
09:16 <+Tartarus> Anyone disagree?
09:16 < RP__> Tartarus: sounds like a good plan to me
09:16 <+Tartarus> OK, next item, PACKAGECONFIG
09:16 < fray> works for me
09:17 <+Tartarus> Last week I summarized what I thought what koen was
saying, then said lets wait for him to be here
09:17 <+Tartarus> But it'd be best I think if koen summarized what he sees
as the problem himself
09:17 <+koen> I get the impression it is a solution waiting for a problem
09:18 <+koen> and RP seems to like his new hammer and treats every problem
as a nail
09:18 <+Tartarus> Some form of USE flag not called a USE flag is a problem
09:18 <+Tartarus> We did agree there before, I thought
09:18 <+Tartarus> back at the f2f meeting in SF
09:18 <+koen> I severely object to the "we have packageconfig, so it is the
only acceptable solution" mentality
09:19 < RP__> koen: Ok, so you have two things there. Whether we need it at
all and when it should be used
09:19 <+koen> AFAICT we agreed to the need for useflags and also that they
are a last resort
09:19 < RP__> koen: On the first subject, is there a need?
09:19 < fray> koen, I don't think it's the ONLY solution, but I do think it
needs to be the primary solution, unless someone can justify something else
on a package
09:19 < RP__> User feedback says yes, people want a way of disabling things
like X11, configuring which gstreamer plugins to build and so forth
09:19 <+khem> will it be globally specified or per recipe ?
09:19 < RP__> should pulseaudio get used in qt?
09:20 < fray> I see a need, so I can change default behaviors per recipe
09:20 < RP__> Can we please discuss this in some kind of order?
09:20 <+koen> is qt going to change to packageconfig?
09:20 < fray> but -I- expect a change to be made on a distro basis..
09:20 <+koen> so a distro needs to choose between qt/e and qt/x11?
09:20 < RP__> If we all ask random questions and skip to implementation
this is going to be an impossible discussion to have
09:20 <+koen> that's what you're saying
09:21 < RP__> koen: no, at this point I;'m saying there are some usecases
we don't have a good solution for without PACKAGECONFIG
09:21 < RP__> so is there a need for something, I believe the answer to be
yes
09:22 < RP__> What really convinced me of this is the idea of trying to
customise some configuration from a layer
09:22 < fray> I see three steps of distro creation?   Selecting the source
packages to build..  Selecting the "distro config" to select multiple
package settings, and packageconfig settings when tailoring a specific
recipe.   packageconfig though is recipe specific.
09:22 < RP__> Several people out there are trying to do this and finding it
very hard. I have difficulty in saying "no you cannot disable configure
option XXX" and you should use what is in the core or not at all
09:23 <+khem> I see it complicating the things
09:23 <+koen> a lot of issues can be solved by having 2 recipes, like we
have in OE-classic
09:23 < RP__> We're supposed to be about flexibility and configurabilty so
making it hard for people doesn't seem right
09:23 <+khem> RP__: what will it be limited too
09:23 < RP__> koen: agreed and this is a big worry
09:23 <+koen> but apparently "parse time" is more important
09:23 < fray> Khem, I agree.. that is the one concern I have with the flags
approach.  It makes it much harder to test, if you want to support all
combinations
09:24 <+koen> I like having the option to include mplayer with and without
X support in an image
09:24 <+koen> WITHOUT changing distro
09:24 < RP__> koen: I'm not discussing implementation yet
09:24 < RP__> I'm trying to explain the needs
09:24 < RP__> Are we clear on the need or not?
09:24 < fray> I believe it -is- needed, but policy is that default
configuration must be reasonable...
09:25 <+Tartarus> I don't think we're totally clear on the need
09:25 <+Tartarus> All of them, at least
09:25 <+koen> I agree that it's needed, but it still needs to be a last
resort
09:25 < RP__> Tartarus: me neither which is why I don't want to skip to
implementation :/
09:25 < fray> I think it's reasonable to say alternative configurations
should be justified, and unit testing on a recipe basis is needed by the
maintainer of the package..
09:25 <+khem> so we need it to configure distro ? images ?
09:25 <+Tartarus> So, I think on the 'needs' side, we also need to include
something about what this implies to the implementation
09:26 < fray> what I don't want to see is a recipe that every possible
option to 'configure' is spelled out within a packageconfig setting..
09:26 <+Tartarus> IOW, if I want to change how it's built, how much of my
previous world is now invalid?
09:26 < RP__> My big concern is that if we don't have something in the
core, we'll end up with all kinds of half complete custom solutions with
people hacking it to fit their needs
09:26 < RP__> and the OE project will get a bad name as a result
09:26 < fray> RP__, I've already seen some of that
09:26 < RP__> fray: right :(
09:27 <+khem> fray: e.g.
09:27 < RP__> This is also a topic which has been "punted" at several OEDEMs
09:27 < fray> lots of misc .bbappend files that simply change a small
config setting...
09:27 < RP__> "too hard", "no resources"
09:27 < RP__> pb_ for example has for a long time wanted to disable X
completely
09:28 < fray> when we have altenative configurations that are reasonable, I
believe there needs to be a way for them to go into oe-core
09:28 < fray> (I see X btw as a distro flag -- because it affects more then
one recipe)
09:28 < RP__> I've also heard of people wanting to customise gstreamer
plugin dependencies as there are things they need to add and things they're
clearly never going to want
09:28 <+Tartarus> Well, do we agree that how the choice of what is in, and
how changing that choice impacts what was already built, is part of the
needs?
09:28 < fray> BTW I think this is potentially another gotcha we have to be
aware of..  people using recipe flags when they're really distro flags..
09:29 < fray> Tartarus it is for me.
09:29 <+koen> or even image flags
09:29 < fray> ya, and image flags
09:29 <+koen> e.g. qt
09:29 <+khem> RP__: why dont extend distro_features
09:29 <+koen> I do NOT want that to get an x11 packageconfig flag
09:29 <+Tartarus> Since we need to support, in the end, both "world"
distros like angstrom
09:29 <+Tartarus> and device specific custom builds
09:30 < fray> koen, I think an x11 packageconfig flag is incorrect.. that
is a distro flag.
09:30 < RP__> So do we agree there are users asking for recipe *and* distro
*and* image based control of configuration?
09:30 < fray> RP__, again, I agree that is hte need.
09:30 < RP__> I'm going to assume yes here so now lets look at the
constraints we have
09:30 < fray> can we define image control though -- this is what is built
(sources)?  what is installed (binaries)?  or?
09:31 < RP__> Image based control I think we do well enough today
09:31 < fray> can you give me an example?
09:31 < RP__> i.e. we split things up into very granular packages and you
chose which to install
09:31 < fray> ok, thanks.. then I am thinking the same
09:32 < RP__> some things definetely need to operate at the distro level
09:32 < RP__> in general I agree X11 should be something the distro chooses
09:32 <+Tartarus> So, other needs we need to discuss?
09:32 <+Tartarus> Or shall we really get into implementation details now
09:32 < RP__> however I can sympathise with the case where someone doesn't
want package X pulling in X
09:34 < fray> at WR (non bitbake, so it is different!) we have a concept of
automatic "recipe" flags..  i.e. if the user has decided to build expat,
then things that might work with expat are told it's now available...
09:34 < fray> but if you just request the item (and expat isn't there),
it's not added to the dependency list..
09:34 < fray> I see this as somewhat the same concept.. but with a bit more
explicit setting when the default isn't what someone wants
09:35 < fray> (the current WR approach won't work with bitbake because
there isn't a static list of sources the user has said they want to build
the final image..)
09:35 <+koen> as an example: I do not want to go back to the time where a
distro had to choose between opie or gpe, but couldn't build both
09:36 <+koen> that's why we had virtual/sdl
09:36 <+koen> (which is not the best example, but a decent illustration)
09:36 < fray> I understand the desire..  I think this is someone we have to
keep in mind as we frame the discussion on recipe flags
09:36 -!- RP__ ~richard@dan.rpsys.net has quit [Ping timeout: 248 seconds]
09:37 <+koen> so if you use DISTRO_FEATURES and/or PACKAGECONFIG you're
forcing a choice on a distro level
09:37 <+khem> I am still not convinced why per recipe configs
09:37 <+koen> I'd like to avoid that where possible
09:37 < fray> yes, that is my expectation -- you are forcing a decision
that affects what is built..
09:38 <+khem> if the feature pans across recipes it makes sense
09:38 <+koen> fray: on a distro level
09:38 <+Tartarus> Hang on, RP just ping'd out
09:38 <+Tartarus> lets pause for a minute
09:38 <+Tartarus> So we don't have to paste him 600 lines :)
09:39 <+khem> or is it an effort that we want to reduce recipe appends and
move the same to a local.conf or some such
09:39 < fray> koen -- both distro flags and recipe flags affect the
produced distribution.  I think that is an important thing to remember when
someone implements one.
09:39 <+koen> I agree that for some recipes distro flags make sense, e.g.
'core' recipes and x11, but for others the multiple recipe or "just accept
X is getting built for gstreamer" might work better
09:39 < fray> alternatives is a different approach to resolving an issue --
it moves the decision to the image install (binaries) vs build-time..
09:40 <+Tartarus> Note that lots of people are picky about build-time
09:40 <+Tartarus> (with good reason)
09:40 <+koen> Tartarus: sstate cures that and brings world peace
09:40 < fray> build-time, as well as not wanting the choice at
install-time..  IMHO one thing we currently don't have is a good mechanism
to choose from alternatives
09:40 <+khem> fray: you mean build a package multiple times ?
09:40 < fray> (at install time)
09:41 < fray> khem, no alternatives as in the gpe / opie thing koen
mentioned
09:41 <+khem> ok
09:41 < fray> looks like RP might have completely fallen off the net..
09:41 <+koen> 'RP' is still online
09:41 <+koen> 'RP__' isn't
09:42 -!- mode/#oe-tsc [+o Tartarus] by ChanServ
09:43 <+koen> IMO we need to look at using DISTRO_FEATURES/PACKAGECONFIG on
a per recipe basis
09:43 <+koen> and not say "it's the default solution"
09:43 -!- RP__ ~richard@dan.rpsys.net has joined #oe-tsc
09:43 < fray> RP__ back?
09:43 <@Tartarus> RP__: http://pastebin.com/nFNeuEPx brings you up to date
09:43 < RP__> Am I back now?
09:43 <+koen> OE shouldn't become like GNOME3
09:44 < RP__> ok, so I was talking to myself for a while :(
09:44 < fray> let us know when you've caught up, etc..  :)
09:46 < RP__> so having ways of handling recipe based configuration as a
customisation is still something some people are going to want even if its
"derived" from a distro flag
09:46 < RP__> In terms of implementation, one of the constraints needs to
be that the default behaviour doesn't change
09:46 < RP__> The patch on the mailing list that triggered this discussion
fell down in that regard
09:46 < RP__> The second place it fell down in my opinion is it didn't
follow through on the defaults from the distro features
09:46 < RP__> So now looking specifically at the options we have for distro
and recipe features
09:46 < RP__> We currently have various distro conditional statements
springing up throughout the codebase. I can't say I love the syntax but
I've yet to come up with anything better
09:46 < RP__> There are some cases where its possible to split the recipe
into two e.g. avahi and avahi-ui
09:46 < RP__> Unfortunately these recipes duplicate build time and parse
time and are rather ungainly in their appearance at the code level
09:46 < RP__> They're also fragile and easy to screw up. The avahi recipe
is currently broken and causing races as both recipes are installing files
into the sysroot and conflicting with each other :(
09:46 < RP__> See failures in the Yocto autobuilder as proof I think there
is a time and a place for such recipes, qt4 is an example of where such a
split does make sense and can be made to work particularly where parallel
installs of something make sense but so far the ugliness and how hard these
things are to get right is favouring me at least to look for alternaives
09:47 < RP__> Sorry, I've pasted my backlog, still reading your conversation
09:48 < RP__> Am I still here?
09:48 <+khem> I agree on constaints
09:48 < fray> yes
09:48 < fray> Ya I do as well.. I'm failing at summarizing my thoughts
though
09:49 < RP__> So what I'm proposing that that nothing should really change
for distros or recipes *by default*
09:49 < fray> as a distribution creator, I need to set constraints on what
(or more to the point how) things are built to generate my binary package
set
09:49 < RP__> i.e. the default PACKAGECONFIG for a given recipe should
really be as it is today
09:49 < fray> then a second step is installing those into the image, by
chosing the correct set to get hte image I want..
09:50 < RP__> however I do thing we need to start allowing people to be
able to customise recipe configuration on a per recipe basis more easily
09:50 < fray> we need a way to make choices -- and we need a mechanism to
provide alternative packages when the distribution creator can't/doesn't
want to make the image choice early..
09:50 < fray> correct?
09:50 < RP__> If they do this, all bets are off as far as distro
compatibility goes
09:50 < fray> RP__ for the most part I agree..  I think most of our recipes
the defaults are correct.. but it's something to evalute as time goes on..
09:50 <+khem> I think it should be made easy enough to change the
PACKAGECONFIG if one has to
09:51 < RP__> fray: yes, we can and will continue to do that
09:51 < fray> my users don't want distro compatibility.. they want their
requirements reflected in the produced distro
09:51 <+khem> may be it should be dumped by bitbake somewhere during build
09:51 < RP__> so for example, if there is an X11 related PACKAGE_CONFIG
option, it should be pulling that from DISTRO_FEATURES by default
09:51 < fray> RP__ agreed
09:51 < RP__> so the build output is maximal
09:51 < fray> pam, selinux, x11, directfb, ... these are all distro wide
decisions to me
09:52 <@Tartarus> But again, while we need to support the 'world' type
distro too
09:52 <+koen> not in all cases
09:52 < RP__> and its those maximal configurations angstrom, yocto and
others continue to work on
09:52 < fray> do I support md4 in openssl, that is a local recipe decision
09:52 <@Tartarus> ie "here's the feed of everything, you pick the binaries
you need"
09:52 < RP__> Tartarus: this is why I'm suggesting maximal(ish)
configurations by defaults (as today)
09:52 < fray> Tartarus yes.. difference from highly tailored embedded
distro to more generic distro
09:52 <@Tartarus> RP__: that's not right, for angstrom if I follow koen
right
09:53 < RP__> Tartarus: have you an exmaple
09:53 <@Tartarus> Both foo+x11 and foo+nox11 .ipk should be able to be built
09:53 <+koen> within reasonable limits
09:53 <@Tartarus> Or more concrete, qt/e and qt/x11
09:53 <@Tartarus> right koen?
09:53 <+koen> right
09:53 < RP__> well, qt is a good example
09:53 <+koen> qt is a great example
09:53 < RP__> and I'm not proposing that change
09:54 < RP__> however pulseaudio as part of qt is perhaps a different
question
09:54 < fray> I think the answer there (distro flag was) is you (don't
disable) x11 and (enable) directfb -- or whatever the qt/e technology in
question is..
09:54 < RP__> we don't want recipe sfor qt/e with pa, qt/e without pa and
so on
09:54 <@Tartarus> fray: That's just what we don't want
09:54 < fray> but that will require recipes and knowledge to determine what
to do for conflicting distro flags
09:54 <@Tartarus> Again, if I follow koen right, we want to be able to do
bitbake qt4-x11 qt4-e
09:55 <+koen> qt has a plugin architecture, so if you don't care about
buildtime, don't install the <foo> plugin
09:55 <@Tartarus> and get the ipks for both
09:55 <+koen> e.g. don't install phonon-backend-pulse
09:55 < RP__> koen: doesn't work for pulseaudio :(
09:55 < fray> koen, but only if the runtime plug-ins are enabled
09:55 < RP__> koen: I was told it wasn't a module :/
09:55 < fray> but that is different.. a plug-in architecture can be defined
at install time, not build-time
09:55 < RP__> koen: If that isn't true then its a different question
09:55 <+koen> RP__: I haven't checked, but I'd be surprised if it wasn't
09:56 < RP__> koen: bluelightning checked and said it was a hard depends :(
09:56 < fray> policy wise -- for things that have a runtime plUg-in
architecture.. it's reasonable (IMHO) to select the items at image time..
(somehow)
09:56 <+khem> fray: with IMAGE_FEATURES may be
09:57 < fray> khem, yes perhaps
09:57 <@Tartarus> OK, pause please
09:57 <@Tartarus> lets not get off in the weeds on QT
09:57 <@Tartarus> That's a specific problem we need to sort out how to fit
into the general implementation we need to agree on
09:58 <+koen> I think I can summarize my position as: let's investigate if
there's a (real) need to support multiple parallel configs, if not ->
USEFLAG
09:58 < fray> koen I think that is a reasonable policy statement when
someone suggests a flag usage
09:58 < RP__> koen: I think that sums up the distinction well
09:59 < RP__> Taking some examples, its clear there is a need for qt
09:59 < fray> (implementation wise, I do have a concern with flags that we
could end up with ones the people don't know about.. so why have them)
09:59 <+khem> ok, I am still not convinced so I need to do my homework
learn use cases etc.
09:59 < RP__> What about avahi?
10:00 < RP__> and then the question of distcc
10:00 <+koen> iirc distcc is covered by the x11 flag
10:00 < fray> in both of those cases -- if the distro flag for X11 is
present, then the system is saying go ahead and use it..  the recipes
should break out the UI parts into subpackages..
10:00 < fray> so if during the final image create X11 isn't desired, then
it won't cause it to be pulled in.. but yet it's still available in the feed
10:01 < RP__> koen: but can we do it through the PACKAGECONFIG mechanism
based on DISTRO_FEATURES?
10:01 <+koen> the avahi problem is more subtle
10:01 <+koen> RP__: right
10:01 <+koen> avahi will link everything to gtk+ if you enable the UI
10:01 <+koen> while it only needs to link the ui lib
10:01 <+koen> that's how it was in the past
10:01 < fray> that to me seems like a recipe/package bug -or- a reason to
split it..
10:01 < RP__> koen: That sounds like a bug we should fix in avahi tbh
10:02 <+koen> RP__: agreed
10:02 < fray> again in that case a split can be justified (or a bug fix)
10:02 < fray> ...of course do we end up with a flag that says if gtk+ is
available or not?
10:02 < RP__> So in the distcc case (or avahi assuming it doesn't do insane
linking), my thought was  PACKAGECONFIG ??=
"${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}
10:02 < RP__> or something like that
10:02 < fray> I've built systems before w/ no x11, but did have gtk+ (and
directfb)
10:03 < RP__> fray: hence the "something like that"
10:03 < fray> RP__ ya.. that seems reasonable..
10:03 < fray> the issue though is there some mechanism for a recipe to
self-document it's packageconfig usages?  if not that would likely be a
good thing to do ASAP, so it becomes standard
10:04 < RP__> The benefit of this is that its a sane default (no change)
but allows people to override under certain circumstances (and which point
we should be clear they're on their own)
10:04 < fray> RP__ yes, that looks reasonable to me
10:04 <+khem> I think we need to capture configure arguments in .ipks or
rpms too
10:04 < fray> (rpms it can be easy.. there is a mechanism called arbitrary
tags where we can shove whatever data we want into)
10:05 < RP__> khem: Changing PACKAGECONFIG is like changing
DISTRO_FEATURES, bets are off when you start playing with these
10:05 < fray> --or-- the packageconfig values can be put into the package
descriptions...
10:05 < RP__> a feed needs a consistent set of the variables
10:05 < fray> RP__ agreed.. these settings are distro wide.. so change it
and the feed changes
10:05 <+khem> RP__: yes, however the cases I have been thinking easily were
going into DISTRO_FEATURES in my head
10:06 <+khem> but I am not opposed to change
10:06 < fray> the more i think about it, the more I like distro_features
becoming promoted into packageconfig on a person recipe basis
10:07 < fray> it allows someone to override, but makes the assumption that
most settings are derived from distro features
10:07 <+khem> RP__: many times there will be support questions because of
PACKAGECONFIG
10:07 < RP__> fray: right, I've come to that conclusion over time (and
believe me, I've given this a lot of thought)
10:08 < RP__> koen/Tartarus: Where are your thoughts at?
10:08 < fray> khem, ya.. we will need a way to embed the values somewhere
so it can be retrieved..
10:08 <@Tartarus> thinking
10:09 < RP__> FWIW you can add arbitrary tags to ipks as well
10:09 < fray> ahh, didn't know that, what about deb?
10:09 < RP__> whether the tools/indexers show them different question
10:09 <@Tartarus> I think we're keeping all 3 of the use cases in mind
10:10 <@Tartarus> (3 == defaults, customized device build and 'world'
distro)
10:10 <+koen> PACKAGECONFIG is nearly always tied to DISTRO_FEATURES (when
it's used correctly)
10:10 < RP__> Tartarus: yes, I think all three should be covered
10:10 < RP__> koen: agreed, there will often be (and should be) a tie
10:11 < RP__> I say often as there might be cases where a distro wide
feature doesn't make sense
10:12 < RP__> I do realise that going forward we're going to see a lot more
of these PACKAGE_CONFIG options. Its why I've looked long and hard at the
syntax and tried to come up with something neat
10:12 < RP__> The defaults from DISTRO_FEATURES is less neat atm
10:12 < RP__> but I believe we'll find a way to figure that piece out
10:13 < RP__> even if its syntax like DISTRO:x11 or something
10:13 <+khem> RP__: where will PACKAGECONFIG exist in implementation ?
10:13 < RP__> khem: it already exists today in base.bbclass
10:13 <+khem> recipe .bb ?
10:13 <+khem> RP__: I meant the use of it
10:13 < RP__> khem: yes, recipe .bb or .inc
10:14 < RP__> Its all "metadata" rather than any real code
10:14 < RP__> particularly if we support some syntax like DISTRO:x11
10:15 <+koen> should we move on to other topics n the agenda now?
10:15 <+khem> RP__: then distros which want different PACKAGECONFIG has to
override the recipe or .bbappend to it ?
10:15 <@Tartarus> If we're good and everyone else has time
10:15 < RP__> khem: Its a ??= so they can set PACKAGE_CONFIG_pn-XXX
10:15 < RP__> khem: so yes
10:15 <+khem> ok

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e87d0905e9804b295f801
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">OE-TSC Meeti=
ng 22-Nov-2011</div><div style=3D"color: rgb(34, 34, 34); font-family: aria=
l, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917=
969); ">
_________________________________________________________________</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Attending: Mark,=
 Koen, Richard, Khem, Tom</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Apologies: J=
efro</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
_________________________________________________________________</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Agenda &amp; Res=
ults</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); "><br></div><d=
iv style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-si=
ze: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
*) Select a chair...</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">Tom</div><div style=3D"color: rgb(34, 34, 34); font-family: a=
rial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.=
917969); ">
<br></div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">*)=
 Other issues?</div><div style=3D"color: rgb(34, 34, 34); font-family: aria=
l, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917=
969); ">
intralayer dependencies</div><div style=3D"color: rgb(34, 34, 34); font-fam=
ily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 2=
55, 0.917969); "><br></div><div style=3D"color: rgb(34, 34, 34); font-famil=
y: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255=
, 0.917969); ">
*) Revise the TSC&#39;s normal meeting time</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">meetings now set for Tuesday 9amPST =
=3D 11amCST =3D 5pmGMT</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Jefro will a=
ttempt to alter schedule, otherwise will create minutes from logs</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
<br></div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">*)=
 Discuss the PACKAGECONFIG policy</div><div style=3D"color: rgb(34, 34, 34)=
; font-family: arial, sans-serif; font-size: 13px; background-color: rgba(2=
55, 255, 255, 0.917969); ">
Using PACKAGECONFIG needs to get evaluated on a per recipe basis, there is =
no one right way. The rule of thumb:<br><br></div><div style=3D"color: rgb(=
34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-co=
lor: rgba(255, 255, 255, 0.917969); ">
=A0 =A0 =A0 =A0Investigate if there is a need to support multiple parallel =
configs</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans=
-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); "=
>=A0 =A0 =A0 =A0If there isn&#39;t, use PACKAGECONFIG<br>
<br></div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Si=
nce PACKAGECONFIG is a distro-wide choice, it nearly always is coupled to a=
 matching DISTRO_FEATURE. The current syntax for triggering PACKAGECONFIG o=
f DISTRO_FEATURE is clunky and needs improvement.<br>
</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif;=
 font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); "><br></=
div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
Adding PACKAGECONFIG options to recipes is ok, as long as the defaults<br>p=
reserve the current settings. The intent is that people should have to<br>o=
pt in to changes unless discussion reflects otherwise.<br><br>The overridin=
g concern is that functionality shouldn&#39;t disappear on<br>
people unless they&#39;ve made a conscious choice to embrace that change. I=
t<br>should also be stressed that changing PACKAGECONFIG is a distro<br>inc=
ompatibility, i.e. distros should use one consistent set of<br>PACKAGECONFI=
G options only.<br>
</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif;=
 font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); "><br></=
div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
*) Other misc items...</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">-- WR Review template?</div><div style=3D"color: rgb(34, 34=
, 34); font-family: arial, sans-serif; font-size: 13px; background-color: r=
gba(255, 255, 255, 0.917969); ">
not discussed, out of time</div><div style=3D"color: rgb(34, 34, 34); font-=
family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255=
, 255, 0.917969); "><br></div><div style=3D"color: rgb(34, 34, 34); font-fa=
mily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, =
255, 0.917969); ">
next meeting scheduled 6-Dec-2011=A0</div><div style=3D"color: rgb(34, 34, =
34); font-family: arial, sans-serif; font-size: 13px; background-color: rgb=
a(255, 255, 255, 0.917969); ">_____________________________________________=
____________________</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">Raw Transcri=
pt</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-seri=
f; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
<br></div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09=
:06 &lt; fray&gt; ok.. it&#39;s time.. anyone else here/</div><div style=3D=
"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; b=
ackground-color: rgba(255, 255, 255, 0.917969); ">
09:06 *** koen waves</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">09:06 *** RP__ is</div><div style=3D"color: rgb(34, 34, 34); =
font-family: arial, sans-serif; font-size: 13px; background-color: rgba(255=
, 255, 255, 0.917969); ">
09:07 &lt; fray&gt; Is anyone logging this?</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">09:08 *** RP__ is logging</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">
09:08 &lt; fray&gt; &#39;k..</div><div style=3D"color: rgb(34, 34, 34); fon=
t-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 2=
55, 255, 0.917969); ">09:08 &lt; fray&gt; Does anyone have an agenda to go =
over?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:08 &lt; R=
P__&gt; well, the question is whether the three of us can be productive</di=
v>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:08 &lt;+k=
hem&gt; I am here guys</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">
09:08 &lt;+khem&gt; gm</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">09:08 &lt; RP__&gt; cool, hi khem</div><div style=3D"color:=
 rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgrou=
nd-color: rgba(255, 255, 255, 0.917969); ">
09:08 &lt; fray&gt; Tartarus the only one missing?</div><div style=3D"color=
: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgro=
und-color: rgba(255, 255, 255, 0.917969); ">09:09 &lt; RP__&gt; fray: yes</=
div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:09 &lt; R=
P__&gt; and Jefro but that is expected</div><div style=3D"color: rgb(34, 34=
, 34); font-family: arial, sans-serif; font-size: 13px; background-color: r=
gba(255, 255, 255, 0.917969); ">
09:09 &lt;+koen&gt; I&#39;ll poke tartarus on our work channel</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 -!- Tartarus=
=A0<a href=3D"mailto:trini@pixelshelf.com" target=3D"_blank" style=3D"color=
: rgb(17, 85, 204); ">trini@pixelshelf.com</a>=A0has joined #oe-tsc</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 -!- mo=
de/#oe-tsc [+v Tartarus] by ChanServ</div><div style=3D"color: rgb(34, 34, =
34); font-family: arial, sans-serif; font-size: 13px; background-color: rgb=
a(255, 255, 255, 0.917969); ">
09:11 &lt; RP__&gt; koen: Did you read the last meeting&#39;s logs?</div><d=
iv style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-si=
ze: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 &lt;+koe=
n&gt; RP__: I did</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 &lt; R=
P__&gt; hi Tartarus</div><div style=3D"color: rgb(34, 34, 34); font-family:=
 arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, =
0.917969); ">
09:11 &lt;+Tartarus&gt; sorry all, had to put daughter down for a nap</div>=
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 &lt; R=
P__&gt; koen: any questions/concerns?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:11 &lt;+k=
oen&gt; although is was at 3AM</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">
09:11 &lt;+koen&gt; AIUI you guys says &quot;postpone till next meeting&quo=
t;</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-seri=
f; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:1=
1 &lt; RP__&gt; koen: on that specific topic, yes</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:12 &lt; R=
P__&gt; so we&#39;re all here</div><div style=3D"color: rgb(34, 34, 34); fo=
nt-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, =
255, 255, 0.917969); ">
09:12 &lt; fray&gt;=A0<a href=3D"http://pastebin.com/LN5SX1bk" target=3D"_b=
lank" style=3D"color: rgb(17, 85, 204); ">http://pastebin.com/LN5SX1bk</a><=
/div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; =
font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:12 &lt; RP__&gt; volunteer to chair?</div><div style=3D"color: rgb(34, 3=
4, 34); font-family: arial, sans-serif; font-size: 13px; background-color: =
rgba(255, 255, 255, 0.917969); ">09:12 &lt; fray&gt; that is what I have fo=
r an agenda</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:12 &lt; R=
P__&gt; I can volunteer</div><div style=3D"color: rgb(34, 34, 34); font-fam=
ily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 2=
55, 0.917969); ">
09:13 &lt; RP__&gt; but jefro complains I always do ;-)</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">09:13 &lt; fray&gt; hey I =
did it last week.. ;)</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:13 &lt; R=
P__&gt; fray: I know :)</div><div style=3D"color: rgb(34, 34, 34); font-fam=
ily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 2=
55, 0.917969); ">
09:13 &lt;+khem&gt; ok let me volunteer this time</div><div style=3D"color:=
 rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgrou=
nd-color: rgba(255, 255, 255, 0.917969); ">09:13 &lt;+Tartarus&gt; i&#39;ll=
 do it this week</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:13 &lt;+T=
artarus&gt; heh</div><div style=3D"color: rgb(34, 34, 34); font-family: ari=
al, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.91=
7969); ">
09:13 &lt; fray&gt; :)</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">09:13 &lt;+khem&gt; ok Tartarus it is</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">
09:13 &lt; RP__&gt; Tartarus: go for it</div><div style=3D"color: rgb(34, 3=
4, 34); font-family: arial, sans-serif; font-size: 13px; background-color: =
rgba(255, 255, 255, 0.917969); ">09:13 &lt;+Tartarus&gt; Someone logging?</=
div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:14 &lt; f=
ray&gt; RP is</div><div style=3D"color: rgb(34, 34, 34); font-family: arial=
, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.9179=
69); ">
09:14 *** khem is</div><div style=3D"color: rgb(34, 34, 34); font-family: a=
rial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.=
917969); ">09:14 &lt;+Tartarus&gt; k</div><div style=3D"color: rgb(34, 34, =
34); font-family: arial, sans-serif; font-size: 13px; background-color: rgb=
a(255, 255, 255, 0.917969); ">
09:14 &lt; RP__&gt; Tartarus: yes, I&#39;ll get jefro the logs</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">09:14 &lt;+Tartarus=
&gt; So, other issues?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:14 &lt; R=
P__&gt; I think those are the main ones</div><div style=3D"color: rgb(34, 3=
4, 34); font-family: arial, sans-serif; font-size: 13px; background-color: =
rgba(255, 255, 255, 0.917969); ">
09:14 &lt;+Tartarus&gt; OK, so meeting time</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">09:14 &lt;+Tartarus&gt; Um, does this =
time work for everyone normally, aside from Jefro?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:14 &lt; R=
P__&gt; Tartarus: yes</div><div style=3D"color: rgb(34, 34, 34); font-famil=
y: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255=
, 0.917969); ">
09:14 &lt;+khem&gt; I dont have any issues other than we should think of wa=
ys/process for intra layer deps</div><div style=3D"color: rgb(34, 34, 34); =
font-family: arial, sans-serif; font-size: 13px; background-color: rgba(255=
, 255, 255, 0.917969); ">
09:14 &lt; fray&gt; Works for me</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">09:14 &lt; RP__&gt; much better for me</div><div =
style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size:=
 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:15 &lt; fray&gt; ohh actually wait.. I do have another issue -- but it c=
an wait until next week..</div><div style=3D"color: rgb(34, 34, 34); font-f=
amily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255,=
 255, 0.917969); ">
09:15 &lt;+khem&gt; It works for me</div><div style=3D"color: rgb(34, 34, 3=
4); font-family: arial, sans-serif; font-size: 13px; background-color: rgba=
(255, 255, 255, 0.917969); ">09:15 &lt;+Tartarus&gt; koen, this time works =
for you as well?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:15 &lt;+k=
oen&gt; this time works for me as well</div><div style=3D"color: rgb(34, 34=
, 34); font-family: arial, sans-serif; font-size: 13px; background-color: r=
gba(255, 255, 255, 0.917969); ">
09:15 &lt; fray&gt; someone was asking me about meta-oe vs oe-core.. policy=
 on when things go where and who monitors it&#39;s being followed</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:15 &lt;+khem&gt; 2 hrs early would be ok too</div><div style=3D"color: r=
gb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background=
-color: rgba(255, 255, 255, 0.917969); ">09:15 &lt;+Tartarus&gt; -2h from n=
ow is a bit too early for me</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:16 &lt;+k=
hem&gt; ok lets pin on this time then</div><div style=3D"color: rgb(34, 34,=
 34); font-family: arial, sans-serif; font-size: 13px; background-color: rg=
ba(255, 255, 255, 0.917969); ">
09:16 &lt;+Tartarus&gt; So, I think we should try and keep to this time and=
 either ask Jefro if he can re-arrange or we&#39;ll just live with getting =
him the logs to make minutes from?</div><div style=3D"color: rgb(34, 34, 34=
); font-family: arial, sans-serif; font-size: 13px; background-color: rgba(=
255, 255, 255, 0.917969); ">
09:16 &lt;+Tartarus&gt; Anyone disagree?</div><div style=3D"color: rgb(34, =
34, 34); font-family: arial, sans-serif; font-size: 13px; background-color:=
 rgba(255, 255, 255, 0.917969); ">09:16 &lt; RP__&gt; Tartarus: sounds like=
 a good plan to me</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:16 &lt;+T=
artarus&gt; OK, next item, PACKAGECONFIG</div><div style=3D"color: rgb(34, =
34, 34); font-family: arial, sans-serif; font-size: 13px; background-color:=
 rgba(255, 255, 255, 0.917969); ">
09:16 &lt; fray&gt; works for me</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">09:17 &lt;+Tartarus&gt; Last week I summarized wh=
at I thought what koen was saying, then said lets wait for him to be here</=
div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:17 &lt;+T=
artarus&gt; But it&#39;d be best I think if koen summarized what he sees as=
 the problem himself</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:17 &lt;+k=
oen&gt; I get the impression it is a solution waiting for a problem</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:18 &lt;+k=
oen&gt; and RP seems to like his new hammer and treats every problem as a n=
ail</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:18 &lt;+T=
artarus&gt; Some form of USE flag not called a USE flag is a problem</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:18 &lt;+T=
artarus&gt; We did agree there before, I thought</div><div style=3D"color: =
rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgroun=
d-color: rgba(255, 255, 255, 0.917969); ">
09:18 &lt;+Tartarus&gt; back at the f2f meeting in SF</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">09:18 &lt;+koen&gt; I severe=
ly object to the &quot;we have packageconfig, so it is the only acceptable =
solution&quot; mentality</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:19 &lt; R=
P__&gt; koen: Ok, so you have two things there. Whether we need it at all a=
nd when it should be used</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:19 &lt;+k=
oen&gt; AFAICT we agreed to the need for useflags and also that they are a =
last resort</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:19 &lt; R=
P__&gt; koen: On the first subject, is there a need?</div><div style=3D"col=
or: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backg=
round-color: rgba(255, 255, 255, 0.917969); ">
09:19 &lt; fray&gt; koen, I don&#39;t think it&#39;s the ONLY solution, but=
 I do think it needs to be the primary solution, unless someone can justify=
 something else on a package</div><div style=3D"color: rgb(34, 34, 34); fon=
t-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 2=
55, 255, 0.917969); ">
09:19 &lt; RP__&gt; User feedback says yes, people want a way of disabling =
things like X11, configuring which gstreamer plugins to build and so forth<=
/div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; =
font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:19 &lt;+khem&gt; will it be globally specified or per recipe ?</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:19 &lt; RP__&=
gt; should pulseaudio get used in qt?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:20 &lt; f=
ray&gt; I see a need, so I can change default behaviors per recipe</div><di=
v style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-siz=
e: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:20 &lt; RP__&gt; Can we please discuss this in some kind of order?</div>=
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:20 &lt;+k=
oen&gt; is qt going to change to packageconfig?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:20 &lt; f=
ray&gt; but -I- expect a change to be made on a distro basis..</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">
09:20 &lt;+koen&gt; so a distro needs to choose between qt/e and qt/x11?</d=
iv><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; fo=
nt-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:20 &lt=
; RP__&gt; If we all ask random questions and skip to implementation this i=
s going to be an impossible discussion to have</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:20 &lt;+k=
oen&gt; that&#39;s what you&#39;re saying</div><div style=3D"color: rgb(34,=
 34, 34); font-family: arial, sans-serif; font-size: 13px; background-color=
: rgba(255, 255, 255, 0.917969); ">
09:21 &lt; RP__&gt; koen: no, at this point I;&#39;m saying there are some =
usecases we don&#39;t have a good solution for without PACKAGECONFIG</div><=
div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-s=
ize: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:21 &lt; RP__&gt; so is there a need for something, I believe the answer =
to be yes</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sa=
ns-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969);=
 ">
09:22 &lt; RP__&gt; What really convinced me of this is the idea of trying =
to customise some configuration from a layer</div><div style=3D"color: rgb(=
34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-co=
lor: rgba(255, 255, 255, 0.917969); ">
09:22 &lt; fray&gt; I see three steps of distro creation? =A0 Selecting the=
 source packages to build.. =A0Selecting the &quot;distro config&quot; to s=
elect multiple package settings, and packageconfig settings when tailoring =
a specific recipe. =A0 packageconfig though is recipe specific.</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:22 &lt; R=
P__&gt; Several people out there are trying to do this and finding it very =
hard. I have difficulty in saying &quot;no you cannot disable configure opt=
ion XXX&quot; and you should use what is in the core or not at all</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:23 &lt;+k=
hem&gt; I see it complicating the things=A0</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">
09:23 &lt;+koen&gt; a lot of issues can be solved by having 2 recipes, like=
 we have in OE-classic</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">
09:23 &lt; RP__&gt; We&#39;re supposed to be about flexibility and configur=
abilty so making it hard for people doesn&#39;t seem right</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:23 &lt;+khem&gt; RP__: what will it be limited too</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">09:23 &lt; RP__&gt; koen: ag=
reed and this is a big worry</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:23 &lt;+k=
oen&gt; but apparently &quot;parse time&quot; is more important</div><div s=
tyle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: =
13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:23 &lt; fray&gt; Khem, I agree.. that is the one concern I have with the=
 flags approach. =A0It makes it much harder to test, if you want to support=
 all combinations</div><div style=3D"color: rgb(34, 34, 34); font-family: a=
rial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.=
917969); ">
09:24 &lt;+koen&gt; I like having the option to include mplayer with and wi=
thout X support in an image</div><div style=3D"color: rgb(34, 34, 34); font=
-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 25=
5, 255, 0.917969); ">
09:24 &lt;+koen&gt; WITHOUT changing distro</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">09:24 &lt; RP__&gt; koen: I&#39;m not =
discussing implementation yet</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:24 &lt; R=
P__&gt; I&#39;m trying to explain the needs</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">
09:24 &lt; RP__&gt; Are we clear on the need or not?</div><div style=3D"col=
or: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backg=
round-color: rgba(255, 255, 255, 0.917969); ">09:24 &lt; fray&gt; I believe=
 it -is- needed, but policy is that default configuration must be reasonabl=
e...</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:25 &lt;+T=
artarus&gt; I don&#39;t think we&#39;re totally clear on the need</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:25 &lt;+Tartarus&gt; All of them, at least</div><div style=3D"color: rgb=
(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-c=
olor: rgba(255, 255, 255, 0.917969); ">09:25 &lt;+koen&gt; I agree that it&=
#39;s needed, but it still needs to be a last resort</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:25 &lt; R=
P__&gt; Tartarus: me neither which is why I don&#39;t want to skip to imple=
mentation :/</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:25 &lt; f=
ray&gt; I think it&#39;s reasonable to say alternative configurations shoul=
d be justified, and unit testing on a recipe basis is needed by the maintai=
ner of the package..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:25 &lt;+k=
hem&gt; so we need it to configure distro ? images ?=A0</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">
09:25 &lt;+Tartarus&gt; So, I think on the &#39;needs&#39; side, we also ne=
ed to include something about what this implies to the implementation</div>=
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:26 &lt; fray&gt; what I don&#39;t want to see is a recipe that every pos=
sible option to &#39;configure&#39; is spelled out within a packageconfig s=
etting..</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, san=
s-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); =
">
09:26 &lt;+Tartarus&gt; IOW, if I want to change how it&#39;s built, how mu=
ch of my previous world is now invalid?</div><div style=3D"color: rgb(34, 3=
4, 34); font-family: arial, sans-serif; font-size: 13px; background-color: =
rgba(255, 255, 255, 0.917969); ">
09:26 &lt; RP__&gt; My big concern is that if we don&#39;t have something i=
n the core, we&#39;ll end up with all kinds of half complete custom solutio=
ns with people hacking it to fit their needs</div><div style=3D"color: rgb(=
34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-co=
lor: rgba(255, 255, 255, 0.917969); ">
09:26 &lt; RP__&gt; and the OE project will get a bad name as a result</div=
><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font=
-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:26 &lt; =
fray&gt; RP__, I&#39;ve already seen some of that</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:26 &lt; R=
P__&gt; fray: right :(</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">
09:27 &lt;+khem&gt; fray: e.g.</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">09:27 &lt; RP__&gt; This is also a topic which has =
been &quot;punted&quot; at several OEDEMs</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:27 &lt; f=
ray&gt; lots of misc .bbappend files that simply change a small config sett=
ing...</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:27 &lt; R=
P__&gt; &quot;too hard&quot;, &quot;no resources&quot;</div><div style=3D"c=
olor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; bac=
kground-color: rgba(255, 255, 255, 0.917969); ">
09:27 &lt; RP__&gt; pb_ for example has for a long time wanted to disable X=
 completely</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, =
sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969=
); ">
09:28 &lt; fray&gt; when we have altenative configurations that are reasona=
ble, I believe there needs to be a way for them to go into oe-core</div><di=
v style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-siz=
e: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:28 &lt; fray&gt; (I see X btw as a distro flag -- because it affects mor=
e then one recipe)</div><div style=3D"color: rgb(34, 34, 34); font-family: =
arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0=
.917969); ">
09:28 &lt; RP__&gt; I&#39;ve also heard of people wanting to customise gstr=
eamer plugin dependencies as there are things they need to add and things t=
hey&#39;re clearly never going to want</div><div style=3D"color: rgb(34, 34=
, 34); font-family: arial, sans-serif; font-size: 13px; background-color: r=
gba(255, 255, 255, 0.917969); ">
09:28 &lt;+Tartarus&gt; Well, do we agree that how the choice of what is in=
, and how changing that choice impacts what was already built, is part of t=
he needs?</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sa=
ns-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969);=
 ">
09:28 &lt; fray&gt; BTW I think this is potentially another gotcha we have =
to be aware of.. =A0people using recipe flags when they&#39;re really distr=
o flags..</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sa=
ns-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969);=
 ">
09:29 &lt; fray&gt; Tartarus it is for me.</div><div style=3D"color: rgb(34=
, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-colo=
r: rgba(255, 255, 255, 0.917969); ">09:29 &lt;+koen&gt; or even image flags=
</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:29 &lt; f=
ray&gt; ya, and image flags</div><div style=3D"color: rgb(34, 34, 34); font=
-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 25=
5, 255, 0.917969); ">
09:29 &lt;+koen&gt; e.g. qt</div><div style=3D"color: rgb(34, 34, 34); font=
-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 25=
5, 255, 0.917969); ">09:29 &lt;+khem&gt; RP__: why dont extend distro_featu=
res=A0</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:29 &lt;+k=
oen&gt; I do NOT want that to get an x11 packageconfig flag</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:29 &lt;+Tartarus&gt; Since we need to support, in the end, both &quot;wo=
rld&quot; distros like angstrom</div><div style=3D"color: rgb(34, 34, 34); =
font-family: arial, sans-serif; font-size: 13px; background-color: rgba(255=
, 255, 255, 0.917969); ">
09:29 &lt;+Tartarus&gt; and device specific custom builds</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">09:30 &lt; fray&gt; ko=
en, I think an x11 packageconfig flag is incorrect.. that is a distro flag.=
</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:30 &lt; R=
P__&gt; So do we agree there are users asking for recipe *and* distro *and*=
 image based control of configuration?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:30 &lt; f=
ray&gt; RP__, again, I agree that is hte need.</div><div style=3D"color: rg=
b(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-=
color: rgba(255, 255, 255, 0.917969); ">
09:30 &lt; RP__&gt; I&#39;m going to assume yes here so now lets look at th=
e constraints we have</div><div style=3D"color: rgb(34, 34, 34); font-famil=
y: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255=
, 0.917969); ">
09:30 &lt; fray&gt; can we define image control though -- this is what is b=
uilt (sources)? =A0what is installed (binaries)? =A0or?</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">
09:31 &lt; RP__&gt; Image based control I think we do well enough today</di=
v><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; fon=
t-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:31 &lt;=
 fray&gt; can you give me an example?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:31 &lt; R=
P__&gt; i.e. we split things up into very granular packages and you chose w=
hich to install</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:31 &lt; f=
ray&gt; ok, thanks.. then I am thinking the same</div><div style=3D"color: =
rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgroun=
d-color: rgba(255, 255, 255, 0.917969); ">
09:32 &lt; RP__&gt; some things definetely need to operate at the distro le=
vel</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-ser=
if; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:=
32 &lt; RP__&gt; in general I agree X11 should be something the distro choo=
ses</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:32 &lt;+T=
artarus&gt; So, other needs we need to discuss?</div><div style=3D"color: r=
gb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background=
-color: rgba(255, 255, 255, 0.917969); ">
09:32 &lt;+Tartarus&gt; Or shall we really get into implementation details =
now</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-ser=
if; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:=
32 &lt; RP__&gt; however I can sympathise with the case where someone doesn=
&#39;t want package X pulling in X</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:34 &lt; f=
ray&gt; at WR (non bitbake, so it is different!) we have a concept of autom=
atic &quot;recipe&quot; flags.. =A0i.e. if the user has decided to build ex=
pat, then things that might work with expat are told it&#39;s now available=
...</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:34 &lt; f=
ray&gt; but if you just request the item (and expat isn&#39;t there), it&#3=
9;s not added to the dependency list..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:34 &lt; f=
ray&gt; I see this as somewhat the same concept.. but with a bit more expli=
cit setting when the default isn&#39;t what someone wants</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:35 &lt; f=
ray&gt; (the current WR approach won&#39;t work with bitbake because there =
isn&#39;t a static list of sources the user has said they want to build the=
 final image..)</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:35 &lt;+k=
oen&gt; as an example: I do not want to go back to the time where a distro =
had to choose between opie or gpe, but couldn&#39;t build both</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:36 &lt;+k=
oen&gt; that&#39;s why we had virtual/sdl</div><div style=3D"color: rgb(34,=
 34, 34); font-family: arial, sans-serif; font-size: 13px; background-color=
: rgba(255, 255, 255, 0.917969); ">
09:36 &lt;+koen&gt; (which is not the best example, but a decent illustrati=
on)</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-ser=
if; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:=
36 &lt; fray&gt; I understand the desire.. =A0I think this is someone we ha=
ve to keep in mind as we frame the discussion on recipe flags</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:36 -!- RP=
__ ~<a href=3D"mailto:richard@dan.rpsys.net" target=3D"_blank" style=3D"col=
or: rgb(17, 85, 204); ">richard@dan.rpsys.net</a>=A0has quit [Ping timeout:=
 248 seconds]</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:37 &lt;+k=
oen&gt; so if you use DISTRO_FEATURES and/or PACKAGECONFIG you&#39;re forci=
ng a choice on a distro level</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:37 &lt;+k=
hem&gt; I am still not convinced why per recipe configs=A0</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:37 &lt;+koen&gt; I&#39;d like to avoid that where possible</div><div sty=
le=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13=
px; background-color: rgba(255, 255, 255, 0.917969); ">09:37 &lt; fray&gt; =
yes, that is my expectation -- you are forcing a decision that affects what=
 is built..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:38 &lt;+k=
hem&gt; if the feature pans across recipes it makes sense=A0</div><div styl=
e=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13p=
x; background-color: rgba(255, 255, 255, 0.917969); ">
09:38 &lt;+koen&gt; fray: on a distro level</div><div style=3D"color: rgb(3=
4, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-col=
or: rgba(255, 255, 255, 0.917969); ">09:38 &lt;+Tartarus&gt; Hang on, RP ju=
st ping&#39;d out</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:38 &lt;+T=
artarus&gt; lets pause for a minute</div><div style=3D"color: rgb(34, 34, 3=
4); font-family: arial, sans-serif; font-size: 13px; background-color: rgba=
(255, 255, 255, 0.917969); ">
09:38 &lt;+Tartarus&gt; So we don&#39;t have to paste him 600 lines :)</div=
><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font=
-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:39 &lt;+=
khem&gt; or is it an effort that we want to reduce recipe appends and move =
the same to a local.conf or some such=A0</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:39 &lt; f=
ray&gt; koen -- both distro flags and recipe flags affect the produced dist=
ribution. =A0I think that is an important thing to remember when someone im=
plements one.</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:39 &lt;+k=
oen&gt; I agree that for some recipes distro flags make sense, e.g. &#39;co=
re&#39; recipes and x11, but for others the multiple recipe or &quot;just a=
ccept X is getting built for gstreamer&quot; might work better</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:39 &lt; f=
ray&gt; alternatives is a different approach to resolving an issue -- it mo=
ves the decision to the image install (binaries) vs build-time..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:40 &lt;+T=
artarus&gt; Note that lots of people are picky about build-time</div><div s=
tyle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: =
13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:40 &lt;+Tartarus&gt; (with good reason)</div><div style=3D"color: rgb(34=
, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-colo=
r: rgba(255, 255, 255, 0.917969); ">09:40 &lt;+koen&gt; Tartarus: sstate cu=
res that and brings world peace</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:40 &lt; f=
ray&gt; build-time, as well as not wanting the choice at install-time.. =A0=
IMHO one thing we currently don&#39;t have is a good mechanism to choose fr=
om alternatives</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:40 &lt;+k=
hem&gt; fray: you mean build a package multiple times ?</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">
09:40 &lt; fray&gt; (at install time)</div><div style=3D"color: rgb(34, 34,=
 34); font-family: arial, sans-serif; font-size: 13px; background-color: rg=
ba(255, 255, 255, 0.917969); ">09:41 &lt; fray&gt; khem, no alternatives as=
 in the gpe / opie thing koen mentioned</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:41 &lt;+k=
hem&gt; ok</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, s=
ans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969)=
; ">
09:41 &lt; fray&gt; looks like RP might have completely fallen off the net.=
.</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif=
; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:41=
 &lt;+koen&gt; &#39;RP&#39; is still online</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:41 &lt;+k=
oen&gt; &#39;RP__&#39; isn&#39;t</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">
09:42 -!- mode/#oe-tsc [+o Tartarus] by ChanServ</div><div style=3D"color: =
rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgroun=
d-color: rgba(255, 255, 255, 0.917969); ">09:43 &lt;+koen&gt; IMO we need t=
o look at using DISTRO_FEATURES/PACKAGECONFIG on a per recipe basis</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:43 &lt;+k=
oen&gt; and not say &quot;it&#39;s the default solution&quot;</div><div sty=
le=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13=
px; background-color: rgba(255, 255, 255, 0.917969); ">
09:43 -!- RP__ ~<a href=3D"mailto:richard@dan.rpsys.net" target=3D"_blank" =
style=3D"color: rgb(17, 85, 204); ">richard@dan.rpsys.net</a>=A0has joined =
#oe-tsc</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans=
-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); "=
>
09:43 &lt; fray&gt; RP__ back?</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">09:43 &lt;@Tartarus&gt; RP__:=A0<a href=3D"http://p=
astebin.com/nFNeuEPx" target=3D"_blank" style=3D"color: rgb(17, 85, 204); "=
>http://pastebin.com/nFNeuEPx</a>=A0brings you up to date</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:43 &lt; R=
P__&gt; Am I back now?</div><div style=3D"color: rgb(34, 34, 34); font-fami=
ly: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 25=
5, 0.917969); ">
09:43 &lt;+koen&gt; OE shouldn&#39;t become like GNOME3</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">09:44 &lt; RP__&gt; ok, so=
 I was talking to myself for a while :(</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:44 &lt; f=
ray&gt; let us know when you&#39;ve caught up, etc.. =A0:)</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; so having ways of handling recipe based configuration a=
s a customisation is still something some people are going to want even if =
its &quot;derived&quot; from a distro flag</div><div style=3D"color: rgb(34=
, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-colo=
r: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; In terms of implementation, one of the constraints need=
s to be that the default behaviour doesn&#39;t change</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; The patch on the mailing list that triggered this discu=
ssion fell down in that regard</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; The second place it fell down in my opinion is it didn&=
#39;t follow through on the defaults from the distro features</div><div sty=
le=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13=
px; background-color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; So now looking specifically at the options we have for =
distro and recipe features</div><div style=3D"color: rgb(34, 34, 34); font-=
family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255=
, 255, 0.917969); ">
09:46 &lt; RP__&gt; We currently have various distro conditional statements=
 springing up throughout the codebase. I can&#39;t say I love the syntax bu=
t I&#39;ve yet to come up with anything better</div><div style=3D"color: rg=
b(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-=
color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; There are some cases where its possible to split the re=
cipe into two e.g. avahi and avahi-ui</div><div style=3D"color: rgb(34, 34,=
 34); font-family: arial, sans-serif; font-size: 13px; background-color: rg=
ba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; Unfortunately these recipes duplicate build time and pa=
rse time and are rather ungainly in their appearance at the code level</div=
><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font=
-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; They&#39;re also fragile and easy to screw up. The avah=
i recipe is currently broken and causing races as both recipes are installi=
ng files into the sysroot and conflicting with each other :(</div><div styl=
e=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13p=
x; background-color: rgba(255, 255, 255, 0.917969); ">
09:46 &lt; RP__&gt; See failures in the Yocto autobuilder as proof I think =
there is a time and a place for such recipes, qt4 is an example of where su=
ch a split does make sense and can be made to work particularly where paral=
lel installs of something make sense but so far the ugliness and how hard t=
hese things are to get right is favouring me at least to look for alternaiv=
es</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:47 &lt; R=
P__&gt; Sorry, I&#39;ve pasted my backlog, still reading your conversation<=
/div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:48 &lt; R=
P__&gt; Am I still here?</div><div style=3D"color: rgb(34, 34, 34); font-fa=
mily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, =
255, 0.917969); ">
09:48 &lt;+khem&gt; I agree on constaints</div><div style=3D"color: rgb(34,=
 34, 34); font-family: arial, sans-serif; font-size: 13px; background-color=
: rgba(255, 255, 255, 0.917969); ">09:48 &lt; fray&gt; yes</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:48 &lt; fray&gt; Ya I do as well.. I&#39;m failing at summarizing my tho=
ughts though</div><div style=3D"color: rgb(34, 34, 34); font-family: arial,=
 sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.91796=
9); ">
09:49 &lt; RP__&gt; So what I&#39;m proposing that that nothing should real=
ly change for distros or recipes *by default*</div><div style=3D"color: rgb=
(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-c=
olor: rgba(255, 255, 255, 0.917969); ">
09:49 &lt; fray&gt; as a distribution creator, I need to set constraints on=
 what (or more to the point how) things are built to generate my binary pac=
kage set</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, san=
s-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); =
">
09:49 &lt; RP__&gt; i.e. the default PACKAGECONFIG for a given recipe shoul=
d really be as it is today</div><div style=3D"color: rgb(34, 34, 34); font-=
family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255=
, 255, 0.917969); ">
09:49 &lt; fray&gt; then a second step is installing those into the image, =
by chosing the correct set to get hte image I want..</div><div style=3D"col=
or: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backg=
round-color: rgba(255, 255, 255, 0.917969); ">
09:50 &lt; RP__&gt; however I do thing we need to start allowing people to =
be able to customise recipe configuration on a per recipe basis more easily=
</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif;=
 font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:50 &lt; fray&gt; we need a way to make choices -- and we need a mechanis=
m to provide alternative packages when the distribution creator can&#39;t/d=
oesn&#39;t want to make the image choice early..</div><div style=3D"color: =
rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgroun=
d-color: rgba(255, 255, 255, 0.917969); ">
09:50 &lt; fray&gt; correct?</div><div style=3D"color: rgb(34, 34, 34); fon=
t-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 2=
55, 255, 0.917969); ">09:50 &lt; RP__&gt; If they do this, all bets are off=
 as far as distro compatibility goes</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:50 &lt; f=
ray&gt; RP__ for the most part I agree.. =A0I think most of our recipes the=
 defaults are correct.. but it&#39;s something to evalute as time goes on..=
</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:50 &lt;+k=
hem&gt; I think it should be made easy enough to change the PACKAGECONFIG i=
f one has to</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:51 &lt; R=
P__&gt; fray: yes, we can and will continue to do that</div><div style=3D"c=
olor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; bac=
kground-color: rgba(255, 255, 255, 0.917969); ">
09:51 &lt; fray&gt; my users don&#39;t want distro compatibility.. they wan=
t their requirements reflected in the produced distro</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">
09:51 &lt;+khem&gt; may be it should be dumped by bitbake somewhere during =
build</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-s=
erif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:51 &lt; RP__&gt; so for example, if there is an X11 related PACKAGE_CONF=
IG option, it should be pulling that from DISTRO_FEATURES by default</div><=
div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-s=
ize: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:51 &lt; fray&gt; RP__ agreed</div><div style=3D"color: rgb(34, 34, 34); =
font-family: arial, sans-serif; font-size: 13px; background-color: rgba(255=
, 255, 255, 0.917969); ">09:51 &lt; RP__&gt; so the build output is maximal=
</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:51 &lt; f=
ray&gt; pam, selinux, x11, directfb, ... these are all distro wide decision=
s to me</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:52 &lt;@T=
artarus&gt; But again, while we need to support the &#39;world&#39; type di=
stro too</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:52 &lt;+k=
oen&gt; not in all cases</div><div style=3D"color: rgb(34, 34, 34); font-fa=
mily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, =
255, 0.917969); ">
09:52 &lt; RP__&gt; and its those maximal configurations angstrom, yocto an=
d others continue to work on</div><div style=3D"color: rgb(34, 34, 34); fon=
t-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 2=
55, 255, 0.917969); ">
09:52 &lt; fray&gt; do I support md4 in openssl, that is a local recipe dec=
ision</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-s=
erif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:52 &lt;@Tartarus&gt; ie &quot;here&#39;s the feed of everything, you pic=
k the binaries you need&quot;</div><div style=3D"color: rgb(34, 34, 34); fo=
nt-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, =
255, 255, 0.917969); ">
09:52 &lt; RP__&gt; Tartarus: this is why I&#39;m suggesting maximal(ish) c=
onfigurations by defaults (as today)</div><div style=3D"color: rgb(34, 34, =
34); font-family: arial, sans-serif; font-size: 13px; background-color: rgb=
a(255, 255, 255, 0.917969); ">
09:52 &lt; fray&gt; Tartarus yes.. difference from highly tailored embedded=
 distro to more generic distro</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">
09:52 &lt;@Tartarus&gt; RP__: that&#39;s not right, for angstrom if I follo=
w koen right</div><div style=3D"color: rgb(34, 34, 34); font-family: arial,=
 sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.91796=
9); ">
09:53 &lt; RP__&gt; Tartarus: have you an exmaple</div><div style=3D"color:=
 rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgrou=
nd-color: rgba(255, 255, 255, 0.917969); ">09:53 &lt;@Tartarus&gt; Both foo=
+x11 and foo+nox11 .ipk should be able to be built</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:53 &lt;+k=
oen&gt; within reasonable limits</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">
09:53 &lt;@Tartarus&gt; Or more concrete, qt/e and qt/x11</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">09:53 &lt;@Tartarus&gt=
; right koen?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:53 &lt;+k=
oen&gt; right</div><div style=3D"color: rgb(34, 34, 34); font-family: arial=
, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.9179=
69); ">
09:53 &lt; RP__&gt; well, qt is a good example</div><div style=3D"color: rg=
b(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-=
color: rgba(255, 255, 255, 0.917969); ">09:53 &lt;+koen&gt; qt is a great e=
xample</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:53 &lt; R=
P__&gt; and I&#39;m not proposing that change</div><div style=3D"color: rgb=
(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-c=
olor: rgba(255, 255, 255, 0.917969); ">
09:54 &lt; RP__&gt; however pulseaudio as part of qt is perhaps a different=
 question</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sa=
ns-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969);=
 ">
09:54 &lt; fray&gt; I think the answer there (distro flag was) is you (don&=
#39;t disable) x11 and (enable) directfb -- or whatever the qt/e technology=
 in question is..</div><div style=3D"color: rgb(34, 34, 34); font-family: a=
rial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.=
917969); ">
09:54 &lt; RP__&gt; we don&#39;t want recipe sfor qt/e with pa, qt/e withou=
t pa and so on</div><div style=3D"color: rgb(34, 34, 34); font-family: aria=
l, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917=
969); ">
09:54 &lt;@Tartarus&gt; fray: That&#39;s just what we don&#39;t want</div><=
div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-s=
ize: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:54 &lt; fr=
ay&gt; but that will require recipes and knowledge to determine what to do =
for conflicting distro flags</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:54 &lt;@T=
artarus&gt; Again, if I follow koen right, we want to be able to do bitbake=
 qt4-x11 qt4-e</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt;+k=
oen&gt; qt has a plugin architecture, so if you don&#39;t care about buildt=
ime, don&#39;t install the &lt;foo&gt; plugin</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt;@T=
artarus&gt; and get the ipks for both</div><div style=3D"color: rgb(34, 34,=
 34); font-family: arial, sans-serif; font-size: 13px; background-color: rg=
ba(255, 255, 255, 0.917969); ">
09:55 &lt;+koen&gt; e.g. don&#39;t install phonon-backend-pulse</div><div s=
tyle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: =
13px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt; RP__&gt=
; koen: doesn&#39;t work for pulseaudio :(</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt; f=
ray&gt; koen, but only if the runtime plug-ins are enabled</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
09:55 &lt; RP__&gt; koen: I was told it wasn&#39;t a module :/</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt; fray&gt;=
 but that is different.. a plug-in architecture can be defined at install t=
ime, not build-time</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:55 &lt; R=
P__&gt; koen: If that isn&#39;t true then its a different question</div><di=
v style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-siz=
e: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:55 &lt;+koen&gt; RP__: I haven&#39;t checked, but I&#39;d be surprised i=
f it wasn&#39;t</div><div style=3D"color: rgb(34, 34, 34); font-family: ari=
al, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.91=
7969); ">
09:56 &lt; RP__&gt; koen: bluelightning checked and said it was a hard depe=
nds :(</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-=
serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
09:56 &lt; fray&gt; policy wise -- for things that have a runtime plUg-in a=
rchitecture.. it&#39;s reasonable (IMHO) to select the items at image time.=
. (somehow)</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, =
sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969=
); ">
09:56 &lt;+khem&gt; fray: with IMAGE_FEATURES may be</div><div style=3D"col=
or: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backg=
round-color: rgba(255, 255, 255, 0.917969); ">09:57 &lt; fray&gt; khem, yes=
 perhaps</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:57 &lt;@T=
artarus&gt; OK, pause please</div><div style=3D"color: rgb(34, 34, 34); fon=
t-family: arial, sans-serif; font-size: 13px; background-color: rgba(255, 2=
55, 255, 0.917969); ">
09:57 &lt;@Tartarus&gt; lets not get off in the weeds on QT</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">09:57 &lt;@Tartarus&gt=
; That&#39;s a specific problem we need to sort out how to fit into the gen=
eral implementation we need to agree on</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:58 &lt;+k=
oen&gt; I think I can summarize my position as: let&#39;s investigate if th=
ere&#39;s a (real) need to support multiple parallel configs, if not -&gt; =
USEFLAG</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:58 &lt; f=
ray&gt; koen I think that is a reasonable policy statement when someone sug=
gests a flag usage</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:58 &lt; R=
P__&gt; koen: I think that sums up the distinction well</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">
09:59 &lt; RP__&gt; Taking some examples, its clear there is a need for qt<=
/div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; =
font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:59 &=
lt; fray&gt; (implementation wise, I do have a concern with flags that we c=
ould end up with ones the people don&#39;t know about.. so why have them)</=
div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:59 &lt;+k=
hem&gt; ok, I am still not convinced so I need to do my homework learn use =
cases etc.</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">09:59 &lt; R=
P__&gt; What about avahi?</div><div style=3D"color: rgb(34, 34, 34); font-f=
amily: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255,=
 255, 0.917969); ">
10:00 &lt; RP__&gt; and then the question of distcc</div><div style=3D"colo=
r: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backgr=
ound-color: rgba(255, 255, 255, 0.917969); ">10:00 &lt;+koen&gt; iirc distc=
c is covered by the x11 flag</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:00 &lt; f=
ray&gt; in both of those cases -- if the distro flag for X11 is present, th=
en the system is saying go ahead and use it.. =A0the recipes should break o=
ut the UI parts into subpackages..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:00 &lt; f=
ray&gt; so if during the final image create X11 isn&#39;t desired, then it =
won&#39;t cause it to be pulled in.. but yet it&#39;s still available in th=
e feed</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:01 &lt; R=
P__&gt; koen: but can we do it through the PACKAGECONFIG mechanism based on=
 DISTRO_FEATURES?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:01 &lt;+k=
oen&gt; the avahi problem is more subtle</div><div style=3D"color: rgb(34, =
34, 34); font-family: arial, sans-serif; font-size: 13px; background-color:=
 rgba(255, 255, 255, 0.917969); ">
10:01 &lt;+koen&gt; RP__: right</div><div style=3D"color: rgb(34, 34, 34); =
font-family: arial, sans-serif; font-size: 13px; background-color: rgba(255=
, 255, 255, 0.917969); ">10:01 &lt;+koen&gt; avahi will link everything to =
gtk+ if you enable the UI</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:01 &lt;+k=
oen&gt; while it only needs to link the ui lib</div><div style=3D"color: rg=
b(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-=
color: rgba(255, 255, 255, 0.917969); ">
10:01 &lt;+koen&gt; that&#39;s how it was in the past</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">10:01 &lt; fray&gt; that to =
me seems like a recipe/package bug -or- a reason to split it..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:01 &lt; R=
P__&gt; koen: That sounds like a bug we should fix in avahi tbh</div><div s=
tyle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: =
13px; background-color: rgba(255, 255, 255, 0.917969); ">
10:02 &lt;+koen&gt; RP__: agreed</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">10:02 &lt; fray&gt; again in that case a split ca=
n be justified (or a bug fix)</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:02 &lt; f=
ray&gt; ...of course do we end up with a flag that says if gtk+ is availabl=
e or not?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:02 &lt; R=
P__&gt; So in the distcc case (or avahi assuming it doesn&#39;t do insane l=
inking), my thought was =A0PACKAGECONFIG ??=3D &quot;${@base_contains(&#39;=
DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&#39;, d)}</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:02 &lt; R=
P__&gt; or something like that</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">
10:02 &lt; fray&gt; I&#39;ve built systems before w/ no x11, but did have g=
tk+ (and directfb)</div><div style=3D"color: rgb(34, 34, 34); font-family: =
arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0=
.917969); ">
10:03 &lt; RP__&gt; fray: hence the &quot;something like that&quot;</div><d=
iv style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-si=
ze: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:03 &lt; fra=
y&gt; RP__ ya.. that seems reasonable..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:03 &lt; f=
ray&gt; the issue though is there some mechanism for a recipe to self-docum=
ent it&#39;s packageconfig usages? =A0if not that would likely be a good th=
ing to do ASAP, so it becomes standard</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:04 &lt; R=
P__&gt; The benefit of this is that its a sane default (no change) but allo=
ws people to override under certain circumstances (and which point we shoul=
d be clear they&#39;re on their own)</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:04 &lt; f=
ray&gt; RP__ yes, that looks reasonable to me</div><div style=3D"color: rgb=
(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-c=
olor: rgba(255, 255, 255, 0.917969); ">
10:04 &lt;+khem&gt; I think we need to capture configure arguments in .ipks=
 or rpms too=A0</div><div style=3D"color: rgb(34, 34, 34); font-family: ari=
al, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0.91=
7969); ">
10:04 &lt; fray&gt; (rpms it can be easy.. there is a mechanism called arbi=
trary tags where we can shove whatever data we want into)</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
10:05 &lt; RP__&gt; khem: Changing PACKAGECONFIG is like changing DISTRO_FE=
ATURES, bets are off when you start playing with these</div><div style=3D"c=
olor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; bac=
kground-color: rgba(255, 255, 255, 0.917969); ">
10:05 &lt; fray&gt; --or-- the packageconfig values can be put into the pac=
kage descriptions...</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">
10:05 &lt; RP__&gt; a feed needs a consistent set of the variables</div><di=
v style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-siz=
e: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:05 &lt; fray=
&gt; RP__ agreed.. these settings are distro wide.. so change it and the fe=
ed changes</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:05 &lt;+k=
hem&gt; RP__: yes, however the cases I have been thinking easily were going=
 into DISTRO_FEATURES in my head=A0</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:06 &lt;+k=
hem&gt; but I am not opposed to change</div><div style=3D"color: rgb(34, 34=
, 34); font-family: arial, sans-serif; font-size: 13px; background-color: r=
gba(255, 255, 255, 0.917969); ">
10:06 &lt; fray&gt; the more i think about it, the more I like distro_featu=
res becoming promoted into packageconfig on a person recipe basis</div><div=
 style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size=
: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
10:07 &lt; fray&gt; it allows someone to override, but makes the assumption=
 that most settings are derived from distro features</div><div style=3D"col=
or: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; backg=
round-color: rgba(255, 255, 255, 0.917969); ">
10:07 &lt;+khem&gt; RP__: many times there will be support questions becaus=
e of PACKAGECONFIG</div><div style=3D"color: rgb(34, 34, 34); font-family: =
arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255, 0=
.917969); ">
10:07 &lt; RP__&gt; fray: right, I&#39;ve come to that conclusion over time=
 (and believe me, I&#39;ve given this a lot of thought)</div><div style=3D"=
color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; ba=
ckground-color: rgba(255, 255, 255, 0.917969); ">
10:08 &lt; RP__&gt; koen/Tartarus: Where are your thoughts at?</div><div st=
yle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgba(255, 255, 255, 0.917969); ">10:08 &lt; fray&gt;=
 khem, ya.. we will need a way to embed the values somewhere so it can be r=
etrieved..</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:08 &lt;@T=
artarus&gt; thinking</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">
10:09 &lt; RP__&gt; FWIW you can add arbitrary tags to ipks as well</div><d=
iv style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-si=
ze: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:09 &lt; fra=
y&gt; ahh, didn&#39;t know that, what about deb?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:09 &lt; R=
P__&gt; whether the tools/indexers show them different question</div><div s=
tyle=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: =
13px; background-color: rgba(255, 255, 255, 0.917969); ">
10:09 &lt;@Tartarus&gt; I think we&#39;re keeping all 3 of the use cases in=
 mind</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-s=
erif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
10:10 &lt;@Tartarus&gt; (3 =3D=3D defaults, customized device build and &#3=
9;world&#39; distro)</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">
10:10 &lt;+koen&gt; PACKAGECONFIG is nearly always tied to DISTRO_FEATURES =
(when it&#39;s used correctly)</div><div style=3D"color: rgb(34, 34, 34); f=
ont-family: arial, sans-serif; font-size: 13px; background-color: rgba(255,=
 255, 255, 0.917969); ">
10:10 &lt; RP__&gt; Tartarus: yes, I think all three should be covered</div=
><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font=
-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:10 &lt; =
RP__&gt; koen: agreed, there will often be (and should be) a tie</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:11 &lt; R=
P__&gt; I say often as there might be cases where a distro wide feature doe=
sn&#39;t make sense</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:12 &lt; R=
P__&gt; I do realise that going forward we&#39;re going to see a lot more o=
f these PACKAGE_CONFIG options. Its why I&#39;ve looked long and hard at th=
e syntax and tried to come up with something neat</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:12 &lt; R=
P__&gt; The defaults from DISTRO_FEATURES is less neat atm</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
10:12 &lt; RP__&gt; but I believe we&#39;ll find a way to figure that piece=
 out</div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-se=
rif; font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
10:13 &lt; RP__&gt; even if its syntax like DISTRO:x11 or something</div><d=
iv style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-si=
ze: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:13 &lt;+khe=
m&gt; RP__: where will PACKAGECONFIG exist in implementation ?</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:13 &lt; R=
P__&gt; khem: it already exists today in base.bbclass</div><div style=3D"co=
lor: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; back=
ground-color: rgba(255, 255, 255, 0.917969); ">
10:13 &lt;+khem&gt; recipe .bb ?</div><div style=3D"color: rgb(34, 34, 34);=
 font-family: arial, sans-serif; font-size: 13px; background-color: rgba(25=
5, 255, 255, 0.917969); ">10:13 &lt;+khem&gt; RP__: I meant the use of it</=
div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:13 &lt; R=
P__&gt; khem: yes, recipe .bb or .inc</div><div style=3D"color: rgb(34, 34,=
 34); font-family: arial, sans-serif; font-size: 13px; background-color: rg=
ba(255, 255, 255, 0.917969); ">
10:14 &lt; RP__&gt; Its all &quot;metadata&quot; rather than any real code<=
/div><div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; =
font-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:14 &=
lt; RP__&gt; particularly if we support some syntax like DISTRO:x11</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:15 &lt;+k=
oen&gt; should we move on to other topics n the agenda now?</div><div style=
=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px=
; background-color: rgba(255, 255, 255, 0.917969); ">
10:15 &lt;+khem&gt; RP__: then distros which want different PACKAGECONFIG h=
as to override the recipe or .bbappend to it ?</div><div style=3D"color: rg=
b(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; background-=
color: rgba(255, 255, 255, 0.917969); ">
10:15 &lt;@Tartarus&gt; If we&#39;re good and everyone else has time</div><=
div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-s=
ize: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:15 &lt; RP=
__&gt; khem: Its a ??=3D so they can set PACKAGE_CONFIG_pn-XXX</div>
<div style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-=
size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">10:15 &lt; R=
P__&gt; khem: so yes</div><div style=3D"color: rgb(34, 34, 34); font-family=
: arial, sans-serif; font-size: 13px; background-color: rgba(255, 255, 255,=
 0.917969); ">
10:15 &lt;+khem&gt; ok</div><div class=3D"yj6qo ajU" style=3D"cursor: point=
er; outline-style: none; outline-width: initial; outline-color: initial; pa=
dding-top: 10px; padding-right: 0px; padding-bottom: 10px; padding-left: 0p=
x; width: 22px; margin-top: 2px; margin-right: 0px; margin-bottom: 0px; mar=
gin-left: 0px; color: rgb(34, 34, 34); font-family: arial, sans-serif; font=
-size: 13px; background-color: rgba(255, 255, 255, 0.917969); ">
</div><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/bl=
og" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Community=
 Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http:=
//yoctoproject.org</a></div>
<br>

--90e6ba6e87d0905e9804b295f801--
