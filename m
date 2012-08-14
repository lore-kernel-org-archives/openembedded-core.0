Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T1FEB-0007WJ-Dv
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 13:24:03 +0200
Received: by ggmq1 with SMTP id q1so291830ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 04:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=VU0OnR7a9Y3xie6ou3ZD7SfsR9r2JEMxhn0czhlaT3Y=;
	b=A/WcGcuLBYO1siySyTU+EjgNrn5YMBP5H4tGzcpPUDbBeGCcocWW1UUTpJymsiRhVY
	p4fDBB7uB1EAIyJKz9awlVjBDdDGugnaOKf3WHLLvTIg2h3R4a0wUrdWhLCiLQw15S0Q
	wUs0sMTfyKrAVJPlbiZLJbORozGgkAZ6h/mkfKJM0ILNYJSX6QqVdjN275Qi6tgV3ZwL
	eUnoYw6aun0vvdL3AGY/Jv8lZrAz1ND3GvvLtSmiyzAOlOighOkdNdg3tXNX44Fno4UR
	jrkI6creEGGqYt0nrCK7MDzfiZw4N5GLPLl3b8moA9EUxUVzDVrst/UbTjxNTVOqfvks
	IAqg==
Received: by 10.42.18.8 with SMTP id v8mr12045070ica.34.1344942728226; Tue, 14
	Aug 2012 04:12:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Tue, 14 Aug 2012 04:11:46 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 14 Aug 2012 14:11:46 +0300
Message-ID: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnWeAuOUjz+rEOWm9EsygMzSOQ5NaLT3mLAw3bFpjLn034VRJHrFoJPtccf11S9ASQ8LjJ5
Subject: dbus with tests
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
X-List-Received-Date: Tue, 14 Aug 2012 11:24:03 -0000
Content-Type: multipart/alternative; boundary=20cf304271b68f268a04c737e103

--20cf304271b68f268a04c737e103
Content-Type: text/plain; charset=ISO-8859-1

In the process of updating dbus, tests (in my opinion) are mandatory.

While compiling dbus with tests, dbus and dbus-glib are needed. To
compile dbus-glib, dbus is needed (obviously). The only solution (to
compile dbus with tests) that i found is to create a new recipe named
dbus-tests where to compile dbus with --enable-tests
--enable-embedded-tests, skip write to sysroot (noexec) and just package
dbus-tests.

1. Do you guys know a better solution for this?
2. What would be a good path to use for installing tests?


ag

--20cf304271b68f268a04c737e103
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>In the process of updating dbus, tests (in my opinion) are mandatory.<=
/div><div><br></div><div>While compiling dbus with tests, dbus and dbus-gli=
b are needed. To compile=A0dbus-glib, dbus is needed (obviously). The only =
solution (to compile dbus with tests) that i found is to create a new recip=
e named dbus-tests where to compile dbus with --enable-tests --enable-embed=
ded-tests, skip write to sysroot (noexec) and just package dbus-tests.</div=
>

<div><br></div><div>1. Do you guys know a better solution for this?</div><d=
iv>2. What would be a good path to use for installing tests?</div><div><br>=
</div><div style=3D"text-align:center"><div align=3D"left" style=3D"font-fa=
mily:&#39;Times New Roman&#39;;font-size:medium">

<font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>ag</font></div></div=
>

--20cf304271b68f268a04c737e103--
