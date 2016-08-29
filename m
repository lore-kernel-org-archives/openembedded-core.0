Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC13605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 15:39:27 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id l2so141782310qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Anp1Xaa9Qdh5CDCz15DxMew6rZMO5G2Yd6oXCrupMQ=;
	b=K9sSmqw98VvW467hmlnWGrkHwJa8AdnYXqhrOjVc/7e6CrkHwagJ6IOX6lE4e8JVds
	UwPco217/UJGdu4wSC/qvk92fLl6L6G8R4/iQqKEPNqDPU0LjgXVecdXOoZoYt7vJM2W
	hhC1bBC7uQlpMzb25n02VER48CTCyO0ebqEWaTKy7PV2st3QP06UM/pYFHipwf7LwQIz
	RfrV2NYiHFbruGiMUe6dRbF0TfcSzqh6JZHYn8vQz+EfjF9WzjYhzMCZY45pbBOcvD5v
	T90OlQb1Z5vjABeQxslKkjYb7e4au9p5/T4iiKczHCnx0N1AHfaQPc5JR+xxYKvIuwsO
	sz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Anp1Xaa9Qdh5CDCz15DxMew6rZMO5G2Yd6oXCrupMQ=;
	b=InVk+62RYJA8WbgED5tUzcu0a0nHBbnDDCppohyuwrKcXTwklh73oBO4nQMIOCP2xm
	CSmATb3+Tb6bCy+7lAi1+X94Mg12R1eSicXfYfezHsf8UG+58VB9v+FipQe29a4gRcVX
	KIUkqYl6zIBOx7KmlAlsfWBLVugIPmZwjNQ+lJd5+ccBJFd+eZFEiKYFSzw9ynaqcbml
	QWHwlIoK33Qobqhi0a9sWiGyGuIvz2mwNX7HISBoXj25M0cMvTSwr2NNLhqFMBztlTqj
	AA2e5GAgWM/VTvIWdnHi5vnmfjGCwCtN+dEygm/Jkm81zUE21ldrzItr2yBbF7IX3wYc
	u5MA==
X-Gm-Message-State: AE9vXwMld/i2gDZfcznHs+QCls3CARqWnkLwZ2eXdi9Yfy2/FUTkf039KZD5STPiazP8ccWiOcQgyVUr+D9iXA==
X-Received: by 10.55.143.134 with SMTP id r128mr19887331qkd.161.1472485167477; 
	Mon, 29 Aug 2016 08:39:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 08:39:26 -0700 (PDT)
In-Reply-To: <87d1krvbar.fsf@ni.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
	<87fupnvfev.fsf@ni.com>
	<CADkTA4PFXB1AsYiHZng5AvTnOhcTNrGF+wa0VfriX2ECN0ZD8w@mail.gmail.com>
	<87d1krvbar.fsf@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 11:39:26 -0400
Message-ID: <CADkTA4N0O71LURyyrTN=0PyN_uUwtfWcQUfBaNCtzp0a6n5M_g@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Aug 2016 15:39:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c083454583de4053b37ab6c

