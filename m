Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5B04277A67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:54:34 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so20442363qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LPMi0nIx5WyXoqRX0QPOB3Zi7JasQMP1hU6idVx66VA=;
	b=Aj5XSjQGdkSkrNuHNeS+IufshkXYKFFxTDxceoqvaGPwuNbilUfOwI368W/w919WXC
	IrXnsPH7duR/9bRBXlHhdTtO12aRLdScG2ZGe0puiwduVvKXLIW4JuNCoNuTzSqc9AyP
	xMa2MZjGcy3ZJJ9IgQX5QPYyzgvmmt6YmU+n/bXYNQiwag9z8IIWS9gjdXxmiWASB+EI
	Ts7DUj+v75H8EyX9Z+1opCDDcvYHO2xVMXomBEREvAxyhlCSRzKjnMJhYl/ERXy7bzsT
	x/hw3hwgPeHRDebo547Qo+Y3BoQNYn2sy3hrFz1qeSJpi6pPbpjFW6gE+BHl/Aqt2wFb
	2Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LPMi0nIx5WyXoqRX0QPOB3Zi7JasQMP1hU6idVx66VA=;
	b=YFuxV6z161GaNY65EnRzFssI6e9sMYQdu4bxA2YctqMs4AgqvV9+zT6YEkwpkyxWmI
	mT61V0xtYWF6/1Nr6SOFunQk4yUL24G8mL8M31LKeOzMP6Mp2A29ReWOIsngwopNrX17
	h0BrYrxsDcmWVUELkGMjpe0ObyhbqLlIpGbJDQiCKbEF48lbNaNMv3CdckGoq13XKVin
	NsnWsbsUSi3shk3QmCGU8oIfcPjvKc38ZFGDfRN2oCCF9XZkc/moTCSZKRvzvqjTn2OZ
	C79osK6ta2sWRuEpyDwQnlXg1nVTvULAKJKxy9dGgAtIFiPDE3flNgVfa1je+1UI03BW
	+cfg==
X-Gm-Message-State: AN3rC/4HP/x2t2xALrJVd2ILWnrzaf+Z2xVICOeUo2JoNkOttKOSCbzE
	AhWDgpS6zjnycuKiMeK/ojvjmv+1VA==
X-Received: by 10.55.89.66 with SMTP id n63mr24208374qkb.254.1493042075311;
	Mon, 24 Apr 2017 06:54:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 06:54:34 -0700 (PDT)
In-Reply-To: <CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 09:54:34 -0400
Message-ID: <CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 13:54:34 -0000
Content-Type: multipart/alternative; boundary=001a114edc5288a7ee054de9f27f

--001a114edc5288a7ee054de9f27f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> I'm still seeing this with your "kernel-yocto/kern-tools: fix
> do_validate_branches clean stage" patch applied:
>
>
> | DEBUG: Executing shell function do_patch
> | ERROR: Could not apply patches for qemux86.
> | ERROR: Patch failures can be resolved in the linux source directory wor=
k-shared/qemux86/kernel-source)
> |
> | [ERROR] Can't find patch dir at .kernel-meta/
> | usage: kgit s2q
> | ERROR: Function failed: do_patch (log file is located at linux-yocto/1_=
4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.44497)
> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: ta=
sk do_patch: Failed
>
>
Well bugger.

I'll start another set of builds.

Bruce


>
> On Sat, Apr 22, 2017 at 6:39 AM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m
>> > wrote:
>>
>>>
>>>
>>> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <
>>> bruce.ashfield@gmail.com> wrote:
>>>
>>>>
>>>>
>>>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>>>> wrote:
>>>>
>>>>>
>>>>>
>>>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>>>
>>>>> Anyone else seeing this as well?
>>>>>
>>>>>
>>>>> yes
>>>>>
>>>>
>>>> If you see it, can you take a look at the linux source dir and see if
>>>> the directories are
>>>> present ?
>>>>
>>>> I've been doing a tight loop on builds all day, and  haven't seen this
>>>> yet.
>>>>
>>>> Nothing has changed with the build process in months, so something els=
e
>>>> underneath
>>>> is now causing this race/issue.
>>>>
>>>>
>>> I finally managed to make this happen.
>>>
>>> Thanks for the report .. I can now spin a fix.
>>>
>>
>> I'm no longer able to trigger the error, and I sent the patch to the lis=
t.
>>
>> Hopefully this never comes back .. but if anyone does see it after
>> applying that patch, let me know.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>> Bruce
>>>>
>>>>
>>>>>
>>>>> - armin
>>>>>
>>>>> I've updated to oe-core commit:
>>>>>
>>>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>>>
>>>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>>>
>>>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_va=
lidate_branches: Function failed: do_validate_branches (log file is located=
 at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_va=
lidate_branches.5385)
>>>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+=
ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>>>> Log data follows:
>>>>> | DEBUG: Executing shell function do_validate_branches
>>>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=
=AC=E2=84=A2: File exists
>>>>> |
>>>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>>>> | usage: kgit s2q
>>>>> | WARNING: exit code 1 from a shell command.
>>>>> | ERROR: Function failed: do_validate_branches (log file is located a=
t linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_vali=
date_branches.5385)
>>>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0=
: task do_validate_branches: Failed
>>>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do=
_validate_branches) failed with exit code '1'
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

