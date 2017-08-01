Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5114A78396
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 02:28:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id i133so145878vka.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gmhXvJxDNYBBC8hTi4rqmRiLk6IF4SMu5mcJqho2hUo=;
	b=mgzP+R5rtHrwDncqGcMOt6Ej4FHsxTgOWxmedqRNTwNqIOBxgphuHCU5lipRExb8RB
	jjD95BRsvrMGVUFpm6Imiinwas8Gnc3b4BgoAwyGUpeZs5hW1mMLQZ+x/Z9YY15egORj
	ISq9PCT6djafUs7P4TDdtGETvmzsb7fd/zM/tYMl+FkBGgmd5U6QZMnGUqmS+1sOSW26
	33TQjGM7czud8NmW8Zhv3tvSuCBO2EtQi6DhwUrselFBFqKt+8RPzbQu1cxx5xBW2tnW
	m7AtWkl9lpXjseSyW2kcOWW7bw+Mi6NBuaji2aI9V57ebAwKk7QQbUFfkq63tL/1xqDq
	OW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gmhXvJxDNYBBC8hTi4rqmRiLk6IF4SMu5mcJqho2hUo=;
	b=VcSRa639OfAGIgUQSqq+4U4Sl2SAvZR4j0HfHRVKECc6pPSl8my2TLdj2LQY52KQzN
	DqUtdvyyTsDDHkxlUrSySh1NBmM7Us1MoDn5ImyMU08UrMV8xw5Zu6sqklsr3CpePmDb
	aOk+OsPPGEcX8xREU30XHIoi+YNlVeR7DYVkcX+NJ5kJCuGf6LdbM7qqgkYhkqjpEwyD
	kLIJ6Y3u98nWCx/NZtWxJZadyUVBP8BcSFn/L0XrOlA3r02VfsecawxR0a3TqeBoz3+m
	SlgRL3OqqE6fNVoUwoHxaHOMtpVbYIeSBVdq63CORJ5oWaBYIxMpx/NUIvozARabPDvD
	/ICA==
X-Gm-Message-State: AIVw112ohRaImtR7LHHhMv3bLjaqsU/leKhVaQe3XjkT7y1bZPGBn1P0
	Aq0jjXvLw9XYTFGajXVl88uXQiu9OQ==
X-Received: by 10.31.67.19 with SMTP id q19mr12100922vka.115.1501554501136;
	Mon, 31 Jul 2017 19:28:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Mon, 31 Jul 2017 19:28:20 -0700 (PDT)
In-Reply-To: <CAMKF1sqBnmmVEDB1GE3ei8=skkyRXc_igD_=_xEcwwOnANspaQ@mail.gmail.com>
References: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
	<CAMKF1soLq6tFwDKBhs_5DxHrNeWr_Hv8kYSvABYsTW_BvgfpKQ@mail.gmail.com>
	<CALatG=5yu+0gVSg0dEOY-Yt1SftLWY9iweuzzVMj3D29U0XvaA@mail.gmail.com>
	<CAMKF1sqBnmmVEDB1GE3ei8=skkyRXc_igD_=_xEcwwOnANspaQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 1 Aug 2017 04:28:20 +0200
Message-ID: <CALatG=4iQiBAt7GuZiWx2s=p+q8K_7-1D8e0cBSFJokEprdF7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Tue, 01 Aug 2017 02:28:20 -0000
Content-Type: multipart/alternative; boundary="001a114db3d6a6ce300555a7e6bd"

--001a114db3d6a6ce300555a7e6bd
Content-Type: text/plain; charset="UTF-8"

Hi, Khem:

Just tried, but the error still could be observed with the patch
applied, for instance:

| /home/peter-liu/opensource/poky-upstream/build/tmp/work/cortexa8hf-neon-poky-linux-musleabi/m4/1.4.18-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-musleabi/../../libexec/arm-poky-linux-musleabi/gcc/arm-poky-linux-musleabi/7.1.0/ld:
error: ../lib/libm4.a(progname.o): cannot make copy relocation for
protected symbol 'program_invocation_name', defined in
/home/peter-liu/opensource/poky-upstream/build/tmp/work/cortexa8hf-neon-poky-linux-musleabi/m4/1.4.18-r0/recipe-sysroot/usr/lib/libc.so
| collect2: error: ld returned 1 exit status
| Makefile:1554: recipe for target 'm4' failed

