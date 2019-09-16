Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id E57717F26C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 17:14:20 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id n197so765584iod.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Bs5jE5MH6JwZP29GgzYbo8XHUi6EbmRBbiNoedqvK1o=;
	b=qON1EayKdBPNZQtumoICIiaEUleNTpO8J2Kn/aoSJyOewQ50GLQ/q2uXK62KZ3TmdX
	aMkWi/xcyVVxj6rc4mzBuNzISee/4jn58D4hcFq9TI5UE5BTER/7mbwNL2b+BGy7Rkcf
	7FO1d8+/vJxGyUJWI3ayUIlqLM8z/uoiIOzCgHP8iWnzyaN7ke6C5a1IscX4BV5oOWOR
	i9OA6EJYmOfzqLeXL7PYyh0x5JqKR5M6I6GXlrTCmd5NiEGZXLfAQJYAmlhZ+DC7djFK
	eMlxQTZlk8KSh8BrNp1WyLw9BibbeEjCNSFJDteRqZ0MDjL9F8ujTWNRDpzc9XpxxFdE
	CsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Bs5jE5MH6JwZP29GgzYbo8XHUi6EbmRBbiNoedqvK1o=;
	b=X0Vv/9iaDBfTh4G+6rMLWOzg3qacYjE56AY8WtVDwDDV4wjUf8OL9HiEYJE1WkZOri
	XVVVBc2zmkWVU4r0morS9Fk9vvV4Iwhn2ZsSBIv39/uSg2NOrMevnEcb0ZWqSkshMfO8
	fytqEYZjgLJ1H+nhSrmYn/SFB6jk8D9kc8CRKBIXNt7g9vPUoqSht3thPEufVop1xekt
	IR96BISfs6AZFQro9FTjBMPjI/yFq65+M3pxa/x35wBv5Ea/E5bqHN/MYsjB8u5daUzb
	5Oq8+5u5LIH7+8Gxq2+rgL2O2JEbFdu+gK5BOHNU4pLtm1AiROlY/APtHH2Qn+T34mkm
	G6Jg==
X-Gm-Message-State: APjAAAVxvWcS0lT3d/JN9PwcgtGBa84KuKN52ZR/BXfEsocYrUKhsMqS
	1IkfgbZLVtO579dSQRLFBwcaC0YF04Yp6/k8n/s=
X-Google-Smtp-Source: APXvYqxz4JmRZRLhKqgorsi3AqVaAJyDeEYVZZPZjghxpbYwcY6YAuJEQiJ4NpdagSWeeUcjC7V5w654hF4UUkYkZh8=
X-Received: by 2002:a02:b156:: with SMTP id s22mr1057582jah.102.1568654061767; 
	Mon, 16 Sep 2019 10:14:21 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 16 Sep 2019 10:14:11 -0700
Message-ID: <CAK5yBb9sBKDwe=braZgTbM=PY1pVJVephoQX5HBG9ifJs22Apw@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Sep 2019 17:14:21 -0000
Content-Type: multipart/alternative; boundary="0000000000002091010592aebce0"

--0000000000002091010592aebce0
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
team) are therefore going to start reporting out the currently 300
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



Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:              sjolley.yp.pm@gmail.com

--0000000000002091010592aebce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0i=
n 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">All,</p>

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
team) are therefore going to start reporting out the currently 300 unassign=
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
Triage#Unassigned_or_Newcomer_Bugs</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Thanks,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"break-after:avoid;margin:0in 0in 0.0001pt;f=
ont-size:11pt;font-family:Calibri,sans-serif"><b><i><span style=3D"font-siz=
e:16pt;font-family:&quot;Times New Roman&quot;,serif;color:purple">Stephen =
K. Jolley</span></i></b><b><i><span style=3D"font-size:16pt;font-family:Tah=
oma,sans-serif;color:purple"></span></i></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><b><span style=3D"font-size:8pt;font-family:&qu=
ot;Courier New&quot;;color:blue">Yocto Project
Program Manager</span></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:9pt;font-family:Wingdi=
ngs;color:black">(</span><span style=3D"font-size:9pt;font-family:&quot;MS =
Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0 </span><b><span style=
=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color:teal">Cell</s=
pan></b><span style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,=
serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif">(208) 244-4460<span style=3D"color:black"></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:9pt;font-family:Wingdi=
ngs">* </span><b><span lang=3D"FR" style=3D"font-size:8pt;font-family:&quot=
;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D=
"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">:</s=
pan><span lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Seri=
f&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"mailto:sjolley.yp.pm@gmail.com" style=3D=
"color:rgb(5,99,193)">sjolley.yp.pm@gmail.com</a></span></p></div></div>

--0000000000002091010592aebce0--
