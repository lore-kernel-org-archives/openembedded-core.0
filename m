Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 503E777FC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 12:31:57 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o85so5773832qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=foFJZBzYNchAXdrukn8eFWQD/wnP/5koEHtjb8qYCVM=;
	b=ScY3pPGM7h9YDwRR9ZV//kyHkQ0aM+huruiWrB0ZCa2gek2t9hdfC1aX3x+uTBVjS6
	yfDJfCwh01eaHGk4FYwqvuaH4rbIigj/PJl0M55EnteqAOLYXljj2t4Sn0tQbZGrJrQl
	Md1IOV2TgO3m8C8RI/JUw7hb0jTsvmNP18hBKv4CSs6XyJlnAEajUZ5nm90kwm4e/03c
	EKqhTnRtyRQwp2+ppiIygGLTtAUD0I6y7bt2SQyL0gsPjqBT5d33MF0H8rPvdeKuqE2a
	4sf35G4jYuq2tQtLEqA1LPT6T3D4fzzNtuajKBe6Agfa+a5uzutvVVmqz9XfuZdlgdsS
	EWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=foFJZBzYNchAXdrukn8eFWQD/wnP/5koEHtjb8qYCVM=;
	b=iRgohmeN/ygwVFfPwE1s2lMjWWay95+oe20TlA9MtgBh2ixzQrWpnwbgCdvJ+Oifbc
	kpsYdpdmiAoXn00DvjEUU/0gcz3qnTOd55UnM++q9+CuO78C6dApFd9LcRNeojRTGMqO
	RfN66pL8qCHXxV1ZsBU+gg5apCjEXb3C/PrhAfOKPrtgBMN+E6NzaHML8uNvqtI23zmb
	teEc4uKgXcq1xNPA5GDOD7uAdtAhrfwiCZ49rpt5ti0C92V90HhnacQzLBICISzhm9h6
	vMv4qBkvRzqOh8j+C3fjDC3ICE01k91CpA++09XLy0BiPTBw19qY0YmtOiIUnFzWDM3Z
	O03w==
X-Gm-Message-State: AODbwcAESMIkqnXwf4stg9xyj0SRHn8qNM9CdYJ7XM/ekfvciGIR1rjb
	v4sA4s4B460TY8Pxs/CtFcQ2rlVXRg==
X-Received: by 10.55.83.70 with SMTP id h67mr3309083qkb.287.1495110719211;
	Thu, 18 May 2017 05:31:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Thu, 18 May 2017 05:31:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZKMitURrfEBJCOf5qjy8WqFooEcVsQKQ==1W5MECKyvw@mail.gmail.com>
References: <cover.1494851172.git.bruce.ashfield@windriver.com>
	<d65b6c616f45f14b2c49ce8a2f860ad45def3df2.1494851172.git.bruce.ashfield@windriver.com>
	<CAJTo0LZKMitURrfEBJCOf5qjy8WqFooEcVsQKQ==1W5MECKyvw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 May 2017 08:31:57 -0400
Message-ID: <CADkTA4MAp7DZKyHYY+N_H4uz8z3-f6EEm6AY+6kVacHa1SRBLw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-yocto/4.1: fix gcc7 compilation
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
X-List-Received-Date: Thu, 18 May 2017 12:31:58 -0000
Content-Type: multipart/alternative; boundary="001a114e7170518df5054fcb9739"

--001a114e7170518df5054fcb9739
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 7:47 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 15 May 2017 at 13:51, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
> > Porting the mainline commit, to fix gcc7 builds:
> >
> >   474c90156c [give up on gcc ilog2() constant optimizations]
>
> Sorry but:
>
> ERROR: linux-yocto-4.1.38+gitAUTOINC+a867edab41_3b0fd24797-r0
> do_kernel_version_sanity_check: Package Version
> (4.1.38+gitAUTOINC+a867edab41_3b0fd24797) does not match of kernel being
> built (4.1.39). Please update the PV variable to match the kernel source or
> set KERNEL_VERSION_SANITY_SKIP="1" in your recipe.
>
>
Well bugger, I did that patch and then a -stable updated, decided to squash
them and then
blew away the version number bump.

I sent that as part of a queue, did you want the queue again, or just that
gcc7 patch resent as
a v2 of it ?

Bruce


> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114e7170518df5054fcb9739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 18, 2017 at 7:47 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><span class=3D""><br>On 15 May 2017 at 13:51, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt; wrote:<br>&gt; Porting the mainline commit, to fix gcc=
7 builds:<br>&gt;<br>&gt; =C2=A0 474c90156c [give up on gcc ilog2() constan=
t optimizations]<br><br></span>Sorry but:<div><br>ERROR: linux-yocto-4.1.38=
+gitAUTOINC+<wbr>a867edab41_3b0fd24797-r0 do_kernel_version_sanity_<wbr>che=
ck: Package Version (4.1.38+gitAUTOINC+a867edab41_<wbr>3b0fd24797) does not=
 match of kernel being built (4.1.39). Please update the PV variable to mat=
ch the kernel source or set KERNEL_VERSION_SANITY_SKIP=3D&quot;1&quot; in y=
our recipe.<span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div></=
font></span></div></div></blockquote><div><br></div><div>Well bugger, I did=
 that patch and then a -stable updated, decided to squash them and then</di=
v><div>blew away the version number bump.</div><div><br></div><div>I sent t=
hat as part of a queue, did you want the queue again, or just that gcc7 pat=
ch resent as</div><div>a v2 of it ?</div><div><br></div><div>Bruce</div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><spa=
n class=3D"HOEnZb"><font color=3D"#888888"><div></div><div>Ross</div></font=
></span></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a114e7170518df5054fcb9739--
