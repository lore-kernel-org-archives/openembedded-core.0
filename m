Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9CF6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:46:50 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id z190so139857319qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d/MEzTwScRh1KaVtDurj0gXkGZF/v8P+clU1JT5g3v0=;
	b=slsX5iMvhmQzhUwRJSjO1Pk+K/CC1G62Nf9NLch+4zLQBaVcOs//5ll+npQpTNdMA2
	0ieJZbiwYodeVVacG8Vh3Oksuy2mliqnOJw9aPPkoRBy5tdhTLH7YSI76XZahmO1oBB3
	DglPBfEQFzIf7dxcFIke9Q8SO/egYPh+MoVmugMtGFlkU5vKnrbv8qHub8DMZUrkeBJY
	f/0kFGaZGhi1h6p+AOxJstJWElRJndWV/4+SunrtGox33TChRPlSyNtdJMbkWCSS7jrD
	3oGlJ0kqUlWfywRQ4VtdrN5RxL3VhzyDxrejUZA35K5TPV5+TfzToteCl7sr6C9aiEXl
	praQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d/MEzTwScRh1KaVtDurj0gXkGZF/v8P+clU1JT5g3v0=;
	b=hc72ze79583Fm6song//SYQRkC3hQ1zxVqdJ+dTAQHwrrasSJSsxdH+L1LZQoGKklG
	pIb8/vkDbB8Q5BygwFWUZ3PY10Dw6xBNAgEyp91tzBiy8RBA3zXhE2gk9pwqb4C1Hbal
	M+5rm/GrDBCOkzSPFWmxxvg/Nqpw7kDf6Ph5ZEpddFT5a6jgJ6SKzNhiwJnSA+E9CeLS
	Myg22GOrB2gtsVB3Re8KyjtW+IDRLQkcUY9oJzjX4qqCSJ185rSeEpZQOW+w+ZwwfLxq
	+M0XUVNPS8TK8ZPjw7ln3g4EqdrJWIYUcKe+2enMPY+N04WsQFwCC27iNgKNfV37mnmA
	IcuA==
X-Gm-Message-State: AE9vXwN3HwZv2oHfBr2k0C+BqNjHROQrsv4Wu2zvQ9ZAwSQTr5ZWSpVCDKwTxhgeT0I+MuBjevrEOilQtlKTrw==
X-Received: by 10.55.190.68 with SMTP id o65mr18893347qkf.92.1472482011481;
	Mon, 29 Aug 2016 07:46:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 07:46:50 -0700 (PDT)
In-Reply-To: <87fupnvfev.fsf@ni.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
	<87fupnvfev.fsf@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 10:46:50 -0400
Message-ID: <CADkTA4PFXB1AsYiHZng5AvTnOhcTNrGF+wa0VfriX2ECN0ZD8w@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
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
X-List-Received-Date: Mon, 29 Aug 2016 14:46:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c043be23b96d0053b36ef0b

--94eb2c043be23b96d0053b36ef0b
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 10:05 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > wrote:
> >
> >> do_kernel_configme calls merge_config.sh (installed in the sysroot by
> >> the kern-tools-native recipe) which calls make to fill in any missing
> >> symbols from the resulting merged config.
> >
> >
> > That's not what it does ... but that isn't important.
> >
> >
> >>
> >> This errors out on my system because of sysroot poisoning [1]. Here is
> >> a partial output from my .kernel-meta/cfg/merge_config_build.log (this
> >> file is created in do_kernel_configme() while callig merge_config.sh):
> >>
> >> make[1]: Entering directory '/media/adi/ssd/nilrt-master/
> >> build/tmp-glibc/work/x64-nilrt-linux/linux-nilrt/4.1+
> >> gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build'
> >>   HOSTCC  scripts/basic/fixdep
> >> /media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
> >> x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error:
> >> sys/types.h: No such file or directory
> >> compilation terminated.
> >> make[2]: *** [/media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
> >> x64/kernel-source/scripts/basic/Makefile:22:
> scripts/basic/x86_64-nilrt-linux-fixdep]
> >> Error 1
> >>
> >
> > This just means that we are missing a dependency. Everything that
> > merge_config
> > needs should be already in place before it runs, i.e. do_kernel_metadata
> > should
> > have already run and built any host tools that it needs.
> >
> > How are you managing to trigger this error ? I've done plenty of builds,
> > and haven't
> > seen this one before.
>
> Maybe some context is in order for how I build the kernel. I'm using a
> custom kernel recipe which inherits from linux-yocto.inc. My kernel
> tree contains a defconfig which is passed to OE in my kernel recipe
> using KBUILD_DEFCONFIG and KCONFIG_MODE="--alldefconfig".
>

