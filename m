Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC5B60118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 13:29:01 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id o7so1450840obl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=OSPAmeSCHP3YlnGf8fRm/GEmGiIIQNlbogFHZ3qkBpA=;
	b=KXWiougtsStdSzs/A9Ayru9hL+sYBmj82gaZs0pvpOyAMiqQ2pPvQQw0DyO0c3c0Ef
	Lr8TUsDjdYfGQ6x3HocVXuz2/MFsNdeyN3eJHYgQ7aFHRDXuo4BdWm5gSHajBmkr36mU
	Ygnolv60kJ2qik9DPBjYO5eHw7MiLiF1Q+tf8t2jsnHOWMXyDNAON5DBcqRQlhshwf+Q
	R0f47ksK8yf6pkcJXcZv0poJ9V3GgsgWSFhbKWYP1j/43uq9/gAGSzhmd6iMAOfBjt/W
	Os4Sp0RPeManTCf/I0zhWiFCr7b8AoGBj8Dk2nKXg24DRXUM/ebugY8MMoYTGDu654zY
	jjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=OSPAmeSCHP3YlnGf8fRm/GEmGiIIQNlbogFHZ3qkBpA=;
	b=VvzmF/Dvk5SfDHX3tUMwXF3hyVXRa+UcqKc9C4dqokvAbukSpoTL+R8FmxzSrnveY/
	uzOHQfVlH6ExE5Yvr1kn1VBijYGiuaKbjpqaoFpa4mwOt4AoY6j9K0Jw/4cCy/kBlnZZ
	Bkw6cwcDBjvok/dffdIbohvCxwQb4KHtSaawnU/7l/QMq1rUOwJb+ufBW+BGNZEhAYte
	kzMKYzANX32qAG33fME+BTfVisKiqv+dlu9emHw9QC7TbaiwHRV3QLsSUyDag/MLN7Dj
	McLC5In4WruHxzxLu30rJT03yaSCP9SmvJbIkOGzYh1B5+rFZME/bys41Mzr74AkwzhB
	3l4Q==
X-Gm-Message-State: AOPr4FU3MYRyKTvkHsxrjUe5NFTXldyyMSE5fsbcNanFbnRIpz6LdaDttiZapklxKMqLoVz+0jipO1e2tu9QOA==
MIME-Version: 1.0
X-Received: by 10.157.37.45 with SMTP id k42mr5728756otb.119.1463059739111;
	Thu, 12 May 2016 06:28:59 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Thu, 12 May 2016 06:28:58 -0700 (PDT)
In-Reply-To: <CADkTA4M3S=rRWD8+-j+qo0jCJ1AmSJjNEDOy61+AXMLJwRmv8w@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
	<CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
	<CADkTA4O+yfpCXFzpqWcE1sC0TKD6TH2Xfbt7xiA3ncxBkYikTg@mail.gmail.com>
	<CAMKF1sonno53gN+P8=Sdxems6pZnDEGqMCMNzObJsqByPjda7A@mail.gmail.com>
	<CADkTA4M3S=rRWD8+-j+qo0jCJ1AmSJjNEDOy61+AXMLJwRmv8w@mail.gmail.com>
Date: Thu, 12 May 2016 09:28:58 -0400
Message-ID: <CADkTA4MXrL5Z+TwOU=O9dJseT-mFWKBNka1D2Gvb+740zQ+jYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Thu, 12 May 2016 13:29:04 -0000
X-Groupsio-MsgNum: 82007
Content-Type: multipart/mixed; boundary=001a11352e460916ee0532a52407

--001a11352e460916ee0532a52407
Content-Type: multipart/alternative; boundary=001a11352e460916e80532a52405

