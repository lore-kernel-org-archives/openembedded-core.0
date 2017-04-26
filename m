Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE0377CE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 12:25:46 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id c45so163997224qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QNunvFc/bwdEKScbFYCSI2uWnUC5x1uIb5NJKSV2JEI=;
	b=SRXOGlWfOeUc/L1ke4S7YNdk7h8YWaelmA8o3J/OrqPxJmnDZT5X6ZRyFnzXmHPHgK
	Ux90DhKHPBcxyp22yFjnFxYYvIWC53M+ByyjcQDK48+E5gjx1e3LGau1rDU5iL2ky+K3
	cOqpw0YKocp7GlZloGFjbqJs87EPEUR1kwhScOM7rOOopaA6QySh+/KHHZ4QA6jZO7O7
	PgwH8KutAHSRtBNS4SqVJ+5i35XaPtmFpg2kaJRcBKwo1yzwfmpGuIafAe9m1At95NjE
	koLOCVVyeiBPrPizqWUTzJmeYABqfH2zj9xVI7hhbAXa0avPz5gL26UTDRrcnqPr/j3w
	Y36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QNunvFc/bwdEKScbFYCSI2uWnUC5x1uIb5NJKSV2JEI=;
	b=itQ63Eo5M6c3xzLlFNot4qFVGBoV4iHZOr0EMOagXy/245PbyLSrpRsAW7YOBKoTkk
	OKU6p1tDdvitLVrk+0W7Nsb/hY6GQogg/afcMnL/4hbct0cFQFaHsh/Ve13d4cnxew4/
	5Zqe2zGZB1d01aE3Fzdsd3fbX0MKG1lwAq8KBe36NJbSLaZL0Daxbv4Qe+bP7J+x9mlJ
	CfP+ha0tALI72RdTUsPq+qHBwz+tEwEELLQ7uJ43MJV0SU9oWc3zhekUnXTl0fLfTtfb
	JH8Twoi/PAMjKYxhzueU/Wk6dkKSjUqkcoFFhjdgFj4cz9rsO2tQhSadoRkh4JuNP9jR
	Gh9A==
X-Gm-Message-State: AN3rC/5Obm4UMQWc3OlTLFTjYTaB43CVdiO1axPjH4cwh7tlJwy98Ejy
	jxUl5AnrlpXngRuB5qpJUYoNAMwYe+YV
X-Received: by 10.200.41.108 with SMTP id z41mr34607685qtz.68.1493209547147;
	Wed, 26 Apr 2017 05:25:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 26 Apr 2017 05:25:26 -0700 (PDT)
In-Reply-To: <CADkTA4P88ijjCGQ_GEU=4k==zsVQWpLoYW4U6h6YzQ1iYB_i4Q@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
	<1493069228.19076.121.camel@linuxfoundation.org>
	<CADkTA4M1m5RLNXyRjyyybD+jNzZbQqkrW+SDtjHu3dP28rb-aA@mail.gmail.com>
	<1493125780.19076.132.camel@linuxfoundation.org>
	<CADkTA4P88ijjCGQ_GEU=4k==zsVQWpLoYW4U6h6YzQ1iYB_i4Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Apr 2017 13:25:26 +0100
Message-ID: <CAJTo0LYpWjCCkq_m66VQhOMgSZGGo+Q7_NuZdru1tohWY4cW2A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Wed, 26 Apr 2017 12:25:46 -0000
Content-Type: multipart/alternative; boundary=001a11405e8aa217e4054e10f0e6

--001a11405e8aa217e4054e10f0e6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Not sure if it's related to this problem, but this happened in selftest
last night:

Log data follows:
| DEBUG: Executing shell function do_kernel_metadata
| ERROR: Could not generate configuration queue for qemux86.
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/bu=
ild/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0/temp/run.do_ke=
rnel_metadata.37215:
line 190: spp: command not found

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/bu=
ild/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0/temp/run.do_ke=
rnel_metadata.37215:
line 191: kgit: command not found

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/bu=
ild/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0/temp/run.do_ke=
rnel_metadata.37215:
line 197: scc: command not found

