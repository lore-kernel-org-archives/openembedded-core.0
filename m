Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 711DE77D86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:32:48 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r190so24006356wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j5qfr07xtCb+Wz8LSMVHYlcv0JKLleooeP65ai6NlDc=;
	b=UnBLIallUmcBjqy0dRUJ/GQG5+uHEtiZBAOHAzaVlY6yj1004pzrR5taPPOgdRBL6H
	zrCUh5LXxoJh6n+2dtE4GF/PlH3P4T9oDUsZzbieBZhlPhjRxJDHjAyleQnqoUIu/0uZ
	LcUTp+kLZeymAX1dbnrXueUMTadUP2cs3oI4r0tBZx1VXuhZtqZ+cUcIrjywnNtRLWmI
	kQQ1HQqy8YWNJJA2DnopDKaaUEtvRXbj+49HfFYMFnj8KWUmeI6j32OeAV56pnFfluOA
	0Ptd/tsnbhZr7E18t+xIIcn9iRK/E26Hr3DTV7nYry6b5YHs5aWmzinIpuyvm16V4PW4
	RFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j5qfr07xtCb+Wz8LSMVHYlcv0JKLleooeP65ai6NlDc=;
	b=uDLyedFEtFVYjo+mmK1cVvCou9g4f8D9Umd8HraaqhXO3V7WfCnBQnhQxWx5GygKrr
	hOEGP2wC+bwxReyB9NlRO2k5arFF/M0w6j8cBEk2ad/+WkWsk3vbQFqTwqbesa3hk9An
	mXYGnaT6p3cJwd3sAPbQ4oPDiKNOn1h68TG8hwYLrX9eXLS54C1kfK4pm4U9SqzHbC/O
	RjB8854X/IRMD9Fy0EQyYKFnnKkZejzn185i45OTX7zqytzAUiFf233mo+fXYsBy+raW
	5sdzg6WG/It13czJJBoMhVw/+KhMMNFlA7YOKffnbCDrXM8zZSxhOLBPRdn2UHsbwdnQ
	rGIA==
X-Gm-Message-State: AN3rC/4yJLsWE4k5yl7WH9yqP3K1awPtO76l77H7oRUiAF6EY9+0doXy
	YWdlrBr98CQt+Acg2qzOZQ+5/cpbWg==
X-Received: by 10.80.144.206 with SMTP id d14mr5542733eda.9.1493310770018;
	Thu, 27 Apr 2017 09:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 09:32:49 -0700 (PDT)
In-Reply-To: <CADkTA4PSsEdfsWEpVeoMSJEyfLgaU-sdGgzso4+swTHp0_nutA@mail.gmail.com>
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
	<CAJTo0LYpWjCCkq_m66VQhOMgSZGGo+Q7_NuZdru1tohWY4cW2A@mail.gmail.com>
	<CADkTA4PSsEdfsWEpVeoMSJEyfLgaU-sdGgzso4+swTHp0_nutA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 18:32:49 +0200
Message-ID: <CA+chaQebM+2OXLcsgH-86n+vyka+L5_VZ3CO+5Qd1zdGRHo_2A@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 16:32:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c0e479efc8049054e28816f

--94eb2c0e479efc8049054e28816f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yesterday I've deleted all workspaces where I was getting this error and
since then I haven't seen one.

So maybe the key to reproduce this was to run builds without the fix
applied and then apply the fix and execute another build without removing
the tmp-glibc (so that it tries to do incremental build from the bad state
created before without this fix).