--001a11352e460916e80532a52405
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 12:31 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, May 11, 2016 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, May 11, 2016 at 2:36 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> >
>> >
>> > On Wed, May 11, 2016 at 5:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Wed, May 11, 2016 at 2:27 PM, Bruce Ashfield
>> >> <bruce.ashfield@gmail.com> wrote:
>> >> >
>> >> >
>> >> > On Wed, May 11, 2016 at 1:35 PM, Khem Raj <raj.khem@gmail.com>
>> wrote:
>> >> >>
>> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> >
>> >> >
>> >> >
>> >> > These shouldn't be carried out of tree. So can you drop the
>> linux-yocto
>> >> > changes from the
>> >> > series, and I'll look at getting them integrated later.
>> >>
>> >> I could but, this series switches to using gcc6 which will start to
>> fail.
>> >
>> >
>> > I can coordinate the fix. We just don't carry patches like this for
>> linux
>> > yocto. As you
>> > can see, your series will no longer apply with the consolidated pull
>> > requests that
>> > I just sent.
>>
>> Just include these patches in your pull request and send a v2. I will
>> then drop it from my list.
>> since these patches should work fine with older gcc as well your
>> changes then can go in first
>> or along with my changes.
>>
>
> Sounds good. I'll have them out first thing in the morning Thursday.
>

The patches are not integrated into linux-yocto-4.4 and I added the patch
I've
attached o my zedd/kernel poky-contrib branch:

Bruce


>
> Bruce
>
>
>>
>> >
>> > Bruce
>> >
>> >>
>> >>
>> >> >
>> >> > Bruce
>> >> >
>> >> >>
>> >> >> ---
>> >> >>  ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50
>> >> >> ++++++++++++++++++++++
>> >> >>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  4 +-
>> >> >>  2 files changed, 53 insertions(+), 1 deletion(-)
>> >> >>  create mode 100644
>> >> >>
>> >> >>
>> meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> >> >>
>> >> >> diff --git
>> >> >>
>> >> >>
>> a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> >> >>
>> >> >>
>> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> >> >> new file mode 100644
>> >> >> index 0000000..05315ed
>> >> >> --- /dev/null
>> >> >> +++
>> >> >>
>> >> >>
>> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> >> >> @@ -0,0 +1,50 @@
>> >> >> +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00
>> 2001
>> >> >> +From: Khem Raj <raj.khem@gmail.com>
>> >> >> +Date: Mon, 25 Apr 2016 05:47:01 +0000
>> >> >> +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access
>> >> >> warning
>> >> >> +
>> >> >> +gcc-6 correctly warns about a out of bounds access
>> >> >> +
>> >> >> +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an
>> >> >> offset
>> >> >> greater than size of 'u64[32][1] {aka long long unsigned
>> int[32][1]}'
>> >> >> [-Warray-bounds]
>> >> >> +        offsetof(struct thread_fp_state, fpr[32][0]));
>> >> >> +                        ^
>> >> >> +
>> >> >> +check the end of array instead of beginning of next element to fix
>> >> >> this
>> >> >> +
>> >> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> >> +Cc: Kees Cook <keescook@chromium.org>
>> >> >> +Cc: Michael Ellerman <mpe@ellerman.id.au>
>> >> >> +Cc: Segher Boessenkool <segher@kernel.crashing.org>
>> >> >> +---
>> >> >> +Changes from v1 to v2:
>> >> >> +
>> >> >> +- Check for fpr[32] instead of fpr[31][1]
>> >> >> +
>> >> >> + arch/powerpc/kernel/ptrace.c | 4 ++--
>> >> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> >> >> +
>> >> >> +diff --git a/arch/powerpc/kernel/ptrace.c
>> >> >> b/arch/powerpc/kernel/ptrace.c
>> >> >> +index 737c0d0..b38fd08 100644
>> >> >> +--- a/arch/powerpc/kernel/ptrace.c
>> >> >> ++++ b/arch/powerpc/kernel/ptrace.c
>> >> >> +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target,
>> >> >> const
>> >> >> struct user_regset *regset,
>> >> >> +
>> >> >> + #else
>> >> >> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
>> >> >> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
>> >> >> ++                   offsetof(struct thread_fp_state, fpr[32]));
>> >> >> +
>> >> >> +       return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>> >> >> +                                  &target->thread.fp_state, 0, -1);
>> >> >> +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target,
>> >> >> const
>> >> >> struct user_regset *regset,
>> >> >> +       return 0;
>> >> >> + #else
>> >> >> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
>> >> >> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
>> >> >> ++                   offsetof(struct thread_fp_state, fpr[32]));
>> >> >> +
>> >> >> +       return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
>> >> >> +                                 &target->thread.fp_state, 0, -1);
>> >> >> +--
>> >> >> +1.9.1
>> >> >> +
>> >> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> >> >> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> >> >> index b74903e..fbb592a 100644
>> >> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> >> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> >> >> @@ -22,7 +22,9 @@ SRCREV_machine ?=
>> >> >> "b18090556c1d1b449233cd555c27a04d38272d6d"
>> >> >>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>> >> >>
>> >> >>  SRC_URI =
>> >> >>
>> >> >> "git://
>> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=$%7BKBRANCH%7D>
>> ;
>> >> >> \
>> >> >> -
>> >> >>
>> >> >> git://
>> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=$%7BKMETA%7D>
>> "
>> >> >> +
>> >> >>
>> >> >> git://
>> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=$%7BKMETA%7D>
>> >> >> \
>> >> >> +
>> >> >>
>> file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> >> >> \
>> >> >> +"
>> >> >>
>> >> >>  LINUX_VERSION ?= "4.4.3"
>> >> >>
>> >> >> --
>> >> >> 2.8.2
>> >> >>
>> >> >> --
>> >> >> _______________________________________________
>> >> >> Openembedded-core mailing list
>> >> >> Openembedded-core@lists.openembedded.org
>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> > thee at
>> >> > its end"
>> >
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at
>> > its end"
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

