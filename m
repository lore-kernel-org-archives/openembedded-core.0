Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 80A1C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:44:58 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id l2so139949121qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KAMAlSytSh0PNqVeFXppZJ8NA83rpSGjqE/4IhaVJ3Q=;
	b=l5RFh9RHHAFzPBcaAf5Dl7xiDU6ubUOMUmtfynRvCrSpqGwomzp7kMJZyrItIKnzAQ
	yJPOcK94NNb625boI59YPYRzinGzJYMPMkVBGi0sP9x6/R0htz/ymdEfBrMDop9haYH8
	bD66XiW5jMP1R0/EMIZROS4szjRpKC6KvNjjozO/vQitQWjy89/7bEhjrnD9U+bcHS16
	Ht8rCit2LfA+cP/DBt8rL6ST9vYwXdCf3ZCmsYDPUO9Vi7qKvH26ENu6yC3i9vO5EUml
	iW2W4kP132BizNIi4gQOVNQ0JM59g1uejSQ1zbBouHbfkFN4OHmhX1nmW83gOAoaSP/+
	6opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KAMAlSytSh0PNqVeFXppZJ8NA83rpSGjqE/4IhaVJ3Q=;
	b=DQDmToX3iwEyH2OI3LFLibYhqmuF2UefRSqTvIgodIrNrzTnVALTbFG888UVqIJf4A
	1wM52F4hQEimxfpx6M7nktVH14MJCGEFf8xnLF+r11OxEgkwTxsIKQsbNMFGFYUJrquA
	j6Ac8w4GFTJ4wDaQJ6wkcquqN61vWdDh3nO+5mBD2bAwAL/+a3LWf3+6nOneH8A40CmG
	bPOEROAwf0vgrgFgWbwChbWOuL112dPL79gje3ZH5Jl6RyaNJ9nOMXnEYS1BK7eIWNYo
	dp2KBBv+mJnhPz/v6umrL2T/oij4ex3u25PN//h3NAgpmkoKVmlx4aDQRHmBKBy/OqqJ
	eJtw==
X-Gm-Message-State: AE9vXwM3iptzKdec8z5I5r/EqXbX//2wn++VsiBWQLC4dg9aJC4LSehcKBjk5Aycsjd1NK23FkDo5+DLJcWUsQ==
X-Received: by 10.55.176.67 with SMTP id z64mr19625123qke.74.1472481899038;
	Mon, 29 Aug 2016 07:44:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 07:44:58 -0700 (PDT)
In-Reply-To: <87k2ezvg2d.fsf@ni.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
	<87poorvhsc.fsf@ni.com>
	<CADkTA4MtJhAzM4un6-t+KkONMOgRBZ5DDFaiM9mRYz_9SHbFcQ@mail.gmail.com>
	<87k2ezvg2d.fsf@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 10:44:58 -0400
Message-ID: <CADkTA4PZOrEVfwsOzgrrv2W0sEaA459pD+A_M1XqLB+5ukVxbg@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Aug 2016 14:45:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c06fece87d4fe053b36e809

--94eb2c06fece87d4fe053b36e809
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 9:51 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Mon, Aug 29, 2016 at 9:14 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
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
> >>
> >> Can you please explain in a simple sentence what it does?
> >>
> >
> > It concatenates/merges configuration fragments.
> >
> > The need to run make, or fill in any additional symbols is the optional
> > behaviour
> > of the script and isn't the essential service of what it provides. Since
> > for the
> > most part, it does very little if well specified configs and defconfigs
> are
> > passed.
>
> Even if it is an optional behaviour, this is exactly what make does, so
> I don't know how I mistated what it does (it fills in missing symbols).
> This is exactly what I said.
>

I've been working with merge_config for a long time (it is based on parts
of scripts
that I wrote/developed), so lets just say that I have a more precise
definition of
what it does. The extra filling in of symbols is peripheral functionality.


> The important issue is that it can fail and if it can fail then we need
> to check its return code. Isn't this true?
>

I didn't say it wasn't, but I'm not in the habit of merging patches for
errors that
I can't reproduce when I run hundreds/thousands of builds with the tools and
have never seen it. I need to understand the root cause, and see it myself.

Bruce


