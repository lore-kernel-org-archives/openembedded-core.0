Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D052A60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:05:42 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id m123so78166912wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8N7nWTrOvjCiouu8Fq3OLBmepPlU9Y1yQAcxSL4corg=;
	b=RLBc1k+GPeQT7o0pIxMyQV6mupZ9Zo1wQtaRZuSqe84C6Y1wYwAkXPknpOaLE7YJZj
	H6tjY5NDHOTIWvnSNNP7rLF8PNVll0is5SN+4VF+ht3DUiK7b1EfU7n4x0K0l3j9Lnmk
	2jNx1RRT2CMiOBvuUjVs+cRJe8aPokRY5jcg1TW/nfNz9u+h2HUqg4eBPnE79YSCeLhK
	gyBk5ghw5wQ6imotuouRcUnqjmU5UWLACSzHSWBuWG2a5U5eIXgnY/q2j9a5UneYttu0
	ZwiTINPWt6A9FYlyPGCPejwH2MiriK5OcttthJG+p5pJCq7xkPb9xIO24Q2Y++l6Mgpx
	7hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8N7nWTrOvjCiouu8Fq3OLBmepPlU9Y1yQAcxSL4corg=;
	b=lXSVseA/j5YttbM92cXg6o0teslKBEt3mQFZ7SdqZCOBgYyofbElW9W6sghbIqfipR
	IevruCfPhAqZE1FLDY7/QDJ4H4Ju8M6xjc5iQDVtaOmq+nAqU87Llofq63og0xKAPxVS
	egKqKdnETZtSwu/gw39I9kd6aHFPN96xJ/feudQ+wXiHTzOYLYdfKTi6PGkgEYhOMRaB
	T0qt6gzSYIYCLzeuxZMJjlsCVFuLhKOe0jjdybmm0Q1zp17a8hgNvPuqUvzdp+oflmlw
	HLEVBdIWEPHqkk1XaCfLXmUdHtE5VCdeDe0kcogbAPhRQLBGTmRrfhr0GBiVX7UtyN/O
	ZPtg==
X-Gm-Message-State: AN3rC/4pDLeSooGFxAHA2n0yNxK9027boSIphV9YuX/cbi8rSZbfipqY
	FjTeXSjiowAHdBnXusbBfbdJpAbCGQ==
X-Received: by 10.80.163.196 with SMTP id t4mr2385872edb.158.1493064343213;
	Mon, 24 Apr 2017 13:05:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Mon, 24 Apr 2017 13:05:42 -0700 (PDT)
In-Reply-To: <CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Apr 2017 22:05:42 +0200
Message-ID: <CA+chaQefZ8tVgS-bZop7EJ0F3h1y3P+Qwrmyb4gf2LZqovarmA@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 20:05:43 -0000
Content-Type: multipart/alternative; boundary=f403045c1a80cdddde054def21f0

--f403045c1a80cdddde054def21f0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> There's some incantation or config that I'm missing, I assume this is a
straight qemux86 config
with a bitbake of something like core-image-minimal ?

One of the layers has linux-yocto_4.10.bbappend with 4 added .cfg files and
one .patch file. Maybe that could influence do_patch behavior.