//Ming Liu


2017-07-31 23:56 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Tue, Jul 25, 2017 at 1:07 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> > Hi, Burton:
> >
> > I also agree with you, your suggestion is better.
> >
> > Hi, Khem:
> >
> > But is this a bug of binutils? Or musl libc? Since I had only observed
> this
> > error with musl libc only, it did not occur with glibc.
> >
>
> Please try out a tentative patch here
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679#c4
>
> > //Ming Liu
> >
> > 2017-07-24 15:39 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> >>
> >> On Mon, Jul 24, 2017 at 6:18 AM, Burton, Ross <ross.burton@intel.com>
> >> wrote:
> >> > If we're going to silently change the linker to bfd under musl if
> >> > ld-is-gold
> >> > is selected, wouldn't it be better just to throw an exception if both
> >> > musl
> >> > and ld-is-gold are selected?  Better to tell the user so they can not
> do
> >> > that than silently ignore what they asked.
> >>
> >> yes, that would be better but I am skeptical of disabling it
> >> completely, we should
> >> create testcase and report it to binutils bugzilla
> >>
> >>
> >> >
> >> > Ross
> >> >
> >> > On 22 July 2017 at 14:30, <liu.ming50@gmail.com> wrote:
> >> >>
> >> >> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >> >>
> >> >> Quite a few such compiling issues were found when I was building with
> >> >> following configs:
> >> >> ...
> >> >> MACHINE = "beaglebone"
> >> >> TCLIBC = "musl"
> >> >> DISTRO_FEATURES_append = " ld-is-gold"
> >> >> ...
> >> >>
> >> >> fixed by adding bfd binding now ldflags.
> >> >>
> >> >> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> >> >> ---
> >> >>  meta/conf/distro/include/tclibc-musl.inc | 4 ++++
> >> >>  1 file changed, 4 insertions(+)
> >> >>
> >> >> diff --git a/meta/conf/distro/include/tclibc-musl.inc
> >> >> b/meta/conf/distro/include/tclibc-musl.inc
> >> >> index 3d3f6ac..99d52a1 100644
> >> >> --- a/meta/conf/distro/include/tclibc-musl.inc
> >> >> +++ b/meta/conf/distro/include/tclibc-musl.inc
> >> >> @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=
> >> >> "nativesdk-glibc"
> >> >>
> >> >>  CXXFLAGS += "-fvisibility-inlines-hidden"
> >> >>
> >> >> +# Workaround for musl libc does not support bfd lazy binding well
> >> >> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
> >> >> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> >> >> '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
> >> >> +
> >> >>  IMAGE_LINGUAS = ""
> >> >>
> >> >>  LIBC_DEPENDENCIES = "\
> >> >> --
> >> >> 2.7.4
> >> >>
> >> >
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >
> >
>

--001a114db3d6a6ce300555a7e6bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Khem:<div><br></div><div><pre class=3D"gmail-bz_commen=
t_text" id=3D"gmail-comment_text_5" style=3D"white-space:pre-wrap;width:50e=
m;color:rgb(0,0,0)">Just tried, but the error still could be observed with =
the patch applied, for instance:

| /home/peter-liu/opensource/poky-upstream/build/tmp/work/cortexa8hf-neon-p=
oky-linux-musleabi/m4/1.4.18-r0/recipe-sysroot-native/usr/bin/arm-poky-linu=
x-musleabi/../../libexec/arm-poky-linux-musleabi/gcc/arm-poky-linux-musleab=
i/7.1.0/ld: error: ../lib/libm4.a(progname.o): cannot make copy relocation =
for protected symbol &#39;program_invocation_name&#39;, defined in /home/pe=
ter-liu/opensource/poky-upstream/build/tmp/work/cortexa8hf-neon-poky-linux-=
musleabi/m4/1.4.18-r0/recipe-sysroot/usr/lib/libc.so
| collect2: error: ld returned 1 exit status
| Makefile:1554: recipe for target &#39;m4&#39; failed</pre><pre class=3D"g=
mail-bz_comment_text" id=3D"gmail-comment_text_5" style=3D"white-space:pre-=
wrap;width:50em;color:rgb(0,0,0)">//Ming Liu</pre></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">2017-07-31 23:56 GMT+02:00 Khem Raj =
<span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Tue, Jul 25, 2017 at 1:07 AM, Ming Liu &lt;<a href=3D"mail=
to:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; Hi, Burton:<br>
&gt;<br>
&gt; I also agree with you, your suggestion is better.<br>
&gt;<br>
&gt; Hi, Khem:<br>
&gt;<br>
&gt; But is this a bug of binutils? Or musl libc? Since I had only observed=
 this<br>
&gt; error with musl libc only, it did not occur with glibc.<br>
&gt;<br>
<br>
</span>Please try out a tentative patch here<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11679#c4" re=
l=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/s=
how_bug.cgi?id=3D11679#c4</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; //Ming Liu<br>
&gt;<br>
&gt; 2017-07-24 15:39 GMT+02:00 Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 24, 2017 at 6:18 AM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; If we&#39;re going to silently change the linker to bfd under=
 musl if<br>
&gt;&gt; &gt; ld-is-gold<br>
&gt;&gt; &gt; is selected, wouldn&#39;t it be better just to throw an excep=
tion if both<br>
&gt;&gt; &gt; musl<br>
&gt;&gt; &gt; and ld-is-gold are selected?=C2=A0 Better to tell the user so=
 they can not do<br>
&gt;&gt; &gt; that than silently ignore what they asked.<br>
&gt;&gt;<br>
&gt;&gt; yes, that would be better but I am skeptical of disabling it<br>
&gt;&gt; completely, we should<br>
&gt;&gt; create testcase and report it to binutils bugzilla<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ross<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 22 July 2017 at 14:30, &lt;<a href=3D"mailto:liu.ming50@gm=
ail.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external=
.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Quite a few such compiling issues were found when I was b=
uilding with<br>
&gt;&gt; &gt;&gt; following configs:<br>
&gt;&gt; &gt;&gt; ...<br>
&gt;&gt; &gt;&gt; MACHINE =3D &quot;beaglebone&quot;<br>
&gt;&gt; &gt;&gt; TCLIBC =3D &quot;musl&quot;<br>
&gt;&gt; &gt;&gt; DISTRO_FEATURES_append =3D &quot; ld-is-gold&quot;<br>
&gt;&gt; &gt;&gt; ...<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; fixed by adding bfd binding now ldflags.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu=
@external.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<=
br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/conf/distro/include/<wbr>tclibc-musl.inc | 4 +=
+++<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/conf/distro/include/<wbr>tclibc-musl.in=
c<br>
&gt;&gt; &gt;&gt; b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; &gt;&gt; index 3d3f6ac..99d52a1 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; &gt;&gt; +++ b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; &gt;&gt; @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/<wbr>native=
sdk-libiconv ?=3D<br>
&gt;&gt; &gt;&gt; &quot;nativesdk-glibc&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 CXXFLAGS +=3D &quot;-fvisibility-inlines-hidden&quo=
t;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +# Workaround for musl libc does not support bfd lazy bin=
ding well<br>
&gt;&gt; &gt;&gt; +# Refer to: <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D11679" rel=3D"noreferrer" target=3D"_blank">https://bugz=
illa.yoctoproject.<wbr>org/show_bug.cgi?id=3D11679</a><br>
&gt;&gt; &gt;&gt; +LDFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr=
>FEATURES&#39;, &#39;ld-is-gold&#39;,<br>
&gt;&gt; &gt;&gt; &#39;-Wl,-z,relro,-z,now -fuse-ld=3Dbfd&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;=C2=A0 IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 LIBC_DEPENDENCIES =3D &quot;\<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.7.4<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114db3d6a6ce300555a7e6bd--
