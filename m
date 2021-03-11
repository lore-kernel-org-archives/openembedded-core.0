Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.1156.1615421889629168452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 16:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u3aQOv6E;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id h10so148328edt.13
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 16:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtHf7Bu0lj5MYInR7oDNJDC30owu3W90bbn+KmankCQ=;
        b=u3aQOv6ElSUs2A7OvJL0W5SydwIlyUP9Qxf7YlIEK130vl71GF5fYJcLn1jsYima/V
         PLIDdLdMwaeGC7jxbQEp2mx8rYg3THWIX4cQ0p/aahkxwN85TVt4c9XD137IDfeA/NSj
         D0UhkpSNjOa8YswRtlaV7rvOE4oILeHwfAFI6MRdO4vwYxB6mGsQ+zfXb4nt84liXBKB
         y1+1RKfbDvMvraZiTuUtBwzf26KXqmymLysT/kkL4Nqasmu8ePMjPVBBpqHgBQNUmcRI
         vlq1DHwetpE4+0JVhANLBBAmlUWuXHkLrYV3G20orLl3Kl6YzuOqqPdJ+0w1wqap7dXZ
         wiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtHf7Bu0lj5MYInR7oDNJDC30owu3W90bbn+KmankCQ=;
        b=FHe/w8Xu+51Hd1J7QfATlQphP07yDdOmNVLtbvGdiI+e1Pm4Oo3XSAee/hlmkKyUrP
         kmhWNV1cYQdHMiJGtElCDKqgsvxnmV64/r0mriWuH8fYs9GRYp5UHzfdQDDpvaE26WM5
         UslQ2QALU8zu4d1Zfm4SAMEc0ZTR1P/iGxRsCbmUu/ZvJEY2XoHIhdE2dVfi9ZlirYp5
         w5yets/DCpUXbgja1tdyXVtplm1pwznEExy/LVmithYYg6IqKlah0eXo3T+qlBQVgcsC
         E8UBkOKT+d7KKtrMB2z7AT83L+9BYbtQdJOVsZI9GdJ9siU3vn/2vGMkHfmWXo8qm64y
         RYOQ==
X-Gm-Message-State: AOAM533liX+zunvhDe9hZgggBQKj4pgekE23JTX3sJYqt+FTkIrm9iM2
	q9zP/j/Rm8Pfua5VyzU90z6uUbrjupiZoPsbjto=
X-Google-Smtp-Source: ABdhPJx+0Fij9hQIidjFP6DH5NIoaL7+J4WfiOgGs6DZSULqBTGDNI+FXR/jBr8Z/r3dkBa+R4IyLoQwEKI78K/+NrU=
X-Received: by 2002:aa7:cf95:: with SMTP id z21mr5843206edx.76.1615421888065;
 Wed, 10 Mar 2021 16:18:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615334832.git.steve@sakoman.com> <20210310113442.bowxtz5ckz7kfkij@jama>
 <a5654f84a58994708704c7e48c60975466caee0c.camel@linuxfoundation.org>
In-Reply-To: <a5654f84a58994708704c7e48c60975466caee0c.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 01:17:56 +0100
Message-ID: <CA+chaQdFYd2Vgez67F2KsYse=jjx=u4rJwvud0h4EZeEW3KAKg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/27] Pull request (cover letter only)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ccf46805bd37b79b"

