Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 768A260125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 18:46:39 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c45so33600444qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 11:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SfPjoTeW4Ze1L9MiTs7+vr6F10fxbsCr3wwnBYXvOt4=;
	b=C3YYDxrK2MzKqAbg58jdxgjZcA/d+HroMdL5QE48NkMYSPUC50z5ZESpkphKyfeEyW
	x5a6Q4uOU0kWUGqqVLqqdORQOqr+Bbdv58c4EK2ZgSUHwfo6pufTqWDQoTZnBgcHDYvJ
	lXC6veQDLrJ8I4NLui/oFNetnexTtZYlvhDfSiF7AcfNv0BtUVYLp/tjtlyFBPivG29U
	XB8PiCJHouvscWhQua+tKGUxM5cN1HOEYSu6LEB3Pbzd3nG0/0GGIzI8R8nSr+II0gPm
	043oertJEZFE0g2QLpyQrxREbl9kPuNc3qXHZD5W8CATgnwpc1CTQBliptPu9C1rQRlq
	4HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SfPjoTeW4Ze1L9MiTs7+vr6F10fxbsCr3wwnBYXvOt4=;
	b=ZlWXYuF2tcQ79Ye1tkmGMti+5ctf2cgtsFT8Bd02sKPw6KgEw2tRe4BwHtSai/fHMy
	wnbvyeZ4vwc4AJBHU/4Sa7p0Jwff/jhF4LUnUOMef2iXOccGcmw9M1E9waU+X1wTu2eK
	AaTMxZmcgSKCpfqh+32iMDhPRqdBj3oAhlbQS1miiWHP9PpsCuoCB0Q/pa5kJCVquqAQ
	652eOLzd1I7jbgiHdsQFbGU/mtwJ6CgMvGne7wVO/3Q4xT9R9+AAKF0RYnfXu4uhhox8
	SX8bSnmTfUsw2Y8mqiC8LGdS5CKANEUDw9sPAFC9Yj/1Z1RxlID0sVEuf6OVgZtwXJTM
	nCSg==
X-Gm-Message-State: AN3rC/6TzlnQyiIAFGe89tQ+Vsd1bNEfBom17SMMviJTf7KwTukx5wlp
	dNWaP7sddMIKfzO/1QJOAB5bE3tbWw==
X-Received: by 10.237.35.162 with SMTP id j31mr6211434qtc.117.1493318800429;
	Thu, 27 Apr 2017 11:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Thu, 27 Apr 2017 11:46:39 -0700 (PDT)
In-Reply-To: <CA+chaQebM+2OXLcsgH-86n+vyka+L5_VZ3CO+5Qd1zdGRHo_2A@mail.gmail.com>
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
	<CA+chaQebM+2OXLcsgH-86n+vyka+L5_VZ3CO+5Qd1zdGRHo_2A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Apr 2017 14:46:39 -0400
Message-ID: <CADkTA4NQbqiN=+=y5g6c+d8zkgRB59y7v47yW9qeLxYBfBU2=A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 18:46:44 -0000
Content-Type: multipart/alternative; boundary=001a113e7f54a2d8dc054e2a6032

--001a113e7f54a2d8dc054e2a6032
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2017 at 12:32 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Yesterday I've deleted all workspaces where I was getting this error and
> since then I haven't seen one.
>
> So maybe the key to reproduce this was to run builds without the fix
> applied and then apply the fix and execute another build without removing
> the tmp-glibc (so that it tries to do incremental build from the bad stat=
e
> created before without this fix).
>

Interesting. Thanks for letting me know .. I'll try and set up the same
steps here. I was worried
that all your build were still breaking on this, and yet I couldn't make it
happen.

Hopefully this will lead me to the root cause.

Bruce