--94eb2c083454583de4053b37ab6c
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 11:34 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Mon, Aug 29, 2016 at 10:05 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com
> >
> > wrote:
> >
> >> On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >> > On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <
> adrian.ratiu@ni.com>
> >> > wrote:
> >> >
> >> >> do_kernel_configme calls merge_config.sh (installed in the sysroot by
> >> >> the kern-tools-native recipe) which calls make to fill in any missing
> >> >> symbols from the resulting merged config.
> >> >
> >> >
> >> > That's not what it does ... but that isn't important.
> >> >
> >> >
> >> >>
> >> >> This errors out on my system because of sysroot poisoning [1]. Here
> is
> >> >> a partial output from my .kernel-meta/cfg/merge_config_build.log
> (this
> >> >> file is created in do_kernel_configme() while callig
> merge_config.sh):
> >> >>
> >> >> make[1]: Entering directory '/media/adi/ssd/nilrt-master/
> >> >> build/tmp-glibc/work/x64-nilrt-linux/linux-nilrt/4.1+
> >> >> gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build'
> >> >>   HOSTCC  scripts/basic/fixdep
> >> >> /media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
> >> >> x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error:
> >> >> sys/types.h: No such file or directory
> >> >> compilation terminated.
> >> >> make[2]: *** [/media/adi/ssd/nilrt-master/
> build/tmp-glibc/work-shared/
> >> >> x64/kernel-source/scripts/basic/Makefile:22:
> >> scripts/basic/x86_64-nilrt-linux-fixdep]
> >> >> Error 1
> >> >>
> >> >
> >> > This just means that we are missing a dependency. Everything that
> >> > merge_config
> >> > needs should be already in place before it runs, i.e.
> do_kernel_metadata
> >> > should
> >> > have already run and built any host tools that it needs.
> >> >
> >> > How are you managing to trigger this error ? I've done plenty of
> builds,
> >> > and haven't
> >> > seen this one before.
> >>
> >> Maybe some context is in order for how I build the kernel. I'm using a
> >> custom kernel recipe which inherits from linux-yocto.inc. My kernel
> >> tree contains a defconfig which is passed to OE in my kernel recipe
> >> using KBUILD_DEFCONFIG and KCONFIG_MODE="--alldefconfig".
> >>
> >
> > And that would be the difference, which is what I was looking for. The
> tools
> > are always built for the linux-yocto path, hence why I can never
> reproduce
> > the issue.
> >
> > I can take the kernel-yocto patch and queue it, but I'm going to leave
> > merge_config
> > untouched, since that change can go via the kernel path.
>
> Thank you.
>
> Can you please explain a little what you mean by "go via the kernel path"?
>


I keep a copy of merge_config.sh in the kern-tools repo, because I don't
want to
add a dependency on the full kernel source tree to get that single tool.

I also used to carry changes to the script in the kern-tools repo. But with
my recent
updates, I'm able to use it as-is.

So unless a bug is critical (and in this case, we can get by with me
carrying the
toolchain definition patch to kernel-yocto), the right place to submit
patches to
merge_config.sh is via the linux kernel mailing list. That way everyone
gets to
take advantage of the changes.

Cheers,

Bruce


>
> >
> > Bruce
> >
> >
> >>
> >> I have no configuration fragments.
> >>
> >> As expected I need the merge_configs script to automatically fill in any
> >> missing CONFIG symbols before building the kernel and this is where it
> >> fails because the sysroot is poisoned since 2014.
> >>
> >> >
> >> > Bruce
> >> >
> >> >
> >> >>
> >> >> This issue is hard to debug because merge_config.sh does NOT check
> the
> >> >> error output of its make call (this is added in the second patch) and
> >> >> even though make errors out, the build continues as if nothing
> happened
> >> >> and compiles a kernel with garbage configs (the .config generated by
> >> >> do_kernel_configme is empty and gets filled later) which doesn't
> boot.
> >> >>
> >> >> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
> >> >> fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and
> make
> >> >> uses it to correctly compile & fill all missing kernel config
> options.
> >> >>
> >> >> [1] http://lists.openembedded.org/pipermail/openembedded-core/
> >> >> 2014-October/098253.html
> >> >>
> >> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >> >> ---
> >> >>  meta/classes/kernel-yocto.bbclass | 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/meta/classes/kernel-yocto.bbclass
> >> >> b/meta/classes/kernel-yocto.bbclass
> >> >> index 8650e55..4397a9d 100644
> >> >> --- a/meta/classes/kernel-yocto.bbclass
> >> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> >> @@ -249,7 +249,7 @@ do_kernel_configme() {
> >> >>                 bbfatal_log "Could not find configuration queue
> >> >> (${meta_dir}/config.queue)"
> >> >>         fi
> >> >>
> >> >> -       ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags}
> ${configs}
> >> >
> >> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
> >> >> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" ARCH=${ARCH}
> >> >> merge_config.sh -O ${B} ${config_flags} ${configs} >
> >> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
> >> >>         if [ $? -ne 0 ]; then
> >> >>                 bbfatal_log "Could not configure
> >> >> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> >> >>         fi
> >> >> --
> >> >> 2.9.3
> >> >>
> >> >>
> >> >
> >> >
> >> > --
> >> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee
> >> > at its end"
> >>
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> > at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c083454583de4053b37ab6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 11:34 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&=
lt;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
HOEnZb"><div class=3D"h5">On Mon, 29 Aug 2016, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br>
&gt; On Mon, Aug 29, 2016 at 10:05 AM, Ioan-Adrian Ratiu &lt;<a href=3D"mai=
lto:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Mon, 29 Aug 2016, Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu &lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; do_kernel_configme calls merge_config.sh (installed in th=
e sysroot by<br>
&gt;&gt; &gt;&gt; the kern-tools-native recipe) which calls make to fill in=
 any missing<br>
