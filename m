Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UclNh-00057Z-Mf
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 01:45:16 +0200
Received: by mail-la0-f41.google.com with SMTP id ee20so1008035lab.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 16:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=5i0B6OQ7XUXftrk7/y5OvD9oL4k79rmPtR7LKiAo/lA=;
	b=nJbqmJt+XjvIEJyUU3usC2BQ252nL1mcM1dd3DIJUuxQU+f1rJjy4YimnSAO3vihgc
	SaGYwYUX7RFODc9aNA1Yh2RsGgywn2xtQcZU2keMuuaZcdr6Wyaw00nxYmWA4Et1qzxw
	PDXxkV6y49r7X7TZvNGR00OlqFX9ZiiWTCM5TO4a//vWsvHaorP1N2Dg93vfMZMG9qbR
	hk8SG2261/G0s3VPdgzj1IT8UO7/qa+aO9ZpZ6cYDq7yzDFoThoJPzr/0QjoQ3TEJi97
	co91d1Wrfv6xrR19EpFN8dxKNwG7FzaYSWTkykHuY1BYshZ/3nsySLaCPcqE7kmenHs2
	l8Mg==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr18521580lbb.26.1368660420252; 
	Wed, 15 May 2013 16:27:00 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 16:27:00 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305151836490.11559@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
	<CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
	<CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
	<CADkTA4MpRM5Vw8iDL6gw9jMZ93Bu3Y6mGwy5JVx69pkkP2F06w@mail.gmail.com>
	<alpine.DEB.2.02.1305151757110.12800@oneiric>
	<CAHUNapTU2he7VM+CrEYv5cwoWdB82nVgLowy8d+_zMCzChNZLw@mail.gmail.com>
	<913F9482-BBBF-4400-8745-3983254A997A@gmail.com>
	<alpine.DEB.2.02.1305151836490.11559@oneiric>
Date: Wed, 15 May 2013 19:27:00 -0400
Message-ID: <CADkTA4Om9b8QWAvNW8Y+1Cyc+bmJad0+p1mAU=TK7XEwCiE6iA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 15 May 2013 23:45:24 -0000
Content-Type: multipart/alternative; boundary=047d7b343d202adc6304dcca16dd

--047d7b343d202adc6304dcca16dd
Content-Type: text/plain; charset=ISO-8859-1

On Wednesday, May 15, 2013, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Wed, 15 May 2013, Khem Raj wrote:
>
>>
>> On May 15, 2013, at 3:33 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> > Does this mean we now have something that can work on the EdgeRouter
Lite?
>>
>> well you have to have a kernel for that platform. If you have
>> working kernel everything else will ditto work
>
>   whoo hoo.  ok, with current oe-core and current
> openembedded-core-contrib with the following patch from bruce:
>
> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> @@ -5,6 +5,7 @@ KBRANCH = "${KBRANCH_DEFAULT}"
>
>  SRCREV_machine_qemuarm ?= "8fb1a478c9a05362e2e4e62fc30f5ef5d6c21f49"
>  SRCREV_machine_qemumips  ?= "b8870f2b11f4c948ae90a19886335fa8b7fca487"
> +SRCREV_machine_qemumips64  ?= "49041e56a3c4ff552bf9f8195809b8040e2e2723"
>  SRCREV_machine_qemuppc ?= "e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4"
>  SRCREV_machine_qemux86 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
>  SRCREV_machine_qemux86-64 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
>
>   i have a qemumips64 build that boots to the command line and accepts
> input and I CAN LOG IN!!!!!!!!!!!!!!!

Thanks for the confirmation everyone. I'll send the real patch later
tonight (I have one other small tweak to add)

Bruce


>
>   awesome. it's martini time.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b343d202adc6304dcca16dd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 15, 2013, Robert P. J. Day &lt;<a href=3D"mailto:=
rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>&gt; On Wed,=
 15 May 2013, Khem Raj wrote:<br>&gt;<br>&gt;&gt;<br>&gt;&gt; On May 15, 20=
13, at 3:33 PM, Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">tw=
oerner@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>&gt;&gt; &gt; Does this mean we now have something that can wor=
k on the EdgeRouter Lite?<br>&gt;&gt;<br>&gt;&gt; well you have to have a k=
ernel for that platform. If you have<br>&gt;&gt; working kernel everything =
else will ditto work<br>
&gt;<br>&gt; =A0 whoo hoo. =A0ok, with current oe-core and current<br>&gt; =
openembedded-core-contrib with the following patch from bruce:<br>&gt;<br>&=
gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.8.bb">l=
inux-yocto_3.8.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.8.bb">=
linux-yocto_3.8.bb</a><br>&gt; @@ -5,6 +5,7 @@ KBRANCH =3D &quot;${KBRANCH_=
DEFAULT}&quot;<br>&gt;<br>&gt; =A0SRCREV_machine_qemuarm ?=3D &quot;8fb1a47=
8c9a05362e2e4e62fc30f5ef5d6c21f49&quot;<br>
&gt; =A0SRCREV_machine_qemumips =A0?=3D &quot;b8870f2b11f4c948ae90a19886335=
fa8b7fca487&quot;<br>&gt; +SRCREV_machine_qemumips64 =A0?=3D &quot;49041e56=
a3c4ff552bf9f8195809b8040e2e2723&quot;<br>&gt; =A0SRCREV_machine_qemuppc ?=
=3D &quot;e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4&quot;<br>
&gt; =A0SRCREV_machine_qemux86 ?=3D &quot;dd089cb5ba37ea14e8f90a884bf2a5be6=
4ed817d&quot;<br>&gt; =A0SRCREV_machine_qemux86-64 ?=3D &quot;dd089cb5ba37e=
a14e8f90a884bf2a5be64ed817d&quot;<br>&gt;<br>&gt; =A0 i have a qemumips64 b=
uild that boots to the command line and accepts<br>
&gt; input and I CAN LOG IN!!!!!!!!!!!!!!!<br><br>Thanks for the confirmati=
on everyone. I&#39;ll send the real patch later tonight (I have one other s=
mall tweak to add)<br><br>Bruce <br><br><br>&gt;<br>&gt; =A0 awesome. it&#3=
9;s martini time.<br>
&gt;<br>&gt; rday<br>&gt;<br>&gt; --<br>&gt;<br>&gt; =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; Robert P. J. Day =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Ottawa, Ontario=
, CANADA<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D=
"http://crashcourse.ca">http://crashcourse.ca</a><br>
&gt;<br>&gt; Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday">http://twitte=
r.com/rpjday</a><br>&gt; LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 <a href=3D"http://ca.linkedin.com/in/rpjday">http://ca.=
linkedin.com/in/rpjday</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>&gt;<br><br>-- <br>&quot;Thou shalt not follow the NULL pointer, for chaos=
 and madness await thee at its end&quot;<br>

--047d7b343d202adc6304dcca16dd--