--000000000000ccf46805bd37b79b
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 1:01 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-03-10 at 12:34 +0100, Martin Jansa wrote:
> > On Tue, Mar 09, 2021 at 02:09:38PM -1000, Steve Sakoman wrote:
> > > The following changes since commit
> dd893279f352e290c23577a0f91df1b8c6232f10:
> > >
> > >   selftest/reproducible: Don't call sync between each file compare
> (2021-03-04 04:19:50 -1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-next
> > >
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > >
> > > Martin Jansa (1):
> > >   sstatesig.py: show an error instead of warning when sstate manifest
> > >     isn't found
> >
> > FYI: now when this was backported to gatesgarth and dunfell I've found
> > one case where it triggers this error:
> >
> >
> http://jenkins.nas-admin.org/job/LuneOS/view/testing/job/luneos-testing_mako/735/console
> > ERROR: android-kernel-bootimg-1.0-r0 do_package: Manifest
> >
> /home/jenkins/workspace/luneos-testing/webos-ports/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-initramfs-android-image.packagedata
> > not found in mako cortexa8t2hf-neon-halium cortexa8t2hf-neon
> > cortexa8t2hf-vfp cortexa8hf-neon cortexa8hf-vfp armv7at2hf-neon
> > armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp
> > armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp allarch
> > x86_64_x86_64-nativesdk (variant '')?
> >
> > The error looks strange as it probably shouldn't be looking for
> > nativesdk- manifest and it doesn't happen with master.
>
> I don't know why that would happen but nativesdk is a red-herring, the
> code
> just iterates a list of possibilities and nativesdk is the last on the
> list so
> the error would normally show nativesdk if it didn't find anything. That
> is why
> it lists the possibilities.
>

Yes, I've realized the same when looking into it, then next strange thing
is that th initramfs-android-image recipe is an image (inherits core-image)
and android-kernel-bootimg depends on it only because it depends on
virtual/kernel.do_deploy which in turn depends on
initrafs-andriod-image.do_image_complete.

As discussed on IRC I was able to reproduce it in local build with
hardknott and wasn't able to reproduce it in local build with gatesgarth
(so it's not something already fixed in hardknott I thought before).

Inheritting nopackages worked for me in:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=5ee66b49ef8ab0e2df386c862a09c15629cfa1a0
but that might just hide the underlying issue, will continue debugging this
case tomorrow.

Maybe people will report more corner cases like this now when it's not just
a warning.

--000000000000ccf46805bd37b79b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 11, 2021 at 1:01 AM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2021-03-10 at 12:=
34 +0100, Martin Jansa wrote:<br>
&gt; On Tue, Mar 09, 2021 at 02:09:38PM -1000, Steve Sakoman wrote:<br>
&gt; &gt; The following changes since commit dd893279f352e290c23577a0f91df1=
b8c6232f10:<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0selftest/reproducible: Don&#39;t call sync between ea=
ch file compare (2021-03-04 04:19:50 -1000)<br>
&gt; &gt; <br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0git://<a href=3D"http://git.openembedded.org/openembe=
dded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.or=
g/openembedded-core-contrib</a> stable/dunfell-next<br>
&gt; &gt; =C2=A0=C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-=
core-contrib/log/?h=3Dstable/dunfell-next" rel=3D"noreferrer" target=3D"_bl=
ank">http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/dunfell-next</a><br>
&gt; &gt; <br>
&gt; &gt; Martin Jansa (1):<br>
&gt; &gt; =C2=A0=C2=A0sstatesig.py: show an error instead of warning when s=
state manifest<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0isn&#39;t found<br>
&gt; <br>
&gt; FYI: now when this was backported to gatesgarth and dunfell I&#39;ve f=
ound<br>
&gt; one case where it triggers this error:<br>
&gt; <br>
&gt; <a href=3D"http://jenkins.nas-admin.org/job/LuneOS/view/testing/job/lu=
neos-testing_mako/735/console" rel=3D"noreferrer" target=3D"_blank">http://=
jenkins.nas-admin.org/job/LuneOS/view/testing/job/luneos-testing_mako/735/c=
onsole</a><br>
&gt; ERROR: android-kernel-bootimg-1.0-r0 do_package: Manifest<br>
&gt; /home/jenkins/workspace/luneos-testing/webos-ports/tmp-glibc/sstate-co=
ntrol/manifest-x86_64_x86_64-nativesdk-initramfs-android-image.packagedata<=
br>
&gt; not found in mako cortexa8t2hf-neon-halium cortexa8t2hf-neon<br>
&gt; cortexa8t2hf-vfp cortexa8hf-neon cortexa8hf-vfp armv7at2hf-neon<br>
&gt; armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp<br>
&gt; armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp allarch<br>
&gt; x86_64_x86_64-nativesdk (variant &#39;&#39;)?<br>
&gt; <br>
&gt; The error looks strange as it probably shouldn&#39;t be looking for<br=
>
&gt; nativesdk- manifest and it doesn&#39;t happen with master.<br>
<br>
I don&#39;t know why that would happen but nativesdk is a red-herring, the =
code=C2=A0<br>
just iterates a list of possibilities and nativesdk is the last on the list=
 so<br>
the error would normally show nativesdk if it didn&#39;t find anything. Tha=
t is why<br>
it lists the possibilities.<br></blockquote><div><br></div><div>Yes, I&#39;=
ve realized the same when looking into it, then next strange thing is that =
th initramfs-android-image recipe is an image (inherits core-image) and and=
roid-kernel-bootimg depends on it only because it depends on virtual/kernel=
.do_deploy which in turn depends on initrafs-andriod-image.do_image_complet=
e.</div><div><br></div><div>As discussed on IRC I was able to reproduce it =
in local build with hardknott and wasn&#39;t able to reproduce it in local =
build with gatesgarth (so it&#39;s not something already fixed in hardknott=
 I thought before).</div><div><br></div><div>Inheritting nopackages worked =
for me in:</div><div><a href=3D"https://git.openembedded.org/openembedded-c=
ore-contrib/commit/?h=3Djansa/master&amp;id=3D5ee66b49ef8ab0e2df386c862a09c=
15629cfa1a0">https://git.openembedded.org/openembedded-core-contrib/commit/=
?h=3Djansa/master&amp;id=3D5ee66b49ef8ab0e2df386c862a09c15629cfa1a0</a> but=
 that might just hide the underlying issue, will continue debugging this ca=
se tomorrow.</div><div><br></div><div>Maybe people will report more corner =
cases like this now when it&#39;s not just a warning.</div></div></div>

--000000000000ccf46805bd37b79b--
