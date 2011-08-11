Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QrXxL-0002VJ-8n; Thu, 11 Aug 2011 18:18:03 +0200
Received: by ywe9 with SMTP id 9so1427986ywe.6
	for <multiple recipients>; Thu, 11 Aug 2011 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=icTSkIuDpaI/16/dKvtz5mmsACKdJr+IFG8jih6pxnA=;
	b=hk6ISPnZYCRYdHM4xIS4wRfNqx4ppSDkFp4ojz/gHiYCFjEFiVq2dEWs19CXoS40tH
	oCmfqSmKRrBR2L1BwXND+ZLKYb/vOpJcqnzys9w3uotJgAwKjNP/OE8BQaUCdT6VVvfu
	nbyX73asaGXTrnVLit8vSsllcWUexNci1iTM8=
MIME-Version: 1.0
Received: by 10.42.29.136 with SMTP id r8mr7872338icc.286.1313079210328; Thu,
	11 Aug 2011 09:13:30 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.222.202 with HTTP; Thu, 11 Aug 2011 09:13:30 -0700 (PDT)
Date: Thu, 11 Aug 2011 09:13:30 -0700
X-Google-Sender-Auth: wHk1j1AJuxVxF4Ll7its2CinHlE
Message-ID: <CA+YB3rbj1WupvtgE3evS2fNfm6RN-eaiLzVjE4Y18PxYU16WWg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 4 August, 2011
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
X-List-Received-Date: Thu, 11 Aug 2011 16:18:03 -0000
Content-Type: multipart/alternative; boundary=20cf30434bf8e4c19004aa3d136a

--20cf30434bf8e4c19004aa3d136a
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC meeting 4 August, 2011

Note: There was no meeting on July 28 due to a lack of quorum

Attendees: Richard, Khem, Tom, Mark
Apologies: Koen
Note: Jefro


Minutes:

01) choose a meeting chair

RP

02) new topics

a. request for post 1.1 focus areas for yocto

03) action items from last week

--> write up which scripts to use (khem)
done

05) Status updates

multilib is painful, but getting there

      - elections
quiet period

      - oe-core
--> RP to issue an RFC on fray's multilib stuff
done
      - bsp guidelines

  - "normal" linux recipe in oe-core that people can bbappend

     - metadata layer splitting

     - infrastructure


Raw Transcript:


(1:21:46 PM) RP__: Ok, so meeting wise is there much the TSC needs to
discuss?
(1:21:57 PM) fray: I don't have any thing specific right now
(1:22:22 PM) Tartarus: just general status I guess
(1:22:24 PM) RP__: multilib has been a pain but I think we're getting there
with it now
(1:22:53 PM) Jefro: do we want a formal meeting, or just to catch up with
status? there were a few action items from last meeting (2 weeks ago)
(1:23:06 PM) RP__: stablility hasn't been good, again, I think we're hunting
down the regressions. The system wide ones should be fixed, there are odd
issues remaining build wise
(1:23:18 PM) RP__: Jefro: We could recap the action items?
(1:23:30 PM) Jefro: yes, coming up in just a sec
(1:23:52 PM) Tartarus: RP__: where do we stand with more build resources?
(1:23:56 PM) Tartarus: still "soon" ?
(1:24:04 PM) RP__: (beagleboard is broken on rpm as the long list of package
architectures broken rpm, there is an odd rpm locking issue floating around
and a qemuarm perl one)
(1:24:22 PM) RP__: Tartarus: The delivery of LF machines is cut down to the
OE ones
(1:24:23 PM) fray: RP__ I sent a patch for beagleboard earlier.. I think
it's being validated
(1:24:45 PM) Tartarus: RP__: didn't quite parse that, again please?
(1:24:46 PM) RP__: Tartarus: Intel has managed to get some more autobuilder
resources which are coming online piece by piece
(1:24:51 PM) fray: (sent a patch to Saul to look into that is)
(1:24:55 PM) Tartarus: RP__: ok, good
(1:25:03 PM) RP__: Tartarus: I'd said the LF was going to get us some
machines, that won't happen
(1:25:10 PM) ***Tartarus has the Mentor stuff setup and handed off to
others, we'll see how it goes
(1:25:12 PM) RP__: Only the ones promised to OE will
(1:25:14 PM) Jefro: http://pastebin.com/qbPGBBKK
(1:25:31 PM) khem: RP__: are those also the oe machines that LF was to
provide ?
(1:25:33 PM) RP__: fray: thanks
(1:25:35 PM) ***Jefro notes, that link is for agenda
(1:25:46 PM) khem: oh OE will ok
(1:26:01 PM) khem: RP__: any idea timewise when that will happen
(1:26:22 PM) RP__: khem: Tom King and Mike Wooster are discussing
(1:26:26 PM) khem: ok
(1:27:32 PM) khem: I have managed to run core-image-sato builds for all
qemus within 24 hrs
(1:27:44 PM) khem: something we would want for daily testing
(1:29:46 PM) RP__: ok, do we want to work through the agenda?
(1:29:51 PM) RP__: I can chair
(1:29:55 PM) ***Jefro notes RP is chair
(1:29:56 PM) RP__: Any additional topics?
(1:30:10 PM) ***RP__ notes the request for post 1.1 focus areas for yocto
(1:30:42 PM) RP__: khem: any update on item 3 (write up which scripts to
use)?
(1:30:42 PM) ***Jefro notes for minutes
(1:31:07 PM) RP__: elections, I think we're ok there right now
(1:31:22 PM) RP__: OE-Core, multilib has moved forwards so we can consider
that done
(1:31:35 PM) RP__: So its really down to other status updates :)
(1:31:46 PM) ***RP__ aims for the record for the official meeting
(1:32:04 PM) RP__: others can jump in... :)
(1:32:30 PM) fray: only other thing I can think of is that I still intend to
work on the ARM arch.. but havn't had time due to "life"
(1:32:40 PM) fray: in short the changes are minor compared to what is
there..
(1:33:15 PM) RP__: I agree there are some tweaks still needed in places
(1:33:35 PM) fray: key is I think the big overhaul work is done at this
point
(1:33:38 PM) RP__: I really want to get builds working again and then start
resolving those issues
(1:33:54 PM) RP__: Also note that we're going to make a big effort to clean
up the various open bugs
(1:34:03 PM) RP__: We've too many of them atm
(1:34:25 PM) khem: someone was here ..
(1:34:31 PM) khem: yes my AR is done
(1:34:44 PM) khem: Paul E replied with the querries
(1:34:51 PM) khem: that were raised
(1:36:03 PM) RP__: SO unless anyone has anything else they want to
add/ask/comment on, I think we're done

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--20cf30434bf8e4c19004aa3d136a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div>OE-TSC meeting=
 4 August, 2011</div><div><br></div><div>Note: There was no meeting on July=
 28 due to a lack of quorum</div>
