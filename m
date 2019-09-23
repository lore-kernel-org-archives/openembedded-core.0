Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCFD7D714
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 16:36:49 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id c6so21821926ioo.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=RCSKgTAmHPjXi6odr3WcdRwIecjZOCuDOimJ1kCAAh0=;
	b=rYzNkCvsRnVCy7Zq0/RE12FZwLDNBUglbQn9HkcuWvbrvINR3/KsEG0bLNoMZBZfOK
	365zTomCI6WxkeLaXCfidtSKlkWHGJJF7CDgxmCegVWuWuooBT4rQr3e5QPLA0k6xTX4
	89Jo+D8DRO2dtCeIdPVM9qI5AaCHuV9a8actcxl27y4xm9kaXPEFO5DPS8LW7CcxVQTm
	m+4ma4DJOgbDL6HuhydC+6l5WX5GNJJGuCRQ80ekqxpebH7AAf0aAjV2ipO9q6bkAXnD
	OqFP7zqx3zSnevF80Rg5+Tdqzi6tzsSKPUP+BQp2pn24h70sNgJOZykhDiUM8bVpFv6v
	P6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RCSKgTAmHPjXi6odr3WcdRwIecjZOCuDOimJ1kCAAh0=;
	b=KxLEl5kFT3jF6DBzJe9GbvtrILUEyrcfXA0BFLRa7Y2iL6hApjv7RSTPZXL9lM04gH
	77sVhgXEOdGShSyclSm1OVqEP7vTaStRljghkkJBjhlB7KMsZSFYr4oYSja3ZMZZse/J
	8fDMKuxTF1ew4CGNIESfBiX/j2gkbbYS/8JW4ZovrmRLjME6UIYHMfUEnVxiZxFLcNHA
	rOGjmFjRszyHkZ00Ftr6FCu0SSsapaUPDNq7jcuTplMBKppQlL8ZrkxCNtNadAbO2Gnf
	C5exhnrk0uyXCN72K6R1931jUDexvmmorOKHIT6fmokzXn+k2g4OJYlD5tU9iqwy6qgB
	oLEg==
X-Gm-Message-State: APjAAAWkk5Ppoy1XDv3H28Pe4ogdx15Agh6P986YpIvrEuxvSJwak9ay
	+Y+MAUTCw0R/AOwA/E1YtiHfJytumXKxtSSUjv1wqHBd
X-Google-Smtp-Source: APXvYqw9iGYHUbNVQmnPP8pW1T2Cg9JJ503u+Op5GXsQEEAnpTQjwgE8PXNZ6KdedqdVe+HPGVXb/KweiZbmeeWCqaY=
X-Received: by 2002:a05:6638:778:: with SMTP id
	y24mr299205jad.122.1569256610913; 
	Mon, 23 Sep 2019 09:36:50 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 23 Sep 2019 09:36:40 -0700
Message-ID: <CAK5yBb_j-WDm=kbEGpY_jE5+PhGFBJSPdwK52phD6-zHMoSdLg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
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
X-List-Received-Date: Mon, 23 Sep 2019 16:36:50 -0000
Content-Type: multipart/alternative; boundary="000000000000dadf7f05933b06c1"

--000000000000dadf7f05933b06c1
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
team) are therefore going to start reporting out the currently 280
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

* *Email*:                 *stephen.k.jolley@intel.com
<stephen.k.jolley@intel.com>*

--000000000000dadf7f05933b06c1
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
team) are therefore going to start reporting out the currently 280 unassign=
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
=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initial;backgroun=
d-position:initial;background-repeat:initial"><span style=3D"font-size:12pt=
;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

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
erif;color:blue"><a href=3D"mailto:stephen.k.jolley@intel.com" target=3D"_b=
lank"><span style=3D"color:rgb(17,85,204)">stephen.k.jolley@intel.com</span=
></a></span></u><span style=3D"font-size:12pt;font-family:Arial,sans-serif"=
><span></span></span></p></div></div></div>

--000000000000dadf7f05933b06c1--
