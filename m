Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8A16C766A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 01:10:47 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f105so55323060qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=VbnvQyIDcrlaNq2ZHLaTBgYjDzQ28T+cBE58FSXc8pI=;
	b=tY15ZfHhvChxkQdk8Ecu4ee47YCzljdDEQ8OrVPTt7MK0uhN2rIpYB8OJvxHwV6cdd
	p15kxF8P8LWmtCF6BJsYTn2NZLnxhxVJND/OpWCybWB45iCX1QDqdVoQEeMCctI0VouM
	vKVP0eGIT4d7DqSov2FbZF7YMQbPK4OGu3HcXeEw5pqUGOIrBp/M3EVI55Cg7Hus/iLB
	5RyrXjqnmj3nG0lsvB101HH70f76zw7Kwwo0wFbALjgSP8uwO7sxBalJMRoqbyr868gU
	1Vjj2+/mzFAM/oBsa9svOICc7wcrFypwDuOwDGNdnsS1K8f7MiUO4uC/62xIAY9z5vP/
	HU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=VbnvQyIDcrlaNq2ZHLaTBgYjDzQ28T+cBE58FSXc8pI=;
	b=agyNHEC3+iyY2tRdAeG+N783fjw5kv0NZ1KlYEnOG5dBXnuvplypFv3OYC4eHVmQ4D
	v1bRFQqQA9Vtb6aob8xMT7XCRpxkU+2rl3/KDaQ6jIftIQJ2Ky4jdnXpzvi1SezEOEpk
	tuVZOXdMlmmXSKiMD7fqF1qnzZmrb46haakahr/3njWl3IUEPu0Krmj98hAiah8qC8pv
	kEG4r8XZ2LAzfnj+qIMymP0vi3VrRLv8l8tDRQECvfzK266M9taAE/z2vF5mDaGdUIWo
	MOS8+l2cZcGyFEbfVZIF5ZCoZSIZcH+Hr/qLai1ZjjjQw/gBKLe+LTFME+GofD8yVyyP
	guJw==
X-Gm-Message-State: AD7BkJItDLwLCRuXiM281B5nwUhENrR+6P1u/MRblPgUYoWuzcR1ongc2xmmdGWSsXyJHaZ/Dfx68xN8nOubCg==
MIME-Version: 1.0
X-Received: by 10.141.4.69 with SMTP id g66mr8541056qhd.31.1460077847804; Thu,
	07 Apr 2016 18:10:47 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 18:10:46 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 18:10:46 -0700 (PDT)
In-Reply-To: <5706F15A.3080205@opendreambox.org>
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
	<57069A2A.4040901@opendreambox.org>
	<EAFEA49B-06C0-446C-80F0-0B300EFFB863@gmail.com>
	<5706F15A.3080205@opendreambox.org>
Date: Thu, 7 Apr 2016 18:10:46 -0700
Message-ID: <CAMKF1sqhKWWDBdzZ9gU_J8SWhNiBNXxw3oi6tuzyhbOrUQ4iSw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Fri, 08 Apr 2016 01:10:47 -0000
Content-Type: multipart/alternative; boundary=001a11396a2c7680c1052feedd04

--001a11396a2c7680c1052feedd04
Content-Type: text/plain; charset=UTF-8

On Apr 7, 2016 4:46 PM, "Andreas Oberritter" <obi@opendreambox.org> wrote:
>
> On 07.04.2016 21:01, Khem Raj wrote:
> >
> >> On Apr 7, 2016, at 10:34 AM, Andreas Oberritter <obi@opendreambox.org>
wrote:
> >>
> >> Hi Khem,
> >>
> >> On 07.04.2016 09:02, Khem Raj wrote:
> >>> echo would fail if /sys is not mounted and boot would abort
> >>
> >> are you sure about the dependency between echo and sysfs? It seems
quite
> >> unlikely to me. I'd guess the real problem is mdev failing to start
> >> without syses.
> >
> > real problem was missing mounting sysfs on /sys, but I wanted to keep
the other
> > way of setting it instead of echo
>
> Note that I was referring to your commit message.
>
> After a second look I see that you also mount /proc in your patch, and I
> guess that's what you meant to describe. Please update the commit
> message (and subject) to actually match your patch.