| ERROR: Function failed: do_kernel_metadata (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/bu=
ild/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0/temp/log.do_ke=
rnel_metadata.37215)

Ross

On 25 April 2017 at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

>
>
> On Tue, Apr 25, 2017 at 9:09 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:
>> > On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> > > On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
>> > > >
>> > > >
>> > > > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@g
>> > > mail
>> > > > .com> wrote:
>> > > > >
>> > > > >
>> > > > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gma
>> > > il.c
>> > > > > om> wrote:
>> > >
>> > > >
>> > > > Richard/Ross: are you seeing this same thing on the autobuilder ?
>> > > >
>> > > > There's some incantation or config that I'm missing, I assume
>> > > this is
>> > > > a straight qemux86 config
>> > > > with a bitbake of something like core-image-minimal ?
>> > >
>> > > We're not seeing this on the autobuilders. I do suspect something
>> > > in
>> > > the handling of extra patches or cfg fragments from SRC_URI if I
>> > > had to
>> > > guess. That certainly was the trigger last time I saw this.
>> > Yah, that's the kicker, I'm still carrying your patch for binfmt_elf,
>> > and I added two of my own
>> > + config fragments, and I can't trigger anything.
>>
>> I managed to reproduce breakage. With master and my separate patch in
>> SRC_URI:
>>
>>
> This particular issue should be fixed with with patch I sent, late Friday
> night:
>
> [OE-core] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches clean
> stage
>
> Martin applied it to his builds and is still seeing an issue in the actua=
l
> patching phase.
> I'm currently not able to reproduce it.
>
> If you do have that patch applied, I'm definitely interested. If you
> don't, and have two
> minutes to re-run with that applied .. I'd be interested to hear if the
> build works after
> that.
>
> Cheers,
>
> Bruce
>
> $ bitbake linux-yocto
>> $ bitbake linux-yocto -c kernel_checkout -f
>> $ bitbake linux-yocto
>>
>> ERROR: linux-yocto-4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0
>> do_validate_branches: Function failed: do_validate_branches (log file is
>> located at /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/linu
>> x-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.
>> do_validate_branches.116726)
>> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w
>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726
>> Log data follows:
>> | DEBUG: Executing shell function do_validate_branches
>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>> | 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=99:=
 File exists
