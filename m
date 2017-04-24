Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 28DBF72F32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:56:08 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a19so4650807qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ik5FzO9z548fhiHXGSIdXfcfNJ6JPWha9uVBtWZVwc8=;
	b=tUFAztuzUMTGt4UjRZQPCOjJ9It+WWEXyjHZl6TeYigOnY3Dj/I+2IrckVlcDDTxjA
	B21O4ZyqZ1z+ZsZI7D5CtHLm3CSE6RraEfsKmF0zmcFEEcPFiic+eXoG/5fDa9S2EBEV
	N5BpNJgz79OZmbhQN/qjgd5NNQrrl6emtBwcpJVXbW84DFCoA0KlDt6+OXYZzNNiDWqx
	O2Vmz8yUZOxoUopRs8WHzbaaCBnkm8dChf/1kBJQXZY3dsgiBrGt6blPg7M8sqPpyFcz
	ukTZmDkGGAKG3S5/mcY97UBFwPWUkL4NN4eLp9LTXvzX0v6ZbN7/fr6KPJ6rRCdj2cCO
	WvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ik5FzO9z548fhiHXGSIdXfcfNJ6JPWha9uVBtWZVwc8=;
	b=J41mBKtAnYmLoVW8Pcr5siDTPoAqPcLth1KiX59we2QriviHA5si0xpMT0Qgjy812b
	r2IDMNM3f/GDxBuJgpW5JlH0Suj0oXFw/bHvwHGYgt1iEitUFYGnxzAaqNQYr3c8BpXG
	BUj5WsT8buYK/BGA6qmbZVoTWtr8KCZeV/p+IJc9+OZktvIbDPtvj0diBJ6BLKMZ5vSo
	BMudyD2aAcOg8LaBlejAQ2RAQ8hDrTNYnYJ3Ki7fKg+4w6qZZ3S9Hl4kYU3lo1l6HDLe
	MnbGzoGGxviWR7YXses2kLnMhUb9qCtSS1aX1dNeEb8qNbvkMD1eRaMrWY88+sBBHtDI
	drUw==
X-Gm-Message-State: AN3rC/5U0AjtsX/2HD0JrtNJ+m5Of8i/Yw58aNtuOgQE940vIyw9Yab6
	gWFOREQztR24jFCL8WcWt8yO76UkXQ==
X-Received: by 10.55.104.80 with SMTP id d77mr15433611qkc.56.1493063769533;
	Mon, 24 Apr 2017 12:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 12:56:09 -0700 (PDT)
In-Reply-To: <CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 15:56:09 -0400
Message-ID: <CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 19:56:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c059d429c3256054deeff1c

--94eb2c059d429c3256054deeff1c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> I'm still seeing this with your "kernel-yocto/kern-tools: fix
>> do_validate_branches clean stage" patch applied:
>>
>>
>> | DEBUG: Executing shell function do_patch
>> | ERROR: Could not apply patches for qemux86.
>> | ERROR: Patch failures can be resolved in the linux source directory wo=
rk-shared/qemux86/kernel-source)
>> |
>> | [ERROR] Can't find patch dir at .kernel-meta/
>> | usage: kgit s2q
>> | ERROR: Function failed: do_patch (log file is located at linux-yocto/1=
_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.44497)
>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: t=
ask do_patch: Failed
>>
>>
> Well bugger.
>
> I'll start another set of builds.
>

I had this on a build loop all day without any luck. I also enlisted a few
others around the office
to build master and see if they could cause an issue .. again, no luck.

Richard/Ross: are you seeing this same thing on the autobuilder ?

There's some incantation or config that I'm missing, I assume this is a
straight qemux86 config
with a bitbake of something like core-image-minimal ?

Bruce


>
> Bruce
>
>
>>
>> On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <bruce.ashfield@gmail.co=
m
>> > wrote:
>>
>>>
>>>
>>> On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <
>>> bruce.ashfield@gmail.com> wrote:
>>>
>>>>
>>>>
>>>> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <
>>>> bruce.ashfield@gmail.com> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>>>>> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>>>>
>>>>>> Anyone else seeing this as well?
>>>>>>
>>>>>>
>>>>>> yes
>>>>>>
>>>>>
>>>>> If you see it, can you take a look at the linux source dir and see if
>>>>> the directories are
>>>>> present ?
>>>>>
>>>>> I've been doing a tight loop on builds all day, and  haven't seen thi=
s
>>>>> yet.
>>>>>
>>>>> Nothing has changed with the build process in months, so something
>>>>> else underneath
>>>>> is now causing this race/issue.
>>>>>
>>>>>
>>>> I finally managed to make this happen.
>>>>
>>>> Thanks for the report .. I can now spin a fix.
>>>>
>>>
>>> I'm no longer able to trigger the error, and I sent the patch to the
>>> list.
>>>
>>> Hopefully this never comes back .. but if anyone does see it after
>>> applying that patch, let me know.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>>
>>>>>> - armin
>>>>>>
>>>>>> I've updated to oe-core commit:
>>>>>>
>>>>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>>>>
>>>>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>>>>
>>>>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_v=
alidate_branches: Function failed: do_validate_branches (log file is locate=
d at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_v=
alidate_branches.5385)
>>>>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC=
+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>>>>> Log data follows:
>>>>>> | DEBUG: Executing shell function do_validate_branches
>>>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=
=AC=E2=84=A2: File exists
>>>>>> |
>>>>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>>>>> | usage: kgit s2q
>>>>>> | WARNING: exit code 1 from a shell command.
>>>>>> | ERROR: Function failed: do_validate_branches (log file is located =
at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_val=
idate_branches.5385)
>>>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r=
0: task do_validate_branches: Failed
>>>>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:d=
o_validate_branches) failed with exit code '1'
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end"
>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end"
>>>>
>>>
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



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c059d429c3256054deeff1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">I&#39;m still seeing this with your &quot;kernel-yocto/kern-too=
ls: fix do_validate_branches clean stage&quot; patch applied:<div><br><div>=
<br></div><div><pre class=3D"m_5608493994553769557m_8637781883685199031gmai=
l-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-=
wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-s=
ize:14px"><span>| DEBUG: Executing shell function do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-</span>sou<wbr>rce)
|=20
| [ERROR] Can&#39;t find patch dir at .kernel-meta/
| usage: kgit s2q
| ERROR: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/<wbr>temp/log.do_patch.44497)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0:=
 task do_patch: Failed</pre></div></div></div></blockquote><div><br></div><=