--001a114edc5288a7ee054de9f27f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r">I&#39;m still seeing this with your &quot;kernel-yocto/kern-tools: fix d=
o_validate_branches clean stage&quot; patch applied:<div><br><div><br></div=
><div><pre class=3D"m_8637781883685199031gmail-console-output" style=3D"box=
-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px=
;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><span class=3D"">| D=
EBUG: Executing shell function do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-<wbr></span>source)
|=20
| [ERROR] Can&#39;t find patch dir at .kernel-meta/
| usage: kgit s2q
| ERROR: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3d-r0/temp/log.do_<wbr>patch.4=
4497)
NOTE: recipe linux-yocto-1_4.10.9+<wbr>gitAUTOINC+ad2e885015_<wbr>fe0fb8da3=
d-r0: task do_patch: Failed</pre></div></div></div></blockquote><div><br></=
div><div>Well bugger.</div><div><br></div><div>I&#39;ll start another set o=
f builds.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Sat, Apr 22, 2017 at 6:39 AM, =
Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail=
.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 3:47 PM, Br=
uce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 1:50 PM, Bruc=
e Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com=
" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote"><span>On Fri, Apr 21, 2017 at 11:55 AM, akust=
er808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=
=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_8637781883685199031m_5127679590775829030m_6251868805265=
51813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301moz-c=
ite-prefix">On 04/21/2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px">Anyone else seeing this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_8637781883685199031m_5127679590775829030m_625186880526551813m_-225505774=
9165370883HOEnZb"><font color=3D"#888888"><div><br></div></font></span></di=
v></div></div></blockquote><div><br></div></span><div>I finally managed to =
make this happen.</div><div><br></div><div>Thanks for the report .. I can n=
ow spin a fix.</div></div></div></div></blockquote><div><br></div></span><d=
iv>I&#39;m no longer able to trigger the error, and I sent the patch to the=
 list.</div><div><br></div><div>Hopefully this never comes back .. but if a=
nyone does see it after applying that patch, let me know.</div><div><br></d=
iv><div>Cheers,</div><div><br></div><div>Bruce</div><div><div class=3D"m_86=
37781883685199031h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br><=
/div><div>Cheers,</div><div><br></div><div>Bruce</div><div><div class=3D"m_=
8637781883685199031m_5127679590775829030m_625186880526551813h5"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><span class=3D"m_8637781883685199031m_5127=
679590775829030m_625186880526551813m_-2255057749165370883HOEnZb"><font colo=
r=3D"#888888"><div></div><div>Bruce</div><div>=C2=A0</div></font></span><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span><div bgcolor=3D"#FFFFFF" text=3D"#000000"=
>
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px"></pre>
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px">I&#39;ve updated to oe-core commit:</pre>
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font=
-size:14px;white-space:pre-wrap">c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99be=
ff2
</span></font></pre>
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font=
-size:14px;white-space:pre-wrap">from some revision maybe 20-40 commits old=
er and now I&#39;m seeing:</span></font></pre>
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px"></pre>
        <pre class=3D"m_8637781883685199031m_5127679590775829030m_625186880=
526551813m_-2255057749165370883m_1550954388652444592m_-3190757637650521301g=
mail-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;wo=
rd-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:14px">ERROR: linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8d=
a3d-r0 do_validate_branches: Function failed: do_validate_branches (log fil=
e is located at linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-=
r0/tem<wbr>p/log.do_validate_branches.538<wbr>5)
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
      <fieldset class=3D"m_8637781883685199031m_5127679590775829030m_625186=
880526551813m_-2255057749165370883m_1550954388652444592m_-31907576376505213=
01mimeAttachmentHeader"></fieldset>
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
 <br><div class=3D"m_8637781883685199031m_5127679590775829030m_625186880526=
551813m_-2255057749165370883m_1550954388652444592gmail_signature" data-smar=
tmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for=
 chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_8637781883685199031m_51=
27679590775829030m_625186880526551813h5"><br><br clear=3D"all"><div><br></d=
iv>-- <br><div class=3D"m_8637781883685199031m_5127679590775829030m_6251868=
80526551813m_-2255057749165370883gmail_signature" data-smartmail=3D"gmail_s=
ignature">&quot;Thou shalt not follow the NULL pointer, for chaos and madne=
ss await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div></div></div><div><div class=3D"m_8637781883685199031h5">=
<br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_863778188368519=
9031m_5127679590775829030m_625186880526551813gmail_signature" data-smartmai=
l=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a114edc5288a7ee054de9f27f--
