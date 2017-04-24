Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE2277AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:13:38 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o36so22153900qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q0uZjLgo3JCg7P4osaupp3GTcO3oJn1NRk7NYiMAJmw=;
	b=YgIMjo3N76/9C8pqeOPHa6DXeIKxnnTR60hBxuwdizbU8bluSKiKo0nXSS5Lxq8qK1
	J30X1NQSiyqFMsinp7T2jB2jtllgAK1KjGr2E2VmE2Aa7PbmwTnAxI+MExZ3kvTNlZL2
	2K7H89A8IZhcjzjexYVAfMhPpcrdDXRqpwADzPiDroAYgaasIE+KmbUuE9HxNmvm5vEM
	2V4RD+KT9pq0N0vr8ECNbdXo6ifKCkIMaqp7E1SInfa/iEgiFBNiRNUoXPmhQf71cbxu
	K2xQ5oVOhI0AYd+Upwbg6jCnVuP5mEqfMNxCy9DMauU6LVpcxqLH3VgeRfyyqHsKbsyX
	r0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q0uZjLgo3JCg7P4osaupp3GTcO3oJn1NRk7NYiMAJmw=;
	b=T+kr/Dd8htv6Jmcue0HmQk8N+b5jUn0XRWlAQrrDPSBd8dTIrurH20i0E7aUdUpymE
	wtTqXTN32Ph2UKhhhIYifYr1eH2Oa2UU85E78WxBEMMTizxPlAS936LXrf2d0PG4FijN
	W8ixDoh0oMbNKjICkIy28RjVzttqHsBwn5YuOMdY66Ob0koKkno7l7UBX1wlfDhCvYmD
	gVa6nrz0fhREMoW8Cq6l6QqQEi9ljp2DdIVgqOWQGJFb1EeyvP58QJod9to16iZ2jPuk
	Q4GcyDxnrJ6SiVELLelsAp7+MxcClDu0wpK8BxdmXIg9IySzS40nXK3MS5YZ7KBqHE3x
	9hgw==
X-Gm-Message-State: AN3rC/6Y5ZsD1KY3RPnLkxwrERgwJ7wtR1UOJhTP5duWzDNRGrKefmtw
	0p1ZbNve99RD3bbHVEf0UEwHoyLJ3g==
X-Received: by 10.237.34.136 with SMTP id p8mr29218252qtc.282.1493064820005;
	Mon, 24 Apr 2017 13:13:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 13:13:39 -0700 (PDT)
In-Reply-To: <CA+chaQefZ8tVgS-bZop7EJ0F3h1y3P+Qwrmyb4gf2LZqovarmA@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
	<CA+chaQefZ8tVgS-bZop7EJ0F3h1y3P+Qwrmyb4gf2LZqovarmA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 16:13:39 -0400
Message-ID: <CADkTA4MgEgormR-EKbgQkz00Swtpf1RXNoc4NmH3nVGQWJ_Xow@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 20:13:39 -0000
Content-Type: multipart/alternative; boundary=001a1139e42e392305054def3e89

--001a1139e42e392305054def3e89
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2017 at 4:05 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> > There's some incantation or config that I'm missing, I assume this is a
> straight qemux86 config
> with a bitbake of something like core-image-minimal ?
>
> One of the layers has linux-yocto_4.10.bbappend with 4 added .cfg files
> and one .patch file. Maybe that could influence do_patch behavior.
>

cool.

I'll add that as well. I've been running with an extra patch in my config
since that is something that Richard had in the past to
trigger it. But I'll start adding some more patches and configs to see if I
can trigger it.

Bruce


>
> On Mon, Apr 24, 2017 at 9:56 PM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@gmail.co=
m
>> > wrote:
>>
>>>
>>>
>>> On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> I'm still seeing this with your "kernel-yocto/kern-tools: fix
>>>> do_validate_branches clean stage" patch applied:
>>>>
>>>>
>>>> | DEBUG: Executing shell function do_patch
>>>> | ERROR: Could not apply patches for qemux86.
>>>> | ERROR: Patch failures can be resolved in the linux source directory =
work-shared/qemux86/kernel-source)
>>>> |
>>>> | [ERROR] Can't find patch dir at .kernel-meta/
>>>> | usage: kgit s2q
>>>> | ERROR: Function failed: do_patch (log file is located at linux-yocto=
/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.44497)
>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0:=
 task do_patch: Failed
