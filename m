Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB68F606A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 07:49:16 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id x7so8072349qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pmtSk8khLqBzM9xetPJUe338sk8Y2d7p3Ft02uQ0LzA=;
	b=cB4Y1lVkLTIp1SgSJCjBRCLWUdH6Y2ScssdYh5LmWDP3g0SiVKHcghFBxJ6KLK6ISR
	DtXKnDeCS5rANPQuJkf7WGuqW7/Fq3BZj4vQtcrALBdsfSISvqccndzdFL4MFNGFSqr6
	5z+PKeO1WIBZTFb46Tt153PfjEcGU/T4Mc8Sxl4lePnCeyiL5Nw08yY53Bq4ueI+LikC
	Z8WMrxdc+KsJSTBjr9kjj+ufiuZZTm9K2/INQQA2v5waPFhgXzvtPYFOqIU2fYhf2zRT
	BfKHJZw5CM/PKFfOiOGM9Qgk/uIy5NDd5BTkLB6bnlgJApwSXwpjHkmbBS+6zqITqvyu
	p+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pmtSk8khLqBzM9xetPJUe338sk8Y2d7p3Ft02uQ0LzA=;
	b=f0gwZBHuk2G7BkZsUVL5tGQbqcf8p1Mj7zOWzy3zAZcEq8e1E6oApMRKr697e4qQhp
	tNgr0qalP3j13xWW+czzr6YIUwhsuqXeuhaTgKcLDJveEKuFVmeOdycqiRktEX2dS5JP
	dCEcVx6vxhQRsmGPed9zlg1uRc9Ni9IO6Pl9GRRpKlaANAXlHZ+Y3ji6Q7r7HzfV4bvR
	EHNv8fwQx1ZEtVvhkZjzF+IgpW93N22bRjZM/O/Si+LO1Op2C4RvRcAv7fPDLGdWhvWa
	mmU2+DZ4L1AGgWTTPX8SLnvooV7LDhdcoW1r/9w1hl2UoA+qHO1VEA75pjV7dIfBTr+e
	ZkDA==
X-Gm-Message-State: AOPr4FUSWPR2bo8l7GtPGSIXxitsqX/GOIwuJSMtKLKxqgQMpA7y+JBhXSwjAbP76vkVfnz+NTDyNDYZM7UfRA==
X-Received: by 10.55.22.195 with SMTP id 64mr17223611qkw.87.1460706557071;
	Fri, 15 Apr 2016 00:49:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.89.178 with HTTP; Fri, 15 Apr 2016 00:48:57 -0700 (PDT)
In-Reply-To: <CADyYWLkKaW0fFjentEq7h9AgojtHyLRFRnmCd7heA+bTBX515w@mail.gmail.com>
References: <CADyYWLkKaW0fFjentEq7h9AgojtHyLRFRnmCd7heA+bTBX515w@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Fri, 15 Apr 2016 13:18:57 +0530
Message-ID: <CADyYWL=A4MiQO8Vi+AGD397=kKVzULFTW0fr6c_WnUG_9O=Zkg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [yocto][meta-qt5] How to increase depth of qemuarm from bootargs?
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
X-List-Received-Date: Fri, 15 Apr 2016 07:49:17 -0000
Content-Type: multipart/alternative; boundary=001a11496d667497a10530813fbf

--001a11496d667497a10530813fbf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ----------
From: sujith h <sujith.h@gmail.com>
Date: Thu, Apr 14, 2016 at 2:53 PM
Subject: [yocto][meta-qt5] How to increase depth of qemuarm from bootargs?
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Cc: Noor_Ahsan@mentor.com


Hi all,

I am trying to build Qt5 from meta-qt5 ( master branch ) with poky( machine
is qemuarm). The qtbase is built successfully and is installed into
core-image-sato. When I run : runqemu qemuarm
I can see the matchbox window launched successfully.The qtbase is having
gles2 enabled in the PACKAGECONFIG and gl is removed from PACKAGECONFIG. In
mesa I have enabled gallium. I do see a problem when I try to run qtbase
opengl examples.The gui gets displayed. But the image(s) associated with it
never displays. For example lets say there is an example known as cube.
When I try to run cube ( with -platform xcb), I could see a black screen.
The cube image never comes. So my query is if it's possible to increase the
depth ( default used is 16 for qemuarm ) to 24 through bootargs? If so a
helping hand would be great. Let me know if more information is required
regarding my setup. I have poky + meta-qt5 + meta-oe + meta-ruby layers in
bblayers.conf.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a11496d667497a10530813fbf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote">---------- Forwarded messag=
e ----------<br>From: <b class=3D"gmail_sendername">sujith h</b> <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&g=
t;</span><br>Date: Thu, Apr 14, 2016 at 2:53 PM<br>Subject: [yocto][meta-qt=
5] How to increase depth of qemuarm from bootargs?<br>To: &quot;<a href=3D"=
mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a>&quot; &lt;<a href=
=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a>&gt;<br>Cc: <a=
 href=3D"mailto:Noor_Ahsan@mentor.com">Noor_Ahsan@mentor.com</a><br><br><br=
><div dir=3D"ltr"><div><div>Hi all,<br><br></div>I am trying to build Qt5 f=
rom meta-qt5 ( master branch ) with poky( machine is qemuarm). The qtbase i=
s built successfully and is installed into core-image-sato. When I run : ru=
nqemu qemuarm<br></div><div>I can see the matchbox window launched successf=
ully.The qtbase is having gles2 enabled in the PACKAGECONFIG and gl is remo=
ved from PACKAGECONFIG. In mesa I have enabled gallium. I do see a problem =
when I try to run qtbase opengl examples.The gui gets displayed. But the im=
age(s) associated with it never displays. For example lets say there is an =
example known as cube. When I try to run cube ( with -platform xcb), I coul=
d see a black screen. The cube image never comes. So my query is if it&#39;=
s possible to increase the depth ( default used is 16 for qemuarm ) to 24 t=
hrough bootargs? If so a helping hand would be great. Let me know if more i=
nformation is required regarding my setup. I have poky + meta-qt5 + meta-oe=
 + meta-ruby layers in bblayers.conf.<br><br></div><div>Thanks,<br></div><d=
iv>Sujith H<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span=
></div><span class=3D"HOEnZb"><font color=3D"#888888"><div><div><div><br>--=
 <br><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributo=
r to KDE project<br></div><div>&lt;Project&gt;Contributor to Yocto project<=
br></div><div><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" targe=
t=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt=
; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujithh.info</a>=
<br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div></div></font></span></div>
</div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=
=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=
=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE projec=
t<br></div><div>&lt;Project&gt;Contributor to Yocto project<br></div><div><=
a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"ht=
tp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br></div><div>=
C-x C-c<br></div></div></div></div></div>
</div>

--001a11496d667497a10530813fbf--