>
> On Wed, Apr 26, 2017 at 2:45 PM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Wed, Apr 26, 2017 at 8:25 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> Not sure if it's related to this problem, but this happened in selftest
>>> last night:
>>>
>>> Log data follows:
>>> | DEBUG: Executing shell function do_kernel_metadata
>>> | ERROR: Could not generate configuration queue for qemux86.
>>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-se
>>> lftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/
>>> 4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 190: spp:
>>> command not found
>>>
>>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-se
>>> lftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/
>>> 4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 191: kgit:
>>> command not found
>>>
>>> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-se
>>> lftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/
>>> 4.10.9+git999-r0/temp/run.do_kernel_metadata.37215: line 197: scc:
>>> command not found
>>>
>>> | ERROR: Function failed: do_kernel_metadata (log file is located at
>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-se
>>> lftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/
>>> 4.10.9+git999-r0/temp/log.do_kernel_metadata.37215)
>>>
>>
>>
>> Not related to the patching error, but related to my change where I
>> modified
>> the native depends.  For whatever reason that ran before the
>> do_validate_branches,
>> which is what pulls in the dependency.
>>
>> I can't think of how that could happen, but there seems to be some tasks
>> that are now racing.
>>
>> I'll revisit the patch and put the dependency in both places just to be
>> sure.
>>
>> Bruce
>>
>>
>>>
>>>
>>> Ross
>>>
>>> On 25 April 2017 at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com>
>>> wrote:
>>>
>>>>
>>>>
>>>> On Tue, Apr 25, 2017 at 9:09 AM, Richard Purdie <
>>>> richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>>> On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:
>>>>> > On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie
>>>>> > <richard.purdie@linuxfoundation.org> wrote:
>>>>> > > On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
>>>>> > > >
>>>>> > > >
>>>>> > > > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield=
@g
>>>>> > > mail
>>>>> > > > .com> wrote:
>>>>> > > > >
>>>>> > > > >
>>>>> > > > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@g=
ma
>>>>> > > il.c
>>>>> > > > > om> wrote:
>>>>> > >
>>>>> > > >
>>>>> > > > Richard/Ross: are you seeing this same thing on the autobuilder=
 ?