--001a11352e460916e80532a52405
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 12, 2016 at 12:31 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">=
On Wed, May 11, 2016 at 5:55 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">On Wed, May 11, 2016 at 2:36 PM, Bruce Ashfi=
eld<br>
<span>&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 11, 2016 at 5:30 PM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 11, 2016 at 2:27 PM, Bruce Ashfield<br>
&gt;&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, May 11, 2016 at 1:35 PM, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; These shouldn&#39;t be carried out of tree. So can you drop t=
he linux-yocto<br>
&gt;&gt; &gt; changes from the<br>
&gt;&gt; &gt; series, and I&#39;ll look at getting them integrated later.<b=
r>
&gt;&gt;<br>
&gt;&gt; I could but, this series switches to using gcc6 which will start t=
o fail.<br>
&gt;<br>
&gt;<br>
&gt; I can coordinate the fix. We just don&#39;t carry patches like this fo=
r linux<br>
&gt; yocto. As you<br>
&gt; can see, your series will no longer apply with the consolidated pull<b=
r>
&gt; requests that<br>
&gt; I just sent.<br>
<br>
</span>Just include these patches in your pull request and send a v2. I wil=
l<br>
then drop it from my list.<br>
since these patches should work fine with older gcc as well your<br>
changes then can go in first<br>
or along with my changes.<br></blockquote><div><br></div></span><div>Sounds=
 good. I&#39;ll have them out first thing in the morning Thursday.</div></d=
iv></div></div></blockquote><div><br></div><div>The patches are not integra=
ted into linux-yocto-4.4 and I added the patch I&#39;ve</div><div>attached =
o my zedd/kernel poky-contrib branch:</div><div><br></div><div>Bruce<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><span class=3D""><font color=3D"#888888"><=
div><br></div><div>Bruce</div></font></span><div><div class=3D"h5"><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">
<div><div><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Bruce<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 ...ace-Fix-out-of-bounds-array-access-warnin.patch =
| 50<br>
&gt;&gt; &gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-y=
octo_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 2 files changed, 53 insertions(+), 1 deletion(-)<br=
>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace=
-Fix-out-of-bounds-array-access-warnin.patch<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptra=
ce-Fix-out-of-bounds-array-access-warnin.patch<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptra=
ce-Fix-out-of-bounds-array-access-warnin.patch<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 0000000..05315ed<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptra=
ce-Fix-out-of-bounds-array-access-warnin.patch<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,50 @@<br>
&gt;&gt; &gt;&gt; +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17=
 00:00:00 2001<br>