>
>
>
> >
> >
> >>
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
> >>
> >> This is not a missing dependency. The problem is the make command called
> >> in merge_configs fails silently because of a misconfigured sysroot. The
> >> correct sysroot is in the TOOLCHAIN_OPTIONS variable and it does not get
> >> passed to the make call in merge_configs.
> >>
> >
> > That's my definition of a missing dependency. The host tools should
> already
> > exist before
> > merge_config ever runs. It shouldn't need to build anything.
> >
> >
> >>
> >> >
> >> > How are you managing to trigger this error ? I've done plenty of
> builds,
> >> > and haven't
> >> > seen this one before.
> >>
> >> Every one of my builds error out in that make call from merge_config
> >> without this change because make does not search in the correct sysroot.
> >>
> >>
> > So there's something drastically different. I've done hundreds of builds
> > before
> > and after my changes to the kern tools.
> >
> > I need to understand what is different.
> >
> > What's your configuration ? Are you building linux-yocto, or something
> else
> > ?
> > (so I can run the same build here.)
> >
> > Bruce
> >
> >
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

--94eb2c06fece87d4fe053b36e809
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 9:51 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&l=
t;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Mon, 29 Aug 2016, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@=
gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; On Mon, Aug 29, 2016 at 9:14 AM, Ioan-Adrian Ratiu &lt;<a href=3D"mail=
to:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
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
&gt;&gt;<br>
&gt;&gt; Can you please explain in a simple sentence what it does?<br>
&gt;&gt;<br>
&gt;<br>
&gt; It concatenates/merges configuration fragments.<br>
&gt;<br>
&gt; The need to run make, or fill in any additional symbols is the optiona=
l<br>
&gt; behaviour<br>
&gt; of the script and isn&#39;t the essential service of what it provides.=
 Since<br>
&gt; for the<br>
&gt; most part, it does very little if well specified configs and defconfig=
s are<br>
&gt; passed.<br>
<br>
</span>Even if it is an optional behaviour, this is exactly what make does,=
 so<br>
I don&#39;t know how I mistated what it does (it fills in missing symbols).=
<br>
This is exactly what I said.<br></blockquote><div><br></div><div>I&#39;ve b=
een working with merge_config for a long time (it is based on parts of scri=
pts<br></div><div>that I wrote/developed), so lets just say that I have a m=
ore precise definition of<br></div><div>what it does. The extra filling in =
of symbols is peripheral functionality.<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
The important issue is that it can fail and if it can fail then we need<br>
to check its return code. Isn&#39;t this true?<br></blockquote><div><br></d=
iv><div>I didn&#39;t say it wasn&#39;t, but I&#39;m not in the habit of mer=
ging patches for errors that<br></div><div>I can&#39;t reproduce when I run=
 hundreds/thousands of builds with the tools and<br></div><div>have never s=
een it. I need to understand the root cause, and see it myself.<br><br></di=
v><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
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
&gt;&gt;<br>
&gt;&gt; This is not a missing dependency. The problem is the make command =
called<br>
&gt;&gt; in merge_configs fails silently because of a misconfigured sysroot=
. The<br>
&gt;&gt; correct sysroot is in the TOOLCHAIN_OPTIONS variable and it does n=
ot get<br>
&gt;&gt; passed to the make call in merge_configs.<br>
&gt;&gt;<br>
&gt;<br>
&gt; That&#39;s my definition of a missing dependency. The host tools shoul=
d already<br>
&gt; exist before<br>
&gt; merge_config ever runs. It shouldn&#39;t need to build anything.<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; How are you managing to trigger this error ? I&#39;ve done pl=
enty of builds,<br>
&gt;&gt; &gt; and haven&#39;t<br>
&gt;&gt; &gt; seen this one before.<br>
&gt;&gt;<br>
&gt;&gt; Every one of my builds error out in that make call from merge_conf=
ig<br>
&gt;&gt; without this change because make does not search in the correct sy=
sroot.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; So there&#39;s something drastically different. I&#39;ve done hundreds=
 of builds<br>
&gt; before<br>
&gt; and after my changes to the kern tools.<br>
&gt;<br>
&gt; I need to understand what is different.<br>
&gt;<br>
&gt; What&#39;s your configuration ? Are you building linux-yocto, or somet=
hing else<br>
&gt; ?<br>
&gt; (so I can run the same build here.)<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
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

--94eb2c06fece87d4fe053b36e809--