>>>>
>>>>
>>> Well bugger.
>>>
>>> I'll start another set of builds.
>>>
>>
>> I had this on a build loop all day without any luck. I also enlisted a
>> few others around the office
>> to build master and see if they could cause an issue .. again, no luck.
>>
>> Richard/Ross: are you seeing this same thing on the autobuilder ?
>>
>> There's some incantation or config that I'm missing, I assume this is a
>> straight qemux86 config
>> with a bitbake of something like core-image-minimal ?
>>
>> Bruce
>>
>>
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <
>>>> bruce.ashfield@gmail.com> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <
>>>>> bruce.ashfield@gmail.com> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <
>>>>>> bruce.ashfield@gmail.com> wrote:
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>>>>>>> wrote:
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>>>>>>
>>>>>>>> Anyone else seeing this as well?
>>>>>>>>
>>>>>>>>
>>>>>>>> yes
>>>>>>>>
>>>>>>>
>>>>>>> If you see it, can you take a look at the linux source dir and see
>>>>>>> if the directories are
>>>>>>> present ?
>>>>>>>
>>>>>>> I've been doing a tight loop on builds all day, and  haven't seen
>>>>>>> this yet.
>>>>>>>
>>>>>>> Nothing has changed with the build process in months, so something
>>>>>>> else underneath
>>>>>>> is now causing this race/issue.
>>>>>>>
>>>>>>>
>>>>>> I finally managed to make this happen.
>>>>>>
>>>>>> Thanks for the report .. I can now spin a fix.
>>>>>>
>>>>>
>>>>> I'm no longer able to trigger the error, and I sent the patch to the
>>>>> list.
>>>>>
>>>>> Hopefully this never comes back .. but if anyone does see it after
>>>>> applying that patch, let me know.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>
>>>>>>> Bruce
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> - armin
>>>>>>>>
>>>>>>>> I've updated to oe-core commit:
>>>>>>>>
>>>>>>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>>>>>>
>>>>>>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>>>>>>
>>>>>>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do=
_validate_branches: Function failed: do_validate_branches (log file is loca=
ted at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do=
_validate_branches.5385)
>>>>>>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOI=
NC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>>>>>>> Log data follows:
>>>>>>>> | DEBUG: Executing shell function do_validate_branches
>>>>>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>>>>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=
=82=AC=E2=84=A2: File exists
>>>>>>>> |
>>>>>>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>>>>>>> | usage: kgit s2q
>>>>>>>> | WARNING: exit code 1 from a shell command.
>>>>>>>> | ERROR: Function failed: do_validate_branches (log file is locate=
d at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_v=
alidate_branches.5385)
>>>>>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d=
-r0: task do_validate_branches: Failed
>>>>>>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb=
:do_validate_branches) failed with exit code '1'
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-core mailing list
>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>>>>> thee at its end"
>>>>>>>
>>>>>>
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
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
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

--001a1139e42e392305054def3e89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 4:05 PM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><span class=3D""><div>&gt; There&#39;s some incantation or config that I=
&#39;m missing, I assume this is a straight qemux86 config</div><div>with a=
 bitbake of something like core-image-minimal ?</div><div><br></div></span>=
<div>One of the layers has linux-yocto_4.10.bbappend with 4 added .cfg file=
s and one .patch file. Maybe that could influence do_patch behavior.</div><=
/div></blockquote><div><br></div><div>cool.</div><div><br></div><div>I&#39;=
ll add that as well. I&#39;ve been running with an extra patch in my config=
 since that is something that Richard had in the past to</div><div>trigger =
it. But I&#39;ll start adding some more patches and configs to see if I can=
 trigger it.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 24, 2017 at 9:56 P=
M, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote"><span>On Mon, Apr 24, 2017 at 9:54 AM,=
 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote"><span>On Mon, Apr 24, 2017 at 9:39 AM, M=
artin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com"=
 target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr">I&#39;m still seeing this with your=
 &quot;kernel-yocto/kern-tools: fix do_validate_branches clean stage&quot; =
