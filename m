Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B549365CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 13:23:43 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id v123so137126235qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MwHvMEJsC2libnsZNrg7SqzhusFnveha72yJZJJUJao=;
	b=OUw3rEvW5Gq+nWokwY93lrs7OS+ZgvtDz1wutn8WGmb2Rfld/B2DyuJc6HiPKKPOj1
	75ZZPvTw38MCh4M9DQfp5hP0Im6hwc3v4uToWD3LOanGtXv00+JdQzpxcwBfBO/FksNZ
	B/GFrwm4FyTeMKhNZhoRjTg/jUzoKg1iiPUDK7mXN6aomEkdCgTmsaVRBwQDFzc8grEV
	96yOSp6T88Sv270fKDw+dTCm5ZLZdQp9lEdYpnzYfmb89vhlcDfC3K56eOJHJqWnd7Ga
	16xbAlGI9uWRfJ6eZevQWa0Lb1K6CVj26CBeH2nMM8WIVa15LEvcPoJc+BfFe+T8W7f/
	336w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MwHvMEJsC2libnsZNrg7SqzhusFnveha72yJZJJUJao=;
	b=BG5XCzP0ON1CSuBj+cYlJI5UWJ4xbPw76rppcqsQRIOPx9ORtlTyBh0qFBAhpZxZUN
	dEtjwxPWBNBZ04QZiTV5oVP3qrDspf8XwaaLOgvbjo4Un8uDdQjlzVcY0w466T7XYcLz
	6R5Ho5Xg1AuKsgnGBsRm9LGy3Ry0V/GqatXss2bqri+mXRf/D5MLtppgIP7PIdBJWo6w
	43MlYZlMSLIOXK3sSbI0G70qwT/eAEYr0dKRA6kBV+ZiDKY8L4/pa1vJ4vOcJxt2XJLW
	VLor/rhuyKd0FdXUR1wji3E3bwPqqLKbLFTl9bypGtn/Vu2pILx2hMimFxUrmSb7OeU/
	rBng==
X-Gm-Message-State: AE9vXwOzOyazS4M4Ez4/dI6W/qUVDTYw/M2jdh3hK0cxFumjIc3j4IbDw4NzVZayIh0PSS0LWIANzsw10RYUiw==
X-Received: by 10.55.6.9 with SMTP id 9mr15814662qkg.278.1472477023564; Mon,
	29 Aug 2016 06:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 06:23:42 -0700 (PDT)
In-Reply-To: <87poorvhsc.fsf@ni.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
	<87poorvhsc.fsf@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 09:23:42 -0400
Message-ID: <CADkTA4MtJhAzM4un6-t+KkONMOgRBZ5DDFaiM9mRYz_9SHbFcQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Aug 2016 13:23:44 -0000
Content-Type: multipart/alternative; boundary=001a114d7b4aedf9f0053b35c5ad

--001a114d7b4aedf9f0053b35c5ad
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 9:14 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
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
>
> Can you please explain in a simple sentence what it does?
>

It concatenates/merges configuration fragments.

The need to run make, or fill in any additional symbols is the optional
behaviour
of the script and isn't the essential service of what it provides. Since
for the
most part, it does very little if well specified configs and defconfigs are
passed.


>
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
>
> This is not a missing dependency. The problem is the make command called
> in merge_configs fails silently because of a misconfigured sysroot. The
> correct sysroot is in the TOOLCHAIN_OPTIONS variable and it does not get
> passed to the make call in merge_configs.
>

That's my definition of a missing dependency. The host tools should already
exist before
merge_config ever runs. It shouldn't need to build anything.


>
> >
> > How are you managing to trigger this error ? I've done plenty of builds,
> > and haven't
> > seen this one before.
>
> Every one of my builds error out in that make call from merge_config
> without this change because make does not search in the correct sysroot.
>
>
So there's something drastically different. I've done hundreds of builds
before
and after my changes to the kern tools.

I need to understand what is different.

What's your configuration ? Are you building linux-yocto, or something else
?
(so I can run the same build here.)

Bruce


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

--001a114d7b4aedf9f0053b35c5ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 9:14 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&l=
t;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Mon, 29 Aug 2016, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@=
gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu &lt;<a href=3D"mail=
to:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt;<br>
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
<br>
</span>Can you please explain in a simple sentence what it does?<br></block=
quote><div><br></div><div>It concatenates/merges configuration fragments.<b=
r><br></div><div>The need to run make, or fill in any additional symbols is=
 the optional behaviour<br></div><div>of the script and isn&#39;t the essen=
tial service of what it provides. Since for the<br></div><div>most part, it=
 does very little if well specified configs and defconfigs are passed.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
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
&gt;&gt; make[1]: Entering directory &#39;/media/adi/ssd/nilrt-master/<br>
&gt;&gt; build/tmp-glibc/work/x64-<wbr>nilrt-linux/linux-nilrt/4.1+<br>
&gt;&gt; gitAUTOINC+a7e53ecc27-r0/<wbr>linux-x64-standard-build&#39;<br>
&gt;&gt;=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/basic/fixdep<br>
&gt;&gt; /media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/work-shared/<br>
&gt;&gt; x64/kernel-source/scripts/<wbr>basic/fixdep.c:106:23: fatal error:=
<br>
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
<br>
</span>This is not a missing dependency. The problem is the make command ca=
lled<br>
in merge_configs fails silently because of a misconfigured sysroot. The<br>
correct sysroot is in the TOOLCHAIN_OPTIONS variable and it does not get<br=
>
passed to the make call in merge_configs.<br></blockquote><div><br></div><d=
iv>That&#39;s my definition of a missing dependency. The host tools should =
already exist before<br></div><div>merge_config ever runs. It shouldn&#39;t=
 need to build anything.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<span class=3D""><br>
&gt;<br>
&gt; How are you managing to trigger this error ? I&#39;ve done plenty of b=
uilds,<br>
&gt; and haven&#39;t<br>
&gt; seen this one before.<br>
<br>
</span>Every one of my builds error out in that make call from merge_config=
<br>
without this change because make does not search in the correct sysroot.<br=
>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>So there&#39;s something drastically different. I&#39;ve done=
 hundreds of builds before<br></div><div>and after my changes to the kern t=
ools. <br><br></div><div>I need to understand what is different.<br><br></d=
iv><div>What&#39;s your configuration ? Are you building linux-yocto, or so=
mething else ? <br>(so I can run the same build here.)<br><br></div><div>Br=
uce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
HOEnZb"><div class=3D"h5">
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

--001a114d7b4aedf9f0053b35c5ad--
