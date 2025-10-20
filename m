Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDEDCCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 13:20:17 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.18482.1760966300530734705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 06:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jOcon8Kv;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: dani.barra25@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so1433791e0c.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760966299; x=1761571099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0RnHHZPiKcIV8JuAQxJ3GvtTtSe3HN/EiNo5aOmYoU=;
        b=jOcon8KvHXz3gOEPNWuVWL/rMtCghF8YgR64RPRJDe6Dd+LaRVyph1lCgVWNN75HoT
         0aJ63u++4r+ARBjN0yGev2PznK1n8IAyJynLC/bRXvvx90jS88i9UFE/CO2qWf1ulUKZ
         qoGEFldOt+AujGeW5QFp73EUInJkYYExPlt0kyRicUuiROEM/WMrrwGMZ8O93X9IRXnO
         UyjNGcmBOYxdrw1L7FY2A+p+0YiBZEIOWe/MNMUu3afanKpvP5392Gg0zOuwib1RpdRq
         4aBgyLCMk1HwU+9Y8QYGUZ7TiP4wZvloQc4WkqTn8T7j3hOhicKM53W1u84tjaMhMy4l
         FqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966299; x=1761571099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0RnHHZPiKcIV8JuAQxJ3GvtTtSe3HN/EiNo5aOmYoU=;
        b=M4w3goA/iK8dfh0vhh/ksPBL738XHTtoRUcdXG4mYu0iwdt5TO94+Y1THala7CfnRc
         kL63Yu1MOsXqauGXixzYDySN+RSjM2Uarow3s8OZE7q45jV3+YITyLWYRlHh1Iy6FoXX
         ei5y7Ea+FUgWuo/Om/RHmiHW8XRJGNqtEly28yEJ192hxOlheR9ydt1ZiokNtTUE74el
         tHjT1WABhpt9g+RHQm9c0GWwcEDnalVuJeftPAMtELlD3ncUgdaHbZMiCGiOXp9+4JEF
         85grFI6VHe/I8JV7kOOsYsjwt/Jcz90IAVJvugXh4tow8hFAzdwf5HFzpuMZUrsPUeEH
         Cmiw==
X-Gm-Message-State: AOJu0YzaDFz5DOzfzrSfu4Fl47DbCyUqqQVocWVIFBoG5vy4m9gkAKXL
	XHWYEc7Bj9u6UkkpcswTe3SYWa32jftcq7oDjK574BYx+TEsl3grHE39dXplSulSl3QxqtpyRba
	qdsgp3K9rknHx8lPZQltHag/HMgcnYZU=
X-Gm-Gg: ASbGncv1V/8I2rr92mSrv/5ioIuxwITtdpb7VDNTV8XMMXBIRomCKkwkYbkIBTvTVju
	8Os1sti75niLRy/pv7F3KETvfHNMDOuANnqhgU9omxf4Ne0PkdxW2knV0lEtl1hJ0zKfQMPIZmT
	GKbQbmI0L/iASBAhrq4S33/KPnugCmcL7yVthkhiIEVLRKX/qit+vq/p3PEkU14yku3cu1Oz/p2
	t9yk5Qn4k0JQTRe27+j6QRz/Tuw3cYKLnjz0RvOPUZVroL4Mf2BdmSb/g4B65JaqAieGxE=
X-Google-Smtp-Source: AGHT+IGEF2xsTtfJcz7A3qgnAuSRFq/87K4Ra+jmHcCUszt8E/CInXcmudis6FsLCP7kcoimq265/OTrha+icMQvYRg=
X-Received: by 2002:a05:6122:88f:b0:541:2e11:674c with SMTP id
 71dfb90a1353d-5564ef3db19mr3624469e0c.12.1760966299331; Mon, 20 Oct 2025
 06:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com> <20251019153922.27208-1-dani.barra25@gmail.com>
 <20251019153922.27208-2-dani.barra25@gmail.com> <CANNYZj_MZwiUEYPJ2XpMeKpKPm0rDMNguDn+7RnW10H3Z=xuxQ@mail.gmail.com>
In-Reply-To: <CANNYZj_MZwiUEYPJ2XpMeKpKPm0rDMNguDn+7RnW10H3Z=xuxQ@mail.gmail.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Mon, 20 Oct 2025 14:18:08 +0100
X-Gm-Features: AS18NWAcolQ1yivUfle7IfbktBYS1xXOuMA-_bYeLkRCtvrOUPoWz7tuqyjsyM8
Message-ID: <CA+-=zY1vUR2VL1AyTyhNKYei_i0VcfWBfhW0jvAnxRQrQv1iFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fstab xattrs: This update ensures that fstab xattrs are correctly updated without adding a lock to the database.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bbb17a064196ead8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 13:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225118