&gt;&gt; &gt;&gt; symbols from the resulting merged config.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; That&#39;s not what it does ... but that isn&#39;t important.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This errors out on my system because of sysroot poisoning=
 [1]. Here is<br>
&gt;&gt; &gt;&gt; a partial output from my .kernel-meta/cfg/merge_config_<w=
br>build.log (this<br>
&gt;&gt; &gt;&gt; file is created in do_kernel_configme() while callig merg=
e_config.sh):<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; make[1]: Entering directory &#39;/media/adi/ssd/nilrt-mas=
ter/<br>
&gt;&gt; &gt;&gt; build/tmp-glibc/work/x64-<wbr>nilrt-linux/linux-nilrt/4.1=
+<br>
&gt;&gt; &gt;&gt; gitAUTOINC+a7e53ecc27-r0/<wbr>linux-x64-standard-build&#3=
9;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/basic/fixdep<br>
&gt;&gt; &gt;&gt; /media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/work-sha=
red/<br>
&gt;&gt; &gt;&gt; x64/kernel-source/scripts/<wbr>basic/fixdep.c:106:23: fat=
al error:<br>
&gt;&gt; &gt;&gt; sys/types.h: No such file or directory<br>
&gt;&gt; &gt;&gt; compilation terminated.<br>
&gt;&gt; &gt;&gt; make[2]: *** [/media/adi/ssd/nilrt-master/<wbr>build/tmp-=
glibc/work-shared/<br>
&gt;&gt; &gt;&gt; x64/kernel-source/scripts/<wbr>basic/Makefile:22:<br>
&gt;&gt; scripts/basic/x86_64-nilrt-<wbr>linux-fixdep]<br>
&gt;&gt; &gt;&gt; Error 1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This just means that we are missing a dependency. Everything =
that<br>
&gt;&gt; &gt; merge_config<br>
&gt;&gt; &gt; needs should be already in place before it runs, i.e. do_kern=
el_metadata<br>
&gt;&gt; &gt; should<br>
&gt;&gt; &gt; have already run and built any host tools that it needs.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; How are you managing to trigger this error ? I&#39;ve done pl=
enty of builds,<br>
&gt;&gt; &gt; and haven&#39;t<br>
&gt;&gt; &gt; seen this one before.<br>
&gt;&gt;<br>
&gt;&gt; Maybe some context is in order for how I build the kernel. I&#39;m=
 using a<br>
&gt;&gt; custom kernel recipe which inherits from linux-yocto.inc. My kerne=
l<br>
&gt;&gt; tree contains a defconfig which is passed to OE in my kernel recip=
e<br>
&gt;&gt; using KBUILD_DEFCONFIG and KCONFIG_MODE=3D&quot;--alldefconfig&quo=
t;.<br>
&gt;&gt;<br>
&gt;<br>
&gt; And that would be the difference, which is what I was looking for. The=
 tools<br>
