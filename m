Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.19970.1601152804325327026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 13:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=U3lhEuPY;
 spf=pass (domain: emacinc.com, ip: 209.85.210.53, mailfrom: mgloff@emacinc.com)
Received: by mail-ot1-f53.google.com with SMTP id s66so5763296otb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uzQvvhO+IvH1lZabpGYBrXdL9+bkLWJZ6RWc7Himrvo=;
        b=U3lhEuPYVvYWfmBieS4djkOWnWEBfMQt6wMlVg4ZfhsAUWetNPNEGPJm8KfyVDNtAf
         Y36rTe73fIlkEjt7o2FNIj6rAln3/Mx/yCkyt0ml+yIoKptRUm+W2IqUiC2LIT9haR96
         VY4/2xXKAkBNWc41HLM+KLDk9jofw8wxgcGuPWWL5z35kQN8cBbsP5OYkrFJ5pi/97Fd
         YCUerbD3y49XiNu8prrLFo8h7NA4JqSEyrSvo+kKMbuRf5/06lZ7DUQceEw4mzekZWtX
         ovkHO67f1jeWya3x8tZF92ELR8gDv2O0osWUcsTjrmgm5cboSlgrA/KiBMi7mqX30U9Q
         36lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzQvvhO+IvH1lZabpGYBrXdL9+bkLWJZ6RWc7Himrvo=;
        b=cjlyjm6Wu35y8LsNuRLem0dSeam77VTUIuhm6ikFVTQud6UBKAl1sbXatg6+solDgQ
         MSrD0ffGeSSWTC1KEB0KfsEjEaF6YDBX2F6XixvR/nsAQO/hD90Idr2xUabRsv/QW9Ij
         wC6BLZIz1lvVZ+Llq0F7NQlQG03JiwDkzEDTFyA8aEV+oLbAhMRpT7Oit+4MHYh1eC4t
         a5XoGAWDSSSBx2Fhqh+9/kNAk9ZbOjtApdDE08ONH8CElLeH/o66he031owWTE7eYy7K
         KlmRZF4C4fVjRTr91E+98M43Ikt6guvlUVgobjY6tNN8fZYPj0lsOwiyu765sYKpbErY
         twpw==
X-Gm-Message-State: AOAM530tLc1Elim9aNXQ+BqjAw8tkYrrxzSvhY7YF4G3EetVgsXyzX4b
	X20PELr4rP9UQJTeuoS578DspMdg9SZeVqjqXM76vA==
X-Google-Smtp-Source: ABdhPJwTGuzMd3a+oMta+f5TmYjbi/0j06al9sNaoLkIgokjt3rtXGnXfYX7n1F1T1uvb1oad7WBdEhTa9kWNDKnO/s=
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr4436617otp.339.1601152803599;
 Sat, 26 Sep 2020 13:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200829030901.488431-1-mgloff@emacinc.com> <27286.1601119672816825649@lists.openembedded.org>
 <414449f1-4bfc-87b2-a73f-952d362f54fb@windriver.com>
In-Reply-To: <414449f1-4bfc-87b2-a73f-952d362f54fb@windriver.com>
From: "Michael Gloff" <mgloff@emacinc.com>
Date: Sat, 26 Sep 2020 15:39:27 -0500
Message-ID: <CALXw4G6POmK=MUP2xks+xTC+MitGf2gV+_K3dfPwv7kKxunHYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: mihai.lindner@gmail.com, 
	OE Core <openembedded-core@lists.openembedded.org>, 
	"steve@sakoman.com" <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000017080b05b03d707f"

--00000000000017080b05b03d707f
Content-Type: text/plain; charset="UTF-8"

I was meaning to send the backport request as well. This is a long standing
bug and rc hasn't changed in quite some time, so the patch should apply
cleanly to dunfell.
Should I send the patch for dunfell, or can
c19c69ae8ddcb37ad5683b6962ec3def37ad4512 be cherry-picked?

Michael