--000000000000bbb17a064196ead8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,
Yes I can. Maybe I am doing something wrong since the patch is an
alternative to past threads but somehow it gets separated without context.

Starting from the beginning.
My original patch aimed to fix a simple thing. No matter what fstype you
were using, no xattrs from the build process were assigned to /etc/fstab if
you had multiple partitions. And this was particularly problematic when you
have read-only rootfs like squashfs and you need to have all the metadata
available during build, like the SELinux file labels, since they cannot be
set during boot time.
This is because it creates a temp folder and then creates a new fstab that
is later replaced in the image.

The replacement is made via 2 options:
1. If it was ext* or msdos, it will fall under specific methods for those
types that will open the already built image and remove the fstab and
writing the new one, losing all the metadata of that file.
2. It falls under the "install" cmd of rootfs.py and this one was being
executed inside the pseudo environment. This means the original entry of
fstab on files db is completely replace with this new file and all the
xattrs are gone

To avoid this, my first patch removed the debugfs specifics of ext* and
msdos, since those did not leveragy any "write only content" mechanism
without replacing the actual file. Then, all the fstab modifications would
lie under rootfs.py
which seemed to be the common point for everything. On this I simply
replaced "install" with "cp" since I only wanted to modify the contents.
https://lists.openembedded.org/g/openembedded-core/topic/115043355
Later in the discussion, Mathieu correctly pointed out that it could not be
used because it fails a test due to the usage of copyhardlinktree() for
this temporary rootfs folder. This meant that I was not only modifying the
temporary fstab, but also the original one,
leading to a crash of wic.Wic.test_no_fstab_update.
https://lists.openembedded.org/g/openembedded-core/topic/115043356

The second approach I took was looking at how pseudo behaved. This time, I
decided to maintain the original install cmd, but instead of running it
under fakeroot, I ran it on the host system. This meant that, if a later
check of the db occurred, it would correctly detect
an inode change on fstab and therefore it could fix it using the -B option.
And that is what I did :
https://lists.openembedded.org/g/openembedded-core/topic/115805391

I only neglected the fact that, in reality, other tests could have failed
because of this. And, in fact, it happened. Because of this, tests
regarding including and excluding paths were failing because the db was
locked.
That's when I reached the current patch alternative.
I knew it could cause problems but honestly I never considered it would and
when I run wic tests, I didn't see any failure. In reality, I was trying to
replicate what was being done a few lines above with the options -B -m and
-M. The difference
is that pseudo doesn't have a flag to repair a single file, therefore this
was the only solution found.

A good alternative to this would be pseudo actually having a functionality
to repair single file inodes, avoiding to completely check the whole
database and therefore better management on this side.
In the end this bug rendered all my images that enforced SELinux with read
only rootfs (squashfs) useless and I'd assume I might not be the only one
with this issue.

Another thing I notice is that, for repeatability purposes, there are
multiple variables being used to timestamp files. This is just a
recommendation/question. Shouldn't all those variable timestamps be aligned
also?

In any case, if you have some other idea on how to approach this, let me
know!

Daniel

Alexander Kanavin <alex.kanavin@gmail.com> escreveu (segunda, 20/10/2025
=C3=A0(s) 13:09):

> On Sun, 19 Oct 2025 at 23:45, dani.barra25 via lists.openembedded.org
> <dani.barra25=3Dgmail.com@lists.openembedded.org> wrote:
>
> > +                    pseudo_prefix =3D cls.__get_pseudo(native_sysroot,
> new_rootfs, new_pseudo)
> > +
> > +                    # Shutdown any existing pseudo server
> > +                    # This ensures no other processes are using the
> database
> > +                    shutdown_cmd =3D "%s -S" % pseudo_prefix
> > +                    exec_native_cmd(shutdown_cmd, native_sysroot)
> > +
> > +                    # Database is not locked anymore
> > +                    # Repairs inodes related to fstab. This way xattrs
> and metadata is correctly applied to the new file
> > +                    repair_cmd =3D "%s -B" % pseudo_prefix
> > +                    exec_native_cmd(repair_cmd, native_sysroot)
> > +
>
> Is it possible to describe how to reproduce and observe the issue that
> this patch aims to fix? This snippet makes me *very* nervous as pseudo
> is used by mulitple bitbake tasks in parallel, and doing shutdowns and
> repairs in the middle of it can blow up spectacularly.
>
> Alex
>

--000000000000bbb17a064196ead8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Alex,<div>Yes I can. Maybe I am doing something wron=
g since the patch is an alternative to past threads but somehow it gets sep=
arated without context.</div><div><br></div><div>Starting from the beginnin=
g.</div><div>My original patch aimed to fix a simple thing. No matter what =
fstype you were using, no xattrs from the build process were assigned to /e=
tc/fstab if you had multiple partitions. And this was particularly problema=
tic when you</div><div>have read-only rootfs like squashfs and you need to =
have all the metadata available during build, like the SELinux file labels,=
 since they cannot be set during boot time.</div><div>This is because it cr=
