Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 712A97F31C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 15:50:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id q1so39642869ion.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=dRU815fUzWUlk7vxguAY6xCv+r+U+waSiF47tVzHfIE=;
	b=fNaQLDqlLCHOeoR+84DH2FAdqFhUk8j2EXBDG/20WmM6da4///YP4GSLjSFaZ1la7x
	op9eVb9ulYms5HRvZivRBQ6ISdt0niP/Q63SwrDUBDt5XWt9lgY2DhdBpxXuGtBy9Kwv
	+R3sR81wucAf1wXxenocf5x/xOe7H/XSPIrdY6grsziwVpehfTkO5IOo1mVCUVXkyArG
	dPyZiBD+B9p2G32/bH+M/vi+7owwQ6Ud9V1cirUco1lbrhZNdvdQ3uSBC+Sq3SRY9cEi
	L7vX5C0nCQ4xLSR0Raa6nUkuLuMuWsALR0t7Nl2aZMKMY32ALsKxOjUxHPoz71XydvgR
	XB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=dRU815fUzWUlk7vxguAY6xCv+r+U+waSiF47tVzHfIE=;
	b=kNfLfTGrLNWoe6EJX7mFjX3ktR6aHQGy0eWqIhy4OVAS4JqaUNxpEUQ5YO7XN1oNAC
	qPLPOJgO43L0ADpBhvBKEg9M4vMLtRZbu0/vAt9sPzE4FtEOEJTqFejv4pOy6670JDzS
	C5Bzv5ZkGc8cpVaAa0ljexvCn5msqYkwHvY+O9JuulTsL9KrWETA/YKtu6uT83cTgQYS
	g/FAjVPyfrCd5wbbGLMma37MoPRyvf3JjbUpKiFcB0L1HI9VHljnok4CUVtg+O4N4RXS
	zP+socTQhq/6V8RKzdeshsz0HcfDYQvyzqztbpGCKUg/lxHdvIk5XU4b9gwyKoIdZ7DF
	E8uw==
X-Gm-Message-State: APjAAAViFwC+8HfkyZmwqDqn9pKtqhOr+ScUgqeecRm3bx9R1JvJzFIo
	MDE0agDmExZPesiFC7XhsK7p9JEmkvoVL1tSmwpZVYme
X-Google-Smtp-Source: APXvYqz63Ko6h0YxDRxd42IukvZ0CkcI/FZH3jzrCZpOcvCSBHdN+bnU6uNIDdNdWacZQIsqRwXTLceVktueQrFbpCs=
X-Received: by 2002:a5d:9f15:: with SMTP id q21mr1340130iot.130.1569858625192; 
	Mon, 30 Sep 2019 08:50:25 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 30 Sep 2019 08:50:14 -0700
Message-ID: <CAK5yBb9euGkauqcsc3KGoZRcaJOBQMXDdoZqho949iYtkQ2Hcg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: (No subject)
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
X-List-Received-Date: Mon, 30 Sep 2019 15:50:24 -0000
Content-Type: multipart/alternative; boundary="000000000000b3c4610593c73117"

--000000000000b3c4610593c73117
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,



The triage team is starting to try and collect up and classify bugs which a
newcomer to the project would be able to work on in a way which means
people can find them. They're being listed on the triage page under the
appropriate heading:



https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs



The idea is these bugs should be straight forward for a person to help work
on who doesn't have deep experience with the project.  If anyone can help,
please take ownership of the bug and send patches!  If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.



Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 309
unassigned or newcomer bugs.



We're hoping people may be able to spare some time now and again to help
out with these.  Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system.  There are also roughly four different "priority"
classes right now, =E2=80=9C2.8=E2=80=9D, =E2=80=9C2.9=E2=80=99, "2.99" and=
 "Future", the more
pressing/urgent issues being in "2.8" and then =E2=80=9C2.9=E2=80=9D.



Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account).  The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newcomer_Bugs

--=20

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000b3c4610593c73117
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">All,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">The triage team is starting to try and collect =
up and classify bugs
which a newcomer to the project would be able to work on in a way which mea=
ns
people can find them. They&#39;re being listed on the triage page under the
appropriate heading:</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><a href=3D"https://wiki.yoctoproject.org/wiki/B=
ug_Triage#Newcomer_Bugs" style=3D"color:rgb(5,99,193)">https://wiki.yoctopr=
oject.org/wiki/Bug_Triage#Newcomer_Bugs</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">The idea is these bugs should be straight forwa=
rd for a person to help
work on who doesn&#39;t have deep experience with the project.=C2=A0 If any=
one can
help, please take ownership of the bug and send patches!=C2=A0 If anyone ne=
eds
help/advice there are people on irc who can likely do so, or some of the mo=
re
experienced contributors will likely be happy to help too.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Also, the triage team meets weekly and does its=
 best to handle the
bugs reported into the Bugzilla. The number of people attending that meetin=
g
has fallen, as have the number of people available to help fix bugs. One of=
 the
things we hear users report is they don&#39;t know how to help. We (the tri=
age
team) are therefore going to start reporting out the currently 309 unassign=
ed
or newcomer bugs.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">We&#39;re hoping people may be able to spare so=
me time now and again to
help out with these.=C2=A0 Bugs are split into two types, &quot;true bugs&q=
uot;
where things don&#39;t work as they should and &quot;enhancements&quot; whi=
ch are
features we&#39;d want to add to the system.=C2=A0 There are also roughly f=
our
different &quot;priority&quot; classes right now, =E2=80=9C2.8=E2=80=9D, =
=E2=80=9C2.9=E2=80=99,
&quot;2.99&quot; and &quot;Future&quot;, the more pressing/urgent issues be=
ing
in &quot;2.8&quot; and then =E2=80=9C2.9=E2=80=9D.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Please review this link and if a bug is somethi=
ng you would be able to
help with either take ownership of the bug, or send me (<a href=3D"mailto:s=
jolley.yp.pm@gmail.com" style=3D"color:rgb(5,99,193)">sjolley.yp.pm@gmail.c=
om</a>)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account).=C2=A0 The list is at: <a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newcomer_=
Bugs" style=3D"color:rgb(5,99,193)">https://wiki.yoctoproject.org/wiki/Bug_=
Triage#Unassigned_or_Newcomer_Bugs</a></p><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-i=
mage:initial;background-position:initial;background-repeat:initial"><span s=
tyle=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></=
span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager<spa=
n></span></span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-family:&quot;Co=
urier New&quot;;color:fuchsia;background-image:initial;background-position:=
initial;background-repeat:initial">7867 SW Bayberry Dr., Beaverton, OR 9700=
7</span></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><sp=
an></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div></div>

--000000000000b3c4610593c73117--