On Mon, Apr 24, 2017 at 9:56 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> I'm still seeing this with your "kernel-yocto/kern-tools: fix
>>> do_validate_branches clean stage" patch applied:
>>>
>>>
>>> | DEBUG: Executing shell function do_patch
>>> | ERROR: Could not apply patches for qemux86.
>>> | ERROR: Patch failures can be resolved in the linux source directory w=
ork-shared/qemux86/kernel-source)
>>> |
>>> | [ERROR] Can't find patch dir at .kernel-meta/
>>> | usage: kgit s2q
>>> | ERROR: Function failed: do_patch (log file is located at linux-yocto/=
1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.44497)
>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: =
task do_patch: Failed
>>>
>>>
>> Well bugger.
>>
>> I'll start another set of builds.
>>
>
> I had this on a build loop all day without any luck. I also enlisted a fe=
w
> others around the office
> to build master and see if they could cause an issue .. again, no luck.
>
> Richard/Ross: are you seeing this same thing on the autobuilder ?
>
> There's some incantation or config that I'm missing, I assume this is a
> straight qemux86 config
> with a bitbake of something like core-image-minimal ?
>
> Bruce
>
>
>>
>> Bruce
>>
>>
>>>
>>> On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <
>>> bruce.ashfield@gmail.com> wrote:
>>>
>>>>
>>>>
>>>> On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <
>>>> bruce.ashfield@gmail.com> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <
>>>>> bruce.ashfield@gmail.com> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>>>>>
>>>>>>> Anyone else seeing this as well?
>>>>>>>
>>>>>>>
>>>>>>> yes
>>>>>>>
>>>>>>
>>>>>> If you see it, can you take a look at the linux source dir and see i=
f
>>>>>> the directories are
>>>>>> present ?
>>>>>>
>>>>>> I've been doing a tight loop on builds all day, and  haven't seen
>>>>>> this yet.
>>>>>>
>>>>>> Nothing has changed with the build process in months, so something
>>>>>> else underneath
>>>>>> is now causing this race/issue.
>>>>>>
>>>>>>
>>>>> I finally managed to make this happen.
>>>>>
>>>>> Thanks for the report .. I can now spin a fix.
>>>>>
>>>>
>>>> I'm no longer able to trigger the error, and I sent the patch to the
>>>> list.
>>>>
>>>> Hopefully this never comes back .. but if anyone does see it after
>>>> applying that patch, let me know.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> - armin
>>>>>>>
>>>>>>> I've updated to oe-core commit:
>>>>>>>
>>>>>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>>>>>
>>>>>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>>>>>
>>>>>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_=
validate_branches: Function failed: do_validate_branches (log file is locat=
ed at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_=
validate_branches.5385)
>>>>>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOIN=
C+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>>>>>> Log data follows:
>>>>>>> | DEBUG: Executing shell function do_validate_branches
>>>>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>>>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=
=AC=E2=84=A2: File exists
>>>>>>> |
>>>>>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>>>>>> | usage: kgit s2q
>>>>>>> | WARNING: exit code 1 from a shell command.
>>>>>>> | ERROR: Function failed: do_validate_branches (log file is located=
 at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_va=
lidate_branches.5385)
>>>>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-=
r0: task do_validate_branches: Failed
>>>>>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:=
do_validate_branches) failed with exit code '1'
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> _______________________________________________
>>>>>>> Openembedded-core mailing list
>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>>> thee at its end"
>>>>>>
>>>>>
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
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--f403045c1a80cdddde054def21f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; There&#39;s some incantation or config that I&#3=
9;m missing, I assume this is a straight qemux86 config</div><div>with a bi=
tbake of something like core-image-minimal ?</div><div><br></div><div>One o=
f the layers has linux-yocto_4.10.bbappend with 4 added .cfg files and one =
.patch file. Maybe that could influence do_patch behavior.</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 24, 2017 a=
t 9:56 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Mon, Apr 2=
4, 2017 at 9:54 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On Mon, Apr 24,=
 2017 at 9:39 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:mart=
in.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;m still se=
eing this with your &quot;kernel-yocto/kern-tools: fix do_validate_branches=
 clean stage&quot; patch applied:<div><br><div><br></div><div><pre class=3D=
"m_-9137547247892698798m_5608493994553769557m_8637781883685199031gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px"><span>| DEBUG: Executing shell function do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-</span>sou<wbr>rce)
|=20
| [ERROR] Can&#39;t find patch dir at .kernel-meta/
| usage: kgit s2q
| ERROR: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_patch.44497)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0:=
 task do_patch: Failed</pre></div></div></div></blockquote><div><br></div><=
/span><div>Well bugger.</div><div><br></div><div>I&#39;ll start another set=
 of builds.</div></div></div></div></blockquote><div><br></div></span><div>=
I had this on a build loop all day without any luck. I also enlisted a few =
others around the office</div><div>to build master and see if they could ca=
use an issue .. again, no luck.</div><div><br></div><div>Richard/Ross: are =
you seeing this same thing on the autobuilder ?</div><div><br></div><div>Th=
ere&#39;s some incantation or config that I&#39;m missing, I assume this is=
 a straight qemux86 config</div><div>with a bitbake of something like core-=