>> | 1493125671.370592:
>> | 1493125671.3742917: [ERROR] Can't find patch dir at
>> ./patches/standard/base
>> | 1493125671.3742917: usage: kgit s2q
>> | 1493125671.3743172: WARNING: exit code 1 from a shell command.
>> | 1493125671.3745801: ERROR: Function failed: do_validate_branches (log
>> file is located at /media/build1/poky/build/tmp/w
>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a11405e8aa217e4054e10f0e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure if it&#39;s related to this problem, but this hap=
pened in selftest last night:<br><br>Log data follows:<br>| DEBUG: Executin=
g shell function do_kernel_metadata<br>| ERROR: Could not generate configur=
ation queue for qemux86.<br>| /home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4=
.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 190: spp: command n=
ot found<div><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-o=
e-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git99=
9-r0/temp/run.do_kernel_metadata.37215: line 191: kgit: command not found</=
div><div><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-se=
lftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0=
/temp/run.do_kernel_metadata.37215: line 197: scc: command not found</div><=
div><br>| ERROR: Function failed: do_kernel_metadata (log file is located a=
t /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/=
build/tmp/work/qemux86-poky-linux/linux-yocto/4.10.9+git999-r0/temp/log.do_=
kernel_metadata.37215)<br><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 25 April 2017 at 14:17, Bruce As=
hfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote"><div><div class=3D"h5">On Tue, Apr 25, 2017 at 9:=
09 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>=
n.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><span>On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:<br>
&gt; On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundatio<wbr>n.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield &lt;bruce.as=
hfield@g<br>
&gt; &gt; mail<br>
&gt; &gt; &gt; .com&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa &lt;marti=
n.jansa@gma<br>
&gt; &gt; il.c<br>
&gt; &gt; &gt; &gt; om&gt; wrote:<br>
&gt; &gt;=C2=A0<br>
&gt; &gt; &gt;<br>
</span><span>&gt; &gt; &gt; Richard/Ross: are you seeing this same thing on=
 the autobuilder ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There&#39;s some incantation or config that I&#39;m missing,=
 I assume<br>
&gt; &gt; this is<br>
&gt; &gt; &gt; a straight qemux86 config<br>
&gt; &gt; &gt; with a bitbake of something like core-image-minimal ?<br>
&gt; &gt;<br>
&gt; &gt; We&#39;re not seeing this on the autobuilders. I do suspect somet=
hing<br>
&gt; &gt; in<br>
&gt; &gt; the handling of extra patches or cfg fragments from SRC_URI if I<=
br>
&gt; &gt; had to<br>
&gt; &gt; guess. That certainly was the trigger last time I saw this.<br>
&gt; Yah, that&#39;s the kicker, I&#39;m still carrying your patch for binf=
mt_elf,<br>
&gt; and I added two of my own<br>
&gt; + config fragments, and I can&#39;t trigger anything.<br>
<br>
</span>I managed to reproduce breakage. With master and my separate patch i=
n<br>
SRC_URI:<br>
<br></blockquote><div><br></div></div></div><div>This particular issue shou=
ld be fixed with with patch I sent, late Friday night:</div><div><br></div>=
<div>[OE-core] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches cl=
ean stage<br></div><div><br></div><div>Martin applied it to his builds and =
is still seeing an issue in the actual patching phase.</div><div>I&#39;m cu=
rrently not able to reproduce it.</div><div><br></div><div>If you do have t=
hat patch applied, I&#39;m definitely interested. If you don&#39;t, and hav=
e two</div><div>minutes to re-run with that applied .. I&#39;d be intereste=
d to hear if the build works after</div><div>that.</div><div><br></div><div=
>Cheers,</div><div><br></div><div>Bruce</div><span class=3D""><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
$ bitbake linux-yocto<br>
$ bitbake linux-yocto -c kernel_checkout -f<br>
$ bitbake linux-yocto<br>
<br>
ERROR: linux-yocto-4.10.9+gitAUTOINC+<wbr>ad2e885015_fe0fb8da3d-r0 do_valid=
ate_branches: Function failed: do_validate_branches (log file is located at=
 /media/build1/poky/build/tmp/w<wbr>ork/qemux86_64-poky-linux/linu<wbr>x-yo=
cto/4.10.9+gitAUTOINC+ad2e<wbr>885015_fe0fb8da3d-r0/temp/log.<wbr>do_valida=
te_branches.116726)<br>
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w<wbr>ork=
/qemux86_64-poky-linux/linu<wbr>x-yocto/4.10.9+gitAUTOINC+ad2e<wbr>885015_f=
e0fb8da3d-r0/temp/log.<wbr>do_validate_branches.116726<br>
<span>Log data follows:<br>
| DEBUG: Executing shell function do_validate_branches<br>
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base<br>
</span>| 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=
=99: File exists<br>
| 1493125671.370592:<br>
| 1493125671.3742917: [ERROR] Can&#39;t find patch dir at ./patches/standar=
d/base<br>
| 1493125671.3742917: usage: kgit s2q<br>
| 1493125671.3743172: WARNING: exit code 1 from a shell command.<br>
| 1493125671.3745801: ERROR: Function failed: do_validate_branches (log fil=
e is located at /media/build1/poky/build/tmp/w<wbr>ork/qemux86_64-poky-linu=
x/linu<wbr>x-yocto/4.10.9+gitAUTOINC+ad2e<wbr>885015_fe0fb8da3d-r0/temp/log=
.<wbr>do_validate_branches.116726)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></span></div><br><br clear=3D"all"><span class=3D""><div><br><=
/div>-- <br><div class=3D"m_-249460446374544245gmail-m_1060650381739365254g=
mail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and=
 madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>

--001a11405e8aa217e4054e10f0e6--