Whata not clear in patch subject
>
> Regards,
> Andreas
>
>
> >
> >>
> >> Regards,
> >> Andreas
> >>
> >>
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>> meta/recipes-core/busybox/files/mdev | 4 +++-
> >>> 1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-core/busybox/files/mdev
b/meta/recipes-core/busybox/files/mdev
> >>> index 9625247..8c9c06e 100755
> >>> --- a/meta/recipes-core/busybox/files/mdev
> >>> +++ b/meta/recipes-core/busybox/files/mdev
> >>> @@ -1,10 +1,12 @@
> >>> #!/bin/sh
> >>> -
> >>> +mount -t proc proc /proc
> >>> +mount -t sysfs sysfs /sys
> >>> mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
> >>> mkdir /dev/pts /dev/shm
> >>> chmod 777 /dev/shm
> >>> mount -t devpts devpts /dev/pts
> >>> touch /dev/mdev.seq
> >>> +#sysctl -w kernel.hotplug=/sbin/mdev
> >>> echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> >>> mdev -s
> >>>
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a11396a2c7680c1052feedd04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 7, 2016 4:46 PM, &quot;Andreas Oberritter&quot; &lt;<a href=3D"mailt=
o:obi@opendreambox.org">obi@opendreambox.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 07.04.2016 21:01, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Apr 7, 2016, at 10:34 AM, Andreas Oberritter &lt;<a href=
=3D"mailto:obi@opendreambox.org">obi@opendreambox.org</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Khem,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 07.04.2016 09:02, Khem Raj wrote:<br>
&gt; &gt;&gt;&gt; echo would fail if /sys is not mounted and boot would abo=
rt<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; are you sure about the dependency between echo and sysfs? It =
seems quite<br>
&gt; &gt;&gt; unlikely to me. I&#39;d guess the real problem is mdev failin=
g to start<br>
&gt; &gt;&gt; without syses.<br>
&gt; &gt;<br>
&gt; &gt; real problem was missing mounting sysfs on /sys, but I wanted to =
keep the other<br>
&gt; &gt; way of setting it instead of echo<br>
&gt;<br>
&gt; Note that I was referring to your commit message.<br>
&gt;<br>
&gt; After a second look I see that you also mount /proc in your patch, and=
 I<br>
&gt; guess that&#39;s what you meant to describe. Please update the commit<=
br>
&gt; message (and subject) to actually match your patch.</p>
<p dir=3D"ltr">Whata not clear in patch subject<br>
&gt;<br>
&gt; Regards,<br>
&gt; Andreas<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Regards,<br>
&gt; &gt;&gt; Andreas<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt; meta/recipes-core/busybox/files/mdev | 4 +++-<br>
&gt; &gt;&gt;&gt; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta/recipes-core/busybox/files/mdev b/meta/=
recipes-core/busybox/files/mdev<br>
&gt; &gt;&gt;&gt; index 9625247..8c9c06e 100755<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-core/busybox/files/mdev<br>
&gt; &gt;&gt;&gt; +++ b/meta/recipes-core/busybox/files/mdev<br>
&gt; &gt;&gt;&gt; @@ -1,10 +1,12 @@<br>
&gt; &gt;&gt;&gt; #!/bin/sh<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; +mount -t proc proc /proc<br>
&gt; &gt;&gt;&gt; +mount -t sysfs sysfs /sys<br>
&gt; &gt;&gt;&gt; mount -t tmpfs tmpfs /dev=C2=A0 -o size=3D64k,mode=3D0755=
<br>
&gt; &gt;&gt;&gt; mkdir /dev/pts /dev/shm<br>
&gt; &gt;&gt;&gt; chmod 777 /dev/shm<br>
&gt; &gt;&gt;&gt; mount -t devpts devpts /dev/pts<br>
&gt; &gt;&gt;&gt; touch /dev/mdev.seq<br>
&gt; &gt;&gt;&gt; +#sysctl -w kernel.hotplug=3D/sbin/mdev<br>
&gt; &gt;&gt;&gt; echo &quot;/sbin/mdev&quot; &gt; /proc/sys/kernel/hotplug=
<br>
&gt; &gt;&gt;&gt; mdev -s<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded=
-core</a><br>
&gt; &gt;<br>
&gt;<br>
</p>

--001a11396a2c7680c1052feedd04--
