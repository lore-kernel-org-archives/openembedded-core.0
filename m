Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 81C6F601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 15:01:06 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id l2so140500260qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AxCtuQRSuogP/Cxct5UDpgLLTTSdkqXlsvqqRQiZoqI=;
	b=FCqlQ5I+9SAy+SdAC95WbVp1a1LPjL/HaNe3a/KD+GbPt2IfL3kBCI1uTQi6KMDd08
	IlPIhLnhnwo3L9ZXBEvMQUA3G9gwNuqsOKlIZb7L2VbX4VHVt0y0Bc4UaXkr24zcm7kE
	q8UakKt1enR5bvdsExGq5Mlf/2aDl3uf++8pmEOPuR0PK07EBGvSFiyKEzkdYNJXoLn4
	U+B/F4LA1d4oVgIW2/TtXnjv8rCwAL6EsJfkAtUUg6hZrJZZaECiyDdACHMv2btxpvuo
	2uK847SaGLYp9Ih9LssO27dC398vXENQEqvb4RuCiaiumvjPoUnW4lYYcF45Mjt5Deoz
	5gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AxCtuQRSuogP/Cxct5UDpgLLTTSdkqXlsvqqRQiZoqI=;
	b=QAdvgz8TnWyoNNXMYiKB7fXjuKYwWYzbzmUGoAeiOC2nVEy9oDkuGNMwUoAJ0teGpT
	muSBVd6EpQSJS8Ychp3TuXFmr7VYVGqDCNmBWVrnG0LvDwpzLVN0eNhV3wtxPsvu8sy0
	4T90DMdi6XnksB22m+0d4WV8tQZgOE7/6xoFPCAJiwo59MnUrQ7qxVTW4Rn9uufIG7Fk
	jv0ky+kIE+wo+67X3V7SwqKvif1cIzCeRIGM/0U32pQXUvQSItt8dc0xTfJPaYfGZQYH
	65laMSiKBSEL9G8YGhyxysNZVsiQ5nXl1VZBjSus/1CX/j4dWpjWuF/hkUI+BQHSCc9Q
	dTCQ==
X-Gm-Message-State: AE9vXwMU9yRm2mUDtjFmjWCu9oFT+VvHdYX23/Iwd6ycySf9oidAcKHKJ8o/mr2am/zsISGrkzpjykjSdnKNKQ==
X-Received: by 10.55.6.9 with SMTP id 9mr16421200qkg.278.1472482866825; Mon,
	29 Aug 2016 08:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 08:01:06 -0700 (PDT)
In-Reply-To: <CADkTA4PFXB1AsYiHZng5AvTnOhcTNrGF+wa0VfriX2ECN0ZD8w@mail.gmail.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
	<87fupnvfev.fsf@ni.com>
	<CADkTA4PFXB1AsYiHZng5AvTnOhcTNrGF+wa0VfriX2ECN0ZD8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 11:01:06 -0400
Message-ID: <CADkTA4PR4cb4Cq880ojrx=faf0ef_ko-mGdYG-oekAiEapK9ZQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Aug 2016 15:01:07 -0000
Content-Type: multipart/alternative; boundary=001a114d7b4a371b2f053b3722fd

