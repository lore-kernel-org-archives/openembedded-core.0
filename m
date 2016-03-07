Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9F777731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 17:42:25 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g203so139449193iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H8RY8GA+DF6usIOKF7LH8tq8Qocfj0xbDiHaevWw0BI=;
	b=SrWNQY1XlRLqXpOo+mc7wgizr/cneMLVSwjReZy2PArxRCwj0vv2Dlu0NEOQoDe/6T
	csosiVE1PlhO7mrHV+Oxe9pg6N9MxvQOOFqrWklBua3aXCJeVvvhRgnTovt6aGZwFDbr
	Xq4j/bP8ER9DelzAo9fbjH1oyshP+rWogi3H/U/JI1SYDvsAzWAMU5QAUhGRdzld2OT4
	4GYWBWEt4Y9mWiKm6+l5Iq37t3ueeDiEHEEXwpv36wrASmC4wB9NuYzUfRMnIIViQraq
	XYD1SNUyEWr/Ev2Nw3+zsrSyCIzy345UUcggz8IGyGWjUNUJUbdJfGG1YIg9fRTNsBO1
	eF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H8RY8GA+DF6usIOKF7LH8tq8Qocfj0xbDiHaevWw0BI=;
	b=mqxfQ6Zg0qAzJMWrXEnjfmWNZFBEyZusS+xHNu9O9hjI6i2T9hKfDyTyjiw0irTRIm
	pPiA18x+h5M9xdXx5qBV259qH0x4Fc+xCzHPefTGwPOfrADzQiHnLeI3CUWoqLL1v9Lv
	SRa65QAMavCmL+N4+9dj2B2CiUZ8YKEDUwZvNCMWgaGyJiBBhebbEsQqXW+GduABncQE
	RPypov08n4247BLTnZd4UDNHy8OjgIucpMHB9skIjFtNWAOauooBweg7oIpCsaeXHHFw
	6CTlXosc663G16Jk1bCZWVs9iglnucNsop7JJI9vManJfzmOxgtSHjgfI39DN9KMA2cD
	J/Kw==
X-Gm-Message-State: AD7BkJJfhs0Za+uFreeJdaO/UUbsCwDmEyw7VMj4TKy/R/P6itys+FB3Opz63CQZ+fj7L1ziKXNhWi/YjXswuw6V
X-Received: by 10.107.6.32 with SMTP id 32mr6916120iog.99.1457372546658; Mon,
	07 Mar 2016 09:42:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 09:42:07 -0800 (PST)
In-Reply-To: <00c1152b43055381d462cd6d1bc0bb3de5a96246.1456824801.git.dengke.du@windriver.com>
References: <cover.1456824801.git.dengke.du@windriver.com>
	<00c1152b43055381d462cd6d1bc0bb3de5a96246.1456824801.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 17:42:07 +0000
Message-ID: <CAJTo0Lb63PvcfukJ6rybaJKJDGn+=1aaUZZC1EU8M7TceA5nSg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pTest-tcl fail fixed
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
X-List-Received-Date: Mon, 07 Mar 2016 17:42:28 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5cf30c52052d78fce6

--001a113fbf5cf30c52052d78fce6
Content-Type: text/plain; charset=UTF-8

On 1 March 2016 at 09:37, Dengke Du <dengke.du@windriver.com> wrote:

> http.test httpold.test socket.test failed when run the pTest-tcl,because
> the tcl script "info hostname" in /usr/lib/tcl/ptest/tests/http.test on
> target fail. When run the "info hostname" get the hostname,but it can find
> the IP in the /etc/hosts, so it failed. We need to add the IP and hostname
> pair in the /etc/hosts. In order to add the IP and hostname pair in the
> /etc/hosts, we need to add the pair when the target start, so I add the
> "echo "127.0.0.1 `cat /etc/hostname`" >> /etc/hosts" to the hostname.sh in
> "meta/recipes-core/initscripts/initscripts-1.0/", when the system invoke
> the hostname.sh in "/etc/init.d/", it add the IP and hostname pair in the
> /etc/hosts.
>

First, the shortlog should accurately reflect the change.  You haven't
fixed a ptest-tcl failure, you've added a missing host entry in /etc/hosts
which had the side-effect of fixing a failure in tcl-ptest.

So what you've done is add a call to write "127.0.0.1   <hostname>" to
/etc/hosts on boot.  On every boot.  Every time that script runs a new
entry will be written to /etc/hosts.  If the hostname changes then hosts
will contain incorrect entries.  If / is read-only then this operation will
fail.

Instead netbase should write the hostname entry at build time so the rootfs
is correct when it is created, fixing the problem at source and ensuring it
works with read-only rootfs.  The problem you've now got to solve is
getting the hostname from the base-files recipe, so clearly the hostname
needs to be promoted to distro-level variable.

Ross

--001a113fbf5cf30c52052d78fce6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2016 at 09:37, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto=
:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vu" class=3D"=
a3s" style=3D"overflow:hidden">http.test httpold.test socket.test failed wh=
en run the pTest-tcl,because<br>
the tcl script &quot;info hostname&quot; in /usr/lib/tcl/ptest/tests/http.t=
est on<br>
target fail. When run the &quot;info hostname&quot; get the hostname,but it=
 can find<br>
the IP in the /etc/hosts, so it failed. We need to add the IP and hostname<=
br>
pair in the /etc/hosts. In order to add the IP and hostname pair in the<br>
/etc/hosts, we need to add the pair when the target start, so I add the<br>
&quot;echo &quot;127.0.0.1 `cat /etc/hostname`&quot; &gt;&gt; /etc/hosts&qu=
ot; to the hostname.sh in<br>
&quot;meta/recipes-core/initscripts/initscripts-1.0/&quot;, when the system=
 invoke<br>
the hostname.sh in &quot;/etc/init.d/&quot;, it add the IP and hostname pai=
r in the<br>
/etc/hosts.</div></blockquote></div><br>First, the shortlog should accurate=
ly reflect the change.=C2=A0 You haven&#39;t fixed a ptest-tcl failure, you=
&#39;ve added a missing host entry in /etc/hosts which had the side-effect =
of fixing a failure in tcl-ptest.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">So what you&#39;ve done is add a call to write =
&quot;127.0.0.1 =C2=A0 &lt;hostname&gt;&quot; to /etc/hosts on boot.=C2=A0 =
On every boot.=C2=A0 Every time that script runs a new entry will be writte=
n to /etc/hosts.=C2=A0 If the hostname changes then hosts will contain inco=
rrect entries.=C2=A0 If / is read-only then this operation will fail.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Instead net=
base should write the hostname entry at build time so the rootfs is correct=
 when it is created, fixing the problem at source and ensuring it works wit=
h read-only rootfs.=C2=A0 The problem you&#39;ve now got to solve is gettin=
g the hostname from the base-files recipe, so clearly the hostname needs to=
 be promoted to distro-level variable.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a113fbf5cf30c52052d78fce6--