<div><br></div><div>Attendees: Richard, Khem, Tom, Mark</div><div>Apologies=
: Koen</div><div>Note: Jefro</div><div><br></div><div><br></div><div>Minute=
s:</div><div><br></div><div>01) choose a meeting chair</div><div><br></div>
<div>RP</div><div><br></div><div>02) new topics</div><div><br></div><div>a.=
 request for post 1.1 focus areas for yocto</div><div><br></div><div>03) ac=
tion items from last week</div><div><br></div><div>--&gt; write up which sc=
ripts to use (khem)</div>
<div>done</div><div><br></div><div>05) Status updates</div><div><br></div><=
div>multilib is painful, but getting there</div><div><br></div><div>=A0 =A0=
 =A0 - elections</div><div>quiet period</div><div><br></div><div>=A0 =A0 =
=A0 - oe-core</div>
<div>--&gt; RP to issue an RFC on fray&#39;s multilib stuff</div><div>done<=
/div><div>=A0 =A0 =A0 - bsp guidelines</div><div><span style=3D"white-space=
: pre-wrap; ">	</span>=A0=A0</div><div><span style=3D"white-space: pre-wrap=
; ">	</span>=A0=A0- &quot;normal&quot; linux recipe in oe-core that people =
can bbappend</div>
<div><br></div><div>=A0 =A0 =A0- metadata layer splitting</div><div><br></d=
iv><div>=A0 =A0 =A0- infrastructure</div><div><br></div><div><br></div><div=
>Raw Transcript:</div><div><br></div><div><br></div><div>(1:21:46 PM) RP__:=
 Ok, so meeting wise is there much the TSC needs to discuss?</div>
<div>(1:21:57 PM) fray: I don&#39;t have any thing specific right now</div>=
<div>(1:22:22 PM) Tartarus: just general status I guess</div><div>(1:22:24 =
PM) RP__: multilib has been a pain but I think we&#39;re getting there with=
 it now</div>
<div>(1:22:53 PM) Jefro: do we want a formal meeting, or just to catch up w=
ith status? there were a few action items from last meeting (2 weeks ago)</=
div><div>(1:23:06 PM) RP__: stablility hasn&#39;t been good, again, I think=
 we&#39;re hunting down the regressions. The system wide ones should be fix=
ed, there are odd issues remaining build wise</div>
<div>(1:23:18 PM) RP__: Jefro: We could recap the action items?</div><div>(=
1:23:30 PM) Jefro: yes, coming up in just a sec</div><div>(1:23:52 PM) Tart=
arus: RP__: where do we stand with more build resources?</div><div>(1:23:56=
 PM) Tartarus: still &quot;soon&quot; ?</div>