&gt; are always built for the linux-yocto path, hence why I can never repro=
duce<br>
&gt; the issue.<br>
&gt;<br>
&gt; I can take the kernel-yocto patch and queue it, but I&#39;m going to l=
eave<br>
&gt; merge_config<br>
&gt; untouched, since that change can go via the kernel path.<br>
<br>
</div></div>Thank you.<br>
<br>
Can you please explain a little what you mean by &quot;go via the kernel pa=
th&quot;?<br></blockquote><div><br><br></div><div>I keep a copy of merge_co=
nfig.sh in the kern-tools repo, because I don&#39;t want to<br></div><div>a=
dd a dependency on the full kernel source tree to get that single tool.<br>=
<br></div><div>I also used to carry changes to the script in the kern-tools=
 repo. But with my recent<br></div><div>updates, I&#39;m able to use it as-=
is.<br><br></div><div>So unless a bug is critical (and in this case, we can=
 get by with me carrying the<br></div><div>toolchain definition patch to ke=
rnel-yocto), the right place to submit patches to <br></div><div>merge_conf=
ig.sh is via the linux kernel mailing list. That way everyone gets to<br></=
div><div>take advantage of the changes.<br><br></div><div>Cheers,<br><br></=
div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; I have no configuration fragments.<br>
&gt;&gt;<br>
&gt;&gt; As expected I need the merge_configs script to automatically fill =
in any<br>
&gt;&gt; missing CONFIG symbols before building the kernel and this is wher=
e it<br>
&gt;&gt; fails because the sysroot is poisoned since 2014.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Bruce<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This issue is hard to debug because merge_config.sh does =
NOT check the<br>
&gt;&gt; &gt;&gt; error output of its make call (this is added in the secon=
d patch) and<br>
&gt;&gt; &gt;&gt; even though make errors out, the build continues as if no=
thing happened<br>
&gt;&gt; &gt;&gt; and compiles a kernel with garbage configs (the .config g=
enerated by<br>
&gt;&gt; &gt;&gt; do_kernel_configme is empty and gets filled later) which =
doesn&#39;t boot.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge=
_configs.sh<br>
&gt;&gt; &gt;&gt; fixes the error because $TOOLCHAIN_OPTIONS defines the sy=
sroot and make<br>
&gt;&gt; &gt;&gt; uses it to correctly compile &amp; fill all missing kerne=
l config options.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; [1] <a href=3D"http://lists.openembedded.org/pipermail/op=
enembedded-core/" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/<wbr>pipermail/openembedded-core/</a><br>
&gt;&gt; &gt;&gt; 2014-October/098253.html<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:ad=
rian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/classes/kernel-yocto.<wbr>bbclass | 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; &gt;&gt; b/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; &gt;&gt; index 8650e55..4397a9d 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; &gt;&gt; +++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt;&gt; &gt;&gt; @@ -249,7 +249,7 @@ do_kernel_configme() {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bbfatal_log &quot;Could not find configuration queue<br>
&gt;&gt; &gt;&gt; (${meta_dir}/config.queue)&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} merge_config.s=
h -O ${B} ${config_flags} ${configs}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&amp;1<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TO=
OLCHAIN_OPTIONS}&quot; ARCH=3D${ARCH}<br>
&gt;&gt; &gt;&gt; merge_config.sh -O ${B} ${config_flags} ${configs} &gt;<b=
r>
&gt;&gt; &gt;&gt; ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&amp;1<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br=
>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bbfatal_log &quot;Could not configure<br>
&gt;&gt; &gt;&gt; ${KMACHINE}-${LINUX_KERNEL_<wbr>TYPE}&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.9.3<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; &quot;Thou shalt not follow the NULL pointer, for chaos and m=
adness await thee<br>
&gt;&gt; &gt; at its end&quot;<br>
&gt;&gt;<br>
&gt;<br>
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

--94eb2c083454583de4053b37ab6c--