/span><div>Well bugger.</div><div><br></div><div>I&#39;ll start another set=
 of builds.</div></div></div></div></blockquote><div><br></div><div>I had t=
his on a build loop all day without any luck. I also enlisted a few others =
around the office</div><div>to build master and see if they could cause an =
issue .. again, no luck.</div><div><br></div><div>Richard/Ross: are you see=
ing this same thing on the autobuilder ?</div><div><br></div><div>There&#39=
;s some incantation or config that I&#39;m missing, I assume this is a stra=
ight qemux86 config</div><div>with a bitbake of something like core-image-m=
inimal ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div=
><div>Bruce</div></font></span><div><div class=3D"h5"><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div class=3D"m_5608493994553769557HOEnZb"><div =
class=3D"m_5608493994553769557h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote"><span>On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote"><span>On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote"><span>On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <span dir=3D"l=
tr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster80=
8@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_5608493994553769557m_8637781883685199031m_5127679590775=
829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_-319=
0757637650521301moz-cite-prefix">On 04/21/2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:14px">Anyone else seeing this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_5608493994553769557m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883HOEnZb"><font color=3D"#888888"><div><br></d=
iv></font></span></div></div></div></blockquote><div><br></div></span><div>=
I finally managed to make this happen.</div><div><br></div><div>Thanks for =
the report .. I can now spin a fix.</div></div></div></div></blockquote><di=
v><br></div></span><div>I&#39;m no longer able to trigger the error, and I =
sent the patch to the list.</div><div><br></div><div>Hopefully this never c=
omes back .. but if anyone does see it after applying that patch, let me kn=
ow.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><d=
iv><div class=3D"m_5608493994553769557m_8637781883685199031h5"><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><div><br></div><div>Cheers,</div><div><br><=
/div><div>Bruce</div><div><div class=3D"m_5608493994553769557m_863778188368=
5199031m_5127679590775829030m_625186880526551813h5"><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><span class=3D"m_5608493994553769557m_8637781883685199=
031m_5127679590775829030m_625186880526551813m_-2255057749165370883HOEnZb"><=
font color=3D"#888888"><div></div><div>Bruce</div><div>=C2=A0</div></font><=
/span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span><div bgcolor=3D"#FFFFFF" text=3D=
"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:14px">I&#39;ve updated to oe-core commit:</pre>
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px"><font color=3D"#333333=
"><span style=3D"font-size:14px;white-space:pre-wrap">c6cd5865b6914521a841a=
e0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px"><font color=3D"#333333=
"><span style=3D"font-size:14px;white-space:pre-wrap">from some revision ma=
ybe 20-40 commits older and now I&#39;m seeing:</span></font></pre>
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_5608493994553769557m_8637781883685199031m_512767959=
0775829030m_625186880526551813m_-2255057749165370883m_1550954388652444592m_=
-3190757637650521301gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:14px">ERROR: linux-yocto-1_4.10.9+gitAUTOIN<wbr=
>C+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function failed: do_valid=
ate_branches (log file is located at linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+a=
d2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_validate_branches.538<wbr>5)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+a=
d2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_validate_branches.538<wbr>5
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base
| mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
|=20
| [ERROR] Can&#39;t find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at linu=
x-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_=
validate_branches.538<wbr>5)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0:=
 task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/l<wbr>inux/linux-yocto_4.10.bb:do_=
va<wbr>lidate_branches) failed with exit code &#39;1&#39;</pre>
      </div>
      <br>
      <fieldset class=3D"m_5608493994553769557m_8637781883685199031m_512767=
9590775829030m_625186880526551813m_-2255057749165370883m_155095438865244459=
2m_-3190757637650521301mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </span></div>

<br></span><span>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></span></blockquote></div><span><br><br clear=3D"all"><div><br></div>--=
 <br><div class=3D"m_5608493994553769557m_8637781883685199031m_512767959077=
5829030m_625186880526551813m_-2255057749165370883m_1550954388652444592gmail=
_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow =
the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_5608493994553769557m_86=
37781883685199031m_5127679590775829030m_625186880526551813h5"><br><br clear=
=3D"all"><div><br></div>-- <br><div class=3D"m_5608493994553769557m_8637781=
883685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883=
gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not fo=
llow the NULL pointer, for chaos and madness await thee at its end&quot;</d=
iv>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"m_5608493994553769557m_86=
37781883685199031h5"><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_5608493994553769557m_8637781883685199031m_5127679590775829030m_625186=
880526551813gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou =
shalt not follow the NULL pointer, for chaos and madness await thee at its =
end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div></div></div><div><div class=3D"h5"><br><br c=
lear=3D"all"><div><br></div>-- <br><div class=3D"m_5608493994553769557gmail=
_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow =
the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c059d429c3256054deeff1c--