--001a114d7b4a371b2f053b3722fd
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 10:46 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Aug 29, 2016 at 10:05 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
>
>> On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> > On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com
>> >
>> > wrote:
>> >
>> >> do_kernel_configme calls merge_config.sh (installed in the sysroot by
>> >> the kern-tools-native recipe) which calls make to fill in any missing
>> >> symbols from the resulting merged config.
>> >
>> >
>> > That's not what it does ... but that isn't important.
>> >
>> >
>> >>
>> >> This errors out on my system because of sysroot poisoning [1]. Here is
>> >> a partial output from my .kernel-meta/cfg/merge_config_build.log (this
>> >> file is created in do_kernel_configme() while callig merge_config.sh):
>> >>
>> >> make[1]: Entering directory '/media/adi/ssd/nilrt-master/
>> >> build/tmp-glibc/work/x64-nilrt-linux/linux-nilrt/4.1+
>> >> gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build'
>> >>   HOSTCC  scripts/basic/fixdep
>> >> /media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
>> >> x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error:
>> >> sys/types.h: No such file or directory
>> >> compilation terminated.
>> >> make[2]: *** [/media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
>> >> x64/kernel-source/scripts/basic/Makefile:22:
>> scripts/basic/x86_64-nilrt-linux-fixdep]
>> >> Error 1
>> >>
>> >
>> > This just means that we are missing a dependency. Everything that
>> > merge_config
>> > needs should be already in place before it runs, i.e. do_kernel_metadata
>> > should
>> > have already run and built any host tools that it needs.
>> >
>> > How are you managing to trigger this error ? I've done plenty of builds,
>> > and haven't
>> > seen this one before.
>>
>> Maybe some context is in order for how I build the kernel. I'm using a
>> custom kernel recipe which inherits from linux-yocto.inc. My kernel
>> tree contains a defconfig which is passed to OE in my kernel recipe
>> using KBUILD_DEFCONFIG and KCONFIG_MODE="--alldefconfig".
>>
>
> And that would be the difference, which is what I was looking for. The
> tools
> are always built for the linux-yocto path, hence why I can never reproduce
> the issue.
>
> I can take the kernel-yocto patch and queue it, but I'm going to leave
> merge_config
> untouched, since that change can go via the kernel path.
>

And you can see where I've queued this in my poky-contrib zedd/kernel
branch.
It will go out with my queue the introduced 4.8 as a new kernel. I tweaked
the
commit log a bit, but is is otherwise unchanged.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Cheers,

Bruce


>
> Bruce
>
>
>>
>> I have no configuration fragments.
>>
>> As expected I need the merge_configs script to automatically fill in any
>> missing CONFIG symbols before building the kernel and this is where it
>> fails because the sysroot is poisoned since 2014.
>>
>> >
>> > Bruce
>> >
>> >
>> >>
>> >> This issue is hard to debug because merge_config.sh does NOT check the
>> >> error output of its make call (this is added in the second patch) and
>> >> even though make errors out, the build continues as if nothing happened
>> >> and compiles a kernel with garbage configs (the .config generated by
>> >> do_kernel_configme is empty and gets filled later) which doesn't boot.
>> >>
>> >> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
>> >> fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make
>> >> uses it to correctly compile & fill all missing kernel config options.
>> >>
>> >> [1] http://lists.openembedded.org/pipermail/openembedded-core/
>> >> 2014-October/098253.html
>> >>
>> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> >> ---
>> >>  meta/classes/kernel-yocto.bbclass | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/classes/kernel-yocto.bbclass
>> >> b/meta/classes/kernel-yocto.bbclass
>> >> index 8650e55..4397a9d 100644
>> >> --- a/meta/classes/kernel-yocto.bbclass
>> >> +++ b/meta/classes/kernel-yocto.bbclass
>> >> @@ -249,7 +249,7 @@ do_kernel_configme() {
>> >>                 bbfatal_log "Could not find configuration queue
>> >> (${meta_dir}/config.queue)"
>> >>         fi
>> >>
>> >> -       ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags}
>> ${configs} >
>> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
>> >> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" ARCH=${ARCH}
>> >> merge_config.sh -O ${B} ${config_flags} ${configs} >
>> >> ${meta_dir}/cfg/merge_config_build.log 2>&1
>> >>         if [ $? -ne 0 ]; then
>> >>                 bbfatal_log "Could not configure
>> >> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>> >>         fi
>> >> --
>> >> 2.9.3
>> >>
>> >>
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee
>> > at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114d7b4a371b2f053b3722fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 10:46 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><div><div class=3D"h5">On Mon, Aug 29, 2016 at 10:05 AM, I=
oan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.co=
m" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><span>On Mon, 29 Aug 2016, Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">b=
ruce.ashfield@gmail.com</a>&gt; wrote:<br>
</span><span>&gt; On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu &lt;<a=
 href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com<=
