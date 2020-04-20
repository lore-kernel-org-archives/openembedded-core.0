Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [112.109.81.172])
 by mx.groups.io with SMTP id smtpd.web11.3695.1587426345668105183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 16:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 112.109.81.172, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [165.84.15.3])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id D5878A1252;
	Tue, 21 Apr 2020 11:45:41 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 165.84.15.3) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: tsc@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org, openembedded-devel@lists.openembedded.org
Subject: OpenEmbedded TSC Meeting Minutes 2020-04-20
Date: Tue, 21 Apr 2020 11:45:19 +1200
Message-ID: <2074719.u7VD4yp0hM@linc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

OpenEmbedded Technical Steering Committee (TSC) Meeting Minutes 2020-04-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Meeting was held in #oe-tsc on Freenode; channel access public.

Present:
=2D Richard Purdie (RP)
=2D Joshua Watt (JPEW)
=2D Bruce Ashfield (zeddii)
=2D Paul Eggleton (bluelightning)
=2D Martin Jansa (JaMa)

Summary:
* Training & certification
  - LF is providing training, needs some review/extension
  - Certification - long term goal, need to find someone with interest to d=
rive it
  - zeddii & JPEW volunteered to help
* multilib problems=20
  - See RP's email yesterday: https://lists.openembedded.org/g/openembedded=
=2Darchitecture/message/1052
  - An architectural change is needed
  - Technical discussion (see log below); will continue on the mailing list


=46ull meeting log
=2D----------------

[09:00] <bluelightning> hello folks
[09:00] <RP> and no JaMa :/
[09:00] <RP> hi bluelightning
[09:01] <JPEW> Hello
[09:01] <zeddii> here
[09:02] <JPEW> Should we give JaMa a few minutes?
[09:03] <bluelightning> sure
[09:03] <RP> JPEW: he's not online at all which is a bad sign :/
[09:03] <bluelightning> he was online earlier though it seems
[09:04] <RP> might be worth an email?
[09:04] <JPEW> Will do
[09:05] <RP> thanks
[09:08] <JaMa> Hi, sorry I'm late
[09:08] <JPEW> JaMa, no worries :)
[09:08] <JPEW> 4 things on the agenda today: https://www.openembedded.org/w=
iki/TSC
[09:08] <JPEW> 3 are repeats
[09:09] <JPEW> Oops, I guess the version tags one needs removed?
[09:09] <RP> I think we resolved it?
[09:09] <RP> hi JaMa, glad you are around! :)
[09:10] <JaMa> I've created the reminder, but for tomorrow :/
[09:10] <RP> I think a quick visit into post 3.1 development may be good too
[09:10] <bluelightning> JaMa: you did better than me, I forgot to create th=
e reminder ;)
[09:11] <RP> bluelightning: you'll need a reminder to create the reminder
[09:11] <bluelightning> RP: maybe just a permanent "you forgot something" s=
ticky note on my monitor would be appropriate for me :D
[09:11] <JPEW> RP: Do you want to start with the post 3.1 development?
[09:12] <RP> JPEW: lets start with the training and certification?
[09:12] <JPEW> Sounds good.... what is that :)
[09:13] <RP> The LF runs "YP" training courses
[09:13] <RP> obviously that overlaps a lot with OE. They started as in pers=
on instructor courses, now they're virtual instructor led and there are pla=
ns to have a self paced e-learning verison
[09:14] <RP> I think that is all good and I've volunteered to review the co=
urse material, I actually already did and put forward a number of correctio=
ns and suggestions
[09:14] <RP> There is talk about certification ideas. That is more complex =
as it would need funding and a bigger time input from "us", the projects.
[09:15] <RP> The reason I bring all this up is that there is some opportuni=
ty for anyone with a strong interest to get involved and help these things =
move forward
[09:15] <RP> I've mentioned to the YP TSC and I'm also mentioning to the OE=
 TSC as well