>>>>> > > >
>>>>> > > > There's some incantation or config that I'm missing, I assume
>>>>> > > this is
>>>>> > > > a straight qemux86 config
>>>>> > > > with a bitbake of something like core-image-minimal ?
>>>>> > >
>>>>> > > We're not seeing this on the autobuilders. I do suspect something
>>>>> > > in
>>>>> > > the handling of extra patches or cfg fragments from SRC_URI if I
>>>>> > > had to
>>>>> > > guess. That certainly was the trigger last time I saw this.
>>>>> > Yah, that's the kicker, I'm still carrying your patch for binfmt_el=
f,
>>>>> > and I added two of my own
>>>>> > + config fragments, and I can't trigger anything.
>>>>>
>>>>> I managed to reproduce breakage. With master and my separate patch in
>>>>> SRC_URI:
>>>>>
>>>>>
>>>> This particular issue should be fixed with with patch I sent, late
>>>> Friday night:
>>>>
>>>> [OE-core] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches
>>>> clean stage
>>>>
>>>> Martin applied it to his builds and is still seeing an issue in the
>>>> actual patching phase.
>>>> I'm currently not able to reproduce it.
>>>>
>>>> If you do have that patch applied, I'm definitely interested. If you
>>>> don't, and have two
>>>> minutes to re-run with that applied .. I'd be interested to hear if th=
e
>>>> build works after
>>>> that.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>> $ bitbake linux-yocto
>>>>> $ bitbake linux-yocto -c kernel_checkout -f
>>>>> $ bitbake linux-yocto
>>>>>
>>>>> ERROR: linux-yocto-4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0
>>>>> do_validate_branches: Function failed: do_validate_branches (log file=
 is
>>>>> located at /media/build1/poky/build/tmp/w
>>>>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>>>>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
>>>>> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w
>>>>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>>>>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726
>>>>> Log data follows:
>>>>> | DEBUG: Executing shell function do_validate_branches
>>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>>> | 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=
=99: File exists
>>>>> | 1493125671.370592:
>>>>> | 1493125671.3742917: [ERROR] Can't find patch dir at
>>>>> ./patches/standard/base
>>>>> | 1493125671.3742917: usage: kgit s2q
>>>>> | 1493125671.3743172: WARNING: exit code 1 from a shell command.
>>>>> | 1493125671.3745801: ERROR: Function failed: do_validate_branches
>>>>> (log file is located at /media/build1/poky/build/tmp/w
>>>>> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
>>>>> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end"
>>>>
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>>
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e7f54a2d8dc054e2a6032
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 27, 2017 at 12:32 PM, Martin Jansa <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr">Yesterday I&#39;ve deleted all workspaces where I was getting this erro=
r and since then I haven&#39;t seen one.<div><br></div><div>So maybe the ke=
y to reproduce this was to run builds without the fix applied and then appl=
y the fix and execute another build without removing the tmp-glibc (so that=
 it tries to do incremental build from the bad state created before without=
 this fix).</div></div></blockquote><div><br></div><div>Interesting. Thanks=
 for letting me know .. I&#39;ll try and set up the same steps here. I was =
worried</div><div>that all your build were still breaking on this, and yet =
I couldn&#39;t make it happen.</div><div><br></div><div>Hopefully this will=
 lead me to the root cause.</div><div><br></div><div>Bruce</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5=
"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 26,=
 2017 at 2:45 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On Wed, Apr 26, 2=
017 at 8:25 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.b=
urton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Not sure if it&#39;s=
 related to this problem, but this happened in selftest last night:<br><br>=
Log data follows:<br>| DEBUG: Executing shell function do_kernel_metadata<b=
r>| ERROR: Could not generate configuration queue for qemux86.<br>| /home/p=
okybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-oe-se<wbr>lftest/build=
/build/tmp/work/qe<wbr>mux86-poky-linux/linux-yocto/<wbr>4.10.9+git999-r0/t=
emp/run.do_<wbr>kernel_metadata.37215: line 190: spp: command not found<div=
><br>| /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-oe-se<wb=
r>lftest/build/build/tmp/work/qe<wbr>mux86-poky-linux/linux-yocto/<wbr>4.10=
.9+git999-r0/temp/run.do_<wbr>kernel_metadata.37215: line 191: kgit: comman=
d not found</div><div><br>| /home/pokybuild/yocto-autobuil<wbr>der/yocto-wo=
rker/nightly-oe-se<wbr>lftest/build/build/tmp/work/qe<wbr>mux86-poky-linux/=
linux-yocto/<wbr>4.10.9+git999-r0/temp/run.do_<wbr>kernel_metadata.37215: l=
ine 197: scc: command not found</div><div><br>| ERROR: Function failed: do_=
kernel_metadata (log file is located at /home/pokybuild/yocto-autobuil<wbr>=
der/yocto-worker/nightly-oe-se<wbr>lftest/build/build/tmp/work/qe<wbr>mux86=
-poky-linux/linux-yocto/<wbr>4.10.9+git999-r0/temp/log.do_<wbr>kernel_metad=
ata.37215)</div></div></blockquote><div><br></div><div><br></div></span><di=
v>Not related to the patching error, but related to my change where I modif=
ied</div><div>the native depends.=C2=A0 For whatever reason that ran before=
 the do_validate_branches,</div><div>which is what pulls in the dependency.=
</div><div><br></div><div>I can&#39;t think of how that could happen, but t=
here seems to be some tasks that are now racing.</div><div><br></div><div>I=
&#39;ll revisit the patch and put the dependency in both places just to be =
sure.</div><span class=3D"m_-6245096803047131663HOEnZb"><font color=3D"#888=
888"><div><br></div><div>Bruce</div></font></span><div><div class=3D"m_-624=
5096803047131663h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div><span class=3D"m_-6245096803047131663m_-2697917455396176618H=
OEnZb"><font color=3D"#888888"><br><br></font></span></div><span class=3D"m=
_-6245096803047131663m_-2697917455396176618HOEnZb"><font color=3D"#888888">=
<div>Ross</div></font></span></div><div class=3D"m_-6245096803047131663m_-2=
697917455396176618HOEnZb"><div class=3D"m_-6245096803047131663m_-2697917455=
396176618h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2=
5 April 2017 at 14:17, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D=
"m_-6245096803047131663m_-2697917455396176618m_-4198958585454020572h5">On T=
ue, Apr 25, 2017 at 9:09 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundatio<wbr>n.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><span>On Mon, 2017-04-24 at 21:06 -0400, Bruc=
e Ashfield wrote:<br>
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
><div class=3D"m_-6245096803047131663m_-2697917455396176618m_-4198958585454=
020572m_-249460446374544245gmail-m_1060650381739365254gmail_signature">&quo=
t;Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div></div></div><div><div class=3D"m_-6245096803=
047131663h5"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-6=
245096803047131663m_-2697917455396176618gmail_signature" data-smartmail=3D"=
gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos an=
d madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a113e7f54a2d8dc054e2a6032--