&gt;&gt; &gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; +Date: Mon, 25 Apr 2016 05:47:01 +0000<br>
&gt;&gt; &gt;&gt; +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds ar=
ray access<br>
&gt;&gt; &gt;&gt; warning<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +gcc-6 correctly warns about a out of bounds access<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 d=
enotes an<br>
&gt;&gt; &gt;&gt; offset<br>
&gt;&gt; &gt;&gt; greater than size of &#39;u64[32][1] {aka long long unsig=
ned int[32][1]}&#39;<br>
&gt;&gt; &gt;&gt; [-Warray-bounds]<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(struct thread_fp_st=
ate, fpr[32][0]));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +check the end of array instead of beginning of next elem=
ent to fix<br>
&gt;&gt; &gt;&gt; this<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; +Cc: Kees Cook &lt;<a href=3D"mailto:keescook@chromium.or=
g" target=3D"_blank">keescook@chromium.org</a>&gt;<br>
&gt;&gt; &gt;&gt; +Cc: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.=
id.au" target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
&gt;&gt; &gt;&gt; +Cc: Segher Boessenkool &lt;<a href=3D"mailto:segher@kern=
el.crashing.org" target=3D"_blank">segher@kernel.crashing.org</a>&gt;<br>
&gt;&gt; &gt;&gt; +---<br>
&gt;&gt; &gt;&gt; +Changes from v1 to v2:<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +- Check for fpr[32] instead of fpr[31][1]<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + arch/powerpc/kernel/ptrace.c | 4 ++--<br>
&gt;&gt; &gt;&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +diff --git a/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; &gt;&gt; b/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; &gt;&gt; +index 737c0d0..b38fd08 100644<br>
&gt;&gt; &gt;&gt; +--- a/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; &gt;&gt; ++++ b/arch/powerpc/kernel/ptrace.c<br>
&gt;&gt; &gt;&gt; +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struc=
t *target,<br>
&gt;&gt; &gt;&gt; const<br>
&gt;&gt; &gt;&gt; struct user_regset *regset,<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + #else<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct =
thread_fp_state, fpscr) !=3D<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offsetof(struct thread_fp_state, fpr[32][0]));<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offsetof(struct thread_fp_state, fpr[32]));<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyout(&a=
mp;pos, &amp;count, &amp;kbuf, &amp;ubuf,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;target-=
&gt;thread.fp_state, 0, -1);<br>
&gt;&gt; &gt;&gt; +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struc=
t *target,<br>
&gt;&gt; &gt;&gt; const<br>
&gt;&gt; &gt;&gt; struct user_regset *regset,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt;&gt; + #else<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(offsetof(struct =
thread_fp_state, fpscr) !=3D<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offsetof(struct thread_fp_state, fpr[32][0]));<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offsetof(struct thread_fp_state, fpr[32]));<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return user_regset_copyin(&am=
p;pos, &amp;count, &amp;kbuf, &amp;ubuf,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;target-&=
gt;thread.fp_state, 0, -1);<br>
&gt;&gt; &gt;&gt; +--<br>
&gt;&gt; &gt;&gt; +1.9.1<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb=
</a><br>
&gt;&gt; &gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; &gt;&gt; index b74903e..fbb592a 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-y=
octo_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br=
>
&gt;&gt; &gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-y=
octo_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br=
>
&gt;&gt; &gt;&gt; @@ -22,7 +22,9 @@ SRCREV_machine ?=3D<br>
&gt;&gt; &gt;&gt; &quot;b18090556c1d1b449233cd555c27a04d38272d6d&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRCREV_meta ?=3D &quot;9ab4787fe2aea2ae0fcc31a5e067=
eaba19ef64c8&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI =3D<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.4.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/linux-yocto-4.4.git;name=3Dmachine;bra=
nch=3D${KBRANCH}</a>;<br>
&gt;&gt; &gt;&gt; \<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; git://<a href=3D"http://git.yoctoproject.org/yocto-kernel=
-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D$%7BKMETA%7=
D" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-c=
ache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}</a>&=
quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; git://<a href=3D"http://git.yoctoproject.org/yocto-kernel=
-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D$%7BKMETA%7=
D" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-c=
ache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}</a><=
br>
&gt;&gt; &gt;&gt; \<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access=
-warnin.patch<br>
&gt;&gt; &gt;&gt; \<br>
&gt;&gt; &gt;&gt; +&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 LINUX_VERSION ?=3D &quot;4.4.3&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.8.2<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; &quot;Thou shalt not follow the NULL pointer, for chaos and m=
adness await<br>
&gt;&gt; &gt; thee at<br>
&gt;&gt; &gt; its end&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
</div></div></blockquote></div></div></div><div><div class=3D"h5"><br><br c=
lear=3D"all"><div><br></div>-- <br><div>&quot;Thou shalt not follow the NUL=
L pointer, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11352e460916e80532a52405--