<div>(1:24:04 PM) RP__: (beagleboard is broken on rpm as the long list of p=
ackage architectures broken rpm, there is an odd rpm locking issue floating=
 around and a qemuarm perl one)</div><div>(1:24:22 PM) RP__: Tartarus: The =
delivery of LF machines is cut down to the OE ones</div>
<div>(1:24:23 PM) fray: RP__ I sent a patch for beagleboard earlier.. I thi=
nk it&#39;s being validated</div><div>(1:24:45 PM) Tartarus: RP__: didn&#39=
;t quite parse that, again please?</div><div>(1:24:46 PM) RP__: Tartarus: I=
ntel has managed to get some more autobuilder resources which are coming on=
line piece by piece</div>
<div>(1:24:51 PM) fray: (sent a patch to Saul to look into that is)</div><d=
iv>(1:24:55 PM) Tartarus: RP__: ok, good</div><div>(1:25:03 PM) RP__: Tarta=
rus: I&#39;d said the LF was going to get us some machines, that won&#39;t =
happen</div>
<div>(1:25:10 PM) ***Tartarus has the Mentor stuff setup and handed off to =
others, we&#39;ll see how it goes</div><div>(1:25:12 PM) RP__: Only the one=
s promised to OE will</div><div>(1:25:14 PM) Jefro:=A0<a href=3D"http://pas=
tebin.com/qbPGBBKK" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">htt=
p://pastebin.com/qbPGBBKK</a></div>
<div>(1:25:31 PM) khem: RP__: are those also the oe machines that LF was to=
 provide ?</div><div>(1:25:33 PM) RP__: fray: thanks</div><div>(1:25:35 PM)=
 ***Jefro notes, that link is for agenda</div><div>(1:25:46 PM) khem: oh OE=
 will ok</div>
<div>(1:26:01 PM) khem: RP__: any idea timewise when that will happen</div>=
<div>(1:26:22 PM) RP__: khem: Tom King and Mike Wooster are discussing</div=
><div>(1:26:26 PM) khem: ok</div><div>(1:27:32 PM) khem: I have managed to =
run core-image-sato builds for all qemus within 24 hrs</div>
<div>(1:27:44 PM) khem: something we would want for daily testing</div><div=
>(1:29:46 PM) RP__: ok, do we want to work through the agenda?</div><div>(1=
:29:51 PM) RP__: I can chair</div><div>(1:29:55 PM) ***Jefro notes RP is ch=
air</div>
<div>(1:29:56 PM) RP__: Any additional topics?</div><div>(1:30:10 PM) ***RP=
__ notes the request for post 1.1 focus areas for yocto</div><div>(1:30:42 =
PM) RP__: khem: any update on item 3 (write up which scripts to use)?</div>
<div>(1:30:42 PM) ***Jefro notes for minutes</div><div>(1:31:07 PM) RP__: e=
lections, I think we&#39;re ok there right now</div><div>(1:31:22 PM) RP__:=
 OE-Core, multilib has moved forwards so we can consider that done</div>
<div>(1:31:35 PM) RP__: So its really down to other status updates :)</div>=
<div>(1:31:46 PM) ***RP__ aims for the record for the official meeting</div=
><div>(1:32:04 PM) RP__: others can jump in... :)</div><div>(1:32:30 PM) fr=
ay: only other thing I can think of is that I still intend to work on the A=
RM arch.. but havn&#39;t had time due to &quot;life&quot;</div>
<div>(1:32:40 PM) fray: in short the changes are minor compared to what is =
there..</div><div>(1:33:15 PM) RP__: I agree there are some tweaks still ne=
eded in places</div><div>(1:33:35 PM) fray: key is I think the big overhaul=
 work is done at this point</div>
<div>(1:33:38 PM) RP__: I really want to get builds working again and then =
start resolving those issues</div><div>(1:33:54 PM) RP__: Also note that we=
&#39;re going to make a big effort to clean up the various open bugs</div>
<div>(1:34:03 PM) RP__: We&#39;ve too many of them atm</div><div>(1:34:25 P=
M) khem: someone was here ..</div><div>(1:34:31 PM) khem: yes my AR is done=
</div><div>(1:34:44 PM) khem: Paul E replied with the querries</div><div>
(1:34:51 PM) khem: that were raised</div><div>(1:36:03 PM) RP__: SO unless =
anyone has anything else they want to add/ask/comment on, I think we&#39;re=
 done</div></span><br>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/b=
log" target=3D"_blank">http://jefro.net/blog</a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--20cf30434bf8e4c19004aa3d136a--
