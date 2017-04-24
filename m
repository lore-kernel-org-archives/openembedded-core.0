Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A01DC77A90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:39:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r190so68155453wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RzGkE1LoRyw9LzhVPR7sqBqBaLH8gdkozhK3JDnsAfk=;
	b=o8GBcH1iUAB8hbeT3DG1ib2ab1UFucIHf2kmwZB50Pti+Chm/nECQUMzkNk9IcNhKH
	wOy8Nrwh3fL4ego3+Ob4snHGloduCnGXmkBQgAEhsLyaumLjONRUDq1tfYiPj4EsFvrv
	Rbi8mJJtLgT51IbV4FOt9SpsARRxjLaxdSTaU8R9ryY4qT5bzUJaV1bxTxpj76Uywtr3
	A5Rz4/if27oLOek/peZuB0Xlr8gwAKpmkiaK3ioN/CmJnbcy9fVihofDjwjG3wCYh0Bp
	N1pJha4/lkyo/Awcrlf3fJw9bSbYLObc+mkKOydYyF8Ozx4N16TOg1i0KgzMu57hhRWn
	N17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RzGkE1LoRyw9LzhVPR7sqBqBaLH8gdkozhK3JDnsAfk=;
	b=CYp+u5ed+9EvLX5RL/zXNYu3wlKLsHKeaq/jUAVxgTeT2gXr+1eeEo6krexlfIqjD3
	K6DI1c8lW1MKt3cKhNwcWNeLb68YL2ARgsA53eNjXkDBgK9nqVo2j6rRWLhDfosLU0Us
	gQNvGlaKXwg/ZIPAZogtRkO88SMTvVVfEI+5AKxV9hYAfrAV1HEp16OH3ma4o9+VLKbF
	cVZVrRAM+qj94DothIYjAL1eBqVYeCvN/3aZyX+ejsuI38s/XFVxil9o48clxlmNIUuv
	BwQqCXHZbzRY/OQI8ZgYYeZcC2xrPWH2WM97fVd3fc/bjMP4s68gvuNQqH+IznCnn3Aj
	4Pog==
X-Gm-Message-State: AN3rC/5Yntv35tfjcELbGsqv+YUqa8ykfOK4yr6Vla6Uq1fV7GO+LpeE
	LceB7Hgo9FMSREs6pfmPC6ss9On92g==
X-Received: by 10.80.144.174 with SMTP id c43mr1143547eda.4.1493041200350;
	Mon, 24 Apr 2017 06:40:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Mon, 24 Apr 2017 06:39:59 -0700 (PDT)
In-Reply-To: <CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Apr 2017 15:39:59 +0200
Message-ID: <CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 13:40:01 -0000
Content-Type: multipart/alternative; boundary=f403045c18d061cb71054de9be5c

--f403045c18d061cb71054de9be5c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm still seeing this with your "kernel-yocto/kern-tools: fix
do_validate_branches clean stage" patch applied:


| DEBUG: Executing shell function do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory
work-shared/qemux86/kernel-source)
|
| [ERROR] Can't find patch dir at .kernel-meta/
| usage: kgit s2q
| ERROR: Function failed: do_patch (log file is located at
linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.=
44497)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0:
task do_patch: Failed


On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m
>> > wrote:
>>
>>>
>>>
>>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>>> wrote:
>>>
>>>>
>>>>
>>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>>
>>>> Anyone else seeing this as well?
>>>>
>>>>
>>>> yes
>>>>
>>>
>>> If you see it, can you take a look at the linux source dir and see if
>>> the directories are
>>> present ?
>>>
>>> I've been doing a tight loop on builds all day, and  haven't seen this
>>> yet.
>>>
>>> Nothing has changed with the build process in months, so something else
>>> underneath
>>> is now causing this race/issue.
>>>
>>>
>> I finally managed to make this happen.
>>
>> Thanks for the report .. I can now spin a fix.
>>
>
> I'm no longer able to trigger the error, and I sent the patch to the list=
.
>
> Hopefully this never comes back .. but if anyone does see it after
> applying that patch, let me know.
>
> Cheers,
>
> Bruce
>
>
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>> Bruce
>>>
>>>
>>>>
>>>> - armin
>>>>
>>>> I've updated to oe-core commit:
>>>>
>>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>>
>>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>>
>>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_val=
idate_branches: Function failed: do_validate_branches (log file is located =
at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_val=
idate_branches.5385)
>>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+a=
d2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>>> Log data follows:
>>>> | DEBUG: Executing shell function do_validate_branches
>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=
=E2=84=A2: File exists
>>>> |
>>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>>> | usage: kgit s2q
>>>> | WARNING: exit code 1 from a shell command.
>>>> | ERROR: Function failed: do_validate_branches (log file is located at=
 linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valid=
ate_branches.5385)
>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0:=
 task do_validate_branches: Failed