patch applied:<div><br><div><br></div><div><pre class=3D"m_3227797560467812=
825m_-9137547247892698798m_5608493994553769557m_8637781883685199031gmail-co=
nsole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap=
:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:=
14px"><span>| DEBUG: Executing shell function do_patch
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
image-minimal ?</div><span class=3D"m_3227797560467812825HOEnZb"><font colo=
r=3D"#888888"><div><br></div><div>Bruce</div></font></span><div><div class=
=3D"m_3227797560467812825h5"><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><s=
pan class=3D"m_3227797560467812825m_-9137547247892698798HOEnZb"><font color=
=3D"#888888"><div><br></div><div>Bruce</div></font></span><div><div class=
=3D"m_3227797560467812825m_-9137547247892698798h5"><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div class=3D"m_3227797560467812825m_-9137547247892=
698798m_5608493994553769557HOEnZb"><div class=3D"m_3227797560467812825m_-91=
37547247892698798m_5608493994553769557h5"><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <span =
dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">a=
kuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_3227797560467812825m_-9137547247892698798m_560849399455=
3769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_-225=
5057749165370883m_1550954388652444592m_-3190757637650521301moz-cite-prefix"=
>On 04/21/2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
">Anyone else seeing this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_3227797560467812825m_-9137547247892698798m_5608493994553769557m_86377818=
83685199031m_5127679590775829030m_625186880526551813m_-2255057749165370883H=
OEnZb"><font color=3D"#888888"><div><br></div></font></span></div></div></d=
iv></blockquote><div><br></div></span><div>I finally managed to make this h=
appen.</div><div><br></div><div>Thanks for the report .. I can now spin a f=
ix.</div></div></div></div></blockquote><div><br></div></span><div>I&#39;m =
no longer able to trigger the error, and I sent the patch to the list.</div=
><div><br></div><div>Hopefully this never comes back .. but if anyone does =
see it after applying that patch, let me know.</div><div><br></div><div>Che=
ers,</div><div><br></div><div>Bruce</div><div><div class=3D"m_3227797560467=
812825m_-9137547247892698798m_5608493994553769557m_8637781883685199031h5"><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>Cheers,</di=
v><div><br></div><div>Bruce</div><div><div class=3D"m_3227797560467812825m_=
-9137547247892698798m_5608493994553769557m_8637781883685199031m_51276795907=
75829030m_625186880526551813h5"><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><span class=3D"m_3227797560467812825m_-9137547247892698798m_56084939945537=
69557m_8637781883685199031m_5127679590775829030m_625186880526551813m_-22550=
57749165370883HOEnZb"><font color=3D"#888888"><div></div><div>Bruce</div><d=
iv>=C2=A0</div></font></span><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><div bgco=
lor=3D"#FFFFFF" text=3D"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
"></pre>
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
">I&#39;ve updated to oe-core commit:</pre>
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font-size:14px;=
white-space:pre-wrap">c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font-size:14px;=
white-space:pre-wrap">from some revision maybe 20-40 commits older and now =
I&#39;m seeing:</span></font></pre>
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
"></pre>
        <pre class=3D"m_3227797560467812825m_-9137547247892698798m_56084939=
94553769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_=
-2255057749165370883m_1550954388652444592m_-3190757637650521301gmail-consol=
e-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
">ERROR: linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0 do_v=
alidate_branches: Function failed: do_validate_branches (log file is locate=
d at linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>=
p/log.do_validate_branches.538<wbr>5)
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
      <fieldset class=3D"m_3227797560467812825m_-9137547247892698798m_56084=
93994553769557m_8637781883685199031m_5127679590775829030m_62518688052655181=
3m_-2255057749165370883m_1550954388652444592m_-3190757637650521301mimeAttac=
hmentHeader"></fieldset>
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
 <br><div class=3D"m_3227797560467812825m_-9137547247892698798m_56084939945=
53769557m_8637781883685199031m_5127679590775829030m_625186880526551813m_-22=
55057749165370883m_1550954388652444592gmail_signature" data-smartmail=3D"gm=
ail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and =
madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_3227797560467812825m_-9=
137547247892698798m_5608493994553769557m_8637781883685199031m_5127679590775=
829030m_625186880526551813h5"><br><br clear=3D"all"><div><br></div>-- <br><=
div class=3D"m_3227797560467812825m_-9137547247892698798m_56084939945537695=
57m_8637781883685199031m_5127679590775829030m_625186880526551813m_-22550577=
49165370883gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"m_3227797560467812825m_-9=
137547247892698798m_5608493994553769557m_8637781883685199031h5"><br><br cle=
ar=3D"all"><div><br></div>-- <br><div class=3D"m_3227797560467812825m_-9137=
547247892698798m_5608493994553769557m_8637781883685199031m_5127679590775829=
030m_625186880526551813gmail_signature" data-smartmail=3D"gmail_signature">=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div></div></div><div><div class=3D"m_32277975604=
67812825m_-9137547247892698798h5"><br><br clear=3D"all"><div><br></div>-- <=
br><div class=3D"m_3227797560467812825m_-9137547247892698798m_5608493994553=
769557gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"m_3227797560467812825h5">=
<br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_322779756046781=
2825m_-9137547247892698798gmail_signature" data-smartmail=3D"gmail_signatur=
e">&quot;Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1139e42e392305054def3e89--