On Wed, Apr 26, 2017 at 2:45 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, Apr 26, 2017 at 8:25 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> Not sure if it's related to this problem, but this happened in selftest
>> last night:
>>
>> Log data follows:
>> | DEBUG: Executing shell function do_kernel_metadata
>> | ERROR: Could not generate configuration queue for qemux86.
>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-
>> selftest/build/build/tmp/work/qemux86-poky-linux/linux-
>> yocto/4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 190: spp:
>> command not found
>>
>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-
>> selftest/build/build/tmp/work/qemux86-poky-linux/linux-
>> yocto/4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 191:
>> kgit: command not found
>>
>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-
>> selftest/build/build/tmp/work/qemux86-poky-linux/linux-
>> yocto/4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 197: scc:
>> command not found
>>
>> | ERROR: Function failed: do_kernel_metadata (log file is located at
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-
>> selftest/build/build/tmp/work/qemux86-poky-linux/linux-
>> yocto/4.10.9+git999-r0/temp/log.do_kernel_metadata.37215)
>>
>
>
> Not related to the patching error, but related to my change where I
> modified
> the native depends.  For whatever reason that ran before the
> do_validate_branches,
> which is what pulls in the dependency.
>
> I can't think of how that could happen, but there seems to be some tasks
> that are now racing.
>
> I'll revisit the patch and put the dependency in both places just to be
> sure.
>
> Bruce
>
>
>>
>>
>> Ross
>>
>> On 25 April 2017 at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>>>
>>>
>>> On Tue, Apr 25, 2017 at 9:09 AM, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:
>>>> > On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie
>>>> > <richard.purdie@linuxfoundation.org> wrote:
>>>> > > On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
>>>> > > >
>>>> > > >
>>>> > > > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@=
g
>>>> > > mail
>>>> > > > .com> wrote:
>>>> > > > >
>>>> > > > >
>>>> > > > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gm=
a
>>>> > > il.c
>>>> > > > > om> wrote:
>>>> > >
>>>> > > >
>>>> > > > Richard/Ross: are you seeing this same thing on the autobuilder =
?
>>>> > > >
>>>> > > > There's some incantation or config that I'm missing, I assume
>>>> > > this is
>>>> > > > a straight qemux86 config
>>>> > > > with a bitbake of something like core-image-minimal ?
>>>> > >
>>>> > > We're not seeing this on the autobuilders. I do suspect something
>>>> > > in
>>>> > > the handling of extra patches or cfg fragments from SRC_URI if I
>>>> > > had to
>>>> > > guess. That certainly was the trigger last time I saw this.
>>>> > Yah, that's the kicker, I'm still carrying your patch for binfmt_elf=
,
>>>> > and I added two of my own
>>>> > + config fragments, and I can't trigger anything.
>>>>
>>>> I managed to reproduce breakage. With master and my separate patch in
>>>> SRC_URI:
>>>>
>>>>
>>> This particular issue should be fixed with with patch I sent, late
>>> Friday night:
>>>
>>> [OE-core] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches
>>> clean stage
>>>
>>> Martin applied it to his builds and is still seeing an issue in the
>>> actual patching phase.
>>> I'm currently not able to reproduce it.
>>>
>>> If you do have that patch applied, I'm definitely interested. If you
>>> don't, and have two
>>> minutes to re-run with that applied .. I'd be interested to hear if the
>>> build works after
>>> that.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>> $ bitbake linux-yocto
>>>> $ bitbake linux-yocto -c kernel_checkout -f
>>>> $ bitbake linux-yocto
>>>>
>>>> ERROR: linux-yocto-4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0
>>>> do_validate_branches: Function failed: do_validate_branches (log file =
is
>>>> located at /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/lin=
u
>>>> x-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.
>>>> do_validate_branches.116726)
>>>> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w
>>>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>>>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726
>>>> Log data follows:
>>>> | DEBUG: Executing shell function do_validate_branches
>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>> | 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=
=99: File exists
>>>> | 1493125671.370592:
>>>> | 1493125671.3742917: [ERROR] Can't find patch dir at
>>>> ./patches/standard/base
>>>> | 1493125671.3742917: usage: kgit s2q
>>>> | 1493125671.3743172: WARNING: exit code 1 from a shell command.
>>>> | 1493125671.3745801: ERROR: Function failed: do_validate_branches (lo=
g
>>>> file is located at /media/build1/poky/build/tmp/w
>>>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>>>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--94eb2c0e479efc8049054e28816f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yesterday I&#39;ve deleted all workspaces where I was gett=
ing this error and since then I haven&#39;t seen one.<div><br></div><div>So=
 maybe the key to reproduce this was to run builds without the fix applied =
and then apply the fix and execute another build without removing the tmp-g=
libc (so that it tries to do incremental build from the bad state created b=
efore without this fix).</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Wed, Apr 26, 2017 at 2:45 PM, Bruce Ashfield <span di=
r=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote"><span class=3D"">On Wed, Apr 26, 2017 at 8:25 AM, Burton, Ross <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">Not sure if it&#39;s related to this problem, but =
this happened in selftest last night:<br><br>Log data follows:<br>| DEBUG: =
Executing shell function do_kernel_metadata<br>| ERROR: Could not generate =
configuration queue for qemux86.<br>| /home/pokybuild/yocto-autobuil<wbr>de=
r/yocto-worker/nightly-oe-<wbr>selftest/build/build/tmp/work/<wbr>qemux86-p=
oky-linux/linux-<wbr>yocto/4.10.9+git999-r0/temp/<wbr>run.do_kernel_metadat=
a.37215: line 190: spp: command not found<div><br>| /home/pokybuild/yocto-a=
utobuil<wbr>der/yocto-worker/nightly-oe-<wbr>selftest/build/build/tmp/work/=
<wbr>qemux86-poky-linux/linux-<wbr>yocto/4.10.9+git999-r0/temp/<wbr>run.do_=
kernel_metadata.37215: line 191: kgit: command not found</div><div><br>| /h=
ome/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-oe-<wbr>selftest/=
build/build/tmp/work/<wbr>qemux86-poky-linux/linux-<wbr>yocto/4.10.9+git999=
-r0/temp/<wbr>run.do_kernel_metadata.37215: line 197: scc: command not foun=
d</div><div><br>| ERROR: Function failed: do_kernel_metadata (log file is l=
ocated at /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-oe-<w=
br>selftest/build/build/tmp/work/<wbr>qemux86-poky-linux/linux-<wbr>yocto/4=
.10.9+git999-r0/temp/<wbr>log.do_kernel_metadata.37215)</div></div></blockq=
uote><div><br></div><div><br></div></span><div>Not related to the patching =
error, but related to my change where I modified</div><div>the native depen=
ds.=C2=A0 For whatever reason that ran before the do_validate_branches,</di=
v><div>which is what pulls in the dependency.</div><div><br></div><div>I ca=
n&#39;t think of how that could happen, but there seems to be some tasks th=
at are now racing.</div><div><br></div><div>I&#39;ll revisit the patch and =
put the dependency in both places just to be sure.</div><span class=3D"HOEn=
Zb"><font color=3D"#888888"><div><br></div><div>Bruce</div></font></span><d=
iv><div class=3D"h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div><span class=3D"m_-2697917455396176618HOEnZb"><font color=3D=
"#888888"><br><br></font></span></div><span class=3D"m_-2697917455396176618=
HOEnZb"><font color=3D"#888888"><div>Ross</div></font></span></div><div cla=
ss=3D"m_-2697917455396176618HOEnZb"><div class=3D"m_-2697917455396176618h5"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25 April 2017=
 at 14:17, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D"m_-26979174=
55396176618m_-4198958585454020572h5">On Tue, Apr 25, 2017 at 9:09 AM, Richa=
rd Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span>=
On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:<br>
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
>Cheers,</div><div><br></div><div>Bruce</div><span><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></span></div><br><br clear=3D"all"><span><div><br></div>-- <br=
><div class=3D"m_-2697917455396176618m_-4198958585454020572m_-2494604463745=
44245gmail-m_1060650381739365254gmail_signature">&quot;Thou shalt not follo=
w the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div></div></div><div><div class=3D"h5"><br><br c=
lear=3D"all"><div><br></div>-- <br><div class=3D"m_-2697917455396176618gmai=
l_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>

--94eb2c0e479efc8049054e28816f--