On Sat, Sep 26, 2020 at 12:26 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Add Steve, who maintains dunfell.
>
> On 2020-09-26 7:27 a.m., mihai.lindner@gmail.com wrote:
> > Please backport this to dunfell.
>
> Hi Mihai,
>
> Steve might do that but it would be better if you
> could cherry-pick it back, test it, and send a patch:
>    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> Thanks,
>
> ../Randy
>
> >
> > Thanks,
> > Mihai
> >
> > On Sat, Aug 29, 2020 at 06:09 AM, Michael Gloff wrote:
> >
> >>
> >> psplash expects the fifo to be in /run or specified
> >> by PSPLASH_FIFO_DIR. This patch allows psplash to
> >> quit normally. Also, fix the work around of using
> >> echo directly into the fifo and use psplash-write.
> >>
> >> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> >> ---
> >>   meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
> >>   1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc
> >> b/meta/recipes-core/sysvinit/sysvinit/rc
> >> index 7ca41ae1ae..fd1fdd26ba 100755
> >> --- a/meta/recipes-core/sysvinit/sysvinit/rc
> >> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
> >> @@ -26,11 +26,8 @@ startup_progress() {
> >>           progress=$progress_size
> >>       fi
> >>       #echo "PROGRESS is $progress $runlevel $first_step + ($step of
> >> $num_steps) $step_change $progress_size"
> >> -    #if type psplash-write >/dev/null 2>&1; then
> >> -    #    TMPDIR=/mnt/.psplash psplash-write "PROGRESS $progress" ||
> true
> >> -    #fi
> >> -    if [ -e /mnt/.psplash/psplash_fifo ]; then
> >> -        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
> >> +    if type psplash-write >/dev/null 2>&1; then
> >> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS
> $progress" ||
> >> true
> >>       fi
> >>   }
> >>
> >> @@ -176,7 +173,7 @@ startup() {
> >>   #Uncomment to cause psplash to exit manually, otherwise it exits when
> it sees
> >> a VC switch
> >>   if [ "x$runlevel" != "xS" ] && [ ! -x
> /etc/rc${runlevel}.d/S??xserver-nodm ];
> >> then
> >>       if type psplash-write >/dev/null 2>&1; then
> >> -        TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
> >> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
> >>              umount -l /mnt/.psplash
> >>       fi
> >>   fi
> >> --
> >> 2.28.0
> >>
> >>
> >>
> >>
> >>
> >>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> 
>
>

--00000000000017080b05b03d707f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was meaning to send the backport request as well. T=
his is a long standing bug and rc hasn&#39;t changed in quite some time, so=
 the patch should apply cleanly to dunfell. <br></div><div>Should I send th=
e patch for dunfell, or can c19c69ae8ddcb37ad5683b6962ec3def37ad4512 be che=
rry-picked?</div><div><br></div><div>Michael<br> </div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 26, 202=
0 at 12:26 PM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.c=
om">randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Add Steve, who maintains dunfell.<br>
<br>
On 2020-09-26 7:27 a.m., <a href=3D"mailto:mihai.lindner@gmail.com" target=
=
=3D"_blank">mihai.lindner@gmail.com</a> wrote:<br>
&gt; Please backport this to dunfell.<br>
<br>
Hi Mihai,<br>
<br>
Steve might do that but it would be better if you<br>
could cherry-pick it back, test it, and send a patch:<br>
=C2=A0 =C2=A0<a href=3D"http://www.openembedded.org/wiki/How_to_submit_a_p=
atch_to_OpenEmbedded" rel=3D"noreferrer" target=3D"_blank">http://www.opene=
mbedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a><br>
<br>
Thanks,<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Mihai<br>
&gt; <br>
&gt; On Sat, Aug 29, 2020 at 06:09 AM, Michael Gloff wrote:<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; psplash expects the fifo to be in /run or specified<br>
&gt;&gt; by PSPLASH_FIFO_DIR. This patch allows psplash to<br>
&gt;&gt; quit normally. Also, fix the work around of using<br>
&gt;&gt; echo directly into the fifo and use psplash-write.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc=
.com" target=3D"_blank">mgloff@emacinc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------<=
br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/sysvinit/sysvinit/rc<br>
&gt;&gt; b/meta/recipes-core/sysvinit/sysvinit/rc<br>
&gt;&gt; index 7ca41ae1ae..fd1fdd26ba 100755<br>
&gt;&gt; --- a/meta/recipes-core/sysvinit/sysvinit/rc<br>
&gt;&gt; +++ b/meta/recipes-core/sysvinit/sysvinit/rc<br>
&gt;&gt; @@ -26,11 +26,8 @@ startup_progress() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0progress=3D$progress_size=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#echo &quot;PROGRESS is $progress $runl=
evel $first_step + ($step of<br>
&gt;&gt; $num_steps) $step_change $progress_size&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 #if type psplash-write &gt;/dev/null 2&gt;&amp;1; =
then<br>
&gt;&gt; -=C2=A0 =C2=A0 #=C2=A0 =C2=A0 TMPDIR=3D/mnt/.psplash psplash-writ=
e &quot;PROGRESS $progress&quot; || true<br>
&gt;&gt; -=C2=A0 =C2=A0 #fi<br>
&gt;&gt; -=C2=A0 =C2=A0 if [ -e /mnt/.psplash/psplash_fifo ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PROGRESS $progress&quot; =
&gt; /mnt/.psplash/psplash_fifo<br>
&gt;&gt; +=C2=A0 =C2=A0 if type psplash-write &gt;/dev/null 2&gt;&amp;1; t=
hen<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PSPLASH_FIFO_DIR=3D/mnt/.psplash psp=
lash-write &quot;PROGRESS $progress&quot; ||<br>
&gt;&gt; true<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; @@ -176,7 +173,7 @@ startup() {<br>
&gt;&gt;=C2=A0 =C2=A0#Uncomment to cause psplash to exit manually, otherwi=
se it exits when it sees<br>
&gt;&gt; a VC switch<br>
&gt;&gt;=C2=A0 =C2=A0if [ &quot;x$runlevel&quot; !=3D &quot;xS&quot; ] &am=
p;&amp; [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ];<br>
&gt;&gt; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if type psplash-write &gt;/dev/null 2&g=
t;&amp;1; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TMPDIR=3D/mnt/.psplash psplash-write=
 &quot;QUIT&quot; || true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PSPLASH_FIFO_DIR=3D/mnt/.psplash psp=
lash-write &quot;QUIT&quot; || true<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 umount -l /mnt/.p=
splash<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0fi<br>
&gt;&gt; -- <br>
&gt;&gt; 2.28.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000017080b05b03d707f--
