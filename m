Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TKOYc-0003et-V7
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 09:12:20 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so2362602pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=jnX5Dw9n0QAyc3m2OipIxZRtIXaUvBo0yM8I/7jSIOs=;
	b=B3OrzdKBPUS65CiKKxY+ol+6YPptMryeaUpeFmnJ9u3k2IcRIwJGtNdld1SyUMg3Qz
	jZC6NEI0ZLbubsNM5gizvocBvivHqE7kemjNLP+lg9OkaX3f6Yh3ssxjwML5m3MQ0Si8
	F3nDMcST+MKIw4E5iWs84nqaUeMieuhnrod9qhNqMsACLlgeEPtNRCWh2JjQetNtyxUl
	dIedVDVKyBBrdQMDQB8VQEmt7EtGqe+Soz+CYDSEeXZXG/4jC3JQ08tgXh5iQubjA0ey
	Y0t5L/NZ98g6LgOqPnyGyedGVtjzhA0MyWDSHNc6XsjIJTqtJXMOsB9f8yUNR6GE1TdQ
	TIGg==
Received: by 10.68.232.131 with SMTP id to3mr37167644pbc.58.1349506754885;
	Fri, 05 Oct 2012 23:59:14 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.112])
	by mx.google.com with ESMTPS id i9sm7253798pav.7.2012.10.05.23.59.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 23:59:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1283)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
Date: Sat, 6 Oct 2012 10:59:07 +0400
Message-Id: <F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1283)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Sat, 06 Oct 2012 07:12:20 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_77E557D7-9818-4E2A-92CC-AEF0C34FC55B"

--Apple-Mail=_77E557D7-9818-4E2A-92CC-AEF0C34FC55B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Khem,

On Aug 25, 2012, at 1:59 AM, Khem Raj wrote:

> On Friday, August 24, 2012, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
> >
> > On Aug 25, 2012, at 1:10 AM, Khem Raj wrote:
> >
> >> On Fri, Aug 24, 2012 at 2:08 PM, Elvis Dowson =
<elvis.dowson@gmail.com> wrote:
> >>>
> >>> I'm adapting my earlier gcc-4.5 recipes, to try and get them to =
build with
> >>> the latest poky master.
> >>>
> >>> I'm using eglibc-2.13, so it is possible for this version to drop =
the
> >>> gcc-cross-intermediate stage, or is it only with newer eglibc =
versions?
> >>>
> >>
> >> well it wont work with anything older than eglibc 2.16
> >
> > What should I do to get the gcc-4.5 recipes to continue to build, =
with eglib-2.13,
> > against the poky master branch? Should I retain the gcc-intermediate =
recipes?
>=20
> Back port some patches I did for eglibc 2.16 and drop intermediate =
recipes

I've back ported the patches you did for eglibc-2.16 for eglibc-2.13, to =
use with my gcc-4.5 recipe, for the PowerPC 440 target. With that patch =
applied, in a local copy of my meta-openembedded/toolchain-layer, =
containing both the eglibc-2.13 and gcc-4.5, recipe,

building against the poky/master commit id works:

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Db0faebd1f07e16=
16004bd19664395932e7c2c48f
gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage

I am able to get to the shell prompt, and get no crashes upto this =
point. The root file system seems to be working fine, and I am able to =
ping the host machine.

It is with the application of the next patch, that I get a an init crash =
on the console, as I have been seeing earlier.=20

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D48df3fe947c4d9=
00aa6b66d9d8352c0d9e59ebe4
eglibc: Fix eglibc-initial and let eglibc depend on it

I've narrowed down the init problem, to the application of the above =
patch, but I'm unable to figure out why it is failing. Any suggestions?

Best regards,

Elvis Dowson



--Apple-Mail=_77E557D7-9818-4E2A-92CC-AEF0C34FC55B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Khem,<div><br><div><div>On Aug 25, 2012, at 1:59 AM, Khem Raj =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite">On Friday, August 24, 2012, Elvis Dowson &lt;<a =
href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt; =
wrote:<br>&gt;<br>&gt; On Aug 25, 2012, at 1:10 AM, Khem Raj =
wrote:<br>&gt;<br>&gt;&gt; On Fri, Aug 24, 2012 at 2:08 PM, Elvis Dowson =
&lt;<a =
href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; I'm adapting my earlier gcc-4.5 recipes, to =
try and get them to build with<br>&gt;&gt;&gt; the latest poky =
master.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; I'm using eglibc-2.13, so it is =
possible for this version to drop the<br>
&gt;&gt;&gt; gcc-cross-intermediate stage, or is it only with newer =
eglibc versions?<br>&gt;&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; well it wont =
work with anything older than eglibc 2.16<br>&gt;<br>&gt; What should I =
do to get the gcc-4.5 recipes to continue to build, with eglib-2.13,<br>
&gt; against the poky master branch? Should I retain the =
gcc-intermediate recipes?<br><br>Back port some patches I did for eglibc =
2.16 and drop intermediate recipes<br></blockquote><br></div><div>I've =
back ported the patches you did for eglibc-2.16 for eglibc-2.13, to use =
with my gcc-4.5 recipe, for the PowerPC 440 target. With that patch =
applied, in a local copy of my meta-openembedded/toolchain-layer, =
containing both the eglibc-2.13 and gcc-4.5, =
recipe,</div></div><div><br></div><div>building against the poky/master =
commit id works:</div><div><br></div><div><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Db0faeb=
d1f07e1616004bd19664395932e7c2c48f">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky/commit/?id=3Db0faebd1f07e1616004bd19664395932e7c2c48f</a></div><d=
iv>gcc-cross: Make gcc-cross-initial as the only intermediate gcc =
stage</div><div><br></div><div>I am able to get to the shell prompt, and =
get no crashes upto this point. The root file system seems to be working =
fine, and I am able to ping the host =
machine.</div><div><br></div><div>It is with the application of the next =
patch, that I get a an init crash on the console, as I have been seeing =
earlier.&nbsp;</div><div><br></div><div><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D48df3f=
e947c4d900aa6b66d9d8352c0d9e59ebe4">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky/commit/?id=3D48df3fe947c4d900aa6b66d9d8352c0d9e59ebe4</a></div><d=
iv><div>eglibc: Fix eglibc-initial and let eglibc depend on =
it</div><div><br></div></div><div>I've narrowed down the init problem, =
to the application of the above patch, but&nbsp;I'm unable to figure out =
why it is failing. Any suggestions?</div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis =
Dowson</div><div><br></div><div><br></div></body></html>=

--Apple-Mail=_77E557D7-9818-4E2A-92CC-AEF0C34FC55B--
