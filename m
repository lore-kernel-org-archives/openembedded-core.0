Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 237D46FF7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 10:23:29 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id t184so139513091qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ApusevE1fOwag7XvUwwNgUqi8WUpqgGXIEkmdLtR+Pw=;
	b=ZksPjSx9YRKnXyxZxP1j/Ol6nko8SA3d9pds5mTLgpkymT2aecxARCDKrNZG7fCKmU
	5/Hzr6ehJ2OsHJ7nVeWmo7k6W79DEolaO7mUKdeH6mywOMu4veLitk4VnIc4b3qdxaVv
	zB6wgu8CoAOWKBpabu2usnQzD0MomjW+PQBDZ7O6oMcRIzGOAaE4qHyOcuELhSuoYkxe
	FcFKDM/G25YJH8m36Qboo6RNUmd28wo+4lIhDfPbCCPJRkuIwte7ZNIycYmaM8VOyCgO
	tbaoOUA0sLxOtQPgqpLmPGx7rjV8UFK+Y0Wf4+YA1Tl751+WGPwkBUtHOjSQj7hxxh/H
	gnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ApusevE1fOwag7XvUwwNgUqi8WUpqgGXIEkmdLtR+Pw=;
	b=kKm9pHk9cUeiUnTIro4lPbtOKQwITMzP/u2+5SXOQbUjJPrlJ08TX6tB0fKrqLbULp
	VnXw0gPoSXI7EwN6xp2cOMAeDay+kOzKDhrcGmq8iQd6h0sLKKrUO1nLZAhA3/7nL/Ry
	MLtDJo/e0pl1yFPS8k32QGPuc5qIl8XK034xIlSDBJl/LlwIujK7XTrgFP0zYUj/vvOz
	MmcFl9ProZVvJU3ciJ3PO7uJXyzM8UEq8uMRAi3Fnj31o2/SRdUYngvoMKMxIXYYi9Vf
	/rc1SQNQF/Gk8qx3cIY6ZqBI38if2A62G3tdwlWrULJj42DBGPUK4xFQjvX7R2MgJ842
	e1mQ==
X-Gm-Message-State: AIkVDXJQni+4B426k+TijgS69iw1jnhPBVMZJP8EQ54BaFI/09fcs5jmcy+QlaxGSEotLilUSGE2LbTJxJFpLMjq
X-Received: by 10.55.97.75 with SMTP id v72mr12770830qkb.80.1482488611133;
	Fri, 23 Dec 2016 02:23:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Fri, 23 Dec 2016 02:23:00 -0800 (PST)
In-Reply-To: <81c86de3aa3411f52e74b41b324c0713b347f245.1482415485.git.bruce.ashfield@windriver.com>
References: <cover.1482415485.git.bruce.ashfield@windriver.com>
	<81c86de3aa3411f52e74b41b324c0713b347f245.1482415485.git.bruce.ashfield@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 23 Dec 2016 12:23:00 +0200
Message-ID: <CAHiDW_E+G1JAEODj3w6Xda4CJkjHGOnBB0h035p093ZGP7WTqA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-libc-headers: introduce 4.9 headers
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
X-List-Received-Date: Fri, 23 Dec 2016 10:23:30 -0000
Content-Type: multipart/alternative; boundary=001a114808fa0d0541054450c7b9

--001a114808fa0d0541054450c7b9
Content-Type: text/plain; charset=UTF-8

On 22 December 2016 at 16:49, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
>
> Bumping the linux-libc-headers to the 4.9 kernel variant. Since 4.9
> will be a LTSI kernel, and there will be an associated linux-yocto
> it is worth moving to these headers sooner rather than later.
>
> This commit also drops the 4.8 headers and sets 4.9 to be the default.

The autobuilder run (ross/mut 1dc1894e05) with this had a couple of issues:

*** ppp fails to build on musl:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10853

*** ncurses fails in several builds, all gnu/stubs.h related:
ncurses was also upgraded in this AB run (CCing Huang Qiyu) but the
failures seem more like libc related...

x32:
|
nightly-x32/build/build/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h:10:27:
fatal error: gnu/stubs-64.h: No such file or directory
|  # include <gnu/stubs-64.h>

arm:
|
nightly-arm/build/build/tmp/sysroots/beaglebone/usr/include/gnu/stubs.h:7:29:
fatal error: gnu/stubs-soft.h: No such file or directory
|  # include <gnu/stubs-soft.h>

multilib:
|
nightly-multilib/build/build/tmp/sysroots/qemumips64/usr/include/gnu/stubs.h:35:33:
fatal error: gnu/stubs-n64_hard.h: No such file or directory
|  # include <gnu/stubs-n64_hard.h>

The full build log links can be found in "nightly 1121" section here:
https://wiki.yoctoproject.org/wiki/BuildLog#nightly_1121_-_ross.2Fmut_1dc1894e05ef0f3aeeefa61ed89613f17bba2e83


Cheers,
  Jussi

--001a114808fa0d0541054450c7b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 22 December 2016 at 16:49, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&g=
t; wrote:<br>&gt;<br>&gt; Bumping the linux-libc-headers to the 4.9 kernel =
variant. Since 4.9<br>&gt; will be a LTSI kernel, and there will be an asso=
ciated linux-yocto<br>&gt; it is worth moving to these headers sooner rathe=
r than later.<br>&gt;<br>&gt; This commit also drops the 4.8 headers and se=
ts 4.9 to be the default.<br><br>The autobuilder run (ross/mut 1dc1894e05) =
with this had a couple of issues:<br><br>*** ppp fails to build on musl: <a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10853">https:/=
/bugzilla.yoctoproject.org/show_bug.cgi?id=3D10853</a><br><br>*** ncurses f=
ails in several builds, all gnu/stubs.h related:<br>ncurses was also upgrad=
ed in this AB run (CCing Huang Qiyu) but the failures seem more like libc r=
elated...<br><br>x32:<br>| nightly-x32/build/build/tmp/sysroots/qemux86-64/=
usr/include/gnu/stubs.h:10:27: fatal error: gnu/stubs-64.h: No such file or=
 directory<br>| =C2=A0# include &lt;gnu/stubs-64.h&gt;<br><br>arm:<br>| nig=
htly-arm/build/build/tmp/sysroots/beaglebone/usr/include/gnu/stubs.h:7:29: =
fatal error: gnu/stubs-soft.h: No such file or directory<br>| =C2=A0# inclu=
de &lt;gnu/stubs-soft.h&gt;<br><br>multilib:<br>| nightly-multilib/build/bu=
ild/tmp/sysroots/qemumips64/usr/include/gnu/stubs.h:35:33: fatal error: gnu=
/stubs-n64_hard.h: No such file or directory<br>| =C2=A0# include &lt;gnu/s=
tubs-n64_hard.h&gt;<br><br>The full build log links can be found in &quot;n=
ightly 1121&quot; section here:<br><a href=3D"https://wiki.yoctoproject.org=
/wiki/BuildLog#nightly_1121_-_ross.2Fmut_1dc1894e05ef0f3aeeefa61ed89613f17b=
ba2e83">https://wiki.yoctoproject.org/wiki/BuildLog#nightly_1121_-_ross.2Fm=
ut_1dc1894e05ef0f3aeeefa61ed89613f17bba2e83</a><br><br><br>Cheers,<br>=C2=
=A0 Jussi</div>

--001a114808fa0d0541054450c7b9--
