Return-Path: <avery.brian@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6606011F;
	Mon,  5 Dec 2016 18:04:11 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id 51so356406492uai.1;
	Mon, 05 Dec 2016 10:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=EeneTqGnhWRVntsIIionFAh4cnnCV7GnVvYU6Z6dNVg=;
	b=BtblVGCrlWFxdJX3uMPy4wYRuvU5t/RjsbJzTgSL6ChJc5bxkMIzR959h8Cx0B8AWT
	QBF+67ACUvNAg+BPL/01QOBKkm2yTG9yoJGSUKXwkbZrX+iWQmkDvcKl62zA69P2EXX3
	08Rm05gxO0dhVDlfqpyVRW9s+THT+QhbHkwf0uvz3sYyH0jXNrIv0l54ZQmO4y+typAH
	WbM4XNrYgVaW+VMro/gayI2ExK53gV4NPAcaECSHm48ywQGCP8rE/ZRMB7F4ch5qc7Gc
	LlGIWvnLP1H6k98A3uAldmuWm83bnTmcxZshM+KGcdCuapT7N7QxKuKGlEjoHeTJ4g1T
	CWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EeneTqGnhWRVntsIIionFAh4cnnCV7GnVvYU6Z6dNVg=;
	b=HqTHIH494eFK7/l+EjLwWqZSz4YwKKl/Sllcm85nnNB4so/52suXCer05eruq+AWKd
	qed+ulXH74iAazfGnoXSEa7dEJcORVCc/ctmwHpUNoFyJPXqZXpSfJp6vlGBQf2LR0wM
	OhHG8rIzSzI8Ld+tG7UZyoSJIIh8Fio8U15CrYRTbLKVI+sCnFx3WPLJsY0QTkDcUjMw
	kyU21vdLRWXoly04vpAJ12dJyzSAyOVRP8dyzwZATE2hFTOJ/td0C5vetb93BlkQrw1h
	ZGgu6OqmxTtZgZPP8cb29uzP0kwBrIZUMcnl5gNtJN8hhVbK+8XjdKzYmcYTY+bVKgN9
	/ubA==
X-Gm-Message-State: AKaTC03RzXs7E49wWT2Xih86sqR3E81N9LjkznBKtMcnJ45TOrVZs+iPwV/kHU3aWqnnbzZ/ZhT9n96j8wEEqQ==
X-Received: by 10.159.33.193 with SMTP id 59mr43931608uac.28.1480961052560;
	Mon, 05 Dec 2016 10:04:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.60.199 with HTTP; Mon, 5 Dec 2016 10:04:12 -0800 (PST)
From: Brian Avery <avery.brian@gmail.com>
Date: Mon, 5 Dec 2016 10:04:12 -0800
Message-ID: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
To: openembedded-architecture@lists.openembedded.org, yocto@yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Subject: RFC BuildAppliance future
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
X-List-Received-Date: Mon, 05 Dec 2016 18:04:12 -0000
Content-Type: multipart/alternative; boundary=001a113ad4e276d1920542ed1d49

--001a113ad4e276d1920542ed1d49
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

  Please note, this is going out to 3 lists in an attempt to insure that no
one who would be impacted by this change misses it. Implied spam apology
included.

  The Yocto Project currently provides a virtual machine image called the
Build Appliance (
https://downloads.yoctoproject.org/releases/yocto/yocto-2.2/build-appliance=
/).
This image can be run using either VirtualBox or VMware. It enables you to
build and boot a custom embedded Linux image with the Yocto Project on a
non-Linux development system.  It is not intended for day to day
development use, but instead, is intended to allow users to =E2=80=9Ctry ou=
t=E2=80=9D the
tools even if they do not have access to a Linux system.

  We are considering replacing the VM based Build Appliance with a set of
containers (https://hub.docker.com/r/crops/poky/, or if you want a user
interface (https://hub.docker.com/r/crops/toaster-master/ ).  These
containers currently provide most of the functionality of the Build
Appliance and should shortly be at feature parity with the Build
Appliance.  We are actively adding to and supporting the containers as some
of our developers are using them in their day to day development in order
to benefit from the host isolation and ease with which other distributions
can be tested.

  This is an RFC to see what features in the Build Appliance are important
to you but would not be provided by the container solutions.  If the
community would be just as content using the container approach as using
the VM based Build Appliance image, then we=E2=80=99d be better off depreca=
ting the
Build Appliance and applying those resources elsewhere.  If there are
important features the Build Appliance provides which the container
solution does not, or cannot provide, we=E2=80=99d love to hear what they a=
re!

Thanks in advance for any feedback,

-Brian

an Intel Employee

--001a113ad4e276d1920542ed1d49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
















<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">=C2=A0 Please note, this is=
 going out to 3 lists in an attempt to
insure that no one who would be impacted by this change misses it. Implied =
spam apology included.<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">=C2=A0 The Yocto Project cu=
rrently provides a virtual machine image
called the Build Appliance (<a href=3D"https://downloads.yoctoproject.org/r=
eleases/yocto/yocto-2.2/build-appliance/"><span style=3D"color:rgb(16,60,19=
2)">https://downloads.yoctoproject.org/releases/yocto/yocto-2.2/build-appli=
ance/</span></a>).
This image can be run using either VirtualBox or VMware. It enables you to
build and boot a custom embedded Linux image with the Yocto Project on a
non-Linux development system.=C2=A0 It is not
intended for day to day development use, but instead, is intended to allow
users to =E2=80=9Ctry out=E2=80=9D the tools even if they do not have acces=
s to a Linux system.<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">=C2=A0 We are considering
replacing the VM based Build Appliance with a set of containers (<a href=3D=
"https://hub.docker.com/r/crops/poky/"><span style=3D"color:rgb(16,60,192)"=
>https://hub.docker.com/r/crops/poky/</span></a>,
or if you want a user interface (<a href=3D"https://hub.docker.com/r/crops/=
toaster-master/"><span style=3D"color:rgb(16,60,192)">https://hub.docker.co=
m/r/crops/toaster-master/</span></a>
).=C2=A0 These containers currently provide
most of the functionality of the Build Appliance and should shortly be at
feature parity with the Build Appliance.=C2=A0
We are actively adding to and supporting the containers as some of our
developers are using them in their day to day development in order to benef=
it
from the host isolation and ease with which other distributions can be
tested.=C2=A0 <span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">=C2=A0 This is an RFC to se=
e what features in the Build Appliance are
important to you but would not be provided by the container solutions.=C2=
=A0 If the community would be just as content
using the container approach as using the VM based Build Appliance image, t=
hen
we=E2=80=99d be better off deprecating the Build Appliance and applying tho=
se resources
elsewhere.=C2=A0 If there are important
features the Build Appliance provides which the container solution does not=
, or cannot provide, we=E2=80=99d love to hear
what they are! <span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">=E2=80=A8Thanks in advance =
for any feedback,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:12.8pt"><span style=3D"font-s=
ize:13pt;font-family:arial;color:rgb(26,26,26)">-Brian<span></span></span><=
/p>

<p class=3D"MsoNormal">an Intel Employee<span></span></p>

</div>

--001a113ad4e276d1920542ed1d49--