/a>&gt;<br>
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
</span><span>&gt;&gt; make[1]: Entering directory &#39;/media/adi/ssd/nilrt=
-master/<br>
&gt;&gt; build/tmp-glibc/work/x64-nilrt<wbr>-linux/linux-nilrt/4.1+<br>
&gt;&gt; gitAUTOINC+a7e53ecc27-r0/linux<wbr>-x64-standard-build&#39;<br>
&gt;&gt;=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/basic/fixdep<br>
&gt;&gt; /media/adi/ssd/nilrt-master/bu<wbr>ild/tmp-glibc/work-shared/<br>
</span><span>&gt;&gt; x64/kernel-source/scripts/basi<wbr>c/fixdep.c:106:23:=
 fatal error:<br>
&gt;&gt; sys/types.h: No such file or directory<br>
&gt;&gt; compilation terminated.<br>
&gt;&gt; make[2]: *** [/media/adi/ssd/nilrt-master/b<wbr>uild/tmp-glibc/wor=
k-shared/<br>
&gt;&gt; x64/kernel-source/scripts/basi<wbr>c/Makefile:22: scripts/basic/x8=
6_64-nilrt-lin<wbr>ux-fixdep]<br>
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
blockquote><div><br></div></div></div><div>And that would be the difference=
, which is what I was looking for. The tools<br></div><div>are always built=
 for the linux-yocto path, hence why I can never reproduce<br></div><div>th=
e issue.<br><br></div><div>I can take the kernel-yocto patch and queue it, =
but I&#39;m going to leave merge_config<br></div><div>untouched, since that=
 change can go via the kernel path.<span class=3D""><font color=3D"#888888"=
><br></font></span></div></div></div></div></blockquote><div><br></div><div=
>And you can see where I&#39;ve queued this in my poky-contrib zedd/kernel =
branch.<br></div><div>It will go out with my queue the introduced 4.8 as a =
new kernel. I tweaked the<br></div><div>commit log a bit, but is is otherwi=
se unchanged.<br></div><div><br><a href=3D"http://git.yoctoproject.org/cgit=
/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel">http://git.yoctoproject.org/cg=
it/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel</a><br><br></div><div>Cheers,=
<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div><span class=3D""><font color=3D"#888888"><br></f=
ont></span></div><span class=3D""><font color=3D"#888888"><div>Bruce<br></d=
iv></font></span><div><div class=3D"h5"><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
I have no configuration fragments.<br>
<br>
As expected I need the merge_configs script to automatically fill in any<br=
>
missing CONFIG symbols before building the kernel and this is where it<br>
fails because the sysroot is poisoned since 2014.<br>
<div><div><br>
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
u@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/kernel-yocto.bbcl<wbr>ass | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb">kerne=
l-yocto.bb</a><wbr>class<br>
&gt;&gt; b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb<=
/a><wbr>class<br>
&gt;&gt; index 8650e55..4397a9d 100644<br>
&gt;&gt; --- a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto=
.bb</a><wbr>class<br>
&gt;&gt; +++ b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto=
.bb</a><wbr>class<br>
&gt;&gt; @@ -249,7 +249,7 @@ do_kernel_configme() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfat=
al_log &quot;Could not find configuration queue<br>
&gt;&gt; (${meta_dir}/config.queue)&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} merge_config.sh -O ${B}=
 ${config_flags} ${configs} &gt;<br>
&gt;&gt; ${meta_dir}/cfg/merge_config_b<wbr>uild.log 2&gt;&amp;1<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_O=
PTIONS}&quot; ARCH=3D${ARCH}<br>
&gt;&gt; merge_config.sh -O ${B} ${config_flags} ${configs} &gt;<br>
&gt;&gt; ${meta_dir}/cfg/merge_config_b<wbr>uild.log 2&gt;&amp;1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfat=
al_log &quot;Could not configure<br>
&gt;&gt; ${KMACHINE}-${LINUX_KERNEL_TYP<wbr>E}&quot;<br>
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
</div></div></blockquote></div></div></div><div><div class=3D"h5"><br><br c=
lear=3D"all"><br>-- <br><div data-smartmail=3D"gmail_signature">&quot;Thou =
shalt not follow the NULL pointer, for chaos and madness await thee at its =
end&quot;</div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114d7b4a371b2f053b3722fd--
