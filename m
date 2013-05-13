Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc0Y0-0007xi-8k
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:44:44 +0200
Received: by mail-wg0-f42.google.com with SMTP id j13so3399935wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 14:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9hrKvSYJ+h0LLtKNzrr8LUMJmLRJZ751Vsg4GgwOllc=;
	b=ZDUS3enG+IIttIOJYuq6MlphTiAyYap3pebwzDrLs5ZVB9J80qL1zS3P8Ep0vFHXSB
	EWpybpNW1LXtTIsNq+2glE4cYWpQTP90oZzx42G99O179NXH6EZ3Ih3M0QUalguDqq6C
	/qbTDWw1v2PYYE1iPVGUWW2QjjCvppFhkeuTDpC64DmDC8HM37teQ0feHQy5gv6KAES1
	HG4F800/nm9lPQ0WLlcxTlhmJhvekts3kEFt+236MLBtdLV10q3cOnMv5Nd5vSfc4akZ
	jcaFAts8uf970LeE1t0MDXKi7MMDma+h+YvnUHHt6UazcQrmcG1nFCkd0uaerGEpBOWH
	Ac5w==
MIME-Version: 1.0
X-Received: by 10.180.187.234 with SMTP id fv10mr30463wic.29.1368480393011;
	Mon, 13 May 2013 14:26:33 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 14:26:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131712570.13256@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131704540.13080@oneiric>
	<CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
	<alpine.DEB.2.02.1305131712570.13256@oneiric>
Date: Mon, 13 May 2013 17:26:32 -0400
Message-ID: <CAHUNapTaTrZ8A8zMiaAiqwYbZx09s096EHNDRCo0nOw5-EO8HA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 21:44:45 -0000
Content-Type: multipart/alternative; boundary=001a11c3848eb52a4604dca02b1b

--001a11c3848eb52a4604dca02b1b
Content-Type: text/plain; charset=ISO-8859-1

I'm building core-image-minimal, I assume that's what everyone else is
doing.

When I run the "bitbake -s" as Robert is, I get the following:

$ bitbake -s | grep linux
linux-dummy                                           :1.0-r1

linux-firmware
 1:0.0+gitAUTOINC+c530a75c1e6a472b0eb9558310b518f0dfcd8860-r0

linux-libc-headers                                    :3.8-r0

linux-libc-headers-yocto
 :3.4+git-AUTOINC+a1cdb60720c452c3965eaec3ec2cd10f06261cc5_a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r6

linux-yocto
:3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_dd089cb5ba37ea14e8f90a884bf2a5be64ed817d-r4.1
:3.4.43+gitAUTOINC+1bab5bd090948b4cc4c4ed57c834603a3cf9f235_fff57da7886cf5e99c07adf6649610cb1cd89330-r4.4
linuxdoc-tools-native                              :0.9.66-r3

nativesdk-linux-libc-headers                          :3.8-r0

nativesdk-linux-libc-headers-yocto
 :3.4+git-AUTOINC+a1cdb60720c452c3965eaec3ec2cd10f06261cc5_a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r6

nativesdk-ocf-linux                            :20120127-r3.0

ocf-linux                                      :20120127-r3.0

ocf-linux-native                               :20120127-r3.0

syslinux-native                                      :4.03-r9

util-linux                                         :2.22.2-r3

util-linux-native                                  :2.22.2-r3


As you can see, I do have a 3.8.11 in my list too, but when I run "runqemu
qemumips64" my banner (from the VM) says my image is running 3.4.43.

--001a11c3848eb52a4604dca02b1b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m building core-image-minimal, I assume that&#39;s w=
hat everyone else is doing.<div><br></div><div>When I run the &quot;bitbake=
 -s&quot; as Robert is, I get the following:</div><div><br></div><div><div>
$ bitbake -s | grep linux</div><div>linux-dummy =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :1.0-r1 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>linux-firmware =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01:0.0+gitAUTOINC+c530a75c1e6a472b0eb=
9558310b518f0dfcd8860-r0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0</div>
<div>linux-libc-headers =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0:3.8-r0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0</div><div>linux-libc-headers-yocto =A0 =A0 =A0 =A0 =A0 =A0:3.4+git-AUT=
OINC+a1cdb60720c452c3965eaec3ec2cd10f06261cc5_a1cdb60720c452c3965eaec3ec2cd=
10f06261cc5-r6 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>linux-yocto =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :3.8.11+gi=
tAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_dd089cb5ba37ea14e8f90a884=
bf2a5be64ed817d-r4.1 :3.4.43+gitAUTOINC+1bab5bd090948b4cc4c4ed57c834603a3cf=
9f235_fff57da7886cf5e99c07adf6649610cb1cd89330-r4.4</div>
<div>linuxdoc-tools-native =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0:0.9.66-r3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</=
div><div>nativesdk-linux-libc-headers =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0:3.8-r0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<=
/div><div>nativesdk-linux-libc-headers-yocto =A0:3.4+git-AUTOINC+a1cdb60720=
c452c3965eaec3ec2cd10f06261cc5_a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r6 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>nativesdk-ocf-linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0:20120127-r3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</=
div><div>ocf-linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0:20120127-r3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0</div><div>ocf-linux-native =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 :20120127-r3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0</div>
<div>syslinux-native =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0:4.03-r9 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0</div><div>util-linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :2.22.2-r3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0</div><div>util-linux-native =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:2.22.2-r3</div>
</div><div><br></div><div><br></div><div style>As you can see, I do have a =
3.8.11 in my list too, but when I run &quot;runqemu</div><div style>qemumip=
s64&quot; my banner (from the VM) says my image is running 3.4.43.</div>
</div>

--001a11c3848eb52a4604dca02b1b--