And that would be the difference, which is what I was looking for. The tools
are always built for the linux-yocto path, hence why I can never reproduce
the issue.

I can take the kernel-yocto patch and queue it, but I'm going to leave
merge_config
untouched, since that change can go via the kernel path.

Bruce


>
> I have no configuration fragments.
>
> As expected I need the merge_configs script to automatically fill in any
> missing CONFIG symbols before building the kernel and this is where it
> fails because the sysroot is poisoned since 2014.
>
> >
> > Bruce
> >
> >
> >>
> >> This issue is hard to debug because merge_config.sh does NOT check the
> >> error output of its make call (this is added in the second patch) and
> >> even though make errors out, the build continues as if nothing happened
> >> and compiles a kernel with garbage configs (the .config generated by
> >> do_kernel_configme is empty and gets filled later) which doesn't boot.
> >>
> >> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
> >> fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make
> >> uses it to correctly compile & fill all missing kernel config options.
> >>
> >> [1] http://lists.openembedded.org/pipermail/openembedded-core/
> >> 2014-October/098253.html
> >>
> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >> ---
> >>  meta/classes/kernel-yocto.bbclass | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel-yocto.bbclass
> >> b/meta/classes/kernel-yocto.bbclass
> >> index 8650e55..4397a9d 100644
> >> --- a/meta/classes/kernel-yocto.bbclass
> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> @@ -249,7 +249,7 @@ do_kernel_configme() {
> >>                 bbfatal_log "Could not find configuration queue
> >> (${meta_dir}/config.queue)"
> >>         fi
> >>
> >> -       ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
> >
> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
> >> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" ARCH=${ARCH}
> >> merge_config.sh -O ${B} ${config_flags} ${configs} >
> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
> >>         if [ $? -ne 0 ]; then
> >>                 bbfatal_log "Could not configure
> >> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> >>         fi
> >> --
> >> 2.9.3
> >>
> >>
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> > at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c043be23b96d0053b36ef0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 10:05 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&=
lt;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Mon, 29 Aug 2016, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
</span><span class=3D"">&gt; On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian R=
atiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;=
<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; do_kernel_configme calls merge_config.sh (installed in the sysroot=
 by<br>
&gt;&gt; the kern-tools-native recipe) which calls make to fill in any miss=
ing<br>
&gt;&gt; symbols from the resulting merged config.<br>
&gt;<br>
&gt;<br>
&gt; That&#39;s not what it does ... but that isn&#39;t important.<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; This errors out on my system because of sysroot poisoning [1]. Her=
e is<br>
&gt;&gt; a partial output from my .kernel-meta/cfg/merge_config_<wbr>build.=
log (this<br>
&gt;&gt; file is created in do_kernel_configme() while callig merge_config.=
sh):<br>
&gt;&gt;<br>
</span><span class=3D"">&gt;&gt; make[1]: Entering directory &#39;/media/ad=
i/ssd/nilrt-master/<br>
&gt;&gt; build/tmp-glibc/work/x64-<wbr>nilrt-linux/linux-nilrt/4.1+<br>
&gt;&gt; gitAUTOINC+a7e53ecc27-r0/<wbr>linux-x64-standard-build&#39;<br>
&gt;&gt;=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/basic/fixdep<br>
&gt;&gt; /media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/work-shared/<br>
</span><span class=3D"">&gt;&gt; x64/kernel-source/scripts/<wbr>basic/fixde=
p.c:106:23: fatal error:<br>
&gt;&gt; sys/types.h: No such file or directory<br>
&gt;&gt; compilation terminated.<br>
&gt;&gt; make[2]: *** [/media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/wor=
k-shared/<br>
&gt;&gt; x64/kernel-source/scripts/<wbr>basic/Makefile:22: scripts/basic/x8=
6_64-nilrt-<wbr>linux-fixdep]<br>
&gt;&gt; Error 1<br>
&gt;&gt;<br>
&gt;<br>
&gt; This just means that we are missing a dependency. Everything that<br>
&gt; merge_config<br>
&gt; needs should be already in place before it runs, i.e. do_kernel_metada=
ta<br>
&gt; should<br>
&gt; have already run and built any host tools that it needs.<br>
&gt;<br>
&gt; How are you managing to trigger this error ? I&#39;ve done plenty of b=
uilds,<br>
&gt; and haven&#39;t<br>
&gt; seen this one before.<br>
<br>
</span>Maybe some context is in order for how I build the kernel. I&#39;m u=
sing a<br>
custom kernel recipe which inherits from linux-yocto.inc. My kernel<br>
tree contains a defconfig which is passed to OE in my kernel recipe<br>
using KBUILD_DEFCONFIG and KCONFIG_MODE=3D&quot;--alldefconfig&quot;.<br></=
blockquote><div><br></div><div>And that would be the difference, which is w=
hat I was looking for. The tools<br></div><div>are always built for the lin=
ux-yocto path, hence why I can never reproduce<br></div><div>the issue.<br>=
<br></div><div>I can take the kernel-yocto patch and queue it, but I&#39;m =
going to leave merge_config<br></div><div>untouched, since that change can =
go via the kernel path.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
I have no configuration fragments.<br>
<br>
As expected I need the merge_configs script to automatically fill in any<br=
>
missing CONFIG symbols before building the kernel and this is where it<br>
fails because the sysroot is poisoned since 2014.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; This issue is hard to debug because merge_config.sh does NOT check=
 the<br>
&gt;&gt; error output of its make call (this is added in the second patch) =
and<br>
&gt;&gt; even though make errors out, the build continues as if nothing hap=
pened<br>
&gt;&gt; and compiles a kernel with garbage configs (the .config generated =
by<br>
&gt;&gt; do_kernel_configme is empty and gets filled later) which doesn&#39=
;t boot.<br>
&gt;&gt;<br>
&gt;&gt; Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.=
sh<br>
&gt;&gt; fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and=
 make<br>
&gt;&gt; uses it to correctly compile &amp; fill all missing kernel config =
options.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"http://lists.openembedded.org/pipermail/openembedde=
d-core/" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org=
/<wbr>pipermail/openembedded-core/</a><br>
&gt;&gt; 2014-October/098253.html<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.rati=
u@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/kernel-yocto.<wbr>bbclass | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; b/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; index 8650e55..4397a9d 100644<br>
&gt;&gt; --- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; +++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; @@ -249,7 +249,7 @@ do_kernel_configme() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfat=
al_log &quot;Could not find configuration queue<br>
&gt;&gt; (${meta_dir}/config.queue)&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} merge_config.sh -O ${B}=
 ${config_flags} ${configs} &gt;<br>
&gt;&gt; ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&amp;1<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_O=
PTIONS}&quot; ARCH=3D${ARCH}<br>
&gt;&gt; merge_config.sh -O ${B} ${config_flags} ${configs} &gt;<br>
&gt;&gt; ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&amp;1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfat=
al_log &quot;Could not configure<br>
&gt;&gt; ${KMACHINE}-${LINUX_KERNEL_<wbr>TYPE}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; --<br>
&gt;&gt; 2.9.3<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee<br>
&gt; at its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c043be23b96d0053b36ef0b--
