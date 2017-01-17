Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF3A71AE6;
	Tue, 17 Jan 2017 18:06:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2017 10:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="54347034"
Received: from jayyinch-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.188.18])
	by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2017 10:06:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-architecture@lists.openembedded.org,
	openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Wed, 18 Jan 2017 07:05:58 +1300
Message-ID: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
MIME-Version: 1.0
Subject: Patchwork and incoming patch testing
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
X-List-Received-Date: Tue, 17 Jan 2017 18:06:32 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi all,

As some of you are aware some of my colleagues and I have been working =
on=20
improving how incoming patches are handled - initially for OE-Core but =
we hope=20
to arrive at something that will be useful for other layers as well. Th=
e aim=20
was to do so without adversely affecting existing workflows, so that me=
ans=20
building on top of the things we already have. It's taken a bit longer =
than=20
we'd originally planned - we embarked on this a little over a year ago =
[1] -=20
but now I am happy to be able to show some meaningful progress.

A few months ago we upgraded OE's patchwork instance [2], moving not ju=
st to a=20
later version but to a fork of patchwork where a bunch of new functiona=
lity=20
was being developed for freedesktop.org [3], notably support for captur=
ing and=20
presenting patch series instead of just individual patches. There were =
some=20
teething problems but we've now resolved most of them. Unfortunately wo=
rk on=20
said freedesktop.org fork appears to have stalled so for now we have fo=
rked it=20
ourselves [4]; long term we'll have to see if we can merge back with pa=
tchwork=20
upstream - at least for small fixes we'll try to push those back up=20
independent of any wholesale merge. In any event we are now finally in =
the=20
position where our patchwork instance can be relied upon to collect ema=
ils,=20
and the UI is much improved. This should give us a bit more visibility =
into=20
where patches are at in the process, although we are still working on a=
 few=20
places where patch series status needs to be updated (e.g. when a patch=
 goes=20
into testing).

On top of patchwork we have built a simple smoke-testing framework call=
ed=20
"patchtest" [5] along with a suite of corresponding tests for OE [6]. T=
hese=20
tests are fairly simplistic at this point but check the basics such as =
whether=20
a patch has been properly signed off, etc. We should soon start seeing =
replies=20
sent to the mailing list and to submitters with results if there are an=
y=20
failures, saving us from noticing and pointing out some of the more obv=
ious=20
classes of mistakes. The tests are easy to run locally without the rest=
 of the=20
infrastructure and can be extended without difficulty, and I expect we'=
ll=20
continue to work on those as time progresses. Contributions would be ve=
ry=20
welcome.

My sincere thanks to Jos=E9 Lamego, Leonardo Sandoval, Daniela Plascenc=
ia,=20
Belen Barros Pena, Michael Halstead, Damien Lespiau, Patrick Ohly and o=
thers=20
that have been part of implementing this, and to everyone else who has =
put up=20
with the delays.

Please let us know if you have issues with any part of this process or=20=

suggestions on how to improve it. We're tracking improvements in the Yo=
cto=20
Project bugzilla [7] so you can see what's being worked on there if you=
're=20
interested.

Cheers,
Paul

[1] Earlier announcement:
    https://www.mail-archive.com/openembedded-core@lists.openembedded.o=
rg/msg72952.html

[2] OE's patchwork instance:
    http://patchwork.openembedded.org

[3] Freedesktop.org patchwork fork:
    https://github.com/dlespiau/patchwork

[4] Our patchwork fork:
    http://git.yoctoproject.org/cgit/cgit.cgi/patchwork/

[5] Patchtest main repository:
    http://git.yoctoproject.org/cgit/cgit.cgi/patchtest/

[6] OE test suite for patchtest:
    http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/

[7] Yocto Project bugzilla area for patchwork/patchtest:
    https://bugzilla.yoctoproject.org/describecomponents.cgi?product=3D=
Patchwork%2FPatchtest

--=20

Paul Eggleton
Intel Open Source Technology Centre