[09:15] <JPEW> Ya, I think at a minimum it would be good to review the cour=
se material (I'd be willing to do that)
[09:16] <JPEW> What sort of "certification" is being discussed?
[09:16] <RP> Keep in mind this is a course the LF charges for and the mater=
ial is therefore confidential
[09:17] <RP> JPEW: the idea would be like some of the other LF certificatio=
ns
[09:17] <RP> e.g. https://training.linuxfoundation.org/certification/certif=
ied-kubernetes-administrator-cka/#domains
[09:18] <RP> At this point I guess I'm asking if anyone has a strong intere=
st in being involved and helping drive this
[09:18] <JaMa> FWIW: I'm curious how wide this certification can be, becaus=
e OE/YP is _very_ wide area, so being expert in some area doesn't help much=
 in other areas, especially when customer doesn't even know how they want e=
=2Eg. to maintain the distro
[09:19] <RP> JaMa: a lot would come down to how we define the things someon=
e should know to gain the qualification
[09:20] <RP> I did argue for a split level approach with two levels, an ess=
entials and advanced
[09:20] <RP> I suspect we'd need to focus on the essentials first
[09:20] <RP> We'd look at getting an advanced training course going first, =
then look at exams for the level
[09:22] <JPEW> Makes sense.... I'll think about it
[09:23] <RP> This is probably a long term objective. Short term we can impr=
ove the current training which will feed into the e-learning. Certification=
 is a longer term goal
[09:23] <RP> I really just need to know who is interested and available to =
help work on it (if anyone)
[09:24] <RP> The TSCs are the people who guide "the architecture" in many w=
ays
[09:24] <RP> I appreciate its hard to comment with so few details. I'm stru=
ggling with the division between YP and OE here too a bit :/
[09:24] <RP> I'll stop here and move on to 3.1 since I'm mostly talking to =
myself? :)
[09:24] <zeddii> I can help out. I can't step up for "drive it", but I'm de=
finitely interested at some level.
[09:25] <RP> zeddii: there is a section in the training about the kernel bi=
ts which you might like to review ;-)
[09:26] <zeddii> the thought crossed my mind. :D
[09:26] <JaMa> I'm only curious not in position to get involved with this, =
at work I can imagine hiring someone cerified with essentials more useful, =
than trying to find advanced certification for whatever area, the company c=
urrently strugles with (which is often specific to just that project or fro=
m historical reasons which don't exist anywhere else)
[09:27] <RP> JaMa: I'd imagine the essentials would be the most useful for =
scenarios like that, yes
[09:27] <RP> and it may be why the economics on the advanced cert don't wor=
k out :(
[09:27] <RP> JaMa: its actually good to have confirmation that its an issue=
 companies struggle with
[09:28] <RP> JaMa: do you think existing engineers would be interested in t=
aking it?
[09:28] <JaMa> I can imagine new people joining SCM/Build team
[09:29] <RP> JaMa: ok, thanks
[09:29] <JaMa> for component teams (most of engineers) they need only proje=
ct specific minimum to be able to interact with our build and for that they=
 IMHO don't need generic essentials knowledge
[09:30] <RP> JaMa: Is there something which would be useful for them?
[09:30] <RP> I guess its too project specfic to be able to train for :( (ba=
ck to your original point)
[09:30] <JaMa> and for Build team people the essentials would be useful to =
be efficient to start debugging whatever issues we're currently seeing and =
then probably start learning from there (even if it includes additional adv=
anced training)
[09:31] <RP> zeddii, JPEW: I'll keep you in mind as things develop. I think=
 they'll probably try and sort out the feedback I gave them, then we might =
need fresh eyes
[09:32] <zeddii> ack'd
[09:32] <RP> JaMa: the trouble with advanced is that there are so many dire=
ctions it could go. I have some nice ideas but I think even project veteran=
s would be challenged by at least one area on the list of things I was thin=
king about
[09:32] <JaMa> RP: yes, and they use only very small part, mostly just chan=
ging one variable after creating new annotated tag and if they need somethi=
ng more complicated they usually ask Build team for help
[09:33] <RP> Not to cut the discussion but I'll start talking about 3.1 as =
we can probably fade from one topic to another
[09:33] <RP> We need to think about what we want to do post 3.1 in master f=
or 3.2
[09:34] <JaMa> yes, I can imagine things like: multilib, external toolchain=
, nasty prebuilt binaries, using secondary toolchains, ...
[09:34] <RP> Given where we're at resource wise, I am thinking it may be ti=
me to try and sort out a few more structural things, consider performance f=
or example and maybe things like the ptest dependency dilemma
[09:35] <RP> JaMa: tinfoil!
[09:35] <bluelightning> \o/
[09:35] <RP> Lots of people would benefit from understanding what it does a=
nd how you can use it
[09:35] <bluelightning> yes... needs better docs, that's most likely on me
[09:35] <RP> bluelightning: how many people currently understand it? :)
[09:36] * RP isn't sure he is in that category :/
[09:36] <JaMa> I wanted to type various bitbake magic people don't notice u=
ntil they really need them :)
[09:36] <RP> even if I did recently fix/break it
[09:36] <bluelightning> well, understanding how to use it is the main thing=
, most don't need to know how it works
[09:36] <RP> bluelightning: yes, exactly
[09:36] <RP> and I was thinking of use
[09:37] <RP> but its an interesting example of things where I think some wi=
derspread understanding of what can be done would be useful
[09:37] <RP> back on the architecture topic, did anyone have any ideas on m=
y multilib dilemma i posted about over the weekend?
[09:38] <JPEW> I read it... I didn't get any inspirations
[09:38] <JaMa> the same here :/
[09:38] <RP> Is the filter flag for variables a good idea or a really bad o=
ne?
[09:38] * bluelightning did not think about it enough
[09:39] <RP> The TSC is effectively the guardian of this so we probably do =
need to think about this one...
[09:39] <RP> I haven't got clean builds on the autobuilder yet with a ton o=
f changes :(
[09:40] <RP> equally, it highlights how inconsistent and "pure luck" the cu=
rrent code is
[09:40] <JPEW> Ya
[09:41] <JaMa> is it clear what caused the issues recently? from the e-mail=
 it wasn't clear to me if this was all "pure luck" which started to run out=
 now or new behavior
[09:41] <JPEW> multilib is pretty invasive... would it help if it was more =
integrated instead of trying to be relegated to a distinct class?
[09:41] <RP> I knew there were gremlins, I'm rather bothered by how bad the=
y turned out to be
[09:41] <RP> JaMa: someone tried to use a few too many features together wi=
th multilib
[09:42] <JaMa> with thud we're also strugling a bit since multilib had to b=
e enabled :/
[09:42] <RP> JPEW: I don't see how you can integrate it more other than cov=
ering all the recipes with MLPREFIX everywhere
[09:43] <JaMa> "than covering all the recipes with MLPREFIX everywhere" tha=
t's pretty much what we did :)
[09:43] <RP> JaMa: things haven't changed much in this area since before th=
ud :(
[09:45] <JaMa> our multilib use is also special, because instead of buildin=
g normal image without MLPREFIX and including few extra package with MLPREF=
IX, we build everything except kernel and kernel modules with MLPREFIX
[09:45] <RP> So going back to the more general 3.2, my feeling is we probab=
ly do need to experiment a bit more to see if we can improve things like pa=
rsing speed. I already fear its all the anonymous python that hurts us thou=
gh
[09:45] <JaMa> so whole userspace is 32bit and only kernel and modules are =
aarch64
[09:45] <RP> JaMa: it should still work...
[09:46] <RP> JaMa: do you know if we've fixed any of that to work better in=
 zeus/dunfell?
[09:46] <JPEW> RP: Ya, you had mentioned moving some of the anon python to =
library code
[09:46] <RP> JPEW: well not so much anon python as the python functions in =
staging.bbclass or sstate.bbclass
[09:47] <RP> create better python libraries
[09:47] <RP> I did also wonder about splitting the classes directory into g=
lobal classes and recipe classes
[09:47] <RP> (global e.g. package_rpm, recipe e.g. autotools)
[09:48] <JPEW> Is that just for user uderstanding, or would it help parsing=
 time?
[09:48] <JaMa> RP: I haven't noticed any improvements for this use case in =
zeus/dunfell
[09:49] <RP> JPEW: that would be more for understanding, users do complain =
about it being confusing to have two types mixed together
[09:49] <RP> JaMa: figures :(
[09:49] <RP> JPEW: I guess the question I'm asking is are there other thing=
s we should consider?
[09:50] <RP> or should we consider this a bad idea for 3.2 and try and keep=
 more compatibility with 3.1?
[09:51] <JaMa> just saying that covering the recipes with MLPREFIX looks ug=
ly, but at least works reliably, maybe the filter functions could as well, =
but already feels difficult to get right for all possible corner cases
[09:51] <RP> JaMa: the filter case at least makes it clear which code needs=
 MLPREFIX and which does not
[09:52] <zeddii> on the compatibility with 3.1 topic, I wouldn=E2=80=99t pu=
t that as a priority when considering 3.2 work.
[09:52] <RP> although my patch in -next is a poor relation of a proper filt=
er approach
[09:52] <RP> zeddii: that is my leaning too
[09:53] <JaMa> but the expectation might be different e.g. useradd.bbclass =
should add MLPREFIX to base-passwd RDEPENDS in our case (because we don't w=
ant any aarch64 packages in the image) while everybody else doesn't want ML=
PREFIX to be added here
[09:54] <RP> JaMa: right, I think the expectation is different there :/
[09:54] <RP> "There should only be one base-passwd and it should be the non=
=2Dmultilib" is probably the starting point in general :/
[09:54] <JaMa> and if the filter API needs me to overlay standard bbclass, =
then it's pretty much the same as adding ${MLPREFIX} in the variable
[09:55] <RP> the original purpose of multilib.bbclass was to avoid having t=
o go through all the recipes and classes and adding MLPREFIX everywhere
[09:56] <RP> we could decide its important enough we have to just do that
[09:57] <RP> but as JaMa points out, there are some cases where its a polic=
y decision
[09:57] <JPEW> Adding MLPREFIX manually (without any sort of check) seems l=
ike it would just be perpetually broken
[09:57] <JPEW> e.g. because it gets missed sometimes
[09:58] <zeddii> indeed
[09:58] <JPEW> But filters also seem problematic as a "one size fits all" i=
mplementation
[09:58] <RP> JPEW: well, its like sstate policy, you can define it
[09:58] <JaMa> agreed, that's why I still don't like multilib - even when i=
t's useful when you _really_ need it
[09:59] <RP> the filter is ultimately a function which could be customised
[09:59] * RP would prefer just to delete multilib
[09:59] <JaMa> +
[09:59] <RP> one more vote and we carry the motion :)
[10:00] <RP> I wish we could :)
[10:00] <zeddii> damn users.
[10:00] <RP> Just to be clear for the minutes, whilst I would like to, I re=
alise we can't
[10:01] <RP> I'm allowed to fantasise about it
[10:01] <JPEW> I've never had to use it FWIW. Makes it hard to reason about=
 what the "correct" thing to do it :)
[10:02] <JPEW> ... sort of hoping I don't *have* to use it now :)
[10:02] <RP> I'd note that nativesdk functions as a special case multilib t=
oo, it needs the same prefix handling
[10:03] <JPEW> Ah
[10:03] <RP> and nativesdk is very functional/useful
[10:03] <RP> MLPREFIX is nativesdk- in that case
[10:03] <JPEW> I have used that one a lot. I didn't realize it was that clo=
sely related to multilib
[10:03] <RP> JPEW: same underlying code
[10:04] <RP> ish anyway
[10:04] <JPEW> Are there other uses for the variable filter functions?
[10:04] <RP> JPEW: not sure
[10:05] <JaMa> I will think about that e-mail a bit more, I think another c=
ase where current multilib doesn't work well is file-rdeps handling (need t=
o re-verify with dunfell)
[10:05] <RP> There is a general theme that we have some special case hacks =
we should really integrate better into the architecture though
[10:05] <RP> uninative is another
[10:05] <RP> JaMa: please do as I'd welcome input
[10:06] <JPEW> It seems like the arbitrary variable filters could be really=
 useful, but also really dangerous
