Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 85DE477A53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 19:47:02 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c45so13173884qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X/ttVW45HcIz3vnCGVZ3LPuuPiGYeNUMRwvx+cOS/6E=;
	b=M2jIChA53EOVjp4I4EnyUl+IwLDvB6vWZQqxVbnyr8K2hYJSWbenqQgk20EHQ6soc4
	lTokJd5eMtYwhSV0+WG3MXVAxf2V4RjnTdp5mm9qY7dvdNb68bK53uFA5flwru1O7Ev5
	x/enhEJffbmFDxOcwyXm8/iAeGwMX20k1YmMkpf9deXAuiV0LXIsI8jI1W6OsgggcKyx
	Pr1uptb0MV6bmBzYaTISqf5CdL30AtY8fy7RmXgyD/ppeY7zM+JWaw4OhKjLa9QV8ukp
	YuOh8lNdTF18Bv6sp1WGUcv7FB5lYYsidc9+VerzoCVkreJelalAzv9dqtEZAANqzMBE
	A2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X/ttVW45HcIz3vnCGVZ3LPuuPiGYeNUMRwvx+cOS/6E=;
	b=HwovHvBLDAGMmg65p1MFOIZLZfLPhHnuBstOZ8pi+a/gc9LKQ7kDv5YuzYtpTZ/ZGe
	RTdud8RtMvtIysns+EcJbXUovIN6ncKwFdRAOhqo+4O2oHMn2wjerHl0icHUYP38xafc
	pfdhJ/3p7OZQPQ3wd0U6i+u7Zh/5QcJodmERjCqeM7w3rhj6yFw4eu7n7LWP+riVbz2c
	Q9mS7wkTMAxEiNRwwV8foY8iv0SZM3qZgSQDC1z1w2hBU6zZk7tvDy2dtijawKYxPAeK
	81WyVroV1/0Y1QiMAUi18QYnJHfefjfshcK/iZwzgPnnhmc/GwlqyJa+faEdkh/IdDq0
	+1Sw==
X-Gm-Message-State: AN3rC/60ILQ2DqIdK7B6UogT5ExKHJXaD3E2OqTWuR7lhaQ+lRJG+krc
	cwB/QKaNB1Kitxe3kfNOYtzcRLHgnQ==
X-Received: by 10.200.54.136 with SMTP id a8mr16813454qtc.87.1492804023255;
	Fri, 21 Apr 2017 12:47:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 12:47:02 -0700 (PDT)
In-Reply-To: <CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 15:47:02 -0400
Message-ID: <CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 19:47:07 -0000
Content-Type: multipart/alternative; boundary=001a1142833c8687ea054db285fe

--001a1142833c8687ea054db285fe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com> wrote=
:
>
>>
>>
>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>
>> Anyone else seeing this as well?
>>
>>
>> yes
>>
>
> If you see it, can you take a look at the linux source dir and see if the
> directories are
> present ?
>
> I've been doing a tight loop on builds all day, and  haven't seen this ye=
t.
>
> Nothing has changed with the build process in months, so something else
> underneath
> is now causing this race/issue.
>
>
I finally managed to make this happen.

Thanks for the report .. I can now spin a fix.

Cheers,

Bruce


> Bruce
>
>
>>
>> - armin
>>
>> I've updated to oe-core commit:
>>
>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>
>> from some revision maybe 20-40 commits older and now I'm seeing:
>>
>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_valid=
ate_branches: Function failed: do_validate_branches (log file is located at=
 linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valid=
ate_branches.5385)
>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2=
e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>> Log data follows:
>> | DEBUG: Executing shell function do_validate_branches
>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=
=E2=84=A2: File exists
>> |
>> | [ERROR] Can't find patch dir at ./patches/standard/base
>> | usage: kgit s2q
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_validate_branches (log file is located at l=
inux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validat=
e_branches.5385)
>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: t=
ask do_validate_branches: Failed
>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_va=
lidate_branches) failed with exit code '1'
>>
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

--001a1142833c8687ea054db285fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_1550954388652444592m_-3190757637650521301moz-cite-prefi=
x">On 04/21/2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px">Anyone else seeing this as well?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"HOEnZb"><font color=3D"#888888"><div><br></div></font></span></div></div><=
/div></blockquote><div><br></div><div>I finally managed to make this happen=
.</div><div><br></div><div>Thanks for the report .. I can now spin a fix.</=
div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><span class=3D"HOEnZb"><font color=
=3D"#888888"><div></div><div>Bruce</div><div>=C2=A0</div></font></span><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D""><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px"></pre>
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px">I&#39;ve updated to oe-core commit:</pre>
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font-size:14p=
x;white-space:pre-wrap">c6cd5865b6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:=
0px;margin-bottom:0px"><font color=3D"#333333"><span style=3D"font-size:14p=
x;white-space:pre-wrap">from some revision maybe 20-40 commits older and no=
w I&#39;m seeing:</span></font></pre>
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px"></pre>
        <pre class=3D"m_1550954388652444592m_-3190757637650521301gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:b=
reak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14=
px">ERROR: linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0 do=
_validate_branches: Function failed: do_validate_branches (log file is loca=
ted at linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/<wbr>t=
emp/log.do_validate_branches.<wbr>5385)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+a=
d2e885015_fe0fb8da3d-r0/<wbr>temp/log.do_validate_branches.<wbr>5385
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
x-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/<wbr>temp/log.do_=
validate_branches.<wbr>5385)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0:=
 task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/l<wbr>inux/linux-yocto_4.10.bb:do_=
va<wbr>lidate_branches) failed with exit code &#39;1&#39;</pre>
      </div>
      <br>
      <fieldset class=3D"m_1550954388652444592m_-3190757637650521301mimeAtt=
achmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </span></div>

<br></span><span class=3D"">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></span></blockquote></div><span class=3D""><br><br clear=3D"all"><div><=
br></div>-- <br><div class=3D"m_1550954388652444592gmail_signature" data-sm=
artmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, f=
or chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a1142833c8687ea054db285fe--