eates a temp folder and then creates a new fstab that is later replaced in =
the image.</div><div><br></div><div>The replacement is made via 2 options:<=
br>1. If it was ext* or msdos, it will fall under specific methods for thos=
e types that will open the already built image and remove the fstab and wri=
ting the new one, losing all the metadata of that file.</div><div>2. It fal=
ls under the &quot;install&quot; cmd of rootfs.py and this one was being ex=
ecuted inside the pseudo environment. This means the original entry of fsta=
b on files db is completely replace with this new file and all the xattrs a=
re gone</div><div><br></div><div>To avoid this, my first patch removed the =
debugfs specifics of ext* and msdos, since those did not leveragy any &quot=
;write only content&quot; mechanism without replacing the actual file. Then=
, all the fstab modifications would lie under rootfs.py</div><div>which see=
med to be the common point for everything. On this I simply replaced &quot;=
install&quot; with &quot;cp&quot; since I only wanted to modify the content=
s.=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic=
/115043355">https://lists.openembedded.org/g/openembedded-core/topic/115043=
355</a><br>Later in the discussion, Mathieu correctly pointed out that it c=
ould not be used because it fails a test due to the usage of copyhardlinktr=
ee() for this temporary rootfs folder. This meant that I was not only modif=
ying the temporary fstab, but also the original one,</div><div>leading to a=
 crash of wic.Wic.test_no_fstab_update.=C2=A0<a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/topic/115043356">https://lists.openembedded=
.org/g/openembedded-core/topic/115043356</a></div><div><br></div><div>The s=
econd approach I took was looking at how pseudo behaved. This time, I decid=
ed to maintain the original install cmd, but instead of running it under fa=
keroot, I ran it on the host system. This meant that, if a later check of t=
he db occurred, it would correctly detect</div><div>an inode change on fsta=
b and therefore it could fix it using the -B option. And that is what I did=
 :=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic=
/115805391">https://lists.openembedded.org/g/openembedded-core/topic/115805=
391</a></div><div><br></div><div>I only neglected the fact that, in reality=
, other tests could have failed because of this. And, in fact, it happened.=
 Because of this, tests regarding including and excluding paths were failin=
g because the db was locked.</div><div>That&#39;s when I reached the curren=
t patch alternative.=C2=A0=C2=A0</div><div>I knew it could cause problems b=
ut honestly I never considered it would and when I run wic tests, I didn&#3=
9;t=C2=A0see any failure. In reality, I was trying to replicate what was be=
ing done a few lines above with the options -B -m and -M. The difference</d=
iv><div>is that pseudo doesn&#39;t have a flag to repair a single file, the=
refore this was the only solution found.</div><div><br></div><div>A good al=
ternative to this would be pseudo actually having a functionality to repair=
 single file inodes, avoiding to completely check the whole database and th=
erefore better management on this side.</div><div>In the end this bug rende=
red all my images that enforced SELinux with read only rootfs (squashfs) us=
eless and I&#39;d assume I might not be the only one with this issue.</div>=
<div><br></div><div>Another thing I notice is that, for repeatability=C2=A0=
purposes, there are multiple variables being used to timestamp files. This =
is just a recommendation/question. Shouldn&#39;t all those variable timesta=
mps be aligned also?</div><div><br></div><div>In any case, if you have some=
 other idea on how to approach this, let me know!</div><div><br></div><div>=
Daniel</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu (segunda, 20=
/10/2025 =C3=A0(s) 13:09):<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, 19 Oct 2025 at 23:45, dani.barra25 via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&lt;dani.barra25=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pseudo_prefix =3D cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # Shutdown any existing pseudo server<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # This ensures no other processes are using the database<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 shutdown_cmd =3D &quot;%s -S&quot; % pseudo_prefix<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 exec_native_cmd(shutdown_cmd, native_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # Database is not locked anymore<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # Repairs inodes related to fstab. This way xattrs and metadata is correct=
ly applied to the new file<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 repair_cmd =3D &quot;%s -B&quot; % pseudo_prefix<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 exec_native_cmd(repair_cmd, native_sysroot)<br>
&gt; +<br>
<br>
Is it possible to describe how to reproduce and observe the issue that<br>
this patch aims to fix? This snippet makes me *very* nervous as pseudo<br>
is used by mulitple bitbake tasks in parallel, and doing shutdowns and<br>
repairs in the middle of it can blow up spectacularly.<br>
<br>
Alex<br>
</blockquote></div>

--000000000000bbb17a064196ead8--