image-minimal ?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><b=
r></div><div>Bruce</div></font></span><div><div class=3D"h5"><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><span class=3D"m_-9137547247892698798HOEnZb">=
<font color=3D"#888888"><div><br></div><div>Bruce</div></font></span><div><=
div class=3D"m_-9137547247892698798h5"><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"m_-9137547247892698798m_5608493994553769557HOEn=
Zb"><div class=3D"m_-9137547247892698798m_5608493994553769557h5"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Apr 22, 2017 at 6:3=
9 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 3:47 =
PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 1:50 PM=
, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 11:55 AM,=
 akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" t=
arget=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_-9137547247892698798m_5608493994553769557m_863778188368=
5199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m_155=
0954388652444592m_-3190757637650521301moz-cite-prefix">On 04/21/2017 01:36 =
AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seeing =
this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_-9137547247892698798m_5608493994553769557m_8637781883685199031m_51276795=
90775829030m_625186880526551813m_-2255057749165370883HOEnZb"><font color=3D=
"#888888"><div><br></div></font></span></div></div></div></blockquote><div>=
<br></div></span><div>I finally managed to make this happen.</div><div><br>=
</div><div>Thanks for the report .. I can now spin a fix.</div></div></div>=
</div></blockquote><div><br></div></span><div>I&#39;m no longer able to tri=
gger the error, and I sent the patch to the list.</div><div><br></div><div>=
Hopefully this never comes back .. but if anyone does see it after applying=
 that patch, let me know.</div><div><br></div><div>Cheers,</div><div><br></=
div><div>Bruce</div><div><div class=3D"m_-9137547247892698798m_560849399455=
3769557m_8637781883685199031h5"><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><div =
class=3D"m_-9137547247892698798m_5608493994553769557m_8637781883685199031m_=
5127679590775829030m_625186880526551813h5"><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><span class=3D"m_-9137547247892698798m_5608493994553769557m_863=
7781883685199031m_5127679590775829030m_625186880526551813m_-225505774916537=
0883HOEnZb"><font color=3D"#888888"><div></div><div>Bruce</div><div>=C2=A0<=
/div></font></span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span><div bgcolor=3D"#FF=
FFFF" text=3D"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I&#39;ve updated to=
 oe-core commit:</pre>
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px">=
<font color=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wrap"=
>c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px">=
<font color=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wrap"=
>from some revision maybe 20-40 commits older and now I&#39;m seeing:</span=
></font></pre>
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m=
_1550954388652444592m_-3190757637650521301gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: linux-yocto-=
1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Fun=
ction failed: do_validate_branches (log file is located at linux-yocto/1_4.=
10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_validate_bra=
nches.538<wbr>5)
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
      <fieldset class=3D"m_-9137547247892698798m_5608493994553769557m_86377=
81883685199031m_5127679590775829030m_625186880526551813m_-22550577491653708=
83m_1550954388652444592m_-3190757637650521301mimeAttachmentHeader"></fields=
et>
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
 <br><div class=3D"m_-9137547247892698798m_5608493994553769557m_86377818836=
85199031m_5127679590775829030m_625186880526551813m_-2255057749165370883m_15=
50954388652444592gmail_signature" data-smartmail=3D"gmail_signature">&quot;=
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_-9137547247892698798m_5=
608493994553769557m_8637781883685199031m_5127679590775829030m_6251868805265=
51813h5"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-91375=
47247892698798m_5608493994553769557m_8637781883685199031m_51276795907758290=
30m_625186880526551813m_-2255057749165370883gmail_signature" data-smartmail=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"m_-9137547247892698798m_5=
608493994553769557m_8637781883685199031h5"><br><br clear=3D"all"><div><br><=
/div>-- <br><div class=3D"m_-9137547247892698798m_5608493994553769557m_8637=
781883685199031m_5127679590775829030m_625186880526551813gmail_signature" da=
ta-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div></div></div><div><div class=3D"m_-9137547247=
892698798h5"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-9=
137547247892698798m_5608493994553769557gmail_signature" data-smartmail=3D"g=
mail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and=
 madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"h5"><br><br clear=3D"all"=
><div><br></div>-- <br><div class=3D"m_-9137547247892698798gmail_signature"=
 data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL po=
inter, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>

--f403045c1a80cdddde054def21f0--
