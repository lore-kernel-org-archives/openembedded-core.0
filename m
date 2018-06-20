Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 99F62751D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 12:39:33 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id z207-v6so4713045lff.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0btrp6YfB6DH2eWw7tbMWeleU5Em+w8MEabDcCCo6a4=;
	b=BCS0TIYVttdPAjxyL7HwOlXCVsvB3HKvtAHTUGEjAOzpmKRuFG7l5x8es8XhJLiwZw
	Zi7fsplqKPzRfyLqpeyuier5GU0sd1lfinBXaBBdlXin0Qq0/WoR22G2FLJcWZFoaZ+1
	BVkWNQj3HaS3/F10mp8hFqulcywAkepyjVOEwKCCDhlDK9jY7Qhd/zcNxUt7x90EFlBP
	R9Zq6u8WQRsyG+sCITmwuIldu+gYVUWA5psMNucKf3wRIzL1NzKH+Xs1GrtZcN3kT1Yq
	adNtLdWXus2s2H+JQN4Cqii4mHc4Krm6tsGoQHHTRLA9UTxt2j/QB5lg6OHM/5kYwJZ7
	G5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0btrp6YfB6DH2eWw7tbMWeleU5Em+w8MEabDcCCo6a4=;
	b=Sgghcuw7EOCLSIpGQhrwVGnfIr2djIDhQ9i05O+l/uTWZOxk/Uhwd5BQahUtpE/ZX1
	zdCWkxIFak7dW48d+NaWp8E7B1gJcCYJlypNYeGAhk6Hxg3jZsELp/tPvPAVQsEr9CL9
	NC9bjXTZ0ovUnD6Zt7CK8o2JNzZ9u7y7imgjz17sj/+1Qb+vTtHk9tsc5yN/x17A9Sfh
	B1/YxzK9h62OYsYwj1M1H2jHYnncQ9JbhXDWotXXTPurjEZou6L7D+DPEP5D8HhGBB3e
	0vBP6dOZfifeRvRwyAjwBXwcbBuv4NOc8+PAb0wb4Z0VwyXrH74dybKivhBE5xP9MDhX
	VpLg==
X-Gm-Message-State: APt69E3Md7A+1tqIJzvPOiR3neCdiKyxAkAyMeZirJMrS2GIjOuGF7e9
	2Bny96BkO+uVolmnLK7kuysZ+tnZN7oRIskFuHo=
X-Google-Smtp-Source: ADUXVKKSz+AzqQhhTGojiu3JqSbYerYAwycbnieNuIG8TcxYrXRotbVqhydod2MCDq/GMgNSqNccPpUirsxUeYigMdo=
X-Received: by 2002:a2e:585:: with SMTP id
	127-v6mr13719865ljf.28.1529498374052; 
	Wed, 20 Jun 2018 05:39:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 05:39:33
	-0700 (PDT)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD0170F9E983@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1526668676-26167-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9E983@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Jun 2018 08:39:33 -0400
Message-ID: <CADkTA4PaYLT=zT3Py-S2kY=1Yon8HkubyXTmcghgzQH2W-6Qdw@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>,
	Ross Burton <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: To fix build error when enable mutilib on aarch64 Big endian.
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
X-List-Received-Date: Wed, 20 Jun 2018 12:39:34 -0000
Content-Type: multipart/alternative; boundary="000000000000451d0f056f121767"

--000000000000451d0f056f121767
Content-Type: text/plain; charset="UTF-8"

I can grab this for my queue, and send it along with my next consolidated
pull request.
That way, I can give it some extra testing.

Cheers,

Bruce

On Wed, Jun 20, 2018 at 3:12 AM, Lei, Maohui <leimaohui@cn.fujitsu.com>
wrote:

> Ping
>
> > -----Original Message-----
> > From: Lei, Maohui
> > Sent: Saturday, May 19, 2018 2:38 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Lei, Maohui
> > Subject: [OE-core][PATCH] linux-libc-headers: To fix build error when
> enable
> > mutilib on aarch64 Big endian.
> >
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers.inc
> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > index 9903c06..b5cf96d 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > @@ -77,6 +77,10 @@ do_install_append_arm () {
> >       do_install_armmultilib
> >  }
> >
> > +do_install_append_armeb () {
> > +     do_install_armmultilib
> > +}
> > +
> >  do_install_armmultilib () {
> >       oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h
> > asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h
> > asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
> >       oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h
> > asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h
> asm/swab.h
> > asm/types.h asm/unistd.h
> > --
> > 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000451d0f056f121767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can grab this for my queue, and send it along with my ne=
xt consolidated pull request.=C2=A0<div>That way, I can give it some extra =
testing.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce<br=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 20, =
2018 at 3:12 AM, Lei, Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimao=
hui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"im HOEnZb">Ping<=
br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Lei, Maohui<br>
&gt; Sent: Saturday, May 19, 2018 2:38 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Lei, Maohui<br>
&gt; Subject: [OE-core][PATCH] linux-libc-headers: To fix build error when =
enable<br>
&gt; mutilib on aarch64 Big endian.<br>
&gt; <br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt; Signed-off-by: Lei Maoh=
ui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu.com=
</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>head=
ers.inc | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<w=
br>headers.inc<br>
&gt; b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers.=
inc<br>
&gt; index 9903c06..b5cf96d 100644<br>
&gt; --- a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>head=
ers.inc<br>
&gt; +++ b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>head=
ers.inc<br>
&gt; @@ -77,6 +77,10 @@ do_install_append_arm () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_install_armmultilib<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +do_install_append_armeb () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0do_install_armmultilib<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 do_install_armmultilib () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header asm/auxvec.h asm/bitsperl=
ong.h asm/byteorder.h<br>
&gt; asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman=
.h<br>
&gt; asm/param.h asm/perf_regs.h asm/bpf_perf_event.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header asm/posix_types.h asm/ptr=
ace.h=C2=A0 asm/setup.h<br>
&gt; asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h=C2=A0 asm/statf=
s.h asm/swab.h<br>
&gt; asm/types.h asm/unistd.h<br>
&gt; --<br>
&gt; 1.9.1<br>
<br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div></div>

--000000000000451d0f056f121767--
