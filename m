Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1S7aD3-0004Oq-HU; Tue, 13 Mar 2012 23:28:49 +0100
Received: by iaag37 with SMTP id g37so1318707iaa.6
	for <multiple recipients>; Tue, 13 Mar 2012 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=aJVdWY2sHyGNDqWBHFcjUrxkhaJNCZNlAvsjz7iPa2g=;
	b=yV11yOc3N+oC/0pQOG1G0nJDjNUr1EaVKIvCVAAt2FKfMlAzmJ18SBuFsdwpy4wjXN
	hA9weLo0SakQsARUQ7kbxPd4zCgG3j6qjB2gYKStFJvM7PyjbleGi7Qu27/g+FLSztKE
	3/AuCeMfXcKVHNWVqdvuSopwM9ds6U2qyziE6rZlCmd2dEfJImrlxkPZsqZMxMTtWIuy
	3Jp3CB/S/RReYE0JrfZNmAZ5Udfk6lY9jzggZNMZEls1/1K4flITpRZ84KxK26GrOlhi
	gRXcmMmVmnWsWuUdPPyNgldkUFO1y245PGDcj3qW0Hhw5DRSbHBdI+37JikaJBwBmbvd
	cnLQ==
MIME-Version: 1.0
Received: by 10.50.89.168 with SMTP id bp8mr7713440igb.3.1331677203452; Tue,
	13 Mar 2012 15:20:03 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.127.38 with HTTP; Tue, 13 Mar 2012 15:20:03 -0700 (PDT)
Date: Tue, 13 Mar 2012 15:20:03 -0700
X-Google-Sender-Auth: WkS1n4q585wJn78eehhc6xNIRGo
Message-ID: <CA+YB3rapmuP1868ag1CjQ3-_=-PEFZR5VEc85asUtVhepQB06Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes: 15 Feb 2012
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
X-List-Received-Date: Tue, 13 Mar 2012 22:28:50 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba959aad1d804bb274260

--e89a8f3ba959aad1d804bb274260
Content-Type: text/plain; charset=ISO-8859-1

NOTE: I apologize for the lateness of these minutes; they go a lot faster
when the meeting is held online!

OpenEmbedded Technical Steering Committee
15 February, 2012
face-to-face meeting at Embedded Linux Conference

Attending:

Richard Purdie
Mark Hatle
Tom Rini
Khem Raj
Paul Eggleton
minutes: Jeff Osier-Mixon

Agenda:

There was no fixed agenda for this meeting - the notes below
describe what was discussed.

Yocto Project DevDay discussion
  The Yocto Project had its first Developer Day the day before this
  meeting. There were several presentations as well as hands-on labs
  for both new and experienced users.

BitBake interrupts
  When BitBake hangs, there is no feedback from it, can't ctrl-c
  Richard believes it is a threading problem, following up with Chris L
  UPDATE: found to be a double shutdown, patches have been merged

Moving to Python 3
  Possible, not really a problem if want to do it
  Many technical issues discussed, no action items assigned

Elections
  After next week, remind the board
  Mark is up now, then Tom, then cycle is done

zlib
  Khem, Matt McClintock submitted many patches
  Have been doing shakeout, decided not to inflict on issues
  Gary Thomas found many isses as well
  Issue - enabling basic hash, should resolve zlib issue in future
  Proposal on oe list, doing this in yocto, could do in oe-core
  AR: RP did this after meeting

TSC Retrospective meeting with board
  Agreed to meet with board for lunch for an annual retrospective

memory usage issues
  Discussion about current BitBake memory footprint growth
  Use of fetchers to fetch metadata, suggested from previous
    discussions - Jeremy Puhlman, Richard, Paul
    do as part of bb build process or as separate step
  Many other memory issues discussed
  Found some memory issue and changes merged recently to improve
    the codeparser cache.


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--e89a8f3ba959aad1d804bb274260
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>NOTE: I apologize for the lateness of these minutes; they go a lot fas=
ter when the meeting is held online!</div><div><br></div><div>OpenEmbedded =
Technical Steering Committee</div><div>15 February, 2012</div><div>face-to-=
face meeting at Embedded Linux Conference</div>
<div><br></div><div>Attending:</div><div><br></div><div>Richard Purdie</div=
><div>Mark Hatle</div><div>Tom Rini</div><div>Khem Raj</div><div>Paul Eggle=
ton</div><div>minutes: Jeff Osier-Mixon</div><div><br></div><div>Agenda:</d=
iv>
<div><br></div><div>There was no fixed agenda for this meeting - the notes =
below</div><div>describe what was discussed.</div><div><br></div><div>Yocto=
 Project DevDay discussion</div><div>=A0 The Yocto Project had its first De=
veloper Day the day before this</div>
<div>=A0 meeting. There were several presentations as well as hands-on labs=
</div><div>=A0 for both new and experienced users.</div><div><br></div><div=
>BitBake interrupts</div><div>=A0 When BitBake hangs, there is no feedback =
from it, can&#39;t ctrl-c</div>
<div>=A0 Richard believes it is a threading problem, following up with Chri=
s L</div><div>=A0 UPDATE: found to be a double shutdown, patches have been =
merged</div><div><br></div><div>Moving to Python 3</div><div>=A0 Possible, =
not really a problem if want to do it</div>
<div>=A0 Many technical issues discussed, no action items assigned</div><di=
v><br></div><div>Elections</div><div>=A0 After next week, remind the board<=
/div><div>=A0 Mark is up now, then Tom, then cycle is done</div><div><br></=
div>
<div>zlib</div><div>=A0 Khem, Matt McClintock submitted many patches</div><=
div>=A0 Have been doing shakeout, decided not to inflict on issues</div><di=
v>=A0 Gary Thomas found many isses as well</div><div>=A0 Issue - enabling b=
asic hash, should resolve zlib issue in future</div>
<div>=A0 Proposal on oe list, doing this in yocto, could do in oe-core</div=
><div>=A0 AR: RP did this after meeting</div><div><br></div><div>TSC Retros=
pective meeting with board</div><div>=A0 Agreed to meet with board for lunc=
h for an annual retrospective</div>
<div><br></div><div>memory usage issues</div><div>=A0 Discussion about curr=
ent BitBake memory footprint growth</div><div>=A0 Use of fetchers to fetch =
metadata, suggested from previous</div><div>=A0 =A0 discussions - Jeremy Pu=
hlman, Richard, Paul</div>
<div>=A0 =A0 do as part of bb build process or as separate step</div><div>=
=A0 Many other memory issues discussed</div><div>=A0 Found some memory issu=
e and changes merged recently to improve</div><div>=A0 =A0 the codeparser c=
ache.</div>
<div><br></div><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jef=
ro.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project =
Community Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_bla=
nk">http://yoctoproject.org</a></div>
<br>

--e89a8f3ba959aad1d804bb274260--