[10:06] <RP> uninative needs some dedicated events, the sanity events need =
cleanup too
[10:06] <RP> JPEW: yes, the danger worries me
[10:07] <JPEW> Is there a way to mitigate that (e.g. make it not necessaril=
y a general purpose filter)?
[10:07] <RP> JPEW: hard to
[10:08] <RP> bitbake implementations tend to have to be generic
[10:08] <RP> I also worry about performance
[10:08] <JPEW> Ya, I figured
[10:08] <JPEW> Presumably, you'd have to run the filter every time the vari=
able was expanded?
[10:08] <JPEW> Since you'd never really know when it was "done" ?
[10:09] <RP> JPEW: yes, although the expand cache could help
[10:09] <RP> expand cache is cleared upon datastore writes
[10:10] <JaMa> as long as there would be only multilib using it, it would b=
e nice to have fast-path without filters for people who don't use multilib =
(I hope it's still majority of users)
[10:10] <RP> JaMa: only multilib.bbclass would add the filters
[10:12] <RP> the real problem is too much anon python
[10:13] <JPEW> RP: The problem is when you need specific interactions betwe=
en anon python chunks?
[10:13] <JaMa> bitbake world with multilib enabled doubles the number of av=
ailable targets, so for "bitbake world" jobs, the parsing performance hit w=
on't show that much, but agreed
[10:14] <RP> JPEW: right
[10:14] <RP> JPEW: most of the system can dynamically adjust itself but the=
 anon python can't defer itself to when its needed
[10:16] <JPEW> RP: and the filter functions allow you do do that by moving =
what was anon code to a specific point (when the variable is exanded)
[10:17] <RP> JPEW: yes
[10:17] <RP> but it can also run many times
[10:17] <RP> (potentially)
[10:18] <JPEW> OK, I'm curious why, but I think we can move the technical d=
isucssion to the e-mail thread
[10:19] <JPEW> Any other TSC topics?
[10:19] <JPEW> since we are over time :)
[10:19] * RP was just looking at that
[10:19] <RP> nothing form me
[10:19] <bluelightning> nothing here atm
[10:19] <JaMa> nothing from me as well
[10:19] <zeddii> clear here as well
[10:20] <JaMa> 23:09 < JPEW> Oops, I guess the version tags one needs remov=
ed?
[10:20] <JaMa> ^ I agree it needs removal, will do now
[10:20] <JPEW> JaMa: Already did it :)
[10:20] <JaMa> ah, thanks :)
[10:21] <JPEW> I'm going to leave the first two for next month since we did=
n't get around to them today, so keep thinking about it
[10:21] <JPEW> Who's posting the minutes?
[10:21] <bluelightning> I'll do it :)
[10:22] <JPEW> bluelightning: Thanks
[10:22] <JPEW> See you all next month!
[10:25] <JaMa> See you on May 18th (reminder moved from tomorrow) :)
[10:29] <RP> Thanks everyone :)