>>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_=
validate_branches) failed with exit code '1'
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
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
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--f403045c18d061cb71054de9be5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m still seeing this with your &quot;kernel-yocto/ker=
n-tools: fix do_validate_branches clean stage&quot; patch applied:<div><br>=
<div><br></div><div><pre class=3D"gmail-console-output" style=3D"box-sizing=
:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51);font-size:14px">| DEBUG: Executing shell fu=
nction do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-source)
|=20
| [ERROR] Can&#39;t find patch dir at .kernel-meta/
| usage: kgit s2q
| ERROR: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.44497)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task=
 do_patch: Failed</pre></div></div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><span class=3D"">On Fri, Apr 21, 2017 at 3:47 PM, Bruce A=
shfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ash=
field <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 11:55 AM, akuster808=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_b=
lank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_5127679590775829030m_625186880526551813m_-2255057749165=
370883m_1550954388652444592m_-3190757637650521301moz-cite-prefix">On 04/21/=
2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Anyone e=
lse seeing this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_5127679590775829030m_625186880526551813m_-2255057749165370883HOEnZb"><fo=
nt color=3D"#888888"><div><br></div></font></span></div></div></div></block=
quote><div><br></div></span><div>I finally managed to make this happen.</di=
v><div><br></div><div>Thanks for the report .. I can now spin a fix.</div><=
/div></div></div></blockquote><div><br></div></span><div>I&#39;m no longer =
able to trigger the error, and I sent the patch to the list.</div><div><br>=
</div><div>Hopefully this never comes back .. but if anyone does see it aft=
er applying that patch, let me know.</div><div><br></div><div>Cheers,</div>=
<div><br></div><div>Bruce</div><div><div class=3D"h5"><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><div><br></div><div>Cheers,</div><div><br></div><div=
>Bruce</div><div><div class=3D"m_5127679590775829030m_625186880526551813h5"=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"m_5127679590775=
829030m_625186880526551813m_-2255057749165370883HOEnZb"><font color=3D"#888=
888"><div></div><div>Bruce</div><div>=C2=A0</div></font></span><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I&#39;ve=
 updated to oe-core commit:</pre>
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px"><font color=3D"#333333"><span style=3D"font-size:14px;white-spac=
e:pre-wrap">c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px"><font color=3D"#333333"><span style=3D"font-size:14px;white-spac=
e:pre-wrap">from some revision maybe 20-40 commits older and now I&#39;m se=
eing:</span></font></pre>
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_5127679590775829030m_625186880526551813m_-225505774=
9165370883m_1550954388652444592m_-3190757637650521301gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: l=
inux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0 do_validate_br=
anches: Function failed: do_validate_branches (log file is located at linux=
-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_v=
alidate_branches.538<wbr>5)
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
      <fieldset class=3D"m_5127679590775829030m_625186880526551813m_-225505=
7749165370883m_1550954388652444592m_-3190757637650521301mimeAttachmentHeade=
r"></fieldset>
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
 <br><div class=3D"m_5127679590775829030m_625186880526551813m_-225505774916=
5370883m_1550954388652444592gmail_signature" data-smartmail=3D"gmail_signat=
ure">&quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_5127679590775829030m_62=
5186880526551813h5"><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_5127679590775829030m_625186880526551813m_-2255057749165370883gmail_si=
gnature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the=
 NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"h5"><br><br clear=3D"all"=
><div><br></div>-- <br><div class=3D"m_5127679590775829030m_625186880526551=
813gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not=
 follow the NULL pointer, for chaos and madness await thee at its end&quot;=
</div>
</div></div></div></div>
</blockquote></div><br></div>

--f403045c18d061cb71054de9be5c--
