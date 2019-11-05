Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id D8E1E7F961
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 04:46:19 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k1so21133862iom.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 20:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=5vdE9fZhceM4HmVu9JUKb3aNRgeDK9BAyAjFWnnW1Tg=;
	b=mCnPMZYZj7nq4pFgIDFtm//xdRjfjA4BlAsW5YK5H4e3h/f6hMLtoEfCSoy8KWjlMM
	wPfrZBqkGNdAxAHvGCgB8+WiA2Bn6U2h0YxPIW7WudWK8Gq/IT8OMNqyeBJZYrgQw9+W
	Cdr4BKaOryXvbqBdlaEvITQORKGVCZuNliX50ixT23AcCiL4Dzg1pXNQ31WoYBNRQK4l
	MnhB0PWdIbvXTnInZr/yf65TF0qQMFWtYTueitHgFEzS1cbWyVPUZTKTejpJoFzB/l4Y
	jzNtTi0hp0AzNcqtLrD3WQI35baWmAwWjDjB9qUZh+zGNURA8UGDTFNOACPVLgNxdC07
	SJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5vdE9fZhceM4HmVu9JUKb3aNRgeDK9BAyAjFWnnW1Tg=;
	b=aNedtBKajJYlRTe67NdwEaKcfMfR0aFLbmHOeGl/3TG3fFWqRg905aWfb3acQtWfbD
	Z5LMJUv0tPzr2ZtmzN8mq9/Vkz9SJtsGnhQknysj3qwhd/s76zElbfLVxIL0nBC1Pmpn
	VjV4JpUxH/71ItRx+pmKJNVsyOwX7PfhpsqLx2YlGRO/T4V9KrirP9ji12XsXT9+GdQ4
	h1KbGJI5pBDAjSuDowllYowMJaBuwgiyyT8T/vfOf9PJ2NwI0sN4F3w2VjzMKxXNvjj8
	79vulN6ZIK10In/alWFgIz2exBEDkcfH1VYjdBoVYnX+o6xoPjDSajAGrMPwduxdd1o5
	BohA==
X-Gm-Message-State: APjAAAWKC7cfqkycoNXVBlINn9drCn9NZFErKTpKJDn/9e9Ykhzr1dm4
	5FViAJOJifLIs6D2V6ja0fFgKypcEyOV/XsSBt8=
X-Google-Smtp-Source: APXvYqyhNgFeNoQzTPvchl3H1Cj7wRVMV4hps6xms6oYA5XdmPLL2XUwXRQ8QrEQFxP80sSF7YH3nPxD1KhA82vDFAw=
X-Received: by 2002:a02:c98e:: with SMTP id b14mr17295572jap.133.1572929180704;
	Mon, 04 Nov 2019 20:46:20 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 4 Nov 2019 20:46:10 -0800
Message-ID: <CAK5yBb_8tMwFP1bgYk46XXm2oCrO4Oac-hmVAFJgSFRzMdXjhA@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 05 Nov 2019 04:46:20 -0000
Content-Type: multipart/alternative; boundary="00000000000012a3e80596921d74"

--00000000000012a3e80596921d74
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
team) are therefore going to start reporting out the currently 298
unassigned or newcomer bugs.



We're hoping people may be able to spare some time now and again to help
out with these.  Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system.  There are also roughly four different "priority"
classes right now, =E2=80=9C3.1=E2=80=9D, =E2=80=9C3.2, "3.99" and "Future"=
, the more
pressing/urgent issues being in "3.1" and then =E2=80=9C3.2=E2=80=9D.



Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account).  The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newcomer_Bugs

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000012a3e80596921d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">All,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">The triage team is starting to try and
collect up and classify bugs which a newcomer to the project would be able =
to
work on in a way which means people can find them. They&#39;re being listed=
 on the
triage page under the appropriate heading:</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><a href=3D"https://wiki.yoctoproject.org/wiki/B=
ug_Triage#Newcomer_Bugs" style=3D"font-family:&quot;Times New Roman&quot;,s=
erif;color:rgb(5,99,193)">https://wiki.yoctoproject.org/wiki/Bug_Triage#New=
comer_Bugs</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">The idea is these bugs should be straight
forward for a person to help work on who doesn&#39;t have deep experience w=
ith the
project.=C2=A0 If anyone can help, please take ownership of the bug and sen=
d
patches!=C2=A0 If anyone needs help/advice there are people on irc who can
likely do so, or some of the more experienced contributors will likely be h=
appy
to help too.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Also, the triage team meets weekly and
does its best to handle the bugs reported into the Bugzilla. The number of
people attending that meeting has fallen, as have the number of people
available to help fix bugs. One of the things we hear users report is they
don&#39;t know how to help. We (the triage team) are therefore going to sta=
rt
reporting out the currently 298 unassigned or newcomer bugs.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">We&#39;re hoping people may be able to spare
some time now and again to help out with these.=C2=A0 Bugs are split into t=
wo
types, &quot;true bugs&quot; where things don&#39;t work as they should and
&quot;enhancements&quot; which are features we&#39;d want to add to the
system.=C2=A0 There are also roughly four different &quot;priority&quot;
classes right now, =E2=80=9C3.1=E2=80=9D, =E2=80=9C3.2, &quot;3.99&quot; an=
d &quot;Future&quot;, the
more pressing/urgent issues being in &quot;3.1&quot; and then =E2=80=9C3.2=
=E2=80=9D.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Please review this link and if a bug is
something you would be able to help with either take ownership of the bug, =
or
send me (<a href=3D"mailto:sjolley.yp.pm@gmail.com" style=3D"font-family:&q=
uot;Times New Roman&quot;,serif;color:rgb(5,99,193)">sjolley.yp.pm@gmail.co=
m</a>) an e-mail with the bug number you
would like and I will assign it to you (please make sure you have a Bugzill=
a
account).=C2=A0 The list is at: <a href=3D"https://wiki.yoctoproject.org/wi=
ki/Bug_Triage#Unassigned_or_Newcomer_Bugs" style=3D"font-family:&quot;Times=
 New Roman&quot;,serif;color:rgb(5,99,193)">https://wiki.yoctoproject.org/w=
iki/Bug_Triage#Unassigned_or_Newcomer_Bugs</a></p><div><br></div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"backgroun=
d-image:initial;background-position:initial;background-repeat:initial"><spa=
n style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span=
></span></p>

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

--00000000000012a3e80596921d74--