--001a11352e460916ee0532a52407
Content-Type: application/octet-stream; 
	name="0001-linux-yocto-4.4-gcc6-build-fixes-powerpc-and-mips.patch"
Content-Disposition: attachment; 
	filename="0001-linux-yocto-4.4-gcc6-build-fixes-powerpc-and-mips.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_io4bzbxq0

RnJvbSAxZjdhMTMxOTNjMDEzZDViODA5NTEyNGE2NzhmYjQzMWE5ZGRiZDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogVGh1LCAxMiBNYXkgMjAxNiAwMTowNTo1MyAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpbnV4LXlvY3RvLzQuNDogZ2NjNiBidWlsZCBmaXhlcyAocG93ZXJwYyBhbmQgbWlw
cykKCktoZW0gcHJvdmlkZWQgZml4ZXMgdG8gZml4IGdjYzYgYnVpbGQgaXNzdWVzLCB0aGVzZSBh
cmUgc2FmZSBmb3IKYWxsIGdjYyB2ZXJzaW9ucywgc28gd2UgaW50ZWdyYXRlIHRoZW0gZGlyZWN0
bHkuCgpTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJpdmVyLmNvbT4KLS0t
CiBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzQuNC5iYiAgIHwgIDQg
KystLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by10aW55XzQuNC5iYiB8
ICA0ICsrLS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC40LmJiICAg
ICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
aW51eC9saW51eC15b2N0by1ydF80LjQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvLXJ0XzQuNC5iYgppbmRleCA1ZTM5Mzc0MDliMWUuLmZlZWYyOWYwZjk2NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjQuYmIKQEAg
LTIsOCArMiw4IEBAIEtCUkFOQ0ggPz0gInN0YW5kYXJkL3ByZWVtcHQtcnQiCiAKIHJlcXVpcmUg
cmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8uaW5jCiAKLVNSQ1JFVl9tYWNoaW5lID89
ICI0NDlmZTFkY2EyYzFmOTcyZjFlYzAyMDkxYTIwNjkxZjNlMTlhMjhiIgotU1JDUkVWX21ldGEg
Pz0gImI3Y2UwNzY0NDdjMGUzY2MwN2Y4ZDNlZDRhMTEwNzBmZGVhZTQxZTYiCitTUkNSRVZfbWFj
aGluZSA/PSAiN2VmM2ZlNTY4MjdiZDljMjAwMjFlM2E1MmJjMzZlYmQ0YzZiMmNlMyIKK1NSQ1JF
Vl9tZXRhID89ICJkNmVlNDAyZDQ2MTA0OGNmMWFmZDEwMzc1ZmVlNTc2OWMwNmQyMWQ2IgogCiBT
UkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2xpbnV4LXlvY3RvLTQuNC5naXQ7
YnJhbmNoPSR7S0JSQU5DSH07bmFtZT1tYWNoaW5lIFwKICAgICAgICAgICAgZ2l0Oi8vZ2l0Lnlv
Y3RvcHJvamVjdC5vcmcveW9jdG8ta2VybmVsLWNhY2hlO3R5cGU9a21ldGE7bmFtZT1tZXRhO2Jy
YW5jaD15b2N0by00LjQ7ZGVzdHN1ZmZpeD0ke0tNRVRBfSIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV80LjQuYmIgYi9tZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfNC40LmJiCmluZGV4IGFiYWZlNzU2ZWI3YS4u
OTNmZmUxODljZWE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4
LXlvY3RvLXRpbnlfNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgt
eW9jdG8tdGlueV80LjQuYmIKQEAgLTksOCArOSw4IEBAIExJTlVYX1ZFUlNJT04gPz0gIjQuNC4x
MCIKIEtNRVRBID0gImtlcm5lbC1tZXRhIgogS0NPTkZfQlNQX0FVRElUX0xFVkVMID0gIjIiCiAK
LVNSQ1JFVl9tYWNoaW5lID89ICJmZTdmZjM4NDQ4ZDUzMGRiMjdhYzMxY2JiMDg2Y2I2ZmRmOTRi
YjdmIgotU1JDUkVWX21ldGEgPz0gImI3Y2UwNzY0NDdjMGUzY2MwN2Y4ZDNlZDRhMTEwNzBmZGVh
ZTQxZTYiCitTUkNSRVZfbWFjaGluZSA/PSAiNTc4ZmYyYTg4Njc2ZDIwNDM5ZGJmMzg3Nzc2ODM3
MGQwNmEyMmQ4ZiIKK1NSQ1JFVl9tZXRhID89ICJkNmVlNDAyZDQ2MTA0OGNmMWFmZDEwMzc1ZmVl
NTc2OWMwNmQyMWQ2IgogCiBQViA9ICIke0xJTlVYX1ZFUlNJT059K2dpdCR7U1JDUFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzQuNC5iYiBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC40LmJiCmluZGV4IGE2NjVi
NWNlODgwNy4uYTk4ZjlmYTlhOWMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xp
bnV4L2xpbnV4LXlvY3RvXzQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvXzQuNC5iYgpAQCAtMTEsMTUgKzExLDE1IEBAIEtCUkFOQ0hfcWVtdXg4NiAgPz0g
InN0YW5kYXJkL2Jhc2UiCiBLQlJBTkNIX3FlbXV4ODYtNjQgPz0gInN0YW5kYXJkL2Jhc2UiCiBL
QlJBTkNIX3FlbXVtaXBzNjQgPz0gInN0YW5kYXJkL210aS1tYWx0YTY0IgogCi1TUkNSRVZfbWFj
aGluZV9xZW11YXJtID89ICJiZGRhOTcwMTRlNTUyMDBlNzA0ZWNkOGQxMTJkYTA5MTc2ZGNiN2Rj
IgotU1JDUkVWX21hY2hpbmVfcWVtdWFybTY0ID89ICJmZTdmZjM4NDQ4ZDUzMGRiMjdhYzMxY2Ji
MDg2Y2I2ZmRmOTRiYjdmIgotU1JDUkVWX21hY2hpbmVfcWVtdW1pcHMgPz0gImY2MDg4NzU1NWY3
OGFlNWY1MzM4ZDQxMTgxZTg0ODA4MjEwOTQyOWIiCi1TUkNSRVZfbWFjaGluZV9xZW11cHBjID89
ICJmZTdmZjM4NDQ4ZDUzMGRiMjdhYzMxY2JiMDg2Y2I2ZmRmOTRiYjdmIgotU1JDUkVWX21hY2hp
bmVfcWVtdXg4NiA/PSAiZmU3ZmYzODQ0OGQ1MzBkYjI3YWMzMWNiYjA4NmNiNmZkZjk0YmI3ZiIK
LVNSQ1JFVl9tYWNoaW5lX3FlbXV4ODYtNjQgPz0gImZlN2ZmMzg0NDhkNTMwZGIyN2FjMzFjYmIw
ODZjYjZmZGY5NGJiN2YiCi1TUkNSRVZfbWFjaGluZV9xZW11bWlwczY0ID89ICJiNzgzNTEyMDYy
YzUwODFmYTliMDFlODllODExZDA1MDhlNjI4OTVmIgotU1JDUkVWX21hY2hpbmUgPz0gImZlN2Zm
Mzg0NDhkNTMwZGIyN2FjMzFjYmIwODZjYjZmZGY5NGJiN2YiCi1TUkNSRVZfbWV0YSA/PSAiYjdj
ZTA3NjQ0N2MwZTNjYzA3ZjhkM2VkNGExMTA3MGZkZWFlNDFlNiIKK1NSQ1JFVl9tYWNoaW5lX3Fl
bXVhcm0gPz0gIjFkMzQzYjMyN2Q5Nzg0M2RlNGEzMmZkYTkwMTViYzg3YTQ2ZGVhOWIiCitTUkNS
RVZfbWFjaGluZV9xZW11YXJtNjQgPz0gIjU3OGZmMmE4ODY3NmQyMDQzOWRiZjM4Nzc3NjgzNzBk
MDZhMjJkOGYiCitTUkNSRVZfbWFjaGluZV9xZW11bWlwcyA/PSAiZjg5ZGQ4MzM2ZGNiMGI3YmYw
MjkxYWVlN2VlMzM1MzE1NjRlYTNiNSIKK1NSQ1JFVl9tYWNoaW5lX3FlbXVwcGMgPz0gIjU3OGZm
MmE4ODY3NmQyMDQzOWRiZjM4Nzc3NjgzNzBkMDZhMjJkOGYiCitTUkNSRVZfbWFjaGluZV9xZW11
eDg2ID89ICI1NzhmZjJhODg2NzZkMjA0MzlkYmYzODc3NzY4MzcwZDA2YTIyZDhmIgorU1JDUkVW
X21hY2hpbmVfcWVtdXg4Ni02NCA/PSAiNTc4ZmYyYTg4Njc2ZDIwNDM5ZGJmMzg3Nzc2ODM3MGQw
NmEyMmQ4ZiIKK1NSQ1JFVl9tYWNoaW5lX3FlbXVtaXBzNjQgPz0gIjVmYWEzYzhkZTQ5MTQzNTg0
MjAyNGIyNGI2YTk1ZmNjZGJlM2Y3MmEiCitTUkNSRVZfbWFjaGluZSA/PSAiNTc4ZmYyYTg4Njc2
ZDIwNDM5ZGJmMzg3Nzc2ODM3MGQwNmEyMmQ4ZiIKK1NSQ1JFVl9tZXRhID89ICJkNmVlNDAyZDQ2
MTA0OGNmMWFmZDEwMzc1ZmVlNTc2OWMwNmQyMWQ2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL2xpbnV4LXlvY3RvLTQuNC5naXQ7bmFtZT1tYWNoaW5lO2JyYW5jaD0k
e0tCUkFOQ0h9OyBcCiAgICAgICAgICAgIGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3Rv
LWtlcm5lbC1jYWNoZTt0eXBlPWttZXRhO25hbWU9bWV0YTticmFuY2g9eW9jdG8tNC40O2Rlc3Rz
dWZmaXg9JHtLTUVUQX0iCi0tIAoyLjUuMAoK

--001a11352e460916ee0532a52407--
